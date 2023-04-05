Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFED6D7B0E
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 13:19:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE04F1FA;
	Wed,  5 Apr 2023 13:19:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE04F1FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680693595;
	bh=WILsMbiHl9OhlfV8BYyg53kNlzLX4cw3SIrzjAeuyow=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tMLjQ7LG3pJDiJZc5/Qs4Yan8OMPQPK4O2jAaUjaLv8WxmXmU1de2ZFX5Jtlfgy85
	 XvZURmbo46T8rxtFaBc2i6VSEADG6t2+CRiJyRbkJXj3WRabUS10HhGP/xPUYR53Ap
	 s8A3TLMpaRgHH0UU4PzYZIoq/zz32nKDQg3tvcdU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4E9CF80249;
	Wed,  5 Apr 2023 13:19:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35F4DF8024C; Wed,  5 Apr 2023 13:19:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 57966F801C0
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 13:18:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57966F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BoTBiqKV
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8290163BFB;
	Wed,  5 Apr 2023 11:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D69EC433EF;
	Wed,  5 Apr 2023 11:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680693534;
	bh=WILsMbiHl9OhlfV8BYyg53kNlzLX4cw3SIrzjAeuyow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BoTBiqKVIUFeUeoqofxdJuLLIofZTpy1kXx1KWvWBnRAqmmkVgw/SSLZGxxBLUhp/
	 bRJylJpPEmO6IG8t+WZI5u4pHINn1+3BihzmncjmUbb++jtfXLkRPQR36HnlysQ+Ek
	 0emFGVJ9TYn/rUGOW6fKyi6uHe2fFBFMye9V+vPVqUX6Rjxmfk3IbvLGAhJitO8gCx
	 RpIutyMbRiuXIEDZvjMjasHalhIHQgfA6GC717cwFTZH39DtlBKo5DeBQi4NkSk6iw
	 FyHXwGEunWG/ltPki/e+4Lf7Sj4vQflSw9eaoBYktLS9kn5r0cVeUqYWETtqcnb580
	 YWnLaXXsrIwYg==
Date: Wed, 5 Apr 2023 12:18:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH resend 0/5] ASoC: clarify Codec2Codec params
Message-ID: <291632a0-ab6c-4dcf-9e96-49e21d034468@sirena.org.uk>
References: <87pm8lc2m7.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RSVpEfehx9Yr76ld"
Content-Disposition: inline
In-Reply-To: <87pm8lc2m7.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: 1 bulls, 3 cows.
Message-ID-Hash: SUUSJTGDQAEFOBVMEMJZP3U3HWN5MTXR
X-Message-ID-Hash: SUUSJTGDQAEFOBVMEMJZP3U3HWN5MTXR
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SUUSJTGDQAEFOBVMEMJZP3U3HWN5MTXR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--RSVpEfehx9Yr76ld
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 02, 2023 at 10:59:13PM +0000, Kuninori Morimoto wrote:
>=20
> Hi Mark
>=20
> ASoC is supporting Codec2Codec, but its parameter name is
> "params" and "num_params" which are very unclear naming.
>=20
> This patch-set clarifies it by replacing to c2c_params / num_c2c_params.

You should copy the maintainers of the drivers you're updating on the
patches for those drivers, otherwise people might not see and review
them.

--RSVpEfehx9Yr76ld
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQtWRoACgkQJNaLcl1U
h9AZQAf9FMXwfwI2erC2xx45Wa3+iReJkAZIC0nH+Eh38vLg+dutuvFpp9nJhpt9
uYAQ3letvs+haAQQGggLm9Ik84NVIoTVfk5sox5qnkOv/T6KKiB6TV0jEsAj4NwM
yxTk3fM7CLI3LQYEdmVYDR26Qu14ikNJuYWzYgVvu3Qd1qtmA7kjAHYLIy+dQuNi
LwGwDXXSJL1gXMy3wazhclWBA0Cvj8sZcvMxx4jIVmawRw+bj5Jsv7imi0/1apVZ
MSGnU/goAh/Xl4sng0zkJIdKQLCqdHUjbmLkL3+dwekx3FLcgrel04AWsBXPgNfJ
JU1KbQ/Br/yauqGcLmkomfbu9RtRrw==
=thWL
-----END PGP SIGNATURE-----

--RSVpEfehx9Yr76ld--
