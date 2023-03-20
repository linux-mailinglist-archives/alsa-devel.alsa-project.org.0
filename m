Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D38D56C1F5E
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 19:18:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEFC91E1;
	Mon, 20 Mar 2023 19:17:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEFC91E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679336285;
	bh=PFAWHnnp9pC4gb9VsWuvXnI09f7rrO87vdJezNoMkik=;
	h=Date:To:Subject:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=JdxLshuanQSrC2Fc5PJNZU6tOducOPg3rAsyFl3IDcqXLCS4fkWyIryI4Rb0ZG9uF
	 3cxWxrGE7BWVlmMf5He3bN4FSqFl33Oga7GI3caSOoBqRliUkT7WcTIZHylE9+9YYL
	 Ky1dpK8XzDSLyej2qIRV7SAfzACprZ8gGyW8kcNE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29134F80254;
	Mon, 20 Mar 2023 19:17:15 +0100 (CET)
Date: Mon, 20 Mar 2023 19:17:00 +0100
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 5/7] dt-bindings: sound: Add support for the Lantiq
 PEF2256 codec
In-Reply-To: <2d4dae57-e46d-7e81-9b56-2148074c8406@linaro.org>
References: <20230316122741.577663-1-herve.codina@bootlin.com>
	<20230316122741.577663-6-herve.codina@bootlin.com>
	<2d4dae57-e46d-7e81-9b56-2148074c8406@linaro.org>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A2FOQYYAX4ZCPM344AGC2DRPQADG4JT3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167933623411.26.9841076287693661943@mailman-core.alsa-project.org>
From: Herve Codina via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BBFC3F8027B; Mon, 20 Mar 2023 19:17:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 24B66F80105
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 19:17:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24B66F80105
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kDEgygYG
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8D6CDFF806;
	Mon, 20 Mar 2023 18:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679336224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VE9iFwvJbQJycN1cPQjjeYOTfZMxlt7ktbeI3hjJv3I=;
	b=kDEgygYGf8SV8e3tktz1z2mhccSlvObV3fCD3DrW5M9t918MS6QTjTiAjvXiTl2BtbmIsm
	ypWfutueHQJNM7ICR3KerrnkG83/CHZrLE1twQUP54YXYWuqw8Du0smDHY0p+Zzig4ssUy
	Ehzbm6JZz4A52ajdBtOAIgNdTZEVNyjY5FeY4ZXDXpEWVsryqpiEm3cBTA1z6XNYYtFv0+
	keqOPc3+aS2CJq1Kq9AQynr00z8AUTEPiJyprIRXuNv9bDdEqXh+YDjcamfJEYTBive77P
	y0AeyEcxd1aZPGcZ2oZy3AxuTAqcsqfjX12Ua3+p/1iBwid8dabF51X1S+XpBA==
Date: Mon, 20 Mar 2023 19:17:00 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 5/7] dt-bindings: sound: Add support for the Lantiq
 PEF2256 codec
Message-ID: <20230320191700.3d48e264@bootlin.com>
In-Reply-To: <2d4dae57-e46d-7e81-9b56-2148074c8406@linaro.org>
References: <20230316122741.577663-1-herve.codina@bootlin.com>
	<20230316122741.577663-6-herve.codina@bootlin.com>
	<2d4dae57-e46d-7e81-9b56-2148074c8406@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: A2FOQYYAX4ZCPM344AGC2DRPQADG4JT3
X-Message-ID-Hash: A2FOQYYAX4ZCPM344AGC2DRPQADG4JT3
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A2FOQYYAX4ZCPM344AGC2DRPQADG4JT3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Krzysztof

On Fri, 17 Mar 2023 09:57:11 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 16/03/2023 13:27, Herve Codina wrote:
> > The Lantiq PEF2256, also known as Infineon PEF2256 or FALC256, is a
> > framer and line interface component designed to fulfill all required
> > interfacing between an analog E1/T1/J1 line and the digital PCM system
> > highway/H.100 bus.
> >=20
> > The codec support allows to use some of the PCM system highway
> > time-slots as audio channels to transport audio data over the E1/T1/J1
> > lines.
> >  =20
>=20
> Your other file should also have specific compatible, unless this codec
> is actually part of the framer. Did not look like this in the binding -
> not $ref.

No sure to understand what you mean.

Anyway, I plan to use a MFD device for pef2256 and reference this yaml
from the lantiq,pef2256.yaml in the node related to the codec.

One question related to bindings and related checks:
Is there a way to check the compatible property of the parent node.
I mean, here is the binding of a child node of a MFD node.
=46rom this binding, I would like to be sure that the parent is really a
pef2256 MFD node.

May be something like:
  parent-properties:
    allOf:
      compatible:
        contains:
          const: lantiq,pef2256

The idea is to have dtbs_check raise an error if the parent's compatible
property is not 'lantiq,pef2256'.

=46rom parent, the link is checked using:
  properties:
    codec:
      $ref: /schemas/sound/lantiq,pef2256-codec.yaml

but nothing prevent to use this 'lantiq,pef2256-codec' binding from a node
that has nothing to do with pef2256.

>=20
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  .../bindings/sound/lantiq,pef2256-codec.yaml  | 57 +++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/lantiq,pef2=
256-codec.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/sound/lantiq,pef2256-cod=
ec.yaml b/Documentation/devicetree/bindings/sound/lantiq,pef2256-codec.yaml
> > new file mode 100644
> > index 000000000000..acba3a0ccd1b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/lantiq,pef2256-codec.yaml
> > @@ -0,0 +1,57 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/lantiq,pef2256-codec.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Lantiq PEF2256 codec device =20
>=20
> Drop "device". Everything is "device".

Will be dropped in v3 series.

>=20
> > +
> > +maintainers:
> > +  - Herve Codina <herve.codina@bootlin.com>
> > +
> > +description: |
> > +  Codec support for PEF2256.
> > +
> > +  The Lantiq PEF2256, also known as Infineon PEF2256 or FALC256, is a =
framer and
> > +  line interface component designed to fulfill all required interfacin=
g between
> > +  an analog E1/T1/J1 line and the digital PCM system highway/H.100 bus.
> > +
> > +  The codec support allows to use some of the PCM system highway time-=
slots as
> > +  audio channels to transport audio data over the E1/T1/J1 lines.
> > +
> > +  The time-slots used by the codec must be set and so, the properties
> > +  'dai-tdm-slot-num', 'dai-tdm-slot-width', 'dai-tdm-slot-tx-mask' and
> > +  'dai-tdm-slot-rx-mask' must be present in the ALSA sound card node f=
or
> > +  sub-nodes that involve the codec. The codec uses 8bit time-slots.
> > +  'dai-tdm-tdm-slot-with' must be set to 8.
> > +
> > +allOf:
> > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#

Oups,
This device is not on a SPI bus -> will be dropped in v3 series.

> > +  - $ref: dai-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: lantiq,pef2256-codec
> > +
> > +  lantiq,pef2256:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      phandle to the PEF2256 =20
>=20
> Why not its child? Why this is in parallel ?

Indeed,
I will move to MFD, remove this phandle and use the lantiq,pef2256-codec
node as a child node of lantiq,pef2256.

>=20
> > +
> > +  '#sound-dai-cells':
> > +    const: 0
> > + =20
>=20
>=20
> Best regards,
> Krzysztof
>=20

Thanks for the review,

Best regards,
Herv=C3=A9

--=20
Herv=C3=A9 Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
