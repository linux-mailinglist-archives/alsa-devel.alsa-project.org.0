Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E01E25383CC
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 17:01:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EEA61DF9;
	Mon, 30 May 2022 17:00:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EEA61DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653922892;
	bh=uj+z1qlEESMX82meHdMbnNvB6nczjKH+bsATTtquwzM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z5fWLwuaGsicSDKlcQhNoRagUlZDe4ISWLOtq2nEheQnyTmsjKDU0oxrJt647mKd+
	 f5dSyLEOmd+fZAp00eRBCh+A7p0kh6kJuerRsAOAUe/KaU1sMfkpvermBhUEQSq499
	 0VkdIOqldMN7oCdpAhoL0ATeKDUURpEwJwEupYCo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F2D1F801F5;
	Mon, 30 May 2022 17:00:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 001F7F8019D; Mon, 30 May 2022 17:00:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DC01F80124
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 17:00:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DC01F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ENuUBbhU"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0B63860FB5;
 Mon, 30 May 2022 15:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 167C9C385B8;
 Mon, 30 May 2022 15:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653922823;
 bh=uj+z1qlEESMX82meHdMbnNvB6nczjKH+bsATTtquwzM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ENuUBbhUzPFE1vwSZKGt3KRtegFJj4WqaXVVoBpXfdKRDojn8jM5ECil7/Ad8feD6
 xlvVixaDwXTH5quw54JgAnL3eQ8WxgmCtndqOvXzoMYXqwc7xc2QGqhgW7V3D5yZ3D
 hZwXOYtDPPU9tpB/JCiv29ZxcRgIyARoqzwZNDbhe05ecQQyLhLVM4KR+AhfvgBEU5
 7J119/42LdErd79frKsf5O9eivp9Fa7m1NAjbzQfVnh5OTwrGojIRxgGVLKNt3Rhb+
 /8Xq9z//XwTvC/WiCwHDF4fNfe2eQ6+4yPSN4b/81EGqh3nzilC+Z4I43r4RrVp+bp
 0A6hghXIvUlqw==
Date: Mon, 30 May 2022 17:00:20 +0200
From: Mark Brown <broonie@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ASoC: da7219: Drop no-op remove function
Message-ID: <YpTcBL2UoI8sSiUb@sirena.org.uk>
References: <20220526204145.1725323-1-u.kleine-koenig@pengutronix.de>
 <20220530083616.xggbphc7ip7h2jr7@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/gzjXMKDVbbvy6Sj"
Content-Disposition: inline
In-Reply-To: <20220530083616.xggbphc7ip7h2jr7@pengutronix.de>
X-Cookie: May your camel be as swift as the wind.
Cc: alsa-devel@alsa-project.org,
 Support Opensource <support.opensource@diasemi.com>, kernel@pengutronix.de,
 Liam Girdwood <lgirdwood@gmail.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--/gzjXMKDVbbvy6Sj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 30, 2022 at 10:36:16AM +0200, Uwe Kleine-K=F6nig wrote:

> This patch conflicts with 89be5dc60d67 ("ASoC: da[79]*: use simple i2c
> probe function"), the trivial(?) conflict resolution is:

> Please tell me if I should resend the patch rebased to
> sound.git/for-next (or 5.19-rc1 once that's out). The same applies to:
>=20
> 	ASoC: lm49453: Drop no-op remove function
> 	ASoC: da732x: Drop no-op remove function
> 	ASoC: ak4642: Drop no-op remove function

It'd be really handy if you could resend please.

--/gzjXMKDVbbvy6Sj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKU3AMACgkQJNaLcl1U
h9DbdQf/fgzFrwb4QpFwxoZ4KiNFLfJ0pMpSblzvY1QlNv58cvV6NYoVRpAYedeP
mjHFLrb7RTUnNVeXkEZBJdpb/QY36km2IzmxaJqAogu66suysDYc7uALLxhQP24v
1vVtl2q9j8n+aVRIbcBlMzXmlkdEgQLl7Rqxq19VR2isHKLrONllBiiyO6WKHk/q
yrRgfV4fnZqncI+QswGubwtsmPoY3RUaoopBLi/crzPkod2tAttaFpE9PGCdwhYQ
eYx5/K0+dHPBVRxeehwWvH2ithhr7tDDXDabcLX69BY68950DJrEPy+WzTNfCC51
Urb+gg6Bzz/wKQZGmtpy2HXueriM5g==
=knGb
-----END PGP SIGNATURE-----

--/gzjXMKDVbbvy6Sj--
