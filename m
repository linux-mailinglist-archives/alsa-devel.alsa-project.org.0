Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FD73A0B3
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Jun 2019 18:43:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06F86166C;
	Sat,  8 Jun 2019 18:42:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06F86166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560012205;
	bh=n6KLnXQwrT6VP5AyEMxoQJiP5ZOHLPwFoIuilfnZw6Y=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jYbiiWwiats6cwEvb3SkAr6tEcvq0kjiAhS2QL4R5H6yD3gfTmXTZsb8FsEWiglDT
	 M302pEnKpfmEiyHum/wefq8seg4s6Tkrr8O9Vjg97g6LD49tmlAuJRSKbN7fgp4Yn2
	 SRcoORKcf22cJZ5IKVaJ056aBnmuJKsJJ4f7Cu0A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE307F80709;
	Sat,  8 Jun 2019 18:39:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE101F896DD; Wed,  5 Jun 2019 10:31:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F346F808E7
 for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2019 10:31:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F346F808E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="i9sPC396"
Received: by mail-wr1-x442.google.com with SMTP id f9so3791266wre.12
 for <alsa-devel@alsa-project.org>; Wed, 05 Jun 2019 01:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OYOtyICLqyElpOBMvK8sf5u8hIXZLfqDtcEf0oFHn+M=;
 b=i9sPC396sQApX0FetBF/xqpDWPii7WGxLnEoXTyiPO4YWr4RbsJqLQx/NTQ4GYaBS9
 /seSi/+evHpl9mPiTRZfhvMSmt3fsNZz6etj2bM1du91T0nm9EgMS7QRQ+PKzz45hKVc
 rmy3CtEtqJZn9SSBpvtkPunSF3rWb4B2n1miAVbCnd4D7sw0ANab/AHVb/YHpm7RTLUd
 e5CZA+ROOAAN2Rx8Pbk9wJS6XnC1mtLmKzX1VEmmLyuaVpKHXgRO+eCibIYg3T2d5Vtc
 7wuVWYBl49v+lC7iE65GQR/TJz1vLCAai22OyOruqm30VnwH1CgXSPY+y4Op2Ftw8rb5
 3nlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OYOtyICLqyElpOBMvK8sf5u8hIXZLfqDtcEf0oFHn+M=;
 b=g5vT77zSAKXkC/OQLFagjNntHIaeptZHiw8JKhmkmOglDLW0RkpXwO1M7ky8Q7fbuR
 qoryY4u2CI62OLkECuTF8d3racGZQ2G7cywSN2VzzETWlqM9wyzXaiIOfWEnAumXVgbw
 itW+3xOozeVv5TLyEcFZlcKM7akYMhhTsFWxEEbOdU6UjllV2ogewUtJjsum8pZ4AWyw
 r2DM1TUtV6XH1ZaceTCT7KrHcMcmj520h6fsIkEjgQjGIjYP/rDnS//rw2vRMK+584a4
 clP5jv7khdE6/OnVDiGyiuldXSgZOo6G4d4wiD9nBk/iJ/fnkbsXaV8ZdY+RCBLn+3Ml
 MwEw==
X-Gm-Message-State: APjAAAVYK1pNj2VZ3AmFV2V2MdnYUHNEsJ//iowCr3UjJS6vmjfV7qey
 5UDFDHdVHfbrm4ldoB6Ccvw=
X-Google-Smtp-Source: APXvYqxEOIme15Xi7/9IcpKgAWqdBx9GyA0v+jTnUU+rvChfSatxYZjtVWMR1woo04IBEFFCG0MKpQ==
X-Received: by 2002:a5d:4f8b:: with SMTP id d11mr8093347wru.264.1559723492580; 
 Wed, 05 Jun 2019 01:31:32 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
 by smtp.gmail.com with ESMTPSA id 197sm19703374wma.36.2019.06.05.01.31.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 05 Jun 2019 01:31:31 -0700 (PDT)
Date: Wed, 5 Jun 2019 10:31:30 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <20190605083130.GC10944@ulmo>
References: <20190604152019.16100-1-enric.balletbo@collabora.com>
 <20190604152019.16100-3-enric.balletbo@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20190604152019.16100-3-enric.balletbo@collabora.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Sat, 08 Jun 2019 18:39:50 +0200
Cc: gwendal@chromium.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Vignesh R <vigneshr@ti.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Wolfram Sang <wsa@the-dreams.de>, linux-iio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Juergen Fitschen <jfi@ssv-embedded.de>,
 alsa-devel@alsa-project.org, Stefan Agner <stefan@agner.ch>,
 Sebastian Reichel <sre@kernel.org>,
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
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 Ettore Chimenti <ek5.chimenti@gmail.com>, linux-pwm@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Jiri Kosina <jikos@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>,
 Florian Fainelli <f.fainelli@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Benson Leung <bleung@chromium.org>,
 Douglas Anderson <dianders@chromium.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ajay Gupta <ajayg@nvidia.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Elie Morisse <syniurge@gmail.com>,
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
Content-Type: multipart/mixed; boundary="===============9163445621879607833=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============9163445621879607833==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="i7F3eY7HS/tUJxUd"
Content-Disposition: inline


--i7F3eY7HS/tUJxUd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2019 at 05:20:11PM +0200, Enric Balletbo i Serra wrote:
> Now, the ChromeOS EC core driver has nothing related to an MFD device, so
> move that driver from the MFD subsystem to the platform/chrome subsystem.
>=20
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
>=20
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
[...]
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

Acked-by: Thierry Reding <thierry.reding@gmail.com>

--i7F3eY7HS/tUJxUd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz3feIACgkQ3SOs138+
s6Gy8BAAkwnYWSW1eAUYvq+hgX/m5frnbMQpHfgHuzP1fIoXXZAIP2aZmQ8jzens
bbiMtRR63rGaYjCMdalUKbxtH6ogZFHx+aiH/cZVHNr+rW198oW3/nGoWG05uVBq
WH0mlDsfAQ3/sR1hcUUhvCiPh+oExShLhOYz8zTJKHIHwtSDt8ep0yIOKPVKwknW
mIT7n2RFSSRvXaJ7RnuG61YPKk+BoJZ2X7BKkYKynAsBAQgyFSHOqOSLl6+JiNRZ
6pKL0uxqbf/x7b0FxrbToI0h8KzTi6kzccBznW/wgs92Ta/rxHx//7NZmFlNMuIR
c6nAIXY2msir5vVnflr2wn5tdzaQN35lWchGOEyiIiBgJntYAlR1AOPpdCSpkcUU
6BBH6YfFfvsBmioBshMFiFM7gVYRMvE1FSPJjfqWXe4qjyTZN2Yi/oaD6FkB9HoW
T8p9ORKVUKsRCt11RF1tt6AnpZoSXBYMZOaENDTIsS+PDyXdYJNLqPHWo6S1C5qh
Mb8zCBwgoxRek4DUsvi5l4QFiJ/I28zrwDq5cyMqVn8IJCNfGezRIgLpvN4E6LHn
tIWlBwUiVzsoCRy0OpQ5xPLn4H2ExNgVN+tc8P83kAmw9wPyo5agzN24dywWGvEI
kDcf6Sw7cyd0yyR7XTjglPxQHb5t2UX/HHXEoSeXY7TBfGU1YgY=
=oUZw
-----END PGP SIGNATURE-----

--i7F3eY7HS/tUJxUd--

--===============9163445621879607833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============9163445621879607833==--
