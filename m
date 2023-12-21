Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 552DC81B8CB
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Dec 2023 14:53:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1285DEB;
	Thu, 21 Dec 2023 14:53:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1285DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703166836;
	bh=pPMVyevmpbWPJgmQU7BRAWm3WCy0zRv/2Uz1rFGHuiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jXAUFpkjg0zohSKfUspDBRo3jrqZmRSz5amTleFXjXU+79iRKLv+ClVojMwgFTmzX
	 DyR/DKXH/tdcc1Xtmpc8TKVlfX6/Hj1YVtjSB8mbM2RSqSl6TiQ36/Zjnt9Vjpvo6p
	 BjmQHkwdb/fTe/s5f9UMX6Bsn3rGnXYaOt0sYnUg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B95DF80589; Thu, 21 Dec 2023 14:53:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 708B0F804DA;
	Thu, 21 Dec 2023 14:53:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4933F80153; Thu, 21 Dec 2023 14:53:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06A2CF800BD
	for <alsa-devel@alsa-project.org>; Thu, 21 Dec 2023 14:53:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06A2CF800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=On2uCpC+
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 749F261419;
	Thu, 21 Dec 2023 13:53:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D0DFC433C7;
	Thu, 21 Dec 2023 13:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703166785;
	bh=pPMVyevmpbWPJgmQU7BRAWm3WCy0zRv/2Uz1rFGHuiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=On2uCpC+rib2wTj1bZI3ww/V0sidzj/s0K5wmmMPAAnNCLNx6htQnrayG+HX++JYh
	 o0+9/Vp7DUrOpd8I3RgEAIsJF92NvYeGozwQXThXZ/jBdFaU3atiXCcclMRGHD1wWL
	 cJU8hhLWaEDD6DtFgV58bF5rdRyBReRuaQhJhTcTUer2JKDO7VGP/gIwZzavH0+I9v
	 VzuLybXJXvZYNUUEuHB756R0pCbSQZcBIRCB2PyvNoUGXxU8vTvDge3M7x9E0wsNKJ
	 nLDs0p49gueULOZ85BE5XoR1gih9DdZ75LEvGe83j6tk3n+nQgOzORpyhNjWLnsIiI
	 wHBXi0wF2wSHg==
Date: Thu, 21 Dec 2023 13:53:00 +0000
From: Conor Dooley <conor@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <Claudiu.Beznea@microchip.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Walker Chen <walker.chen@starfivetech.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: ASoC: Add Cadence I2S controller for
 StarFive JH8100 SoC
Message-ID: <20231221-saddlebag-tricolor-d02a17d66795@spud>
References: <20231221033223.73201-1-xingyu.wu@starfivetech.com>
 <20231221033223.73201-2-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KOGwlaDIWVEFGDEl"
Content-Disposition: inline
In-Reply-To: <20231221033223.73201-2-xingyu.wu@starfivetech.com>
Message-ID-Hash: VOAJWSU4HDIKADEPT5GUSLINNN23352S
X-Message-ID-Hash: VOAJWSU4HDIKADEPT5GUSLINNN23352S
X-MailFrom: conor@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VOAJWSU4HDIKADEPT5GUSLINNN23352S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--KOGwlaDIWVEFGDEl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Xingyu, Mark,

On Thu, Dec 21, 2023 at 11:32:22AM +0800, Xingyu Wu wrote:
> Add bindings for the Multi-Channel I2S controller of Cadence
> on the StarFive JH8100 SoC.
>=20
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../bindings/sound/cdns,jh8100-i2s.yaml       | 100 ++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/cdns,jh8100-i=
2s.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/sound/cdns,jh8100-i2s.yaml=
 b/Documentation/devicetree/bindings/sound/cdns,jh8100-i2s.yaml
> new file mode 100644
> index 000000000000..5d95d9ab3e45
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/cdns,jh8100-i2s.yaml
> @@ -0,0 +1,100 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/cdns,jh8100-i2s.yaml#

Filename matching the compatible please.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cadence multi-channel I2S controller for StarFive JH8100 SoC
> +
> +description: |

You only need the | if there is formatting to preserve.

> +  The Cadence I2S Controller implements a function of the multi-channel
> +  (up to 8-channel) bus. It combines functions of a transmitter and a re=
ceiver.
> +  It is used in the StarFive JH8100 SoC.
> +
> +maintainers:
> +  - Xingyu Wu <xingyu.wu@starfivetech.com>
> +  - Walker Chen <walker.chen@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    const: starfive,jh8100-i2s
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    description: |
> +      The interrupt line number for the I2S controller. Add this
> +      parameter if the I2S controller that you are using does not
> +      support DMA.

You've got one i2s controller here, you should know if it supports DMA
or not.

> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Bit clock
> +      - description: Main ICG clock
> +      - description: Inner master clock
> +
> +  clock-names:
> +    items:
> +      - const: bclk
> +      - const: icg
> +      - const: mclk_inner
> +
> +  resets:
> +    maxItems: 1
> +
> +  dmas:
> +    items:
> +      - description: TX DMA Channel
> +      - description: RX DMA Channel
> +    minItems: 1
> +
> +  dma-names:
> +    items:
> +      - const: tx
> +      - const: rx
> +    minItems: 1
> +
> +  cdns,i2s-max-channels:
> +    description: |
> +      Number of I2S max stereo channels supported by the hardware.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 8

Mark, is there no common property for this kind of thing? That said,
there's one device here so the number is known at present.
Another note, this property is not required, so it should have a
default.

It's kinda hard to know with this binding - it is touted as being for a
particular Cadence IP, and some aspects are pretty generic, but at the
same time there's only one device here so it's hard to tell what is
variable between implementations and what is not.
Are there no other implementations of this controller? Unless it is
brand new, I find that hard to believe.

Cheers,
Conor.

> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +
> +oneOf:
> +  - required:
> +      - dmas
> +      - dma-names
> +  - required:
> +      - interrupts
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2s@122b0000 {
> +      compatible =3D "starfive,jh8100-i2s";
> +      reg =3D <0x122b0000 0x1000>;
> +      clocks =3D <&syscrg_ne 133>,
> +               <&syscrg_ne 170>,
> +               <&syscrg 50>;
> +      clock-names =3D "bclk", "icg",
> +                    "mclk_inner";
> +      resets =3D <&syscrg_ne 43>;
> +      dmas =3D <&dma 7>, <&dma 6>;
> +      dma-names =3D "tx", "rx";
> +      cdns,i2s-max-channels =3D <2>;
> +      #sound-dai-cells =3D <0>;
> +    };
> --=20
> 2.25.1
>=20
>=20

--KOGwlaDIWVEFGDEl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZYRDPAAKCRB4tDGHoIJi
0s94AP9geB4PYcZr4+jWv+afH31tjZK9Ipg74/OInCTDenjFWgD+Lkrt4YCJ5jzp
6mcV3fL0qrb+B7BF6qed1c7Naq7xzQs=
=gqs+
-----END PGP SIGNATURE-----

--KOGwlaDIWVEFGDEl--
