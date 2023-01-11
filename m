Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3267D666110
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 17:56:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEE8DDEB;
	Wed, 11 Jan 2023 17:55:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEE8DDEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673456195;
	bh=TjxjErD0gfgeN7bWqPYOkU2Vi+kIHQpHu2LSxk3qF+E=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rfiVEWKtl8kN/ovBAGLp28WMfIUKp9zA6Azf16Nji/7RIJZKtyVnB20u/mfAlZTMm
	 1uBbhvTpxKZjAILgLBOKHL1diWY1Lcs0Cui6E1Q28zOYu6eIobRQqCwCOTxZNECaDI
	 g5BOBXPaxik+GJxDVDmYm9M0nmz+LAAkhJSlQPr0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9842FF8030F;
	Wed, 11 Jan 2023 17:55:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10A08F803DC; Wed, 11 Jan 2023 17:55:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 992B8F80539
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 17:55:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 992B8F80539
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ByQ5wL3I
Received: (Authenticated sender: herve.codina@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4B410240012;
 Wed, 11 Jan 2023 16:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1673456131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K356X//TimxDBm/vu7Ro7u6rdfLfd6xkIrNtNicpCNE=;
 b=ByQ5wL3IeFj399NTShVg/IImGzxVLKZJd2olKqJ4si/vUBIRkaEjZt5iMoI2bVDkz5J3ii
 wMGNKfvWFqKk7QGF9T7TDEfzlYqwVvczMd1rR/1f1EBmLXn441l2E2Hi6jOZRPCx1CZU0T
 H9TWDN5pEhRlYU0szSNK3GJasOaTWxKresd1ApcFdFOhfHJ/8q//WhRgnw2DzOc2qwU1wq
 +0AS+mmLWgvjsH+D3v2j596N1glvMeDygDytD1ImTKiazYlx9BO1AXtEFeHpj5hj1sLhic
 ggo5y93r+vHVgSoJZ6wu6fIPU58pTl4NHcnQbvdiHRNW3eaMnsiDmuhSw2x+2g==
Date: Wed, 11 Jan 2023 17:55:27 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/3] dt-bindings: sound: Add Renesas IDT821034 codec
Message-ID: <20230111175527.10289d16@bootlin.com>
In-Reply-To: <c4497bde-c1e0-1efc-7a46-233495f7760b@linaro.org>
References: <20230111134905.248305-1-herve.codina@bootlin.com>
 <20230111134905.248305-2-herve.codina@bootlin.com>
 <c4497bde-c1e0-1efc-7a46-233495f7760b@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 11 Jan 2023 17:28:11 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 11/01/2023 14:49, Herve Codina wrote:
> > The Renesas IDT821034 codec is a quad PCM codec with
> > programmable gain.
> >=20
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  .../bindings/sound/renesas,idt821034.yaml     | 97 +++++++++++++++++++
> >  1 file changed, 97 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/renesas,idt=
821034.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/sound/renesas,idt821034.=
yaml b/Documentation/devicetree/bindings/sound/renesas,idt821034.yaml
> > new file mode 100644
> > index 000000000000..2c29b770e3f7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/renesas,idt821034.yaml
> > @@ -0,0 +1,97 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/renesas,idt821034.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas IDT821034 codec device
> > +
> > +maintainers:
> > +  - Herve Codina <herve.codina@bootlin.com>
> > +
> > +description: |
> > +  The IDT821034 codec is a four channel PCM codec with onchip filters =
and
> > +  programmable gain setting.
> > +
> > +  The time-slots used by the codec must be set and so, the properties
> > +  'dai-tdm-slot-num', 'dai-tdm-slot-width', 'dai-tdm-slot-tx-mask' and
> > +  'dai-tdm-slot-rx-mask' must be present in the ALSA sound card node f=
or
> > +  sub-nodes that involve the codec. The codec uses one 8bit time-slot =
per
> > +  channel.
> > +  'dai-tdm-tdm-slot-with' must be set to 8.
> > +
> > +  The IDT821034 codec also supports 5 gpios (SLIC signals) per channel.
> > +
> > +allOf:
> > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> > +  - $ref: /schemas/gpio/gpio.yaml# =20
>=20
> This one is never needed. Drop.

Ok, I will drop it in v2.

>=20
> > +  - $ref: dai-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: renesas,idt821034
> > +
> > +  reg:
> > +    description:
> > +      SPI device address.
> > +    maxItems: 1
> > +
> > +  spi-max-frequency:
> > +    maximum: 8192000
> > +
> > +  spi-cpha: true
> > +
> > +  '#sound-dai-cells':
> > +    const: 0
> > +
> > +  '#gpio-cells':
> > +    const: 2
> > +
> > +  gpio-controller: true
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - spi-cpha
> > +  - '#sound-dai-cells'
> > +  - gpio-controller
> > +  - '#gpio-cells'
> > +
> > +additionalProperties: false =20
>=20
> This should be rather unevaluatedProperties: false, so other properties
> from spi-props and dai-common will work.

Ok, I will change in v2.

>=20
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    spi0 {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +        codec: idt821034@0 { =20
>=20
> Node names should be generic, so "audio-codec"
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-device=
tree-basics.html#generic-names-recommendation
>=20
> > +            compatible =3D "renesas,idt821034";
> > +            reg =3D <0>;
> > +            spi-max-frequency =3D <8192000>;
> > +            spi-cpha;
> > +            #sound-dai-cells =3D <0>;
> > +            gpio-controller;
> > +            #gpio-cells =3D <2>;
> > +        };
> > +    };
> > +    sound {
> > +        compatible =3D "simple-audio-card"; =20
>=20
> Drop sound{} node. Not relevant to the case here and it's the same in
> every case of audio codec... unless something here is specific. But even
> the dai-tdm properties are sound card specific.

Indeed, I wanted to show the dai-tdm properties.
But ok, I will drop the node.

>=20
>=20
> Best regards,
> Krzysztof
>=20

Thanks for the review.

Best regards,
Herv=C3=A9

--=20
Herv=C3=A9 Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
