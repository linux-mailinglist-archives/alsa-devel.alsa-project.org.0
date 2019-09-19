Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E35EEB791B
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2019 14:16:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C3B21675;
	Thu, 19 Sep 2019 14:15:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C3B21675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568895365;
	bh=DnJzeJI+k5imRfcD+uVN92mOMM90Ui64wsMkVSpPh6s=;
	h=From:To:Date:In-Reply-To:References:In-Reply-To:References:
	 Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From;
	b=aj/ikSCqU1VB/3mvTtJtan1K3+Y4pgj/urTaTuxkiS3DLJS/nV3yt6td/9/9cdiTv
	 hQxci2bovGhmEq0wpAbwTbI/xTqyT6T/JfUtCKH9dtS0C/OFQ5cMTdFTTPEkSDnhyL
	 vE373ZOmkQQeFd3uDGVSoCUGvDrGF+3vM8amjCuI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A02DDF805F9;
	Thu, 19 Sep 2019 14:13:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 261A9F80090; Thu, 19 Sep 2019 14:13:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60A8DF80090
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 14:13:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60A8DF80090
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D17D2200029;
 Thu, 19 Sep 2019 14:13:18 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A16AC2003D9;
 Thu, 19 Sep 2019 14:13:11 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id F3C3640307;
 Thu, 19 Sep 2019 20:13:02 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org,
 lars@metafoo.de
Date: Thu, 19 Sep 2019 20:11:41 +0800
Message-Id: <57e3bda7b94fecf94d17f2eacf1c6beebcac74ff.1568861098.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1568861098.git.shengjiu.wang@nxp.com>
References: <cover.1568861098.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1568861098.git.shengjiu.wang@nxp.com>
References: <cover.1568861098.git.shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [alsa-devel] [PATCH V3 3/4] ASoC: pcm_dmaengine: Extract
	snd_dmaengine_pcm_refine_runtime_hwparams
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

When set the runtime hardware parameters, we may need to query
the capability of DMA to complete the parameters.

This patch is to Extract this operation from
dmaengine_pcm_set_runtime_hwparams function to a separate function
snd_dmaengine_pcm_refine_runtime_hwparams, that other components
which need this feature can call this function.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 include/sound/dmaengine_pcm.h         |  5 ++
 sound/core/pcm_dmaengine.c            | 83 +++++++++++++++++++++++++++
 sound/soc/soc-generic-dmaengine-pcm.c | 62 +++-----------------
 3 files changed, 95 insertions(+), 55 deletions(-)

diff --git a/include/sound/dmaengine_pcm.h b/include/sound/dmaengine_pcm.h
index c679f6116580..b65220685920 100644
--- a/include/sound/dmaengine_pcm.h
+++ b/include/sound/dmaengine_pcm.h
@@ -83,6 +83,11 @@ void snd_dmaengine_pcm_set_config_from_dai_data(
 	const struct snd_dmaengine_dai_dma_data *dma_data,
 	struct dma_slave_config *config);
 
