Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EB848720
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 17:29:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 364851729;
	Mon, 17 Jun 2019 17:28:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 364851729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560785368;
	bh=ICgTHcqddVlwk6EEsJrCee/9CU8lBtkK0kNIQoZEOqM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Ugi2oP93YPPp+RvFzC62xYCQIJp8MvSUqW32ZUqzYavSw+UU5dk/hFDiiud8NvCwN
	 cr92b5XYJOqk7GqvJYxS9oz1ocqkDJsHaaEm3HEZmww2LXS3whOE7KQVbTKmQgAZs2
	 vxTW66mlsJ6mGwZ6tsbWzPYNuuJq+uoZ2HDwnnwc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40181F8972F;
	Mon, 17 Jun 2019 17:24:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 520D4F89693; Mon, 17 Jun 2019 17:24:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFA1AF89693
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 17:24:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFA1AF89693
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="HWx9K5IK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=5FMv7FUuFeas2gfDe5EhFAr3DdhjqZBw05cyvLpRY6c=; b=HWx9K5IKMBH4
 iJlfzw6TlX7GGdxepkhX2IRmfMn6ZubP6wWpG+LgKeojeB/kdkvuFSVPa9QgHUoEvQdLh1wtZ9i7H
 fg8JUW7yVp8PSKowmuRIc5I/e7abm+EO30bvS7yjw4yijpCI4VVyD2DC6KUZj34UFn6KrlcH6CFtR
 UjLzY=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hctUY-0001x6-Mc; Mon, 17 Jun 2019 15:24:18 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 3E79D440049; Mon, 17 Jun 2019 16:24:18 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Zhu Yingjiang <yingjiang.zhu@linux.intel.com>
In-Reply-To: <20190612172347.22338-16-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190617152418.3E79D440049@finisterre.sirena.org.uk>
Date: Mon, 17 Jun 2019 16:24:18 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: hda: make sure RUN bit
	setting to 0 during clear stream status" to the asoc tree
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

   ASoC: SOF: Intel: hda: make sure RUN bit setting to 0 during clear stream status

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 5b8cc7d17f56257056ed65624dec28dcdf14e87e Mon Sep 17 00:00:00 2001
From: Zhu Yingjiang <yingjiang.zhu@linux.intel.com>
Date: Wed, 12 Jun 2019 12:23:47 -0500
Subject: [PATCH] ASoC: SOF: Intel: hda: make sure RUN bit setting to 0 during
 clear stream status

Before clearing stream statuses, ensure RUN bit update has taken
effect by reading the value back.

Signed-off-by: Zhu Yingjiang <yingjiang.zhu@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-stream.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 13d114993f96..ad8d41f22e92 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -295,7 +295,9 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 	struct hdac_stream *hstream = &stream->hstream;
 	int sd_offset = SOF_STREAM_SD_OFFSET(hstream);
 	int ret, timeout = HDA_DSP_STREAM_RESET_TIMEOUT;
+	u32 dma_start = SOF_HDA_SD_CTL_DMA_START;
 	u32 val, mask;
+	u32 run;
 
 	if (!stream) {
 		dev_err(sdev->dev, "error: no stream available\n");
@@ -316,6 +318,16 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, sd_offset,
 				SOF_HDA_CL_DMA_SD_INT_MASK |
 				SOF_HDA_SD_CTL_DMA_START, 0);
+
+	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_HDA_BAR,
+					    sd_offset, run,
+					    !(run & dma_start),
+					    HDA_DSP_REG_POLL_INTERVAL_US,
+					    HDA_DSP_STREAM_RUN_TIMEOUT);
+
+	if (ret)
+		return ret;
+
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
 				sd_offset + SOF_HDA_ADSP_REG_CL_SD_STS,
 				SOF_HDA_CL_DMA_SD_INT_MASK,
@@ -368,6 +380,16 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, sd_offset,
 				SOF_HDA_CL_DMA_SD_INT_MASK |
 				SOF_HDA_SD_CTL_DMA_START, 0);
+
+	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_HDA_BAR,
+					    sd_offset, run,
+					    !(run & dma_start),
+					    HDA_DSP_REG_POLL_INTERVAL_US,
+					    HDA_DSP_STREAM_RUN_TIMEOUT);
+
+	if (ret)
+		return ret;
+
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
 				sd_offset + SOF_HDA_ADSP_REG_CL_SD_STS,
 				SOF_HDA_CL_DMA_SD_INT_MASK,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
