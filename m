Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FDD836EB6
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 19:01:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDF7685D;
	Mon, 22 Jan 2024 19:00:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDF7685D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705946465;
	bh=MEx6fJrAlgplstfDKSw5stdpiSQ0xarAZZIl0igTa4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cGyuTg+6m+tp6aDovjEIzDXQkwEY1gGL5G2p6iYyZkXYUO3oPw4SV4jFWjHSga6qi
	 jTa3af9OIy/0otOFZENTAnBH0ETpNIAqJKbNzKEGyUFhDWASPYqHGnpVEsjuEo2hB/
	 SCYUPHetviJR0xvShD74rv74c++7pUbkGPYjM9E8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EEB0EF80580; Mon, 22 Jan 2024 19:00:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67118F8057E;
	Mon, 22 Jan 2024 19:00:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BC0CF8025F; Mon, 22 Jan 2024 19:00:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 12E8BF8020D
	for <alsa-devel@alsa-project.org>; Mon, 22 Jan 2024 19:00:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12E8BF8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OYOl3uZ/
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 13D786172C;
	Mon, 22 Jan 2024 18:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4213C433C7;
	Mon, 22 Jan 2024 18:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705946419;
	bh=MEx6fJrAlgplstfDKSw5stdpiSQ0xarAZZIl0igTa4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OYOl3uZ/r/W9FEr43Av1g/VvFBhS8477EX6xGQkw18n+z38oKrbqIYspDxp8hpZNC
	 BNHKIYJ37+3uERL9o6h/aasj4a4EAZqwOVAtqRrgBs/KkmbTVopfHclCP/6XRMpGP5
	 5PT+1vxqw3g6/F78QXEGVhjJCsR8xbDjOLTYz4R6h0A1h1pl73Yr11z2h+GW0tgtqr
	 txju67JyQsoOegaCTfrJej8qmplWdsXedmkgCXf3Ainb0Tm34XkCyrrtXQ86FFInJC
	 WLpvY/Q+c461BzVMh3YuEUmWXf/siqJT1PCtmm98V733zIw306ykojjpJY7308x54c
	 +xDY5yviZFq3Q==
Date: Mon, 22 Jan 2024 18:00:14 +0000
From: Conor Dooley <conor@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	robh+dt@kernel.org, conor+dt@kernel.org, YHCHuang@nuvoton.com,
	KCHSU0@nuvoton.com, CTLIN0@nuvoton.com, SJLIN0@nuvoton.com,
	scott6986@gmail.com, supercraig0719@gmail.com, dardar923@gmail.com
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: Added schema for "nuvoton,nau8325"
Message-ID: <20240122-daunting-woof-19fac5689bb2@spud>
References: <20240122095650.60523-1-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ozOZKuBm4zqCXBiO"
Content-Disposition: inline
In-Reply-To: <20240122095650.60523-1-wtli@nuvoton.com>
Message-ID-Hash: 6PDUFUVVZYAQCZZVSIV3EM4HRRRPS6QF
X-Message-ID-Hash: 6PDUFUVVZYAQCZZVSIV3EM4HRRRPS6QF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6PDUFUVVZYAQCZZVSIV3EM4HRRRPS6QF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--ozOZKuBm4zqCXBiO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 05:56:49PM +0800, Seven Lee wrote:
> Added a DT schema for describing nau8325 audio amplifiers.
>=20
> Signed-off-by: Seven Lee <wtli@nuvoton.com>
> ---
>  .../bindings/sound/nuvoton,nau8325.yaml       | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau83=
25.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml=
 b/Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml
> new file mode 100644
> index 000000000000..9105985357aa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/nuvoton,nau8325.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NAU8325 audio Amplifier
> +
> +maintainers:
> +  - Seven Lee <WTLI@nuvoton.com>
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: nuvoton,nau8325
> +
> +  reg:
> +    maxItems: 1
> +
> +  nuvoton,vref-impedance:

I know this property already has users, but this is a new device and you
are writing a new driver from scratch, could you instead call it
"nuvoton,vref-impedance-ohms" and make the options the impednances
themselves?

The absence of the property could then be used to indicate that it is an
open circuit?

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      VREF impedance selection.
> +    enum:
> +      - 0 # Open
> +      - 1 # 25kOhm
> +      - 2 # 125kOhm
> +      - 3 # 2.5kOhm
> +    default: 2
> +
> +  nuvoton,dac-vref:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      DAC Reference Voltage Setting.
> +    enum:
> +      - 0 # VDDA
> +      - 1 # VDDA*1.5/1.8V
> +      - 2 # VDDA*1.6/1.8V
> +      - 3 # VDDA*1.7/1.8V

I would also rather than this enum was used to have sensible values for
the enum itself (which I suppose means strings here), rather than the
register values. Seeing "nuvoton,dac-vref =3D <2>" in a devicetree is not
very meaningful IMO.

Cheers,
Conor.

> +    default: 2
> +
> +  nuvoton,alc-enable:
> +    description:
> +      Enable digital automatic level control (ALC) function.
> +    type: boolean
> +
> +  nuvoton,clock-detection-disable:
> +    description:
> +      When clock detection is enabled, it will detect whether MCLK
> +      and FS are within the range. MCLK range is from 2.048MHz to 24.576=
MHz.
> +      FS range is from 8kHz to 96kHz.
> +    type: boolean
> +
> +  nuvoton,clock-det-data:
> +    description:
> +      Request clock detection to require 2048 non-zero samples before en=
abling
> +      the audio paths. If set then non-zero samples is required, otherwi=
se it
> +      doesn't matter.
> +    type: boolean
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        codec@21 {
> +            compatible =3D "nuvoton,nau8325";
> +            reg =3D <0x21>;
> +            nuvoton,vref-impedance =3D <2>;
> +            nuvoton,dac-vref =3D <2>;
> +            nuvoton,alc-enable;
> +            nuvoton,clock-det-data;
> +        };
> +    };
> --=20
> 2.25.1
>=20

--ozOZKuBm4zqCXBiO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZa6tLgAKCRB4tDGHoIJi
0kInAQD2wiz5P1EmfjIPuiLPGoHAsvUKWrqo4jhy7dEavxbbPQEAsqYcBXruVOBh
gFGDyeRQY1oic2J6Iyn8ZbI3S+PANgc=
=vEaT
-----END PGP SIGNATURE-----

--ozOZKuBm4zqCXBiO--
