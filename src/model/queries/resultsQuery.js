const dbConnection = require('../database/db_connection');

exports.resultsQuery = (productsIdArray)=>{
    const query=`SELECT
    products.name pname,
    supermarkets.name sname,
    origins.name oname,
    origins.score,
    flags.emoji_code
FROM
    products
    JOIN entries ON entries.product_id = products. id
    JOIN supermarkets ON supermarkets.id = entries.supermarket_id
    JOIN origins ON origins.id = entries.origin_id
    JOIN flags ON flags.id = origins.flag_id
WHERE
    products.id IN (${productsIdArray.join(",")})
ORDER BY
    sname,score;`

    return dbConnection.query(query);
}
exports.resultsArray=(productsIdArray)=>{
    const supermarkets={};
    exports.resultsQuery(productsIdArray)
    .then(res=>res.rows.forEach(row=>{
        if (!supermarkets[row.sname]) {
            supermarkets[row.sname]={sname:row.sname,score:0}
        }
        return res;
    })).then(()=>
        console.log(supermarkets)
    ).catch(console.err)
}

exports.resultsArray([1,2,3,4]);