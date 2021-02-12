from django.forms.widgets import DateTimeInput
from django import forms
from .models import Customer
from .models import Tecnician
from .models import Products
from .models import ProductGroup
from .models import Orders
from .models import OrderDetails
from .models import promotionCode
import logging

class CustomerForm(forms.ModelForm):
    class Meta:
        model = Customer
        fields = "__all__"

class TecnicianForm(forms.ModelForm):
    class Meta:
        model = Tecnician
        fields = "__all__"

class ProductForm(forms.ModelForm):
    class Meta:
        model = Products
        fields = "__all__"

class ProductGroupForm(forms.ModelForm):
    class Meta:
        model = ProductGroup
        fields = "__all__"

class OrderForm(forms.ModelForm):
    class Meta:
        model = Orders
        fields = ('custId', 'promotionCode')

class OrderDetailForm(forms.ModelForm):
    class Meta:
        model = OrderDetails
        fields = ('productId', 'quantity')

class OrderDetailFormUpdate(forms.ModelForm):
    class Meta:
        model = OrderDetails
        fields = ('technicianId', 'installationDate')
        widgets = {
            'installationDate': DateTimeInput(attrs={'type': 'datetime-local'}),
        }

class OrderDetailFormInstall(forms.ModelForm):
    class Meta:
        model = OrderDetails
        fields = ('unitSerialNo',)

class promotionCodeForm(forms.ModelForm):
    class Meta:
        model = promotionCode
        fields = ('code', 'promoType', 'product', 'minValue', 'amount',)