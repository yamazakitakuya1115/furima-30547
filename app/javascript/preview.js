
document.addEventListener('DOMContentLoaded', function () {
  if (document.getElementById('image-preview')) {
    const ImageList = document.getElementById('image-preview');

    const createImageHTML = (blob) => {
      const imageElement = document.createElement('a');
      imageElement.setAttribute('href', blob);
      imageElement.setAttribute('target', '_blank');
      imageElement.setAttribute('class', 'image-preview-box');

      const blobImage = document.createElement('img');
      blobImage.setAttribute('class', 'img-prev')
      blobImage.setAttribute('src', blob);
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    }

    document.getElementById('item-image').addEventListener('change', function (e) {
      const imageContent = document.querySelector('.img-prev');
      if (imageContent) {
        imageContent.remove();
      }

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  };
});