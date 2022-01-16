<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;
use App\Models\Foglalas;

class Idopont extends Model
{
    protected $table = "idopontok";
    protected $fillable = ["From, To"];
    public $timestamps = false;
    public function Foglalas()
    {
        return $this->hasOne(Foglalas::class, "idopontID", "ID");
    }
}
