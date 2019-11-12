Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B25AF8CB5
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 11:20:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9F151612;
	Tue, 12 Nov 2019 11:19:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9F151612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573554045;
	bh=z9Ml2itQ3uwPLaHr+PgRqFas9voOEbeGx2pyLDAfeX4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KXfuyUTH02qs26TKgZX6xeioRBE+JHPXGGkelmvWB1fNW0fJLUgFTSr3QjYgYtze3
	 AxQDoqgSRE5slxhecqwfyJCLyWCQ9wEQ2yZK0UGcb5+asYGWhAcJQkR6/Ul8dt4XuX
	 KRKt8bg06ZU6Jreu4b974YajjiFZ6YR67rCVBwAk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21760F8065A;
	Tue, 12 Nov 2019 11:14:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04C34F80483; Tue, 12 Nov 2019 05:23:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, MIME_BASE64_TEXT, RDNS_NONE, SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED, 
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by alsa1.perex.cz (Postfix) with ESMTP id 1BACDF80144
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 05:23:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BACDF80144
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="UMWo8YBU"
X-UUID: eff3124017c34b20be9a93d84b63ddec-20191112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=KeYgIF0qD3wD7SXsPBxAtqlNAObnzzAZ55TedhdWfPA=; 
 b=UMWo8YBUVDWlfr16KygzbZh1jRYZ4RmYabOg6LzdLYCUSG61Av18LJav4EtS7gkO/tiYQV6Q1COSDy0WgLl9GpgPbFfObKxq90i3upx7DLfI/kGZHCiv5TP9YPoAs50OcbTnwtaQUziGHPDvzQ5IuIa+8KqrOf6co/TXC0vie00=;
X-UUID: eff3124017c34b20be9a93d84b63ddec-20191112
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by
 mailgw02.mediatek.com (envelope-from <eason.yen@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1798739334; Tue, 12 Nov 2019 12:23:32 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 12 Nov 2019 12:23:23 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 12 Nov 2019 12:23:24 +0800
From: Eason Yen <eason.yen@mediatek.com>
To: <broonie@kernel.org>
Date: Tue, 12 Nov 2019 12:22:18 +0800
Message-ID: <1573532538-30602-2-git-send-email-eason.yen@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1573532538-30602-1-git-send-email-eason.yen@mediatek.com>
References: <1573532538-30602-1-git-send-email-eason.yen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Tue, 12 Nov 2019 11:14:25 +0100
Cc: alsa-devel@alsa-project.org, chipeng.chang@mediatek.com,
 jiaxin.yu@mediatek.com, linux-mediatek@lists.infradead.org,
 eason.yen@mediatek.com, matthias.bgg@gmail.com
Subject: [alsa-devel] [PATCH] ASoC: mediatek: common: refine
	mtk_afe_fe_hw_params
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

1. Add the following function to refine mtk_afe_fe_hw_params
- mtk_memif_set_enable
- mtk_memif_set_disable
- mtk_memif_set_addr
- mtk_memif_set_channel
- mtk_memif_set_rate
- mtk_memif_set_rate_substream
- mtk_memif_set_format
- mtk_memif_set_pbuf_size
2. extend mtk_base_memif_data struct for new platform(mt6779)

Signed-off-by: Eason Yen <eason.yen@mediatek.com>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 371 +++++++++++++++++++++++------
 sound/soc/mediatek/common/mtk-afe-fe-dai.h |  16 ++
 sound/soc/mediatek/common/mtk-base-afe.h   |  32 ++-
 3 files changed, 346 insertions(+), 73 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index 10ea4fd..9afc95f 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -6,19 +6,21 @@
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
 
 #define AFE_BASE_END_OFFSET 8
 
 static int mtk_regmap_update_bits(struct regmap *map, int reg,
-			   unsigned int mask,
-			   unsigned int val, int shift)
+				  unsigned int mask,
+				  unsigned int val, int shift)
 {
 	if (reg < 0 || WARN_ON_ONCE(shift < 0))
 		return 0;
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
+	dev_info(afe->dev, "%s(), %s, ch %d, rate %d, fmt %d, dma_addr %pad, dma_area %p, dma_bytes 0x%zx\n",
+		 __func__, memif->data->name,
+		 channels, rate, format,
+		 &substream->runtime->dma_addr,
+		 substream->runtime->dma_area,
+		 substream->runtime->dma_bytes);
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
@@ -172,6 +188,11 @@ int mtk_afe_fe_hw_params(struct snd_pcm_substream *substream,
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
@@ -182,25 +203,30 @@ int mtk_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
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
-				       irq_data->irq_cnt_maskbit, counter,
-				       irq_data->irq_cnt_shift);
+				       irq_data->irq_cnt_maskbit,
+				       counter, irq_data->irq_cnt_shift);
 
 		/* set irq fs */
 		fs = afe->irq_fs(substream, runtime->rate);
