<?php

namespace App\Form;

use App\Entity\Patient;
use App\Entity\Personnel;
use App\Entity\Consultation;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\DateType;

class ConsultationType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('code_pat', null, [
                'label' => 'Code patient'
            ])
            ->add('code_pers', null, [
                'label' => 'Code personnel'
            ])
            ->add('type_consult', null, [
                'label' => 'Type de consultation'
            ])
            ->add('frais_consult', null, [
                'label' => 'Frais de consultation'
            ])
            ->add('date_consult', DateType::class, [
                'label' => 'Date de consultation',
                'widget' =>'single_text'
            ])
            ->add('personnel', EntityType::class, [
                'class' => Personnel::class,
                'choice_label' => 'id',
            ])
            ->add('patient', EntityType::class, [
                'class' => Patient::class,
                'choice_label' => 'id',
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Consultation::class,
        ]);
    }
}
