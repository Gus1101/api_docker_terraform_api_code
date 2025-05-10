#Lib imports
from fastapi import FastAPI
from faker import Faker 
from random import randint

from faker.providers import DynamicProvider
from typing import List, Dict, Any

#Settings
fake = Faker("pt-BR")
app = FastAPI()

customer_gender_provider = DynamicProvider(
     provider_name="customer_gender_provider",
     elements=["M","F","NA"],
)

fake.add_provider(customer_gender_provider)

#Creating fake APIs
@app.get("/customer/data")
def customers_data() -> Dict[str, Any]:

    """
    Function used to retrieve data from 1 customer per time

    :return: Dict containing data from 1 customer
    """

    data = {
        "customer_name": fake.name(),
        "customer_age": randint(1,100),
        "customer_sex": fake.customer_gender_provider(),
        "customer_email": fake.email(),
    }

    return data

@app.get("/customer/data/{registers}")
def customer_data_quantity(registers: int) -> List[Dict[str, Any]]:

    """
    Function used to retrieve customer data based on a number of registers

    :param registers: Recieves a integer indicating how many registers need to be returned
    :return: Returns a list of dicts containing customer data
    """

    if not isinstance(registers, int):
        return {"TypeError":"Registers param must be an integer"}
    
    if registers <= 1:
        return {"ValueError":"Registers param must be greater than 1, otherwise use /customer/data api call"}

    data = []

    for _ in range(registers):

        efem_data = {
        "customer_name": fake.name(),
        "customer_age": randint(1,100),
        "customer_sex": fake.customer_gender_provider(),
        "customer_email": fake.email(),
    }
        data.append(efem_data)

    return data