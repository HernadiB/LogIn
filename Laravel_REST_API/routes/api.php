<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\UserController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get("/admin/users", [AdminController::class, "GetAllUsers"]);
Route::delete("/admin/users/{id}", [AdminController::class, "DeleteUserByID"]);

Route::get("/admin/foglalas", [AdminController::class, "GetAllFoglalas"]);
Route::get("/admin/foglalas/{id}", [AdminController::class, "GetFoglalasByUserID"]);
Route::delete("/admin/foglalas/{id}", [AdminController::class, "DeleteFoglalasByID"]);

Route::post("/admin/idopont", [AdminController::class, "AddIdopont"]);
Route::delete("/admin/idopont", [AdminController::class, "DeleteIdopont"]);

Route::post("/admin/registration", [AdminController::class, "AdminRegistration"]);
Route::post("/admin/login", [AdminController::class, "AdminLogin"]);


Route::get("/user/idopont", [UserController::class, "GetAllIdopont"]);
// Route::get("/user/idopont/{year}/{month}/{day}", [UserController::class, "GetIdopontByDay"]);

Route::get("/user/foglalas/{foglalasID}", [UserController::class, "GetFoglalasByFoglalasId"]);
Route::post("/user/foglalas/{userID}/{idopontID}", [UserController::class, "AddFoglalas"]);
Route::delete("/user/foglalas/{foglalasID}", [UserController::class, "DeleteFoglalas"]);

