Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BFF184C82
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 17:29:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95D4F183D;
	Fri, 13 Mar 2020 17:28:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95D4F183D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584116973;
	bh=YcsxiDbLxQ4OrsTkcRPIHn3RRKIU7oTy9XFVqM+w7es=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=AzptuGTO3p8SO0TuZRbZkITV1hTv500Ad41PrYVLYyIdIO5PttUcIjCtRKC2Uzm+S
	 gSmfv47utBCIGAB0nDsajhb8TdRdq0Gye+guUUoRaJDqqWCp3g/OvDf5oV4wGonTp2
	 Y4xTj4GRz++QWNL1Wk8bWY4MssecnZiYLW+rhtXE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C345CF8034B;
	Fri, 13 Mar 2020 17:19:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71C19F80322; Fri, 13 Mar 2020 17:18:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 53EA3F80321
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 17:18:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53EA3F80321
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27BE51045;
 Fri, 13 Mar 2020 09:18:33 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F4CD3F6CF;
 Fri, 13 Mar 2020 09:18:32 -0700 (PDT)
Date: Fri, 13 Mar 2020 16:18:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Applied "ASoC: SOF: Intel: hda-dai: add stream capability" to the
 asoc tree
In-Reply-To: <20200312200622.24477-2-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200312200622.24477-2-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
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

The patch

   ASoC: SOF: Intel: hda-dai: add stream capability

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From e81d47e94c569f537e008ede59e70e4f27904c86 Mon Sep 17 00:00:00 2001
From: Bard Liao <yung-chuan.liao@linux.intel.com>
Date: Thu, 12 Mar 2020 15:06:17 -0500
Subject: [PATCH] ASoC: SOF: Intel: hda-dai: add stream capability

snd_soc_dai_stream_valid() will check if the stream is valid by testing
stream->channels_min. So we do need the information in dai driver.

The stream name is not added since we want to sure
playback_widget/capture_widget will be created by topology.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Link: https://lore.kernel.org/r/20200312200622.24477-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-dai.c | 96 +++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index ed5e7d2c0d43..b9e3ce65e778 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -422,56 +422,152 @@ static struct snd_soc_cdai_ops sof_probe_compr_ops = {
 struct snd_soc_dai_driver skl_dai[] = {
 {
 	.name = "SSP0 Pin",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
 },
 {
 	.name = "SSP1 Pin",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
 },
 {
 	.name = "SSP2 Pin",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
 },
 {
 	.name = "SSP3 Pin",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
 },
 {
 	.name = "SSP4 Pin",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
 },
 {
 	.name = "SSP5 Pin",
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
 },
 {
 	.name = "DMIC01 Pin",
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 4,
+	},
 },
 {
 	.name = "DMIC16k Pin",
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 4,
+	},
 },
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 {
 	.name = "iDisp1 Pin",
 	.ops = &hda_link_dai_ops,
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
 },
 {
 	.name = "iDisp2 Pin",
 	.ops = &hda_link_dai_ops,
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
 },
 {
 	.name = "iDisp3 Pin",
 	.ops = &hda_link_dai_ops,
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
 },
 {
 	.name = "iDisp4 Pin",
 	.ops = &hda_link_dai_ops,
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
 },
 {
 	.name = "Analog CPU DAI",
 	.ops = &hda_link_dai_ops,
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 16,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 16,
+	},
 },
 {
 	.name = "Digital CPU DAI",
 	.ops = &hda_link_dai_ops,
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 16,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 16,
+	},
 },
 {
 	.name = "Alt Analog CPU DAI",
 	.ops = &hda_link_dai_ops,
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 16,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 16,
+	},
 },
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_PROBES)
 {
-- 
2.20.1

