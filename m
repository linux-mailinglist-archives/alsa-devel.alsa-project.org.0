Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A5F2336C8
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 18:30:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1D4C17C1;
	Thu, 30 Jul 2020 18:29:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1D4C17C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596126626;
	bh=dXL2WFznd58Yo57hcV8UZp5RObKTWASTJEc9pHkiE2M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XTRR4zkXoWHT//6pThSYvjRquqBYLf16PO7ifO0sVyuZXMaI4No7KNM1INA9TtH91
	 PGe/Aft+ve5fgx7UAuqUANr8J1eEtzh7ko1mBlUJZKWsuG7MmvAEAqmh4y7wN6lqvA
	 1Ik2pxcia9mfGGx47Z+OUB3Ptf46XEkV4q+iT0VU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF7B1F80227;
	Thu, 30 Jul 2020 18:28:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63E7BF8021E; Thu, 30 Jul 2020 18:28:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CBAAF8012F
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 18:28:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CBAAF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QkcTKcj5"
Received: from localhost (cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 [82.37.168.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4139C2082E;
 Thu, 30 Jul 2020 16:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596126507;
 bh=dXL2WFznd58Yo57hcV8UZp5RObKTWASTJEc9pHkiE2M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QkcTKcj5ZUpM2sP+cPnT6Mo4zBjDxJIgyywOQnybRy4+j/gjNEL8EzuCG2fD4bqhd
 aXpMFTwetd6yutDrov1KKhC0r6/WY4ahnA6ns07q7w2/j3cOVZnrWYPmi0J6HSCm5g
 WbWMSjJF6PhWSY/ViGdhACgm+vQYRRZkVcjNcBCQ=
Date: Thu, 30 Jul 2020 17:28:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Subject: Re: [PATCH] ASoC: da7219: Fix general protection fault in
 da7219_register_dai_clks
Message-ID: <20200730162808.GD5055@sirena.org.uk>
References: <1596117868-3317-1-git-send-email-yong.zhi@intel.com>
 <AM7PR10MB3640075298BCB15AFB22A9D480710@AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM>
 <MW3PR11MB4665FA01F552E3BCB69EA2F285710@MW3PR11MB4665.namprd11.prod.outlook.com>
 <AM7PR10MB3640C50CDF650A4710E7B65680710@AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="76DTJ5CE0DCVQemd"
Content-Disposition: inline
In-Reply-To: <AM7PR10MB3640C50CDF650A4710E7B65680710@AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM>
X-Cookie: Alex Haley was adopted!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>, "Zhi, Yong" <yong.zhi@intel.com>
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


--76DTJ5CE0DCVQemd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 30, 2020 at 04:19:01PM +0000, Adam Thomson wrote:
> On 30 July 2020 17:06, Yong Zhi wrote:

> > When the card was uninstalled with modprobe -r, the da7219 codec was not
> > removed, only component da7219_remove() is invoked, do you suggest the
> > component driver probe and remove has to happen with da7219_i2_driver probe
> > and remove together? Thanks for the code review.

> Well as far as I understand it the the devm_* allocated resources are tied to
> the i2c dev. If I'm correct then unless that's removed then those resources
> won't be freed. If this is a valid scenario then we would probably have to look
> at avoiding all devm_ calls in the da7219_probe() code as they wouldn't be
> released when doing what you are here.

> Mark, what's your take on this? Am I missing something obvious?

You're not missing anything, you shouldn't be doing devm allocations at
the CODEC level only at the device model level.  I'm somewhat confused
why you would be registering clocks at the device model level TBH.

--76DTJ5CE0DCVQemd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8i9RcACgkQJNaLcl1U
h9C85gf0C2rfHNL4qxk5qWIysM/ORsREDbXt01Xj5G74tYNiGm8Ju6QY7swvjMjh
5upFrsVlhZZYXyUn7AnzRHQUi8ghar02zwNwOV0rRzaQIWivhTjvLGjl5hq0kfxV
ncVjkgdemRRkdHnThXGx3ic4sb5wDuaEB2NcBR1fEQLQlwNAsCenbQtGRB4zoKyL
2uEWvDA2k1zUTWwMNMH7mmjHedSsn9LZ/KYFlXLuKQsCfqlaAjNwbgdt4pSZUCbC
jPLLxYDcltiw0MFEk8a19vtfrr026wfyQ3qTBjOkW5YdVHtXdI/jwQ7WrzipH/Jz
70Ky8SfJTlAMuqF8+5Jcga4anZOJ
=RQ4Q
-----END PGP SIGNATURE-----

--76DTJ5CE0DCVQemd--
