Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52897271DDE
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 10:25:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AFC217F6;
	Mon, 21 Sep 2020 10:24:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AFC217F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600676724;
	bh=vNTE0avxpKIo0jB24X7/2nVrOvpUbkZy0Ug8WGN4DR4=;
	h=Date:From:Subject:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W5NUvAV0eZqhST1gaRt9p2+N76t/R4G39o35MHiCmu2ypdptTBv+zzeBKqkL4gF0N
	 TPqfHt1AnA0r7A7aL4FZm6LABNxFxN29sqjKCvZ51b3rIXJfR1zsrPKqExXjvY4Klb
	 mrAv7/J1q9tQArJ+5BGYH3LHBxjvIVsiXQ4uPRUw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB477F8038E;
	Mon, 21 Sep 2020 10:11:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A1F7F80276; Thu, 17 Sep 2020 21:04:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58601F801EC
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 21:04:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58601F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="dyOMV3sQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1600369440; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L3OBK4G1Rvv8T0Xnqj3/8Lbig0kqsWBBjd0US1g/rPo=;
 b=dyOMV3sQSIuXwuaky8QYur2ywbBqBFDkh4I8lC8CviZwJ4xXUpL4z0HKUxmZFgT1wCRV+i
 lmglasQwXio0xAlmn9AwPeNsR0gejQ1N0ipvwaxZk7O7qZVgtm6UVhMbStHccEmV266mP4
 NNt/TuV+D6L8z9EtegHwMbZvBfl1a4o=
Date: Thu, 17 Sep 2020 21:03:36 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 09/13] dt-bindings: pinctrl: include common schema in
 GPIO controllers
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-Id: <0YGTGQ.TCQDDTXFCWNX2@crapouillou.net>
In-Reply-To: <20200917165301.23100-10-krzk@kernel.org>
References: <20200917165301.23100-1-krzk@kernel.org>
 <20200917165301.23100-10-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 21 Sep 2020 10:10:23 +0200
Cc: Amelie Delaunay <amelie.delaunay@st.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Linus Walleij <linus.walleij@linaro.org>, alsa-devel@alsa-project.org,
 Stefan Agner <stefan@agner.ch>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Chris Brandt <chris.brandt@renesas.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Anson Huang <Anson.Huang@nxp.com>, Lee Jones <lee.jones@linaro.org>,
 Takashi Iwai <tiwai@suse.com>, Magnus Damm <magnus.damm@gmail.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 NXP Linux Team <linux-imx@nxp.com>, Andy Teng <andy.teng@mediatek.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Sungbo Eo <mans0n@gorani.run>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@mediatek.com>,
 Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sricharan R <sricharan@codeaurora.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hoan Tran <hoan@os.amperecomputing.com>, linux-arm-kernel@lists.infradead.org,
 Niklas =?iso-8859-1?q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Scott Branden <sbranden@broadcom.com>, linux-unisoc@lists.infradead.org,
 - <patches@opensource.cirrus.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Liam Girdwood <lgirdwood@gmail.com>, Serge Semin <fancer.lancer@gmail.com>,
 linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Yash Shah <yash.shah@sifive.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Mark Brown <broonie@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-media@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>,
 Andreas =?iso-8859-1?q?F=E4rber?= <afaerber@suse.de>
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

Hi,


Le jeu. 17 sept. 2020 =E0 18:52, Krzysztof Kozlowski <krzk@kernel.org> a=20
=E9crit :
> Include the common GPIO schema in GPIO controllers to be sure all=20
> common
> properties are properly validated.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

