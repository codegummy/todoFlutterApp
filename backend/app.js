const express = require('express');
const cors = require('cors');
const app = express();
const connectDB = require("./server/config")
const taskRoutes = require("./routes/taskRoutes")

require("dotenv").config()
const PORT = 3000


//connect to database
connectDB()

//middle ware to parse json
app.use(express.json())

//cors
app.use(cors()); 

// routes
app.use("/", taskRoutes)



//run server
app.listen(PORT, () => {
  console.log('Server running on port 3000');
});

//"mongodb+srv://gharteysamanthas:Omokey@33@todo.ioscdtr.mongodb.net/