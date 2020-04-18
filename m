Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F92F1AF842
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Apr 2020 09:42:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C90CC1670;
	Sun, 19 Apr 2020 09:41:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C90CC1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587282153;
	bh=1De5fPfA8NlpQyTocewa07h9s/10o7DRNH2qDVFvqA8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dNdLUe34ZMNH745OVFvdGz2JMKHEKwZhU2o5m0R6KfKVv5hCc1RwpaR12IKXzKGHK
	 3A8x4O4XrfFLD9XGH4DbpyLKUEdmwMKW0jQganbEh4LmA/uhJ1BRTnfOLSN123joQA
	 bs+Jb8K4LPwYr32f+pnADBDfwuYmDMJo9iDk9urs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D78F3F8029B;
	Sun, 19 Apr 2020 09:38:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66C9BF8014E; Sat, 18 Apr 2020 18:03:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25218F8012E
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 18:03:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25218F8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hCjq0MAZ"
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 265E021D93;
 Sat, 18 Apr 2020 16:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587225820;
 bh=1De5fPfA8NlpQyTocewa07h9s/10o7DRNH2qDVFvqA8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hCjq0MAZUj3JKbCWIjnXWIz9oU3vpGOMvk/gvn814KBjM6utN9lAFJL+B2m6MmgOb
 k0FKGfq6P773PBXkOofNwvIhcReneAEe9NcOSIdyxXFv35zQTjjLRM7pO4ATd9ITv9
 kAdnoppSvnbrv7agegq0zfHzkamIw7ZjHlwMbaT8=
Date: Sat, 18 Apr 2020 17:03:30 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: Remove cases of 'allOf' containing a
 '$ref'
Message-ID: <20200418170330.65bff80c@archlinux>
In-Reply-To: <20200416005549.9683-2-robh@kernel.org>
References: <20200416005549.9683-1-robh@kernel.org>
 <20200416005549.9683-2-robh@kernel.org>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 19 Apr 2020 09:38:23 +0200
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Sam Ravnborg <sam@ravnborg.org>,
 linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-remoteproc@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 linux-riscv@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, alsa-devel@alsa-project.org,
 Maxime Ripard <mripard@kernel.org>, linux-can@vger.kernel.org,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amit Kucheria <amit.kucheria@linaro.org>,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 netdev@vger.kernel.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 15 Apr 2020 19:55:49 -0500
Rob Herring <robh@kernel.org> wrote:

> json-schema versions draft7 and earlier have a weird behavior in that
> any keywords combined with a '$ref' are ignored (silently). The correct
> form was to put a '$ref' under an 'allOf'. This behavior is now changed
> in the 2019-09 json-schema spec and '$ref' can be mixed with other
> keywords. The json-schema library doesn't yet support this, but the
> tooling now does a fixup for this and either way works.
>=20
> This has been a constant source of review comments, so let's change this
> treewide so everyone copies the simpler syntax.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

A few unrelated white space changes in enums in the IIO chunks.

Don't suppose they matter but maybe need the description to mention there
may be some minor formatting changes as well in some cases.

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> #for-iio

> ---
>  .../devicetree/bindings/arm/cpus.yaml         |  81 +++---
>  .../devicetree/bindings/arm/l2c2x0.yaml       |  87 +++---
>  .../devicetree/bindings/arm/psci.yaml         |  15 +-
>  .../bindings/arm/samsung/exynos-chipid.yaml   |   5 +-
>  .../bus/allwinner,sun50i-a64-de2.yaml         |   5 +-
>  .../bindings/clock/fixed-factor-clock.yaml    |   5 +-
>  .../bindings/connector/usb-connector.yaml     |  28 +-
>  .../bindings/crypto/st,stm32-hash.yaml        |   9 +-
>  .../allwinner,sun4i-a10-display-engine.yaml   |   7 +-
>  .../display/allwinner,sun4i-a10-tcon.yaml     |   5 +-
>  .../bindings/display/panel/panel-common.yaml  |   5 +-
>  .../devicetree/bindings/dma/dma-common.yaml   |   3 +-
>  .../devicetree/bindings/dma/ti/k3-udma.yaml   |  18 +-
>  .../devicetree/bindings/eeprom/at24.yaml      |  11 +-
>  .../devicetree/bindings/example-schema.yaml   |  17 +-
>  .../bindings/hwmon/adi,ltc2947.yaml           |  32 +--
>  .../devicetree/bindings/hwmon/ti,tmp513.yaml  |  21 +-
>  .../devicetree/bindings/i2c/st,stm32-i2c.yaml |   9 +-
>  .../bindings/iio/adc/adi,ad7124.yaml          |   5 +-
>  .../bindings/iio/adc/lltc,ltc2496.yaml        |   3 +-
>  .../bindings/iio/adc/microchip,mcp3911.yaml   |   7 +-
>  .../bindings/iio/adc/st,stm32-dfsdm-adc.yaml  |  31 +-
>  .../bindings/iio/light/tsl2772.yaml           |  13 +-
>  .../bindings/iio/temperature/adi,ltc2983.yaml |  56 ++--

