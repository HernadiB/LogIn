<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\UserModel;
use App\Models\Foglalas;

class Idopont extends Model
{
    protected $table = "idopontok";
    public function Foglalas()
    {
        return $this->hasOne(Foglalas::class, "idopontID", "ID");
    }
}
