<a id="readme-top"></a>

<div align="center">
    <img src="./assets/lordksix-logos_transparent.png" alt="logo" width="240"  height="auto" margin="auto"/>
</div>
<div align="center">
    <img src="./assets/erd_diagram.png" alt="logo" width="400"  height="auto" margin="auto"/>
    <br/>
</div>
<h1 align="center"><b>Budget by Lordksix</b></h3>

# 📗 Table of Contents

- [📗 Table of Contents](#table-of-contents)
- [📖 Budget by Lordksix](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
  - [💻 Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Install](#install)
    - [Usage](#usage)
    - [Run tests](#run-tests)
  - [👥 Authors](#Authors)
  - [🔭 Future Features](#future-features)
  - [🤝 Contributing](#contributing)
  - [⭐️ Show your support](#️support)
  - [🙏 Acknowledgments](#acknowledgements)
  - [❓ FAQ](#faq)
  - [📝 License](#license)

# 📖 Budget by Lordksix <a id="about-project"></a>

**Budget by Lordksix** is a Ruby on Rails web application with PostgreSQL as database. It allows to manage your budget by creating categories of expenses, and transactions for each category.

For a video explanation, please [here]()

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🛠 Built With <a id="built-with"></a>

### Tech Stack <a id="tech-stack"></a>

<details>
    <summary>Client</summary>
    <ul>
        <li><a href="https://www.w3.org/TR/2011/WD-html5-20110405/">HTML5</a></li>
        <li><a href="https://www.w3.org/Style/CSS/specs.en.html">CSS</a></li>
        <li><a href="https://www.ecma-international.org/publications-and-standards/standards/ecma-262/">JavaScript</a></li>
    </ul>
</details>
<details>
  <summary>Server</summary>
  <ul>
    <li><a href="https://www.ruby-lang.org/en/">Ruby</a></li>
    <li><a href="https://rubyonrails.org/">Ruby on Rails</a></li>
  </ul>
</details>

<details>
  <summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

### Key Features <a id="key-features"></a>

- **Gitflow**
- **Linters implemented**
- **Rubocop implemented**
- **Implement Model Migrations**
- **Implement Implement TailwindCSS**
- **Implement unit and integrations tests**
- **Implement authentication and authorization**
- **Use PostgreSQL**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🚀 Live Demo <a name="live-demo"></a>
>[Live Demo](https://budget-by-lordksix.onrender.com/)

> [Video Presentation](https://www.loom.com/share/bd25e5f6f20846828c31d7e837893961?sid=cf3a0e39-bdb6-465a-a91f-a3f6d6808155)
<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a id="getting-started"></a>

### Prerequisites

In order to run this project you need:

- To clone or fork this repo
- Ruby installed in your machine
- Ruby on Rails gem installed
- PostgreSQL install in you computer
- To modify this profile you will also need a text editor

For more information on how to install ruby on your machine:

- <a href="https://www.ruby-lang.org/en/documentation/installation/">How to install ruby</a>

### Setup

Clone this repository to your desired folder:

For example, using Ubuntu:

```sh
  cd my-desired-folder
  git clone https://github.com/lordksix/budget-app-by-rails.git
```

For more information on how to clone or fork a repository:

- <a href="https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository">How to clone a repo</a>
- <a href="https://docs.github.com/en/get-started/quickstart/fork-a-repo">How to fork a repo</a>

### Install

To install dependencies, the following command must be run in the terminal:

```sh
  cd budget-app-by-rails
  bundle install
```

To create database, migrate schema and implement initial database entries

```sh
  rails db:drop db:setup
```

### Usage

In the project directory, run the first time:

```sh
  bundle exec rake assets:precompile
```

 then, you can use:

```sh
  ./bin/dev
```

or:

```sh
  rails s
```

Check on db/seed.rb for pre-loaded users, groups and, spendings, and likes for development

### Run tests

In the project directory, run the first time:

```sh
  bundle exec rake assets:precompile
```

 then, you can:

```sh
  rspec .
```

however, if you haven't run `./bin/dev`

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 👥 Authors <a id="Authors"></a>

👤 **lordksix**

- GitHub: [@lordksix](https://github.com/lordksix)
- LinkedIn: [@wladpasquel](https://www.linkedin.com/in/wladpasquel/)
- Medium: [@wladimir.pasquel](https://medium.com/@wladimir.pasquel)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a id="future-features"></a>

Future changes:

- Implement external authentication.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a id="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ⭐️ Show your support <a id="️support"></a>

If you like this project, I encourage you to clone, fork and contribute. Our community and knowledge grows with each engagement.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgments <a id="acknowledgements"></a>

We would like to thank Microverse for the idea for this project.

Original design idea by [Gregoire Vella on Behance](https://www.behance.net/gregoirevella).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ❓ FAQ <a id="faq"></a>

- **Do I need a IDE or a special text editor to make changes?**

  - No, you don't. You can use NotePad to make changes.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a id="license"></a>

This project is [GNUv3](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
