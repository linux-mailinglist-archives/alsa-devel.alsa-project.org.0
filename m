Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FE914E8D
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 17:04:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C76EC18F7;
	Mon,  6 May 2019 17:03:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C76EC18F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557155039;
	bh=tS3HNaMzBnjq3g9hEFybp3z3iDCf1Sw7B7iIQzQ6w8w=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jD6ZV+kO77KS7UgDAh+oQf5CfFHBOGYXpvAxCSmfzzS2fSm2m29/LxywngAsj+cSy
	 7V+uACTGe/+MuLHFq3hiOJVpdHZpJwkDIR9n4sicIc7j/NdIh0sbx0gb7PmgjZYJEH
	 OLcXML+hetobBSQbZa4OxjSZaWMaBYvMzw1iIQN4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8ECAFF896F0;
	Mon,  6 May 2019 17:02:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41801F896F0; Mon,  6 May 2019 17:02:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 374D9F80C07
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 17:02:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 374D9F80C07
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="snb7LJ95"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Zg9gqo2903JRAxY0PXoDrsQPIytaYw/u5GnQkEPNlAA=; b=snb7LJ95xb6mPrNfrylpwiWy3
 EV3gBlMInYuYLpPmXvNeaqdfxnA0Bbfy5Y27bgUUK4WhujlqSuYI70oUGZdR2hiKSYLcoo+1zAaVr
 NyupDvqDGMSCye7pxGHIJTWUZkcAJg/rN06IrOVPcRGiZmllbWRBYsf1JOjV3yiaB9wyU=;
Received: from kd111239184067.au-net.ne.jp ([111.239.184.67]
 helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hNf85-0001u5-HH; Mon, 06 May 2019 15:02:09 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id CDC7D44000C; Mon,  6 May 2019 16:01:59 +0100 (BST)
Date: Tue, 7 May 2019 00:01:59 +0900
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190506150159.GX14916@sirena.org.uk>
References: <20190506141144.GR14916@sirena.org.uk>
 <s5hr29b4qas.wl-tiwai@suse.de>
 <20190506144000.GV14916@sirena.org.uk>
 <s5hef5b4pak.wl-tiwai@suse.de>
 <20190506144834.GW14916@sirena.org.uk>
 <s5hbm0f4oid.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5hbm0f4oid.wl-tiwai@suse.de>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [alsa-devel] [GIT PULL] ASoC updates for v5.2
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
Content-Type: multipart/mixed; boundary="===============8989404743540186421=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8989404743540186421==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5VkoCU/Pi0S20qD6"
Content-Disposition: inline


--5VkoCU/Pi0S20qD6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 06, 2019 at 04:59:54PM +0200, Takashi Iwai wrote:

> The rockchip warning could be easily seen via allyesconfig, attached
> below.  For SOF, CONFIG_PCI=n is the key.  Attached in the second
> config.  For da7219, it's the lack of CONFIG_COMMON_CLK.

Yeah, I saw the rockchip one but not the other two - but I don't build
with randconfig type stuff so I wouldn't expect to see them.

--5VkoCU/Pi0S20qD6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzQTGYACgkQJNaLcl1U
h9CAsgf8D4wKRT2+Wvh8jDEEQRWkLB1g7fg+oaWSuTY6UZcWUDv/5EM+OkY87T82
LYVMrgqAM3G/5prLmWEt/aFIVo5EbRaQvbfpyJtNKn4Ev1t93sYcOdadGbTGpcn3
l/4GVQp/mAG2vMsUtH9ZcGft3Y2x7jyN52PwzBbDuN8RVM1rRmg9K3/WTAZNqzer
Edzz9zBAMpqI1y5Kn3ZY3NNb3qxw8QmNvfd/j6fKXqVk3ApCGBIVa3LP0YYqdRxV
SLn+PsR8zBmdmo8lYYeT7kVVqJdwm5z6+WnVQy2euFHr29EeA4yn+aNwfFW+aLVV
Rhzyb9uDYncIM+50b+pSu2y2QCOWBg==
=TCvO
-----END PGP SIGNATURE-----

--5VkoCU/Pi0S20qD6--

--===============8989404743540186421==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8989404743540186421==--
