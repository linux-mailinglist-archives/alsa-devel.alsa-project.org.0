Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC07A42041
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 11:08:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91089177E;
	Wed, 12 Jun 2019 11:07:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91089177E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560330483;
	bh=Ne8p5McDaI4vuyDLX9dU9kqFPp/kP2fzb74fLX06oq0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qj2JZjLlbizM52sk/9pjRkFIYHTOja8qeo6Wj+IKhQq1lTqOg/ttpNNVhZCKRqDza
	 +aonuxYUPQJmTYM6dNLSkH6axk9/g75OTjAQjaSpFdWz4kOI030eEpsUJbrtsuPkd7
	 8PJFz0f59f2nE6f8DDWM/vFc+sXJ5aApaZkFSPg8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3BC7F89737;
	Wed, 12 Jun 2019 11:04:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27E00F8970F; Tue, 11 Jun 2019 21:52:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0EA76F80791
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 21:52:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EA76F80791
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mesbSbUw"
Received: from earth.universe (unknown [185.62.205.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C6B1C20679;
 Tue, 11 Jun 2019 19:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560282748;
 bh=Ho5P0c6hGI38sP+yZlHSbOXf+88ZWObH2VsdGH9CDWk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mesbSbUwPUO0tcNDcbDeBVizggPJIKAWlNzT7KRBDdgAstpChR1+l6XTZ5Sdk2tjc
 YOIXNKBcYtUTWa8Pjd38Q3L4C7wMM2YQtKwayGqx7aHq44KYS5JPoFLzX2/JFx1qWB
 INzdvdRHuC6D4EUDseSpxjuW5vR5LVGrzSFInyG8=
Received: by earth.universe (Postfix, from userid 1000)
 id 4CB863C0C77; Tue, 11 Jun 2019 21:52:25 +0200 (CEST)
Date: Tue, 11 Jun 2019 21:52:25 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <20190611195225.kihm2e4wideae3jd@earth.universe>
References: <20190604152019.16100-1-enric.balletbo@collabora.com>
 <20190604152019.16100-3-enric.balletbo@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20190604152019.16100-3-enric.balletbo@collabora.com>
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Wed, 12 Jun 2019 11:04:31 +0200
Cc: gwendal@chromium.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Vignesh R <vigneshr@ti.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Wolfram Sang <wsa@the-dreams.de>, linux-iio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Juergen Fitschen <jfi@ssv-embedded.de>,
 alsa-devel@alsa-project.org, Stefan Agner <stefan@agner.ch>,
 Douglas Anderson <dianders@chromium.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
 linux-i2c@vger.kernel.org, Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, kernel@collabora.com, dtor@chromium.org,
 Lars-Peter Clausen <lars@metafoo.de>, Jean Delvare <jdelvare@suse.de>,
 Jacky Bai <ping.bai@nxp.com>, linux-rtc@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sean Young <sean@mess.org>, Lee Jones <lee.jones@linaro.org>,
 Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Shreesha Rajashekar <shreesha.rajashekar@broadcom.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Hans Verkuil <hans.verkuil@cisco.com>,
 linux-input@vger.kernel.org, Elie Morisse <syniurge@gmail.com>,
 linux-media@vger.kernel.org, Ettore Chimenti <ek5.chimenti@gmail.com>,
 linux-pwm@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Florian Fainelli <f.fainelli@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Benson Leung <bleung@chromium.org>,
 Dong Aisheng <aisheng.dong@nxp.com>, Alessandro Zummo <a.zummo@towertech.it>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ajay Gupta <ajayg@nvidia.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hartmut Knaack <knaack.h@gmx.de>,
 Eddie James <eajames@linux.vnet.ibm.com>, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [alsa-devel] [PATCH 02/10] mfd / platform: cros_ec: Move
 cros-ec core driver out from MFD
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4309480296154330662=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4309480296154330662==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uzslaa6eqheeobde"
Content-Disposition: inline


--uzslaa6eqheeobde
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 04, 2019 at 05:20:11PM +0200, Enric Balletbo i Serra wrote:
> Now, the ChromeOS EC core driver has nothing related to an MFD device, so
> move that driver from the MFD subsystem to the platform/chrome subsystem.
>=20
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---

Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/extcon/Kconfig                     |  2 +-
>  drivers/hid/Kconfig                        |  2 +-
>  drivers/i2c/busses/Kconfig                 |  2 +-
>  drivers/iio/common/cros_ec_sensors/Kconfig |  2 +-
>  drivers/input/keyboard/Kconfig             |  2 +-
>  drivers/media/platform/Kconfig             |  3 +--
>  drivers/mfd/Kconfig                        | 14 +-------------
>  drivers/mfd/Makefile                       |  2 --
>  drivers/platform/chrome/Kconfig            | 21 +++++++++++++++++----
>  drivers/platform/chrome/Makefile           |  1 +
>  drivers/{mfd =3D> platform/chrome}/cros_ec.c |  0
>  drivers/power/supply/Kconfig               |  2 +-
>  drivers/pwm/Kconfig                        |  2 +-
>  drivers/rtc/Kconfig                        |  2 +-
>  sound/soc/qcom/Kconfig                     |  2 +-
>  15 files changed, 29 insertions(+), 30 deletions(-)
>  rename drivers/{mfd =3D> platform/chrome}/cros_ec.c (100%)
>=20
> diff --git a/drivers/extcon/Kconfig b/drivers/extcon/Kconfig
> index 6f5af4196b8d..0ebc599c5e51 100644
> --- a/drivers/extcon/Kconfig
> +++ b/drivers/extcon/Kconfig
> @@ -169,7 +169,7 @@ config EXTCON_USB_GPIO
> =20
>  config EXTCON_USBC_CROS_EC
>  	tristate "ChromeOS Embedded Controller EXTCON support"
> -	depends on MFD_CROS_EC
> +	depends on CROS_EC
>  	help
>  	  Say Y here to enable USB Type C cable detection extcon support when
>  	  using Chrome OS EC based USB Type-C ports.
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 3872e03d9a59..a958b9625bba 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -376,7 +376,7 @@ config HOLTEK_FF
> =20
>  config HID_GOOGLE_HAMMER
>  	tristate "Google Hammer Keyboard"
> -	depends on USB_HID && LEDS_CLASS && MFD_CROS_EC
> +	depends on USB_HID && LEDS_CLASS && CROS_EC
>  	---help---
>  	Say Y here if you have a Google Hammer device.
> =20
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index ee5dfb5aee2a..42a224d08ec7 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -1336,7 +1336,7 @@ config I2C_SIBYTE
> =20
>  config I2C_CROS_EC_TUNNEL
>  	tristate "ChromeOS EC tunnel I2C bus"
> -	depends on MFD_CROS_EC
> +	depends on CROS_EC
>  	help
>  	  If you say yes here you get an I2C bus that will tunnel i2c commands
>  	  through to the other side of the ChromeOS EC to the i2c bus
> diff --git a/drivers/iio/common/cros_ec_sensors/Kconfig b/drivers/iio/com=
mon/cros_ec_sensors/Kconfig
> index f9bf7ff7fcaf..55999104cd44 100644
> --- a/drivers/iio/common/cros_ec_sensors/Kconfig
> +++ b/drivers/iio/common/cros_ec_sensors/Kconfig
> @@ -4,7 +4,7 @@
>  #
>  config IIO_CROS_EC_SENSORS_CORE
>  	tristate "ChromeOS EC Sensors Core"
> -	depends on SYSFS && MFD_CROS_EC
> +	depends on SYSFS && CROS_EC
>  	select IIO_BUFFER
>  	select IIO_TRIGGERED_BUFFER
>  	help
> diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kcon=
fig
> index 7c4f19dab34f..64555cc8d83e 100644
> --- a/drivers/input/keyboard/Kconfig
> +++ b/drivers/input/keyboard/Kconfig
> @@ -729,7 +729,7 @@ config KEYBOARD_W90P910
>  config KEYBOARD_CROS_EC
>  	tristate "ChromeOS EC keyboard"
>  	select INPUT_MATRIXKMAP
> -	depends on MFD_CROS_EC
> +	depends on CROS_EC
>  	help
>  	  Say Y here to enable the matrix keyboard used by ChromeOS devices
>  	  and implemented on the ChromeOS EC. You must enable one bus option
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kcon=
fig
> index f2b5f27ebacb..adec7a0bfe1e 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -558,10 +558,9 @@ if CEC_PLATFORM_DRIVERS
> =20
>  config VIDEO_CROS_EC_CEC
>  	tristate "ChromeOS EC CEC driver"
> -	depends on MFD_CROS_EC
> +	depends on CROS_EC
>  	select CEC_CORE
>  	select CEC_NOTIFIER
> -	select CHROME_PLATFORMS
>  	select CROS_EC_PROTO
>  	help
>  	  If you say yes here you will get support for the
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index a17d275bf1d4..ad0a5de74ef2 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -211,21 +211,9 @@ config MFD_AXP20X_RSB
>  	  components like regulators or the PEK (Power Enable Key) under the
>  	  corresponding menus.
> =20
> -config MFD_CROS_EC
> -	tristate "ChromeOS Embedded Controller"
> -	select MFD_CORE
> -	select CHROME_PLATFORMS
> -	select CROS_EC_PROTO
> -	depends on X86 || ARM || ARM64 || COMPILE_TEST
> -	help
> -	  If you say Y here you get support for the ChromeOS Embedded
> -	  Controller (EC) providing keyboard, battery and power services.
> -	  You also need to enable the driver for the bus you are using. The
> -	  protocol for talking to the EC is defined by the bus driver.
> -
>  config MFD_CROS_EC_CHARDEV
>  	tristate "Chrome OS Embedded Controller userspace device interface"
> -	depends on MFD_CROS_EC
> +	depends on CROS_EC
>  	---help---
>  	  This driver adds support to talk with the ChromeOS EC from userspace.
> =20
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 52b1a90ff515..32327dc6bb45 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -13,8 +13,6 @@ obj-$(CONFIG_MFD_ASIC3)		+=3D asic3.o tmio_core.o
>  obj-$(CONFIG_ARCH_BCM2835)	+=3D bcm2835-pm.o
>  obj-$(CONFIG_MFD_BCM590XX)	+=3D bcm590xx.o
>  obj-$(CONFIG_MFD_BD9571MWV)	+=3D bd9571mwv.o
> -cros_ec_core-objs		:=3D cros_ec.o
> -obj-$(CONFIG_MFD_CROS_EC)	+=3D cros_ec_core.o
>  obj-$(CONFIG_MFD_CROS_EC_CHARDEV) +=3D cros_ec_dev.o
>  obj-$(CONFIG_MFD_EXYNOS_LPASS)	+=3D exynos-lpass.o
> =20
> diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kc=
onfig
> index 35bb5a2663f0..9417b982ad92 100644
> --- a/drivers/platform/chrome/Kconfig
> +++ b/drivers/platform/chrome/Kconfig
> @@ -50,9 +50,22 @@ config CHROMEOS_TBMC
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called chromeos_tbmc.
> =20
> +config CROS_EC
> +	tristate "ChromeOS Embedded Controller"
> +	select CROS_EC_PROTO
> +	depends on X86 || ARM || ARM64 || COMPILE_TEST
> +	help
> +	  If you say Y here you get support for the ChromeOS Embedded
> +	  Controller (EC) providing keyboard, battery and power services.
> +	  You also need to enable the driver for the bus you are using. The
> +	  protocol for talking to the EC is defined by the bus driver.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called cros_ec.
> +
>  config CROS_EC_I2C
>  	tristate "ChromeOS Embedded Controller (I2C)"
> -	depends on MFD_CROS_EC && I2C
> +	depends on CROS_EC && I2C
> =20
>  	help
>  	  If you say Y here, you get support for talking to the ChromeOS
> @@ -62,7 +75,7 @@ config CROS_EC_I2C
> =20
>  config CROS_EC_RPMSG
>  	tristate "ChromeOS Embedded Controller (rpmsg)"
> -	depends on MFD_CROS_EC && RPMSG && OF
> +	depends on CROS_EC && RPMSG && OF
>  	help
>  	  If you say Y here, you get support for talking to the ChromeOS EC
>  	  through rpmsg. This uses a simple byte-level protocol with a
> @@ -87,7 +100,7 @@ config CROS_EC_ISHTP
> =20
>  config CROS_EC_SPI
>  	tristate "ChromeOS Embedded Controller (SPI)"
> -	depends on MFD_CROS_EC && SPI
> +	depends on CROS_EC && SPI
> =20
>  	---help---
>  	  If you say Y here, you get support for talking to the ChromeOS EC
> @@ -97,7 +110,7 @@ config CROS_EC_SPI
> =20
>  config CROS_EC_LPC
>          tristate "ChromeOS Embedded Controller (LPC)"
> -        depends on MFD_CROS_EC && ACPI && (X86 || COMPILE_TEST)
> +        depends on CROS_EC && ACPI && (X86 || COMPILE_TEST)
>          help
>            If you say Y here, you get support for talking to the ChromeOS=
 EC
>            over an LPC bus. This uses a simple byte-level protocol with a
> diff --git a/drivers/platform/chrome/Makefile b/drivers/platform/chrome/M=
akefile
> index c5583c48d1e5..ebb57e21923b 100644
> --- a/drivers/platform/chrome/Makefile
> +++ b/drivers/platform/chrome/Makefile
> @@ -6,6 +6,7 @@ CFLAGS_cros_ec_trace.o:=3D		-I$(src)
>  obj-$(CONFIG_CHROMEOS_LAPTOP)		+=3D chromeos_laptop.o
>  obj-$(CONFIG_CHROMEOS_PSTORE)		+=3D chromeos_pstore.o
>  obj-$(CONFIG_CHROMEOS_TBMC)		+=3D chromeos_tbmc.o
> +obj-$(CONFIG_CROS_EC)			+=3D cros_ec.o
>  obj-$(CONFIG_CROS_EC_I2C)		+=3D cros_ec_i2c.o
>  obj-$(CONFIG_CROS_EC_ISHTP)		+=3D cros_ec_ishtp.o
>  obj-$(CONFIG_CROS_EC_RPMSG)		+=3D cros_ec_rpmsg.o
> diff --git a/drivers/mfd/cros_ec.c b/drivers/platform/chrome/cros_ec.c
> similarity index 100%
> rename from drivers/mfd/cros_ec.c
> rename to drivers/platform/chrome/cros_ec.c
> diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
> index dd7da41f230c..e05140771845 100644
> --- a/drivers/power/supply/Kconfig
> +++ b/drivers/power/supply/Kconfig
> @@ -656,7 +656,7 @@ config CHARGER_RT9455
> =20
>  config CHARGER_CROS_USBPD
>  	tristate "ChromeOS EC based USBPD charger"
> -	depends on MFD_CROS_EC
> +	depends on CROS_EC
>  	default n
>  	help
>  	  Say Y here to enable ChromeOS EC based USBPD charger
> diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> index dff5a93f7daa..99946e1bcc73 100644
> --- a/drivers/pwm/Kconfig
> +++ b/drivers/pwm/Kconfig
> @@ -145,7 +145,7 @@ config PWM_CRC
> =20
>  config PWM_CROS_EC
>  	tristate "ChromeOS EC PWM driver"
> -	depends on MFD_CROS_EC
> +	depends on CROS_EC
>  	help
>  	  PWM driver for exposing a PWM attached to the ChromeOS Embedded
>  	  Controller.
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 5c0790eed656..4eb311569fc4 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1265,7 +1265,7 @@ config RTC_DRV_ZYNQMP
> =20
>  config RTC_DRV_CROS_EC
>  	tristate "Chrome OS EC RTC driver"
> -	depends on MFD_CROS_EC
> +	depends on CROS_EC
>  	help
>  	  If you say yes here you will get support for the
>  	  Chrome OS Embedded Controller's RTC.
> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> index 8e3e86619b35..60086858e920 100644
> --- a/sound/soc/qcom/Kconfig
> +++ b/sound/soc/qcom/Kconfig
> @@ -99,7 +99,7 @@ config SND_SOC_MSM8996
> =20
>  config SND_SOC_SDM845
>  	tristate "SoC Machine driver for SDM845 boards"
> -	depends on QCOM_APR && MFD_CROS_EC && I2C
> +	depends on QCOM_APR && CROS_EC && I2C
>  	select SND_SOC_QDSP6
>  	select SND_SOC_QCOM_COMMON
>  	select SND_SOC_RT5663
> --=20
> 2.20.1
>=20

--uzslaa6eqheeobde
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl0ABngACgkQ2O7X88g7
+ppiZxAAkPyWH8otd6YGzBpExysE3M6GHgAv3pz1Hys+9AWwSWD9tTNfGCGRurHM
mDz6QP+qnl0L7+oUfIGdGg7TIvoCcTr2GhnXz4cRioKVwBh0jSplYXkc7oZ2hOYH
S4jFGAIohuK3VTHRS/HLN09x/pWlMeBlin8z0c+MkOqfGjgbJ+grZQGHc08NpT10
PdZOYeUVJ/qGS8SwemsiVViE0fAP8MmCE20P7IZLB1rXDNV5Bfn2QCLq/2XAg8U0
vxzQtkmdkK/UBG0UqzUsm/XIzhPcwmCQ6VP3R795a/+XhudcvgyvEvrxjvVU1yGG
jzHkai9QXTLaSBSjNNOaMsHasxmOL5Uu3axvseOWw+ApBTbvTKvfCc2GLHq3z/I7
qNGz5HhBcUqROda02V6j1e/0wfd7G7WFTVcyGoQ9kZ5wS0GSiJ796QklB2L7vSz2
W+qSSpkwRVATzymiD4VUgC05gLEfKIRY6igOw4mKjOdUmYUj4sYtqatBr9xqMFb5
vf1kV8S5Ijh9HkdtFsY3kqmZDCLBVOt7yXgDwNbDr2c2UTnS+tHFJPNJYNoLZfxi
tCOui/MkCOjBpJLwwXYG8ZVgsArgpUhQjQyr8QvxSG/zwTHEyHhxs7VOtkGAxik8
X0D2xKiI8f8IQtPWNyxTinR6PKGLlCcE7IZjFt6+urLJVKpvzIc=
=e829
-----END PGP SIGNATURE-----

--uzslaa6eqheeobde--

--===============4309480296154330662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4309480296154330662==--
