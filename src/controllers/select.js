const { findAllFoodItems } = require('../model/queries/findQueries');

exports.get = (req, res) => {
    findAllFoodItems((err, data) => {
        if (err) {
            console.log('error retreiving food items');
        }
        else {
            res.render("select", { data });
        }
    })
};