...

> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml b/=
Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml
> index 97087a45ce54..deb34deff0e8 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml
> @@ -83,9 +83,8 @@ patternProperties:
>            1: REFIN2(+)/REFIN2(=E2=88=92).
>            3: AVDD
>            If this field is left empty, internal reference is selected.
> -        allOf:
> -          - $ref: /schemas/types.yaml#/definitions/uint32
> -          - enum: [0, 1, 3]
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1, 3]
>=20
>        diff-channels:
>          description: see Documentation/devicetree/bindings/iio/adc/adc.t=
xt
> diff --git a/Documentation/devicetree/bindings/iio/adc/lltc,ltc2496.yaml =
b/Documentation/devicetree/bindings/iio/adc/lltc,ltc2496.yaml
> index 97f521d654ea..6a991e9f78e2 100644
> --- a/Documentation/devicetree/bindings/iio/adc/lltc,ltc2496.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/lltc,ltc2496.yaml
> @@ -18,8 +18,7 @@ properties:
>=20
>    vref-supply:
>      description: phandle to an external regulator providing the referenc=
e voltage
> -    allOf:
> -      - $ref: /schemas/types.yaml#/definitions/phandle
> +    $ref: /schemas/types.yaml#/definitions/phandle
>=20
>    reg:
>      description: spi chipselect number according to the usual spi bindin=
gs
> diff --git a/Documentation/devicetree/bindings/iio/adc/microchip,mcp3911.=
yaml b/Documentation/devicetree/bindings/iio/adc/microchip,mcp3911.yaml
> index 8ffeceb6abae..95ab285f4eba 100644
> --- a/Documentation/devicetree/bindings/iio/adc/microchip,mcp3911.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/microchip,mcp3911.yaml
> @@ -38,10 +38,9 @@ properties:
>=20
>    microchip,device-addr:
>      description: Device address when multiple MCP3911 chips are present =
on the same SPI bus.
> -    allOf:
> -      - $ref: /schemas/types.yaml#/definitions/uint32
> -      - enum: [0, 1, 2, 3]
> -      - default: 0
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2, 3]
> +    default: 0
>=20
>    vref-supply:
>      description: |
> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc=
.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> index b1627441a0b2..d69ca492d020 100644
> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> @@ -95,16 +95,14 @@ patternProperties:
>            On stm32h7 and stm32mp1:
>            - For st,stm32-dfsdm-adc: up to 8 channels numbered from 0 to =
7.
>            - For st,stm32-dfsdm-dmic: 1 channel numbered from 0 to 7.
> -        allOf:
> -          - $ref: /schemas/types.yaml#/definitions/uint32-array
> -          - items:
> -              minimum: 0
> -              maximum: 7
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        items:
> +          minimum: 0
> +          maximum: 7
>=20
>        st,adc-channel-names:
>          description: List of single-ended channel names.
> -        allOf:
> -          - $ref: /schemas/types.yaml#/definitions/string-array
> +        $ref: /schemas/types.yaml#/definitions/string-array
>=20
>        st,filter-order:
>          description: |
> @@ -112,11 +110,10 @@ patternProperties:
>            - 0: FastSinC
>            - [1-5]: order 1 to 5.
>            For audio purpose it is recommended to use order 3 to 5.
> -        allOf:
> -          - $ref: /schemas/types.yaml#/definitions/uint32
> -          - items:
> -              minimum: 0
> -              maximum: 5
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        items:
> +          minimum: 0
> +          maximum: 5
>=20
>        "#io-channel-cells":
>          const: 1
> @@ -129,9 +126,8 @@ patternProperties:
>            - "MANCH_R": manchester codec, rising edge =3D logic 0, fallin=
g edge =3D logic 1
>            - "MANCH_F": manchester codec, rising edge =3D logic 1, fallin=
g edge =3D logic 0
>          items:
> -          enum: [ SPI_R, SPI_F, MANCH_R, MANCH_F ]
> -        allOf:
> -          - $ref: /schemas/types.yaml#/definitions/non-unique-string-arr=
ay
> +          enum: [SPI_R, SPI_F, MANCH_R, MANCH_F]

