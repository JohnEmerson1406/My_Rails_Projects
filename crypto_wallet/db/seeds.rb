# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

mining_types = [
    {
        description: "Proof of Work",
        acronym: "PoW"
    },
    {
        description: "Proof of Stake",
        acronym: "PoS"
    },
    {
        description: "Proof of Capacity",
        acronym: "PoC"
    }
]

mining_types.each do |mining_type|
    MiningType.find_or_create_by!(mining_type)
end

coins = [
    {
        description: "Bitcoin",
        acronym: "BTC",
        url_image: "https://foxbit.com.br/wp-content/uploads/2019/01/Bitcoin.png",
        mining_type: MiningType.find(acronym: 'PoW') # 'where' retorna uma lista, 'find' retorna um elemento
    },
    {
        description: "Ethereum",
        acronym: "ETH",
        url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Ethereum_logo_2014.svg/628px-Ethereum_logo_2014.svg.png",
        mining_type: MiningType.all.sample # sortea um item aleatorio da lista
    }
]

coins.each do |coin|
    Coin.find_or_create_by!(coin)
end
