Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E380F3B0883
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Jun 2021 17:17:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BFFC1677;
	Tue, 22 Jun 2021 17:16:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BFFC1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624375027;
	bh=P/cNEu3O0jDko+UBmbkmWZ6TfULET0WVsarLODx2bNw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MmIJZHIr48tA1bM5bKZlIEeyJi4QmTQTY6q6APKydiy+COp4qv/lEMn68H4gLyqOZ
	 6dWxDbYLb6HuUg1IIqnGeZHC8J9MMIScYrGY/CCpIVLZ5jjdk/CxCpl9t8hWp28QMs
	 WUrZtjtS7oto+YNUeoEeVFSD4PDh7+2XBMET+to0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EE5DF804D8;
	Tue, 22 Jun 2021 17:14:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37E34F80268; Tue, 22 Jun 2021 17:14:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D461BF800E1
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 17:14:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D461BF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZaNCRtcL"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E9E766128C;
 Tue, 22 Jun 2021 15:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624374884;
 bh=P/cNEu3O0jDko+UBmbkmWZ6TfULET0WVsarLODx2bNw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZaNCRtcLRlH1N/J4hwSN/WUIk16QTf/8bD1E6tr9XtqWI6dlEOJ0SI3BM7dqDRus2
 MSxQuiS1SWUiDujlDBUTghu/+jx6N97SbT3S+MFSLnNuneIrhkAqPNPL3rZjerS7Lb
 yYTXjuD34IW2pNwJxKZ54i3HlvFmUjkqD7Pi3uUQzKqiT/BHkoKrHp7FSJRgxVZPUp
 0i66uGYVu5UNtw43e8MvgOoapVNbhX9Xfg6y+F54NoeAzC3iiy20NGTzfqy1BW9ybj
 rruhbF+oRZRCS1Xi4Ofq2gq4FP8A0OSAkAZd9XTEKIPIbzxXsIc3O9+nI+owfbYKmx
 Dy+Rp1y/FuBpA==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH v2 00/10] ASoC: Intel: machine driver corrections
Date: Tue, 22 Jun 2021 16:14:06 +0100
Message-Id: <162437355278.1773.14835834607949571129.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621194057.21711-1-pierre-louis.bossart@linux.intel.com>
References: <20210621194057.21711-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Mark Brown <broonie@kernel.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

On Mon, 21 Jun 2021 14:40:47 -0500, Pierre-Louis Bossart wrote:
> Some of these patches dealing with Sparse warnings were submitted
> earlier but not merged. I grouped them with a couple of fixes from
> Kai.
> 
> v2:
> added Mark Brown in CC, was missed in v1
> added Richard Fitzgerald Tested-by
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: Intel: sof_sdw: use mach data for ADL RVP DMIC count
        commit: 505351329d26e684588a6919c0407b8a0f5c3813
[02/10] ASoC: Intel: sof_sdw: remove hdac-hdmi support
        commit: b0cf3d3ccf31f31c9c415566968caf1405fc0893
[03/10] ASoC: Intel: sof_rt5682: shrink platform_id names below 20 characters
        commit: 590cfb082837cc6c0c595adf1711330197c86a58
[04/10] ASoC: Intel: glk_rt5682_max98357a: shrink platform_id below 20 characters
        commit: bc47256afef38175a0ad6bcfd4dbab9d2c65b377
[05/10] ASoC: Intel: kbl_da7219_max98357a: shrink platform_id below 20 characters
        commit: 94efd726b947f265bd313605c9f73edec5469d65
[06/10] ASoC: Intel: sof_da7219_max98373: shrink platform_id below 20 characters
        commit: 1cc04d195dc245457a45df60e6558b460b8e4c71
[07/10] ASoC: Intel: sof_sdw: fix signed/unsigned warning
        commit: 0a1f3958eab16cd31bf3d714363471a7a6722dc9
[08/10] ASoC: Intel: soc-acpi: add ull suffix for SoundWire _ADR values
        commit: 0c52d3e222889138e6a8dd1c1ad05fcc41c6bdfa
[09/10] ASoC: Intel: use MODULE_DEVICE_TABLE with platform_device_id tables
        commit: 53b98536fb64f1b6ff5a1b2cfc36bbfa90619414
[10/10] ASoC: Intel: skl_hda_dsp_generic: Update Kconfig documentation
        commit: bf35a1eeaca618341409f94c90271bb14d1c484a

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
