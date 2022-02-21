Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FE64BD5A7
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Feb 2022 06:58:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DE831674;
	Mon, 21 Feb 2022 06:57:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DE831674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645423126;
	bh=dowOYlnJLhTc8t3x7ITeC0TIQo9mC6M0czdXpeErFRk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aQdjGIAAGuZW2AJ53cDqJqKJ/0/bVBcuFrUFVLrhyAFd+crOqz4MLgR4j4VB90Qbq
	 eBi3eKCFMHuWTxx2PK9yhE1PSgUVJ2pqM4TuGogbVuHnRwfRKKIgXalyFxS5BhZ4b3
	 VSP2UoWMY3mU8a4AFzf6PZ0Zh2+U4psf/7DYcM4k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01288F80149;
	Mon, 21 Feb 2022 06:57:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0CA7F8013D; Mon, 21 Feb 2022 06:57:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A61EF80118
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 06:57:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A61EF80118
X-UUID: 8490de897e484d41a53be731ec7513ea-20220221
X-UUID: 8490de897e484d41a53be731ec7513ea-20220221
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 711862382; Mon, 21 Feb 2022 13:57:20 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Feb 2022 13:57:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 21 Feb 2022 13:57:19 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>
Subject: [PATCH] ASoC: mediatek: mt8195: enable apll tuner
Date: Mon, 21 Feb 2022 13:57:16 +0800
Message-ID: <20220221055716.18580-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: alsa-devel@alsa-project.org, bicycle.tsai@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, yc.hung@mediatek.com,
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

Normally, the clock source of audio module is either 26M or APLL1/APLL2,
but APLL1/APLL2 are not the multiple of 26M.

