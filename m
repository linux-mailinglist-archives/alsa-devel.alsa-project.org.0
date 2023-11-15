Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1007ED65D
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Nov 2023 22:55:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3218E82A;
	Wed, 15 Nov 2023 22:54:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3218E82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700085338;
	bh=HNdL+Be6cMlMkW4vDhJAvj7UWUwF0byt9crJztV3lyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tFqHsPVJ2n9c8UDX3TLZg4q4MIVfCuu8YQtjt6uFz2eF/gOog2tvMt2MeK10CIPIl
	 0Lr/Xt/Ohgo9w6BHriCqFZuxVRHLEWx4SvCWdFvuB5mJo/myNKeGMuW9NyZsqClbnI
	 T2awORfbN9Xwv19WBt87u6xeYu+Ti7cE84+Z9/sc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECBB8F80549; Wed, 15 Nov 2023 22:54:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 820D1F800ED;
	Wed, 15 Nov 2023 22:54:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4044CF801D5; Wed, 15 Nov 2023 22:54:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F33CF800ED
	for <alsa-devel@alsa-project.org>; Wed, 15 Nov 2023 22:54:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F33CF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uuUklBQ0
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 65FBCB81C4C;
	Wed, 15 Nov 2023 21:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E85AC433C7;
	Wed, 15 Nov 2023 21:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700085257;
	bh=HNdL+Be6cMlMkW4vDhJAvj7UWUwF0byt9crJztV3lyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uuUklBQ0B/CTCk0nFXbhW8lC3h087uMYaSyhnyTxcDjjo05NoFHRTxCsf+K3hP2SC
	 HA7aqD+mPmtWsMirc0/Q3VlWZNTSx1vCuEdAgBxm6hI1OtSGe26oCEWWt0h8tZZMQ8
	 Kr8FrFtXZwKxnxh2h8uudv9WpK4euUj9kscV2GlymFLqce8HBRSDaTafn8r38UtQyG
	 0TDEE3rZaQZQGM8gmluT3YqOxkcMgHxeabQrqScGxGJK4E3EZUjh+Z0ZYgPuVNF3NE
	 xpG3XmKSPfLH10ibWUInlQUJ22O2/Mhp4vNZn5PULLc5AvxwDFmjfrVmwdeuGM6JcY
	 yJdmpGpOBwM3Q==
Date: Wed, 15 Nov 2023 21:54:14 +0000
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] ASoC: dt-bindings: renesas,rz-ssi: Document RZ/Five SoC
Message-ID: <20231115-support-hankering-907c9f496a52@squawk>
References: <20231115213358.33400-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5vok2DPxacar78Hn"
Content-Disposition: inline
In-Reply-To: <20231115213358.33400-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-ID-Hash: MG4V7ZMGSQ5DEX4HO2C452D2LPHDWPGZ
X-Message-ID-Hash: MG4V7ZMGSQ5DEX4HO2C452D2LPHDWPGZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MG4V7ZMGSQ5DEX4HO2C452D2LPHDWPGZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--5vok2DPxacar78Hn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 15, 2023 at 09:33:58PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> The SSI block on the RZ/Five SoC is identical to one found on the RZ/G2UL
> SoC. "renesas,r9a07g043-ssi" compatible string will be used on the RZ/Five
> SoC so to make this clear and to keep this file consistent, update the
> comment to include RZ/Five SoC.
>=20
> No driver changes are required as generic compatible string
> "renesas,rz-ssi" will be used as a fallback on RZ/Five SoC.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor,

> ---
>  Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml =
b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
> index 3b5ae45eee4a..8b9695f5decc 100644
> --- a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
> @@ -16,7 +16,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> -          - renesas,r9a07g043-ssi  # RZ/G2UL
> +          - renesas,r9a07g043-ssi  # RZ/G2UL and RZ/Five
>            - renesas,r9a07g044-ssi  # RZ/G2{L,LC}
>            - renesas,r9a07g054-ssi  # RZ/V2L
>        - const: renesas,rz-ssi
> --=20
> 2.34.1
>=20

--5vok2DPxacar78Hn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVU+AgAKCRB4tDGHoIJi
0u9xAQCy6Ri2/SWQe6N9pq0RvPqF9PoATlrxkwPve5pN0sw1QwEAuu5eaYnksBkj
LccHnxnG5WeHC80HRTULAmQagAAjiQw=
=THQ4
-----END PGP SIGNATURE-----

--5vok2DPxacar78Hn--
