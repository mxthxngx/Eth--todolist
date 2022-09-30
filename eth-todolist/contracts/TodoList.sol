pragma solidity ^0.5.0;

contract TodoList {
  uint public taskCount = 0;
   mapping(uint => Task) public tasks;

  struct Task {
    uint id;
    string content;
    bool completed;
  }
 constructor() public {
        createTask("Check out todo.com");
      }

 event TaskCompleted(
    uint id,
    bool completed
  );

event TaskCreated(
    uint id,
    string content,
    bool completed
  );
  function createTask(string memory _content) public {
    taskCount ++;
    tasks[taskCount] = Task(taskCount, _content, false);
    emit TaskCreated(taskCount,_content,false);
  }
   function toggleCompleted(uint _id) public {
    Task memory _task = tasks[_id];
    _task.completed = !_task.completed;
    tasks[_id] = _task;
    emit TaskCompleted(_id, _task.completed);
  }


}