cakes = [
    {cake_id: '1', cake_name: 'Berry Cake'},
    {cake_id: '2', cake_name: 'Mud Cake'}
]

cakes.each do |u|
    Cakes.create(u)
end