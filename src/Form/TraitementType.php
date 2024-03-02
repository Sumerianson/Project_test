<?php

namespace App\Form;

use App\Entity\Patient;
use App\Entity\Personnel;
use App\Entity\Traitement;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\DateType;

class TraitementType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('code_pat', null, [
                'label' => 'Code patient'
            ])
            ->add('code_maladie', null, [
                'label' => 'Code maladie'
            ])
            ->add('observation')
            ->add('date_deb', DateType::class, [
                'label' => 'Date debut',
                'widget' =>'single_text'
            ])
            ->add('date_fin', DateType::class, [
                'label' => 'Date fin',
                'widget' =>'single_text'
            ])
            ->add('etat_pat', null, [
                'label' => 'Etat patient'
            ])
            ->add('patient', EntityType::class, [
                'class' => Patient::class,
                'choice_label' => 'id',
            ])
            ->add('personnel', EntityType::class, [
                'class' => Personnel::class,
                'choice_label' => 'id',
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Traitement::class,
        ]);
    }
}
