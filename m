Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54165310E34
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Feb 2021 17:54:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D77231676;
	Fri,  5 Feb 2021 17:54:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D77231676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612544097;
	bh=evOe364eFPSqbudNPhtLRp83DKpGVgDBBaT5DyoiBqg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JbPoWQBK0X/6ItjRTbnLzC84wZtPUxEUVBGBOALGW/yxXYkdkEE2GZ8iBpHqMobj6
	 dbM++jhw2nP4g6N5HjFBAIvHonUh29dXz/Eb1shBovaa9Qcve4a3HHXdT6DJWoWTyw
	 /op6ofa/p2LYtLAiW1ZnVoL6CCj2TNABlxfVSdvU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1CD1F800C0;
	Fri,  5 Feb 2021 17:53:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C787F8015A; Fri,  5 Feb 2021 17:53:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D022F80152
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 17:53:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D022F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XmGQPITv"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 67A4C64F06;
 Fri,  5 Feb 2021 16:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612543994;
 bh=evOe364eFPSqbudNPhtLRp83DKpGVgDBBaT5DyoiBqg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XmGQPITv806JRRWBRzYm4hIG16TdQrDeL4qlUbUC9hwagto6juoqz+pCjgq34mTE5
 tiJx6MVmNJmiEhCenmuK15K8x1y3KaTbs2uJadrC887wZaoadtHyXEsCU4jGl5L0V0
 N13T2qdTNdd87IH9Q4CVqLlYXukyKLkw5UDdx0E0L0iZvkjCw8qn/PCOEU5d4neyf2
 qcIHq3PKysh502nR8KsdCLedGfzngPeQEGNgNyo7EHVjlUAQFb7KQsNI9gdT9ydpSV
 fGicqwj7Vo8GLICJcVbhj5c0//K+BMx5suN8BDHfxuQA0e/x+SmzBP1acrBTJI8hAb
 tum2V64+b8/KA==
Date: Fri, 5 Feb 2021 16:52:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 14/14] ASoC: SOF: Intel: hda: add dev_dbg() when DMIC
 number is overridden
Message-ID: <20210205165223.GI4720@sirena.org.uk>
References: <20210204203312.27112-1-pierre-louis.bossart@linux.intel.com>
 <20210204203312.27112-15-pierre-louis.bossart@linux.intel.com>
 <20210205153336.GE4720@sirena.org.uk>
 <d6f10083-f046-a708-60b1-86e3fd731e60@linux.intel.com>
 <20210205155157.GF4720@sirena.org.uk>
 <8e0b6cc2-7221-f867-3422-db946bfe038a@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="D6z0c4W1rkZNF4Vu"
Content-Disposition: inline
In-Reply-To: <8e0b6cc2-7221-f867-3422-db946bfe038a@linux.intel.com>
X-Cookie: Huh?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, tiwai@suse.de,
 vkoul@kernel.org, Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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


--D6z0c4W1rkZNF4Vu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 05, 2021 at 10:38:54AM -0600, Pierre-Louis Bossart wrote:

> > Like I say it's not that patch that's causing the break, I didn't walk
> > through and work out which one was - the patch isn't actually adding the
> > usage or anything.

> Ah yes, you're correct. Mea culpa. We're using the parameter for HDA and
> SoundWire now, but HDA is disabled with allmodconfig due to a mutual
> exclusion with NOCODEC. I've had this on my todo list for a while.

> We need something like this, will test and resend a v2. Sorry about the
> noise.

Yeah, that looks like it should do the job.

--D6z0c4W1rkZNF4Vu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAdd8cACgkQJNaLcl1U
h9CIVAgAhmVFqB+wI2La7+09pzuo0IPBYrvjhdgOXL1FBPh95ylPe3ZEQ+nCfjns
m4SWgMGqn1a+iNxXAEBfHuPQwJiCi79bcOVaA7TcjMcHyvsgrtJePYdKjFmSU1VE
CKTP2EiNSUCPfhrJdJ4v+TcgHdc1ul2EtyyiE/s5pd8tisUTWbklP3G/5o9glEeY
WKmrdV2Vmri7S0jnMJqbVLm5FS8hVPy7qT8WYwIYy2e9uPS3BbtWXItD6abhVrj5
y+HSvkcMmfQuCusEKLh8Ryz0fYv9/zbNj+LfDrB+C4ee7Jhp63TEUROa2l26Xtle
9d9Y8ynUvFJO3s7foOMvPzU3xcqdXQ==
=tAR8
-----END PGP SIGNATURE-----

--D6z0c4W1rkZNF4Vu--
