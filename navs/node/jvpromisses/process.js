const fs = require('fs')

console.log(1)


/*function callback(err, contents){
    console.log(err, String(contents))
}

fs.readFile('in1.txt',callback)*/

const readFile = file => new Promise((resolve,reject)=>{
    fs.readFile(file,(err,contents)=>{
    if (err){
         reject(err)
        } else {
          resolve(contents)
        }   
    })
})
readFile('./in1.txt')
    .then(contents =>{
        console.log(null, String(contents))
    })

console.log(2)

console.log(3)
