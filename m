Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFA0738E52
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 20:15:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1CC6836;
	Wed, 21 Jun 2023 20:14:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1CC6836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687371311;
	bh=GP6SSsJqsEoIOOV4xdeK3OoPoZd8Vmfr3ciNMdB5bO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Lb6Gggoc3h+UnVZAtWFgKU0cdkq9rh1wJnlpGHvVvfxiy2+OEax+/DV/G4d8DHISn
	 xm81Hp6GhIaRlk366iOyRWVM04e/2EyyA0HaAA1IAmMYr6cy7wIrxoQsUxMhNlFmen
	 gFUWB4MqLlbQ0UbtDGIqz5rmCBz4S6P+S354p2LY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67E57F801D5; Wed, 21 Jun 2023 20:14:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC414F80022;
	Wed, 21 Jun 2023 20:14:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D483F80141; Wed, 21 Jun 2023 20:14:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39F7AF801D5
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 20:14:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39F7AF801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Pet7MyLs
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7E54F61657;
	Wed, 21 Jun 2023 18:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E168C433C8;
	Wed, 21 Jun 2023 18:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687371241;
	bh=GP6SSsJqsEoIOOV4xdeK3OoPoZd8Vmfr3ciNMdB5bO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pet7MyLs7GoJaExX9El8RFmtnl5QlVAGXiKa4TwvDOqXTBhs8ZKIb8JRPb7Acc7/f
	 84HTltuRQiv1JbGs4D183aN4cA0CwKfrwA8vhtMF5kFpQA4/tiwTrqypxc6AlR4k5l
	 uA54TvYX6HYfYzlxqKMqb6mc8pd91BVKiZvnx4t4sI1BnJ7dN4aDcHcPCbTUwY7Y1c
	 9aY71YSZZdVGoda+O7/ZmUun2pHikfeMjOz1q7eB3cVoYDO0JHpPNxEV+Cv9348rSI
	 q+FYIPDhHPmnU5vDQDj9Th1QfdGnTrZQocKwa9lnUXpqIN4fm+ZPMVR1cmLJLqt/J3
	 GbIHp5nGsc3Jw==
Date: Wed, 21 Jun 2023 19:13:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org, YHCHuang@nuvoton.com,
	KCHSU0@nuvoton.com, CTLIN0@nuvoton.com, SJLIN0@nuvoton.com,
	scott6986@gmail.com, supercraig0719@gmail.com, dardar923@gmail.com,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: nau8821: Convert to dtschema
Message-ID: <99102ee0-ed59-4e60-89d2-60964cec012c@sirena.org.uk>
References: <20230621093903.1077050-1-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bA69hquOr1Te73No"
Content-Disposition: inline
In-Reply-To: <20230621093903.1077050-1-wtli@nuvoton.com>
X-Cookie: When among apes, one must play the ape.
Message-ID-Hash: IV7QVDMWQKSB4TUS4QIM4R3B6VW7C4II
X-Message-ID-Hash: IV7QVDMWQKSB4TUS4QIM4R3B6VW7C4II
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IV7QVDMWQKSB4TUS4QIM4R3B6VW7C4II/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--bA69hquOr1Te73No
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 21, 2023 at 05:39:03PM +0800, Seven Lee wrote:
> Convert the NAU8821 audio CODEC bindings to DT schema.

This wasn't sent to the DT list or maintainers, it should be in order to
ensure they can review it.  Copying in the list and leaving the whole
message for context.

>=20
> Signed-off-by: Seven Lee <wtli@nuvoton.com>
> ---
>  .../devicetree/bindings/sound/nau8821.txt     |  55 --------
>  .../bindings/sound/nuvoton,nau8821.yaml       | 120 ++++++++++++++++++
>  2 files changed, 120 insertions(+), 55 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/nau8821.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau88=
21.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/sound/nau8821.txt b/Docume=
ntation/devicetree/bindings/sound/nau8821.txt
> deleted file mode 100644
> index 7c84e7c7327a..000000000000
> --- a/Documentation/devicetree/bindings/sound/nau8821.txt
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -Nuvoton NAU88L21 audio codec
> -
> -This device supports I2C only.
> -
> -Required properties:
> -  - compatible : Must be "nuvoton,nau8821"
> -
> -  - reg : the I2C address of the device. This is either 0x1B (CSB=3D0) o=
r 0x54 (CSB=3D1).
> -
> -Optional properties:
> -  - nuvoton,jkdet-enable: Enable jack detection via JKDET pin.
> -  - nuvoton,jkdet-pull-enable: Enable JKDET pin pull. If set - pin pull =
enabled,
> -      otherwise pin in high impedance state.
> -  - nuvoton,jkdet-pull-up: Pull-up JKDET pin. If set then JKDET pin is p=
ull up, otherwise pull down.
> -  - nuvoton,jkdet-polarity: JKDET pin polarity. 0 - active high, 1 - act=
ive low.
> -
> -  - nuvoton,vref-impedance: VREF Impedance selection
> -      0 - Open
> -      1 - 25 kOhm
> -      2 - 125 kOhm
> -      3 - 2.5 kOhm
> -
> -  - nuvoton,micbias-voltage: Micbias voltage level.
> -      0 - VDDA
> -      1 - VDDA
> -      2 - VDDA * 1.1
> -      3 - VDDA * 1.2
> -      4 - VDDA * 1.3
> -      5 - VDDA * 1.4
> -      6 - VDDA * 1.53
> -      7 - VDDA * 1.53
> -
> -  - nuvoton,jack-insert-debounce: number from 0 to 7 that sets debounce =
time to 2^(n+2) ms
> -  - nuvoton,jack-eject-debounce: number from 0 to 7 that sets debounce t=
ime to 2^(n+2) ms
> -
> -  - nuvoton,dmic-clk-threshold: the ADC threshold of DMIC clock.
> -  - nuvoton,key_enable: Headset button detection switch.
> -
> -Example:
> -
> -  headset: nau8821@1b {
> -      compatible =3D "nuvoton,nau8821";
> -      reg =3D <0x1b>;
> -      interrupt-parent =3D <&gpio>;
> -      interrupts =3D <23 IRQ_TYPE_LEVEL_LOW>;
> -      nuvoton,jkdet-enable;
> -      nuvoton,jkdet-pull-enable;
> -      nuvoton,jkdet-pull-up;
> -      nuvoton,jkdet-polarity =3D <GPIO_ACTIVE_LOW>;
> -      nuvoton,vref-impedance =3D <2>;
> -      nuvoton,micbias-voltage =3D <6>;
> -      nuvoton,jack-insert-debounce =3D <7>;
> -      nuvoton,jack-eject-debounce =3D <7>;
> -      nuvoton,dmic-clk-threshold =3D 3072000;
> -  };
> diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml=
 b/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
