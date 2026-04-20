import './App.css';
import PhoneMockup from './components/PhoneMockup';
import image1 from './assets/image.png';
import image2 from './assets/image2.png';
import { ShieldCheck, Apple, Play, Cog, PieChart, Zap, Settings2, Cloud, Lock } from 'lucide-react';

function App() {
  return (
    <div className="app-container">
      {/* Navbar */}
      <nav className="navbar container">
        <div className="logo">
          <ShieldCheck className="logo-icon" size={32} color="var(--accent-light)" />
          <span className="logo-text">AmigoPay</span>
        </div>
        <button className="btn-secondary nav-cta">Descargar</button>
      </nav>

      {/* Hero Section */}
      <header className="hero container">
        <div className="hero-content">
          <h1 className="hero-title">
            Gestión Inteligente de <span className="text-gradient">Finanzas Grupales</span>
          </h1>
          <p className="hero-subtitle">
            Optimice la división de gastos y el control de presupuestos con una plataforma robusta, diseñada para garantizar transparencia y eficiencia financiera.
          </p>
          <div className="hero-cta">
            <button className="btn-primary store-btn">
              <Apple size={20} /> App Store
            </button>
            <button className="btn-primary store-btn">
              <Play size={20} /> Google Play
            </button>
          </div>
        </div>
        <div className="hero-visual">
          <div className="glow-effect"></div>
          <PhoneMockup imageSrc={image1} altText="AmigoPay Dashboard" />
        </div>
      </header>

      {/* Features Section */}
      <section className="features container">
        <div className="features-header">
          <h2>Soluciones Financieras Integrales</h2>
          <p className="text-secondary">Herramientas avanzadas para una administración colaborativa sin contratiempos.</p>
        </div>

        <div className="features-grid">
          <div className="feature-card glass-panel">
            <div className="feature-icon-wrapper"><Cog size={28} /></div>
            <h3>Configuración Intuitiva</h3>
            <p className="text-secondary">Proceso guiado y seguro que permite a los usuarios integrarse rápidamente y comenzar a operar de inmediato.</p>
          </div>
          <div className="feature-card glass-panel">
            <div className="feature-icon-wrapper"><PieChart size={28} /></div>
            <h3>Control en Tiempo Real</h3>
            <p className="text-secondary">Registro automatizado de ingresos y egresos con conciliación instantánea e inteligente de saldos.</p>
          </div>
          <div className="feature-card glass-panel">
            <div className="feature-icon-wrapper"><ShieldCheck size={28} /></div>
            <h3>Auditoría de Actividad</h3>
            <p className="text-secondary">Trazabilidad completa mediante notificaciones inmediatas por cada transacción, asegurando máxima transparencia.</p>
          </div>
          <div className="feature-card glass-panel">
            <div className="feature-icon-wrapper"><Zap size={28} /></div>
            <h3>Experiencia Optimizada</h3>
            <p className="text-secondary">Interfaz ágil y altamente responsiva que maximiza la productividad y facilita análisis financieros rápidos.</p>
          </div>
        </div>
      </section>

      {/* Showcase Section */}
      <section className="showcase container">
        <div className="showcase-visual">
          <PhoneMockup imageSrc={image2} altText="AmigoPay Features" />
        </div>
        <div className="showcase-content">
          <h2>Transparencia y <span className="text-gradient">Control Absoluto</span></h2>
          <p className="text-secondary">
            Nuestra plataforma centraliza la información financiera y elimina la ambigüedad en la división de gastos. Diseñada con rigurosos estándares de seguridad y usabilidad, transforma la gestión económica grupal en un proceso automatizado y 100% confiable.
          </p>
          <ul className="tech-list">
            <li><Settings2 className="tech-icon" size={24} color="var(--accent-light)" /> <strong>Automatización de Cálculos:</strong> Liquidación automática de deudas.</li>
            <li><Cloud className="tech-icon" size={24} color="var(--accent-light)" /> <strong>Sincronización en la Nube:</strong> Acceso ininterrumpido y multi-dispositivo.</li>
            <li><Lock className="tech-icon" size={24} color="var(--accent-light)" /> <strong>Privacidad Optimizada:</strong> Protección del más alto nivel para sus datos.</li>
          </ul>
        </div>
      </section>

      {/* Footer */}
      <footer className="footer border-top container">
        <div className="footer-content">
          <div className="footer-brand">
            <ShieldCheck size={24} color="var(--text-primary)" />
            <span className="logo-text">AmigoPay</span>
          </div>
          <p className="text-secondary">© 2026 AmigoPay. Todos los derechos reservados.</p>
        </div>
      </footer>
    </div>
  );
}

export default App;
