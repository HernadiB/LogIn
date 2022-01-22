<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Foglalas;
use App\Models\Idopont;
use App\Models\User;


class UserController extends Controller
{
    public function GetAllIdopont()
    {
        $allidopont = Idopont::all();
        $allidopont_array = $allidopont->toArray();
        $allfoglalas = Foglalas::all();
        $allfoglalas_array = $allfoglalas->toarray();
        $result = [];
        foreach ($allidopont as $idopont)
        {
            $b = false;
            foreach ($allfoglalas as $foglalas)
            {
                if ($idopont["ID"] == $foglalas["IdopontID"])
                {
                    $b = true;
                }
            }
            if ($b == false)
            {
                array_push($result, $idopont);
            }
        }
        $resultjson = json_encode($result);
        return $resultjson;
    }

    public function GetFoglalasByFoglalasId($foglalasID)
    {
        $foglalas = Foglalas::where("ID", $foglalasID)->get();
        $foglalas_assoc = reset($foglalas);
        $foglalas_array = reset($foglalas_assoc);
        $idopontID = $foglalas_array["IdopontID"];
        $userID = $foglalas_array["UserID"];
        $idopontok = Idopont::all();
        $idopont = $idopontok->where("ID", $idopontID);
        $idopontarray = $idopont->toarray();
        $idopontreset = reset($idopontarray);
        $users = User::all();
        $user = $users->where("id", $userID);
        $userarray = $user->toarray();
        $userreset = reset($userarray);
        $result["From"] = $idopontreset["From"];
        $result["To"] = $idopontreset["To"];
        $result["FoglalasID"] = $foglalas_array["ID"];
        $result["Username"] = $userreset["name"];
        $resultjson = json_encode($result);
        return $resultjson;
    }

    // public function GetIdopontByDay($yearID, $monthID ,$dayID)
    // {
    //     $allidopont = Idopont::all();
    //     $allidopont_array = $allidopont->toArray();
    //     $result = [];
    //     foreach($allidopont_array as $a)
    //     {
    //         if($a["From"][0] . $a["From"][1] . $a["From"][2] . $a["From"][3] == $yearID)
    //         {
    //             if($a["From"][5] . $a["From"][6]  == $monthID)
    //             {
    //                 if($a["From"][8] . $a["From"][9] == $dayID)
    //                 {
    //                     array_push($result, $a);
    //                 }
    //             }
    //         }

    //     }
    //     $resultjson = json_encode($result);
    //     return $resultjson;
    // }


    public function AddFoglalas($userID, $idopontID)
    {
        if (Foglalas::where("UserID", $userID)->exists())
        {
            return response(["message" => "Csak egy időpontot foglalhatsz le!"]);
        }
        $foglalas = new Foglalas;
        $foglalas->UserID = $userID;
        $foglalas->IdopontID = $idopontID;
        $foglalas->save();
        return response(["message" => "Lefoglalva!", "FoglalasAdatok" => $this->GetFoglalasByFoglalasId($foglalas->id)]);
    }

    public function DeleteFoglalas($foglalasID)
    {
        $foglalas = Foglalas::where("ID", $foglalasID);
        $foglalas->delete();
        return response(["message" => "Törölve!"]);
    }

    public function UserRegistration(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|max:50',
            'email' => 'email|required|unique:users',
            'password' => 'required|confirmed',
            'is_admin' => 'required|boolean'
        ]);

        $validatedData['password'] = bcrypt($request->password);
        
        $admin = User::create($validatedData);

        $accessToken = $admin->createToken('authToken')->accessToken;

        return response(['user' => $admin, 'access_token' => $accessToken]);
    }

    public function UserLogin(Request $request)
    {
        $loginData = $request->validate([
            'email' => 'email|required',
            'password' => 'required'
        ]);

        if(!auth()->attempt($loginData))
        {
            return response(["message" => "Hibás adatok"]);
        }

        $user_assoc = User::where('email', $request->email)->get()->toarray();
        $user = reset($user_assoc);

        $accessToken = auth()->user()->createToken('authToken')->accessToken;
        
        return response(['user' => auth()->user(), 'access_token' => $accessToken]);
    }

}