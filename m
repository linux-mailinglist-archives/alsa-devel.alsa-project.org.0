Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 647216A77E4
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Mar 2023 00:45:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4334D11C;
	Thu,  2 Mar 2023 00:44:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4334D11C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677714305;
	bh=F+cZ+xDuekZhvpQI6VN6wkOdiaibL0XhB6hG3ryOj8E=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QrdkasUrc76rwUI79pqZaC5Tbc5UtLBm68tx/cezBfIFXguBJ7mRixw/elFHS3ZMh
	 gmRkf3XX4zf+8ncgBOEfqBk2RaPk2f89KC+RQmJOa1XTDE9z91T0tFDYszL9jdhl/H
	 8QQ/ggPhEiBxT3VqnOLeHrKlt1MGBd3DO1e/rOdo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E479F80310;
	Thu,  2 Mar 2023 00:44:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F4D9F8049C; Thu,  2 Mar 2023 00:44:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3800CF80236
	for <alsa-devel@alsa-project.org>; Thu,  2 Mar 2023 00:43:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3800CF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=dzCs/Tm9
Received: from mercury (unknown [185.254.75.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 011E566023A1;
	Wed,  1 Mar 2023 23:43:53 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677714233;
	bh=F+cZ+xDuekZhvpQI6VN6wkOdiaibL0XhB6hG3ryOj8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dzCs/Tm9RSF8obSF20Si7kicthqzvDNKc0LEyZ/LT3XbIHWQZIVgfzN4ExOkzO8NJ
	 lWUfgMqSTjI9TkKkd040M1hY1jQDw4TxO6favlO1RPjGjfCPWRRLqk6aOslCKf6e3o
	 i2+/FqlsKmBk8NuTMrgB4hdqMg33alpN0gwEz7wtzNDNAFKJpjmnTvhJyVSnpSKzuu
	 hu4bn5l4fnOEMFIDMpShkAoNaJjXy1lU+1fV6CpYhB896ljnVwaJD69yd3bwEmZgek
	 kaBy3VsggBld0JJRhg8GtDkJJpjlysSQxCTVEJqJJXotG5InA+EG6D1sq97Kf2wxxz
	 gsB3GMOtnNeLQ==
Received: by mercury (Postfix, from userid 1000)
	id 30A9D1061E59; Thu,  2 Mar 2023 00:43:50 +0100 (CET)
Date: Thu, 2 Mar 2023 00:43:50 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Fix SPI and I2C bus node names in examples
Message-ID: <4c4b6904-69b8-4e33-9c35-a5a6a855528d@mercury.local>
References: <20230228215433.3944508-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iicycb2qvy4rthvm"
Content-Disposition: inline
In-Reply-To: <20230228215433.3944508-1-robh@kernel.org>
Message-ID-Hash: XKFTBTL3XHZ3VERDNXMMYVLP5LDHOZDB
X-Message-ID-Hash: XKFTBTL3XHZ3VERDNXMMYVLP5LDHOZDB
X-MailFrom: sebastian.reichel@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Stephen Boyd <sboyd@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Wolfgang Grandegger <wg@grandegger.com>, Kalle Valo <kvalo@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-media@vger.kernel.org, netdev@vger.kernel.org,
 linux-can@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-pm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XKFTBTL3XHZ3VERDNXMMYVLP5LDHOZDB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--iicycb2qvy4rthvm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 28, 2023 at 03:54:33PM -0600, Rob Herring wrote:
> SPI and I2C bus node names are expected to be "spi" or "i2c",
> respectively, with nothing else, a unit-address, or a '-N' index. A
> pattern of 'spi0' or 'i2c0' or similar has crept in. Fix all these
> cases. Mostly scripted with the following commands:
>=20
> git grep -l '\si2c[0-9] {' Documentation/devicetree/ | xargs sed -i -e 's=
/i2c[0-9] {/i2c {/'
> git grep -l '\sspi[0-9] {' Documentation/devicetree/ | xargs sed -i -e 's=
/spi[0-9] {/spi {/'
>=20
> With this, a few errors in examples were exposed and fixed.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com> # for power-s=
upply

-- Sebastian

=2E..

>  .../devicetree/bindings/power/supply/bq2415x.yaml |  2 +-
>  .../devicetree/bindings/power/supply/bq24190.yaml |  2 +-
>  .../devicetree/bindings/power/supply/bq24257.yaml |  4 ++--
>  .../devicetree/bindings/power/supply/bq24735.yaml |  2 +-
>  .../devicetree/bindings/power/supply/bq2515x.yaml |  2 +-
>  .../devicetree/bindings/power/supply/bq25890.yaml |  2 +-
>  .../devicetree/bindings/power/supply/bq25980.yaml |  2 +-
>  .../devicetree/bindings/power/supply/bq27xxx.yaml | 15 ++++++++-------
>  .../bindings/power/supply/lltc,ltc294x.yaml       |  2 +-
>  .../bindings/power/supply/ltc4162-l.yaml          |  2 +-
>  .../bindings/power/supply/maxim,max14656.yaml     |  2 +-
>  .../bindings/power/supply/maxim,max17040.yaml     |  4 ++--
>  .../bindings/power/supply/maxim,max17042.yaml     |  2 +-
>  .../bindings/power/supply/richtek,rt9455.yaml     |  2 +-
>  .../bindings/power/supply/ti,lp8727.yaml          |  2 +-

=2E..

> diff --git a/Documentation/devicetree/bindings/power/supply/bq2415x.yaml =
b/Documentation/devicetree/bindings/power/supply/bq2415x.yaml
> index f7287ffd4b12..13822346e708 100644
> --- a/Documentation/devicetree/bindings/power/supply/bq2415x.yaml
> +++ b/Documentation/devicetree/bindings/power/supply/bq2415x.yaml
> @@ -77,7 +77,7 @@ additionalProperties: false
> =20
>  examples:
>    - |
> -    i2c0 {
> +    i2c {
>        #address-cells =3D <1>;
>        #size-cells =3D <0>;
> =20
> diff --git a/Documentation/devicetree/bindings/power/supply/bq24190.yaml =
b/Documentation/devicetree/bindings/power/supply/bq24190.yaml
> index 001c0ffb408d..d3ebc9de8c0b 100644
> --- a/Documentation/devicetree/bindings/power/supply/bq24190.yaml
> +++ b/Documentation/devicetree/bindings/power/supply/bq24190.yaml
> @@ -75,7 +75,7 @@ examples:
>        charge-term-current-microamp =3D <128000>;
>      };
> =20
> -    i2c0 {
> +    i2c {
>        #address-cells =3D <1>;
>        #size-cells =3D <0>;
> =20
> diff --git a/Documentation/devicetree/bindings/power/supply/bq24257.yaml =
b/Documentation/devicetree/bindings/power/supply/bq24257.yaml
> index cc45939d385b..eb064bbf876c 100644
> --- a/Documentation/devicetree/bindings/power/supply/bq24257.yaml
> +++ b/Documentation/devicetree/bindings/power/supply/bq24257.yaml
> @@ -84,7 +84,7 @@ examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
>      #include <dt-bindings/interrupt-controller/irq.h>
> -    i2c0 {
> +    i2c {
>        #address-cells =3D <1>;
>        #size-cells =3D <0>;
> =20
> @@ -104,7 +104,7 @@ examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
>      #include <dt-bindings/interrupt-controller/irq.h>
> -    i2c0 {
> +    i2c {
>        #address-cells =3D <1>;
>        #size-cells =3D <0>;
> =20
> diff --git a/Documentation/devicetree/bindings/power/supply/bq24735.yaml =
b/Documentation/devicetree/bindings/power/supply/bq24735.yaml
> index 388ee16f8a1e..af41e7ccd784 100644
> --- a/Documentation/devicetree/bindings/power/supply/bq24735.yaml
> +++ b/Documentation/devicetree/bindings/power/supply/bq24735.yaml
> @@ -77,7 +77,7 @@ examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> =20
> -    i2c0 {
> +    i2c {
>        #address-cells =3D <1>;
>        #size-cells =3D <0>;
> =20
> diff --git a/Documentation/devicetree/bindings/power/supply/bq2515x.yaml =
b/Documentation/devicetree/bindings/power/supply/bq2515x.yaml
> index 1a1b240034ef..845822c87f2a 100644
> --- a/Documentation/devicetree/bindings/power/supply/bq2515x.yaml
> +++ b/Documentation/devicetree/bindings/power/supply/bq2515x.yaml
> @@ -73,7 +73,7 @@ examples:
>        constant-charge-voltage-max-microvolt =3D <4000000>;
>      };
>      #include <dt-bindings/gpio/gpio.h>
> -    i2c0 {
> +    i2c {
>        #address-cells =3D <1>;
>        #size-cells =3D <0>;
> =20
> diff --git a/Documentation/devicetree/bindings/power/supply/bq25890.yaml =
b/Documentation/devicetree/bindings/power/supply/bq25890.yaml
> index dae27e93af09..0ad302ab2bcc 100644
> --- a/Documentation/devicetree/bindings/power/supply/bq25890.yaml
> +++ b/Documentation/devicetree/bindings/power/supply/bq25890.yaml
> @@ -102,7 +102,7 @@ unevaluatedProperties: false
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/irq.h>
> -    i2c0 {
> +    i2c {
>        #address-cells =3D <1>;
>        #size-cells =3D <0>;
> =20
> diff --git a/Documentation/devicetree/bindings/power/supply/bq25980.yaml =
b/Documentation/devicetree/bindings/power/supply/bq25980.yaml
> index b687b8bcd705..b70ce8d7f86c 100644
> --- a/Documentation/devicetree/bindings/power/supply/bq25980.yaml
> +++ b/Documentation/devicetree/bindings/power/supply/bq25980.yaml
> @@ -95,7 +95,7 @@ examples:
>      };
>      #include <dt-bindings/gpio/gpio.h>
>      #include <dt-bindings/interrupt-controller/irq.h>
> -    i2c0 {
> +    i2c {
>        #address-cells =3D <1>;
>        #size-cells =3D <0>;
> =20
> diff --git a/Documentation/devicetree/bindings/power/supply/bq27xxx.yaml =
b/Documentation/devicetree/bindings/power/supply/bq27xxx.yaml
> index 347d4433adc5..309ea33b5b25 100644
> --- a/Documentation/devicetree/bindings/power/supply/bq27xxx.yaml
> +++ b/Documentation/devicetree/bindings/power/supply/bq27xxx.yaml
> @@ -75,15 +75,16 @@ additionalProperties: false
> =20
>  examples:
>    - |
> -    i2c0 {
> +    bat: battery {
> +      compatible =3D "simple-battery";
> +      voltage-min-design-microvolt =3D <3200000>;
> +      energy-full-design-microwatt-hours =3D <5290000>;
> +      charge-full-design-microamp-hours =3D <1430000>;
> +    };
> +
> +    i2c {
>        #address-cells =3D <1>;
>        #size-cells =3D <0>;
> -      bat: battery {
> -        compatible =3D "simple-battery";
> -        voltage-min-design-microvolt =3D <3200000>;
> -        energy-full-design-microwatt-hours =3D <5290000>;
> -        charge-full-design-microamp-hours =3D <1430000>;
> -      };
> =20
>        bq27510g3: fuel-gauge@55 {
>          compatible =3D "ti,bq27510g3";
> diff --git a/Documentation/devicetree/bindings/power/supply/lltc,ltc294x.=
yaml b/Documentation/devicetree/bindings/power/supply/lltc,ltc294x.yaml
> index 774582cd3a2c..e68a97cb49fe 100644
> --- a/Documentation/devicetree/bindings/power/supply/lltc,ltc294x.yaml
> +++ b/Documentation/devicetree/bindings/power/supply/lltc,ltc294x.yaml
> @@ -54,7 +54,7 @@ additionalProperties: false
> =20
>  examples:
>    - |
> -    i2c0 {
> +    i2c {
>        #address-cells =3D <1>;
>        #size-cells =3D <0>;
>        battery@64 {
> diff --git a/Documentation/devicetree/bindings/power/supply/ltc4162-l.yam=
l b/Documentation/devicetree/bindings/power/supply/ltc4162-l.yaml
> index cfffaeef8b09..29d536541152 100644
> --- a/Documentation/devicetree/bindings/power/supply/ltc4162-l.yaml
> +++ b/Documentation/devicetree/bindings/power/supply/ltc4162-l.yaml
> @@ -54,7 +54,7 @@ additionalProperties: false
> =20
>  examples:
>    - |
> -    i2c0 {
> +    i2c {
>        #address-cells =3D <1>;
>        #size-cells =3D <0>;
>        charger: battery-charger@68 {
> diff --git a/Documentation/devicetree/bindings/power/supply/maxim,max1465=
6.yaml b/Documentation/devicetree/bindings/power/supply/maxim,max14656.yaml
> index 711066b8cdb9..b444b799848e 100644
> --- a/Documentation/devicetree/bindings/power/supply/maxim,max14656.yaml
> +++ b/Documentation/devicetree/bindings/power/supply/maxim,max14656.yaml
> @@ -32,7 +32,7 @@ additionalProperties: false
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/irq.h>
> -    i2c0 {
> +    i2c {
>        #address-cells =3D <1>;
>        #size-cells =3D <0>;
> =20
> diff --git a/Documentation/devicetree/bindings/power/supply/maxim,max1704=
0.yaml b/Documentation/devicetree/bindings/power/supply/maxim,max17040.yaml
> index 3a529326ecbd..2627cd3eed83 100644
> --- a/Documentation/devicetree/bindings/power/supply/maxim,max17040.yaml
> +++ b/Documentation/devicetree/bindings/power/supply/maxim,max17040.yaml
> @@ -68,7 +68,7 @@ unevaluatedProperties: false
> =20
>  examples:
>    - |
> -    i2c0 {
> +    i2c {
>        #address-cells =3D <1>;
>        #size-cells =3D <0>;
> =20
> @@ -82,7 +82,7 @@ examples:
>      };
>    - |
>      #include <dt-bindings/interrupt-controller/irq.h>
> -    i2c0 {
> +    i2c {
>        #address-cells =3D <1>;
>        #size-cells =3D <0>;
> =20
> diff --git a/Documentation/devicetree/bindings/power/supply/maxim,max1704=
2.yaml b/Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml
> index 64a0edb7bc47..085e2504d0dc 100644
> --- a/Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml
> +++ b/Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml
> @@ -69,7 +69,7 @@ additionalProperties: false
> =20
>  examples:
>    - |
> -    i2c0 {
> +    i2c {
>        #address-cells =3D <1>;
>        #size-cells =3D <0>;
> =20
> diff --git a/Documentation/devicetree/bindings/power/supply/richtek,rt945=
5.yaml b/Documentation/devicetree/bindings/power/supply/richtek,rt9455.yaml
> index 27bebc1757ba..07e38be39f1b 100644
> --- a/Documentation/devicetree/bindings/power/supply/richtek,rt9455.yaml
> +++ b/Documentation/devicetree/bindings/power/supply/richtek,rt9455.yaml
> @@ -68,7 +68,7 @@ additionalProperties: false
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/irq.h>
> -    i2c0 {
> +    i2c {
>        #address-cells =3D <1>;
>        #size-cells =3D <0>;
> =20
> diff --git a/Documentation/devicetree/bindings/power/supply/ti,lp8727.yam=
l b/Documentation/devicetree/bindings/power/supply/ti,lp8727.yaml
> index ce6fbdba8f6b..3a9e4310b433 100644
> --- a/Documentation/devicetree/bindings/power/supply/ti,lp8727.yaml
> +++ b/Documentation/devicetree/bindings/power/supply/ti,lp8727.yaml
> @@ -61,7 +61,7 @@ additionalProperties: false
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/irq.h>
> -    i2c0 {
> +    i2c {
>        #address-cells =3D <1>;
>        #size-cells =3D <0>;
> =20

=2E..

--iicycb2qvy4rthvm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmP/4zIACgkQ2O7X88g7
+pqxgBAAj3F4gb6RlI0Z6x4ZQhCWN+DLukelA2aUhkYhJyBC2UXCy5KWL1cNzB6P
Y/hjl2FRmX0zNrcfRZ8kPynFwBHGbqcob8mgiAmOxCCFjczYKEIBMDbV3dZ6RDPA
gz2uAVm2ioYkgXNjee6TC9knDQ34wmmkR1MwV2u7V4YVH/Xvxu164dQE1ZAeMs8I
dXJByJltLKNqRQtOQabhGSP3+6//tZ3Cu/b+Zmdk+f+r+VTvvsWH+rJlxLKJbiE3
znCN7kp3Ty1yvzd8PgM+MDt0o4mXlnfcfX5Vb+PtVTwMMJVtHvCFDYZL2Z71mwQr
8R49nVhm4pkHMpI5nZz/eYXmrsU/hpRBSVbLhd+oSNI76YqPpm/+xGWKF5JZgMIm
YAxRZjxs45EP2ST8nMa7/SYXygYCp9qekwcN39+IV2LSgRkjo1Iz+qJn5sOXvYMb
dJ/q0IGA8cWQ4lG3LNzwAVkfQMzfw8OFFxbTVxDFDVBM/mAHr06M86TGcLyGEYxa
r5YDSv8596Ep4y67xHrdzXCLASbYgQANlOBoNkX/ZMm3YcCGXsHSl/DQdGw5KSEr
4zeoAsdANn6jGsLJurLrMFXTXcKMUEk9vHjE+N+bEjBxrMFQ9QyIk9d5MlCdp1Tn
ptHuPPrunQ82d7+YC/fRCc28y/rDpEOlrFfdXej3Z3IJIkLQusE=
=cMEP
-----END PGP SIGNATURE-----

--iicycb2qvy4rthvm--
