## Rozwiązaniem tego zadania jest plik gha_example.yml

<img width="321" alt="Zrzut ekranu 2024-06-1 o 23 23 57" src="https://github.com/radzp/zadanko2/assets/98003017/ad5eecc8-3bf4-419b-a789-7942c85d4254">

# Dodatkowe kroki, który dodałam to workflow
## ✅ Scan image for vulnerabilities
<img width="863" alt="Zrzut ekranu 2024-06-1 o 23 25 51" src="https://github.com/radzp/zadanko2/assets/98003017/1a6ef7de-16df-4f77-a8f1-305b18cf5bff">

Ten fragment to krok w GitHub Actions, który skanuje obraz Docker pod kątem podatności za pomocą narzędzia docker/scout-action@v1.
- command: cves - wywołuje skanowanie podatności CVE.
- image: ${{ vars.DOCKERHUB_USERNAME }}/zadanko2:latest - określa obraz Docker'a do zeskanowania.
- only-severities: critical,high - ogranicza skanowanie do podatności oznaczonych jako krytyczne lub wysokie.
- exit-code: true - powoduje zakończenie działania z kodem błędu innym niż zero, jeśli zostaną znalezione jakiekolwiek podatności.


## ✅ Echo debug info
<img width="727" alt="Zrzut ekranu 2024-06-1 o 23 40 38" src="https://github.com/radzp/zadanko2/assets/98003017/032b7d62-d46f-4b2a-ae3c-1df6c4649dc5">

Ten fragment kodu napisałam w celu debugowania, więc pokrótce kod:
- wyświetla na konsoli różne informacje związane z wcześniejszymi krokami workflow. Informacje takie jak skanowania podatności, tagi meta, nazwę obrazu Docker oraz informacje o repozytorium GitHub.

## ✅ Login to GHCR
<img width="520" alt="Zrzut ekranu 2024-06-1 o 23 42 07" src="https://github.com/radzp/zadanko2/assets/98003017/40f33481-164b-45ae-a88f-6bbbc5fc0c4b">

Tutaj następuje logowanie się do GitHub Container Registry (GHCR) używając akcji docker/login-action@v1 z moją nazwą użytkownika radzp i tokenem GitHub jako hasłem.

## ✅ Push to GitHub Container Registry

<img width="694" alt="Zrzut ekranu 2024-06-1 o 23 45 02" src="https://github.com/radzp/zadanko2/assets/98003017/236dd17a-df22-4a82-8d92-38fed2641566">

- if: success(): Ten krok zostanie wykonany tylko wtedy, gdy wszystkie poprzednie kroki zakończą się powodzeniem.  
- uses: docker/build-push-action@v5: Ten krok korzysta z akcji GitHub o nazwie build-push-action, która jest dostarczana przez Docker. Akcja ta buduje obraz Docker'a i przesyła go do rejestru Docker'a.
- with::  
- context: .:  określa kontekst dla budowy Docker'a, tutaj jest to katalog bieżący (.).  
- file: ./Dockerfile: argument ten określa ścieżkę do Dockerfile, który ma być użyty do budowy obrazu Docker'a.  
- platforms: linux/amd64,linux/arm64: argument określa platformy, dla których ma być zbudowany obraz Docker'a.  
- push: true: Ten argument określa, że obraz Docker'a ma być przesłany do rejestru po zbudowaniu.  
- tags: ghcr.io/radzp/zadanko2:${{ github.sha }}: argument ten określa tagi, które mają być przypisane do obrazu Docker'a. Zdecydowałam się na to, żeby był tagowany za pomocą SHA commita.

- ### Uruchomiłam test, by potwierdzić poprawność działania
<img width="1440" alt="Zrzut ekranu 2024-06-1 o 23 20 49" src="https://github.com/radzp/zadanko2/assets/98003017/43c24b89-1cb8-4817-84a8-03cf207fc649">

##
<img width="1439" alt="Zrzut ekranu 2024-06-1 o 23 20 16" src="https://github.com/radzp/zadanko2/assets/98003017/decdbe46-9879-45c3-84cd-2098d19dd9fe">

## Package jest stworzone:
<img width="1440" alt="Zrzut ekranu 2024-06-1 o 23 23 03" src="https://github.com/radzp/zadanko2/assets/98003017/0f54c565-d6db-471c-b404-d8863ccba431">

### Komendy, które użyłam podczas pracy z tym zadaniem:
<img width="913" alt="Zrzut ekranu 2024-06-1 o 23 51 18" src="https://github.com/radzp/zadanko2/assets/98003017/adb9a50e-be80-42ec-b486-fab3ce0e1880">

<img width="857" alt="Zrzut ekranu 2024-06-1 o 23 51 40" src="https://github.com/radzp/zadanko2/assets/98003017/34d4077f-1cfa-4c6c-8da4-af82afcac1b4">

<img width="774" alt="Zrzut ekranu 2024-06-1 o 23 51 57" src="https://github.com/radzp/zadanko2/assets/98003017/bee1937b-23b1-477f-90b2-d32ccfaff82f">

<img width="634" alt="Zrzut ekranu 2024-06-1 o 23 52 28" src="https://github.com/radzp/zadanko2/assets/98003017/8fcfea36-eedd-45a7-bb2b-221366914c33">





