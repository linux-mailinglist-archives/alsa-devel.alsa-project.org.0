Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47537197955
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 12:34:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3D34166F;
	Mon, 30 Mar 2020 12:33:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3D34166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585564444;
	bh=zNKuzV87i+tqXB+2bGPQx8sb2Yv97avuSrud6u3uMw8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ALNj+gDnzej/56tws/58AI+c7OtGsh0N5WvA9452Xb2acMKxSasrUGPYEqcu8kiIQ
	 5gDQJ4KPyiDnUQDTod2GhZwWxXPjP4/D1LKHrT59rXrEb0arL7rh4fEd9tv9YXt29Y
	 zgYuTpBWvEPFQ6yKNSvfT3A3C6rS5pAh7U1kryV8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4938F8014A;
	Mon, 30 Mar 2020 12:32:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4ABAF80148; Mon, 30 Mar 2020 12:32:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 45D6FF8010C
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 12:32:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45D6FF8010C
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE0D331B;
 Mon, 30 Mar 2020 03:32:15 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 423413F52E;
 Mon, 30 Mar 2020 03:32:15 -0700 (PDT)
Date: Mon, 30 Mar 2020 11:32:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Matt Flax <flatmax@flatmax.org>
Subject: Re: [PATCH] ASoC: snd_soc_dai_set_fmt add substream independence.
Message-ID: <20200330103213.GA4792@sirena.org.uk>
References: <20200328015831.6230-1-flatmax@flatmax.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
Content-Disposition: inline
In-Reply-To: <20200328015831.6230-1-flatmax@flatmax.org>
X-Cookie: Ahead warp factor one, Mr. Sulu.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com
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


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 28, 2020 at 12:58:31PM +1100, Matt Flax wrote:

> This patch is aims to start a stronger discussion on allowing both CPU
> and Codec dais to set formats independently based on direction.

If the DAIs support completely separate formats they're not a single DAI
and should be represented as two DAIs.

> One example of a sound card which requires independent stream formats is
> an isolated sound card, such as the Audio Injector Isolated sound card.
> The magnetic isolation chips on the sound card require stream fomats to
> be different because of digital latency variations on the I2S lines.

Honestly I'm not convinced this is ever going to work reliably - there
is in general an assumption in the code that the formats on both ends of
the link are the same, it seems you'll have to break that as well as
having an asymmetric configuration.  You probably need to represent
these isolators as a CODEC and do a CODEC to CODEC link and even then it
seems worrying.

>  /* Digital Audio interface formatting */
> -int snd_soc_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt);
> +int snd_soc_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt, int stream);

This will break the build.

--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6ByqkACgkQJNaLcl1U
h9CgMwf7BdLoALef2x+rjOsTljh+AZ/tsYCX6hPmPBgxZ+wTqMuT60CW+45FIeLR
nPb5ikHzL4+eoAAbdbQyIk3/8/HL8x8o9Lf36fGqJDnaVJdtZm736pM0UNJrGbFh
rEMI2nZt7MbxnQ5Pzm5BKWclrdRqDsESp8AvH9OipQ/nS4jMrvbM0HhQrGRI/Q2w
kgSZNONtV5XDa4A7rhfJTpmRvXo7hOJfYouSGOLTajjOaVnMWd1uYDbiasGva6GL
vQSO9ryjeA8YKGR28Jvt3pvQiPUttrpUDK8EA/Pf8HCtXMKfqQ0OazuL3t425TsI
cY4GIiq33R8muEpEpjHmm86g2qhxDQ==
=LrdT
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--
