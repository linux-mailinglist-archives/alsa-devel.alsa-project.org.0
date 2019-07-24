Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B0B7365F
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2019 20:12:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03E8E1879;
	Wed, 24 Jul 2019 20:11:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03E8E1879
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563991939;
	bh=K90rT+YoXdd1POivAA95UuXCMo4dcod/s9FJsk4sXmI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pwFC1PUiBvKknxViTAxcJrI4+LS+30mdJrO5SAELVEn5/WTrw1FBKmR0RHWuj+sHM
	 W3xaa0PoCn05FjZRiEbuRg5s77wv89bqpnYOmow/sdh7NmCwFSJxP5N/g9Sje+5qG2
	 3eDtR/lOxA8Jt26cYMDdiZwbl7nR2GgKgjC32meI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E8A9F803D1;
	Wed, 24 Jul 2019 20:10:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DED84F803D1; Wed, 24 Jul 2019 20:10:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A0ADF800E8
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 20:10:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A0ADF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="M20l4TLG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r4GzGWpFqtkygt4K7MNz39Z8OYt1bj+iavN6Gcrh/ZY=; b=M20l4TLGqEnCRuW/cA+WBdBIO
 tIKqtRDgr9GypuMqOaM+Lfuvsd7Cn9/MCsaLeBkfFM2co45UnnmOj0nc3AdwZ/zdO5t6kgY1vymfw
 FvLFJY42qw4YR6NL2fmCmw3oZhiJqEA4k7ZhFLrwk3QR2MbnTKK7OobG8TWqGXttJu8OU=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hqLiZ-0008LO-Hq; Wed, 24 Jul 2019 18:10:23 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 8FB3F2742B5D; Wed, 24 Jul 2019 19:10:22 +0100 (BST)
Date: Wed, 24 Jul 2019 19:10:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <20190724181022.GG4524@sirena.org.uk>
References: <20190723145854.8527-1-cezary.rojewski@intel.com>
 <20190723154449.GJ5365@sirena.org.uk>
 <cac0d84e-61d3-5379-cbce-10f8d637310d@linux.intel.com>
 <81f9a74b-0848-8a45-a4d1-8ac44d11e0ad@intel.com>
MIME-Version: 1.0
In-Reply-To: <81f9a74b-0848-8a45-a4d1-8ac44d11e0ad@intel.com>
X-Cookie: Matrimony is the root of all evil.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.com
Subject: Re: [alsa-devel] [RESEND PATCH v2 0/7] ASoC: Intel: Skylake: Driver
 fundaments overhaul
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
Content-Type: multipart/mixed; boundary="===============8692554425699391285=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8692554425699391285==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kjpMrWxdCilgNbo1"
Content-Disposition: inline


--kjpMrWxdCilgNbo1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 24, 2019 at 07:14:52PM +0200, Cezary Rojewski wrote:
> On 2019-07-23 20:07, Pierre-Louis Bossart wrote:

> > - draw the line at "no new features" after e.g. 5.5 and "no new
> > platforms when SOF provides a solution". SOF was expected to reach
> > feature parity by the end of 2019 so it's not a random date I just made
> > up.

> While I can agree on the "no new features" line, the date is a loose
> subject. Honestly, I could've probably called first ~70-80 patches: "a fix".
> Validation team managed to mark half scenarios a failure immediately. Then
> developers were set loose. With enough motivation, we have managed to crash
> even the most simple scenarios. I do not call a folder with bunch of code
> not following any specification, design patter, lacking verification and
> testing and confirmed to be harmful a "driver". And thus, "new features"
> gets entirely different meaning when applied to /skylake.

If there's things that fix bugs then they won't be covered by any wind
down in new features so that's a separate thing whatever happens there.

--kjpMrWxdCilgNbo1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl04nw0ACgkQJNaLcl1U
h9APQwf/bfZqxu0gSLeffEQCfsi1HZNYE4TcvNbe5ZDZdCYuo1npPVADhJwJtQkV
csXGQgpznRfpAsxgQ19lj5Obrv7lvZ5unIz7qFK4Y+TThwysBj5ObCetfptsWVNe
tt8crziWSTdKe8YYSEX6TjwTHKcufjKWcdBzt2NgZHG7STjFOMnGOQzceRt428Jv
OCd2aAB2WA+DT0htD2NyhAOVafQy8HtD6T0lLYYEfyyjBULfSC/J8lbiNk61L6JZ
UI6ztUReCuWcwY/97jIYSUzGHhQrV4jUZTU9q3xhgVpDvTWO2iyp0zq6o3TYH6KF
4/JvqS1ceo3jQJkhoVOoxv7SP0W8AQ==
=u9jR
-----END PGP SIGNATURE-----

--kjpMrWxdCilgNbo1--

--===============8692554425699391285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8692554425699391285==--
