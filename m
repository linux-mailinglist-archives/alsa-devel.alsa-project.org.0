Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B38E51B45FA
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Apr 2020 15:11:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4471B16B5;
	Wed, 22 Apr 2020 15:10:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4471B16B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587561108;
	bh=rnqV1KlpEB/OLP2H0L2z2mcr785L2XdnHSE4djvrOwM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bdDSJXDo1jg/gpHb3JSWjqEQSPiWLqtn0LbAGV2XBIR5o5Onu4ykvwHPdvmTaoJ8z
	 pez/2Y80RLoEuKS10gzT8/yy/wgbTj2F4C6K9asBrUWvijme66pBsik2ZtYN1yL+Mu
	 vc02P/9VDJev5HZh+m+SdSIpLLIvmSI2X24tHW0M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39F7EF800FF;
	Wed, 22 Apr 2020 15:10:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 200DFF800FF; Wed, 22 Apr 2020 15:10:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8766EF800FF
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 15:09:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8766EF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ezGrCZEK"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 10224206EC;
 Wed, 22 Apr 2020 13:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587560996;
 bh=rnqV1KlpEB/OLP2H0L2z2mcr785L2XdnHSE4djvrOwM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ezGrCZEKmXBMrIUP6/fH2wct54raaWFVLqCpH+gsAAjJ8Ye9uDGLJMvPN9ypW1PLU
 VAfu7S3r85RhMjlxnBJpyZN0hMB33hUSGz6PSLcqgfFWOrc4Llh4NP1sBDaGjN8KGA
 OwbGrzeKSTJFP8G2b/y9NgZQFYwZ1cQ/41V4QQWA=
Date: Wed, 22 Apr 2020 14:09:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ASoC: SOF: Fix build
Message-ID: <20200422130954.GG4898@sirena.org.uk>
References: <20200422112602.13109-1-broonie@kernel.org>
 <2c307fac-077e-6692-a57a-2c2084a4742f@linux.intel.com>
 <20200422125145.GE4898@sirena.org.uk>
 <s5ho8rjznb6.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="BzCohdixPhurzSK4"
Content-Disposition: inline
In-Reply-To: <s5ho8rjznb6.wl-tiwai@suse.de>
X-Cookie: A stitch in time saves nine.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, alsa-devel@alsa-project.org,
 Karol Trzcinski <karolx.trzcinski@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>
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


--BzCohdixPhurzSK4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 22, 2020 at 03:01:49PM +0200, Takashi Iwai wrote:

> Through a quick glance, this seems to be the error from the user
> header installation.  See the path shown "/usr/include/sound/..." in
> the error message.

> If uapi header needs inclusion of another header file, it must be also
> present in uapi/*.

Yes, that's the patch I'm guessing is missing - we need a new UAPI
header.

--BzCohdixPhurzSK4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6gQiEACgkQJNaLcl1U
h9Dt5Qf/Y8F0zKFjoukRWRqfo3rCpd50sVhaTrm+HxTsRESumryN+6gT+YGKPWQa
Fy9Fa/sEzCgLYdAR1g6IcBl+xHk4G2XstflnFEcop6VFNr/FHtORGwi2nSEHvqBa
kfOf09EJDu203euTEVsGgcGyOtavE6CwH7OecobUAbXfB1Rct3u/CmoISOBBmneG
M/lCIL9KhsTUjJ0Y8QAHBn1xA0LyuH1AYZ5gQ8pBky3Ng/Y5DPYr3kb0xVgU721U
n5GUAGXszBQFRkDZZjhy+jkKrPSiOHWtJ9RALaZfcqgPnDR/ntkP3bqj1QC2EFaT
mXlE+c4dLBHtHioB+bqBxUCjRFeXGA==
=HUt1
-----END PGP SIGNATURE-----

--BzCohdixPhurzSK4--
