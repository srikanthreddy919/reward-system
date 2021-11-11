# Reward System application

This application for calculating rewards based on recommendations of customers. My implementation based on simple graph tree, which we keep into memory while calculation. No databse required it's purely on process memory

I have created a service for to calculate rewards > app/services/rewards. I created simple tree, where each node knowns about parent node, then, when we have any updates(like accept invite) we just update parent node, and lookup into 3 levels (1 point, 0.5 points, 0.25 points). To validate input from raw data i have created validator service > services/rewards/validators .

## App hosted in heroku

`https://reward-system-rails.herokuapp.com`

## System Requirements

```
Ruby version >= 2.6.3
Bundler version 2.2.13
```

# To install dependencies

```
bundle install
```

# To Run application

```
rails s
```
# To test the app

- `open app in http://localhost:3000/`
- upload sample included in the repo `rewards.txt`

### To test using curl

```
curl -X POST -H "Content-Type: application/json" -d @rewards.json http://localhost:3000/rewards
```
