# DevContainer Setup

This project supports development inside a [Visual Studio Code DevContainer](https://code.visualstudio.com/docs/devcontainers/containers). It provides a consistent, isolated environment for all contributors.

## Quick Start

1. **Install prerequisites:**
   - [Docker](https://www.docker.com/products/docker-desktop)
   - [Visual Studio Code](https://code.visualstudio.com/)
   - [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

2. **Clone the repository:**

   ```sh
   git clone https://github.com/Guilherme-Natan/MovieReview
   cd MovieReview
   ```

3. **Open in DevContainer:**
   - Open the folder in VSCode.
   - When prompted: “**Reopen in Container**”, click it.
   - Or open the command palette (Ctrl+Shift+P) and select:  
     `Dev Containers: Reopen in Container`

4. **Install the required softwares for rails development**
    - Run `curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash`, then close and
      reopen **both** VsCode, and its embedded terminal
    - Run `rbenv install 3.4.4` to install the necessary ruby version
    - Run `gem install rails -v 7.2.2` to install the necessary rails version

5. **Setup some extensions**
    
    If you want to use the extensions provided in the devcontainer.json file, you need to setup some of then:
    - Run `bundle exec tapioca init` to use the sorbet extension. This command takes a while (~5 minutes)
    - Open the command pallet (`Ctrl Shift p`), run `Bust-a-Gem: Rebuild Tags`
