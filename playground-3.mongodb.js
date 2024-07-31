use('pessoas');
db.pessoas.insertMany([
    { _id: 1.0,
        nome: "Carol",
        filhos: [{nome:"Jasmine",idade:11}, {nome:"Helena",idade:4}],
        pets: ["Judite", "Thor","Lourinho"]
    },
    { _id : 2.0,
        nome : "Josino",
        filhos : ["Sarah"]
    },
    {
        nome:'Francisco',
        filhos:['Maria','João','Pedro']
    }
])


use('pessoas');
db.pessoas.find({pets:{$exists:true}},{pets:1,_id:0}).toArray();


use('pessoas');
db.pessoas.findOne({_id:1.0},{nome:1,_id:0}).filhos[0];

use('pessoas');
db.pessoas.update({_id:1.0},{$push:{pets:'Jasmine'}});

use('pessoas');
db.pessoas.update({_id:1.0},{$set:{materias:['matematica','portugues','ciencias']}});


//só mostra um resultado, irado, é o primeiro
use('pessoas');
db.pessoas.findOne({_id:1.0,materias:{$exists:true}},{materias:1,_id:0}).materias[0];


use('pessoas');
db.pessoas.find({},{'filhos.nome':1,_id:0}).toArray();




use('pessoas');
db.pessoas.update({nome:'Carol'},
                    {$set:{'filhos.$[elem].idade':5}},
                    {arrayFilters:[{'elem.nome':'Helena'}]});