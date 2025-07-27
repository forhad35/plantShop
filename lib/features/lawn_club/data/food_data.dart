import 'dart:convert';

import 'package:plant_shop/features/lawn_club/data/model/food_data_model.dart';

var jsonString =''' [{
    "name": "Paneer Butter Masala",
    "description": "Creamy tomato-based curry with soft paneer cubes.",
    "image_url": "https://imgs.search.brave.com/yQImyTw5z3A5fRJrxYdukyfBYQPZLxhZa0p9Df2P0t4/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly90My5m/dGNkbi5uZXQvanBn/LzExLzYyLzQ0LzE2/LzM2MF9GXzExNjI0/NDE2NzZfVEYyVVZp/dFU2MFZBeHhDUzhV/M3l0SDl1WE1RejJu/RHIuanBn",
    "veg": "Veg",
    "rating": 4.5,
    "rating_count": 234,
    "price": 250
  },{
    "name": "Chicken Biryani",
    "description": "Aromatic basmati rice cooked with spicy marinated chicken.",
    "image_url": "https://images.unsplash.com/photo-1606112219348-204d7d8b94ee",
    "veg": "Non-Veg",
    "rating": 4.7,
    "rating_count": 512,
    "price": 320
  },{
    "name": "Margherita Pizza",
    "description": "Classic Italian pizza with fresh tomatoes and mozzarella.",
    "image_url": "https://imgs.search.brave.com/abMQ0EpmIeucOq-3j4yHUwFjJuztfFvhozpyRy55m1s/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzEwLzU5LzExLzMx/LzM2MF9GXzEwNTkx/MTMxMDlfSGxrdTBB/YW5vSlBMZUN0VTBU/TnhuUUQyc1VPYnhm/eFMuanBn",
    "veg": "Veg",
    "rating": 4.2,
    "rating_count": 189,
    "price": 299
  }, {
    "name": "Mutton Rogan Josh",
    "description": "Rich and flavorful Kashmiri-style mutton curry.",
    "image_url": "https://imgs.search.brave.com/rFYF4tHlr581Lm7OAQ6ONV1uaNTuZNTSb-hGCm7_xfY/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly90My5m/dGNkbi5uZXQvanBn/LzEwLzU5LzAyLzgw/LzM2MF9GXzEwNTkw/MjgwNjZfMDJXZWp1/YmlabmtZUzk0blpp/WXlhTktETjdnc0Za/NDcuanBn",
    "veg": "Non-Veg",
    "rating": 4.6,
    "rating_count": 176,
    "price": 420
  }, {
    "name": "Veg Hakka Noodles",
    "description": "Stir-fried noodles with fresh vegetables and sauces.",
    "image_url": "https://imgs.search.brave.com/cEfnwCbw-4sHr4VEjluljD-PXgU5jitVGUeQ6iOCoJA/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzExLzUyLzQ4LzY3/LzM2MF9GXzExNTI0/ODY3NjRfOThYQVBZ/UTNjR042aHZqT0JR/Uk42Z3diTHA4MmJY/WFYuanBn",
    "veg": "Non-Veg",
    "rating": 4.1,
    "rating_count": 132,
    "price": 180}]''';
List<FoodItem> foodItemsRowData = (json.decode(jsonString) as List)
    .map((item) => FoodItem.fromJson(item))
    .toList();