In the patch, APLL1 and APLL2 tuners are enabled to handle sample rate
mismatch when the data path crosses two different clock domains.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 282 ++++++++++++++++++++-
 sound/soc/mediatek/mt8195/mt8195-afe-clk.h |  11 +
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c |   3 -
 3 files changed, 292 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index c2543f4cffb7..efd5cc364a35 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -40,6 +40,8 @@ static const char *aud_clks[MT8195_CLK_NUM] = {
 	[MT8195_CLK_SCP_ADSP_AUDIODSP] = "scp_adsp_audiodsp",
 	/* afe clock gate */
 	[MT8195_CLK_AUD_AFE] = "aud_afe",
+	[MT8195_CLK_AUD_APLL1_TUNER] = "aud_apll1_tuner",
+	[MT8195_CLK_AUD_APLL2_TUNER] = "aud_apll2_tuner",
 	[MT8195_CLK_AUD_APLL] = "aud_apll",
 	[MT8195_CLK_AUD_APLL2] = "aud_apll2",
 	[MT8195_CLK_AUD_DAC] = "aud_dac",
@@ -77,6 +79,268 @@ static const char *aud_clks[MT8195_CLK_NUM] = {
 	[MT8195_CLK_AUD_MEMIF_DL11] = "aud_memif_dl11",
 };
 
+struct mt8195_afe_tuner_cfg {
+	unsigned int id;
+	int apll_div_reg;
+	unsigned int apll_div_shift;
+	unsigned int apll_div_maskbit;
+	unsigned int apll_div_default;
+	int ref_ck_sel_reg;
+	unsigned int ref_ck_sel_shift;
+	unsigned int ref_ck_sel_maskbit;
+	unsigned int ref_ck_sel_default;
+	int tuner_en_reg;
+	unsigned int tuner_en_shift;
+	unsigned int tuner_en_maskbit;
+	int upper_bound_reg;
+	unsigned int upper_bound_shift;
+	unsigned int upper_bound_maskbit;
+	unsigned int upper_bound_default;
+	spinlock_t ctrl_lock; /* lock for apll tuner ctrl*/
+	int ref_cnt;
+};
+
+static struct mt8195_afe_tuner_cfg mt8195_afe_tuner_cfgs[MT8195_AUD_PLL_NUM] = {
+	[MT8195_AUD_PLL1] = {
+		.id = MT8195_AUD_PLL1,
+		.apll_div_reg = AFE_APLL_TUNER_CFG,
+		.apll_div_shift = 4,
+		.apll_div_maskbit = 0xf,
+		.apll_div_default = 0x7,
+		.ref_ck_sel_reg = AFE_APLL_TUNER_CFG,
+		.ref_ck_sel_shift = 1,
+		.ref_ck_sel_maskbit = 0x3,
+		.ref_ck_sel_default = 0x2,
+		.tuner_en_reg = AFE_APLL_TUNER_CFG,
+		.tuner_en_shift = 0,
+		.tuner_en_maskbit = 0x1,
+		.upper_bound_reg = AFE_APLL_TUNER_CFG,
+		.upper_bound_shift = 8,
+		.upper_bound_maskbit = 0xff,
+		.upper_bound_default = 0x2,
+	},
+	[MT8195_AUD_PLL2] = {
+		.id = MT8195_AUD_PLL2,
+		.apll_div_reg = AFE_APLL_TUNER_CFG1,
+		.apll_div_shift = 4,
+		.apll_div_maskbit = 0xf,
+		.apll_div_default = 0x7,
+		.ref_ck_sel_reg = AFE_APLL_TUNER_CFG1,
+		.ref_ck_sel_shift = 1,
+		.ref_ck_sel_maskbit = 0x3,
+		.ref_ck_sel_default = 0x1,
+		.tuner_en_reg = AFE_APLL_TUNER_CFG1,
+		.tuner_en_shift = 0,
+		.tuner_en_maskbit = 0x1,
+		.upper_bound_reg = AFE_APLL_TUNER_CFG1,
+		.upper_bound_shift = 8,
+		.upper_bound_maskbit = 0xff,
+		.upper_bound_default = 0x2,
+	},
+	[MT8195_AUD_PLL3] = {
+		.id = MT8195_AUD_PLL3,
+		.apll_div_reg = AFE_EARC_APLL_TUNER_CFG,
+		.apll_div_shift = 4,
+		.apll_div_maskbit = 0x3f,
+		.apll_div_default = 0x3,
+		.ref_ck_sel_reg = AFE_EARC_APLL_TUNER_CFG,
+		.ref_ck_sel_shift = 24,
+		.ref_ck_sel_maskbit = 0x3,
+		.ref_ck_sel_default = 0x0,
+		.tuner_en_reg = AFE_EARC_APLL_TUNER_CFG,
+		.tuner_en_shift = 0,
+		.tuner_en_maskbit = 0x1,
+		.upper_bound_reg = AFE_EARC_APLL_TUNER_CFG,
+		.upper_bound_shift = 12,
+		.upper_bound_maskbit = 0xff,
+		.upper_bound_default = 0x4,
+	},
+	[MT8195_AUD_PLL4] = {
+		.id = MT8195_AUD_PLL4,
+		.apll_div_reg = AFE_SPDIFIN_APLL_TUNER_CFG,
+		.apll_div_shift = 4,
+		.apll_div_maskbit = 0x3f,
+		.apll_div_default = 0x7,
+		.ref_ck_sel_reg = AFE_SPDIFIN_APLL_TUNER_CFG1,
+		.ref_ck_sel_shift = 8,
+		.ref_ck_sel_maskbit = 0x1,
+		.ref_ck_sel_default = 0,
+		.tuner_en_reg = AFE_SPDIFIN_APLL_TUNER_CFG,
+		.tuner_en_shift = 0,
+		.tuner_en_maskbit = 0x1,
+		.upper_bound_reg = AFE_SPDIFIN_APLL_TUNER_CFG,
+		.upper_bound_shift = 12,
+		.upper_bound_maskbit = 0xff,
+		.upper_bound_default = 0x4,
+	},
+	[MT8195_AUD_PLL5] = {
+		.id = MT8195_AUD_PLL5,
+		.apll_div_reg = AFE_LINEIN_APLL_TUNER_CFG,
+		.apll_div_shift = 4,
+		.apll_div_maskbit = 0x3f,
+		.apll_div_default = 0x3,
+		.ref_ck_sel_reg = AFE_LINEIN_APLL_TUNER_CFG,
+		.ref_ck_sel_shift = 24,
+		.ref_ck_sel_maskbit = 0x1,
+		.ref_ck_sel_default = 0,
+		.tuner_en_reg = AFE_LINEIN_APLL_TUNER_CFG,
+		.tuner_en_shift = 0,
+		.tuner_en_maskbit = 0x1,
+		.upper_bound_reg = AFE_LINEIN_APLL_TUNER_CFG,
+		.upper_bound_shift = 12,
+		.upper_bound_maskbit = 0xff,
+		.upper_bound_default = 0x4,
+	},
+};
+
+static struct mt8195_afe_tuner_cfg *mt8195_afe_found_apll_tuner(unsigned int id)
+{
+	if (id >= MT8195_AUD_PLL_NUM)
+		return NULL;
+
+	return &mt8195_afe_tuner_cfgs[id];
+}
+
+static int mt8195_afe_init_apll_tuner(unsigned int id)
+{
+	struct mt8195_afe_tuner_cfg *cfg = mt8195_afe_found_apll_tuner(id);
+
+	if (!cfg)
+		return -EINVAL;
+
+	cfg->ref_cnt = 0;
+	spin_lock_init(&cfg->ctrl_lock);
+
+	return 0;
+}
+
+static int mt8195_afe_setup_apll_tuner(struct mtk_base_afe *afe,
+				       unsigned int id)
+{
+	const struct mt8195_afe_tuner_cfg *cfg = mt8195_afe_found_apll_tuner(id);
+
+	if (!cfg)
+		return -EINVAL;
+
+	regmap_update_bits(afe->regmap, cfg->apll_div_reg,
+			   cfg->apll_div_maskbit << cfg->apll_div_shift,
+			   cfg->apll_div_default << cfg->apll_div_shift);
+
+	regmap_update_bits(afe->regmap, cfg->ref_ck_sel_reg,
+			   cfg->ref_ck_sel_maskbit << cfg->ref_ck_sel_shift,
+			   cfg->ref_ck_sel_default << cfg->ref_ck_sel_shift);
+
+	regmap_update_bits(afe->regmap, cfg->upper_bound_reg,
+			   cfg->upper_bound_maskbit << cfg->upper_bound_shift,
+			   cfg->upper_bound_default << cfg->upper_bound_shift);
+
+	return 0;
+}
+
+static int mt8195_afe_enable_tuner_clk(struct mtk_base_afe *afe,
+				       unsigned int id)
+{
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+
+	switch (id) {
+	case MT8195_AUD_PLL1:
+		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
+		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL1_TUNER]);
+		break;
+	case MT8195_AUD_PLL2:
+		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
+		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2_TUNER]);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mt8195_afe_disable_tuner_clk(struct mtk_base_afe *afe,
+					unsigned int id)
+{
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+
+	switch (id) {
+	case MT8195_AUD_PLL1:
+		mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL1_TUNER]);
+		mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
+		break;
+	case MT8195_AUD_PLL2:
+		mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2_TUNER]);
+		mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mt8195_afe_enable_apll_tuner(struct mtk_base_afe *afe,
+					unsigned int id)
+{
+	struct mt8195_afe_tuner_cfg *cfg = mt8195_afe_found_apll_tuner(id);
+	unsigned long flags;
+	int ret = 0;
+
+	if (!cfg)
+		return -EINVAL;
+
+	ret = mt8195_afe_setup_apll_tuner(afe, id);
+	if (ret)
+		return ret;
+
+	ret = mt8195_afe_enable_tuner_clk(afe, id);
+	if (ret)
+		return ret;
+
+	spin_lock_irqsave(&cfg->ctrl_lock, flags);
+
+	cfg->ref_cnt++;
+	if (cfg->ref_cnt == 1)
+		regmap_update_bits(afe->regmap,
+				   cfg->tuner_en_reg,
+				   cfg->tuner_en_maskbit << cfg->tuner_en_shift,
+				   1 << cfg->tuner_en_shift);
+
+	spin_unlock_irqrestore(&cfg->ctrl_lock, flags);
+
+	return ret;
+}
+
+static int mt8195_afe_disable_apll_tuner(struct mtk_base_afe *afe,
+					 unsigned int id)
+{
+	struct mt8195_afe_tuner_cfg *cfg = mt8195_afe_found_apll_tuner(id);
+	unsigned long flags;
+	int ret = 0;
+
+	if (!cfg)
+		return -EINVAL;
+
+	spin_lock_irqsave(&cfg->ctrl_lock, flags);
+
+	cfg->ref_cnt--;
+	if (cfg->ref_cnt == 0)
+		regmap_update_bits(afe->regmap,
+				   cfg->tuner_en_reg,
+				   cfg->tuner_en_maskbit << cfg->tuner_en_shift,
+				   0 << cfg->tuner_en_shift);
+	else if (cfg->ref_cnt < 0)
+		cfg->ref_cnt = 0;
+
+	spin_unlock_irqrestore(&cfg->ctrl_lock, flags);
+
+	ret = mt8195_afe_disable_tuner_clk(afe, id);
+	if (ret)
+		return ret;
+
+	return ret;
+}
+
 int mt8195_afe_get_mclk_source_clk_id(int sel)
 {
 	switch (sel) {
@@ -113,7 +377,7 @@ int mt8195_afe_get_default_mclk_source_by_rate(int rate)
 int mt8195_afe_init_clock(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-	int i;
+	int i, ret;
 
 	mt8195_audsys_clk_register(afe);
 
@@ -133,6 +397,16 @@ int mt8195_afe_init_clock(struct mtk_base_afe *afe)
 		}
 	}
 
+	/* initial tuner */
+	for (i = 0; i < MT8195_AUD_PLL_NUM; i++) {
+		ret = mt8195_afe_init_apll_tuner(i);
+		if (ret) {
+			dev_dbg(afe->dev, "%s(), init apll_tuner%d failed",
+				__func__, (i + 1));
+			return -EINVAL;
+		}
+	}
+
 	return 0;
 }
 
