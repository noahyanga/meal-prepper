# Meal-Prepper!
'Ruby version : 3.1.2'
Building a web app around CSV datasets for people wanting to see a wide assortment of meals

## Models
Meal
- name (string, present, unique)
- desc (text, present)

Recipe

- title (string, present, unique)
- instructions (text, present)
- meal_id (integer, optional, FK)

Ingredient

- name (string, present, unique)
- measurement_unit (string, present)

Supplier
- name (string, present, unique)
- address (string)
- contact_info (string)

## Routes
GET /               (Home Page)
GET /meals          (Show all Meals)
GET /meals/:id      (Show a Meal by ID)
GET /recipes        (Show all Recipes)
GET /recipes/:id    (Show a Recipe by ID)
GET /ingredients    (Show all Ingredients)
GET /ingredients/:id (Show an Ingredient by ID)
GET /suppliers      (Show all Suppliers)
GET /suppliers/:id  (Show a Supplier by ID)

## Controllers
- HomeController - index
- MealsController - index, show
- RecipesController - index, show
- IngredientsController - index, show
- SuppliersController - index, show