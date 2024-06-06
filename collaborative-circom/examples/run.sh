cargo run --release --bin co-circom -- split-witness --witness test_vectors/multiplier2/witness.wtns --r1cs test_vectors/multiplier2/multiplier2.r1cs --protocol bla --out-dir test_vectors/multiplier2
cargo run --release --bin co-circom -- generate-proof --witness test_vectors/multiplier2/witness.wtns.0.shared --r1cs test_vectors/multiplier2/multiplier2.r1cs --zkey test_vectors/multiplier2/multiplier2.zkey --protocol bla --config configs/party1.toml --out proof.0.json &
cargo run --release --bin co-circom -- generate-proof --witness test_vectors/multiplier2/witness.wtns.1.shared --r1cs test_vectors/multiplier2/multiplier2.r1cs --zkey test_vectors/multiplier2/multiplier2.zkey --protocol bla --config configs/party2.toml --out proof.1.json &
cargo run --release --bin co-circom -- generate-proof --witness test_vectors/multiplier2/witness.wtns.2.shared --r1cs test_vectors/multiplier2/multiplier2.r1cs --zkey test_vectors/multiplier2/multiplier2.zkey --protocol bla --config configs/party3.toml --out proof.2.json
cargo run --release --bin co-circom -- verify --proof proof.0.json --vk test_vectors/multiplier2/verification_key.json --public-inputs test_vectors/multiplier2/witness.wtns.0.shared
