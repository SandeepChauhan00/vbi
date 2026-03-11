# Platform Setup Guide

## Google Colab

Each example notebook includes a setup cell that automatically installs VBI when running in Colab.
Simply open the notebook and run all cells.

If you need to install manually:

```python
import os
os.environ['SKIP_CPP'] = '1'
!pip install vbi[inference]==0.4.3
```

Note: The Colab environment resets when the runtime shuts down. You will need to reinstall each session.

## EBRAINS Collab

Run the provided setup script:

```bash
bash scripts/setup_ebrains.sh
```

Then reload your browser and select the `VBI` kernel. The environment resets when the lab server shuts down.
