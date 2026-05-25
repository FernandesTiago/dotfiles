#!/bin/bash

echo "=== VPN Status ==="

# WireGuard
if sudo wg show wg0 &>/dev/null; then
    echo "✔ WireGuard (wg0) — active"
else
    echo "✘ WireGuard (wg0) — inactive"
fi

# Tailscale
if tailscale status &>/dev/null; then
    echo "✔ Tailscale — active"
else
    echo "✘ Tailscale — inactive"
fi

# ProtonVPN
if pgrep -x "openvpn" &>/dev/null || ip link show proton0 &>/dev/null 2>&1; then
    echo "✔ ProtonVPN — active"
else
    echo "✘ ProtonVPN — inactive"
fi

# Mullvad
if mullvad status 2>/dev/null | grep -q "Connected"; then
    echo "✔ Mullvad — active"
else
    echo "✘ Mullvad — inactive"
fi

echo "=================="
