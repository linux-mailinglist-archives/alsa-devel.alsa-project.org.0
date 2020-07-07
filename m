Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE81C216A98
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 12:42:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 655461698;
	Tue,  7 Jul 2020 12:41:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 655461698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594118532;
	bh=61A6erdDeB8jrWfvMNGi7dKemTfgdHKOCeXNQhFVShE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GssHP/zXoJ17HJpvLEiG/hXFzsLqRNG0C1rb4eGNolG5b6rHe4HFRJQNULBFhh968
	 OFfX/0V/bprmX0SdmkNB5hR8r6Ty63z3Q+W+TwpBeWfwXBQyu365MLf024Y91XSoXh
	 ws505omMMRAezFsMES+JtQqP+AbIhRFOG3WLWFGU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9614CF8011F;
	Tue,  7 Jul 2020 12:40:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1CFFF80216; Tue,  7 Jul 2020 12:40:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0058EF8011F
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 12:40:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0058EF8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="0hw55PYB"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 03A242064C;
 Tue,  7 Jul 2020 10:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594118422;
 bh=61A6erdDeB8jrWfvMNGi7dKemTfgdHKOCeXNQhFVShE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0hw55PYBzLRgZk41iON4wdaNO/2h9uFNjSs1oNSBjnlLu3EjOOV3JRyNBQNsXJ1ix
 VM7lFdmln9imZELUPRCMYbL+0ydckQrsBNyTZ6xcsN6DK3iZfgu7nldWfIRCgEKlFS
 1qi+Xsy1ESKUwtHUyihG+5yLQKE9QhIhti0mtvNk=
Date: Tue, 7 Jul 2020 11:40:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 00/28] Clean-up ASoC's W=1 build warnings
Message-ID: <20200707104017.GG4870@sirena.org.uk>
References: <20200707101642.1747944-1-lee.jones@linaro.org>
 <20200707101915.GC4870@sirena.org.uk> <20200707103735.GG3500@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="V32M1hWVjliPHW+c"
Content-Disposition: inline
In-Reply-To: <20200707103735.GG3500@dell>
X-Cookie: I hate dying.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 tiwai@suse.com, linux-arm-kernel@lists.infradead.org
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


--V32M1hWVjliPHW+c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 07, 2020 at 11:37:35AM +0100, Lee Jones wrote:

> Some of these issues have been present for years.  It's quite the
> coincidence that we both submitted these this week!

I'm guessing you've both been inspired by the 0day bot turning W=1
warnings on without having first done a cleanup run :/

--V32M1hWVjliPHW+c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8EUREACgkQJNaLcl1U
h9ADyggAgTKMerlBwe/6a+3hugV8TxE6uP5Yh+jiu2rmA9pJiv9mLr+Bj5gfiYiA
fkchufKwPxxTbQ5hgqMzm7EZo+b1Qu2yrQpUl6erraD3sj26eNR6UGQ4oNNSMXO9
STju5lVt4w7rW4MeLx9Vk7qyTUPmnDuc1RICSW6UKFshC6LfJfUE9ogNTDEjj3Hm
5yxmdzPp87WcVIF1bzeNtE8kAwamOSPMlr5Br0O/DhgMYzvR74obtDoq5fcgketA
fsSRZGUnKljFlwAn/WA0d46QgGMkgVxBkt4vwhxVoUwusQImsaJogzFnTHQlpjHC
q1sygTqdTJOtB2VjyfoxYIAEfmRksQ==
=nkLM
-----END PGP SIGNATURE-----

--V32M1hWVjliPHW+c--
