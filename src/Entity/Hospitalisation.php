<?php

namespace App\Entity;

use App\Repository\HospitalisationRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: HospitalisationRepository::class)]
class Hospitalisation
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 20)]
    private ?string $code_pat = null;

    #[ORM\Column(length: 20)]
    private ?string $code_chambre = null;

    #[ORM\Column(type: Types::DATE_MUTABLE)]
    private ?\DateTimeInterface $date_arrive = null;

    #[ORM\Column(type: Types::DATE_MUTABLE)]
    private ?\DateTimeInterface $date_sort = null;

    #[ORM\Column(type: Types::TEXT)]
    private ?string $observation = null;

    #[ORM\ManyToOne(inversedBy: 'hospitalisations')]
    private ?Patient $patient = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getCodePat(): ?string
    {
        return $this->code_pat;
    }

    public function setCodePat(string $code_pat): static
    {
        $this->code_pat = $code_pat;

        return $this;
    }

    public function getCodeChambre(): ?string
    {
        return $this->code_chambre;
    }

    public function setCodeChambre(string $code_chambre): static
    {
        $this->code_chambre = $code_chambre;

        return $this;
    }

    public function getDateArrive(): ?\DateTimeInterface
    {
        return $this->date_arrive;
    }

    public function setDateArrive(\DateTimeInterface $date_arrive): static
    {
        $this->date_arrive = $date_arrive;

        return $this;
    }

    public function getDateSort(): ?\DateTimeInterface
    {
        return $this->date_sort;
    }

    public function setDateSort(\DateTimeInterface $date_sort): static
    {
        $this->date_sort = $date_sort;

        return $this;
    }

    public function getObservation(): ?string
    {
        return $this->observation;
    }

    public function setObservation(string $observation): static
    {
        $this->observation = $observation;

        return $this;
    }

    public function getPatient(): ?Patient
    {
        return $this->patient;
    }

    public function setPatient(?Patient $patient): static
    {
        $this->patient = $patient;

        return $this;
    }
}