>=20
> ---
>=20
> Changes since v1:
> 1. New patch
> ---
>  .../devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml      | 3=20
> +++
>  .../bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml          | 1 +
>  .../devicetree/bindings/pinctrl/cirrus,lochnagar.yaml          | 3=20
> +++
>  Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml | 3=20
> +++
>  .../devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml   | 3=20
> +++
>  Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml  | 3=20
> +++
>  .../devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml      | 3=20
> +++
>  .../devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml      | 3=20
> +++
>  .../devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml       | 3=20
> +++
>  .../devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml      | 3=20
> +++
>  .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml          | 3=20
> +++
>  11 files changed, 31 insertions(+)
>=20
> diff --git=20
> a/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml=20
> b/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
> index 33391d30c00c..51bfc214bba6 100644
> ---=20
> a/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
> +++=20
> b/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
> @@ -15,6 +15,9 @@ description: |
>    GPIO function selection & GPIO attributes configuration. Please=20
> refer to
>    pinctrl-bindings.txt in this directory for common binding part and=20
> usage.
>=20
> +allOf:
> +  - $ref: /schemas/gpio/gpio-common.yaml#
> +
>  properties:
>    compatible:
>      const: actions,s500-pinctrl
> diff --git=20
> a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.y=
aml=20
> b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.y=
aml
> index 7556be6e2754..55662f8d1f94 100644
> ---=20
> a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.y=
aml
> +++=20
> b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.y=
aml
> @@ -143,6 +143,7 @@ allOf:
>    # boards are defining it at the moment so it would generate a lot=20
> of
>    # warnings.
>=20
> +  - $ref: /schemas/gpio/gpio-common.yaml#
>    - if:
>        properties:
>          compatible:
> diff --git=20
> a/Documentation/devicetree/bindings/pinctrl/cirrus,lochnagar.yaml=20
> b/Documentation/devicetree/bindings/pinctrl/cirrus,lochnagar.yaml
> index 420d74856032..ed478b0ed4cc 100644
> --- a/Documentation/devicetree/bindings/pinctrl/cirrus,lochnagar.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/cirrus,lochnagar.yaml
> @@ -31,6 +31,9 @@ description: |
>    This binding must be part of the Lochnagar MFD binding:
>      [4] ../mfd/cirrus,lochnagar.yaml
>=20
> +allOf:
> +  - $ref: /schemas/gpio/gpio-common.yaml#
> +
>  properties:
>    compatible:
>      enum:
> diff --git=20
> a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml=20
> b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
> index 44c04d11ae4c..ffa64832b4f9 100644
> --- a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
> @@ -59,6 +59,9 @@ properties:
>  patternProperties:
>    "^gpio@[0-9]$":
>      type: object
> +    allOf:
> +      - $ref: /schemas/gpio/gpio-common.yaml#
> +
>      properties:
>        compatible:
>          enum:
> diff --git=20
> a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml=20
> b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> index 152c151c27ad..7d0a4cb96f39 100644
> ---=20
> a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> +++=20
> b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> @@ -14,6 +14,9 @@ description: |+
>    required property:
>    - compatible: "syscon"
>=20
> +allOf:
> +  - $ref: /schemas/gpio/gpio-common.yaml#
> +
>  properties:
>    compatible:
>      const: mediatek,mt6779-pinctrl
> diff --git=20
> a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml=20
> b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> index 5556def6b99b..bc8bc0ac1926 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> @@ -12,6 +12,9 @@ maintainers:
>  description: |
>    The Mediatek's Pin controller is used to control SoC pins.
>=20
> +allOf:
> +  - $ref: /schemas/gpio/gpio-common.yaml#
> +
>  properties:
>    compatible:
>      const: mediatek,mt8192-pinctrl
> diff --git=20
> a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml=20
> b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
> index c64c93206817..22a6b80b4c0e 100644
> ---=20
> a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
> +++=20
> b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
> @@ -13,6 +13,9 @@ description: |
>    This binding describes the Top Level Mode Multiplexer block found=20
> in the
>    IPQ6018 platform.
>=20
> +allOf:
> +  - $ref: /schemas/gpio/gpio-common.yaml#
> +
>  properties:
>    compatible:
>      const: qcom,ipq6018-pinctrl
> diff --git=20
> a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml=20
> b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
> index 1f0f5757f9e1..9855d859fe61 100644
> ---=20
> a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
> +++=20
> b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
> @@ -13,6 +13,9 @@ description: |
>    This binding describes the Top Level Mode Multiplexer block found=20
> in the
>    MSM8226 platform.
>=20
> +allOf:
> +  - $ref: /schemas/gpio/gpio-common.yaml#
> +
>  properties:
>    compatible:
>      const: qcom,msm8226-pinctrl
> diff --git=20
> a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml=20
> b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
> index 8508c57522fd..e5757b6ced40 100644
> ---=20
> a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
> +++=20
> b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
> @@ -13,6 +13,9 @@ description: |
>    This binding describes the Top Level Mode Multiplexer block found=20
> in the
>    SM8250 platform.
>=20
> +allOf:
> +  - $ref: /schemas/gpio/gpio-common.yaml#
> +
>  properties:
>    compatible:
>      const: qcom,sm8250-pinctrl
> diff --git=20
> a/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml=20
> b/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml
> index b7911a994f3a..4d7bf4340262 100644
> ---=20
> a/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml
> +++=20
> b/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml
> @@ -10,6 +10,9 @@ maintainers:
>    - Chris Brandt <chris.brandt@renesas.com>
>    - Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> +allOf:
> +  - $ref: /schemas/gpio/gpio-common.yaml#
> +
>  description:
>    The Renesas SoCs of the RZ/A2 series feature a combined Pin and=20
> GPIO
>    controller.
> diff --git=20
> a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml=20
> b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> index 72877544ca78..28b861362ba0 100644
> --- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> @@ -56,6 +56,9 @@ properties:
>  patternProperties:
>    '^gpio@[0-9a-f]*$':
>      type: object
> +    allOf:
> +      - $ref: /schemas/gpio/gpio-common.yaml#
> +
>      properties:
>        gpio-controller: true
>        '#gpio-cells':
> --
> 2.17.1
>=20


