team = {
    "Gryffindor" => {
    },
    "Slytherin" => {
    },
    "Ravenclaw" => {
    },
    "Hufflepuff" => {
    }
}

team.each do |name|
    n = Team.name
    n.name = name
    n.save
end