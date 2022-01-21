<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;
use App\Models\Idopont;

class Foglalas extends Model
{
    protected $table = "foglalasok";
    public $timestamps = false;
    public function User()
    {
        return $this->hasOne(User::class, "id", "UserID");
    }
    public function Idopont()
    {
        return $this->hasOne(Idopont::class, "ID", "IdopontID");
    }
}
