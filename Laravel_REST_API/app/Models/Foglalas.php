<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\UserModel;
use App\Models\Idopont;

class Foglalas extends Model
{
    protected $table = "foglalasok";
    public function User()
    {
        return $this->hasOne(UserModel::class, "ID", "UserID");
    }
    public function Idopont()
    {
        return $this->hasOne(Idopont::class, "ID", "IdopontID");
    }
}
