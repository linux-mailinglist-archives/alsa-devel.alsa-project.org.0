Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 922DD862C1
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 15:15:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 077D915F2;
	Thu,  8 Aug 2019 15:14:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 077D915F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565270130;
	bh=fInuqrC9wMfruTB1zCQwzG9QW6NZ3ZSt2FAKB3/mk2c=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qqj/TKwRDc2slMoR+HjBOnGfEKSAjy8q+LowoAJ1sD681N02D3faRU5WiMbttBvfk
	 GXSR0O3mAJVrhQ7ZbrxibPYglaNsL1KidMFh/9rLx7D0b+rruwnMlKc2859yr7pciw
	 h628i+sdLRS61uklQl3E07u/ZVw1ez7H8arloWhw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DA7FF80534;
	Thu,  8 Aug 2019 15:13:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CF20F80534; Thu,  8 Aug 2019 15:13:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B74F9F800E4
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 15:13:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B74F9F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="d0TKMFiZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TDs68kJr+9w6v1z2fp12pX1nRPSkKoYHklwshfzz8GI=; b=d0TKMFiZgncna0c8QQkfAjP7C
 AozVTDt6IM0kFGBpNRuSDlLCCH51NA4kG+Lo4Se6jGzjmR4jvrr5r887Qi5zYJZDssk6uxnfqJRGy
 ++rM7+QCPVZ2/8NTiT/vaAb7gsq5wzJFtNnGhdQCEhI1Fj573Ro/YbcQAjBHclF3Ci/Cs=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hviEa-0002yn-A5; Thu, 08 Aug 2019 13:13:36 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 82CA22742B42; Thu,  8 Aug 2019 14:13:35 +0100 (BST)
Date: Thu, 8 Aug 2019 14:13:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190808131335.GF3795@sirena.co.uk>
References: <20190808095715.29713-1-tiwai@suse.de>
 <20190808095715.29713-4-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <20190808095715.29713-4-tiwai@suse.de>
X-Cookie: I think we're in trouble.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [alsa-devel] [PATCH 3/3] ASoC: SOF: Intel: Initialize hdaudio
	bus properly
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
Content-Type: multipart/mixed; boundary="===============8374601176798162019=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8374601176798162019==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yRA+Bmk8aPhU85Qt"
Content-Disposition: inline


--yRA+Bmk8aPhU85Qt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 08, 2019 at 11:57:15AM +0200, Takashi Iwai wrote:
> The SOF HD-audio bus has its house-made initialization code.  It's
> supposedly for making the code independent from HD-audio bus drivers.
> However, this is error-prone, and above all, the SOF driver has
> already dependency on HD-audio bus driver when CONFIG_SND_SOF_HDA is
> set.  That is, if this Kconfig is set, there is no reason to avoid the
> call to the proper bus init function.

Acked-by: Mark Brown <broonie@kernel.org>

--yRA+Bmk8aPhU85Qt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1MH/4ACgkQJNaLcl1U
h9ARfgf9GkzUjoQ870PUyuCKngYf0CnDAxx8bm8Daje2hsDx7Q+Mc/Ax+Cotj9BP
zBY8jUENGsEGMkxdKbQZxqObbVizAeGSaDGDMNEjQL3BWCP289tvRbVcFkN8o8Xt
fwdbyeCKu9BHgsxvP8x/zenVQhYPZcoYlRy3QoA61YjdslK79Q/bfJIA7VQVcf7y
ZzAKIDmPWZn+HHnVTH0bQtuahU2Re1Y0x6F3HrBnsbwX1URbvP1mInQr623uIOP6
ChzVTFssFU9XF/awIHxdITiNdp7Zi3xFn16IEirETvhV/QKxLbV3FYANTwklHF+W
TXIFjLyGJgS5VnepFrXEz25JZUwnnw==
=UKb7
-----END PGP SIGNATURE-----

--yRA+Bmk8aPhU85Qt--

--===============8374601176798162019==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8374601176798162019==--
