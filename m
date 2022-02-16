Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E694B8E0B
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 17:32:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE8FC1AA6;
	Wed, 16 Feb 2022 17:31:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE8FC1AA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645029149;
	bh=+IxjPiP5bxN3ghR75uZ/F8DAxaQ91B6oRYHAuN8zFVs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JrAsirCI26162iK4kD2C+E9hORSMqiHqo+alV/mN2bewEsEeN86cpaKnfmaeDjAt7
	 T3nzudTXAF7zlCz2F1aVsiPXEpxbYQjVrXmzJc69pIj8vK4K4qydDRjxv8d4e5XfZj
	 mG5M4WPcyuXrPRVvvJLzDdHNY9tVCE/PT5yjfoc8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E57CF800C0;
	Wed, 16 Feb 2022 17:31:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73D5AF80128; Wed, 16 Feb 2022 17:31:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24188F800C0
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 17:31:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24188F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Zo/YS3Lm"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CAE6961B40;
 Wed, 16 Feb 2022 16:31:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 619FAC004E1;
 Wed, 16 Feb 2022 16:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645029077;
 bh=+IxjPiP5bxN3ghR75uZ/F8DAxaQ91B6oRYHAuN8zFVs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zo/YS3Lm2oR9caGDTkB5cPyqV3P/PRrdcV2vGiWyvmZ/3Ews0Q7qXdzUoz9dcWxG3
 6k0JkmPBN9ivGPI6WZyRIGnUPMWAfdlWgk11hZKfkxyYmV+AM2k9++85R4JoXpSg3+
 iozJrJqD8Wa3VHjavGZVjsjIXcdEPBl5neLZLgIyi6NeNz8sOS6bUrlo62LxhXykyw
 Y9EoAvls4eGRMca7jRj4Di6VV59ZdBeVCwUUqv+xM5mFPdXWTr2cn52nV850Y5MulC
 oYUacUmT3bxn3rcqYm4Ub1VghaLKShI09t6GCHNLavWaMVs8S373z9bkvFgnG34/Jb
 wKfgI0Fkx4jdg==
Date: Wed, 16 Feb 2022 16:31:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 2/3] ASoC: SOF: hda: Set max DMA segment size
Message-ID: <Yg0m0T/5dNpx2Xqa@sirena.org.uk>
References: <20220215132756.31236-1-tiwai@suse.de>
 <20220215132756.31236-3-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="SuurQS1bKHUL/qwH"
Content-Disposition: inline
In-Reply-To: <20220215132756.31236-3-tiwai@suse.de>
X-Cookie: Fremen add life to spice!
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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


--SuurQS1bKHUL/qwH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 15, 2022 at 02:27:55PM +0100, Takashi Iwai wrote:
> The recent code refactoring to use the standard DMA helper requires
> the max	DMA segment size setup for SG list management.	Without	it,
> the kernel may spew warnings when a large buffer is allocated.

Acked-by: Mark Brown <broonie@kernel.org>

--SuurQS1bKHUL/qwH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmINJtAACgkQJNaLcl1U
h9B7VggAgMJ8h83qGitj82ktes1JS5lqfF9SdJkGaKjPB/ktyf+/L8U/r2sVhBag
9ZXoxsmyefdCfPK1ki2hsIJthCovrIVJpNuWZn+new47pHW6mrhV//HXMhfPq45e
8gLErkeqbX13iAYKL0orSRvwIfXv0eagAQ9+dycjpW2hEiZns+VjhJ8jh01ZHGu7
HKVSWORG0nlnd53cZMqWzKpRM8IYWrHGheAhu58cvDDmIF5qMqE2PEHYJV0TC6IM
sliR1hQDTRY6rG5qwAFQOFbHuZJllM5HY5Rkb+uZ9e7k9wNYtdiw7sOHYuNz8/1f
z/FAD9/AgJKVD1ufOBuTRj4HdF2xJA==
=DW3B
-----END PGP SIGNATURE-----

--SuurQS1bKHUL/qwH--
