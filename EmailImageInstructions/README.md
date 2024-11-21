# Email Creation Guidelines for Mailbox

To submit a new email to the game, each email must be accompanied by **four images**:

1. **Non-annotated light mode**
2. **Non-annotated dark mode**
3. **Annotated light mode**
4. **Annotated dark mode**

## Image Specifications

### Non-Annotated Emails

- **Light Mode**: Use `light_template.png`
- **Dark Mode**: Use `dark_template.png`
- **Image Dimensions**: Do not alter the default dimensions of the templates.

#### General Guidelines:
- **Background**:
  - Light mode emails: Light background with dark, high-contrast text.
  - Dark mode emails: Dark background with light, high-contrast text.
  
- **Sender Text**:
  - Font: Arial, size 28 (reduce slightly for longer sender names).
  - Position: Place on the left-hand side of the top of the image.
  - Text Color: Black for both light and dark modes.
  
- **Subject Text**:
  - Font: Arial, size 22 (minimum).
  - Vertical Centering: Ensure the subject is centered vertically.
  - Text Color: Black for both light and dark modes.
  
- **Circle in Top-Left Corner**:
  - Font: Arial, size 64 for the first letter of the sender’s name.
  - Text Color: Black for both light and dark modes.
  - Circle Color: May be modified, but must maintain high contrast.
  - Circle Size: Keep consistent with the template size.

#### Sender Guidelines:
- **Scam Emails**:
  - Use legitimate but uncommon domains that could be mistaken for scams.
  - A pull request may be rejected if the domain has been used too often.
  
- **Legitimate Emails**:
  - Use realistic and appropriate legitimate senders for the situation.

### Annotated Emails

- **Overlay**: Annotations should overlay the original email images (light or dark mode).
- **Arrow and Box Borders**: Use hex color `#ff0000`.
- **Annotation Text**: 
  - Background: White (`#ffffff`).
  - Align closely with the example formatting provided in this repository.

### Text Explanation for Each Email

Each email must include a text explanation for why it is considered **legitimate** or **a scam**. The explanation should follow this format and include at least two, but no more than five bullet points:

```
This email is {legitimate OR a scam}. Some ways you can tell include:
* [bullet point 1]
* [bullet point 2]
* [bullet point 3] (optional)
* [bullet point 4] (optional)
* [bullet point 5] (optional)
```

## Email Restrictions

- **No explicit or inappropriate content** (images or text).
- **No scam domains or phone numbers**:
  - You may use the [Pentest Tools Domain Lookup](https://pentest-tools.com/information-gathering/find-domains-owned-by-company) to find legitimate domains that resemble scam domains (ensure 100% likelihood of registration by the real company).
  - Use `555` phone numbers, which cannot be registered to real people, as placeholders for scam phone numbers.
- **No personal information**:
  - Use placeholders like `scameducation.org` and `scameducation` for email addresses and usernames.

## Helpful Creation Tools

  - Contrast: [Contrast Checker](https://webaim.org/resources/contrastchecker/)
  - Domain Finder: [Pentest Tools Domain Lookup](https://pentest-tools.com/information-gathering/find-domains-owned-by-company)
