from django.shortcuts import render, redirect, get_object_or_404
from django.forms import formset_factory
from .models import Customer
from .models import Tecnician
from .models import Products
from .models import ProductGroup
from .models import Orders
from .models import OrderDetails
from .models import promotionCode

from .forms import CustomerForm
from .forms import TecnicianForm
from .forms import ProductForm
from .forms import OrderForm
from .forms import OrderDetailForm
from .forms import OrderDetailFormUpdate
from .forms import OrderDetailFormInstall
from .forms import promotionCodeForm
from django.views.generic import ListView, DetailView
from django.forms import formset_factory
import logging


class IndexView(ListView):
    template_name = 'html/dashboard.html'
    context_object_name = 'customer_list'

    def get_queryset(self):
        return Customer.objects.all()

class CustomerView(ListView):
    template_name = 'html/customer/index.html'
    context_object_name = 'customer_list'

    def get_queryset(self):
        return Customer.objects.all()


class CustomerDetailView(DetailView):
    model = Customer
    template_name = 'html/customer/customer-detail.html'

def CustomerCreate(request):
    if request.method == 'POST':
        form = CustomerForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('customer.index')
    form = CustomerForm()

    return render(request, 'html/customer/create.html', {'form': form})


def CustomerEdit(request, pk, template_name='html/customer/edit.html'):
    contact = get_object_or_404(Customer, pk=pk)
    form = CustomerForm(request.POST or None, instance=contact)
    if form.is_valid():
        form.save()
        return redirect('customer.index')
    return render(request, template_name, {'form': form})


def CustomerDelete(request, pk, template_name='html/customer/confirm_delete.html'):
    contact = get_object_or_404(Customer, pk=pk)
    if request.method == 'POST':
        contact.delete()
        return redirect('customer.index')
    return render(request, template_name, {'object': contact})



class TechnicianView(ListView):
    template_name = 'html/technician/index.html'
    context_object_name = 'customer_list'

    def get_queryset(self):
        return Tecnician.objects.all()


def TechnicianCreate(request):
    if request.method == 'POST':
        form = TecnicianForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('technician.index')
    form = TecnicianForm()

    return render(request, 'html/technician/create.html', {'form': form})


def TechnicianEdit(request, pk, template_name='html/technician/edit.html'):
    contact = get_object_or_404(Tecnician, pk=pk)
    form = TecnicianForm(request.POST or None, instance=contact)
    if form.is_valid():
        form.save()
        return redirect('technician.index')
    return render(request, template_name, {'form': form})


def TechnicianDelete(request, pk, template_name='html/technician/confirm_delete.html'):
    contact = get_object_or_404(Tecnician, pk=pk)
    if request.method == 'POST':
        contact.delete()
        return redirect('technician.index')
    return render(request, template_name, {'object': contact})

class ProductView(ListView):
    template_name = 'html/product/index.html'
    context_object_name = 'customer_list'

    def get_queryset(self):
        return Products.objects.all()


def ProductCreate(request):
    if request.method == 'POST':
        form = ProductForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('product.index')
    form = ProductForm()

    return render(request, 'html/product/create.html', {'form': form})


def ProductEdit(request, pk, template_name='html/product/edit.html'):
    contact = get_object_or_404(Products, pk=pk)
    form = ProductForm(request.POST or None, instance=contact)
    if form.is_valid():
        form.save()
        return redirect('product.index')
    return render(request, template_name, {'form': form})


def ProductDelete(request, pk, template_name='html/product/confirm_delete.html'):
    contact = get_object_or_404(Products, pk=pk)
    if request.method == 'POST':
        contact.delete()
        return redirect('product.index')
    return render(request, template_name, {'object': contact})

class ProductGroupView(ListView):
    template_name = 'html/product-group/index.html'
    context_object_name = 'customer_list'

    def get_queryset(self):
        return ProductGroup.objects.all()


def ProductGroupCreate(request):
    if request.method == 'POST':
        form = ProductGroup(request.POST)
        if form.is_valid():
            form.save()
            return redirect('product.index')
    form = ProductGroup()

    return render(request, 'html/product-group/create.html', {'form': form})


def ProductGroupEdit(request, pk, template_name='html/product-group/edit.html'):
    contact = get_object_or_404(ProductGroup, pk=pk)
    form = ProductGroup(request.POST or None, instance=contact)
    if form.is_valid():
        form.save()
        return redirect('product.index')
    return render(request, template_name, {'form': form})