@@ -209,8 +235,8 @@ int mtk_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 			return -EINVAL;
 
 		mtk_regmap_update_bits(afe->regmap, irq_data->irq_fs_reg,
-				       irq_data->irq_fs_maskbit, fs,
-				       irq_data->irq_fs_shift);
+				       irq_data->irq_fs_maskbit,
+				       fs, irq_data->irq_fs_shift);
 
 		/* enable interrupt */
 		mtk_regmap_update_bits(afe->regmap, irq_data->irq_en_reg,
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
@@ -361,6 +372,222 @@ int mtk_afe_dai_resume(struct snd_soc_dai *dai)
 }
 EXPORT_SYMBOL_GPL(mtk_afe_dai_resume);
 
+int mtk_memif_set_enable(struct mtk_base_afe *afe, int id)
+{
+	struct mtk_base_afe_memif *memif = &afe->memif[id];
+
+	if (memif->data->enable_shift < 0) {
+		dev_warn(afe->dev, "%s(), error, id %d, enable_shift < 0\n",
+			 __func__, id);
+		return 0;
+	}
+	return mtk_regmap_update_bits(afe->regmap, memif->data->enable_reg,
+				      1, 1, memif->data->enable_shift);
+}
+EXPORT_SYMBOL_GPL(mtk_memif_set_enable);
+
+int mtk_memif_set_disable(struct mtk_base_afe *afe, int id)
+{
+	struct mtk_base_afe_memif *memif = &afe->memif[id];
+
+	if (memif->data->enable_shift < 0) {
+		dev_warn(afe->dev, "%s(), error, id %d, enable_shift < 0\n",
+			 __func__, id);
+		return 0;
+	}
+	return mtk_regmap_update_bits(afe->regmap, memif->data->enable_reg,
+				      1, 0, memif->data->enable_shift);
+}
+EXPORT_SYMBOL_GPL(mtk_memif_set_disable);
+
+int mtk_memif_set_addr(struct mtk_base_afe *afe, int id,
+		       unsigned char *dma_area,
+		       dma_addr_t dma_addr,
+		       size_t dma_bytes)
+{
+	struct mtk_base_afe_memif *memif = &afe->memif[id];
+	int msb_at_bit33 = upper_32_bits(dma_addr) ? 1 : 0;
+	unsigned int phys_buf_addr = lower_32_bits(dma_addr);
+	unsigned int phys_buf_addr_upper_32 = upper_32_bits(dma_addr);
+
+	memif->dma_area = dma_area;
+	memif->dma_addr = dma_addr;
+	memif->dma_bytes = dma_bytes;
+
+	/* start */
+	mtk_regmap_write(afe->regmap, memif->data->reg_ofs_base,
+			 phys_buf_addr);
+	/* end */
+	if (memif->data->reg_ofs_end)
+		mtk_regmap_write(afe->regmap,
+				 memif->data->reg_ofs_end,
+				 phys_buf_addr + dma_bytes - 1);
+	else
+		mtk_regmap_write(afe->regmap,
+				 memif->data->reg_ofs_base +
+				 AFE_BASE_END_OFFSET,
+				 phys_buf_addr + dma_bytes - 1);
+
+	/* set start, end, upper 32 bits */
+	if (memif->data->reg_ofs_base_msb) {
+		mtk_regmap_write(afe->regmap, memif->data->reg_ofs_base_msb,
+				 phys_buf_addr_upper_32);
+		mtk_regmap_write(afe->regmap,
+				 memif->data->reg_ofs_end_msb,
+				 phys_buf_addr_upper_32);
+	}
+
+	/* set MSB to 33-bit */
+	if (memif->data->msb_reg >= 0)
+		mtk_regmap_update_bits(afe->regmap, memif->data->msb_reg,
+				       1, msb_at_bit33, memif->data->msb_shift);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mtk_memif_set_addr);
+
+int mtk_memif_set_channel(struct mtk_base_afe *afe,
+			  int id, unsigned int channel)
+{
+	struct mtk_base_afe_memif *memif = &afe->memif[id];
+	unsigned int mono;
+
+	if (memif->data->mono_shift < 0)
+		return 0;
+
+	if (memif->data->quad_ch_mask) {
+		unsigned int quad_ch = (channel == 4) ? 1 : 0;
+
+		mtk_regmap_update_bits(afe->regmap, memif->data->quad_ch_reg,
+				       memif->data->quad_ch_mask,
+				       quad_ch, memif->data->quad_ch_shift);
+	}
+
+	if (memif->data->mono_invert)
+		mono = (channel == 1) ? 0 : 1;
+	else
+		mono = (channel == 1) ? 1 : 0;
+
+	return mtk_regmap_update_bits(afe->regmap, memif->data->mono_reg,
+				      1, mono, memif->data->mono_shift);
+}
+EXPORT_SYMBOL_GPL(mtk_memif_set_channel);
+
+static int mtk_memif_set_rate_fs(struct mtk_base_afe *afe,
+				 int id, int fs)
+{
+	struct mtk_base_afe_memif *memif = &afe->memif[id];
+
+	if (memif->data->fs_shift >= 0)
+		mtk_regmap_update_bits(afe->regmap, memif->data->fs_reg,
+				       memif->data->fs_maskbit,
+				       fs, memif->data->fs_shift);
+
+	return 0;
+}
+
+int mtk_memif_set_rate(struct mtk_base_afe *afe,
+		       int id, unsigned int rate)
+{
+	int fs = 0;
+
+	if (!afe->get_dai_fs) {
+		dev_err(afe->dev, "%s(), error, afe->get_dai_fs == NULL\n",
+			__func__);
+		return -EINVAL;
+	}
+
+	fs = afe->get_dai_fs(afe, id, rate);
+
+	if (fs < 0)
+		return -EINVAL;
+
+	return mtk_memif_set_rate_fs(afe, id, fs);
+}
+EXPORT_SYMBOL_GPL(mtk_memif_set_rate);
+
+int mtk_memif_set_rate_substream(struct snd_pcm_substream *substream,
+				 int id, unsigned int rate)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_component *component =
+		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
+
+	int fs = 0;
+
+	if (!afe->memif_fs) {
+		dev_err(afe->dev, "%s(), error, afe->memif_fs == NULL\n",
+			__func__);
+		return -EINVAL;
+	}
+
+	fs = afe->memif_fs(substream, rate);
+
+	if (fs < 0)
+		return -EINVAL;
+
+	return mtk_memif_set_rate_fs(afe, id, fs);
+}
+EXPORT_SYMBOL_GPL(mtk_memif_set_rate_substream);
+
+int mtk_memif_set_format(struct mtk_base_afe *afe,
+			 int id, snd_pcm_format_t format)
+{
+	struct mtk_base_afe_memif *memif = &afe->memif[id];
+	int hd_audio = 0;
+	int hd_align = 0;
+
+	/* set hd mode */
+	switch (format) {
+	case SNDRV_PCM_FORMAT_S16_LE:
+	case SNDRV_PCM_FORMAT_U16_LE:
+		hd_audio = 0;
+		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+	case SNDRV_PCM_FORMAT_U32_LE:
+		hd_audio = 1;
+		hd_align = 1;
+		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
+	case SNDRV_PCM_FORMAT_U24_LE:
+		hd_audio = 1;
+		break;
+	default:
+		dev_err(afe->dev, "%s() error: unsupported format %d\n",
+			__func__, format);
+		break;
+	}
+
+	mtk_regmap_update_bits(afe->regmap, memif->data->hd_reg,
+			       1, hd_audio, memif->data->hd_shift);
+
+	mtk_regmap_update_bits(afe->regmap, memif->data->hd_align_reg,
+			       1, hd_align, memif->data->hd_align_mshift);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mtk_memif_set_format);
+
+int mtk_memif_set_pbuf_size(struct mtk_base_afe *afe,
+			    int id, int pbuf_size)
+{
+	const struct mtk_base_memif_data *memif_data = afe->memif[id].data;
+
+	if (memif_data->pbuf_mask == 0 || memif_data->minlen_mask == 0)
+		return 0;
+
+	mtk_regmap_update_bits(afe->regmap, memif_data->pbuf_reg,
+			       memif_data->pbuf_mask,
+			       pbuf_size, memif_data->pbuf_shift);
+
+	mtk_regmap_update_bits(afe->regmap, memif_data->minlen_reg,
+			       memif_data->minlen_mask,
+			       pbuf_size, memif_data->minlen_shift);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mtk_memif_set_pbuf_size);
+
 MODULE_DESCRIPTION("Mediatek simple fe dai operator");
 MODULE_AUTHOR("Garlic Tseng <garlic.tseng@mediatek.com>");
 MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.h b/sound/soc/mediatek/common/mtk-afe-fe-dai.h
