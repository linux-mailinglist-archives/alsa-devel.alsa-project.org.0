Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D2E1F3F67
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 17:31:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F06A1607;
	Tue,  9 Jun 2020 17:30:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F06A1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591716672;
	bh=4hnMHO0b7qyOWr3a+bVN7ZwExY5W4vEcMALWb8nQ2Nk=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gvy/CcSWYUE9kGwN0PYsgpwI0gzDspdj58Kd2ymFxqcbbeEM1MHpWDGDeeFLeuatj
	 hzRvE2xi/Unl9yk0I2ixVsQgu3Pw90WMdLoP46Iz1xpdhXnSUnaeHIYa3ISKhPl9PD
	 15xc8QpX/0ldt9vGLEnUwXTx159VRZklZ2aZwv3g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55D51F80291;
	Tue,  9 Jun 2020 17:28:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5854F8028D; Tue,  9 Jun 2020 17:28:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F9A6F80088
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 17:28:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F9A6F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="l4gRhneS"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0F275207ED;
 Tue,  9 Jun 2020 15:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591716515;
 bh=4hnMHO0b7qyOWr3a+bVN7ZwExY5W4vEcMALWb8nQ2Nk=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=l4gRhneSXQYhlJ/f7cjzZDajdt79DzQEssKX/s+T1A8lkOQF0HoOEnvUY/OynryY3
 kRAHLwAmt4FIUycSKpUjDAs6hl515tb+A8ZqsB5ASUaZHU//4PPNs7EF8ZJynJRYIN
 9AGNSd9/rEAWVOcpa3w/zwrLPMN5n7s3j/iECOnE=
Date: Tue, 09 Jun 2020 16:28:33 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20200608194415.4663-1-pierre-louis.bossart@linux.intel.com>
References: <20200608194415.4663-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: Fix dailink checks for DPCM
Message-Id: <159171650846.43267.12716630143447019487.b4-ty@kernel.org>
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

On Mon, 8 Jun 2020 14:44:11 -0500, Pierre-Louis Bossart wrote:
> We've had a couple of changes that introduce regressions with the
> multi-cpu DAI solutions, and while trying to fix them we found
> additional inconsistencies that should also go to stable branches.
> 
> Bard Liao (1):
>   ASoC: core: only convert non DPCM link to DPCM link
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: soc-pcm: dpcm: fix playback/capture checks
      commit: b73287f0b0745961b14e5ebcce92cc8ed24d4d52
[2/4] ASoC: core: only convert non DPCM link to DPCM link
      commit: 607fa205a7e4dfad28b8a67ab1c985756ddbccb0
[3/4] ASoC: Intel: boards: replace capture_only by dpcm_capture
      commit: dc261875865539ca91bff9bc44d3e62f811dec1d
[4/4] ASoC: SOF: nocodec: conditionally set dpcm_capture/dpcm_playback flags
      commit: ba4e5abc6c4e173af7c941c03c067263b686665d

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