def ProductGroupDelete(request, pk, template_name='html/product-group/confirm_delete.html'):
    contact = get_object_or_404(ProductGroup, pk=pk)
    if request.method == 'POST':
        contact.delete()
        return redirect('product.index')
    return render(request, template_name, {'object': contact})

class OrderView(ListView):
    template_name = 'html/sales-order/index.html'
    context_object_name = 'customer_list'

    def get_queryset(self):
        return OrderDetails.objects.select_related('orderId')


def OrderDetailsView(request, pk, template_name='html/sales-order/detail.html'):
    OrderDetail = OrderDetails.objects.get(id=pk)
    Order = Orders.objects.get(id=OrderDetail.orderId_id)
    form = OrderDetailFormUpdate(request.POST or None, instance=OrderDetail)
    formInstall = OrderDetailFormInstall(request.POST or None, instance=OrderDetail)
    if request.method == 'POST':
        if form.is_valid():
            form = form.save(commit=False)
            form.status = 2
            Order.status = 2
            form.save()
            Order.save()
            return redirect('salesorder.index')
        if formInstall.is_valid():
            formInstall = formInstall.save(commit=False)
            formInstall.status = 3
            Order.status = 3
            formInstall.save()
            Order.save()
            return redirect('salesorder.index')
    return render(request, 'html/sales-order/detail.html', {'orderDetail': OrderDetail, 'order': Order, 'form': form,
    'formInstall': formInstall})

def OrderCreate(request):
    OrdForm = OrderForm(request.POST)
    OrdDetailForm = OrderDetailForm(request.POST)
    FormSet = formset_factory(OrderDetailForm, OrderForm, extra=2)
    if request.method == 'POST':
        if all([OrdForm.is_valid(), OrdDetailForm.is_valid()]):
            product_detail = Products.objects.get(pk=request.POST['productId'])
            promo = promotionCode.objects.filter(code=request.POST['promotionCode']).first()
            logging.warning(promo.minValue) 
            totalPrice = int(product_detail.price)*int(request.POST['quantity'])
            if not promo:
                totalPrice = totalPrice
            else:
                if promo.promoType == 'Unit' and promo.product_id == product_detail.id:
                    totalPrice = totalPrice - ((totalPrice * promo.amount) / 100)
                elif promo.promoType == 'Quantity' and int(request.POST['quantity']) > int(promo.minValue):
                    totalPrice = totalPrice - ((totalPrice * promo.amount) / 100)
                    
            order = Orders.objects.create(
                custId_id=request.POST['custId'],
                promotionCode=request.POST['promotionCode'],
                totalPrice=totalPrice
            )
            OrderDetails.objects.create(
                orderId_id=order.id,
                productId_id=request.POST['productId'],
                price=product_detail.price,
                quantity=request.POST['quantity']
            )
            return redirect('salesorder.index')
    form = FormSet(request.POST)
    return render(request, 'html/sales-order/create.html', {'form': form, 'formset': OrdDetailForm})


def OrderEdit(request, pk, template_name='html/sales-order/edit.html'):
    contact = get_object_or_404(Orders, pk=pk)
    form = OrderForm(request.POST or None, instance=contact)
    if form.is_valid():
        form.save()
        return redirect('salesorder.index')
    return render(request, template_name, {'form': form})

def OrderDelete(request, pk, template_name='html/sales-order/confirm_delete.html'):
    contact = get_object_or_404(Orders, pk=pk)
    if request.method == 'POST':
        contact.delete()
        return redirect('salesorder.index')
    return render(request, template_name, {'object': contact})

class promotionCodeView(ListView):
    template_name = 'html/promotion/index.html'
    context_object_name = 'promotion'

    def get_queryset(self):
        return promotionCode.objects.all()


def promotionCodeCreate(request):
    if request.method == 'POST':
        form = promotionCodeForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('promotion.index')
    form = promotionCodeForm()

    return render(request, 'html/promotion/create.html', {'form': form})


def promotionCodeEdit(request, pk, template_name='html/promotion/edit.html'):
    contact = get_object_or_404(promotionCode, pk=pk)
    form = promotionCodeForm(request.POST or None, instance=contact)
    if form.is_valid():
        form.save()
        return redirect('promotion.index')
    return render(request, template_name, {'form': form})

def promotionCodeDelete(request, pk, template_name='html/promotion/confirm_delete.html'):
    contact = get_object_or_404(promotionCode, pk=pk)
    if request.method == 'POST':
        contact.delete()
        return redirect('promotion.index')
    return render(request, template_name, {'object': contact})