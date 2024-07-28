const mongoose = require("mongoose");

const TaskSchema = new mongoose.Schema({
	text: {
		type: String,
		required: true,
	},
	dateCreated: {
		type: Date,
		default: Date.now,
		required: true,
	},

	isCompleted: {
		type: Boolean,
		default: false,
		required: true,
	},
});

const Task = mongoose.model("Task", TaskSchema);

module.exports = Task;
