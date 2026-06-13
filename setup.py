from setuptools import find_namespace_packages, setup

setup(
    name="hypurr-grpc",
    version="1.0.3",
    packages=find_namespace_packages(where="python"),
    package_dir={"": "python"},
    install_requires=[
        "grpcio>=1.76,<2",
        "protobuf>=6.33.5,<7",
    ],
    url="https://github.com/Hypurr-Fun/hypurr-grpc",
    license="copyright",
    author="Hypurr Fun LLP",
    description="gRPC code for hypurr client",
)
