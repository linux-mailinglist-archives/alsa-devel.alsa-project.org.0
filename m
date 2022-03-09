Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DEA4D34CE
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 17:29:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74EDE1708;
	Wed,  9 Mar 2022 17:29:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74EDE1708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646843395;
	bh=DS+oE04kyudFCTkstsu3g7zMI59LZmfzAO6EZZPQtMs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dw1+GRx8mtTNnDUJEkcDCkFYo5EC5aw6FkI+uRtUOH+D4few2NLMnbYPljGXbvfUb
	 2C4LP9KlEUuWFs5kXftMr7y5bwaLZa2rwqAwySz1+mu46TFcDQLYoB1BJqdvV2R9kX
	 37ODEdJsCwyyijmzb16Zj22/KnSoQ0OuGfUFxy4U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD178F80236;
	Wed,  9 Mar 2022 17:28:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34D72F8016C; Wed,  9 Mar 2022 17:28:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36DF2F800D2
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 17:28:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36DF2F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="A8MCJiFH"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 28DCA61983;
 Wed,  9 Mar 2022 16:28:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 011F0C340E8;
 Wed,  9 Mar 2022 16:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646843315;
 bh=DS+oE04kyudFCTkstsu3g7zMI59LZmfzAO6EZZPQtMs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A8MCJiFHiTQWbtViiT3H1FPZssWaHXuBwm5R+INyosPJDE7Pdmj0pP5w/FCak4VwF
 OYSfBRV5tj6FUUDnHFmJ4t8tCs5h+qCnDXJHVu00d9wH4oFyqh/LyWEXGCumqC2Mml
 9VRks5GfifmeJGjVBRzlXQbLWESutw5NTVOh1h8ExebetxR9iBr6oOHy4ON1mO+vM1
 fNNPusfql4JD/p3fX9QV5A2yzd31R3i3AWaj+l1PPDBxmmkRW8JyttRppFJbirtjb0
 7Edg8SAid7J21LXqUpoRyFw5Rpj6G6T2o8G1cXqL3YhqUmRJxcUa5gHymRYJEdzKBx
 Ej/IoEqYRkNYg==
Date: Wed, 9 Mar 2022 16:28:30 +0000
From: Mark Brown <broonie@kernel.org>
To: John Keeping <john@metanate.com>
Subject: Re: [PATCH v2] ASoC: tas5805m: fix pdn polarity
Message-ID: <YijVrgZ+Ysv9J/8E@sirena.org.uk>
References: <20220309135649.195277-1-john@metanate.com>
 <YijOHNT0eqDyoviP@sirena.org.uk> <YijTk0/UTXpjFiRq@donbot>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cL1aqbfsnd4ieXht"
Content-Disposition: inline
In-Reply-To: <YijTk0/UTXpjFiRq@donbot>
X-Cookie: You will inherit millions of dollars.
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Daniel Beer <daniel.beer@igorinstitute.com>, Takashi Iwai <tiwai@suse.com>,
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


--cL1aqbfsnd4ieXht
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 09, 2022 at 04:19:31PM +0000, John Keeping wrote:
> On Wed, Mar 09, 2022 at 03:56:12PM +0000, Mark Brown wrote:

> > I'm still not seeing the functional change here.  The actual state of
> > the GPIO is identical in both cases, all that's changing is the logical
> > view internally to the kernel.

> Ah, sorry, I'm considering it functional since it changes the device
> tree ABI.

> Used with the same device tree with, say, GPIO_ACTIVE_HIGH the physical
> state of the GPIO will change as a result of this patch and the device
> tree needs to be updated to use GPIO_ACTIVE_LOW.

I think the device tree binding needs to be clarified here to be
explicit about this since there's obviously some room for user confusion
here.  We can probably get away with a change at this point since it's
not hit a release but we do need to try to avoid the situation where any
other implementations use active high polarity for the bindings.

--cL1aqbfsnd4ieXht
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIo1a0ACgkQJNaLcl1U
h9CyUAf9Exxd5mQWala73V08LmWHXe6yGnuDEkHamyXdTiMDrKyxL2PYq6hwaykr
PCFp/rVwWTvXeB8BkEPJ2MJzpatF+uhcZBPcK3eFTPDXY/goBWNsYzSOzC+a3ahe
PgUv4Gf92Z/RR5OFKraL/lkTVaQB975Nraih9gXu4SUBtC91cKPKuAXjSXzEWAgl
8rgrqlnZ7AK6p+GIkIfhx7IyvxIy1GoC5z5anJsZRyo9T6UlLsj2TywkM7aAPaML
5YVZg5qoP650il8F2FiCxEiZYKM/tQEu5k19NEtGgl2XUP2mYyEGKKG4TcXqoej/
9FONTmDDbDyQL3EYy+B4NIEcNzdfcA==
=bQ22
-----END PGP SIGNATURE-----

--cL1aqbfsnd4ieXht--
