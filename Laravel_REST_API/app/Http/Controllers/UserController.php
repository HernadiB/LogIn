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
        $allidopontjson = json_encode($allidopont_array);
        return $allidopontjson;
    }

    public function GetIdopontByDay($yearID, $monthID ,$dayID)
    {
        $allidopont = Idopont::all();
        $allidopont_array = $allidopont->toArray();
        $result = [];
        foreach($allidopont_array as $a)
        {
            if($a["From"][0] . $a["From"][1] . $a["From"][2] . $a["From"][3] == $yearID)
            {
                if($a["From"][5] . $a["From"][6]  == $monthID)
                {
                    if($a["From"][8] . $a["From"][9] == $dayID)
                    {
                        array_push($result, $a);
                    }
                }
            }

        }
        $resultjson = json_encode($result);
        return $resultjson;
    }


    public function AddFoglalas($userID, $idopontID)
    {
        $foglalas = new Foglalas;
        $foglalas->UserID = $userID;
        $foglalas->IdopontID = $idopontID;
        $foglalas->save();
        return $foglalas->id;
    }

    public function DeleteFoglalas($foglalasID)
    {
        $foglalas = Foglalas::where("ID", $foglalasID);
        $foglalas->delete();
    }

    public function GetFoglalasByFoglalasId($foglalasID)
    {
        $foglalas = Foglalas::where("ID", $foglalasID)->get()->toArray();
        $foglalas_array = reset($foglalas);
        dd($foglalas_array);
        $idopontID = $foglalas["IdopontID"];
        dd($idopontID);
        $idopontok = Idopont::all();
        $idopont = $idopontok->where("ID", $idopontID);
        return $foglalas;
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

        $admin = User :: create($validatedData);

        $accessToken = admin->createToken('authToken')->accessToken;

        return response(['user' => $admin, 'access_token' => $accessToken]);
    }
}
