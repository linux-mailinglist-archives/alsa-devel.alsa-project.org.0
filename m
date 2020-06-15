Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A847B1FA4B4
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 01:44:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45D261660;
	Tue, 16 Jun 2020 01:44:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45D261660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592264690;
	bh=jHkTJHjduQC9+9EFbMcRvhbWtNAxkctB1zvS4CRnA/o=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y8qouBWFfp4nAGkirkVw5Rq5Fjsvdp9skdRDxvGPmDo6cKtLISf6JwmaFybRKVM/V
	 nppyR2RdnLSSiUlQxwRiX8emyIwxat8aQUDv97mEGHGeMPsskJwqsORiNE0x2F67z3
	 YAkDO+065ZO+4ip4TxMYxZoFflRIO7foGQ/eyt/4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD6B7F802E1;
	Tue, 16 Jun 2020 01:40:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47BA8F802E3; Tue, 16 Jun 2020 01:40:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF1EAF802E1
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 01:40:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF1EAF802E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="h5ITp4wR"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CE532207D4;
 Mon, 15 Jun 2020 23:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592264421;
 bh=jHkTJHjduQC9+9EFbMcRvhbWtNAxkctB1zvS4CRnA/o=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=h5ITp4wRVUsSufzjTuUdIO3Qw50m4LvT9OksCtTWBAkyhkCdvxKaFkKClTNKPNRyf
 O7YB5s45tGZxWM4P/GzjHqYdMnM9eOK0ok3eKIRQQbeTbPhwOw6DHSRYv5hIIp3z5L
 32NyHGaoFhhuzJaO3pFMrNbdVjzjY2L7PvjqesBU=
Date: Tue, 16 Jun 2020 00:40:19 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Sia Jee Heng <jee.heng.sia@intel.com>
In-Reply-To: <1591682783-1923-1-git-send-email-jee.heng.sia@intel.com>
References: <1591682783-1923-1-git-send-email-jee.heng.sia@intel.com>
Subject: Re: [PATCH v5 0/3] ASoC: Intel: Add KeemBay ASoC platform driver
Message-Id: <159226439189.27409.13376774227836668349.b4-ty@kernel.org>
Cc: liam.r.girdwood@linux.intel.com, cezary.rojewski@intel.com, tiwai@suse.com,
 andriy.shevchenko@intel.com, pierre-louis.bossart@linux.intel.com
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

On Tue, 9 Jun 2020 14:06:20 +0800, Sia Jee Heng wrote:
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
