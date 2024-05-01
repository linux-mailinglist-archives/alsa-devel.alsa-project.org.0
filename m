Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D1F8B8B72
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2024 15:45:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F419FDF8;
	Wed,  1 May 2024 15:45:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F419FDF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714571117;
	bh=vXcDcxtnSs/apJuU11xn+Yb+fqjx2BAQ0xsxIB3/Fe0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iMQxNShDDr8pR+hVQ6wFZjOqbCnp+gFfL4ym3weH1hvlqWgYQytwbvB7aXjjPHXxl
	 F32ZTB5d9kUNrJCa9j/f9aFQBWc4F0dHuPIJh2z0KKAI8DJVo9BVP0t7aDg1i/f31H
	 R7+0J6nb0m5x/0aP6CHI+UIMrxIzy6r57oLrewT0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E2ABF805AA; Wed,  1 May 2024 15:44:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61D6AF80580;
	Wed,  1 May 2024 15:44:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B9FFF8028D; Wed,  1 May 2024 15:44:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1B8F3F8025D
	for <alsa-devel@alsa-project.org>; Wed,  1 May 2024 15:43:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B8F3F8025D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=amDgI5Ro
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3B183CE12FA;
	Wed,  1 May 2024 13:43:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E112C4AF18;
	Wed,  1 May 2024 13:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714571001;
	bh=vXcDcxtnSs/apJuU11xn+Yb+fqjx2BAQ0xsxIB3/Fe0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=amDgI5RoQy9yqB66pcrgP0Nw4V1kiXuB06mPrZRrmNMkxeb7lBF12yRCmzI1m+w3Z
	 3pjCuYXsu7ouGsyAYCjeK1mYUzBPvTDcuZdxCt9qe9pJ4Sf481tkwOp+PGrWR/wdB/
	 odK6nWimy0OecG4fsTMaktEvoexTN6DIUeFXtRCvkuI1+5PnR212uc4VELbPuGBBz6
	 wAXnc7DYC7vcOE/DFiT6XHeDmM/NCx50ShJaLYuYyhFx1LL4IP2MWpLgfFBtt/d7Gz
	 JOR71woW/3kbwLwiOxNZqLc/yS1bUvwFid4U33wbJOnT7rKXDhxdmnO5tMXC8IxM7Z
	 5sUDhDxzBbVvQ==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/23] ASoC: Intel: updates for 6.10 - part6
Message-Id: <171457100000.1888704.11793810516095524416.b4-ty@kernel.org>
Date: Wed, 01 May 2024 22:43:20 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: 3BND6VCCBSQ52RYGJSFV277DIMDYDMIW
X-Message-ID-Hash: 3BND6VCCBSQ52RYGJSFV277DIMDYDMIW
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3BND6VCCBSQ52RYGJSFV277DIMDYDMIW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 26 Apr 2024 10:25:06 -0500, Pierre-Louis Bossart wrote:
> Last batch of cleanups from Brent Lu, with Chromebooks now supported
> with fewer modular machine drivers.
> 
> Bard Liao (1):
>   ASoC: Intel: sof_rt5682: add missing MAX98357A config
> 
> Brent Lu (22):
>   ASoC: Intel: nau8825/rt5682: move speaker widget to common modules
>   ASoC: Intel: sof_maxim_common: support MAX98390 on cml boards
>   ASoC: Intel: sof_da7219: support MAX98390
>   ASoC: Intel: sof_da7219: add cml_da7219_def for cml boards
>   ASoC: Intel: sof_da7219: support MAX98390 on cml boards
>   ASoC: Intel: bxt_da7219_max98357a: remove MAX98390 support
>   ASoC: Intel: sof_da7219: support MAX98357A
>   ASoC: Intel: sof_da7219: support MAX98357A on cml boards
>   ASoC: Intel: bxt_da7219_max98357a: remove cml support
>   ASoC: Intel: sof_da7219: add glk_da7219_def for glk boards
>   ASoC: Intel: sof_da7219: support MAX98357A on glk boards
>   ASoC: Intel: bxt_da7219_max98357a: remove glk support
>   ASoC: Intel: sof_rt5682: add glk_rt5682_def for glk boards
>   ASoC: Intel: sof_rt5682: support MAX98357A on glk boards
>   ASoC: Intel: glk_rt5682_max98357a: delete driver
>   ASoC: Intel: sof-rt5682: add mclk_en to sof_rt5682_private
>   ASoC: Intel: sof-rt5682: remove SOF_RT5682_MCLK_BYTCHT_EN
>   ASoC: Intel: sof_rt5682: add icl_rt5682_def for icl boards
>   ASoC: Intel: sof-rt5682: add driver_data to sof_rt5682 board
>   ASoC: Intel: sof-rt5682: setup pll_id only when needed
>   ASoC: Intel: sof-rt5682: get bclk frequency from topology
>   ASoC: Intel: sof-rt5682: support bclk as PLL source on rt5682s
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/23] ASoC: Intel: nau8825/rt5682: move speaker widget to common modules
        commit: d2d377fc22d23fd38188ea90b051584069a299a2
