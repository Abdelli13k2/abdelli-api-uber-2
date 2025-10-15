<?php

class TrajetModel
{
    private $pdo;

    public function __construct ()
    {
        try {
            $this->pdo = new PDO("mysql:host=localhost;dbname=abdelli_uber;charset=utf8", "root", "");
            $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            die("Erreur de connexion à la base de données : " . $e->getMessage());
        }
    }

    public function getDBAllTrajets()
    {
        $stmt = $this->pdo->query("SELECT * FROM Trajet");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getDBTrajetById ($idTrajet) {
        $req = "
            SELECT * FROM trajet 
            WHERE trajet_id = :idTrajet
        ";
        $stmt = $this->pdo->prepare($req);
        $stmt->bindValue(":idTrajet", $idTrajet, PDO::PARAM_INT);
        $stmt->execute();
        $trajet = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $trajet;
    }
}
// $trajetModel = new TrajetModel();
// print_r($trajetModel->getDBAllTrajets());