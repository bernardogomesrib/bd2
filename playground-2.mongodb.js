use('admin')
db.faculdades.find({},{'biblioteca.livros':1,_id:0}).toArray();



//db.faculdades.aggregate([{ $unwind: "$faculdades.biblioteca" }, { $project: { _id: 0, livros: "$faculdades.biblioteca.livros" } } ]).toArray();
//db.faculdades.aggregate([ { $unwind: "$faculdades" }, { $unwind: "$faculdades.biblioteca" }, { $project: { _id: 0, livros: "$faculdades.biblioteca.livros" } } ]).pretty();
//db.faculdades.find({},  {'faculdades.biblioteca.livros': 1, 'biblioteca.livros':1 }).toArray();