Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE8C544C32
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 14:35:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D49901A8F;
	Thu,  9 Jun 2022 14:34:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D49901A8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654778119;
	bh=8FAuejtVivSwygGx9dQCgmcvz64Gm3mug+UmU23znSQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h9FfUYT70aDh4nqFdeR4iH72+WryqpHQ1PKpCL2YxUKzZqspA2ffON19xCSyNOEij
	 hS7Es8/ZbhFo5olJdcsy67rlpXG97mjxHXIM5j74wgxzgBVxJHCOEe913XkOSPt71R
	 HgcQYCfKrOrdl2QQJtgK3KR8arKNy9NhODzAyWu8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A7ABF80116;
	Thu,  9 Jun 2022 14:34:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A231F8019D; Thu,  9 Jun 2022 14:34:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A94AF800E9
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 14:34:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A94AF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iTG6DVOY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 47094B82D85;
 Thu,  9 Jun 2022 12:34:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5502EC34114;
 Thu,  9 Jun 2022 12:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654778053;
 bh=8FAuejtVivSwygGx9dQCgmcvz64Gm3mug+UmU23znSQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iTG6DVOYR2tESXLnuPzLMfjpn791/C4fdVOQ9DVnwPH1SGrd1t/HajT9FcXwIotaz
 jQOz1nBaXfoET++jK1nqSrl+yyLCDmtZCeS48RQfOINYKdG0JXpOJW2c5KGLNRT7JM
 oVXEwG2v3rumfoszmZhF1eZhqsett7l6A6IIqt9uVAHdxa7ZByQJt609S8jZzaRbO3
 85hCYG4o95I81Am9IM/rfDgmMSgTXKsAik7+0eRbVgyE7BmoNbnZ6+ZEedBba+YFiX
 hnHCsXJUezdwtIi+rR8C+44gK0jIOMjOeFTbncls5l8YpyoBHwQmSYhduZjrQcmN09
 n04pRviD1rDNA==
Date: Thu, 9 Jun 2022 13:34:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Sascha Hauer <sha@pengutronix.de>
Subject: Re: Audio mem2mem devices aka asymmetric sample rate converters
Message-ID: <YqHovCKDT6eK0YKp@sirena.org.uk>
References: <20220602112106.GO2387@pengutronix.de>
 <Ypit14mY/Tx8pgK2@sirena.org.uk>
 <20220608092802.GV1615@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mZapuudDPElcdLsM"
Content-Disposition: inline
In-Reply-To: <20220608092802.GV1615@pengutronix.de>
X-Cookie: Space is limited.
Cc: alsa-devel@alsa-project.org
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


--mZapuudDPElcdLsM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 08, 2022 at 11:28:02AM +0200, Sascha Hauer wrote:
> On Thu, Jun 02, 2022 at 02:32:23PM +0200, Mark Brown wrote:

> > If you search for talks from Lars-Peter Clausen at ELC-E you
> > should find some good overviews of the general direction.

> You likely mean https://www.youtube.com/watch?v=6oQF2TzCYtQ. That indeed
> gives a good overview where we are and where we want to go.

Yup, that's the one.

> > In theory right now you should implement the ASRC as a component
> > driver.  You can then set it up as a standalone card if you want
> > to, or integrate into a custom card as you do now.

> Thanks for your input. I'll see how far I get.

Good luck!  :P

--mZapuudDPElcdLsM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKh6LwACgkQJNaLcl1U
h9AWNAf/a92bm89G5rk+HSZugZw80AdpOEbmvegrELs7G7Py/KKkp74f7XTuVgmv
A8J+3IW2VVLQPWuRPAL51F3OBKNcmKlqVay6+TtjaF5gIiyAlhY7ynl0fY4YXv0V
cuRqdi1TbG5v/aHgmNE48tw28hYDHpgnBm20ziI55Yrxpk5z2TrRgTc6QjFkHB08
oomjV7iChQg2gbSd5sOHV2qL7/zvGNhL/mc+xzDefy/AxDUElgkcr0O0nRzF7dw2
WKlE9CAMtQXtLTO2RN23emUSu1Baj0WNutaO+pRJu3y1OQ+79DNKAKhzLv0k8WzT
EtcAwt/lXmC+IiLEqeh4zuqbW0ioSQ==
=aonh
-----END PGP SIGNATURE-----

--mZapuudDPElcdLsM--
