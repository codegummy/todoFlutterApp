const mongoose = require("mongoose");
//CONNECT TO MONGODB

const connectDB = async () => {
	try {
		mongoose.set("strictQuery", false);
		const conn = await mongoose.connect("mongodb+srv://gharteysamanthas:Omokey%4033@todo.ioscdtr.mongodb.net/");
		console.log("database connected");
	} catch (error) {
		console.log(error);
	}
};

module.exports = connectDB;
