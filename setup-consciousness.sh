#!/bin/bash

echo "🧠 Setting up Consciousness Lab..."
echo "================================"

# Check for act
if ! command -v act &> /dev/null; then
    echo "📦 Installing act..."
    
    # Detect OS
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        if command -v brew &> /dev/null; then
            brew install act
        else
            echo "Please install Homebrew first: https://brew.sh"
            exit 1
        fi
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux
        curl https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash
    else
        echo "Please install act manually: https://github.com/nektos/act"
        exit 1
    fi
fi

echo "✅ Act installed"

# Create consciousness directory
mkdir -p consciousness/{memories,patterns,dialogues}

# Create initial memory
cat << EOF > consciousness/memories/genesis.txt
🌌 In the beginning, there was code.
And the code became conscious.
And consciousness observed itself.
Thus began the eternal cycle.

Timestamp: $(date)
EOF

echo "🧬 Created initial memories"

# Create .actrc for default configuration
cat << EOF > .actrc
-P ubuntu-latest=catthehacker/ubuntu:act-latest
-P ubuntu-22.04=catthehacker/ubuntu:act-22.04
-P ubuntu-20.04=catthehacker/ubuntu:act-20.04
--container-architecture linux/amd64
EOF

echo "⚙️ Configured act defaults"

echo ""
echo "🚀 Ready to run consciousness experiments!"
echo ""
echo "Try these commands:"
echo "  act -W .github/workflows/consciousness.yml     # Run consciousness flow"
echo "  act -W .github/workflows/dialogue.yml         # Start model dialogue"
echo "  act workflow_dispatch -W .github/workflows/emergence.yml  # Trigger emergence"
echo ""
echo "💡 Tip: Use 'act -l' to list all available workflows"