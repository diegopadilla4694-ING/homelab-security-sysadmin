# Hardening de Red: Configuración de UFW (Uncomplicated Firewall)

## Resumen de la Configuración
Se ha implementado una política de **seguridad defensiva predeterminada (Default Deny)** en el nodo servidor ASUS. Todo el tráfico entrante no autorizado es rechazado por defecto, limitando la superficie de ataque únicamente a los servicios esenciales.

---

## Comandos Utilizados para la Configuración

Para aplicar este hardening en el servidor ASUS, se ejecutaron los siguientes comandos en orden:

```bash
# 1. PERMITIR SSH PRIMERO (Crítico: evita perder el acceso remoto)
sudo ufw allow 22/tcp

# 2. ESTABLECER POLÍTICAS POR DEFECTO
# Bloquear todo el tráfico entrante no solicitado
sudo ufw default deny incoming

# Permitir que el servidor responda y navegue hacia afuera
sudo ufw default allow outgoing

# 3. HABILITAR EL SERVICIO DE FIREWALL
sudo ufw enable

# 4. VERIFICAR EL ESTADO Y LAS REGLAS ACTIVAS
sudo ufw status verbose