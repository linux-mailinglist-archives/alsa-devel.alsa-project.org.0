Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 581DD54CA6D
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jun 2022 15:56:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF4DE1908;
	Wed, 15 Jun 2022 15:55:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF4DE1908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655301386;
	bh=dsFBCqxi5+rm7d/vKyHSZXyn8G5XYjrNJYoeNI9XU3U=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EksvpUIfLaGBs5X8HOn6yznD6dQI2bFgbw6L1fICvfYXbazvxt6suEqyO10P2SzZe
	 sJQcBI804Pz1PB5IXpFBCdQ9GDRATvr/wcaOcosrCwj7F9USQptQy5LhSYN5uvPcEr
	 PBAopV5fUzPmxNTEdRLDRvxMsEfegf81JLcb8YmY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABD2DF8052D;
	Wed, 15 Jun 2022 15:54:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F63BF804B0; Wed, 15 Jun 2022 15:54:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C0A1F8016C
 for <alsa-devel@alsa-project.org>; Wed, 15 Jun 2022 15:54:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C0A1F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MFISBOcD"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E4CD3B81E66;
 Wed, 15 Jun 2022 13:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C3FC34115;
 Wed, 15 Jun 2022 13:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655301281;
 bh=dsFBCqxi5+rm7d/vKyHSZXyn8G5XYjrNJYoeNI9XU3U=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=MFISBOcDi0N9xeJux0zRoP5IPR+3bRbR+q/GlslTR+4NCKwxlArGSdNFDdcnh2qay
 5e/Ui5crnDkPe6HOycxHUiKl4e7VvrtyodHbE6KDAmd7TzadGR/rcV1Ts3SDiOTTn1
 iDOrG7G18Y20nGaXCE0cHueu2hgqcS/++ra2n5RPxesi9Boy2N31NfJ0N9K1MRTs3A
 cYuKC69EzJTHbp3fO9VBz20dl9NVdC4vfehKqCy/AVTCkJkl+Wf/6jPpf0UQ0Uz8D9
 csHPO6SPk9mpFOaRy0eSnc/r2jWobmp3GVSDop5u07aGn02KgLz7gF0fZ8b6XFvJfM
 lmJwdWteclSdA==
From: Mark Brown <broonie@kernel.org>
To: yung-chuan.liao@linux.intel.com, tiwai@suse.de
In-Reply-To: <20220615084348.3489-1-yung-chuan.liao@linux.intel.com>
References: <20220615084348.3489-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: Intel: Add support for MeteorLake
Message-Id: <165530128015.947339.2563327661123479806.b4-ty@kernel.org>
Date: Wed, 15 Jun 2022 14:54:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, peter.ujfalusi@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com,
 ranjani.sridharan@linux.intel.com
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

On Wed, 15 Jun 2022 16:43:46 +0800, Bard Liao wrote:
> Add platform abstraction for the Meteor Lake platform.
> 
> This platform has significant differences compared to the TGL/ADL
> generation: it relies on new hardware using the code name 'ACE' and
> only supports the INTEL_IPC4 protocol and firmware architecture based
> on the Zephyr RTOS
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOC: Intel: introduce cl_init callback
      commit: ab222a4aaecfafece1516c775143e1cb9eb31612
[2/2] ASoC: SOF: Intel: Add support for MeteorLake (MTL)
      commit: 064520e8aeaa2569f6504a50a37ac801b73656bc

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
