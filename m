Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E7D595EED
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 17:23:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B794F163B;
	Tue, 16 Aug 2022 17:22:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B794F163B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660663428;
	bh=xrDCB4OmeL6+7fKYPfxbbZn7I+eTh2nJlmb4GRfx3H8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qockqo00jlOZpeg6C5LzQf98qRpCYvVMoZcLIJ3SaHIWJbW93GU4HtYkbTK4UYb4T
	 g+dCkHGfYsDRwjV60pKDHY/0JvPPhZIj9DzyqxFCvdHTm7+Vx+0nWKh2i56UFzZ5XK
	 z5aA6Y2ARANvPjyxau4pfUgOB5rgWhXg9M50iFJU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 070A5F80118;
	Tue, 16 Aug 2022 17:22:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3347BF8032D; Tue, 16 Aug 2022 17:22:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE938F80118
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 17:22:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE938F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="a7+mnnRF"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AD755B81A56;
 Tue, 16 Aug 2022 15:22:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79BD5C433D6;
 Tue, 16 Aug 2022 15:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660663361;
 bh=xrDCB4OmeL6+7fKYPfxbbZn7I+eTh2nJlmb4GRfx3H8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a7+mnnRFvr2drlaxLAzWPMn5cEOaNq9deIPJOIJPTOe6zobX4/lu6dzJDpW4rTICC
 K8e5P3W898ky0jrDbYivGDT0fe5jevay2pL6ljFG/vNHBpdR7S9OBrZ9aopda8Uts5
 bMyXeVYqp/OnZPUvGkkxBG++wOnPKJRqN6lL/hSQDAXFxcLZ866/49hX4crsCvs9++
 SPqfnLuqRob/oXTM7dDpzLSY35zpWnfRu7Mf1eEhylAGPvgrrN9TPfrN206s9UtXD8
 j8ujT+OTJZsA3c3aLlDT4eCjW7JcZ91FVnIXvvNk1kGno7mCi+hZ+xNbkeD9myziXR
 NaniY1k129n7A==
Date: Tue, 16 Aug 2022 16:22:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Subject: Re: Rockchip I2S commit possibly ignored
Message-ID: <Yvu2PRrQvsRAJSm7@sirena.org.uk>
References: <YvuYZE0biiAn/sxQ@geday> <YvuZbrBWzRjHYQZj@sirena.org.uk>
 <Yvudjkjxtv7M/DPL@geday>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gKqC/VCI0nI7SNtM"
Content-Disposition: inline
In-Reply-To: <Yvudjkjxtv7M/DPL@geday>
X-Cookie: A bachelor is an unaltared male.
Cc: Sugar Zhang <sugar.zhang@rock-chips.com>,
 ALSA-devel <alsa-devel@alsa-project.org>
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


--gKqC/VCI0nI7SNtM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 16, 2022 at 10:37:18AM -0300, Geraldo Nascimento wrote:

> This isn't my patch, it's a patch by Sugar Zhang from Rockchip that was
> supposed to have been applied one year ago, give or take 10 days. I
> can't resend a patch that wasn't authored by me.

There's absolutely no problem with reposting someone else's patch - just
add your Signed-off-by at the end of the signoff chain.

> Therefore I don't see the point of your complaint about "content free pings".

In general the answer to "what's the status of this old patch?" is
almost always going to be the same so there's a form letter for it,
especially with such an old patch the chances of me having any
recollection of what's going on are minimal.

--gKqC/VCI0nI7SNtM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmL7tjwACgkQJNaLcl1U
h9CmKgf9FMOrsPsMboDZFXc2fPP6G69dLWyBwfG0XbBPv16B648giO1jGD7Kf6iD
QLTxK7XZyRLwtue4NoJ3qqrAaE3sQeWLd1VUyjj81dYszg6W1zwbnk+JBrCkr3Jq
09I2Hxe+leu/NYWOENNk/GvujpmD+X2zsQq97H79auabE2cxnLy9nm4Uy93MbsDB
5rW06LWjwr0gdL0mmG2ZwkE+VY86wsqTODeSdGbPP5Gfp71TrpXm8hmrNYi76ax1
GJEpEWh6C5czCzdEt00sq5yqlduQffIZ8eUDXJPe6Uzfi6gZRQHeL8pAlXFKN/Xo
+064BIft0Y89eOGKajp3Soqken6oFg==
=djLd
-----END PGP SIGNATURE-----

--gKqC/VCI0nI7SNtM--
