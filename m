Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D96D48A0F9
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jan 2022 21:32:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEFDE1900;
	Mon, 10 Jan 2022 21:31:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEFDE1900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641846759;
	bh=Y5+ckeFP2c9dGNWovaebLCVF9NhCx9Vtt2jcF1go6ko=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T6Qashy/bKiqqxdiA1aUm1yKq7oOLuAqiXAi4+6y049KQfmIM1UGbfoUS46zGjUPP
	 UR7CuTaVEPiW98Te7NV5dXYRv5UMq7wQjgIJnkSjjaA1RhS3fTqfAd+TJJYjU5psep
	 ro/wo9PNM7NF7RUxNDE2A7/+kmLIqiM7XSFofBvs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C093F80134;
	Mon, 10 Jan 2022 21:31:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93383F8012E; Mon, 10 Jan 2022 21:31:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AABFF80054
 for <alsa-devel@alsa-project.org>; Mon, 10 Jan 2022 21:31:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AABFF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AZbja+hN"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7FD0BB81785;
 Mon, 10 Jan 2022 20:31:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B624C36AE9;
 Mon, 10 Jan 2022 20:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641846682;
 bh=Y5+ckeFP2c9dGNWovaebLCVF9NhCx9Vtt2jcF1go6ko=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AZbja+hNl0YFjGKzVbtfbIHUZFezx9Sg8zJNhEWrn/dDsdf+DrDyKPQmuaXJ/YGvZ
 Ta1Et2ZTyprKr5uExBcC8RmklJz849nKUzGgk3U/tVHzKdOQIIT9QgUIicjP1yLTY8
 JVUJ0Z9JsF3Nz4ht6gYabZxjo6764PdRthyb08J5Qi+PNa1/IjvEw2uPluU2hUBuks
 mhAxNISUXK7P4hZ36sGPTYLMI2JARh4OwqlnXz4RTKzqo/2AdKf3YqzspEKscV5W9Q
 L5/nfb1ekcOSmQJ4FGLSSJ0/cBti2pxB11+iuYffssVyrkTohkdmFfvj53bjzpWT8J
 kbC5PSmLybDiQ==
Date: Mon, 10 Jan 2022 20:31:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Robert Hancock <robert.hancock@calian.com>
Subject: Re: [PATCH v2 2/6] ASoC: xilinx: xlnx_formatter_pcm: Handle sysclk
 setting
Message-ID: <YdyXlalTSxPksLXH@sirena.org.uk>
References: <20220107214711.1100162-1-robert.hancock@calian.com>
 <20220107214711.1100162-3-robert.hancock@calian.com>
 <YdxGrApvHyPW1aii@sirena.org.uk>
 <b45aa6b8f3aa443da90b561e579370a0255e7017.camel@calian.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="FEHHpdbMt/SZii13"
Content-Disposition: inline
In-Reply-To: <b45aa6b8f3aa443da90b561e579370a0255e7017.camel@calian.com>
X-Cookie: Do you have lysdexia?
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "maruthi.srinivas.bayyavarapu@xilinx.com"
 <maruthi.srinivas.bayyavarapu@xilinx.com>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>
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


--FEHHpdbMt/SZii13
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 10, 2022 at 06:28:36PM +0000, Robert Hancock wrote:

> -On initialization for simple-card, if a clock frequency is specified in device
> tree, set_sysclk is called on the DAI by asoc_simple_init_dai (called by
> asoc_simple_dai_init). However, it doesn't appear that it is called on the
> platform (xlnx_formatter_pcm in this case) at this point.

> -startup gets called on the DAI from pcm_open, so xlnx_i2s should be able to
> add its rate constraints properly at that point. However, xlnx_formatter_pcm
> has no sysclk set at this point, so it couldn't currently enforce any
> constraint based on that.

I thought the later patches in your series were intended to fix things
so that the set_sysclk() does get called?

> -when the top-level hw_params call is made with simple-card, set_sysclk gets
> called on everything by asoc_simple_hw_params prior to hw_params calls on all
> of the components. The sysclk there is based on the device tree mclk-fs and the
> sample rate which might wipe out the original clock frequency if the
> constraints don't prevent setting an invalid rate.

If the device is using mclk-fs then either there's a fixed sample rate
(in which case simple-card probably ought to force it without the driver
worrying) or the sysclk will vary in which case simple-card should be
setting the sysclk to 0 when the card goes idle to clear any
constraints (which as you say later it does).

> -In the case of xlnx_formatter_pcm and simple-card, since sysclk is determined
> by sample rate times mclk-fs, there's no way for userspace to violate the
> constraint that the sample rate divides evenly into sysclk.

Only on a system where the sysclk can vary - this is a generic card so
someone could set a fixed sysclk, and of course the driver could be used
with other cards.

> -in order to add any constraints on sample rate based on sysclk in the
> formatter driver, it would need to get set_sysclk called during initialization
> which doesn't currently happen. But with simple-card, there's no way those
> constraints could be violated other than a kernel bug.

You shouldn't be making assumptions about the machine driver in the DMA
driver, especially for something like this used in a FPGA product which
has even more flexibility than most things.

> -xlnx_i2s needs some way to avoid its stored sysclk being wiped out during PCM
> close so that the constraints are handled properly during subsequent opens.

Depending on how flexible the system is clearing the sysclk stored in
the I2S driver may be desirable - if the sysclk rate can be changed then
you usually don't want to force constraints based on what it was during
the last stream, you want to relax such constraints so that a new sysclk
can be chosen where appropriate.

If that's not possible in this system then it sounds like it should be
setting system-clock-frequency and simple-card should then not be
clearing any setting in the components when the stream closes down, it
should be setting the clock up once at init.  Broadly speaking the
machine driver is responsible for ensuring that the overall system
configuration is sensible and coherent (that's what it's there for).

--FEHHpdbMt/SZii13
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHcl5QACgkQJNaLcl1U
h9DJLgf+JlsRQVfXravyumlh7XNIbuO2fRcm2KBwmQ07qMyvdGDtvifiKVHlOdJd
rqO7Rvm+YyOJGD/j1qQ9blAbfgetcabRfkCUzRMOll0loi4O8WQ7rAApsKjdVSRH
C2lKWSEZODw1mNntGv9uJoDkYmLByjY6aAoYHxzBUkWWunEjZrKm6tQex4jhVEpy
tduX1vjMXVk/li6vYmuWpKEotPOMawYbIHjtW/sMS1yrQjElJkC5TZtATw2EeFYB
jOf0QYtjXikaWfCu5rdhNhGnW55PUldQCT279UvLGzG1jlOfdMh28pESYa3Xt80b
VAm3ZQYO1BpiScCaknjR65vBB2ZEzw==
=irDM
-----END PGP SIGNATURE-----

--FEHHpdbMt/SZii13--
