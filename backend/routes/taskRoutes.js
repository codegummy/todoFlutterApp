const express = require("express")
const router = express.Router()
const Task = require("../models/Task")

//route to create new task
router.post("/tasks", async (req,res) => {
  const {text, dateCreated, isCompleted} = req.body

  try{
    const newTask = new Task({
      text, dateCreated, isCompleted
    })
    await newTask.save()
    res.status(200).json(newTask)
  }catch (err){
    res.status(500).json({error: err.message})

  }
})


//get all tasks

router.get("/alltasks", async (req,res) => {
  try{
    const allTasks = await Task.find()
    res.status(200).json(allTasks)


  }catch (e){
    res.status(500).json({ error : e.message})

  }
})

router.delete("/tasks/:id", async(req, res) => {
 
  try{
    const id = req.params.id
    await Task.findByIdAndDelete(id)
    res.status(200).json({ error :"Tak deleted successfully"})
  

  }catch (e){
    res.status(500).json({ error : e.message})

  }
})

module.exports = router