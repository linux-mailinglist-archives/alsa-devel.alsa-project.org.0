Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6DE216A6C
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 12:35:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C8EB1661;
	Tue,  7 Jul 2020 12:35:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C8EB1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594118158;
	bh=UHtw6MeLR2PbjZOILpcJU2lXzsz+tYXwTsaXz6IERvE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XF1+XeA4PInlXkoeNQ4dE5CkDYOkWxBmoee7MsPM+7wHseEg+GFtX52rjw3FPyZ6y
	 J4TyA89kofNXfUUGf6M0MGZQ5bOYnIaVsAXsWqKuTugFI4S4BvoXRmlfdqC5wlw31w
	 gXkIUz1aF9x1Oqq3avu2vf5ekVsDDKDzkRWQCPMM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15ABDF802DD;
	Tue,  7 Jul 2020 12:19:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60BACF802DC; Tue,  7 Jul 2020 12:19:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6839BF802C2
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 12:19:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6839BF802C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PiF81EvX"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5DD11206F6;
 Tue,  7 Jul 2020 10:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594117159;
 bh=UHtw6MeLR2PbjZOILpcJU2lXzsz+tYXwTsaXz6IERvE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PiF81EvX30apx9Ee27/EN5d/rxv99l+LJ7dLxxuXdcJKRcZjZnDF0WJcR8a7gyMw3
 mhBm8kGJIOaUYVpOh4g7ix4p+cEbp3rX+2JwnBVSF/9mFa75svG2aZWlr8XPnNCU1b
 wDGPrrl4HKTWoNVdT4gn7ajWkmKXsVTFT16KiI5A=
Date: Tue, 7 Jul 2020 11:19:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 00/28] Clean-up ASoC's W=1 build warnings
Message-ID: <20200707101915.GC4870@sirena.org.uk>
References: <20200707101642.1747944-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="DIOMP1UsTsWJauNi"
Content-Disposition: inline
In-Reply-To: <20200707101642.1747944-1-lee.jones@linaro.org>
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


--DIOMP1UsTsWJauNi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 07, 2020 at 11:16:14AM +0100, Lee Jones wrote:
> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.

Please coordinate with Pierre (CCed) who is also submitting patches for
this issue, there's a whole bunch in flight already.

--DIOMP1UsTsWJauNi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8ETCIACgkQJNaLcl1U
h9A2lwf/WHxiQ4N0fIy5r4w2N77ELaYXlxUlx7kooARFaGhCerRy8YXOb+9Zc4Z6
xGYqdqv7T4xqUsVP8BiO8hqnKfJgQPO2dWOfWO0BZm5BTng2eI/7I3R57cw+luCw
i6OIo6CncxzZRNlhZiHfkUltuOmZ3snr7dW3jTzrtWJtMKCIdsOcmDKNBeUFEBtA
sWcqsutEZ5puO5BmS/kKkfmPKEZl3nOFOJOLK8IVNZM8usO9wknx66RGct78t7qc
vjIoNoVUaqabFnRnZ74RtOxoLRSUXNJ1Wivxj4I4nsZbq6LhlxZk3hg79hq2+pOZ
r1f85V6q6MI+l6if565oFynaC210rA==
=Qi7z
-----END PGP SIGNATURE-----

--DIOMP1UsTsWJauNi--
