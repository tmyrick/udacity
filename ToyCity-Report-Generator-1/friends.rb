friends = [
  {
    name: "Diego",
    status: "Online"
  },
  {
    name: "Liam",
    status: "Away"
  },
  {
    name: "Gloria",
    status: "Online"
  },
  {
    name: "Charlie",
    status: "Away"
  }
]

online_friends = friends.select do |friend|
  friend[:status] == "Online"
end
