from django import forms #type: ignore
from django.core import validators #type: ignore


class ProductValidator(forms.Form):
    """
        Product validator

    """
    product = forms.CharField(
        max_length=100,
        validators=[
            validators.RegexValidator(
                regex=r'^[a-zA-ZáéíóúÁÉÍÓÚ\s]+$',
                code='invalid_name'
            )
        ])

class CategoryValidator(forms.Form):
    """
        Category validator

    """
    category = forms.CharField(
        max_length=100,
        validators=[
            validators.RegexValidator(
                regex=r'^[a-zA-ZáéíóúÁÉÍÓÚ\s]+$',
                code='invalid_name'
            )
        ])
