使用poetry来管理项目依赖是一个很好的选择，它可以帮助开发者指定、安装和解决项目中的外部包。

1. 使用Poetry创建新项目：

```bash
poetry new ${project_name}
cd ${project_name}
# The virtualenv will be created inside the project path and vscode will recognize.
poetry config virtualenvs.in-project true
poetry env use 3.10
```

2. 指定Python版本： 在`pyproject.toml`文件中，开发者可以指定项目所需的Python版本，例如：

```
[tool.poetry.dependencies]
python = "^3.10"
```

3. 添加项目依赖

```bash
poetry add stable-ts
```

```
[tool.poetry.dependencies]
python = "^3.10"
stable-ts = "^2.17.2"
```

4. 安装依赖

```bash
poetry install
```

5. 拉起装载依赖的虚拟环境

```bash
poetry shell
```
