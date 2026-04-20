import React from 'react';
import './PhoneMockup.css';

interface PhoneMockupProps {
  imageSrc: string;
  altText?: string;
}

const PhoneMockup: React.FC<PhoneMockupProps> = ({ imageSrc, altText = "App interface screenshot" }) => {
  return (
    <div className="phone-wrapper">
      <div className="phone-frame glass-panel">
        <div className="phone-notch"></div>
        <div className="phone-screen">
          <img src={imageSrc} alt={altText} className="phone-image" />
        </div>
      </div>
    </div>
  );
};

export default PhoneMockup;
