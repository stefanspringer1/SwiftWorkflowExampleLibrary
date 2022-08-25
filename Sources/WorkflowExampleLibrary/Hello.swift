/// The "hello" step.

import Workflow
import WorkflowExampleData

/**
 The public interface to the step.
 */
@available(macOS 10.15.0, *)
public func hello_lib(
    during execution: Execution,
    data: MyData
) async {
    await hello_step(during: execution, usingExecutionDatabase: ExecutionDatabase(), data: data)
}

/**
 The step.
 */
@available(macOS 10.15.0, *)
func hello_step(
    during execution: Execution,
    usingExecutionDatabase executionDatabase: ExecutionDatabase,
    data: MyData
) async {
    await execution.effectuate(executionDatabase, #function) {
        
        await execution.log(stepData.sayingHello, data.value)
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
