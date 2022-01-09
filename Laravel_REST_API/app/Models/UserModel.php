<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Foglalas;
use App\Models\Idopont;

class UserModel extends Model
{
    protected $table = "users";
    public function Foglalas()
    {
        return $this->hasOne(Foglalas::class, "userID", "ID");
    }
}
