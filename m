Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA9553E5C9
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 18:53:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7B80190A;
	Mon,  6 Jun 2022 18:52:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7B80190A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654534417;
	bh=MXysSCdlCXdhPysWEuy4446I/A++jIP/2fCry28Y4Q0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XN4+hSn8wY8z358LJI+/uChdddKOxV9vpqOJDBL3BgE4L7j78C8Ekmr6xJa6Y5VUM
	 GkI5e2DLkHB2rxyb/gA7CmWDb0kEy7+2D8LW8aFHSe1Fz6HjysSEb5OL+xivvE4v8j
	 eumsXoJDsCqXVBe6CEnGH+J2f24GgiSnfO9g1SqI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22319F80089;
	Mon,  6 Jun 2022 18:52:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5144AF801D8; Mon,  6 Jun 2022 18:52:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06CA3F80089
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 18:52:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06CA3F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nITYHmyS"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6264560FA4;
 Mon,  6 Jun 2022 16:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D9D5C385A9;
 Mon,  6 Jun 2022 16:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654534353;
 bh=MXysSCdlCXdhPysWEuy4446I/A++jIP/2fCry28Y4Q0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nITYHmySBT4H2ndTozjcWvwwVDaUHkoReUGsb96w+9AhYWuODnEeqBgMUUxpJEJcv
 i7kbSac7dUwa6EFpbS26Opd5UKckgunkfeyJsC8eLz8p1vlOoBrpQ+CnM1CZxDyIvn
 K8nDU0Hp7hZptDnVyjeFBVx5KdC5Ps8HHJAlTz1eY9+TBU5I0D6Nj3w3HPGVDv7q8O
 Gx9Zjf3ImtSKtbe2+xtjXjgGcoEkyiC8lrbsJ2UMtEYBr3NkF20K5iPwZJCis7da1m
 K6AgiooMZ6mRItSBZl5c8wV4N9J7sh87u5H9Z4UWDquIs+oXElZBehmuxck6za1zg+
 YTYsN2Q8dHM4Q==
Date: Mon, 6 Jun 2022 17:52:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH 1/3] ASoC: wm8940: Remove warning when no plat data
Message-ID: <Yp4wzS0aLEo5werI@sirena.org.uk>
References: <20220606154441.20848-1-lukma@denx.de>
 <Yp4iGvGFD9jo4WUP@sirena.org.uk> <20220606181731.04b6f771@ktm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="DnUb2V3oewQhXa9l"
Content-Disposition: inline
In-Reply-To: <20220606181731.04b6f771@ktm>
X-Cookie: Bedfellows make strange politicians.
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org
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


--DnUb2V3oewQhXa9l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 06, 2022 at 06:17:31PM +0200, Lukasz Majewski wrote:
> > On Mon, Jun 06, 2022 at 05:44:39PM +0200, Lukasz Majewski wrote:

> > > The lack of platform data in the contemporary Linux
> > > shall not be the reason to display warnings to the
> > > kernel logs.

> > Given that the device requires configuration and doesn't appear to
> > have any other firmware interface support that's rather a strong
> > statement...

> My point is that - similar codec - wm8974 don't display such warnings.
> (this code was not updated/refactored for a quite long time).

Perhaps those drivers are buggy, or those devices lack this specific
configuration that's being adjusted?  The changelog should at least
address why the driver was warning about configuration being required
but it's safe to ignore that.

--DnUb2V3oewQhXa9l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKeMMwACgkQJNaLcl1U
h9Dfdwf7BcW0Luwaf8iLkn+kS1NPDO2F0CgLVz9wodRDv4DvL2A3SUWnkJpnXJ9m
78MEIJoERftkH+Rq91eh7AZdeNGOV4tS7ClPQTT7pBlo5W31In2ze7zIzubVXNB7
LenThDkhWRLHemUN0uJLBXOPsHhj2FcSHXHlDzzw251gIHLnIPDQXNq6JYhKEDjM
2NQkcxBknKwDkWvjHfZVtz2ZbDLuj0RulTq/nZIPzqagh8rSNSX0xt6X5xy9y1Ro
XMaWYO1QXAZgzgB1TQnMfVP3I5MRR0nJUfa+0zSuhcsv44heFMys4zTOIdXbljKH
B86nzaXNknlgutl3b0GpxPe8N9KPQQ==
=WRfG
-----END PGP SIGNATURE-----

--DnUb2V3oewQhXa9l--
