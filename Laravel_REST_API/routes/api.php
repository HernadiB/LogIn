<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AdminController;

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
Route::get("/admin/foglalas", [AdminController::class, "GetAllFoglalas"]);
Route::get("/admin/foglalas/{id}", [AdminController::class, "GetFoglalasByUserID"]);
Route::delete("/admin/foglalas/{id}", [AdminController::class, "DeleteFoglalasByID"]);

Route::post("/admin/idopont", [AdminController::class, "AddIdopont"]);
Route::delete("/admin/idopont", [AdminController::class, "DeleteIdopont"]);

Route::get("/admin/users", [AdminController::class, "GetAllUsers"]);
Route::delete("/admin/users/{id}", [AdminController::class, "DeleteUserByID"]);

Route::post("/admin/registration", [AdminController::class, "AdminRegistration"]);