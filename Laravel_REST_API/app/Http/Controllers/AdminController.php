<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Foglalas;
use App\Models\Idopont;
use App\Models\User;

class AdminController extends Controller
{
    public function GetAllUsers()
    {
        $users = User::where("is_admin", 0)->get()->toarray();
        $result = [];
        foreach ($users as $user)
        {
            $container = [];
            $container["ID"] = $user["id"];
            $container["Username"] = $user["name"];
            $container["Email"] = $user["email"];
            array_push($result, $container);
        }
        $resultjson = json_encode($result);
        return $resultjson;
    }

    public function DeleteUserByID($userID)
    {
        if ((User::where("id", $userID)->exists()))
        {
            $foglalas = Foglalas::where("UserID", $userID);
            $foglalas->delete();
            $user = User::where("id", $userID);
            $user->delete();
            return response(["message" => "Törölve!"]);
        }
        else
        {
            return response(["message" => "Nincs felhasználó ilyen ID-val!"]);
        }
    }

    public function GetAllFoglalas()
    {
        $allfoglalas = Foglalas::all();
        $fullresult = [];
        foreach ($allfoglalas as $foglalas)
        {
            $foglalasuser = User::find($foglalas["UserID"]);
            $foglalasidopont = Idopont::find($foglalas["IdopontID"]);
            $result = [];
            $result["ID"] = $foglalas["ID"];
            $result["Username"] = $foglalasuser["name"];
            $result["From"] = $foglalasidopont["From"];
            $result["To"] = $foglalasidopont["To"];
            array_push($fullresult, $result);
        }
        $fullresultjson = json_encode($fullresult);
        return $fullresultjson;
    }

    public function DeleteFoglalasByID($foglalasID)
    {
        if ((Foglalas::where("ID", $foglalasID)->exists()))
        {
            $foglalas = Foglalas::where("ID", $foglalasID);
            $foglalas->delete();
            return response(["message" => "Törölve!"]);
        }
        else
        {
            return response(["message" => "Nincs foglalás ilyen ID-val!"]);
        }
    }

    public function GetFoglalasByUserID($userID)
    {
        $users = User::all();
        if ((User::where("id", $userID)->exists()))
        {
            $user_coll = $users->where("id", "=", $userID);
            $user_assoc = reset($user_coll);
            $user_array = reset($user_assoc);
            if ((Foglalas::where("UserID", $userID))->exists())
            {
                $foglalasok = Foglalas::all();
                $foglalas_coll = $foglalasok->where("UserID", "=", $userID);
                $foglalas_assoc = reset($foglalas_coll);
                $foglalas_array = reset($foglalas_assoc);
                $idopontid = $foglalas_array["IdopontID"];
                $idopontok = Idopont::all();
                $idopont = $idopontok[$idopontid-1];
                $result["Foglalas_ID"] = $foglalas_array["ID"];
                $result["User_ID"] = $user_array["id"];
                $result["Username"] = $user_array["name"];
                $result["From"] = $idopont["From"];
                $result["To"] = $idopont["To"];
                $resultjson = json_encode($result);
                return $resultjson;
            }
            return response(["message" => "A felhasználónak nincs foglalása!"]);
        }
        return response(["message" => "Nincs felhasználó ilyen ID-val!"]);
    }

    public function DeleteIdopont(Request $request)
    {
        if ((Idopont::where("From", $request[0])->where("To", $request[1]))->exists())
        {
            $idopont = Idopont::where("From", $request[0])->where("To", $request[1]);
            $idopont->delete();
            return response(["message" => "Törölve!"]);
        }
        else
        {
            return response(["message" => "Nincs ilyen időpont az adatbázisban!"]);
        }
    }

    public function AddIdopont(Request $request)
    {
        $idopont = new Idopont;
        $idopont->from = $request[0];
        $idopont->to = $request[1];
        $idopont->save();
        return response(["message" => "Rögzítve!"]);
    }

    public function AdminRegistration(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|max:50|unique:users',
            'email' => 'email|required|unique:users',
            'password' => 'required|confirmed',
            'is_admin' => 'required|boolean'
        ]);

        $validatedData['password'] = bcrypt($request->password);
        
        $admin = User::create($validatedData);

        $accessToken = $admin->createToken('authToken')->accessToken;

        return response(['user' => $admin, 'access_token' => $accessToken]);
    }

    public function AdminLogin(Request $request)
    {
        $loginData = $request->validate([
            'email' => 'email|required',
            'password' => 'required'
        ]);

        if (!auth()->attempt($loginData))
        {
            return response(["message" => "Hibás adatok"]);
        }

        $user_assoc = User::where('email', $request->email)->get()->toarray();
        $user = reset($user_assoc);
        if ($user["is_admin"] != 1)
        {
            return response(["message" => "Felhasználók nem léphetnek be!"]);
        }

        $accessToken = auth()->user()->createToken('authToken')->accessToken;
        
        return response(['user' => auth()->user(), 'access_token' => $accessToken]);
    }
}
