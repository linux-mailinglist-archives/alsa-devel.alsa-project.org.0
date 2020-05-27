Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7AE1E46A3
	for <lists+alsa-devel@lfdr.de>; Wed, 27 May 2020 16:59:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF12A17BD;
	Wed, 27 May 2020 16:58:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF12A17BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590591583;
	bh=cxp/hgv3AgD/ahOAOrtfpTH/Nsa5n1ZsfUimeE5WzDw=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DSV3ZXMOvJe7/VT3oYNWWzOX605hYbEx9y358GdhbxjmxX19bl6o+4Q0WQbxqX53g
	 /lNT6tDuO0zUiJfiKsQWVoSViMwSz7LU6mRK4/Vj71T8JYRV8SWz7iLFMn8J2rvfdq
	 W/FFJG13MUMRu0HLvAN7XAmUDu5fCMCSQa6iBmqY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8659F800FF;
	Wed, 27 May 2020 16:58:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97C78F8014E; Wed, 27 May 2020 16:58:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2AB6F800FF
 for <alsa-devel@alsa-project.org>; Wed, 27 May 2020 16:57:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2AB6F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="2VgANfAY"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9C7E5207CB;
 Wed, 27 May 2020 14:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590591476;
 bh=cxp/hgv3AgD/ahOAOrtfpTH/Nsa5n1ZsfUimeE5WzDw=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=2VgANfAYQeSwr0b/A+iF8hpmbZ4wY4jOxUf3xXj9ZhSPPlQrFai2eTG6hwAnuTF4R
 yRllW2f0tK96NEjHS5hP/4hr8Bn/0wl2uSQyI4USyVlm33nus5ZL+0GpdCL5LQSGbn
 Y2xTyOU479K8HvX6A+uD1GNjByS1f1X851i7g060=
Date: Wed, 27 May 2020 15:57:53 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20200526203640.25980-1-pierre-louis.bossart@linux.intel.com>
References: <20200526203640.25980-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/8] ASoC: SOF: finalize Baytrail/CherryTrail support
Message-Id: <159059147353.50918.15094784913111490999.b4-ty@kernel.org>
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

On Tue, 26 May 2020 15:36:32 -0500, Pierre-Louis Bossart wrote:
> This long-overdue patchset adds missing system suspend/resume support
> and hardens the IPC to solve module load/unload issues on specific
> devices such as Cyan Chromebook. With this series SOF is finally
> iso-feature with the legacy driver. Thanks to Ranjani and Keyon for
> the basic patches and Enric for testing.
> 
> The last part needed for Baytrail/Cherrytrail is simplification of the
> driver/card names and turn-key UCM support (on-going work with
> Jaroslav).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: SOF: Intel: byt: Add PM callbacks
      commit: ddcccd543f5dbd841fe305452651b0f8c1d74f0f
[2/8] ASoC: SOF: pm: handle resume on legacy Intel platforms
      commit: fc907cc527e6568b7486309188e545161891e1f2
[3/8] ASoC: Intel: bytcr_rt5640/51: remove .ignore_suspend
      commit: 512e76724ffd07c6a5eb7d93c79d160e85465228
[4/8] ASoC: Intel: byt/cht: add .pm_ops
      commit: 68224376bc2a0508f57bff67c8dcd2b5761dc939
[5/8] ASoC: SOF: ipc: ignore DSP replies received when they are not expected
      commit: d7a1ed268993f4bc758fa509b22fc730af1623f9
[6/8] ASoC: SOF: Intel: BYT: add .remove op
      commit: c691f0c6e267da4207392b1082d011323c3f8606
[7/8] ASoC: SOF: Intel: BYT: mask BUSY or DONE interrupts in handler
      commit: 3d3d1fb9ce34bc045b9d140a5f2ec531eff6a0fe
[8/8] ASoC: SOF: Intel: BYT: harden IPC initialization and handling
      commit: 3d2e5c480742b4a22534e72e2647b6c8c98a94a4

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
