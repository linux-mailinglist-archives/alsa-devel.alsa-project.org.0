Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31178767E17
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Jul 2023 12:16:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61602206;
	Sat, 29 Jul 2023 12:16:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61602206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690625815;
	bh=e5qRP58sXUjxxjVtvykFY2nDh4nODzU0OW9ZJXKMiHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RokZvgymGDhibBnbfGROy0TC2B61A8g50Es4U/QvewL1WayLC/qvvIeVo0fT6lLy5
	 IenjE6Qmovs9s0RK9Yt4tS/A7ktPxZj1BEGP8CVHVX3aWPQ7p5N76nLNxPqOtO1Csl
	 dSnZXVVWx1H6VIfnTzWiT2yejZyTQOezwOcDFfNQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78184F802E8; Sat, 29 Jul 2023 12:16:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 617EFF80163;
	Sat, 29 Jul 2023 12:16:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89AEDF800C7; Sat, 29 Jul 2023 12:13:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C23A8F800C7
	for <alsa-devel@alsa-project.org>; Sat, 29 Jul 2023 12:13:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C23A8F800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gWsv+BT5
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D439060B08;
	Sat, 29 Jul 2023 10:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03D28C433C7;
	Sat, 29 Jul 2023 10:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690625594;
	bh=e5qRP58sXUjxxjVtvykFY2nDh4nODzU0OW9ZJXKMiHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gWsv+BT5TiVW2HgwHrYaki7yauIZECpn8pjC0wHgTOGA/SvdFagSy9B7PNPhMSQ4z
	 /3Hvriu2otr2fI7ysVxMGeEvUHdjxv6O07ope55PNwXE2fdoyBLjRDg7EzWGZrE5VG
	 I0pXWVTxNXLXk/1J4USlWHds3gU1CvIvj00AbM4VgM2UyMkouGsxyGt/eCHK56+ftU
	 QvlxzxaX3v0VV6JatvSC1nCHZySG5Yv/Mr4YtKCTv4+ZsdowJU9jHIoW6en74g8brT
	 pVOarJvHkkpkEiCV6tEHe3K2y5ybLMSqWy2Ayr9jiQJ+1Zl0eRNMjLi68eS5gK4CEs
	 0qvH+V466Mxkw==
Date: Sat, 29 Jul 2023 11:13:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: claudiu.beznea@microchip.com, lgirdwood@gmail.com, broonie@kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, codrin.ciubotariu@microchip.com,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 31/50] ASoC: dt-bindings: microchip: add sam9x7
Message-ID: <20230729-contently-gopher-27c3ee182aaa@spud>
References: <20230728102828.266861-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jbAX9C9n+mrlLIx0"
Content-Disposition: inline
In-Reply-To: <20230728102828.266861-1-varshini.rajendran@microchip.com>
Message-ID-Hash: CVIIAGDBJAT5OAJ2AGHV6QJ343O6Y453
X-Message-ID-Hash: CVIIAGDBJAT5OAJ2AGHV6QJ343O6Y453
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CVIIAGDBJAT5OAJ2AGHV6QJ343O6Y453/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--jbAX9C9n+mrlLIx0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2023 at 03:58:28PM +0530, Varshini Rajendran wrote:
> Add sam9x7 compatible in the DT documentation.
>=20
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  .../bindings/sound/microchip,sama7g5-i2smcc.yaml      | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/microchip,sama7g5-i2=
smcc.yaml b/Documentation/devicetree/bindings/sound/microchip,sama7g5-i2smc=
c.yaml
> index 651f61c7c25a..fb630a184350 100644
> --- a/Documentation/devicetree/bindings/sound/microchip,sama7g5-i2smcc.ya=
ml
> +++ b/Documentation/devicetree/bindings/sound/microchip,sama7g5-i2smcc.ya=
ml
> @@ -24,9 +24,14 @@ properties:
>      const: 0
> =20
>    compatible:
> -    enum:
> -      - microchip,sam9x60-i2smcc
> -      - microchip,sama7g5-i2smcc
> +    oneOf:
> +      - enum:
> +          - microchip,sam9x60-i2smcc
> +          - microchip,sama7g5-i2smcc
> +      - items:
> +          - enum:
> +              - microchip,sam9x7-i2smcc
> +          - const: microchip,sam9x60-i2smcc

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--jbAX9C9n+mrlLIx0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMTmNQAKCRB4tDGHoIJi
0iM1AQCyockr49QodvoBZKhRj4Gd4MI3M+haAHo6hUQYCjQvtgD+OBIg06DrKxU5
mH4EWIWlfM0YArsyJUFo8x5egfkCcw0=
=XpDA
-----END PGP SIGNATURE-----

--jbAX9C9n+mrlLIx0--