> new file mode 100644
> index 000000000000..728223d20876
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/nuvoton,nau8821.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NAU88L21 audio codec
> +
> +maintainers:
> +  - Seven Lee <wtli@nuvoton.com>
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: nuvoton,nau8821
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  nuvoton,jkdet-enable:
> +    description: Enable jack detection via JKDET pin.
> +    type: boolean
> +
> +  nuvoton,jkdet-pull-enable:
> +    description: Enable JKDET pin pull. If set - pin pull enabled,
> +      otherwise pin in high impedance state.
> +    type: boolean
> +
> +  nuvoton,jkdet-pull-up:
> +    description: Pull-up JKDET pin. If set then JKDET pin is pull up,
> +      otherwise pull down.
> +    type: boolean
> +
> +  nuvoton,jkdet-polarity:
> +    description: JKDET pin polarity.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 0 # active high
> +      - 1 # active low
> +    default: 1
> +
> +  nuvoton,micbias-voltage:
> +    description: MICBIAS output level select.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 0 # VDDA
> +      - 1 # VDDA * 1
> +      - 2 # VDDA * 1.1
> +      - 3 # VDDA * 1.2
> +      - 4 # VDDA * 1.3
> +      - 5 # VDDA * 1.4
> +      - 6 # VDDA * 1.53
> +      - 7 # VDDA * 1.53
> +    default: 6
> +
> +  nuvoton,vref-impedance:
> +    description: VMID Tie-off impedance select.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 0 # open(default)
> +      - 1 # 25KOhms
> +      - 2 # 125KOhms
> +      - 3 # 2.5KOhms
> +    default: 2
> +
> +  nuvoton,jack-insert-debounce:
> +    description: number from 0 to 7 that sets debounce time to 2^(n+2)ms.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 7
> +    default: 7
> +
> +  nuvoton,jack-eject-debounce:
> +    description: number from 0 to 7 that sets debounce time to 2^(n+2)ms.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 7
> +    default: 0
> +
> +  nuvoton,dmic-clk-threshold:
> +    description: DMIC clock speed expected value. Unit is Hz.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 3072000
> +
> +  '#sound-dai-cells':
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        codec@1b {
> +            #sound-dai-cells =3D <0>;
> +            compatible =3D "nuvoton,nau8821";
> +            reg =3D <0x1b>;
> +            interrupt-parent =3D <&gpio>;
> +            interrupts =3D <23 IRQ_TYPE_LEVEL_LOW>;
> +            nuvoton,jkdet-enable;
> +            nuvoton,jkdet-pull-enable;
> +            nuvoton,jkdet-pull-up;
> +            nuvoton,jkdet-polarity =3D <GPIO_ACTIVE_LOW>;
> +            nuvoton,micbias-voltage =3D <6>;
> +            nuvoton,vref-impedance =3D <2>;
> +            nuvoton,jack-insert-debounce =3D <7>;
> +            nuvoton,jack-eject-debounce =3D <0>;
> +            nuvoton,dmic-clk-threshold =3D <3072000>;
> +        };
> +    };
> --=20
> 2.25.1
>=20

--bA69hquOr1Te73No
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSTPeMACgkQJNaLcl1U
h9BM5wgAhWRhy885mc6c0M7EcsCoTtAv1hYGLBsz6I/Ug8ZGK58XW0T+ghuj9sS9
hfiLmJjqaEw+1iLjDEJN7ql7oCNaCu5lVpmU8ilIk247ZkJRHlGCT4HhsKDN3kJQ
pIbY48DhXPRQ7Tl7zdR9/oOmgaHTJ+TFRG6Qcg5njiKHspczARAULKCq5jp5vePw
UhMwhLbh1RckXJWh4PipcH/Z+ToTGvPM3pnOdckyCWYL3i5tWrdjnAJIEmE+Bvxw
e8W5taROUuVq2LYdxVQavi7sItXpiojw+S+HEFaSVMmBo3OkwKwiUAg7T68zYouk
tlXRF4WHEdHHf2pj/LpdYLsBcfwbQw==
=8EBw
-----END PGP SIGNATURE-----

--bA69hquOr1Te73No--
