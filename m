Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B12C77C5606
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Oct 2023 15:59:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF42B16F0;
	Wed, 11 Oct 2023 15:58:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF42B16F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697032763;
	bh=Sp/PMheWiBZvxLj/0wIt/cPGBYRP1fOe19OaWdOuP7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dNpMhcBCCEv0Amw4+lQAZVCTNoBcIrpyXvhC9rrkEvH2PuF4Owt43pt2G4/OhZu6T
	 HwMRm1BtFW3zf/xO036gEON+ZIKAFTs4Y8Yba2z+GrTmgbbn8f9k7AN9yUvKh46ieD
	 kzt0QRvRMfLtbv5xb9MCtoP3pUpLGngRcRtyk9co=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A674F80553; Wed, 11 Oct 2023 15:58:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BE49EF8027B;
	Wed, 11 Oct 2023 15:58:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0538F802BE; Wed, 11 Oct 2023 15:58:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6953F80130
	for <alsa-devel@alsa-project.org>; Wed, 11 Oct 2023 15:58:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6953F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=U4d2nGXU
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9A94ACE23E1;
	Wed, 11 Oct 2023 13:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3F7CC433C8;
	Wed, 11 Oct 2023 13:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697032698;
	bh=Sp/PMheWiBZvxLj/0wIt/cPGBYRP1fOe19OaWdOuP7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U4d2nGXUeMqJkoePmQd/prAIA6PkiKZgJWdcv4G4rpsAtAAdLBXxqiVhgXNZpfdbn
	 fLEAqrpw2CzBWkII/486PtevTzRMR9Hdy45sMgToCVeco1fFmZVDH4Yh04wP0p5sqv
	 L3EIJ20S8X0FOhWUii3tqTVRVEdAFItfmuJy44Qk15Bgr4FA/RpkOChVxAtD2i2M+S
	 +tCy1NawSjUGnkSRBwljfQg06axD9ZIX0e9XM+v0EBGwaKn9VwEhSVDtzJyaKHL8L+
	 uBDN7V6NU5P9T262lg+dZgsdSXtNpGjlsG0jB7GKFQvPRTlOMWQngP5/SiuSlEPZCS
	 Q9oXvTTzRYLCg==
Date: Wed, 11 Oct 2023 14:58:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>, bard.liao@intel.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/4] dt-bindings: audio-graph-port: ch_maps property
Message-ID: <20231011-crazily-mangy-2302e41eb743@spud>
References: <87mswp1ytu.wl-kuninori.morimoto.gx@renesas.com>
 <87h6mx1yrp.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wtIfDz3Ei+OZ6nrI"
Content-Disposition: inline
In-Reply-To: <87h6mx1yrp.wl-kuninori.morimoto.gx@renesas.com>
Message-ID-Hash: AASITLXUIWRQKG2XUZPPRODQTQSW75SU
X-Message-ID-Hash: AASITLXUIWRQKG2XUZPPRODQTQSW75SU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AASITLXUIWRQKG2XUZPPRODQTQSW75SU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--wtIfDz3Ei+OZ6nrI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,


On Wed, Oct 11, 2023 at 06:03:38AM +0000, Kuninori Morimoto wrote:
> This patch adds ch_maps property to enable handling CPU:Codec =3D N:M
> connection.

I only got this one patch, so I have no context at all for this change.
Given that, and since I know almost nothing about sound stuff...
>=20
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  Documentation/devicetree/bindings/sound/audio-graph-port.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yam=
l b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> index 60b5e3fd1115..dc663af784fd 100644
> --- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> +++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> @@ -19,6 +19,8 @@ definitions:
>      properties:
>        mclk-fs:
>          $ref: simple-card.yaml#/definitions/mclk-fs
> +      ch_maps:

=2E..I have absolutely no idea how I would populate "ch_maps" correctly.
Please describe (in the binding) what this property actually does
& how to use it. Also, properties use -s not _s.

Thanks,
Conor.

> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> =20
>    endpoint-base:
>      allOf:
> --=20
> 2.25.1
>=20

--wtIfDz3Ei+OZ6nrI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSap9gAKCRB4tDGHoIJi
0kgCAQDPR3AY6kld6KmEfsA9NpzoveO/c0PurdLJafcM+roPBwEAuteJVaW9IFsr
mIb36oyEvwfSzfOs0ebjaPisw0JKZQ8=
=mmUS
-----END PGP SIGNATURE-----

--wtIfDz3Ei+OZ6nrI--
