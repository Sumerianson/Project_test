<?php

namespace App\DataFixtures;

use DateTime;
use Faker\Factory;
use App\Entity\User;
use Faker\Generator;
use DateTimeInterface;
use App\Entity\Chambre;
use App\Entity\Patient;
use App\Entity\Personnel;
use App\Entity\Traitement;
use App\Entity\Consultation;
use App\Entity\Hospitalisation;
use Doctrine\Persistence\ObjectManager;
use Doctrine\Bundle\FixturesBundle\Fixture;

class AppFixtures extends Fixture
{
    /**
     * var Generator
     */
    private Generator $faker;

    public function __construct()
    {
        $this->faker = Factory::create('fr_FR');
    }

    public function load(ObjectManager $manager): void
    {
        // $product = new Product();
        // $manager->persist($product);
        for ($f = 0; $f < 50; $f++) {
            $user = new User();
            $user->setEmail($this->faker->email());
            $user->setRoles(['ROLE_USER']);
            $user->setPassword($this->faker->password());

            $manager->persist($user);
        }

        for ($i = 0; $i < 50; $i++) {
            $personnel = new Personnel();
            $personnel->setCodePers($this->faker->numberBetween(1000, 9999));
            $personnel->setNomPers($this->faker->word());
            $personnel->setGendre($this->faker->randomElement(['Homme', 'Femme']));
            $personnel->setNaissance($this->faker->dateTimeBetween('-60 years', '-18 years'));
            $personnel->setAdresse($this->faker->address());
            $personnel->setTelephone($this->faker->phoneNumber());
            $personnel->setFonction($this->faker->randomElement(['Chef de infermieres', 'Chef de operation', 'Chef de médecins']));
            $personnel->setCodeService($this->faker->numberBetween(1000, 9999));
            $personnel->setEmail($this->faker->email());
        
            $manager->persist($personnel);
        }

        for ($a = 0; $a < 50; $a++) {
            $patient = new Patient();
            $patient->setNom($this->faker->word());
            $patient->setPrenom($this->faker->word());
            $patient->setNSecu($this->faker->numberBetween(13, 1));
            $patient->setGendre($this->faker->randomElement(['Homme', 'Femme']));
            $patient->setNaissance($this->faker->dateTimeBetween('-60 years', '-18 years'));
            $patient->setAdresse($this->faker->address());
            $patient->setTelephone($this->faker->phoneNumber());
            $patient->setEmail($this->faker->email());

            $manager->persist($patient);
        }

        // for ($b = 0; $b < 50; $b++) {
        //     $patient = new Patient();

        //     $consultation = new Consultation();
        //     $consultation->setCodePat('3355');
        //     $consultation->setCodePers('444');
        //     $consultation->setDateConsult(new \DateTime('12-12-2023'));
        //     $consultation->setTypeConsult('Consultation');
        //     $consultation->setFraisConsult('25');
        
        //     $manager->persist($consultation);
        //     $manager->persist($patient);
        // }

        // for ($c = 0; $c < 50; $c++) {
        //     $hopitalisation = new Hospitalisation();
        //     $consultation->setPatient($patient);
        //     $hopitalisation->setCodePat('3355' . $c);
        //     $hopitalisation->setCodeChambre('101' . $c);
        //     $hopitalisation->setDateArrive(new \DateTime('12-12-2023'));
        //     $hopitalisation->setDateSort(new \DateTime('12-12-2023'));
        //     $hopitalisation->setObservation('est simplement du faux texte employé dans la composition et la mise en page avant impression.' . $c);
        
        //     $manager->persist($hopitalisation);
        // }

        // for ($d = 0; $d < 50; $d++) {
        //     $traitement = new Traitement();
        //     $traitement->setPatient($patient);
        //     $traitement->setCodePat('3355' . $d);
        //     $traitement->setCodeMaladie('4441' . $d);
        //     $traitement->setObservation('est simplement du faux texte employé dans la composition et la mise en page avant impression.' . $d);
        //     $traitement->setDateDeb(new \DateTime('12-12-2023'));
        //     $traitement->setDateFin(new \DateTime('12-12-2023'));
        //     $traitement->setEtatPat('Critique' . $d);
        
        //     $manager->persist($traitement);
        // }

        // for ($f = 0; $f < 50; $f++) {
        //     $chambre = new Chambre();
        //     $chambre->setLocalisChamb('Batiment 1, 2éme etage' . $f);
        //     $chambre->setTypeLit('Electrique' . $f);
        //     $chambre->setNLit('2' . $f);
        //     $chambre->setPrixChamb('200' . $f);
        
        //     $manager->persist($chambre);
        // }

    $manager->flush();
    }
}
