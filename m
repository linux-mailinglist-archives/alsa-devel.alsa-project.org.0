Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E32F14A9A3
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jan 2020 19:16:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F062583E;
	Mon, 27 Jan 2020 19:15:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F062583E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580148995;
	bh=TNQvTmNkPrCtwgGAitNzXGdGn4Mu4/Q2nQOUrNkd+V4=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=OMKTMsw4vvLlXutbIPLt+k7ukkyEzUVMXXhnPdMnfTvQ77ZPR/60t+aG8UNKE/PT6
	 tlfCsTy+GVWlMau1iH/7gLYhybm4et1F8Ppe4n1+cBGZP9rimtUU37vpXSNak5TTKX
	 q1nAlg2B7czhj7o43lVjWEpvfYCWQO9eJKeqYr9A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27AD1F802A1;
	Mon, 27 Jan 2020 19:11:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C2C6F8027D; Mon, 27 Jan 2020 19:11:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id DDBEDF80278
 for <alsa-devel@alsa-project.org>; Mon, 27 Jan 2020 19:11:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDBEDF80278
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1004101E;
 Mon, 27 Jan 2020 10:11:37 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 02F543F67D;
 Mon, 27 Jan 2020 10:11:36 -0800 (PST)
Date: Mon, 27 Jan 2020 18:11:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
In-Reply-To: <20200124213625.30186-2-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200124213625.30186-2-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: fix an Oops,
	caused by invalid topology" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: SOF: fix an Oops, caused by invalid topology

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

From 4f7f9564a8937f38f97e8624cb7d6a28ee35f7cb Mon Sep 17 00:00:00 2001
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Date: Fri, 24 Jan 2020 15:36:19 -0600
Subject: [PATCH] ASoC: SOF: fix an Oops, caused by invalid topology

It is possible to create invalid topology that will cause a kernel
Oops when trying to allocate buffers for a NULL substream.
Specifically such an Oops was caused by a topology, where a DAI on a
capture pipeline was referencing the PCM ID from a playback pipeline.
Fix the Oops by explicitly checking for NULL.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200124213625.30186-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/pcm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 314f3095c12f..29435ba2d329 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -591,6 +591,11 @@ static int sof_pcm_new(struct snd_soc_component *component,
 		"spcm: allocate %s playback DMA buffer size 0x%x max 0x%x\n",
 		caps->name, caps->buffer_size_min, caps->buffer_size_max);
 
+	if (!pcm->streams[stream].substream) {
+		dev_err(component->dev, "error: NULL playback substream!\n");
+		return -EINVAL;
+	}
+
 	snd_pcm_set_managed_buffer(pcm->streams[stream].substream,
 				   SNDRV_DMA_TYPE_DEV_SG, sdev->dev,
 				   le32_to_cpu(caps->buffer_size_min),
@@ -609,6 +614,11 @@ static int sof_pcm_new(struct snd_soc_component *component,
 		"spcm: allocate %s capture DMA buffer size 0x%x max 0x%x\n",
 		caps->name, caps->buffer_size_min, caps->buffer_size_max);
 
+	if (!pcm->streams[stream].substream) {
+		dev_err(component->dev, "error: NULL capture substream!\n");
+		return -EINVAL;
+	}
+
 	snd_pcm_set_managed_buffer(pcm->streams[stream].substream,
 				   SNDRV_DMA_TYPE_DEV_SG, sdev->dev,
 				   le32_to_cpu(caps->buffer_size_min),
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