index 55074fb..507e3e7 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.h
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.h
@@ -34,4 +34,20 @@ int mtk_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 int mtk_afe_dai_suspend(struct snd_soc_dai *dai);
 int mtk_afe_dai_resume(struct snd_soc_dai *dai);
 
+int mtk_memif_set_enable(struct mtk_base_afe *afe, int id);
+int mtk_memif_set_disable(struct mtk_base_afe *afe, int id);
+int mtk_memif_set_addr(struct mtk_base_afe *afe, int id,
+		       unsigned char *dma_area,
+		       dma_addr_t dma_addr,
+		       size_t dma_bytes);
+int mtk_memif_set_channel(struct mtk_base_afe *afe,
+			  int id, unsigned int channel);
+int mtk_memif_set_rate(struct mtk_base_afe *afe,
+		       int id, unsigned int rate);
+int mtk_memif_set_rate_substream(struct snd_pcm_substream *substream,
+				 int id, unsigned int rate);
+int mtk_memif_set_format(struct mtk_base_afe *afe,
+			 int id, snd_pcm_format_t format);
+int mtk_memif_set_pbuf_size(struct mtk_base_afe *afe,
+			    int id, int pbuf_size);
 #endif
diff --git a/sound/soc/mediatek/common/mtk-base-afe.h b/sound/soc/mediatek/common/mtk-base-afe.h
index 60cb609..ff20dc7 100644
--- a/sound/soc/mediatek/common/mtk-base-afe.h
+++ b/sound/soc/mediatek/common/mtk-base-afe.h
@@ -16,21 +16,38 @@ struct mtk_base_memif_data {
 	const char *name;
 	int reg_ofs_base;
 	int reg_ofs_cur;
+	int reg_ofs_end;
+	int reg_ofs_base_msb;
+	int reg_ofs_cur_msb;
+	int reg_ofs_end_msb;
 	int fs_reg;
 	int fs_shift;
 	int fs_maskbit;
 	int mono_reg;
 	int mono_shift;
+	int mono_invert;
+	int quad_ch_reg;
+	int quad_ch_mask;
+	int quad_ch_shift;
 	int enable_reg;
 	int enable_shift;
 	int hd_reg;
-	int hd_align_reg;
 	int hd_shift;
+	int hd_align_reg;
 	int hd_align_mshift;
 	int msb_reg;
 	int msb_shift;
+	int msb2_reg;
+	int msb2_shift;
 	int agent_disable_reg;
 	int agent_disable_shift;
+	/* playback memif only */
+	int pbuf_reg;
+	int pbuf_mask;
+	int pbuf_shift;
+	int minlen_reg;
+	int minlen_mask;
+	int minlen_shift;
 };
 
 struct mtk_base_irq_data {
@@ -45,6 +62,10 @@ struct mtk_base_irq_data {
 	int irq_en_shift;
 	int irq_clr_reg;
 	int irq_clr_shift;
+	int irq_ap_en_reg;
+	int irq_ap_en_shift;
+	int irq_scp_en_reg;
+	int irq_scp_en_shift;
 };
 
 struct device;
@@ -84,6 +105,12 @@ struct mtk_base_afe {
 			unsigned int rate);
 	int (*irq_fs)(struct snd_pcm_substream *substream,
 		      unsigned int rate);
+	int (*get_dai_fs)(struct mtk_base_afe *afe,
+			  int dai_id, unsigned int rate);
+	int (*get_memif_pbuf_size)(struct snd_pcm_substream *substream);
+
+	int (*request_dram_resource)(struct device *dev);
+	int (*release_dram_resource)(struct device *dev);
 
 	void *platform_priv;
 };
@@ -95,6 +122,9 @@ struct mtk_base_afe_memif {
 	const struct mtk_base_memif_data *data;
 	int irq_usage;
 	int const_irq;
+	unsigned char *dma_area;
+	dma_addr_t dma_addr;
+	size_t dma_bytes;
 };
 
 struct mtk_base_afe_irq {
-- 
1.9.1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
