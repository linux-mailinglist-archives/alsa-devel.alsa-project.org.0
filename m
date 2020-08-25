Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9E62521F6
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 22:25:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46DA716F0;
	Tue, 25 Aug 2020 22:24:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46DA716F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598387127;
	bh=HySFqkSYZQcFq5ald9PWPw2laKIzGU1apduY/pJNmVo=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=li3ihEUNvCvh8+PbhScg4MtGb9JszSEKWbk+ycgizgbTMZhiwqO8ewwUTnYhPMgpy
	 yeBzmqcZafOHuJvU4KPwAP6O8A6pr/rM15toTFIXPuv06uUKHalW/Gvpl3oCr/FIEh
	 Fcm/P/Z2nEcLcXsgTJsynJH1Jugsh40m3zOI2szc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6C5DF802BC;
	Tue, 25 Aug 2020 22:20:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4F19F80269; Tue, 25 Aug 2020 22:19:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 469F9F80260
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 22:19:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 469F9F80260
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DrmRCeaH"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0F4C22075F;
 Tue, 25 Aug 2020 20:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598386788;
 bh=HySFqkSYZQcFq5ald9PWPw2laKIzGU1apduY/pJNmVo=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=DrmRCeaHCCdPa3xbEzU6wdZ53wH2quAj0VNg9kB3ekmfNWyeZUZwYcIqhrRo3DhiJ
 0F2AiHPNz+pGC5io7Gpjj6fDwjzmUtoGPj0Zs9dRMNPkODeuw4N0jgSKGuy/7KL8dL
 jI3RThxlxHSt3DGR8dptuOqqhkubm3Yi+oEDBocA=
Date: Tue, 25 Aug 2020 21:19:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20200824200912.46852-1-pierre-louis.bossart@linux.intel.com>
References: <20200824200912.46852-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/8] ASoC: SOF: trivial code/log/comment improvements
Message-Id: <159838674787.41542.7820759717091847706.b4-ty@kernel.org>
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

On Mon, 24 Aug 2020 15:09:04 -0500, Pierre-Louis Bossart wrote:
> Remove useless variable initialization and allocation, adjust log
> levels to make support easier, and fix comments. No functional
> changes.
> 
> Guennadi Liakhovetski (2):
>   ASoC: SOF: topology: (cosmetic) remove redundant variable
>     initialisations
>   ASoC: SOF: (cosmetic) use the "bool" type where it makes sense
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: SOF: topology: (cosmetic) remove redundant variable initialisations
      commit: c81a4ef725362dbce890a24d62e745f57172718a
[2/8] ASoC: SOF: (cosmetic) use the "bool" type where it makes sense
      commit: f738d8156d05b0331543ec097dd5d3c83465d68f
[3/8] ASoC: SOF: topology: remove unnecessary memory alloc for sdev->private
      commit: f3e9ed5e90603db73a699bed18311f15cba71531
[4/8] ASoC: SOF: topology: reduce the log level for unhandled widgets
      commit: f46ff50660e88235bd3dc993565c6440544a8e06
[5/8] ASoC: SOF: IPC: reduce verbosity of IPC pointer updates
      commit: 277ff2364b3e2a8351ac2a605bfdaba058ac7586
[6/8] ASoC: SOF: acpi: add dev_dbg() log for probe completion
      commit: 71d551f5aaed0ae3566bfc1c6c8b31e74cb5cd06
[7/8] ASoC: SOF: Intel: add dev_dbg log when driver is not selected
      commit: d5d023592e29b20aa17ba001495ebbab75b220f2
[8/8] ASoC: Intel: use consistent HDAudio spelling in comments/docs
      commit: 135ab457e776d042c481d70d8954f6775ce35958

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
