Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D06F54AE48
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 12:27:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2376017F0;
	Tue, 14 Jun 2022 12:26:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2376017F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655202433;
	bh=NtfG1AQIcHLoK85/ppWe+StyZnfKLy3RTpV6LmmkOjk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZRCOa0pokcukfG5oftu0cy0YIpHDLqES05iGMmvmhSqiDMtZCVsd1qYAC0xA9SaHZ
	 erRyEuULiIbzaGMUZs9DDMQvvEh5M+8EzVnp3EWXnN2II3h3iukBmawaV+cMSL1MYv
	 F2Xynp4L5uXHYRkgKXMLNvwupLhze7jOaPnzgpEY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A5D3F80533;
	Tue, 14 Jun 2022 12:25:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FE57F80533; Tue, 14 Jun 2022 12:25:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98957F800D8
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 12:25:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98957F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MT/tsId3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DC9D360C5C;
 Tue, 14 Jun 2022 10:25:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18191C341C4;
 Tue, 14 Jun 2022 10:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655202309;
 bh=NtfG1AQIcHLoK85/ppWe+StyZnfKLy3RTpV6LmmkOjk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=MT/tsId3DnrGt/FJ/BHHM5ki3xrTfSdUGT7TkatjQRN2RcDfPAV7G/ac3SuttKnzA
 DWn1LtBUIois29DFJWvpF8h1dtFUNVRIuJqsxLt/DUAtiE2YTCP55rwpe3j10BXcdb
 1U8VRKGnYLJUT3rpE11MBJ1VHA/3cne/Q65E2Cdmc7i/CvC1GcjawfSFIT3Ntb2Uza
 AuurPyUGAxoVGpTpNoI7wdE9W7P2gmBfftc4BNwQYJXAd1VIn1ABf4LnR2GptugN2o
 9t0PvVyfYcdkQ/teRoYlKU3sjAXhUIXsAZP/bfSMC+lH4fOh73JqLvfbWcLgkNrsie
 IAOWCnNdQG3ow==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20220610214415.42942-1-pierre-louis.bossart@linux.intel.com>
References: <20220610214415.42942-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: intel: sof_sdw: add RT711 SDCA card for MTL platform
Message-Id: <165520230782.3607327.11391458588524693814.b4-ty@kernel.org>
Date: Tue, 14 Jun 2022 11:25:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, yung-chuan.liao@linux.intel.com, uday.m.bhat@intel.com,
 yong.zhi@intel.com
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

On Fri, 10 Jun 2022 16:44:15 -0500, Pierre-Louis Bossart wrote:
> From: Yong Zhi <yong.zhi@intel.com>
> 
> Enable on-board rt711 based sound card for MTL RVP.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: intel: sof_sdw: add RT711 SDCA card for MTL platform
      commit: 18489174e4fb98ad07fd387973a39e755ac01dee

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
