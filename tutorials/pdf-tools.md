# PDF tools

## PDF decryption

This is a very handy tool for pdf file decryption, allowing pdfs to be viewed without the need of the password.
```bash
# Install 
sudo pacman -S qpdf

# Command
qpdf --password=[owner_password] --decrypt input.pdf output.pdf
```


## PDF merging

```bash
magick part1.pdf part2.pdf merged.pdf
```
Alternative method: Libre Office Draw.