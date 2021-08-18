Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E41CF3F01C3
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Aug 2021 12:34:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE1A54E;
	Wed, 18 Aug 2021 12:33:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE1A54E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629282856;
	bh=hnTi7qhS57uBrMK/moyB44/v/nBepvUWKt3Yc00n6tc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EBoD9ykx+TIZwgv+kH4uXMqedXUyEzV/qhnc2+3r33c48x85ZBPcHev8KdFY65FiO
	 Gmu+gXpfGa3FoAui/T6j0Wgd7NpkNub/tJztMoFAEKyjejExn0g+G334l6oJVz8mz+
	 BFcrxCrDwkOcyjpXPjE3GHICDRQVfz7hCLowpEo0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5163F804E7;
	Wed, 18 Aug 2021 12:32:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01731F804DA; Wed, 18 Aug 2021 12:32:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5941EF800EC
 for <alsa-devel@alsa-project.org>; Wed, 18 Aug 2021 12:32:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5941EF800EC
X-UUID: 90922621e78f4df8af769bbf6717e67b-20210818
X-UUID: 90922621e78f4df8af769bbf6717e67b-20210818
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 622429973; Wed, 18 Aug 2021 18:32:21 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Aug 2021 18:32:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 18 Aug 2021 18:32:21 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
 <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [PATCH v4 01/11] ASoC: mediatek: mt8195: update mediatek common driver
Date: Wed, 18 Aug 2021 18:32:05 +0800
Message-ID: <20210818103215.9186-2-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210818103215.9186-1-trevor.wu@mediatek.com>
References: <20210818103215.9186-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, bicycle.tsai@mediatek.com, linux-kernel@vger.kernel.org,
 jiaxin.yu@mediatek.com, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, wenst@chromium.org, aaronyu@google.com,
 linux-arm-kernel@lists.infradead.org
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

Update mediatek common driver to support MT8195

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 22 +++++++++++++++++++---
 sound/soc/mediatek/common/mtk-base-afe.h   | 10 ++++++++--
 2 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index 3cb2adf420bb..baaa5881b1d4 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -139,7 +139,7 @@ int mtk_afe_fe_hw_params(struct snd_pcm_substream *substream,
 		substream->runtime->dma_area,
 		substream->runtime->dma_bytes);
 
-	memset_io(substream->runtime->dma_area, 0,
+	memset_io((void __force __iomem *)substream->runtime->dma_area, 0,
 		  substream->runtime->dma_bytes);
 
 	/* set addr */
@@ -433,11 +433,20 @@ int mtk_memif_set_addr(struct mtk_base_afe *afe, int id,
 				 phys_buf_addr_upper_32);
 	}
 
-	/* set MSB to 33-bit */
-	if (memif->data->msb_reg >= 0)
+	/*
+	 * set MSB to 33-bit, for memif address
+	 * only for memif base address, if msb_end_reg exists
+	 */
+	if (memif->data->msb_reg)
 		mtk_regmap_update_bits(afe->regmap, memif->data->msb_reg,
 				       1, msb_at_bit33, memif->data->msb_shift);
 
+	/* set MSB to 33-bit, for memif end address */
+	if (memif->data->msb_end_reg)
+		mtk_regmap_update_bits(afe->regmap, memif->data->msb_end_reg,
+				       1, msb_at_bit33,
+				       memif->data->msb_end_shift);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mtk_memif_set_addr);
@@ -464,6 +473,13 @@ int mtk_memif_set_channel(struct mtk_base_afe *afe,
 	else
 		mono = (channel == 1) ? 1 : 0;
 
+	/* for specific configuration of memif mono mode */
+	if (memif->data->int_odd_flag_reg)
+		mtk_regmap_update_bits(afe->regmap,
+				       memif->data->int_odd_flag_reg,
+				       1, mono,
+				       memif->data->int_odd_flag_shift);
+
 	return mtk_regmap_update_bits(afe->regmap, memif->data->mono_reg,
 				      1, mono, memif->data->mono_shift);
 }
diff --git a/sound/soc/mediatek/common/mtk-base-afe.h b/sound/soc/mediatek/common/mtk-base-afe.h
index a6f68c68581c..ef83e78c22a8 100644
--- a/sound/soc/mediatek/common/mtk-base-afe.h
+++ b/sound/soc/mediatek/common/mtk-base-afe.h
@@ -29,6 +29,8 @@ struct mtk_base_memif_data {
 	int quad_ch_reg;
 	int quad_ch_mask;
 	int quad_ch_shift;
+	int int_odd_flag_reg;
+	int int_odd_flag_shift;
 	int enable_reg;
 	int enable_shift;
 	int hd_reg;
@@ -37,10 +39,13 @@ struct mtk_base_memif_data {
 	int hd_align_mshift;
 	int msb_reg;
 	int msb_shift;
-	int msb2_reg;
-	int msb2_shift;
+	int msb_end_reg;
+	int msb_end_shift;
 	int agent_disable_reg;
 	int agent_disable_shift;
+	int ch_num_reg;
+	int ch_num_shift;
+	int ch_num_maskbit;
 	/* playback memif only */
 	int pbuf_reg;
 	int pbuf_mask;
@@ -62,6 +67,7 @@ struct mtk_base_irq_data {
 	int irq_en_shift;
 	int irq_clr_reg;
 	int irq_clr_shift;
+	int irq_status_shift;
 };
 
 struct device;
-- 
2.18.0

