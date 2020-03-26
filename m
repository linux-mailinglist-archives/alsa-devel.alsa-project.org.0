Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6469B194711
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 20:07:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F28F3166D;
	Thu, 26 Mar 2020 20:06:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F28F3166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585249655;
	bh=qhMEtAOpZ3JHQjZoEGYOIeXNuwmc6u5H9TMQtzQN/Wo=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=guoUDWfYhIGOLi0VuxSp6SHWVhLIWrxFs1lzM1qKS5TSTepzIbMIdfbda1okz5Ij8
	 /eFXjtC8tYZcUSmonqXpAf7ueuW5fsEGu7BDT3hWgKmB3FauNmHEidTxfyNiyuz986
	 K8Q94v/yWHy4MdK81rohnl/lfNXfksU6H4uFolEY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C734F8028D;
	Thu, 26 Mar 2020 20:05:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 479FBF80258; Thu, 26 Mar 2020 20:04:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 87C62F80234
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 20:04:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87C62F80234
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D7177FA;
 Thu, 26 Mar 2020 12:04:53 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D50433F71F;
 Thu, 26 Mar 2020 12:04:52 -0700 (PDT)
Date: Thu, 26 Mar 2020 19:04:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Applied "ASoC: rt1308-sdw: use slot and rx_mask to configure stream"
 to the asoc tree
In-Reply-To: <20200325212905.28145-3-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200325212905.28145-3-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

   ASoC: rt1308-sdw: use slot and rx_mask to configure stream

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

From 27a18e9e673f03b48a881e133a532c1619b711c7 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Wed, 25 Mar 2020 16:29:05 -0500
Subject: [PATCH] ASoC: rt1308-sdw: use slot and rx_mask to configure stream

If the DAI was configured with a set_tdm_slots() call, use the information.

A platform or machine driver may configure each amplifier to extract
different bitSlots from the frame, or extract the same data and use
processing to generate the relevant output. The latter case is easier
to handle in case of orientation changes.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200325212905.28145-3-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt1308-sdw.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index 8763192434c4..a5a7e46de246 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -539,7 +539,7 @@ static int rt1308_sdw_hw_params(struct snd_pcm_substream *substream,
 	struct sdw_port_config port_config;
 	enum sdw_data_direction direction;
 	struct sdw_stream_data *stream;
-	int retval, port, num_channels;
+	int retval, port, num_channels, ch_mask;
 
 	dev_dbg(dai->dev, "%s %s", __func__, dai->name);
 	stream = snd_soc_dai_get_dma_data(dai, substream);
@@ -559,13 +559,20 @@ static int rt1308_sdw_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
+	if (rt1308->slots) {
+		num_channels = rt1308->slots;
+		ch_mask = rt1308->rx_mask;
+	} else {
+		num_channels = params_channels(params);
+		ch_mask = (1 << num_channels) - 1;
+	}
+
 	stream_config.frame_rate = params_rate(params);
-	stream_config.ch_count = params_channels(params);
+	stream_config.ch_count = num_channels;
 	stream_config.bps = snd_pcm_format_width(params_format(params));
 	stream_config.direction = direction;
 
-	num_channels = params_channels(params);
-	port_config.ch_mask = (1 << (num_channels)) - 1;
+	port_config.ch_mask = ch_mask;
 	port_config.num = port;
 
 	retval = sdw_stream_add_slave(rt1308->sdw_slave, &stream_config,
-- 
2.20.1

