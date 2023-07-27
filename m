Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED694764C23
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jul 2023 10:21:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC4BF820;
	Thu, 27 Jul 2023 10:20:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC4BF820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690446066;
	bh=ZOrVyIMfU4XpSn7UdLHa8hRU7oEBnQJsIPlHeRvuFcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RPv0oWv/cDGeupeJJ8/LIc7FyJWdlk9RyK/bHaE7Rb8WDX7IjWY21an/Fy/zoxyMh
	 5lz0oNEo75ZN02SrPjq1gt1ZQQeBjzFYJkR3qAmq9cRZwsRCK4JPL74AK5VG5YIfSx
	 pFhljKM8VM+Ry2Qf88n3S4xl87ZTICtmxvpkBR0k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C2E6F800D2; Thu, 27 Jul 2023 10:20:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E06C4F80163;
	Thu, 27 Jul 2023 10:20:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5203FF8019B; Thu, 27 Jul 2023 10:20:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5CD9F800D2
	for <alsa-devel@alsa-project.org>; Thu, 27 Jul 2023 10:20:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5CD9F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EHBQpkdo
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 38AFD61D59;
	Thu, 27 Jul 2023 08:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5238C433C8;
	Thu, 27 Jul 2023 08:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690446007;
	bh=ZOrVyIMfU4XpSn7UdLHa8hRU7oEBnQJsIPlHeRvuFcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EHBQpkdojMRAPtSSVOI2WRnZN/AvXm08ZGy/3AMvUkfeEDcPsrHPGTekUyW5fXJxJ
	 zdCTcLMIRhvFYCbBMh4fLTN/Splo6c8g7EpZUzV+kc3CWBEA9+e87aztnL7Pnando+
	 pwIu0dDAaTMZGUJpqT7v9ut6SYL3i3U0Lok2Ul2QmbFjy/c+qomP7DFNMWOB3UHcT+
	 W/OUOtWHyqFJfluyEgawYuM9loJtKVM7uM3V+VQ0I9nzojooaE7vyShQC2nj6AT86L
	 oYjCYV5xUeE+UK2ny6qdJMEbyR0c7Mfu2nsJKb4l9IqecATQzsXax4HK0eXNkTiSJ0
	 dqlMmnFwcjcow==
Date: Thu, 27 Jul 2023 09:19:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 05/28] dt-bindings: net: Add support for QMC HDLC
Message-ID: <20230727-talcum-backside-5bdbe2171fb6@spud>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
 <20230726150225.483464-6-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DM6e+RDa3XBbMs9a"
Content-Disposition: inline
In-Reply-To: <20230726150225.483464-6-herve.codina@bootlin.com>
Message-ID-Hash: PSKNNDGT3DB4ZKXFDFQEN6MTWFECH2RX
X-Message-ID-Hash: PSKNNDGT3DB4ZKXFDFQEN6MTWFECH2RX
X-MailFrom: conor@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PSKNNDGT3DB4ZKXFDFQEN6MTWFECH2RX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--DM6e+RDa3XBbMs9a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 26, 2023 at 05:02:01PM +0200, Herve Codina wrote:
> The QMC (QUICC mutichannel controller) is a controller present in some
> PowerQUICC SoC such as MPC885.
> The QMC HDLC uses the QMC controller to transfer HDLC data.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../devicetree/bindings/net/fsl,qmc-hdlc.yaml | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/fsl,qmc-hdlc.ya=
ml
>=20
> diff --git a/Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml b/Do=
cumentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml
> new file mode 100644
> index 000000000000..8bb6f34602d9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/fsl,qmc-hdlc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: QMC HDLC

"QMC HDLC" seems excessively terse.

> +
> +maintainers:
> +  - Herve Codina <herve.codina@bootlin.com>
> +
> +description: |
> +  The QMC HDLC uses a QMC (QUICC Multichannel Controller) channel to tra=
nsfer
> +  HDLC data.
> +
> +properties:
> +  compatible:
> +    const: fsl,qmc-hdlc
> +
> +  fsl,qmc-chan:

Perhaps I am just showing my lack of knowledge in this area, but what is
fsl specific about wanting a reference to the channel of a "QMC"?
Is this something that hardware from other manufacturers would not also
want to do?

> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to QMC node
> +          - description: Channel number
> +    description:
> +      Should be a phandle/number pair. The phandle to QMC node and the Q=
MC
> +      channel to use.
> +
> +required:
> +  - compatible
> +  - fsl,qmc-chan
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    hdlc {
> +        compatible =3D "fsl,qmc-hdlc";
> +        fsl,qmc-chan =3D <&qmc 16>;
> +    };
> --=20
> 2.41.0
>=20

--DM6e+RDa3XBbMs9a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMIorwAKCRB4tDGHoIJi
0qkLAQC6sDWnGDv+x5El1pIJ5VwJJnPS/IZlV0Qs715IhJHxvwEAzt3hBjT6R02J
luBI20Rzy9YB7KndWqGrmYR7rVtFKgk=
=8ut0
-----END PGP SIGNATURE-----

--DM6e+RDa3XBbMs9a--
