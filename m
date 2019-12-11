Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 237D011B931
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 17:49:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C4991666;
	Wed, 11 Dec 2019 17:48:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C4991666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576082962;
	bh=aFiU2LSap0jpee+NxEQtvRGYsVMXkL1L8ZLgbkpVMpU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A8mnRmfYaeiTaa73Fy8LpqYNcjQbJyXGSBOegRW9V0DPIAr/vYnJOk2ahqAOLN04R
	 k2+yIYKYtQhIx+4S8Mo9jinqKXCZM/qLSz6G7yElbidvh+LK+PEyAncoiu1VPb7CMm
	 cGr/AQzOAWrlPwwmIZAPbPQ65g3w1I6K5e/2LuOc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 266A1F8019B;
	Wed, 11 Dec 2019 17:47:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3889F801F4; Wed, 11 Dec 2019 17:47:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 5A702F800EC
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 17:47:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A702F800EC
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55D5D30E;
 Wed, 11 Dec 2019 08:47:28 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C92E33F52E;
 Wed, 11 Dec 2019 08:47:27 -0800 (PST)
Date: Wed, 11 Dec 2019 16:47:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191211164726.GA30042@sirena.org.uk>
References: <20191210142614.19405-1-tiwai@suse.de>
 <20191210142614.19405-5-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <20191210142614.19405-5-tiwai@suse.de>
X-Cookie: Everything you know is wrong!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH for-5.6 04/23] ASoC: mediatek: Use managed
 buffer allocation
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
Content-Type: multipart/mixed; boundary="===============5070039694463426724=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5070039694463426724==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Content-Disposition: inline


--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 10, 2019 at 03:25:55PM +0100, Takashi Iwai wrote:
> Clean up the drivers with the new managed buffer allocation API.
> The superfluous snd_pcm_lib_malloc_pages() and
> snd_pcm_lib_free_pages() calls are dropped, as well as the superfluous
> snd_pcm_lib_preallocate_free_for_all() call.  As of the result,
> hw_free and pcm_destruct ops became empty and got removed.

This doesn't apply against current code, please check and resend.

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3xHZ0ACgkQJNaLcl1U
h9ABywf7B0XIRzhXoPOSc5PpWgZKfcgRaUsXXmzv/Ye/1djN+MfrItsCbAKNOQcj
cahnxLJZGpSZCNluLlIaATN4Eq4tTQmCVJKAsBTJmg49mMsUDPGY1nR0UycsuCIr
KS3Rm1CXIFAJoFPMWYRhGG5W/WSWJVvgeMcumahs/5kBy65oYMD1YkGfM4Ppr0HX
VrQ3N2ClPU1//zbjyyXrEfquBG9MqdIAsaIqpZ+iXxPU/uIhqtwuFH1ur3YJQX4f
C9cKMPiyBGecQFPH8ycbXAbXEMELAQug6QHL5byi+tx6pRNwz4RgPhyBI69/ZbQG
7GtjUtIVAsW52kjVfi8HYwpNiOA48Q==
=tEvy
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--

--===============5070039694463426724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5070039694463426724==--
