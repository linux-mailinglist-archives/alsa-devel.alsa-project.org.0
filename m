Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AA5117573
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 20:16:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9165F16B6;
	Mon,  9 Dec 2019 20:15:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9165F16B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575918962;
	bh=uKIIW4YpabTyQTnh8p9BbLSsCU5AJugjSu4XlEAxDaQ=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=sNA1kjFo/RY+qG9zhaR77k2NNcSy4ksHzEinFoFjm30nh9Fy8LcXYw/L+sW3TIdt7
	 OnC1hmL560+H8FX42RbAS0nua38Pe2/eG3AAiBsPdJs0nB3Cj9WMzbwlDhxgqwf4OS
	 IDRnu8AJHKFUfK2KlBeGlpHIaWMV9oWn5/CSJAYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4995BF8036F;
	Mon,  9 Dec 2019 19:59:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5ED26F80340; Mon,  9 Dec 2019 19:59:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 72626F80337
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 19:59:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72626F80337
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E75E313A1;
 Mon,  9 Dec 2019 10:59:33 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6489C3F6CF;
 Mon,  9 Dec 2019 10:59:33 -0800 (PST)
Date: Mon, 09 Dec 2019 18:59:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Eason Yen <eason.yen@mediatek.com>
In-Reply-To: <1573814926-15805-3-git-send-email-eason.yen@mediatek.com>
Message-Id: <applied-1573814926-15805-3-git-send-email-eason.yen@mediatek.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, chipeng.chang@mediatek.com,
 jiaxin.yu@mediatek.com, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, eason.yen@mediatek.com,
 matthias.bgg@gmail.com
Subject: [alsa-devel] Applied "ASoC: mediatek: common: refine hw_params and
	hw_prepare" to the asoc tree
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

   ASoC: mediatek: common: refine hw_params and hw_prepare

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From df799b9502edf84a6f5bf2476917ce1ebdead4a2 Mon Sep 17 00:00:00 2001
From: Eason Yen <eason.yen@mediatek.com>
Date: Fri, 15 Nov 2019 18:48:46 +0800
Subject: [PATCH] ASoC: mediatek: common: refine hw_params and hw_prepare

Refine mtk_afe_fe_hw_params and mtk_afe_fe_prepare by
these helpers.
- mtk_memif_set_enable
- mtk_memif_set_disable
- mtk_memif_set_addr
- mtk_memif_set_channel
- mtk_memif_set_rate
- mtk_memif_set_rate_substream
- mtk_memif_set_format
- mtk_memif_set_pbuf_size

Signed-off-by: Eason Yen <eason.yen@mediatek.com>
Link: https://lore.kernel.org/r/1573814926-15805-3-git-send-email-eason.yen@mediatek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 143 +++++++++++----------
 1 file changed, 77 insertions(+), 66 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index 309dc1ef6841..e761cb66be5d 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -6,11 +6,13 @@
  * Author: Garlic Tseng <garlic.tseng@mediatek.com>
  */
 
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <sound/soc.h>
 #include "mtk-afe-platform-driver.h"
+#include <sound/pcm_params.h>
 #include "mtk-afe-fe-dai.h"
 #include "mtk-base-afe.h"
 
@@ -120,50 +122,64 @@ int mtk_afe_fe_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
-	struct mtk_base_afe_memif *memif = &afe->memif[rtd->cpu_dai->id];
-	int msb_at_bit33 = 0;
-	int ret, fs = 0;
+	int id = rtd->cpu_dai->id;
+	struct mtk_base_afe_memif *memif = &afe->memif[id];
+	int ret;
+	unsigned int channels = params_channels(params);
+	unsigned int rate = params_rate(params);
+	snd_pcm_format_t format = params_format(params);
 
 	ret = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(params));
 	if (ret < 0)
 		return ret;
 
-	msb_at_bit33 = upper_32_bits(substream->runtime->dma_addr) ? 1 : 0;
-	memif->phys_buf_addr = lower_32_bits(substream->runtime->dma_addr);
-	memif->buffer_size = substream->runtime->dma_bytes;
-
-	/* start */
-	mtk_regmap_write(afe->regmap, memif->data->reg_ofs_base,
-			 memif->phys_buf_addr);
-	/* end */
-	mtk_regmap_write(afe->regmap,
-			 memif->data->reg_ofs_base + AFE_BASE_END_OFFSET,
-			 memif->phys_buf_addr + memif->buffer_size - 1);
-
-	/* set MSB to 33-bit */
-	mtk_regmap_update_bits(afe->regmap, memif->data->msb_reg,
-			       1, msb_at_bit33, memif->data->msb_shift);
+	if (afe->request_dram_resource)
+		afe->request_dram_resource(afe->dev);
+
+	dev_dbg(afe->dev, "%s(), %s, ch %d, rate %d, fmt %d, dma_addr %pad, dma_area %p, dma_bytes 0x%zx\n",
+		__func__, memif->data->name,
+		channels, rate, format,
+		&substream->runtime->dma_addr,
+		substream->runtime->dma_area,
+		substream->runtime->dma_bytes);
+
+	memset_io(substream->runtime->dma_area, 0,
+		  substream->runtime->dma_bytes);
+
+	/* set addr */
+	ret = mtk_memif_set_addr(afe, id,
+				 substream->runtime->dma_area,
+				 substream->runtime->dma_addr,
+				 substream->runtime->dma_bytes);
+	if (ret) {
+		dev_err(afe->dev, "%s(), error, id %d, set addr, ret %d\n",
+			__func__, id, ret);
+		return ret;
+	}
 
 	/* set channel */
