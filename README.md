# Meal-Prepper!
`Ruby version : 3.1.2`

Meal Prepper is a web app built with Ruby on Rails, displaying a catalog of different meal options for users!

## Models
Meals
- name (string, present, unique)
- description (text, present)

Recipes
- title (string, present, unique)
- instructions (text, present)
- meal_id (integer, optional, FK)

Ingredients
- name (string, present, unique)
- measurement_unit (string, present)

Stores
- name (string, present, unique)

### Join Tables
RecipeIngredients
- recipe_id (integer, FK)
- ingredient_id (integer, FK)

StoreIngredients
- store_id (integer, FK)
- ingredient_id (integer, FK)

## Routes
- GET /               (Home Page)
- GET /meals          (Show all Meals)
- GET /meals/:id      (Show a Meal by ID)
- GET /recipes        (Show all Recipes)
- GET /recipes/:id    (Show a Recipe by ID)
- GET /ingredients    (Show all Ingredients)
- GET /ingredients/:id (Show an Ingredient by ID)
- GET /stores      (Show all Stores)
- GET /stores/:id  (Show a Store by ID)

## Controllers
- HomeController - index
- MealsController - index, show
- RecipesController - index, show
- IngredientsController - index, show
- StoresController - index, show