/*
 Playground creat per Albert Mata
 Desenvolupament aplicacions per a dispositius iOS
 Universitat Oberta de Catalunya
 26/09/2018
 */

/*
Playground resolt per Josep Ballber
30/09/2018
 */

/*
 Arrays.Per tal que agafeu una mica d'experiència treballant amb arrays, us he preparat un petit playground amb uns exercicis molt ràpids de resoldre. Si més no en termes d'espai.
 Però us pot dur unamica de temps trobar les respostes. Si em permeteu la recomanació, esbaralleu-vos una mica amb la documentació oficial d'Apple abans de recórrer a StackOverflow o similars  buscant la resposta. En aquest enllaç hi ha tot el que necessiteu per resoldre totes les preguntes:
 
 https://developer.apple.com/documentation/swift/array
 
 Veureu que sovint diu que no podeu afegir cap línia de codi ni cap caràcter ";". A Swift, en general, el caràcter ";" a final de línia és opcional i, per tant, no el posem mai. Però és cert que es pot posar i llavors ens serveix per poder escriure el que serien diverses línies de codi en una sola, separant-les amb aquests ";". Si us dic que resoleu un problema sense afegir cap altra línia de codi però us deixo escriure ";" per anar afegint més codi seria una mica absurd, no trobeu? Per això aquesta frase.
 
 Sabreu si teniu bé tot l'exercici quan tots els tests passin (emojis contents). Quan estigueu, em podeu enviar l'arxiu .playground (potser comprimit en .zip si l'enviament us dóna problemes) per correu electrònic i m'ho miraré.
 
 */

import Foundation

/*
 Instruccions. Molt senzill. Aneu llegint aquest document. Procureu entendre tot el que s'hi fa.
 Cada vegada que trobeu un bloc de codi comentat amb caràcters // descomenteu-lo i ompliu tot el
 que calgui. Com a resultat final, haureu d'obtenir tota una reguitzell de línies dient-vos que
 heu passat tots els tests. No cal dir que les línies amb una crida al mètode test(_, _) no les
 podeu modificar (només descomentar-les amb la resta del bloc).
 */

/*
 Creem una funció auxiliar que ens servirà per fer els tests.
 */
func test(_ n: Int, _ x: Bool) {
    print("Test \(n) \(x ? "😍" : "☠️")")
}

/*
 Comencem definint una estructura que ens servirà per després crear-ne instàncies.
 */
struct Person {
    var id: Int
    var name: String
    var age: Int
}

/*
 Ara creem una array de persones amb les que tot seguit podrem fer algunes proves de codi.
 */
/// array (people) d'estructures (Person) : ArrayOfPerson,peopleArray

let people = [Person(id: 42, name: "Albert", age: 39),
              Person(id: 128, name: "Jordi", age: 47),
              Person(id: 256, name: "Ricard", age: 57),
              Person(id: 512, name: "Marc", age: 23),
              Person(id: 64, name: "Judit", age: 15),
              Person(id: 32, name: "Marta", age: 27),
              Person(id: 16, name: "Anna", age: 17),
              Person(id: 2, name: "Mercè", age: 49)]

// let ArrayOfStructs = people
// numero elements de l'array
// print(ArrayOfStructs.count)

/*
 Quina és la primera persona de la llista? Hi ha diverses maneres de recuperar-la partint de people.
 Busqueu-ne com a mínim dues de diferents. No podeu afegir cap línia de codi ni cap caràcter ";".
 */

 /// https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html

let p1 = people[0]
let p2 = people.first!
let p3 = people.reversed().last!
let p4 = people.prefix(1)

//let object = people.first{$0.name == "Albert"}
//print(object)
print(p2)
print(p3)
print(p4)

//print(p1)
//print(p2)
test(1, type(of: p1) == Person.self && p1.age == 39)
test(2, type(of: p2) == Person.self && p2.age == 39)
test(3, type(of: p3) == Person.self && p2.age == 39)
test(4, type(of: p4) == Person.self && p2.age == 39)

/*
 Per motius de privacitat, ens demanen obtenir un array amb totes les edats de les 8 persones.
 Però només les edats. No podeu afegir cap línia de codi ni cap caràcter ";".
 */

/// https://codeburst.io/swift-map-flatmap-filter-and-reduce-53959ebeb6aa

let ages = people.map({(employee: Person) -> Int in employee.age })
let ages2 = people.map({ $0.age })
test(3, ages == [39, 47, 57, 23, 15, 27, 17, 49])
test(32, ages2 == [39, 47, 57, 23, 15, 27, 17, 49])
/*
 Ara ens demanen els noms, en ordre alfabètic, de tots aquells qui tenen 40 anys o més.
 No podeu afegir cap línia de codi ni cap caràcter ";".
 */

let forties = people.filter( {$0.age > 39}).map({ return $0.name }).sorted()
//print(forties)
test(4, forties == ["Jordi", "Mercè", "Ricard"])

/*
 Finalment, volen saber si la mitjana d'edat dels homes és més alta o més baixa que la de les dones.
 Ens demanen una TUPLA on el primer element sigui la SUMA de les edats dels homes i el segon la de
 les dones. Ens informen que són homes els 4 primers elements de l'array i dones els 4 elements
 següents. Resoleu aquest cas primer sense afegir cap línia de codi ni cap caràcter ";".
 */

//let test = [1,2,3,4]
//let sum = test[0...3].reduce(0,+)
//print(sum)
/// https://medium.com/@mimicatcodes/array-and-arrayslice-in-swift-3-aaa6841d3119

let tuple1 = (people[0...3].map({$0.age}).reduce(0,+),people[4...].map({$0.age}).reduce(0,+))
//print(tuple1)
test(5, tuple1 == (166, 108))

/*
 Resoleu ara el mateix cas sense cap limitació de línies de codi.
 Quin dels dos sistemes us sembla més eficient? Per què?
 */

/// https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html
var tuple2 = (0, 0)

var ageMan = 0
var ageWoman = 0

// print(people[0].age)
//print(people[index].age)
//for Person in people {print(Person.age)}

for i in 0...3 {
    ageMan = ageMan + people[i].age
}
for j in 4..<people.count {
    ageWoman = ageWoman + people[j].age
}
tuple2 = (ageMan,ageWoman)
print(tuple2)
test(6, tuple2 == (166, 108))

// crec que és més eficient fer un reduce perquè no iterem (no recorrem l'array),es una funcio que es fa servir en bigdata(MapReduce) i te menys linies de codi
