Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EBF218963
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 15:43:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D8AF1681;
	Wed,  8 Jul 2020 15:43:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D8AF1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594215839;
	bh=R9qdQMVF6jYFLBjnOTlIxsV4VC7X7oeEN/boZFtPUto=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K6/5o7CfIlpjdkeuvNoBvpQyarvtsMMGXuO66TctDcFPdd3m0PMJsx1Qx88+92Ple
	 gYkjd1LKV16hgtvqgvkb7s9JBOnvg9xAge8JPSb2twDXthQMLauy8ogooyha/skpqK
	 lVcaJpLJaUMqjS5xF2ZUf/yOAEeFhVhbNKF3NDgo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46012F8011F;
	Wed,  8 Jul 2020 15:42:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FA2EF80150; Wed,  8 Jul 2020 15:42:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96353F800AE
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 15:42:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96353F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mKU2MkhG"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 94973206E9;
 Wed,  8 Jul 2020 13:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594215728;
 bh=R9qdQMVF6jYFLBjnOTlIxsV4VC7X7oeEN/boZFtPUto=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mKU2MkhG1wQA3vAM/QfKJ90toW+lIOZyRe50fYYgLFpYzLij/HvclaJpRakIrEbli
 WnAKod1055cy4NWEKl26l1rWeaqIcpM7KBa1uYeSgeDISClOZq4Ows/4SxIBhtVvUJ
 bzIv95p1MbI7Uqvxc9yn652tVyGaKK4v5Z34fYR0=
Date: Wed, 8 Jul 2020 14:42:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 10/11] ASoC: qdsp6-dai: add gapless support
Message-ID: <20200708134202.GR4655@sirena.org.uk>
References: <20200707163641.17113-1-srinivas.kandagatla@linaro.org>
 <20200707163641.17113-11-srinivas.kandagatla@linaro.org>
 <62af11d3-db26-a31b-00c8-9d78b11862cc@linux.intel.com>
 <04a7f696-e23d-5563-7cc3-aedfaf2c7636@linaro.org>
 <cf9b2d33-9b63-f3d2-2e51-a88c528dad53@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="EkxpYdHiqGHPYbUt"
Content-Disposition: inline
In-Reply-To: <cf9b2d33-9b63-f3d2-2e51-a88c528dad53@linux.intel.com>
X-Cookie: Oh Dad!  We're ALL Devo!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 lgirdwood@gmail.com, tiwai@suse.com, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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


--EkxpYdHiqGHPYbUt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 08, 2020 at 08:32:02AM -0500, Pierre-Louis Bossart wrote:

> To avoid confusion I believe the capabilities would need to be extended so
> that applications know that gapless playback is supported across unrelated
> profiles/formats. The point is that you don't want a traditional
> implementation to use a capability that isn't supported in hardware or will
> lead to audio issues.

We'd also need error handling in case someone ignores the capability
checks.

--EkxpYdHiqGHPYbUt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8FzSkACgkQJNaLcl1U
h9DCkgf+JEC2hdc751A8OHEKoIY50HxlCgLea4x5JZtPeQUrtnridmPh+C1aFQd/
31k2PwzAM+xJ2nyOK0LYdlfF4f3sTA1r0ltaIr4KCpUQQ3glkkelABrHrblvUea0
C1cFzPBU4CzQPKO7b3YQ1ORjVt/PxScuK1kxUjITFeaUSGn5bF8+VQbibW/14aO/
TF1M6LNytypWFB86U7vO4OyhtrKv/s/QQ8wUD6mN4I1Q0ymL/0ekQsjP9UuAEJwH
Mq3HN9IFb5cQknIZAYpthwk4xeN/Rv6QphZdjtO6aPbpMPpbG/3kFmTP9/QxnPs9
3CSrUqp9+j06SZ4A65PFB3lf4/+olg==
=Xb5s
-----END PGP SIGNATURE-----

--EkxpYdHiqGHPYbUt--
