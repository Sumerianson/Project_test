<?php

namespace App\Entity;

use App\Repository\ConsultationRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ConsultationRepository::class)]
class Consultation
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 20)]
    private ?string $code_pat = null;

    #[ORM\Column(length: 20)]
    private ?string $code_pers = null;

    #[ORM\Column(length: 255)]
    private ?string $type_consult = null;

    #[ORM\Column(length: 255)]
    private ?string $frais_consult = null;

    #[ORM\Column(type: Types::DATE_MUTABLE)]
    private ?\DateTimeInterface $date_consult = null;

    #[ORM\ManyToOne(inversedBy: 'consultations')]
    private ?Personnel $personnel = null;

    #[ORM\ManyToOne(inversedBy: 'consultations')]
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

    public function getCodePers(): ?string
    {
        return $this->code_pers;
    }

    public function setCodePers(string $code_pers): static
    {
        $this->code_pers = $code_pers;

        return $this;
    }

    public function getTypeConsult(): ?string
    {
        return $this->type_consult;
    }

    public function setTypeConsult(string $type_consult): static
    {
        $this->type_consult = $type_consult;

        return $this;
    }

    public function getFraisConsult(): ?string
    {
        return $this->frais_consult;
    }

    public function setFraisConsult(string $frais_consult): static
    {
        $this->frais_consult = $frais_consult;

        return $this;
    }

    public function getDateConsult(): ?\DateTimeInterface
    {
        return $this->date_consult;
    }

    public function setDateConsult(\DateTimeInterface $date_consult): static
    {
        $this->date_consult = $date_consult;

        return $this;
    }

    public function getPersonnel(): ?Personnel
    {
        return $this->personnel;
    }

    public function setPersonnel(?Personnel $personnel): static
    {
        $this->personnel = $personnel;

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
