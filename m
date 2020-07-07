Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EDC216EA0
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 16:22:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E18082A;
	Tue,  7 Jul 2020 16:21:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E18082A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594131726;
	bh=/LlFcOsGpKUMnOH6IimxAh8FU5eazdHTMjv55z2HvpA=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dOBawPnns9hq3VMS6VxDrg+ALBgQ4/Ut1LGLtAcMVoCxosXDLazoYu9awh8shTYw8
	 UPEpII4vZws7F42oBM4wWbg+fhHRfD5DGf/gZbRCHr8ytEIzcoaUcQaXJvQ/mYhg+F
	 r4GAGh2SwnM/QluURsRUJpK9A/Sz/ZIq6IBqR+9I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBEF2F802EB;
	Tue,  7 Jul 2020 16:17:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70791F802EA; Tue,  7 Jul 2020 16:17:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5143F802DB
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 16:17:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5143F802DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CrEnk8ld"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0CF2920786;
 Tue,  7 Jul 2020 14:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594131454;
 bh=/LlFcOsGpKUMnOH6IimxAh8FU5eazdHTMjv55z2HvpA=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=CrEnk8ldIDyr3O0s/MAIyZDuCdL2azOTU+z9tSaiYE5M5c3E/ZeDf1xO7G9XIe1um
 Xzkw4ZmmS92bZie5gV21lRfF9jXg78WjBd6sJJ+F0fTU3/Q4h9FJGjtXbTQvVtI1is
 nH6LdJsUheiO6524qA9rsQ3e3SgKabeZTmrKvMtE=
Date: Tue, 07 Jul 2020 15:17:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20200702164433.162815-1-pierre-louis.bossart@linux.intel.com>
References: <20200702164433.162815-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/6] ASoC: amd: remove warnings with make W=1
Message-Id: <159413142466.34737.14025302386180733522.b4-ty@kernel.org>
Cc: tiwai@suse.de
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

On Thu, 2 Jul 2020 11:44:27 -0500, Pierre-Louis Bossart wrote:
> Yet another cleanup series, with good findings of variables not used
> for anything.
> 
> Pierre-Louis Bossart (6):
>   ASoC: amd: acp-da7219-max98357a: fix 'defined but not used' warning
>   ASoC: amd: acp-rt5645: fix 'defined but not used' warning
>   ASoC: amd: raven: acp3x-pcm-dma: fix 'set but not used' warning
>   ASoC: amd: raven: acp3x-i2s: fix 'set but not used' warning
>   ASoC: amd: raven: acp3x-pcm-dma: remove unused-but-set variable
>   ASoC: amd: raven: acp3x-i2s: remove unused-but-set variable
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: amd: acp-da7219-max98357a: fix 'defined but not used' warning
      commit: dc1aff7f0d1b79e17026e08b14d7bb60ccdae1c8
[2/6] ASoC: amd: acp-rt5645: fix 'defined but not used' warning
      commit: 41e4a5b32af6ccec4e11a1cbd20c5569d20faa24
[3/6] ASoC: amd: raven: acp3x-pcm-dma: fix 'set but not used' warning
      commit: 5ec2978f1e7494065d1b44e20b047e5840fd7ca7
[4/6] ASoC: amd: raven: acp3x-i2s: fix 'set but not used' warning
      commit: fadecf947a72f54843afa12c6732c52914d5024d
[5/6] ASoC: amd: raven: acp3x-pcm-dma: remove unused-but-set variable
      commit: 16607237f3b6a56ace8cdbd19bb793cb9bb3f18e
[6/6] ASoC: amd: raven: acp3x-i2s: remove unused-but-set variable
      commit: 343403e2dad897a3c6c974a43d760b4fb96b996b

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
