/// The "hello" step.

import Workflow
import WorkflowExampleData

/**
 The public interface to the step.
 */
public func hello_lib(
    during execution: Execution,
    data: MyData
) {
    hello_step(during: execution, usingExecutionDatabase: ExecutionDatabase(), data: data)
}

/**
 The step.
 */
func hello_step(
    during execution: Execution,
    usingExecutionDatabase executionDatabase: ExecutionDatabase,
    data: MyData
) {
    execution.effectuate(executionDatabase, #function) {
        
        execution.log(stepData.sayingHello, data.value)
        print("Hello \(data.value)!")
        
    }
}

/**
 The step data, including the error messages.
 */
fileprivate let stepData = Hello_stepData.instance
struct Hello_stepData: StepData {
    
    static let instance = Hello_stepData()
    var stepDescription = "Say hello."
    
    // Add non-static members of type XMessage here for all messages.
    // Only non-static members will be collected for the overview!
    
    public let sayingHello = Message(
        id: "saying hello",
        type: .Info,
        fact: [
            .en: "saying hello to $1",
        ]
    )
}
