Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF401FA4BC
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 01:45:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6ED061672;
	Tue, 16 Jun 2020 01:45:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6ED061672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592264752;
	bh=AMSPeb9LSr9BTLUFOmKRDiTwE5KADRHNGLrdUASLXx4=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pK8krMGP5MidpHuwZTZSPyxOpy6MaMcMQptOJmYnkwJNpYG1CTFawEtxJWUXnNKjg
	 4z1zThiSWPKnE1GDWPCpMViiCwoUgH0C0R7gk/2W+5hhEaly8+Y/BU6ZHJwH2QSmB8
	 JdiQ6XCsECp/aqFDOldR/3JnyI5wzwX1bDKBRinI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9CE8F802FB;
	Tue, 16 Jun 2020 01:40:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48E71F802EA; Tue, 16 Jun 2020 01:40:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAC37F802E7
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 01:40:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAC37F802E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZiDb7xRe"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CFDAA207D3;
 Mon, 15 Jun 2020 23:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592264431;
 bh=AMSPeb9LSr9BTLUFOmKRDiTwE5KADRHNGLrdUASLXx4=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=ZiDb7xRehnAxW5GHDxZzPbwgZdyDcFB99qaZWnxURqn/MqmKFII3gkw5lW5GXPYa8
 dSJI8PFgIOk6QIDq/dusQHX2xBSI/WHxJugi2K8laQmHO905odyV3jQmqYMSuMMzfY
 6NnNjPYYHGAo2IjqXU/ssVJgsKJ0oeQM9bsoj2FY=
Date: Tue, 16 Jun 2020 00:40:29 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Sia Jee Heng <jee.heng.sia@intel.com>
In-Reply-To: <1591005201-31704-1-git-send-email-jee.heng.sia@intel.com>
References: <1591005201-31704-1-git-send-email-jee.heng.sia@intel.com>
Subject: Re: [PATCH v3 0/3] ASoC: Intel: Add KeemBay ASoC platform driver
Message-Id: <159226439188.27409.9475812550607623856.b4-ty@kernel.org>
Cc: liam.r.girdwood@linux.intel.com, tiwai@suse.com,
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

On Mon, 1 Jun 2020 17:53:18 +0800, Sia Jee Heng wrote:
> The below series of patches support the KeemBay ASoC platform driver.
> The platform driver initialize the i2s to capture and playback the
> pcm data on the ARM. The i2s is running in polling mode.
> 
> There is no DSP in the KeemBay SoC. Users are rely on the Gstreamer plugin
> to perform Audio preprocessing.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: Intel: Add KeemBay platform driver
      commit: c5477e966728f8e9d1434543d4ee677d515e1078
[2/3] ASoC: Intel: Add makefiles and kconfig changes for KeemBay
      commit: c544912bcc2dc806ba71d9157ccefca4a4a885f0
[3/3] ASoC: Add documentation for KeemBay i2s
      commit: e16caedf737145f74e34e45205b15695adf66f38

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