+int snd_dmaengine_pcm_refine_runtime_hwparams(
+	struct snd_pcm_substream *substream,
+	struct snd_dmaengine_dai_dma_data *dma_data,
+	struct snd_pcm_hardware *hw,
+	struct dma_chan *chan);
 
 /*
  * Try to request the DMA channel using compat_request_channel or
diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
index 89a05926ac73..5749a8a49784 100644
--- a/sound/core/pcm_dmaengine.c
+++ b/sound/core/pcm_dmaengine.c
@@ -369,4 +369,87 @@ int snd_dmaengine_pcm_close_release_chan(struct snd_pcm_substream *substream)
 }
 EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_close_release_chan);
 
+/**
+ * snd_dmaengine_pcm_refine_runtime_hwparams - Refine runtime hw params
+ * @substream: PCM substream
+ * @dma_data: DAI DMA data
+ * @hw: PCM hw params
+ * @chan: DMA channel to use for data transfers
+ *
+ * Returns 0 on success, a negative error code otherwise.
+ *
+ * This function will query DMA capability, then refine the pcm hardware
+ * parameters.
+ */
+int snd_dmaengine_pcm_refine_runtime_hwparams(
+	struct snd_pcm_substream *substream,
+	struct snd_dmaengine_dai_dma_data *dma_data,
+	struct snd_pcm_hardware *hw,
+	struct dma_chan *chan)
+{
+	struct dma_slave_caps dma_caps;
+	u32 addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
+			  BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
+			  BIT(DMA_SLAVE_BUSWIDTH_4_BYTES);
+	snd_pcm_format_t i;
+	int ret = 0;
+
+	if (!hw || !chan || !dma_data)
+		return -EINVAL;
+
+	ret = dma_get_slave_caps(chan, &dma_caps);
+	if (ret == 0) {
+		if (dma_caps.cmd_pause && dma_caps.cmd_resume)
+			hw->info |= SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME;
+		if (dma_caps.residue_granularity <= DMA_RESIDUE_GRANULARITY_SEGMENT)
+			hw->info |= SNDRV_PCM_INFO_BATCH;
+
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			addr_widths = dma_caps.dst_addr_widths;
+		else
+			addr_widths = dma_caps.src_addr_widths;
+	}
+
+	/*
+	 * If SND_DMAENGINE_PCM_DAI_FLAG_PACK is set keep
+	 * hw.formats set to 0, meaning no restrictions are in place.
+	 * In this case it's the responsibility of the DAI driver to
+	 * provide the supported format information.
+	 */
+	if (!(dma_data->flags & SND_DMAENGINE_PCM_DAI_FLAG_PACK))
+		/*
+		 * Prepare formats mask for valid/allowed sample types. If the
+		 * dma does not have support for the given physical word size,
+		 * it needs to be masked out so user space can not use the
+		 * format which produces corrupted audio.
+		 * In case the dma driver does not implement the slave_caps the
+		 * default assumption is that it supports 1, 2 and 4 bytes
+		 * widths.
+		 */
+		for (i = SNDRV_PCM_FORMAT_FIRST; i <= SNDRV_PCM_FORMAT_LAST; i++) {
+			int bits = snd_pcm_format_physical_width(i);
+
+			/*
+			 * Enable only samples with DMA supported physical
+			 * widths
+			 */
+			switch (bits) {
+			case 8:
+			case 16:
+			case 24:
+			case 32:
+			case 64:
+				if (addr_widths & (1 << (bits / 8)))
+					hw->formats |= pcm_format_to_bits(i);
+				break;
+			default:
+				/* Unsupported types */
+				break;
+			}
+		}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_refine_runtime_hwparams);
+
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index 748f5f641002..d850befe885b 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -118,12 +118,7 @@ static int dmaengine_pcm_set_runtime_hwparams(struct snd_pcm_substream *substrea
 	struct device *dma_dev = dmaengine_dma_dev(pcm, substream);
 	struct dma_chan *chan = pcm->chan[substream->stream];
 	struct snd_dmaengine_dai_dma_data *dma_data;
-	struct dma_slave_caps dma_caps;
 	struct snd_pcm_hardware hw;
-	u32 addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
-			  BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
-			  BIT(DMA_SLAVE_BUSWIDTH_4_BYTES);
-	snd_pcm_format_t i;
 	int ret;
 
 	if (pcm->config && pcm->config->pcm_hardware)
@@ -145,58 +140,15 @@ static int dmaengine_pcm_set_runtime_hwparams(struct snd_pcm_substream *substrea
 	if (pcm->flags & SND_DMAENGINE_PCM_FLAG_NO_RESIDUE)
 		hw.info |= SNDRV_PCM_INFO_BATCH;
 
-	ret = dma_get_slave_caps(chan, &dma_caps);
-	if (ret == 0) {
-		if (dma_caps.cmd_pause && dma_caps.cmd_resume)
-			hw.info |= SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME;
-		if (dma_caps.residue_granularity <= DMA_RESIDUE_GRANULARITY_SEGMENT)
-			hw.info |= SNDRV_PCM_INFO_BATCH;
-
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-			addr_widths = dma_caps.dst_addr_widths;
-		else
-			addr_widths = dma_caps.src_addr_widths;
-	}
-
-	/*
-	 * If SND_DMAENGINE_PCM_DAI_FLAG_PACK is set keep
-	 * hw.formats set to 0, meaning no restrictions are in place.
-	 * In this case it's the responsibility of the DAI driver to
-	 * provide the supported format information.
-	 */
-	if (!(dma_data->flags & SND_DMAENGINE_PCM_DAI_FLAG_PACK))
-		/*
-		 * Prepare formats mask for valid/allowed sample types. If the
-		 * dma does not have support for the given physical word size,
-		 * it needs to be masked out so user space can not use the
-		 * format which produces corrupted audio.
-		 * In case the dma driver does not implement the slave_caps the
-		 * default assumption is that it supports 1, 2 and 4 bytes
-		 * widths.
-		 */
-		for (i = SNDRV_PCM_FORMAT_FIRST; i <= SNDRV_PCM_FORMAT_LAST; i++) {
-			int bits = snd_pcm_format_physical_width(i);
-
-			/*
-			 * Enable only samples with DMA supported physical
-			 * widths
-			 */
-			switch (bits) {
-			case 8:
-			case 16:
-			case 24:
-			case 32:
-			case 64:
-				if (addr_widths & (1 << (bits / 8)))
-					hw.formats |= pcm_format_to_bits(i);
-				break;
-			default:
-				/* Unsupported types */
-				break;
-			}
-		}
+	ret = snd_dmaengine_pcm_refine_runtime_hwparams(substream,
+							dma_data,
+							&hw,
+							chan);
+	if (ret)
+		return ret;
 
 	return snd_soc_set_runtime_hwparams(substream, &hw);
+
 }
 
 static int dmaengine_pcm_open(struct snd_pcm_substream *substream)
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
