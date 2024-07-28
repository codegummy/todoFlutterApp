const express = require("express")
const router = express.Router()
const Task = require("../models/Task")

router.get("/alltasks", async (req,res) => {
  try{
    const allTasks = await Task.find()
    res.json(200).json(allTasks)


  }catch (e){
    res.status(500).json({ error : err.message})

  }
})