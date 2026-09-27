/**
 * BIJOU DUAL-CONCEPT RESTAURANT & LOUNGE
 * Portal Client Logic & Tactile Micro-Interactions
 */

document.addEventListener('DOMContentLoaded', () => {
  const btnRestaurant = document.getElementById('btnRestaurantMenu');
  const btnLounge = document.getElementById('btnLoungeMenu');

  // Haptic Feedback Helper
  const triggerHaptic = (duration = 18) => {
    if ('vibrate' in navigator) {
      try {
        navigator.vibrate(duration);
      } catch (e) {
        // Ignore vibration errors if blocked
      }
    }
  };

  // Luxury Web Audio Haptic Click Sound (Soft Velvet Tap)
  let audioCtx = null;
  const playTactileClick = () => {
    try {
      if (!audioCtx) {
        audioCtx = new (window.AudioContext || window.webkitAudioContext)();
      }
      if (audioCtx.state === 'suspended') {
        audioCtx.resume();
      }
      const osc = audioCtx.createOscillator();
      const gain = audioCtx.createGain();
      osc.type = 'sine';
      osc.frequency.setValueAtTime(140, audioCtx.currentTime);
      osc.frequency.exponentialRampToValueAtTime(40, audioCtx.currentTime + 0.04);
      gain.gain.setValueAtTime(0.08, audioCtx.currentTime);
      gain.gain.exponentialRampToValueAtTime(0.001, audioCtx.currentTime + 0.04);
      osc.connect(gain);
      gain.connect(audioCtx.destination);
      osc.start();
      osc.stop(audioCtx.currentTime + 0.04);
    } catch (e) {
      // Audio autoplay may be restricted
    }
  };

  // Haptic & Sound Feedback on Button Navigation
  if (btnRestaurant) {
    btnRestaurant.addEventListener('click', () => {
      triggerHaptic(20);
      playTactileClick();
    });
  }

  if (btnLounge) {
    btnLounge.addEventListener('click', () => {
      triggerHaptic(20);
      playTactileClick();
    });
  }

  // Viewport resize safeguard to ensure zero-scroll
  window.addEventListener('resize', () => {
    window.scrollTo(0, 0);
  });
});