[02/23] ASoC: Intel: sof_maxim_common: support MAX98390 on cml boards
        commit: 3b3ed4752600b6462c184edc3284dcc277891aa6
[03/23] ASoC: Intel: sof_da7219: support MAX98390
        commit: b7654a7e217704694ed3e484f0a3c415f8678896
[04/23] ASoC: Intel: sof_da7219: add cml_da7219_def for cml boards
        commit: a0cf86d813d22d80046d83e9b36c1c2308903956
[05/23] ASoC: Intel: sof_da7219: support MAX98390 on cml boards
        commit: 5a2bc761fab23e47ef20a847476d504548dfb417
[06/23] ASoC: Intel: bxt_da7219_max98357a: remove MAX98390 support
        commit: 12e5fe68d0bb079cc5228d09280c1d82a61f0d18
[07/23] ASoC: Intel: sof_rt5682: add missing MAX98357A config
        commit: 5b093b0b47efefbb928c4d3a5e982bbeaefda44c
[08/23] ASoC: Intel: sof_da7219: support MAX98357A
        commit: 7873252c0e44ef5c0e04cf3c7c25f5e2c5180272
[09/23] ASoC: Intel: sof_da7219: support MAX98357A on cml boards
        commit: e895d16f4e8f0e5d90d7188e8fd9c507a97fb8b7
[10/23] ASoC: Intel: bxt_da7219_max98357a: remove cml support
        commit: 35ca48662cdf0749a2b9931d625690967fbce032
[11/23] ASoC: Intel: sof_da7219: add glk_da7219_def for glk boards
        commit: c7f9523d21d49b56498ac58e4b1afcb930eb551a
[12/23] ASoC: Intel: sof_da7219: support MAX98357A on glk boards
        commit: f46b768b7281e4ef784d06788be2f941c13eddde
[13/23] ASoC: Intel: bxt_da7219_max98357a: remove glk support
        commit: 8d6114b81d72c522f1ad55cd84ed37699d58c840
[14/23] ASoC: Intel: sof_rt5682: add glk_rt5682_def for glk boards
        commit: 44567d3d62dfe9df514299a98429a59129e0a2d0
[15/23] ASoC: Intel: sof_rt5682: support MAX98357A on glk boards
        commit: 5498a4edbf314532b7138aabe705faa34fb5df8d
[16/23] ASoC: Intel: glk_rt5682_max98357a: delete driver
        commit: 0cb6a8134c1cb59d8f41d84968c2e20cfbd7f6cc
[17/23] ASoC: Intel: sof-rt5682: add mclk_en to sof_rt5682_private
        commit: e91d54f8b1bd3393d91fd754a1c40df6f408e84b
[18/23] ASoC: Intel: sof-rt5682: remove SOF_RT5682_MCLK_BYTCHT_EN
        commit: 207255f3ae4d0cf5034666652668be572d9c5c1e
[19/23] ASoC: Intel: sof_rt5682: add icl_rt5682_def for icl boards
        commit: 76fb0d3221833e87b9150ba06728cdde215ec687
[20/23] ASoC: Intel: sof-rt5682: add driver_data to sof_rt5682 board
        commit: 76f33e2f93d63eaac93458fdfde3a505b8e73fa2
[21/23] ASoC: Intel: sof-rt5682: setup pll_id only when needed
        commit: b5aaf6a56dcafc2aeefdc7da1f9f86fa5cfa8df7
[22/23] ASoC: Intel: sof-rt5682: get bclk frequency from topology
        commit: 4524b1e3ef7884e0a54484dce8d921be7a06af13
[23/23] ASoC: Intel: sof-rt5682: support bclk as PLL source on rt5682s
        commit: 3d84e070253eb853e3190a23994aa3074615efd1

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

