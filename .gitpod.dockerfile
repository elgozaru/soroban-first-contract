FROM gitpod/workspace-full

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh \
&& rustup target add wasm32-unknown-unknown \
&& cargo install --locked stellar-cli --features opt \
&& source <(stellar completion --shell bash) \
&& stellar network add \
  testnet \
  --rpc-url https://soroban-testnet.stellar.org:443 \
  --network-passphrase "Test SDF Network ; September 2015" \
&& stellar keys generate --global alice --network testnet \
&& stellar keys address alice
