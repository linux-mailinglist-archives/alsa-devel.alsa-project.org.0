Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9B91FBC09
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 18:44:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58FD11678;
	Tue, 16 Jun 2020 18:44:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58FD11678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592325894;
	bh=jnWMm8ZFradrZsRBEhjQ/KbWDxxu1Xp2k0a7DWYtgLQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oB+7N63OtjhZmjBw6j1BPUo2yR7IoTWOez4Q0peMkvwWMI8GMo7jRg6mrF3+M245m
	 60JbgoRBZqD4kMEAqVN2D2iuIN8A2rQuJGEbL40RDSJnSNv9tYa8w2SAEhrsE2sCJj
	 OCmaxCPoBNN0DX0KiZNnWWYO1z79T3RQGKIHRI5M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16D13F80217;
	Tue, 16 Jun 2020 18:43:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C8B4F8022B; Tue, 16 Jun 2020 18:43:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0116F80114
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 18:43:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0116F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RacadhAm"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF58A208D5;
 Tue, 16 Jun 2020 16:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592325778;
 bh=jnWMm8ZFradrZsRBEhjQ/KbWDxxu1Xp2k0a7DWYtgLQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RacadhAmPmxjYKv2jTe7UYUr6c0kLAYPA5PFUkHNbd8UhatbI5TOlm29JBQtlq68N
 FHbWaiEk/LzZ3xpUOwa0Sr9AIppUND9cs3AXokvv3QTrwTIr8dUK1RKAOLa7WSm/gT
 TbQ54R0EllTf9bOotSEomY/RgguX0uK+Wr0xzfIw=
Date: Tue, 16 Jun 2020 17:42:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/4] ASoC: soc-pcm: dpcm: fix playback/capture checks
Message-ID: <20200616164255.GR4447@sirena.org.uk>
References: <20200608194415.4663-1-pierre-louis.bossart@linux.intel.com>
 <20200608194415.4663-2-pierre-louis.bossart@linux.intel.com>
 <20200616085409.GA110999@gerhold.net>
 <20200616090210.GA111206@gerhold.net>
 <254a667e-fa49-240a-6386-7e82df8e5c35@linux.intel.com>
 <20200616145251.GO4447@sirena.org.uk>
 <af973f45-59b9-ecff-7d78-97d8352ed072@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5mQWZobUy98rde9G"
Content-Disposition: inline
In-Reply-To: <af973f45-59b9-ecff-7d78-97d8352ed072@linux.intel.com>
X-Cookie: Offer may end without notice.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Stephan Gerhold <stephan@gerhold.net>,
 tiwai@suse.de, Daniel Baluta <daniel.baluta@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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


--5mQWZobUy98rde9G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 16, 2020 at 10:05:39AM -0500, Pierre-Louis Bossart wrote:
> On 6/16/20 9:52 AM, Mark Brown wrote:
> > On Tue, Jun 16, 2020 at 09:23:25AM -0500, Pierre-Louis Bossart wrote:

> > > Doesn't simple-card rely on DT blobs that can also be updated?

> > DT is an ABI just like ACPI - it's just more featureful.  Many systems
> > can easily update their DTs but not all of them and users don't always
> > want to try to keep it in lock step with the kernel.  Stuff like this is
> > why I've been dubious about putting DPCM things in there, it's too much
> > of a hard coding of internal APIs.

> ok, but is there any actual use of dpcm_playback/capture outside of C code?

> simple-card.c and audio-graph-card do hard-code but that's done with C in
> the driver:

...

> that that should be fixed based on the DAI format used in that dai_link - in
> other words we can make sure the capabilities of the dailink are aligned
> with the dais while parsing the DT blobs.

Right, just heading off the idea that we can fix things by updating DTs.

--5mQWZobUy98rde9G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7o9o8ACgkQJNaLcl1U
h9CuOwf+PZnVy9daqb+AzDNq1Au/OTevuPCyW/94adAbrI/KNS1o/M9Q52fs2uKe
JAtf+CQTlSudrLWndm3NUZ+XiBnCrnLHa+ufDcOs09elnA3KNaaZpau995mpo4OQ
OSEaocVXa7RGGfV1dKOg8vBv2SSnGl+/vRJk5FNbMg9qi3MxfEKtZpJ4+ug13wDA
+B3X3Gznzp8RtdQQwT6vOxH4+rgF67efVlsMVOkU3n2AENzsEGgrvjp9a3yixBvl
DXx3qckgfGLav2QiqWceiXGEtk+g7D3F/p5Z0QpXhXddgS3evLrUuyLaCfqT4CJ7
uN9lhG68hig2SgqRY5K0sI8lfeRBbQ==
=RgPY
-----END PGP SIGNATURE-----

--5mQWZobUy98rde9G--
