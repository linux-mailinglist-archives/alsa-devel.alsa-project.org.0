Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A382379D679
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 18:37:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A366886;
	Tue, 12 Sep 2023 18:36:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A366886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694536660;
	bh=GxKIUea0MR3qucRWRL0Hx83U7cwPGTLCUKUSG5y0gTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MuLZ10S9ipp0Ku8kAKoaczc+W/QC0r6wZSv+Xmv8ac3hSdPd6+dPeuUTi9yQXtZxL
	 CLN5vibsIa0/3HtJ1ffsbR/g2yyJzfkbgROUs/xoGF5yd29dZ05vj5VTnNONeE4hHi
	 VQca63DbIRwJ5YKdaT6BL7ACQpKMd8nTWayQH5RI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2081F80549; Tue, 12 Sep 2023 18:36:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56C3DF80246;
	Tue, 12 Sep 2023 18:36:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CD3EF80425; Tue, 12 Sep 2023 18:36:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA616F80212
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 18:36:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA616F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=A2ju+hny
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 44CB561455;
	Tue, 12 Sep 2023 16:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C44DC433C9;
	Tue, 12 Sep 2023 16:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694536600;
	bh=GxKIUea0MR3qucRWRL0Hx83U7cwPGTLCUKUSG5y0gTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A2ju+hny7e7p8svy4BT1Z0NWlDaSWqAUMU0jO3tWdOGUwVvOTr5ryi6qKB1r00soR
	 6MgqcPWs8U3o80SVJWEZP/K5R0lchPS8+Me+Zpv9QSsqKYlQpMMVd2HACNtZytqfdF
	 NtGigKM+tgZZDmmbdhKNWm+43BcRVD5N0dCD3PxKOjLpEDsDS8nE6CF8knFeh2PrWY
	 8iLnY+50Ain9WkIk9dFb7Ym/UT0XgLiHBOFDMizqDtfcH6KvXAnZUBW0w7FfFGgWQ7
	 P8Pi1T+dbds7cdbZIYKgLuqbsimrLRVpxMZ0R6b7s3jy7/R16ly99fRsE5xC7FbpMA
	 BipSJh9HkWnmw==
Date: Tue, 12 Sep 2023 17:36:32 +0100
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
	Simon Horman <horms@kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 06/31] dt-bindings: soc: fsl: cpm_qe: cpm1-scc-qmc:
 Fix example property name
Message-ID: <20230912-marathon-pecan-a9d001f7e015@spud>
References: <20230912081527.208499-1-herve.codina@bootlin.com>
 <20230912081527.208499-7-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XR0sKUlOqSjiyY1L"
Content-Disposition: inline
In-Reply-To: <20230912081527.208499-7-herve.codina@bootlin.com>
Message-ID-Hash: HXBVY4K6G4UF2OQWOXMEJJHHZG2JRVOH
X-Message-ID-Hash: HXBVY4K6G4UF2OQWOXMEJJHHZG2JRVOH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HXBVY4K6G4UF2OQWOXMEJJHHZG2JRVOH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--XR0sKUlOqSjiyY1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 12, 2023 at 10:14:57AM +0200, Herve Codina wrote:
> The given example mentions the 'fsl,mode' property whereas the
> correct property name, the one described, is 'fsl,operational-mode'.
>=20
> Fix the example to use the correct property name.
>=20
> Fixes: a9b121327c93 ("dt-bindings: soc: fsl: cpm_qe: Add QMC controller")
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  .../bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml           | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-sc=
c-qmc.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-=
qmc.yaml
> index ec888f48cac8..450a0354cb1d 100644
> --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.y=
aml
> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.y=
aml
> @@ -137,7 +137,7 @@ examples:
>          channel@16 {
>              /* Ch16 : First 4 even TS from all routed from TSA */
>              reg =3D <16>;
> -            fsl,mode =3D "transparent";
> +            fsl,operational-mode =3D "transparent";
>              fsl,reverse-data;
>              fsl,tx-ts-mask =3D <0x00000000 0x000000aa>;
>              fsl,rx-ts-mask =3D <0x00000000 0x000000aa>;
> @@ -146,7 +146,7 @@ examples:
>          channel@17 {
>              /* Ch17 : First 4 odd TS from all routed from TSA */
>              reg =3D <17>;
> -            fsl,mode =3D "transparent";
> +            fsl,operational-mode =3D "transparent";
>              fsl,reverse-data;
>              fsl,tx-ts-mask =3D <0x00000000 0x00000055>;
>              fsl,rx-ts-mask =3D <0x00000000 0x00000055>;
> @@ -155,7 +155,7 @@ examples:
>          channel@19 {
>              /* Ch19 : 8 TS (TS 8..15) from all routed from TSA */
>              reg =3D <19>;
> -            fsl,mode =3D "hdlc";
> +            fsl,operational-mode =3D "hdlc";
>              fsl,tx-ts-mask =3D <0x00000000 0x0000ff00>;
>              fsl,rx-ts-mask =3D <0x00000000 0x0000ff00>;
>          };
> --=20
> 2.41.0
>=20

--XR0sKUlOqSjiyY1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQCTkAAKCRB4tDGHoIJi
0qkSAQDCtuqFutdZCBawqlE2z8M36+DZG+UYXQsNC7oJKZRkAwD/czQYT6Dla3tv
mNhSBDRL50Z7rrG+GUiJRWBasgZy0Ak=
=+Z+2
-----END PGP SIGNATURE-----

--XR0sKUlOqSjiyY1L--
