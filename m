Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9D532F32E
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Mar 2021 19:52:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 087811AE3;
	Fri,  5 Mar 2021 19:51:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 087811AE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614970361;
	bh=3idx5+kPjlauvjxP2U80NOvMnVC9vfiBCM+ajkpdqN0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WvEBTU2c++yx+/zn8bXdUyUDO4+PTL5rroNKGFSdiMkqWzbuYxPype8EsguUqgSeZ
	 0q0+940viPdHRZSyiBhgSP51joD5ekYFhUBC12xVdKqIsJxlesCutvkqzAV+iNVobU
	 18+crhsVkA2pKpMAduwuG6KNUzgD9UCC1Uq9l+e8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63C8CF800ED;
	Fri,  5 Mar 2021 19:51:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BA21F8025E; Fri,  5 Mar 2021 19:51:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,TVD_SUBJ_WIPE_DEBT autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87BE3F800F3
 for <alsa-devel@alsa-project.org>; Fri,  5 Mar 2021 19:50:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87BE3F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SQ6ZPsGM"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BFC8C65090;
 Fri,  5 Mar 2021 18:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614970255;
 bh=3idx5+kPjlauvjxP2U80NOvMnVC9vfiBCM+ajkpdqN0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SQ6ZPsGMWQO+dcXCO/wPT9G0aO0mTGrViOwMqqZehxl1+nXYf/mV8qznCA/bYj3Az
 WuTVE1uQNVTVSK732zyC57UVpOZi2ShpDtJtfVXcl0J2TZOvXxFkLV4blxrU2p/lxX
 aTAbK0lmorAgGkCCe6d0J4Cn1sCaB0Y0jpVvZ4rpT1X94tNes9p9h5EHCiUL83o1rx
 1JsHvpv/3GtOOqCxHCetLKwO/M/PdJ5M7QSZiTCQJvm8NWSQ6rVQwGU7lo/IObm7FK
 HhNPrJ8ST3nVJwKU84fIKLX1lZzOBroY5Dz77fzESluNEDMgpexg0Vq1wIEiMpM4jX
 Ut1EvIUQwx+Bg==
Date: Fri, 5 Mar 2021 18:49:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Lucas Tanure <tanureal@opensource.cirrus.com>
Subject: Re: [PATCH v2 06/15] ASoC: cs42l42: Remove power if the driver is
 being removed
Message-ID: <20210305184944.GC4552@sirena.org.uk>
References: <20210305173442.195740-1-tanureal@opensource.cirrus.com>
 <20210305173442.195740-7-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="FsscpQKzF/jJk6ya"
Content-Disposition: inline
In-Reply-To: <20210305173442.195740-7-tanureal@opensource.cirrus.com>
X-Cookie: Shipping not included.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>, linux-kernel@vger.kernel.org
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


--FsscpQKzF/jJk6ya
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 05, 2021 at 05:34:33PM +0000, Lucas Tanure wrote:

> -	/* Hold down reset */
> -	gpiod_set_value_cansleep(cs42l42->reset_gpio, 0);
> +	disable_irq(i2c_client->irq);
> +	pm_runtime_suspend(&i2c_client->dev);
> +	pm_runtime_disable(&i2c_client->dev);

You should be unregistering the interrupt, not disabling it - this will
better support any shared IRQ usage that appears and is much, much more
idiomatic.

--FsscpQKzF/jJk6ya
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBCfUgACgkQJNaLcl1U
h9Ah/gf/V/Gxmbl9IRaNIRZvhenD73EaKj04ZmN5d2YMKVFoGYwvAiPcogZdH7P5
E9pI47Xib3JE2LlSe8/aJKC72tDatgYSDU2bj1zRgx07NEzA5wKyt16j/yD43+kx
IVH3q6ZQKxAQ8poAs/n5FFOrJ05Ii7Sdxzl0l3ns18KiyY4XEetlD9GHcrzn6wrr
wvDdfjOVd0wOAgwC8H3231OEGqrALq/RTSb4zwPdbs/pgEyBj8qB6sSBhKHuq4uE
JDeUa2Ia0KyiRnZGOBy8xpbS5PEKZioZMaLYKsPB0BweuvO0hfaVVY2VpSPKP7ZU
SY+zekeFJ699pBSVx1FmtBbyYjJTDw==
=48aq
-----END PGP SIGNATURE-----

--FsscpQKzF/jJk6ya--
