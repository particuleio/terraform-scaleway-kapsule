# Contributing

Thanks for contributing to `terraform-kubernetes-addons`.

For larger changes, please open an issue first so the module scope, provider behavior, and compatibility expectations are clear before implementation.

## Pull Request Process

1. Use a semantic PR title accepted by CI: `feat:`, `fix:`, `docs:`, `ci:`, or `chore:`.
2. Keep provider-specific changes inside the matching module under `modules/`.
3. Update generated module documentation when inputs, outputs, providers, resources, or requirements change.
4. Run the local checks before opening the PR:

   ```bash
   mise install
   pre-commit run -a
   ```

5. Confirm CI is passing and address review comments before merge.

## Terraform And OpenTofu

- Terraform compatibility is documented from the Terraform view of each module.
- OpenTofu compatibility is handled with `.tofu` override files where needed.
- Do not duplicate provider constraints in `.tofu` files. Keep provider constraints in `versions.tf` unless a runtime-specific override is required.
- If a `.tofu` file changes module compatibility, mention that in the module README outside the generated docs block.

## Documentation

Module README files are generated with `terraform-docs` through the repository pre-commit hook. The hook intentionally excludes `.tofu` override files from the docs input so Terraform provider and requirement tables remain stable.

Update documentation when changing:

- variables
- outputs
- required providers
- Terraform/OpenTofu version constraints
- module behavior or supported providers

## Semantic Pull Requests

PR titles are validated with semantic prefixes. Accepted types are:

- `feat:` for new features
- `fix:` for bug fixes
- `docs:` for documentation-only changes
- `ci:` for workflow, Renovate, Mergify, or pre-commit changes
- `chore:` for maintenance that does not affect module behavior

Use a concise subject after the prefix, for example:

```text
feat: add OpenTofu compatibility override for AWS module
```

The `chore` type is skipped during changelog generation.
