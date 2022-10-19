Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD9D60458B
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 14:41:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A91C28575;
	Wed, 19 Oct 2022 14:40:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A91C28575
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666183266;
	bh=8d6CdrccoT97cECfxO7g6a1f4262AbKj4LgQxlbZkwU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mJ8ingfTy2mPasPTF5NEuBa9J1UfAEEBAr01u+U+JUdyLHZB8A7XUOAmtftThbsq7
	 57yntnO4HYftk7ANc67qxCDnD+0KpUjjVXO5hcQT/tZy2sronrkjcuBwq8yEqbGVlA
	 FK6azC+lRomliMvVTP52chMm5Knzv0dJpXLB0TSc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14659F804E0;
	Wed, 19 Oct 2022 14:40:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1340F804CC; Wed, 19 Oct 2022 14:40:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32359F80137
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 14:40:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32359F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SK8O4ky0"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6EC11B82221;
 Wed, 19 Oct 2022 12:40:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 247A9C433D6;
 Wed, 19 Oct 2022 12:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666183206;
 bh=8d6CdrccoT97cECfxO7g6a1f4262AbKj4LgQxlbZkwU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SK8O4ky0fQMSolFb3X8ZM7WVIicmqRC7UhjbaecIOdbxO+xNDylUl3MU1PJ/Di9K+
 kcE5wyJk1zQlNK9EV98lwe9t+ZYnJCxPo5ff8moOPMCaIjhiDE+Na+XeYLfMbyvGK+
 Gqi9JoEV1JBL7hjIMIQsTjX532US5gfOGtf4EIMfIrQj00cBxsLuAHY1D0/524sg2i
 0xEWu1eyNZjxkU21pnwACWTN9jk+5dii9c/af14bIjb3YO2hnsDTU9Q06M0Q/I1etB
 2d3svVuKFbybaONqrM/zas28bHssLFMgP2+kKkV3JLPeJe6LuhG1Q5s0QnVFLbRwst
 E/MhU1I/LumDQ==
Date: Wed, 19 Oct 2022 13:40:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH][next][V2] ASoC: codecs: jz4725b: Fix spelling mistake
 "Sourc" -> "Source", "Routee" -> "Route"
Message-ID: <Y0/wIPFAWH3cLQzx@sirena.org.uk>
References: <20221019071639.1003730-1-colin.i.king@gmail.com>
 <Y0/pSVbueZYXBsmA@sirena.org.uk>
 <S820KR.GPNPWZ8QG3PG3@crapouillou.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="BarSh9pR8ITjJrt2"
Content-Disposition: inline
In-Reply-To: <S820KR.GPNPWZ8QG3PG3@crapouillou.net>
X-Cookie: I like your SNOOPY POSTER!!
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-mips@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Colin Ian King <colin.i.king@gmail.com>
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


--BarSh9pR8ITjJrt2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 19, 2022 at 01:19:40PM +0100, Paul Cercueil wrote:
> Le mer., oct. 19 2022 at 13:10:49 +0100, Mark Brown <broonie@kernel.org> a
> > On Wed, Oct 19, 2022 at 08:16:39AM +0100, Colin Ian King wrote:

> > >  There are two spelling mistakes in codec routing description. Fix
> > > it.

> > Bit disappionting that people didn't notice the errors during boot
> > there...

> Well that's on you. You merged the patchset before anybody could review.

That includes whoever wrote the code in the first place, and I do note
that I applied version 3 of the series.

--BarSh9pR8ITjJrt2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNP8CAACgkQJNaLcl1U
h9Dvzgf/UwmdmQxOamn+37JPevW80uGyuE3ITBXUK9gT2Rb2ow1M8Bdm1QmlUjTx
OImxIOYNNXJ+DZ4Tec4ybjtwlB0EaUvXRiw8TWePLZKwRDDrYoVSSyBfagTYSchD
OUOIGJgifR/ECR15TApRJX2CyGCeoe0V31Vz0IkQD12a7xbVvdg8+3AbTp8+yQvD
IJJTM0S/HUn07KktLl2xDFNvtSdPOekZE1Ju6sBd6i8ByNUcvOqGCp0pXUZnbTXy
2LuOq+9qdh5PngUcDjlQ90B2sh5fIYJEu2hM+xRuLPbW0ENzS7pm9DNuvuIvTGYL
BiboNnUF477UdJpVstIMKfqk6YIT5g==
=fKUT
-----END PGP SIGNATURE-----

--BarSh9pR8ITjJrt2--
