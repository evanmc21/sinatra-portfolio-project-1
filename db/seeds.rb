team_name_list = {
    "Gryffindor" => {
    },
    "Slytherin" => {
    },
    "Ravenclaw" => {
    },
    "Hufflepuff" => {
    }
}

team_name_list.each do |name|
    n = Team.name
    n.name = name
    n.save
end