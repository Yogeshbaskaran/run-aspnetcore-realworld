terraform {    
  required_providers {    
    azurerm = {    
      source = "hashicorp/azurerm"    
    }    
  }    
} 
   
provider "azurerm" {    
  features {}    
}

resource "azurerm_resource_group" "resource_group" {
  name     = "app-service-rg"
  location = "East US"
}

resource "azurerm_app_service_plan" "app_service_plan" {
  name                = "demoappservice-plan"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  kind                = "Windows"
  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "app_service" {
  name                = "DotNetCoreDemoApp"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id

  site_config {
    windows_fx_version = "DOTNETCORE|3.1"
  }

}
