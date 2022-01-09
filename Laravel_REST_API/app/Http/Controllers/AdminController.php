<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Foglalas;
use App\Models\UserModel;
use App\Models\Idopont;

class AdminController extends Controller
{
    public function GetAllFoglalas()
    {
        $allfoglalas = Foglalas::all();
        $fullresult = [];
        foreach ($allfoglalas as $foglalas)
        {
            $foglalasuser = UserModel::find($foglalas["UserID"]);
            $foglalasidopont = Idopont::find($foglalas["IdopontID"]);
            $result = [];
            $result["ID"] = $foglalas["ID"];
            $result["Username"] = $foglalasuser["Username"];
            $result["From"] = $foglalasidopont["From"];
            $result["To"] = $foglalasidopont["To"];
            array_push($fullresult, $result);
        }
        $fullresultjson = json_encode($fullresult);
        return $fullresultjson;
    }
    public function GetFoglalasByUserID($userID)
    {
        $users = UserModel::all();
        $user_coll = $users->where("ID", "=", $userID);
        $user_assoc = reset($user_coll);
        $user_array = reset($user_assoc);
        $foglalasok = Foglalas::all();
        $foglalas_coll = $foglalasok->where("UserID", "=", $userID);
        $foglalas_assoc = reset($foglalas_coll);
        $foglalas_array = reset($foglalas_assoc);
        $idopontid = $foglalas_array["IdopontID"];
        $idopontok = Idopont::all();
        $idopont = $idopontok[$idopontid-1];
        $result = $user_array->toarray() + $idopont->toarray();
        $resultjson = json_encode($result);
        return $resultjson;
    }
    public function GetAllUsers()
    {
        $users = UserModel::all();
        $usersarray = $users->toarray();
        $result = [];
        foreach ($usersarray as $user)
        {
            $container = [];
            $container["ID"] = $user["ID"];
            $container["Username"] = $user["Username"];
            array_push($result, $container);
        }
        $resultjson = json_encode($result);
        return $resultjson;
    }
    public function DeleteFoglalasByID($foglalasID)
    {
        $foglalas = Foglalas::where("ID", $foglalasID);
        $foglalas->delete();
    }
    public function DeleteIdopontByID($idopontID)
    {
        $idopont = Idopont::where("ID", $idopontID);
        $idopont->delete();
    }
    public function DeleteUserByID($userID)
    {
        $foglalas = Foglalas::where("UserID", $userID);
        $foglalas->delete();
        $user = UserModel::where("ID", $userID);
        $user->delete();
    }
    public function ModifyFoglalasByID($foglalasID, Request $request)
    {
        // Not neccessary
        // foglalasID alapjan valtoztatja az idopontID-t es az userID-t
    }
    public function AddIdopont(Request $request)
    {
        // Hozzaad uj idopontot (From, To)
    }
}
