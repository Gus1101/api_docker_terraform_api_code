FROM python:3.11-slim

# Instala dependências do sistema
RUN apt-get update && apt-get install -y build-essential && rm -rf /var/lib/apt/lists/*

# Define o diretório de trabalho
WORKDIR /app

# Copia o restante da aplicação
COPY . .
RUN pip install --no-cache-dir -r requirements.txt

# Expõe a porta (ajuste conforme necessário)
EXPOSE 8000

# Comando para rodar o app (ex: FastAPI com Uvicorn)
CMD ["uvicorn", "src.backend.fake_api.fake_api_data:app", "--host", "0.0.0.0", "--port", "8000"]