@@ -428,11 +702,17 @@ int mt8195_afe_enable_main_clock(struct mtk_base_afe *afe)
 
 	mt8195_afe_enable_afe_on(afe);
 
+	mt8195_afe_enable_apll_tuner(afe, MT8195_AUD_PLL1);
+	mt8195_afe_enable_apll_tuner(afe, MT8195_AUD_PLL2);
+
 	return 0;
 }
 
 int mt8195_afe_disable_main_clock(struct mtk_base_afe *afe)
 {
+	mt8195_afe_disable_apll_tuner(afe, MT8195_AUD_PLL2);
+	mt8195_afe_disable_apll_tuner(afe, MT8195_AUD_PLL1);
+
 	mt8195_afe_disable_afe_on(afe);
 
 	mt8195_afe_disable_timing_sys(afe);
diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.h b/sound/soc/mediatek/mt8195/mt8195-afe-clk.h
index f8e6eeb29a89..40663e31becd 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.h
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.h
@@ -35,6 +35,8 @@ enum {
 	MT8195_CLK_INFRA_AO_AUDIO_26M_B,
 	MT8195_CLK_SCP_ADSP_AUDIODSP,
 	MT8195_CLK_AUD_AFE,
+	MT8195_CLK_AUD_APLL1_TUNER,
+	MT8195_CLK_AUD_APLL2_TUNER,
 	MT8195_CLK_AUD_APLL,
 	MT8195_CLK_AUD_APLL2,
 	MT8195_CLK_AUD_DAC,
@@ -84,6 +86,15 @@ enum {
 	MT8195_MCK_SEL_NUM,
 };
 
+enum {
+	MT8195_AUD_PLL1,
+	MT8195_AUD_PLL2,
+	MT8195_AUD_PLL3,
+	MT8195_AUD_PLL4,
+	MT8195_AUD_PLL5,
+	MT8195_AUD_PLL_NUM,
+};
+
 struct mtk_base_afe;
 
 int mt8195_afe_get_mclk_source_clk_id(int sel);
diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index e425f868476a..b77c2ba5a629 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -2583,8 +2583,6 @@ static bool mt8195_is_volatile_reg(struct device *dev, unsigned int reg)
 	case AFE_IRQ3_CON_MON:
 	case AFE_IRQ_MCU_MON2:
 	case ADSP_IRQ_STATUS:
-	case AFE_APLL_TUNER_CFG:
-	case AFE_APLL_TUNER_CFG1:
 	case AUDIO_TOP_STA0:
 	case AUDIO_TOP_STA1:
 	case AFE_GAIN1_CUR:
@@ -2623,7 +2621,6 @@ static bool mt8195_is_volatile_reg(struct device *dev, unsigned int reg)
 	case SPDIFIN_USERCODE10:
 	case SPDIFIN_USERCODE11:
 	case SPDIFIN_USERCODE12:
-	case AFE_SPDIFIN_APLL_TUNER_CFG:
 	case AFE_LINEIN_APLL_TUNER_MON:
 	case AFE_EARC_APLL_TUNER_MON:
 	case AFE_CM0_MON:
-- 
2.18.0