-	if (memif->data->mono_shift >= 0) {
-		unsigned int mono = (params_channels(params) == 1) ? 1 : 0;
-
-		mtk_regmap_update_bits(afe->regmap, memif->data->mono_reg,
-				       1, mono, memif->data->mono_shift);
+	ret = mtk_memif_set_channel(afe, id, channels);
+	if (ret) {
+		dev_err(afe->dev, "%s(), error, id %d, set channel %d, ret %d\n",
+			__func__, id, channels, ret);
+		return ret;
 	}
 
 	/* set rate */
-	if (memif->data->fs_shift < 0)
-		return 0;
-
-	fs = afe->memif_fs(substream, params_rate(params));
-
-	if (fs < 0)
-		return -EINVAL;
+	ret = mtk_memif_set_rate_substream(substream, id, rate);
+	if (ret) {
+		dev_err(afe->dev, "%s(), error, id %d, set rate %d, ret %d\n",
+			__func__, id, rate, ret);
+		return ret;
+	}
 
-	mtk_regmap_update_bits(afe->regmap, memif->data->fs_reg,
-			       memif->data->fs_maskbit, fs,
-			       memif->data->fs_shift);
+	/* set format */
+	ret = mtk_memif_set_format(afe, id, format);
+	if (ret) {
+		dev_err(afe->dev, "%s(), error, id %d, set format %d, ret %d\n",
+			__func__, id, format, ret);
+		return ret;
+	}
 
 	return 0;
 }
@@ -172,6 +188,11 @@ EXPORT_SYMBOL_GPL(mtk_afe_fe_hw_params);
 int mtk_afe_fe_hw_free(struct snd_pcm_substream *substream,
 		       struct snd_soc_dai *dai)
 {
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+
+	if (afe->release_dram_resource)
+		afe->release_dram_resource(afe->dev);
+
 	return snd_pcm_lib_free_pages(substream);
 }
 EXPORT_SYMBOL_GPL(mtk_afe_fe_hw_free);
@@ -182,20 +203,25 @@ int mtk_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_pcm_runtime * const runtime = substream->runtime;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
-	struct mtk_base_afe_memif *memif = &afe->memif[rtd->cpu_dai->id];
+	int id = rtd->cpu_dai->id;
+	struct mtk_base_afe_memif *memif = &afe->memif[id];
 	struct mtk_base_afe_irq *irqs = &afe->irqs[memif->irq_usage];
 	const struct mtk_base_irq_data *irq_data = irqs->irq_data;
 	unsigned int counter = runtime->period_size;
 	int fs;
+	int ret;
 
 	dev_dbg(afe->dev, "%s %s cmd=%d\n", __func__, memif->data->name, cmd);
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
-		mtk_regmap_update_bits(afe->regmap,
-				       memif->data->enable_reg,
-				       1, 1, memif->data->enable_shift);
+		ret = mtk_memif_set_enable(afe, id);
+		if (ret) {
+			dev_err(afe->dev, "%s(), error, id %d, memif enable, ret %d\n",
+				__func__, id, ret);
+			return ret;
+		}
 
 		/* set irq counter */
 		mtk_regmap_update_bits(afe->regmap, irq_data->irq_cnt_reg,
@@ -219,15 +245,19 @@ int mtk_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 		return 0;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-		mtk_regmap_update_bits(afe->regmap, memif->data->enable_reg,
-				       1, 0, memif->data->enable_shift);
+		ret = mtk_memif_set_disable(afe, id);
+		if (ret) {
+			dev_err(afe->dev, "%s(), error, id %d, memif enable, ret %d\n",
+				__func__, id, ret);
+		}
+
 		/* disable interrupt */
 		mtk_regmap_update_bits(afe->regmap, irq_data->irq_en_reg,
 				       1, 0, irq_data->irq_en_shift);
 		/* and clear pending IRQ */
 		mtk_regmap_write(afe->regmap, irq_data->irq_clr_reg,
 				 1 << irq_data->irq_clr_shift);
-		return 0;
+		return ret;
 	default:
 		return -EINVAL;
 	}
@@ -239,34 +269,15 @@ int mtk_afe_fe_prepare(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd  = substream->private_data;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
-	struct mtk_base_afe_memif *memif = &afe->memif[rtd->cpu_dai->id];
-	int hd_audio = 0;
-	int hd_align = 0;
+	int id = rtd->cpu_dai->id;
+	int pbuf_size;
 
-	/* set hd mode */
-	switch (substream->runtime->format) {
-	case SNDRV_PCM_FORMAT_S16_LE:
-		hd_audio = 0;
-		break;
-	case SNDRV_PCM_FORMAT_S32_LE:
-		hd_audio = 1;
-		hd_align = 1;
-		break;
-	case SNDRV_PCM_FORMAT_S24_LE:
-		hd_audio = 1;
-		break;
-	default:
-		dev_err(afe->dev, "%s() error: unsupported format %d\n",
-			__func__, substream->runtime->format);
-		break;
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (afe->get_memif_pbuf_size) {
+			pbuf_size = afe->get_memif_pbuf_size(substream);
+			mtk_memif_set_pbuf_size(afe, id, pbuf_size);
+		}
 	}
-
-	mtk_regmap_update_bits(afe->regmap, memif->data->hd_reg,
-			       1, hd_audio, memif->data->hd_shift);
-
-	mtk_regmap_update_bits(afe->regmap, memif->data->hd_align_reg,
-			       1, hd_align, memif->data->hd_align_mshift);
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mtk_afe_fe_prepare);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
