Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D49175D75
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Mar 2020 15:43:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57F1716A8;
	Mon,  2 Mar 2020 15:42:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57F1716A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583160188;
	bh=4uB+mmdYYeExsjBKhpKt6sI8wT6RhS1DB1B6UYORGps=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=fJPLFcz0N2wQgM22ycA7WneSRtjNEkABoeH328PkiOQiychDH3/RV4SuORoAJhF9O
	 PT7A763oASpXaMdR83p/SQqtsPgM0PM3TFUv2K2KRZnh2/zocpYtop7pNqIYUfZmd8
	 QUBNfA7TzTGee1GW4+3tYM2MvuErB2JmynB7HtGw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3833CF802A1;
	Mon,  2 Mar 2020 15:37:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0BAAF802DB; Mon,  2 Mar 2020 15:37:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id AA089F802A1
 for <alsa-devel@alsa-project.org>; Mon,  2 Mar 2020 15:37:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA089F802A1
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 472522F;
 Mon,  2 Mar 2020 06:37:28 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFA3A3F534;
 Mon,  2 Mar 2020 06:37:27 -0800 (PST)
Date: Mon, 02 Mar 2020 14:37:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Keyon Jie <yang.jie@linux.intel.com>
Subject: Applied "ASoC: SOF: pcm: skip DMA buffer pre-allocation" to the asoc
 tree
In-Reply-To: <20200228231850.9226-2-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200228231850.9226-2-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

   ASoC: SOF: pcm: skip DMA buffer pre-allocation

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

From e582f4832a9ee27d92502b58f3a1b3331457e8bb Mon Sep 17 00:00:00 2001
From: Keyon Jie <yang.jie@linux.intel.com>
Date: Fri, 28 Feb 2020 17:18:47 -0600
Subject: [PATCH] ASoC: SOF: pcm: skip DMA buffer pre-allocation

As discussion in ALSA https://patchwork.kernel.org/patch/11336023/, it
is suggested to skip DMA buffer pre-allocation with passing size=0 when
calling snd_pcm_set_managed_buffer(), to make the full buffer_bytes
range configured in topology file selectable from user space, here do
the corresponding change in SOF PCM driver to implement it.

This change doesn't have dependency to the change that Takashi will do
in the ALSA core by adding total_pcm_alloc_bytes limitation to the
struct snd_card, it passes tests both with or without Takashi's coming
change on SOF CML platform.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Link: https://lore.kernel.org/r/20200228231850.9226-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/pcm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index b239bbff4b5c..f4769e19965a 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -601,8 +601,7 @@ static int sof_pcm_new(struct snd_soc_component *component,
 
 	snd_pcm_set_managed_buffer(pcm->streams[stream].substream,
 				   SNDRV_DMA_TYPE_DEV_SG, sdev->dev,
-				   le32_to_cpu(caps->buffer_size_min),
-				   le32_to_cpu(caps->buffer_size_max));
+				   0, le32_to_cpu(caps->buffer_size_max));
 capture:
 	stream = SNDRV_PCM_STREAM_CAPTURE;
 
@@ -624,8 +623,7 @@ static int sof_pcm_new(struct snd_soc_component *component,
 
 	snd_pcm_set_managed_buffer(pcm->streams[stream].substream,
 				   SNDRV_DMA_TYPE_DEV_SG, sdev->dev,
-				   le32_to_cpu(caps->buffer_size_min),
-				   le32_to_cpu(caps->buffer_size_max));
+				   0, le32_to_cpu(caps->buffer_size_max));
 
 	return 0;
 }
-- 
2.20.1

