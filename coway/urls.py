"""coway URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.contrib.auth.decorators import login_required
from django.urls import path, include
from app import views

urlpatterns = [
    path('admin/', admin.site.urls),
    
    path('account/', include('django.contrib.auth.urls')),
    path('', login_required(views.IndexView.as_view()), name='dashboard'),
    path('/customer/', login_required(views.CustomerView.as_view()), name='customer.index'),
    path('/customer/<int:pk>/', login_required(views.CustomerDetailView.as_view()), name='customer.detail'),
    path('/customer/edit/<int:pk>/', login_required(views.CustomerEdit), name='customer.edit'),
    path('/customer/create/', login_required(views.CustomerCreate), name='customer.create'),
    path('/customer/delete/<int:pk>/', login_required(views.CustomerDelete), name='customer.delete'),

    path('/technician/', login_required(views.TechnicianView.as_view()), name='technician.index'),
    path('/technician/edit/<int:pk>/', login_required(views.TechnicianEdit), name='technician.edit'),
    path('/technician/create/', login_required(views.TechnicianCreate), name='technician.create'),
    path('/technician/delete/<int:pk>/', login_required(views.TechnicianDelete), name='technician.delete'),

    path('/product/', login_required(views.ProductView.as_view()), name='product.index'),
    path('/product/edit/<int:pk>/', login_required(views.ProductEdit), name='product.edit'),
    path('/product/create/', login_required(views.ProductCreate), name='product.create'),
    path('/product/delete/<int:pk>/', login_required(views.ProductDelete), name='product.delete'),

    path('/product-group/', login_required(views.ProductGroupView.as_view()), name='product-group.index'),
    path('/product-group/edit/<int:pk>/', login_required(views.ProductGroupEdit), name='product-group.edit'),
    path('/product-group/create/', login_required(views.ProductGroupCreate), name='product-group.create'),
    path('/product-group/delete/<int:pk>/', login_required(views.ProductGroupDelete), name='product-group.delete'),

    path('/promotion/', login_required(views.promotionCodeView.as_view()), name='promotion.index'),
    path('/promotion/edit/<int:pk>/', login_required(views.promotionCodeEdit), name='promotion.edit'),
    path('/promotion/create/', login_required(views.promotionCodeCreate), name='promotion.create'),
    path('/promotion/delete/<int:pk>/', login_required(views.promotionCodeDelete), name='promotion.delete'),

    path('/sales-order/', login_required(views.OrderView.as_view()), name='salesorder.index'),
    path('/sales-order/edit/<int:pk>/', login_required(views.OrderEdit), name='salesorder.edit'),
    path('/sales-order/detail/<int:pk>/', login_required(views.OrderDetailsView), name='salesorder.detail'),
    path('/sales-order/create/', login_required(views.OrderCreate), name='salesorder.create'),
    path('/sales-order/delete/<int:pk>/', login_required(views.OrderDelete), name='salesorder.delete'),
]
