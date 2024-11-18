# Use PyTorch with CUDA and cuDNN
FROM pytorch/pytorch:2.4.1-cuda12.4-cudnn9-devel

RUN pip install --no-cache-dir tensorboardX mamba-ssm>=2.2.2 causal-conv1d>=1.4.0 timm>=1.0.11 einops transformers
# RUN pip install --no-cache-dir scikit-learn pandas plotly matplotlib seaborn terminaltables

# Set working directory and copy application code
WORKDIR /app
COPY . /app