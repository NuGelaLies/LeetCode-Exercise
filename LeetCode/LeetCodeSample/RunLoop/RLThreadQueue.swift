//
//  RLThreadQueue.swift
//  LeetCodeSample
//
//  Created by NuGelaliee on 1/7/21.
//

import Foundation

private final class RLThread: Thread {
    
    typealias RLAction = (CFRunLoop) -> Void
    
    private let runloopSource: CFRunLoopSource
    private var currentRunLoop: CFRunLoop?
    
    var readyAction: (RLAction)? = nil
    
    func start(_ readyCall: @escaping RLAction) {
        readyAction = readyCall
        start()
    }
    
    override init() {
        var content = CFRunLoopSourceContext()
        self.runloopSource = CFRunLoopSourceCreate(nil, 0, &content)
    }
        
    func awake() {
        guard let rl = currentRunLoop else {return}
        if CFRunLoopIsWaiting(rl) {
            CFRunLoopSourceSignal(runloopSource)
            CFRunLoopWakeUp(rl)
        }
    }
    
    override func main() {
        super.main()
        let rl = CFRunLoopGetCurrent()!
        currentRunLoop = rl
        let weakSelf = self
        CFRunLoopAddSource(rl, runloopSource, .commonModes)
        let observer = CFRunLoopObserverCreateWithHandler(nil, CFRunLoopActivity.entry.rawValue, false, 0) { (observer, activity)  in
            weakSelf.readyAction?(rl)
        }
        CFRunLoopAddObserver(rl, observer, .commonModes)
        CFRunLoopRun()
        
        CFRunLoopRemoveObserver(rl, observer, .commonModes)
        CFRunLoopRemoveSource(rl, runloopSource, .commonModes)
        currentRunLoop = nil
    }
}

public final class RLThreadQueue {
    
    private let thread: RLThread
    
    init(named name: String) {
        thread = RLThread()
        thread.name = name
        startRunloop()
    }
    
    @Protected
    private var runloop: CFRunLoop! = nil
    
    private func startRunloop() {
        thread.start { [weak self] runloop in
            guard let self = self else { return }
            self.runloop = runloop
        }
    }
    
    deinit {
        let runloop = self.runloop
        sync { CFRunLoopStop(runloop) }
    }

    public func async(_ block: @escaping (() -> (Void))) {
        CFRunLoopPerformBlock(runloop, CFRunLoopMode.defaultMode.rawValue, block)
        thread.awake()
    }

    public func sync(_ block: @escaping (() -> (Void))) {

        if isCurrentLoop() {
            block()
            return
        }

        let conditionLock = NSConditionLock(condition: 0)

        CFRunLoopPerformBlock(runloop, CFRunLoopMode.defaultMode.rawValue) {
            conditionLock.lock()
            block()
            conditionLock.unlock(withCondition: 1)
        }
        thread.awake()
        conditionLock.lock(whenCondition: 1)
        conditionLock.unlock()
    }
    
    public func isCurrentLoop() -> Bool {
        return CFEqual(CFRunLoopGetCurrent(), runloop)
    }
    
}

