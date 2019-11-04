Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D06CFEE0DB
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 14:19:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48FC11762;
	Mon,  4 Nov 2019 14:18:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48FC11762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572873588;
	bh=y9zOnSF5s1PCPVL+h1ZmiokR9VPxqdTbQEpuEtZpjVk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ASPrrnLC7ssQG5TnvUi00wAkF6YSbQU6O4EXqV2fmocg6wMheAC9mJy9EPD1B1wf9
	 6ohnVNV4Il1UIfGEnFaF9LkkYNPi/m6DOO9O6N+63aHt5Ouq2vFlaBMQIkzLMPW/fu
	 08BMXb46QjPBGQe/4/PTZ6VVkgsZa5TbSJE3squs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9481F803F4;
	Mon,  4 Nov 2019 14:18:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9286FF803F4; Mon,  4 Nov 2019 14:18:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D61EF800F3
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 14:17:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D61EF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="E+A8tBtY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G29USFBmM3180VuiOU2pSuWE669LfYFv5PyMKEGxt8w=; b=E+A8tBtYKfr1YmgqPQNuduk5J
 9rubdrkyRoy3lL4JlmyKjEK9HgU10zU8FahTZGhwNb+95jcjq0axo/6a6j9cvZDIDz6cgAS0jtSxP
 XyDYTLRA1+PCt+qWze8/m9Nbvr1lb7ECKTSlibO6xp+RKpntUK2xeADduQ7BPRF744wyI=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iRcF1-0002cj-Cx; Mon, 04 Nov 2019 13:17:55 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 97F84274301E; Mon,  4 Nov 2019 13:17:54 +0000 (GMT)
Date: Mon, 4 Nov 2019 13:17:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <20191104131754.GE5238@sirena.co.uk>
References: <1572628130-16955-1-git-send-email-yong.zhi@intel.com>
 <5a2369b1804db60da9ee10d4a2fa0688ff9f1222.camel@nxp.com>
MIME-Version: 1.0
In-Reply-To: <5a2369b1804db60da9ee10d4a2fa0688ff9f1222.camel@nxp.com>
X-Cookie: This page intentionally left blank.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "sathyanarayana.nujella@intel.com" <sathyanarayana.nujella@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "ryans.lee@maximintegrated.com" <ryans.lee@maximintegrated.com>,
 "yong.zhi@intel.com" <yong.zhi@intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: max98373: Fix calls to free_gpio()
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
Content-Type: multipart/mixed; boundary="===============5009941405390326684=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5009941405390326684==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MIdTMoZhcV1D07fI"
Content-Disposition: inline


--MIdTMoZhcV1D07fI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 04, 2019 at 01:03:38PM +0000, Daniel Baluta wrote:
> On Fri, 2019-11-01 at 12:08 -0500, Yong Zhi wrote:
> > Don't Call free_gpio() when request_gpio() fails, call it
> > at error paths to avoid resource leak.

> Uosing devm_gpio_request will make the change cleaner.
> What do you think?

Yes, that's even better.

--MIdTMoZhcV1D07fI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3AJQEACgkQJNaLcl1U
h9A0gQgAhh8boJ4hEgpkiKn/+2UcD9IF03h+oz3c2ObO0p1ZYAlkFIzWYQ/RbX5E
7rMVuzt3NyOz5S6Zkm82R0q0T4b4dpCf9hB+7mYgw3f1CCkcvVBlqQlUeVWAy6I1
1crC6lwtRVwbAsFFRVW23IuXuEIbNDxbUw9X8ZQghrV2h7RaHRuctMXboQ1ai9CT
GAVRsYneTn5AiPpqt09u1T4f5KBS6Iaawq5hyhrfu4WXXGN1cDAmf2cBgRcJjRtW
27w38Rg/rRAdPpyAJk3jBic9xjkSJrTQ8y7qKS3ZdNLS4A8zFNi7Q/kOyGTII65W
S0p/7JXY58ttJMCNnpOqkFBznYPNPw==
=XCZB
-----END PGP SIGNATURE-----

--MIdTMoZhcV1D07fI--

--===============5009941405390326684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5009941405390326684==--
