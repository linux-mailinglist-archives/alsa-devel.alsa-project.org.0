Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D190954E580
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 16:58:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 690FC1AB7;
	Thu, 16 Jun 2022 16:58:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 690FC1AB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655391530;
	bh=Q/PnTzhXRBmKrI0PFPrXpgukiy9ng7otJtD++t+syas=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SF/GWZZlwKPOmA6JB9O8Pd+fqOybeAOtbgGrE0xs4xf7gHbAMHggDacZnFuoSmtft
	 UkDQDVbrCuhoHurrlUKCXs5Xg36ABvumsX2t/m+cg5P8wafouajDFvDSLSPjslzDVZ
	 sEDMG6eo6+LZLC2Gzm6obAQxxBolCmPgg7h1nAmE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1588F800D3;
	Thu, 16 Jun 2022 16:57:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB5B9F801D8; Thu, 16 Jun 2022 16:57:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDA7AF800D3
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 16:57:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDA7AF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fSqYvQr1"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 17F67B8216D;
 Thu, 16 Jun 2022 14:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B281C34114;
 Thu, 16 Jun 2022 14:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655391458;
 bh=Q/PnTzhXRBmKrI0PFPrXpgukiy9ng7otJtD++t+syas=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fSqYvQr14hkhuxDT1yqOrr+i4qHaWON6KtgtBD7V4tE1J8Dx7+Nheja2S8ISmL7/R
 cWZTMYVBFDgkSIHGPrLSR7SVflZuov9jVVgQqA45iGv2dDNigOU9Gks+JSGdscrdIL
 2uiUGXsSzbxulyTEP5YtmSoyECR20Eab+qQ38MeDydLE1wWEVxYstTtHhRhwZ1pH2E
 71ucsOabMGOtPXzvsXo7S8V1HoUtptE7zgeOJjZUheaBifwR1IgP7cFkaprIkJP3AX
 xzAMKt+gb76pcKhq9VO9YKKtClpaAKETxGNWyDMQ6RzFIU/GmmmjVVLcuxfyH+8oa4
 +rVFHxpQ2Q/kQ==
Date: Thu, 16 Jun 2022 15:57:33 +0100
From: Mark Brown <broonie@kernel.org>
To: David Owens <dowens@precisionplanting.com>
Subject: Re: [PATCH v2] ASoC: ti: omap-mcbsp: duplicate sysfs error
Message-ID: <YqtE3Wu4Ku7fh7D4@sirena.org.uk>
References: <20220615150955.4140789-1-dowens@precisionplanting.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dtd9UxDP2fBlpOtG"
Content-Disposition: inline
In-Reply-To: <20220615150955.4140789-1-dowens@precisionplanting.com>
X-Cookie: I think my career is ruined!
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>
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


--dtd9UxDP2fBlpOtG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 15, 2022 at 10:09:55AM -0500, David Owens wrote:
> Convert to managed versions of sysfs and clk allocation to simplify
> unbinding and error handling in probe.  Managed sysfs node
> creation specifically addresses the following error seen the second time
> probe is attempted after sdma_pcm_platform_register() previously requsted
> probe deferral:

This doesn't apply against current code (either for-5.19 or for-5.20),
please check and resend.

--dtd9UxDP2fBlpOtG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKrRNwACgkQJNaLcl1U
h9A8dQf+OVItQpQi15+ykEglfxmtFxqiwDLZB/YmOYAJcJ5MQ30z+ZlB/KffQ1VS
PF7MzKVQFXT1QSsTDsasRla7+U+TlIweloDb0VL8RnIIua42Oz5WtDWuksTtl54z
J3UBrBzeo4SQwRHCFJhpCGpv7wRPUyKE2XzACuCK19UGyxroKiqLROqS6C359XKt
ekpRODoc5on1BugbOvEgRYdRL4GuKfkt32GY1zfNlPXa0VTMTVVHg92XYQQqBilf
N3EF/pAnOIljK/k6UJNhAaM4xCSAPeupRWZZsaPizrEWFqHMYIs7E2kGsS0URGaB
x6sda4Z59uT4xrSCsYP7lIRz70cPWA==
=c5ec
-----END PGP SIGNATURE-----

--dtd9UxDP2fBlpOtG--