I don't suppose it matters much but unrelated change.

> +        $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>=20
>        st,adc-channel-clk-src:
>          description: |
> @@ -141,9 +137,8 @@ patternProperties:
>            - "CLKOUT_F": internal SPI clock divided by 2 (falling edge).
>            - "CLKOUT_R": internal SPI clock divided by 2 (rising edge).
>          items:
> -          enum: [ CLKIN, CLKOUT, CLKOUT_F, CLKOUT_R ]

Unrelated change.

> -        allOf:
> -          - $ref: /schemas/types.yaml#/definitions/non-unique-string-arr=
ay
> +          enum: [CLKIN, CLKOUT, CLKOUT_F, CLKOUT_R]
> +        $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>=20
>        st,adc-alt-channel:
>          description:
> diff --git a/Documentation/devicetree/bindings/iio/light/tsl2772.yaml b/D=
ocumentation/devicetree/bindings/iio/light/tsl2772.yaml
> index e8f7d1ada57b..d81229857944 100644
> --- a/Documentation/devicetree/bindings/iio/light/tsl2772.yaml
> +++ b/Documentation/devicetree/bindings/iio/light/tsl2772.yaml
> @@ -33,13 +33,12 @@ properties:
>=20
>    amstaos,proximity-diodes:
>      description: Proximity diodes to enable
> -    allOf:
> -      - $ref: /schemas/types.yaml#/definitions/uint32-array
> -      - minItems: 1
> -        maxItems: 2
> -        items:
> -          minimum: 0
> -          maximum: 1
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      minimum: 0
> +      maximum: 1
>=20
>    interrupts:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/iio/temperature/adi,ltc298=
3.yaml b/Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml
> index 8fb46de6641d..9480ede59c37 100644
> --- a/Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml
> +++ b/Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml
> @@ -42,10 +42,9 @@ properties:
>        0 - 50/60Hz rejection
>        1 - 60Hz rejection
>        2 - 50Hz rejection
> -    allOf:
> -      - $ref: /schemas/types.yaml#/definitions/uint32
> -      - minimum: 0
> -        maximum: 2
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 2
>=20
>    '#address-cells':
>      const: 1
> @@ -91,8 +90,7 @@ patternProperties:
>            7 - Type T Thermocouple
>            8 - Type B Thermocouple
>            9 - Custom Thermocouple
> -        allOf:
> -          - $ref: /schemas/types.yaml#/definitions/uint32
> +        $ref: /schemas/types.yaml#/definitions/uint32
>          minimum: 1
>          maximum: 9
>=20
> @@ -121,8 +119,7 @@ patternProperties:
>            more details look at table 69 and 70.
>            Note should be signed, but dtc doesn't currently maintain the
>            sign.
> -        allOf:
> -          - $ref: /schemas/types.yaml#/definitions/uint64-matrix
> +        $ref: /schemas/types.yaml#/definitions/uint64-matrix
>          minItems: 3
>          maxItems: 64
>          items:
> @@ -138,8 +135,7 @@ patternProperties:
>      properties:
>        adi,sensor-type:
>          description: Identifies the sensor as a diode.
> -        allOf:
> -          - $ref: /schemas/types.yaml#/definitions/uint32
> +        $ref: /schemas/types.yaml#/definitions/uint32
>          const: 28
>=20
>        adi,single-ended:
> @@ -196,8 +192,7 @@ patternProperties:
>            16 - RTD PT-1000 (0.00375)
>            17 - RTD NI-120
>            18 - RTD Custom
> -        allOf:
> -          - $ref: /schemas/types.yaml#/definitions/uint32
> +        $ref: /schemas/types.yaml#/definitions/uint32
>          minimum: 10
>          maximum: 18
>=20
> @@ -210,9 +205,8 @@ patternProperties:
>          description:
>            Identifies the number of wires used by the RTD. Setting this
>            property to 5 means 4 wires with Kelvin Rsense.
> -        allOf:
> -          - $ref: /schemas/types.yaml#/definitions/uint32
> -          - enum: [2, 3, 4, 5]
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [2, 3, 4, 5]
>=20
>        adi,rsense-share:
>          description:
> @@ -237,18 +231,16 @@ patternProperties:
>          description:
>            This property set the RTD curve used and the corresponding
>            Callendar-VanDusen constants. Look at table 30 of the datashee=
t.
> -        allOf:
> -          - $ref: /schemas/types.yaml#/definitions/uint32
> -          - minimum: 0
> -            maximum: 3
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 3
>=20
>        adi,custom-rtd:
>          description:
>            This is a table, where each entry should be a pair of
>            resistance(ohm)-temperature(K). The entries added here are in =
uohm
>            and uK. For more details values look at table 74 and 75.
> -        allOf:
> -          - $ref: /schemas/types.yaml#/definitions/uint64-matrix
> +        $ref: /schemas/types.yaml#/definitions/uint64-matrix
>          items:
>            minItems: 3
>            maxItems: 64
> @@ -280,8 +272,7 @@ patternProperties:
>            25 - Thermistor Spectrum 1003k 1kohm
>            26 - Thermistor Custom Steinhart-Hart
>            27 - Custom Thermistor
> -        allOf:
> -          - $ref: /schemas/types.yaml#/definitions/uint32
> +        $ref: /schemas/types.yaml#/definitions/uint32
>          minimum: 19
>          maximum: 27
>=20
> @@ -314,10 +305,9 @@ patternProperties:
>            This property controls the magnitude of the excitation current
>            applied to the thermistor. Value 0 set's the sensor in auto-ra=
nge
>            mode.
> -        allOf:
> -          - $ref: /schemas/types.yaml#/definitions/uint32
> -          - enum: [0, 250, 500, 1000, 5000, 10000, 25000, 50000, 100000,
> -                   250000, 500000, 1000000]
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 250, 500, 1000, 5000, 10000, 25000, 50000, 100000, 250=
000,
> +          500000, 1000000]
>=20
>        adi,custom-thermistor:
>          description:
> @@ -325,8 +315,7 @@ patternProperties:
>            resistance(ohm)-temperature(K). The entries added here are in =
uohm
>            and uK only for custom thermistors. For more details look at t=
able
>            78 and 79.
> -        allOf:
> -          - $ref: /schemas/types.yaml#/definitions/uint64-matrix
> +        $ref: /schemas/types.yaml#/definitions/uint64-matrix
>          minItems: 3
>          maxItems: 64
>          items:
> @@ -339,8 +328,7 @@ patternProperties:
>            be programmed into the device memory using this property. For
>            Steinhart sensors the coefficients are given in the raw
>            format. Look at table 82 for more information.
> -        allOf:
> -          - $ref: /schemas/types.yaml#/definitions/uint32-array
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
>          items:
>            minItems: 6
>            maxItems: 6
> @@ -358,8 +346,7 @@ patternProperties:
>      properties:
>        adi,sensor-type:
>          description: Identifies the sensor as a direct adc.
> -        allOf:
> -          - $ref: /schemas/types.yaml#/definitions/uint32
> +        $ref: /schemas/types.yaml#/definitions/uint32
>          const: 30
>=20
>        adi,single-ended:
> @@ -379,8 +366,7 @@ patternProperties:
>=20
>        adi,sensor-type:
>          description: Identifies the sensor as a rsense.
> -        allOf:
> -          - $ref: /schemas/types.yaml#/definitions/uint32
> +        $ref: /schemas/types.yaml#/definitions/uint32
>          const: 29
>=20
>        adi,rsense-val-milli-ohms:
> diff --git a/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-=
lradc-keys.yaml b/Documentation/devicetree/bindings/input/allwinner,sun4i-a=
10-lradc-keys.yaml
> index 512a6af5aa42..cffd02028d02 100644
> --- a/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-k=
eys.yaml
> +++ b/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-k=
eys.yaml
> @@ -42,9 +42,8 @@ patternProperties:
>          description: Keycode to emit
>=20
>        channel:
> -        allOf:
> -          - $ref: /schemas/types.yaml#/definitions/uint32
> -          - enum: [0, 1]
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1]
>          description: ADC Channel this key is attached to
>=20
>        voltage:
> diff --git a/Documentation/devicetree/bindings/input/input.yaml b/Documen=
tation/devicetree/bindings/input/input.yaml
> index 6d519046b3af..8edcb3c31270 100644
> --- a/Documentation/devicetree/bindings/input/input.yaml
> +++ b/Documentation/devicetree/bindings/input/input.yaml
> @@ -18,11 +18,10 @@ properties:
>      description:
>        Specifies an array of numeric keycode values to be used for report=
ing
>        button presses.
> -    allOf:
> -      - $ref: /schemas/types.yaml#/definitions/uint32-array
> -      - items:
> -          minimum: 0
> -          maximum: 0xff
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    items:
> +      minimum: 0
> +      maximum: 0xff
>=20
>    poll-interval:
>      description: Poll interval time in milliseconds.
...
