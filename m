Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 138103E5631
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Aug 2021 11:03:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BD31168D;
	Tue, 10 Aug 2021 11:02:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BD31168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628586202;
	bh=/vJOwP01V1I9fX9UNQYBsXjcnpicun4ynp8Gcsr5Md4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XLeIqjV0uWvC5sEHzY9qOA6w67nyCNmjHilt0rhQLDDVRJGrE4jLswCeLg+bovr2w
	 MxyCLQkcHrojPKG38FM2KHu4gOQeIXOSap+9zLOcVDM4VBx4MSTgihvnvdxWqT0JE2
	 DTDOP7myiK7L0TZgVWDIUIb4wEnWtcHibajelWdA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83639F804F1;
	Tue, 10 Aug 2021 11:00:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FF59F80539; Mon,  9 Aug 2021 11:49:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82761F804B4
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 11:49:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82761F804B4
X-UUID: c9a7957529094c199f71d460f09166b3-20210809
X-UUID: c9a7957529094c199f71d460f09166b3-20210809
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 471146899; Mon, 09 Aug 2021 17:49:01 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Aug 2021 17:48:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 9 Aug 2021 17:48:59 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
Subject: [PATCH v3 6/9] ASoC: mediatek: mt8195: add platform driver
Date: Mon, 9 Aug 2021 17:48:52 +0800
Message-ID: <20210809094855.7169-7-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210809094855.7169-1-trevor.wu@mediatek.com>
References: <20210809094855.7169-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Tue, 10 Aug 2021 11:00:44 +0200
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

This patch adds mt8195 platform and affiliated driver.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/Kconfig                    |    9 +
 sound/soc/mediatek/Makefile                   |    1 +
 sound/soc/mediatek/mt8195/Makefile            |   12 +
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c    |  499 +++
 sound/soc/mediatek/mt8195/mt8195-afe-clk.h    |  113 +
 sound/soc/mediatek/mt8195/mt8195-afe-common.h |  158 +
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c    | 3283 +++++++++++++++++
 sound/soc/mediatek/mt8195/mt8195-reg.h        | 2796 ++++++++++++++
 8 files changed, 6871 insertions(+)
 create mode 100644 sound/soc/mediatek/mt8195/Makefile
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-afe-clk.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-afe-clk.h
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-afe-common.h
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-reg.h

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 74dae4332d17..3389f382be06 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -184,3 +184,12 @@ config SND_SOC_MT8192_MT6359_RT1015_RT5682
 	  with the MT6359 RT1015 RT5682 audio codec.
 	  Select Y if you have such device.
 	  If unsure select "N".
+
+config SND_SOC_MT8195
+	tristate "ASoC support for Mediatek MT8195 chip"
+	select SND_SOC_MEDIATEK
+	help
+	  This adds ASoC platform driver support for Mediatek MT8195 chip
+	  that can be used with other codecs.
+	  Select Y if you have such device.
+	  If unsure select "N".
diff --git a/sound/soc/mediatek/Makefile b/sound/soc/mediatek/Makefile
index f6cb6b8508e3..34778ca12106 100644
--- a/sound/soc/mediatek/Makefile
+++ b/sound/soc/mediatek/Makefile
@@ -5,3 +5,4 @@ obj-$(CONFIG_SND_SOC_MT6797) += mt6797/
 obj-$(CONFIG_SND_SOC_MT8173) += mt8173/
 obj-$(CONFIG_SND_SOC_MT8183) += mt8183/
 obj-$(CONFIG_SND_SOC_MT8192) += mt8192/
+obj-$(CONFIG_SND_SOC_MT8195) += mt8195/
diff --git a/sound/soc/mediatek/mt8195/Makefile b/sound/soc/mediatek/mt8195/Makefile
new file mode 100644
index 000000000000..6529dd5beb2b
--- /dev/null
+++ b/sound/soc/mediatek/mt8195/Makefile
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0
+
+# platform driver
+snd-soc-mt8195-afe-objs := \
+	mt8195-audsys-clk.o \
+	mt8195-afe-clk.o \
+	mt8195-afe-pcm.o \
+	mt8195-dai-adda.o \
+	mt8195-dai-etdm.o \
+	mt8195-dai-pcm.o
+
+obj-$(CONFIG_SND_SOC_MT8195) += snd-soc-mt8195-afe.o
diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
new file mode 100644
index 000000000000..78acf0c8aaa4
--- /dev/null
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -0,0 +1,499 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * mt8195-afe-clk.c  --  Mediatek 8195 afe clock ctrl
+ *
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Bicycle Tsai <bicycle.tsai@mediatek.com>
+ *         Trevor Wu <trevor.wu@mediatek.com>
+ */
+
+#include <linux/clk.h>
+
+#include "mt8195-afe-common.h"
+#include "mt8195-afe-clk.h"
+#include "mt8195-reg.h"
+#include "mt8195-audsys-clk.h"
+
+static const char *aud_clks[MT8195_CLK_NUM] = {
+	/* xtal */
+	[MT8195_CLK_XTAL_26M] = "clk26m",
+	/* divider */
+	[MT8195_CLK_TOP_APLL1] = "apll1_ck",
+	[MT8195_CLK_TOP_APLL2] = "apll2_ck",
+	[MT8195_CLK_TOP_APLL12_DIV0] = "apll12_div0",
+	[MT8195_CLK_TOP_APLL12_DIV1] = "apll12_div1",
+	[MT8195_CLK_TOP_APLL12_DIV2] = "apll12_div2",
+	[MT8195_CLK_TOP_APLL12_DIV3] = "apll12_div3",
+	[MT8195_CLK_TOP_APLL12_DIV9] = "apll12_div9",
+	/* mux */
+	[MT8195_CLK_TOP_A1SYS_HP_SEL] = "a1sys_hp_sel",
+	[MT8195_CLK_TOP_AUD_INTBUS_SEL] = "aud_intbus_sel",
+	[MT8195_CLK_TOP_AUDIO_H_SEL] = "audio_h_sel",
+	[MT8195_CLK_TOP_AUDIO_LOCAL_BUS_SEL] = "audio_local_bus_sel",
+	[MT8195_CLK_TOP_DPTX_M_SEL] = "dptx_m_sel",
+	[MT8195_CLK_TOP_I2SO1_M_SEL] = "i2so1_m_sel",
+	[MT8195_CLK_TOP_I2SO2_M_SEL] = "i2so2_m_sel",
+	[MT8195_CLK_TOP_I2SI1_M_SEL] = "i2si1_m_sel",
+	[MT8195_CLK_TOP_I2SI2_M_SEL] = "i2si2_m_sel",
+	/* clock gate */
+	[MT8195_CLK_INFRA_AO_AUDIO_26M_B] = "infra_ao_audio_26m_b",
+	[MT8195_CLK_SCP_ADSP_AUDIODSP] = "scp_adsp_audiodsp",
+	/* afe clock gate */
+	[MT8195_CLK_AUD_AFE] = "aud_afe",
+	[MT8195_CLK_AUD_APLL] = "aud_apll",
+	[MT8195_CLK_AUD_APLL2] = "aud_apll2",
+	[MT8195_CLK_AUD_DAC] = "aud_dac",
+	[MT8195_CLK_AUD_ADC] = "aud_adc",
+	[MT8195_CLK_AUD_DAC_HIRES] = "aud_dac_hires",
+	[MT8195_CLK_AUD_A1SYS_HP] = "aud_a1sys_hp",
+	[MT8195_CLK_AUD_ADC_HIRES] = "aud_adc_hires",
+	[MT8195_CLK_AUD_ADDA6_ADC] = "aud_adda6_adc",
+	[MT8195_CLK_AUD_ADDA6_ADC_HIRES] = "aud_adda6_adc_hires",
+	[MT8195_CLK_AUD_I2SIN] = "aud_i2sin",
+	[MT8195_CLK_AUD_TDM_IN] = "aud_tdm_in",
+	[MT8195_CLK_AUD_I2S_OUT] = "aud_i2s_out",
+	[MT8195_CLK_AUD_TDM_OUT] = "aud_tdm_out",
+	[MT8195_CLK_AUD_HDMI_OUT] = "aud_hdmi_out",
+	[MT8195_CLK_AUD_ASRC11] = "aud_asrc11",
+	[MT8195_CLK_AUD_ASRC12] = "aud_asrc12",
+	[MT8195_CLK_AUD_A1SYS] = "aud_a1sys",
+	[MT8195_CLK_AUD_A2SYS] = "aud_a2sys",
+	[MT8195_CLK_AUD_PCMIF] = "aud_pcmif",
+	[MT8195_CLK_AUD_MEMIF_UL1] = "aud_memif_ul1",
+	[MT8195_CLK_AUD_MEMIF_UL2] = "aud_memif_ul2",
+	[MT8195_CLK_AUD_MEMIF_UL3] = "aud_memif_ul3",
+	[MT8195_CLK_AUD_MEMIF_UL4] = "aud_memif_ul4",
+	[MT8195_CLK_AUD_MEMIF_UL5] = "aud_memif_ul5",
+	[MT8195_CLK_AUD_MEMIF_UL6] = "aud_memif_ul6",
+	[MT8195_CLK_AUD_MEMIF_UL8] = "aud_memif_ul8",
+	[MT8195_CLK_AUD_MEMIF_UL9] = "aud_memif_ul9",
+	[MT8195_CLK_AUD_MEMIF_UL10] = "aud_memif_ul10",
+	[MT8195_CLK_AUD_MEMIF_DL2] = "aud_memif_dl2",
+	[MT8195_CLK_AUD_MEMIF_DL3] = "aud_memif_dl3",
+	[MT8195_CLK_AUD_MEMIF_DL6] = "aud_memif_dl6",
+	[MT8195_CLK_AUD_MEMIF_DL7] = "aud_memif_dl7",
+	[MT8195_CLK_AUD_MEMIF_DL8] = "aud_memif_dl8",
+	[MT8195_CLK_AUD_MEMIF_DL10] = "aud_memif_dl10",
+	[MT8195_CLK_AUD_MEMIF_DL11] = "aud_memif_dl11",
+};
+
+int mt8195_afe_get_mclk_source_clk_id(int sel)
+{
+	switch (sel) {
+	case MT8195_MCK_SEL_26M:
+		return MT8195_CLK_XTAL_26M;
+	case MT8195_MCK_SEL_APLL1:
+		return MT8195_CLK_TOP_APLL1;
+	case MT8195_MCK_SEL_APLL2:
+		return MT8195_CLK_TOP_APLL2;
+	default:
+		return -EINVAL;
+	}
+}
+
+int mt8195_afe_get_mclk_source_rate(struct mtk_base_afe *afe, int apll)
+{
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	int clk_id = mt8195_afe_get_mclk_source_clk_id(apll);
+
+	if (clk_id < 0) {
+		dev_dbg(afe->dev, "invalid clk id\n");
+		return 0;
+	}
+
+	return clk_get_rate(afe_priv->clk[clk_id]);
+}
+
+int mt8195_afe_get_default_mclk_source_by_rate(int rate)
+{
+	return ((rate % 8000) == 0) ?
+		MT8195_MCK_SEL_APLL1 : MT8195_MCK_SEL_APLL2;
+}
+
+int mt8195_afe_init_clock(struct mtk_base_afe *afe)
+{
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	int i;
+
+	mt8195_audsys_clk_register(afe);
+
+	afe_priv->clk =
+		devm_kcalloc(afe->dev, MT8195_CLK_NUM, sizeof(*afe_priv->clk),
+			     GFP_KERNEL);
+	if (!afe_priv->clk)
+		return -ENOMEM;
+
+	for (i = 0; i < MT8195_CLK_NUM; i++) {
+		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
+		if (IS_ERR(afe_priv->clk[i])) {
+			dev_dbg(afe->dev, "%s(), devm_clk_get %s fail, ret %ld\n",
+				__func__, aud_clks[i],
+				PTR_ERR(afe_priv->clk[i]));
+			return PTR_ERR(afe_priv->clk[i]);
+		}
+	}
+
+	return 0;
+}
+
+void mt8195_afe_deinit_clock(struct mtk_base_afe *afe)
+{
+	mt8195_audsys_clk_unregister(afe);
+}
+
+int mt8195_afe_enable_clk(struct mtk_base_afe *afe, struct clk *clk)
+{
+	int ret;
+
+	if (clk) {
+		ret = clk_prepare_enable(clk);
+		if (ret) {
+			dev_dbg(afe->dev, "%s(), failed to enable clk\n",
+				__func__);
+			return ret;
+		}
+	} else {
+		dev_dbg(afe->dev, "NULL clk\n");
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt8195_afe_enable_clk);
+
+void mt8195_afe_disable_clk(struct mtk_base_afe *afe, struct clk *clk)
+{
+	if (clk)
+		clk_disable_unprepare(clk);
+	else
+		dev_dbg(afe->dev, "NULL clk\n");
+}
+EXPORT_SYMBOL_GPL(mt8195_afe_disable_clk);
+
+int mt8195_afe_prepare_clk(struct mtk_base_afe *afe, struct clk *clk)
+{
+	int ret;
+
+	if (clk) {
+		ret = clk_prepare(clk);
+		if (ret) {
+			dev_dbg(afe->dev, "%s(), failed to prepare clk\n",
+				__func__);
+			return ret;
+		}
+	} else {
+		dev_dbg(afe->dev, "NULL clk\n");
+	}
+	return 0;
+}
+
+void mt8195_afe_unprepare_clk(struct mtk_base_afe *afe, struct clk *clk)
+{
+	if (clk)
+		clk_unprepare(clk);
+	else
+		dev_dbg(afe->dev, "NULL clk\n");
+}
+
+int mt8195_afe_enable_clk_atomic(struct mtk_base_afe *afe, struct clk *clk)
+{
+	int ret;
+
+	if (clk) {
+		ret = clk_enable(clk);
+		if (ret) {
+			dev_dbg(afe->dev, "%s(), failed to clk enable\n",
+				__func__);
+			return ret;
+		}
+	} else {
+		dev_dbg(afe->dev, "NULL clk\n");
+	}
+	return 0;
+}
+
+void mt8195_afe_disable_clk_atomic(struct mtk_base_afe *afe, struct clk *clk)
+{
+	if (clk)
+		clk_disable(clk);
+	else
+		dev_dbg(afe->dev, "NULL clk\n");
+}
+
+int mt8195_afe_set_clk_rate(struct mtk_base_afe *afe, struct clk *clk,
+			    unsigned int rate)
+{
+	int ret;
+
+	if (clk) {
+		ret = clk_set_rate(clk, rate);
+		if (ret) {
+			dev_dbg(afe->dev, "%s(), failed to set clk rate\n",
+				__func__);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+int mt8195_afe_set_clk_parent(struct mtk_base_afe *afe, struct clk *clk,
+			      struct clk *parent)
+{
+	int ret;
+
+	if (clk && parent) {
+		ret = clk_set_parent(clk, parent);
+		if (ret) {
+			dev_dbg(afe->dev, "%s(), failed to set clk parent\n",
+				__func__);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static unsigned int get_top_cg_reg(unsigned int cg_type)
+{
+	switch (cg_type) {
+	case MT8195_TOP_CG_A1SYS_TIMING:
+	case MT8195_TOP_CG_A2SYS_TIMING:
+	case MT8195_TOP_CG_26M_TIMING:
+		return ASYS_TOP_CON;
+	default:
+		return 0;
+	}
+}
+
+static unsigned int get_top_cg_mask(unsigned int cg_type)
+{
+	switch (cg_type) {
+	case MT8195_TOP_CG_A1SYS_TIMING:
+		return ASYS_TOP_CON_A1SYS_TIMING_ON;
+	case MT8195_TOP_CG_A2SYS_TIMING:
+		return ASYS_TOP_CON_A2SYS_TIMING_ON;
+	case MT8195_TOP_CG_26M_TIMING:
+		return ASYS_TOP_CON_26M_TIMING_ON;
+	default:
+		return 0;
+	}
+}
+
+static unsigned int get_top_cg_on_val(unsigned int cg_type)
+{
+	switch (cg_type) {
+	case MT8195_TOP_CG_A1SYS_TIMING:
+	case MT8195_TOP_CG_A2SYS_TIMING:
+	case MT8195_TOP_CG_26M_TIMING:
+		return get_top_cg_mask(cg_type);
+	default:
+		return 0;
+	}
+}
+
+static unsigned int get_top_cg_off_val(unsigned int cg_type)
+{
+	switch (cg_type) {
+	case MT8195_TOP_CG_A1SYS_TIMING:
+	case MT8195_TOP_CG_A2SYS_TIMING:
+	case MT8195_TOP_CG_26M_TIMING:
+		return 0;
+	default:
+		return get_top_cg_mask(cg_type);
+	}
+}
+
+int mt8195_afe_enable_top_cg(struct mtk_base_afe *afe, unsigned int cg_type)
+{
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	unsigned int reg = get_top_cg_reg(cg_type);
+	unsigned int mask = get_top_cg_mask(cg_type);
+	unsigned int val = get_top_cg_on_val(cg_type);
+	unsigned long flags;
+	bool need_update = false;
+
+	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+
+	afe_priv->top_cg_ref_cnt[cg_type]++;
+	if (afe_priv->top_cg_ref_cnt[cg_type] == 1)
+		need_update = true;
+
+	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
+
+	if (need_update)
+		regmap_update_bits(afe->regmap, reg, mask, val);
+
+	return 0;
+}
+
+int mt8195_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_type)
+{
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	unsigned int reg = get_top_cg_reg(cg_type);
+	unsigned int mask = get_top_cg_mask(cg_type);
+	unsigned int val = get_top_cg_off_val(cg_type);
+	unsigned long flags;
+	bool need_update = false;
+
+	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+
+	afe_priv->top_cg_ref_cnt[cg_type]--;
+	if (afe_priv->top_cg_ref_cnt[cg_type] == 0)
+		need_update = true;
+	else if (afe_priv->top_cg_ref_cnt[cg_type] < 0)
+		afe_priv->top_cg_ref_cnt[cg_type] = 0;
+
+	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
+
+	if (need_update)
+		regmap_update_bits(afe->regmap, reg, mask, val);
+
+	return 0;
+}
+
+int mt8195_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
+{
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	int i;
+	unsigned int clk_array[] = {
+		MT8195_CLK_SCP_ADSP_AUDIODSP, /* bus clock for infra */
+		MT8195_CLK_TOP_AUDIO_H_SEL, /* clock for ADSP bus */
+		MT8195_CLK_TOP_AUDIO_LOCAL_BUS_SEL, /* bus clock for DRAM access */
+		MT8195_CLK_TOP_AUD_INTBUS_SEL, /* bus clock for AFE SRAM access */
+		MT8195_CLK_INFRA_AO_AUDIO_26M_B, /* audio 26M clock */
+		MT8195_CLK_AUD_AFE, /* AFE HW master switch */
+		MT8195_CLK_AUD_A1SYS_HP, /* AFE HW clock*/
+		MT8195_CLK_AUD_A1SYS, /* AFE HW clock */
+	};
+
+	for (i = 0; i < ARRAY_SIZE(clk_array); i++)
+		mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+
+	return 0;
+}
+
+int mt8195_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
+{
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	int i;
+	unsigned int clk_array[] = {
+		MT8195_CLK_AUD_A1SYS,
+		MT8195_CLK_AUD_A1SYS_HP,
+		MT8195_CLK_AUD_AFE,
+		MT8195_CLK_INFRA_AO_AUDIO_26M_B,
+		MT8195_CLK_TOP_AUD_INTBUS_SEL,
+		MT8195_CLK_TOP_AUDIO_LOCAL_BUS_SEL,
+		MT8195_CLK_TOP_AUDIO_H_SEL,
+		MT8195_CLK_SCP_ADSP_AUDIODSP,
+	};
+
+	for (i = 0; i < ARRAY_SIZE(clk_array); i++)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[clk_array[i]]);
+
+	return 0;
+}
+
+int mt8195_afe_enable_afe_on(struct mtk_base_afe *afe)
+{
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	unsigned long flags;
+	bool need_update = false;
+
+	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+
+	afe_priv->afe_on_ref_cnt++;
+	if (afe_priv->afe_on_ref_cnt == 1)
+		need_update = true;
+
+	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
+
+	if (need_update)
+		regmap_update_bits(afe->regmap, AFE_DAC_CON0, 0x1, 0x1);
+
+	return 0;
+}
+
+int mt8195_afe_disable_afe_on(struct mtk_base_afe *afe)
+{
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	unsigned long flags;
+	bool need_update = false;
+
+	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+
+	afe_priv->afe_on_ref_cnt--;
+	if (afe_priv->afe_on_ref_cnt == 0)
+		need_update = true;
+	else if (afe_priv->afe_on_ref_cnt < 0)
+		afe_priv->afe_on_ref_cnt = 0;
+
+	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
+
+	if (need_update)
+		regmap_update_bits(afe->regmap, AFE_DAC_CON0, 0x1, 0x0);
+
+	return 0;
+}
+
+int mt8195_afe_enable_timing_sys(struct mtk_base_afe *afe)
+{
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	int i;
+	unsigned int clk_array[] = {
+		MT8195_CLK_AUD_A1SYS,
+		MT8195_CLK_AUD_A2SYS,
+	};
+	unsigned int cg_array[] = {
+		MT8195_TOP_CG_A1SYS_TIMING,
+		MT8195_TOP_CG_A2SYS_TIMING,
+		MT8195_TOP_CG_26M_TIMING,
+	};
+
+	for (i = 0; i < ARRAY_SIZE(clk_array); i++)
+		mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+
+	for (i = 0; i < ARRAY_SIZE(cg_array); i++)
+		mt8195_afe_enable_top_cg(afe, cg_array[i]);
+
+	return 0;
+}
+
+int mt8195_afe_disable_timing_sys(struct mtk_base_afe *afe)
+{
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	int i;
+	unsigned int clk_array[] = {
+		MT8195_CLK_AUD_A2SYS,
+		MT8195_CLK_AUD_A1SYS,
+	};
+	unsigned int cg_array[] = {
+		MT8195_TOP_CG_26M_TIMING,
+		MT8195_TOP_CG_A2SYS_TIMING,
+		MT8195_TOP_CG_A1SYS_TIMING,
+	};
+
+	for (i = 0; i < ARRAY_SIZE(cg_array); i++)
+		mt8195_afe_disable_top_cg(afe, cg_array[i]);
+
+	for (i = 0; i < ARRAY_SIZE(clk_array); i++)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[clk_array[i]]);
+
+	return 0;
+}
+
+int mt8195_afe_enable_main_clock(struct mtk_base_afe *afe)
+{
+	mt8195_afe_enable_timing_sys(afe);
+
+	mt8195_afe_enable_afe_on(afe);
+
+	return 0;
+}
+
+int mt8195_afe_disable_main_clock(struct mtk_base_afe *afe)
+{
+	mt8195_afe_disable_afe_on(afe);
+
+	mt8195_afe_disable_timing_sys(afe);
+
+	return 0;
+}
diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.h b/sound/soc/mediatek/mt8195/mt8195-afe-clk.h
new file mode 100644
index 000000000000..d374435f22eb
--- /dev/null
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.h
@@ -0,0 +1,113 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * mt8195-afe-clk.h  --  Mediatek 8195 afe clock ctrl definition
+ *
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Bicycle Tsai <bicycle.tsai@mediatek.com>
+ *         Trevor Wu <trevor.wu@mediatek.com>
+ */
+
+#ifndef _MT8195_AFE_CLK_H_
+#define _MT8195_AFE_CLK_H_
+
+enum {
+	/* xtal */
+	MT8195_CLK_XTAL_26M,
+	/* divider */
+	MT8195_CLK_TOP_APLL1,
+	MT8195_CLK_TOP_APLL2,
+	MT8195_CLK_TOP_APLL12_DIV0,
+	MT8195_CLK_TOP_APLL12_DIV1,
+	MT8195_CLK_TOP_APLL12_DIV2,
+	MT8195_CLK_TOP_APLL12_DIV3,
+	MT8195_CLK_TOP_APLL12_DIV9,
+	/* mux */
+	MT8195_CLK_TOP_A1SYS_HP_SEL,
+	MT8195_CLK_TOP_AUD_INTBUS_SEL,
+	MT8195_CLK_TOP_AUDIO_H_SEL,
+	MT8195_CLK_TOP_AUDIO_LOCAL_BUS_SEL,
+	MT8195_CLK_TOP_DPTX_M_SEL,
+	MT8195_CLK_TOP_I2SO1_M_SEL,
+	MT8195_CLK_TOP_I2SO2_M_SEL,
+	MT8195_CLK_TOP_I2SI1_M_SEL,
+	MT8195_CLK_TOP_I2SI2_M_SEL,
+	/* clock gate */
+	MT8195_CLK_INFRA_AO_AUDIO_26M_B,
+	MT8195_CLK_SCP_ADSP_AUDIODSP,
+	MT8195_CLK_AUD_AFE,
+	MT8195_CLK_AUD_APLL,
+	MT8195_CLK_AUD_APLL2,
+	MT8195_CLK_AUD_DAC,
+	MT8195_CLK_AUD_ADC,
+	MT8195_CLK_AUD_DAC_HIRES,
+	MT8195_CLK_AUD_A1SYS_HP,
+	MT8195_CLK_AUD_ADC_HIRES,
+	MT8195_CLK_AUD_ADDA6_ADC,
+	MT8195_CLK_AUD_ADDA6_ADC_HIRES,
+	MT8195_CLK_AUD_I2SIN,
+	MT8195_CLK_AUD_TDM_IN,
+	MT8195_CLK_AUD_I2S_OUT,
+	MT8195_CLK_AUD_TDM_OUT,
+	MT8195_CLK_AUD_HDMI_OUT,
+	MT8195_CLK_AUD_ASRC11,
+	MT8195_CLK_AUD_ASRC12,
+	MT8195_CLK_AUD_A1SYS,
+	MT8195_CLK_AUD_A2SYS,
+	MT8195_CLK_AUD_PCMIF,
+	MT8195_CLK_AUD_MEMIF_UL1,
+	MT8195_CLK_AUD_MEMIF_UL2,
+	MT8195_CLK_AUD_MEMIF_UL3,
+	MT8195_CLK_AUD_MEMIF_UL4,
+	MT8195_CLK_AUD_MEMIF_UL5,
+	MT8195_CLK_AUD_MEMIF_UL6,
+	MT8195_CLK_AUD_MEMIF_UL8,
+	MT8195_CLK_AUD_MEMIF_UL9,
+	MT8195_CLK_AUD_MEMIF_UL10,
+	MT8195_CLK_AUD_MEMIF_DL2,
+	MT8195_CLK_AUD_MEMIF_DL3,
+	MT8195_CLK_AUD_MEMIF_DL6,
+	MT8195_CLK_AUD_MEMIF_DL7,
+	MT8195_CLK_AUD_MEMIF_DL8,
+	MT8195_CLK_AUD_MEMIF_DL10,
+	MT8195_CLK_AUD_MEMIF_DL11,
+	MT8195_CLK_NUM,
+};
+
+enum {
+	MT8195_MCK_SEL_26M,
+	MT8195_MCK_SEL_APLL1,
+	MT8195_MCK_SEL_APLL2,
+	MT8195_MCK_SEL_APLL3,
+	MT8195_MCK_SEL_APLL4,
+	MT8195_MCK_SEL_APLL5,
+	MT8195_MCK_SEL_HDMIRX_APLL,
+	MT8195_MCK_SEL_NUM,
+};
+
+struct mtk_base_afe;
+
+int mt8195_afe_get_mclk_source_clk_id(int sel);
+int mt8195_afe_get_mclk_source_rate(struct mtk_base_afe *afe, int apll);
+int mt8195_afe_get_default_mclk_source_by_rate(int rate);
+int mt8195_afe_init_clock(struct mtk_base_afe *afe);
+void mt8195_afe_deinit_clock(struct mtk_base_afe *afe);
+int mt8195_afe_enable_clk(struct mtk_base_afe *afe, struct clk *clk);
+void mt8195_afe_disable_clk(struct mtk_base_afe *afe, struct clk *clk);
+int mt8195_afe_prepare_clk(struct mtk_base_afe *afe, struct clk *clk);
+void mt8195_afe_unprepare_clk(struct mtk_base_afe *afe, struct clk *clk);
+int mt8195_afe_enable_clk_atomic(struct mtk_base_afe *afe, struct clk *clk);
+void mt8195_afe_disable_clk_atomic(struct mtk_base_afe *afe, struct clk *clk);
+int mt8195_afe_set_clk_rate(struct mtk_base_afe *afe, struct clk *clk,
+			    unsigned int rate);
+int mt8195_afe_set_clk_parent(struct mtk_base_afe *afe, struct clk *clk,
+			      struct clk *parent);
+int mt8195_afe_enable_main_clock(struct mtk_base_afe *afe);
+int mt8195_afe_disable_main_clock(struct mtk_base_afe *afe);
+int mt8195_afe_enable_top_cg(struct mtk_base_afe *afe, unsigned int cg_type);
+int mt8195_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_type);
+int mt8195_afe_enable_reg_rw_clk(struct mtk_base_afe *afe);
+int mt8195_afe_disable_reg_rw_clk(struct mtk_base_afe *afe);
+int mt8195_afe_enable_afe_on(struct mtk_base_afe *afe);
+int mt8195_afe_disable_afe_on(struct mtk_base_afe *afe);
+
+#endif
diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-common.h b/sound/soc/mediatek/mt8195/mt8195-afe-common.h
new file mode 100644
index 000000000000..f93f439e2bd9
--- /dev/null
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-common.h
@@ -0,0 +1,158 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * mt8195-afe-common.h  --  Mediatek 8195 audio driver definitions
+ *
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Bicycle Tsai <bicycle.tsai@mediatek.com>
+ *         Trevor Wu <trevor.wu@mediatek.com>
+ */
+
+#ifndef _MT_8195_AFE_COMMON_H_
+#define _MT_8195_AFE_COMMON_H_
+
+#include <sound/soc.h>
+#include <linux/list.h>
+#include <linux/regmap.h>
+#include "../common/mtk-base-afe.h"
+
+enum {
+	MT8195_DAI_START,
+	MT8195_AFE_MEMIF_START = MT8195_DAI_START,
+	MT8195_AFE_MEMIF_DL2 = MT8195_AFE_MEMIF_START,
+	MT8195_AFE_MEMIF_DL3,
+	MT8195_AFE_MEMIF_DL6,
+	MT8195_AFE_MEMIF_DL7,
+	MT8195_AFE_MEMIF_DL8,
+	MT8195_AFE_MEMIF_DL10,
+	MT8195_AFE_MEMIF_DL11,
+	MT8195_AFE_MEMIF_UL_START,
+	MT8195_AFE_MEMIF_UL1 = MT8195_AFE_MEMIF_UL_START,
+	MT8195_AFE_MEMIF_UL2,
+	MT8195_AFE_MEMIF_UL3,
+	MT8195_AFE_MEMIF_UL4,
+	MT8195_AFE_MEMIF_UL5,
+	MT8195_AFE_MEMIF_UL6,
+	MT8195_AFE_MEMIF_UL8,
+	MT8195_AFE_MEMIF_UL9,
+	MT8195_AFE_MEMIF_UL10,
+	MT8195_AFE_MEMIF_END,
+	MT8195_AFE_MEMIF_NUM = (MT8195_AFE_MEMIF_END - MT8195_AFE_MEMIF_START),
+	MT8195_AFE_IO_START = MT8195_AFE_MEMIF_END,
+	MT8195_AFE_IO_DL_SRC = MT8195_AFE_IO_START,
+	MT8195_AFE_IO_DPTX,
+	MT8195_AFE_IO_ETDM_START,
+	MT8195_AFE_IO_ETDM1_IN = MT8195_AFE_IO_ETDM_START,
+	MT8195_AFE_IO_ETDM2_IN,
+	MT8195_AFE_IO_ETDM1_OUT,
+	MT8195_AFE_IO_ETDM2_OUT,
+	MT8195_AFE_IO_ETDM3_OUT,
+	MT8195_AFE_IO_ETDM_END,
+	MT8195_AFE_IO_ETDM_NUM =
+		(MT8195_AFE_IO_ETDM_END - MT8195_AFE_IO_ETDM_START),
+	MT8195_AFE_IO_PCM = MT8195_AFE_IO_ETDM_END,
+	MT8195_AFE_IO_UL_SRC1,
+	MT8195_AFE_IO_UL_SRC2,
+	MT8195_AFE_IO_END,
+	MT8195_AFE_IO_NUM = (MT8195_AFE_IO_END - MT8195_AFE_IO_START),
+	MT8195_DAI_END = MT8195_AFE_IO_END,
+	MT8195_DAI_NUM = (MT8195_DAI_END - MT8195_DAI_START),
+};
+
+enum {
+	MT8195_TOP_CG_A1SYS_TIMING,
+	MT8195_TOP_CG_A2SYS_TIMING,
+	MT8195_TOP_CG_26M_TIMING,
+	MT8195_TOP_CG_NUM,
+};
+
+enum {
+	MT8195_AFE_IRQ_1,
+	MT8195_AFE_IRQ_2,
+	MT8195_AFE_IRQ_3,
+	MT8195_AFE_IRQ_8,
+	MT8195_AFE_IRQ_9,
+	MT8195_AFE_IRQ_10,
+	MT8195_AFE_IRQ_13,
+	MT8195_AFE_IRQ_14,
+	MT8195_AFE_IRQ_15,
+	MT8195_AFE_IRQ_16,
+	MT8195_AFE_IRQ_17,
+	MT8195_AFE_IRQ_18,
+	MT8195_AFE_IRQ_19,
+	MT8195_AFE_IRQ_20,
+	MT8195_AFE_IRQ_21,
+	MT8195_AFE_IRQ_22,
+	MT8195_AFE_IRQ_23,
+	MT8195_AFE_IRQ_24,
+	MT8195_AFE_IRQ_25,
+	MT8195_AFE_IRQ_26,
+	MT8195_AFE_IRQ_27,
+	MT8195_AFE_IRQ_28,
+	MT8195_AFE_IRQ_NUM,
+};
+
+enum {
+	MT8195_ETDM_OUT1_1X_EN = 9,
+	MT8195_ETDM_OUT2_1X_EN = 10,
+	MT8195_ETDM_OUT3_1X_EN = 11,
+	MT8195_ETDM_IN1_1X_EN = 12,
+	MT8195_ETDM_IN2_1X_EN = 13,
+	MT8195_ETDM_IN1_NX_EN = 25,
+	MT8195_ETDM_IN2_NX_EN = 26,
+};
+
+enum {
+	MT8195_MTKAIF_MISO_0,
+	MT8195_MTKAIF_MISO_1,
+	MT8195_MTKAIF_MISO_2,
+	MT8195_MTKAIF_MISO_NUM,
+};
+
+struct mtk_dai_memif_irq_priv {
+	unsigned int asys_timing_sel;
+};
+
+struct mtkaif_param {
+	bool mtkaif_calibration_ok;
+	int mtkaif_chosen_phase[MT8195_MTKAIF_MISO_NUM];
+	int mtkaif_phase_cycle[MT8195_MTKAIF_MISO_NUM];
+	int mtkaif_dmic_on;
+	int mtkaif_adda6_only;
+};
+
+struct clk;
+
+struct mt8195_afe_private {
+	struct clk **clk;
+	struct clk_lookup **lookup;
+	struct regmap *topckgen;
+	int pm_runtime_bypass_reg_ctl;
+#ifdef CONFIG_DEBUG_FS
+	struct dentry **debugfs_dentry;
+#endif
+	int afe_on_ref_cnt;
+	int top_cg_ref_cnt[MT8195_TOP_CG_NUM];
+	spinlock_t afe_ctrl_lock;	/* Lock for afe control */
+	struct mtk_dai_memif_irq_priv irq_priv[MT8195_AFE_IRQ_NUM];
+	struct mtkaif_param mtkaif_params;
+
+	/* dai */
+	void *dai_priv[MT8195_DAI_NUM];
+};
+
+int mt8195_afe_fs_timing(unsigned int rate);
+/* dai register */
+int mt8195_dai_adda_register(struct mtk_base_afe *afe);
+int mt8195_dai_etdm_register(struct mtk_base_afe *afe);
+int mt8195_dai_pcm_register(struct mtk_base_afe *afe);
+
+#define MT8195_SOC_ENUM_EXT(xname, xenum, xhandler_get, xhandler_put, id) \
+{ \
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
+	.info = snd_soc_info_enum_double, \
+	.get = xhandler_get, .put = xhandler_put, \
+	.device = id, \
+	.private_value = (unsigned long)&xenum, \
+}
+
+#endif
diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
new file mode 100644
index 000000000000..bdfd6d2f9ed4
--- /dev/null
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -0,0 +1,3283 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Mediatek ALSA SoC AFE platform driver for 8195
+ *
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Bicycle Tsai <bicycle.tsai@mediatek.com>
+ *         Trevor Wu <trevor.wu@mediatek.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/dma-mapping.h>
+#include <linux/module.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/pm_runtime.h>
+#include "mt8195-afe-common.h"
+#include "mt8195-afe-clk.h"
+#include "mt8195-reg.h"
+#include "../common/mtk-afe-platform-driver.h"
+#include "../common/mtk-afe-fe-dai.h"
+
+#define MT8195_MEMIF_BUFFER_BYTES_ALIGN  (0x40)
+#define MT8195_MEMIF_DL7_MAX_PERIOD_SIZE (0x3fff)
+
+struct mtk_dai_memif_priv {
+	unsigned int asys_timing_sel;
+};
+
+static const struct snd_pcm_hardware mt8195_afe_hardware = {
+	.info = SNDRV_PCM_INFO_MMAP |
+		SNDRV_PCM_INFO_INTERLEAVED |
+		SNDRV_PCM_INFO_MMAP_VALID,
+	.formats = SNDRV_PCM_FMTBIT_S16_LE |
+		   SNDRV_PCM_FMTBIT_S24_LE |
+		   SNDRV_PCM_FMTBIT_S32_LE,
+	.period_bytes_min = 64,
+	.period_bytes_max = 256 * 1024,
+	.periods_min = 2,
+	.periods_max = 256,
+	.buffer_bytes_max = 256 * 2 * 1024,
+};
+
+struct mt8195_afe_rate {
+	unsigned int rate;
+	unsigned int reg_value;
+};
+
+static const struct mt8195_afe_rate mt8195_afe_rates[] = {
+	{ .rate = 8000, .reg_value = 0, },
+	{ .rate = 12000, .reg_value = 1, },
+	{ .rate = 16000, .reg_value = 2, },
+	{ .rate = 24000, .reg_value = 3, },
+	{ .rate = 32000, .reg_value = 4, },
+	{ .rate = 48000, .reg_value = 5, },
+	{ .rate = 96000, .reg_value = 6, },
+	{ .rate = 192000, .reg_value = 7, },
+	{ .rate = 384000, .reg_value = 8, },
+	{ .rate = 7350, .reg_value = 16, },
+	{ .rate = 11025, .reg_value = 17, },
+	{ .rate = 14700, .reg_value = 18, },
+	{ .rate = 22050, .reg_value = 19, },
+	{ .rate = 29400, .reg_value = 20, },
+	{ .rate = 44100, .reg_value = 21, },
+	{ .rate = 88200, .reg_value = 22, },
+	{ .rate = 176400, .reg_value = 23, },
+	{ .rate = 352800, .reg_value = 24, },
+};
+
+int mt8195_afe_fs_timing(unsigned int rate)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(mt8195_afe_rates); i++)
+		if (mt8195_afe_rates[i].rate == rate)
+			return mt8195_afe_rates[i].reg_value;
+
+	return -EINVAL;
+}
+
+static int mt8195_memif_fs(struct snd_pcm_substream *substream,
+			   unsigned int rate)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_component *component =
+			snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
+	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	struct mtk_base_afe_memif *memif = &afe->memif[id];
+	int fs = mt8195_afe_fs_timing(rate);
+
+	switch (memif->data->id) {
+	case MT8195_AFE_MEMIF_DL10:
+		fs = MT8195_ETDM_OUT3_1X_EN;
+		break;
+	case MT8195_AFE_MEMIF_UL8:
+		fs = MT8195_ETDM_IN1_NX_EN;
+		break;
+	case MT8195_AFE_MEMIF_UL3:
+		fs = MT8195_ETDM_IN2_NX_EN;
+		break;
+	default:
+		break;
+	}
+
+	return fs;
+}
+
+static int mt8195_irq_fs(struct snd_pcm_substream *substream,
+			 unsigned int rate)
+{
+	int fs = mt8195_memif_fs(substream, rate);
+
+	switch (fs) {
+	case MT8195_ETDM_IN1_NX_EN:
+		fs = MT8195_ETDM_IN1_1X_EN;
+		break;
+	case MT8195_ETDM_IN2_NX_EN:
+		fs = MT8195_ETDM_IN2_1X_EN;
+		break;
+	default:
+		break;
+	}
+
+	return fs;
+}
+
+enum {
+	MT8195_AFE_CM0,
+	MT8195_AFE_CM1,
+	MT8195_AFE_CM2,
+	MT8195_AFE_CM_NUM,
+};
+
+struct mt8195_afe_channel_merge {
+	int id;
+	int reg;
+	unsigned int sel_shift;
+	unsigned int sel_maskbit;
+	unsigned int sel_default;
+	unsigned int ch_num_shift;
+	unsigned int ch_num_maskbit;
+	unsigned int en_shift;
+	unsigned int en_maskbit;
+	unsigned int update_cnt_shift;
+	unsigned int update_cnt_maskbit;
+	unsigned int update_cnt_default;
+};
+
+static const struct mt8195_afe_channel_merge
+	mt8195_afe_cm[MT8195_AFE_CM_NUM] = {
+	[MT8195_AFE_CM0] = {
+		.id = MT8195_AFE_CM0,
+		.reg = AFE_CM0_CON,
+		.sel_shift = 30,
+		.sel_maskbit = 0x1,
+		.sel_default = 1,
+		.ch_num_shift = 2,
+		.ch_num_maskbit = 0x3f,
+		.en_shift = 0,
+		.en_maskbit = 0x1,
+		.update_cnt_shift = 16,
+		.update_cnt_maskbit = 0x1fff,
+		.update_cnt_default = 0x3,
+	},
+	[MT8195_AFE_CM1] = {
+		.id = MT8195_AFE_CM1,
+		.reg = AFE_CM1_CON,
+		.sel_shift = 30,
+		.sel_maskbit = 0x1,
+		.sel_default = 1,
+		.ch_num_shift = 2,
+		.ch_num_maskbit = 0x1f,
+		.en_shift = 0,
+		.en_maskbit = 0x1,
+		.update_cnt_shift = 16,
+		.update_cnt_maskbit = 0x1fff,
+		.update_cnt_default = 0x3,
+	},
+	[MT8195_AFE_CM2] = {
+		.id = MT8195_AFE_CM2,
+		.reg = AFE_CM2_CON,
+		.sel_shift = 30,
+		.sel_maskbit = 0x1,
+		.sel_default = 1,
+		.ch_num_shift = 2,
+		.ch_num_maskbit = 0x1f,
+		.en_shift = 0,
+		.en_maskbit = 0x1,
+		.update_cnt_shift = 16,
+		.update_cnt_maskbit = 0x1fff,
+		.update_cnt_default = 0x3,
+	},
+};
+
+static int mt8195_afe_memif_is_ul(int id)
+{
+	if (id >= MT8195_AFE_MEMIF_UL_START && id < MT8195_AFE_MEMIF_END)
+		return 1;
+	else
+		return 0;
+}
+
+static const struct mt8195_afe_channel_merge*
+mt8195_afe_found_cm(struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	int id = -EINVAL;
+
+	if (mt8195_afe_memif_is_ul(dai->id) == 0)
+		return NULL;
+
+	switch (dai->id) {
+	case MT8195_AFE_MEMIF_UL9:
+		id = MT8195_AFE_CM0;
+		break;
+	case MT8195_AFE_MEMIF_UL2:
+		id = MT8195_AFE_CM1;
+		break;
+	case MT8195_AFE_MEMIF_UL10:
+		id = MT8195_AFE_CM2;
+		break;
+	default:
+		break;
+	}
+
+	if (id < 0) {
+		dev_dbg(afe->dev, "%s, memif %d cannot find CM!\n",
+			__func__, dai->id);
+		return NULL;
+	}
+
+	return &mt8195_afe_cm[id];
+}
+
+static int mt8195_afe_config_cm(struct mtk_base_afe *afe,
+				const struct mt8195_afe_channel_merge *cm,
+				unsigned int channels)
+{
+	if (!cm)
+		return -EINVAL;
+
+	regmap_update_bits(afe->regmap,
+			   cm->reg,
+			   cm->sel_maskbit << cm->sel_shift,
+			   cm->sel_default << cm->sel_shift);
+
+	regmap_update_bits(afe->regmap,
+			   cm->reg,
+			   cm->ch_num_maskbit << cm->ch_num_shift,
+			   (channels - 1) << cm->ch_num_shift);
+
+	regmap_update_bits(afe->regmap,
+			   cm->reg,
+			   cm->update_cnt_maskbit << cm->update_cnt_shift,
+			   cm->update_cnt_default << cm->update_cnt_shift);
+
+	return 0;
+}
+
+static int mt8195_afe_enable_cm(struct mtk_base_afe *afe,
+				const struct mt8195_afe_channel_merge *cm,
+				bool enable)
+{
+	if (!cm)
+		return -EINVAL;
+
+	regmap_update_bits(afe->regmap,
+			   cm->reg,
+			   cm->en_maskbit << cm->en_shift,
+			   enable << cm->en_shift);
+
+	return 0;
+}
+
+static int
+mt8195_afe_paired_memif_clk_prepare(struct snd_pcm_substream *substream,
+				    struct snd_soc_dai *dai,
+				    int enable)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int clk_id;
+
+	if (id != MT8195_AFE_MEMIF_DL8 && id != MT8195_AFE_MEMIF_DL10)
+		return 0;
+
+	if (enable) {
+		clk_id = MT8195_CLK_AUD_MEMIF_DL10;
+		mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
+		mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+	} else {
+		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
+		mt8195_afe_unprepare_clk(afe, afe_priv->clk[clk_id]);
+		clk_id = MT8195_CLK_AUD_MEMIF_DL10;
+		mt8195_afe_unprepare_clk(afe, afe_priv->clk[clk_id]);
+	}
+
+	return 0;
+}
+
+static int
+mt8195_afe_paired_memif_clk_enable(struct snd_pcm_substream *substream,
+				   struct snd_soc_dai *dai,
+				   int enable)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int clk_id;
+
+	if (id != MT8195_AFE_MEMIF_DL8 && id != MT8195_AFE_MEMIF_DL10)
+		return 0;
+
+	if (enable) {
+		/* DL8_DL10_MEM */
+		clk_id = MT8195_CLK_AUD_MEMIF_DL10;
+		mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		udelay(1);
+		/* DL8_DL10_AGENT */
+		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
+		mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+	} else {
+		/* DL8_DL10_AGENT */
+		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
+		mt8195_afe_disable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		/* DL8_DL10_MEM */
+		clk_id = MT8195_CLK_AUD_MEMIF_DL10;
+		mt8195_afe_disable_clk_atomic(afe, afe_priv->clk[clk_id]);
+	}
+
+	return 0;
+}
+
+static int mt8195_afe_fe_startup(struct snd_pcm_substream *substream,
+				 struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int ret = 0;
+
+	mt8195_afe_paired_memif_clk_prepare(substream, dai, 1);
+
+	ret = mtk_afe_fe_startup(substream, dai);
+
+	snd_pcm_hw_constraint_step(runtime, 0,
+				   SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
+				   MT8195_MEMIF_BUFFER_BYTES_ALIGN);
+
+	if (id != MT8195_AFE_MEMIF_DL7)
+		goto out;
+
+	ret = snd_pcm_hw_constraint_minmax(runtime,
+					   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+					   1,
+					   MT8195_MEMIF_DL7_MAX_PERIOD_SIZE);
+	if (ret < 0)
+		dev_dbg(afe->dev, "hw_constraint_minmax failed\n");
+out:
+	return ret;
+}
+
+static void mt8195_afe_fe_shutdown(struct snd_pcm_substream *substream,
+				   struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+
+	mtk_afe_fe_shutdown(substream, dai);
+	mt8195_afe_paired_memif_clk_prepare(substream, dai, 0);
+}
+
+static int mt8195_afe_fe_hw_params(struct snd_pcm_substream *substream,
+				   struct snd_pcm_hw_params *params,
+				   struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	struct mtk_base_afe_memif *memif = &afe->memif[id];
+	const struct mtk_base_memif_data *data = memif->data;
+	const struct mt8195_afe_channel_merge *cm = mt8195_afe_found_cm(dai);
+	unsigned int ch_num = params_channels(params);
+
+	mt8195_afe_config_cm(afe, cm, params_channels(params));
+
+	if (data->ch_num_reg >= 0) {
+		regmap_update_bits(afe->regmap, data->ch_num_reg,
+				   data->ch_num_maskbit << data->ch_num_shift,
+				   ch_num << data->ch_num_shift);
+	}
+
+	return mtk_afe_fe_hw_params(substream, params, dai);
+}
+
+static int mt8195_afe_fe_hw_free(struct snd_pcm_substream *substream,
+				 struct snd_soc_dai *dai)
+{
+	return mtk_afe_fe_hw_free(substream, dai);
+}
+
+static int mt8195_afe_fe_prepare(struct snd_pcm_substream *substream,
+				 struct snd_soc_dai *dai)
+{
+	return mtk_afe_fe_prepare(substream, dai);
+}
+
+static int mt8195_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
+				 struct snd_soc_dai *dai)
+{
+	int ret = 0;
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	const struct mt8195_afe_channel_merge *cm = mt8195_afe_found_cm(dai);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+		mt8195_afe_enable_cm(afe, cm, true);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+		mt8195_afe_enable_cm(afe, cm, false);
+		break;
+	default:
+		break;
+	}
+
+	ret = mtk_afe_fe_trigger(substream, cmd, dai);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+		mt8195_afe_paired_memif_clk_enable(substream, dai, 1);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+		mt8195_afe_paired_memif_clk_enable(substream, dai, 0);
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+static int mt8195_afe_fe_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	return 0;
+}
+
+static const struct snd_soc_dai_ops mt8195_afe_fe_dai_ops = {
+	.startup	= mt8195_afe_fe_startup,
+	.shutdown	= mt8195_afe_fe_shutdown,
+	.hw_params	= mt8195_afe_fe_hw_params,
+	.hw_free	= mt8195_afe_fe_hw_free,
+	.prepare	= mt8195_afe_fe_prepare,
+	.trigger	= mt8195_afe_fe_trigger,
+	.set_fmt	= mt8195_afe_fe_set_fmt,
+};
+
+#define MTK_PCM_RATES (SNDRV_PCM_RATE_8000_48000 |\
+		       SNDRV_PCM_RATE_88200 |\
+		       SNDRV_PCM_RATE_96000 |\
+		       SNDRV_PCM_RATE_176400 |\
+		       SNDRV_PCM_RATE_192000 |\
+		       SNDRV_PCM_RATE_352800 |\
+		       SNDRV_PCM_RATE_384000)
+
+#define MTK_PCM_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
+			 SNDRV_PCM_FMTBIT_S24_LE |\
+			 SNDRV_PCM_FMTBIT_S32_LE)
+
+static struct snd_soc_dai_driver mt8195_memif_dai_driver[] = {
+	/* FE DAIs: memory intefaces to CPU */
+	{
+		.name = "DL2",
+		.id = MT8195_AFE_MEMIF_DL2,
+		.playback = {
+			.stream_name = "DL2",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mt8195_afe_fe_dai_ops,
+	},
+	{
+		.name = "DL3",
+		.id = MT8195_AFE_MEMIF_DL3,
+		.playback = {
+			.stream_name = "DL3",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mt8195_afe_fe_dai_ops,
+	},
+	{
+		.name = "DL6",
+		.id = MT8195_AFE_MEMIF_DL6,
+		.playback = {
+			.stream_name = "DL6",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mt8195_afe_fe_dai_ops,
+	},
+	{
+		.name = "DL7",
+		.id = MT8195_AFE_MEMIF_DL7,
+		.playback = {
+			.stream_name = "DL7",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mt8195_afe_fe_dai_ops,
+	},
+	{
+		.name = "DL8",
+		.id = MT8195_AFE_MEMIF_DL8,
+		.playback = {
+			.stream_name = "DL8",
+			.channels_min = 1,
+			.channels_max = 24,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mt8195_afe_fe_dai_ops,
+	},
+	{
+		.name = "DL10",
+		.id = MT8195_AFE_MEMIF_DL10,
+		.playback = {
+			.stream_name = "DL10",
+			.channels_min = 1,
+			.channels_max = 8,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mt8195_afe_fe_dai_ops,
+	},
+	{
+		.name = "DL11",
+		.id = MT8195_AFE_MEMIF_DL11,
+		.playback = {
+			.stream_name = "DL11",
+			.channels_min = 1,
+			.channels_max = 48,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mt8195_afe_fe_dai_ops,
+	},
+	{
+		.name = "UL1",
+		.id = MT8195_AFE_MEMIF_UL1,
+		.capture = {
+			.stream_name = "UL1",
+			.channels_min = 1,
+			.channels_max = 8,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mt8195_afe_fe_dai_ops,
+	},
+	{
+		.name = "UL2",
+		.id = MT8195_AFE_MEMIF_UL2,
+		.capture = {
+			.stream_name = "UL2",
+			.channels_min = 1,
+			.channels_max = 8,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mt8195_afe_fe_dai_ops,
+	},
+	{
+		.name = "UL3",
+		.id = MT8195_AFE_MEMIF_UL3,
+		.capture = {
+			.stream_name = "UL3",
+			.channels_min = 1,
+			.channels_max = 16,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mt8195_afe_fe_dai_ops,
+	},
+	{
+		.name = "UL4",
+		.id = MT8195_AFE_MEMIF_UL4,
+		.capture = {
+			.stream_name = "UL4",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mt8195_afe_fe_dai_ops,
+	},
+	{
+		.name = "UL5",
+		.id = MT8195_AFE_MEMIF_UL5,
+		.capture = {
+			.stream_name = "UL5",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mt8195_afe_fe_dai_ops,
+	},
+	{
+		.name = "UL6",
+		.id = MT8195_AFE_MEMIF_UL6,
+		.capture = {
+			.stream_name = "UL6",
+			.channels_min = 1,
+			.channels_max = 8,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mt8195_afe_fe_dai_ops,
+	},
+	{
+		.name = "UL8",
+		.id = MT8195_AFE_MEMIF_UL8,
+		.capture = {
+			.stream_name = "UL8",
+			.channels_min = 1,
+			.channels_max = 24,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mt8195_afe_fe_dai_ops,
+	},
+	{
+		.name = "UL9",
+		.id = MT8195_AFE_MEMIF_UL9,
+		.capture = {
+			.stream_name = "UL9",
+			.channels_min = 1,
+			.channels_max = 32,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mt8195_afe_fe_dai_ops,
+	},
+	{
+		.name = "UL10",
+		.id = MT8195_AFE_MEMIF_UL10,
+		.capture = {
+			.stream_name = "UL10",
+			.channels_min = 1,
+			.channels_max = 4,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mt8195_afe_fe_dai_ops,
+	},
+};
+
+static const struct snd_kcontrol_new o002_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I000 Switch", AFE_CONN2, 0, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I012 Switch", AFE_CONN2, 12, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I020 Switch", AFE_CONN2, 20, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I022 Switch", AFE_CONN2, 22, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I070 Switch", AFE_CONN2_2, 6, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I072 Switch", AFE_CONN2_2, 8, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I168 Switch", AFE_CONN2_5, 8, 1, 0),
+};
+
+static const struct snd_kcontrol_new o003_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I001 Switch", AFE_CONN3, 1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I013 Switch", AFE_CONN3, 13, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I021 Switch", AFE_CONN3, 21, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I023 Switch", AFE_CONN3, 23, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I071 Switch", AFE_CONN3_2, 7, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I073 Switch", AFE_CONN3_2, 9, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I169 Switch", AFE_CONN3_5, 9, 1, 0),
+};
+
+static const struct snd_kcontrol_new o004_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I000 Switch", AFE_CONN4, 0, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I014 Switch", AFE_CONN4, 14, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I024 Switch", AFE_CONN4, 24, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I074 Switch", AFE_CONN4_2, 10, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I170 Switch", AFE_CONN4_5, 10, 1, 0),
+};
+
+static const struct snd_kcontrol_new o005_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I001 Switch", AFE_CONN5, 1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I015 Switch", AFE_CONN5, 15, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I025 Switch", AFE_CONN5, 25, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I075 Switch", AFE_CONN5_2, 11, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I171 Switch", AFE_CONN5_5, 11, 1, 0),
+};
+
+static const struct snd_kcontrol_new o006_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I000 Switch", AFE_CONN6, 0, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I016 Switch", AFE_CONN6, 16, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I026 Switch", AFE_CONN6, 26, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I076 Switch", AFE_CONN6_2, 12, 1, 0),
+};
+
+static const struct snd_kcontrol_new o007_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I001 Switch", AFE_CONN7, 1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I017 Switch", AFE_CONN7, 17, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I027 Switch", AFE_CONN7, 27, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I077 Switch", AFE_CONN7_2, 13, 1, 0),
+};
+
+static const struct snd_kcontrol_new o008_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I018 Switch", AFE_CONN8, 18, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I028 Switch", AFE_CONN8, 28, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I078 Switch", AFE_CONN8_2, 14, 1, 0),
+};
+
+static const struct snd_kcontrol_new o009_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I019 Switch", AFE_CONN9, 19, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I029 Switch", AFE_CONN9, 29, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I079 Switch", AFE_CONN9_2, 15, 1, 0),
+};
+
+static const struct snd_kcontrol_new o010_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I022 Switch", AFE_CONN10, 22, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I030 Switch", AFE_CONN10, 30, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I046 Switch", AFE_CONN10_1, 14, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I072 Switch", AFE_CONN10_2, 8, 1, 0),
+};
+
+static const struct snd_kcontrol_new o011_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I023 Switch", AFE_CONN11, 23, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I031 Switch", AFE_CONN11, 31, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I047 Switch", AFE_CONN11_1, 15, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I073 Switch", AFE_CONN11_2, 9, 1, 0),
+};
+
+static const struct snd_kcontrol_new o012_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I024 Switch", AFE_CONN12, 24, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I032 Switch", AFE_CONN12_1, 0, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I048 Switch", AFE_CONN12_1, 16, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I074 Switch", AFE_CONN12_2, 10, 1, 0),
+};
+
+static const struct snd_kcontrol_new o013_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I025 Switch", AFE_CONN13, 25, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I033 Switch", AFE_CONN13_1, 1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I049 Switch", AFE_CONN13_1, 17, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I075 Switch", AFE_CONN13_2, 11, 1, 0),
+};
+
+static const struct snd_kcontrol_new o014_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I026 Switch", AFE_CONN14, 26, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I034 Switch", AFE_CONN14_1, 2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I050 Switch", AFE_CONN14_1, 18, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I076 Switch", AFE_CONN14_2, 12, 1, 0),
+};
+
+static const struct snd_kcontrol_new o015_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I027 Switch", AFE_CONN15, 27, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I035 Switch", AFE_CONN15_1, 3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I051 Switch", AFE_CONN15_1, 19, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I077 Switch", AFE_CONN15_2, 13, 1, 0),
+};
+
+static const struct snd_kcontrol_new o016_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I028 Switch", AFE_CONN16, 28, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I036 Switch", AFE_CONN16_1, 4, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I052 Switch", AFE_CONN16_1, 20, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I078 Switch", AFE_CONN16_2, 14, 1, 0),
+};
+
+static const struct snd_kcontrol_new o017_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I029 Switch", AFE_CONN17, 29, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I037 Switch", AFE_CONN17_1, 5, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I053 Switch", AFE_CONN17_1, 21, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I079 Switch", AFE_CONN17_2, 15, 1, 0),
+};
+
+static const struct snd_kcontrol_new o018_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I038 Switch", AFE_CONN18_1, 6, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I080 Switch", AFE_CONN18_2, 16, 1, 0),
+};
+
+static const struct snd_kcontrol_new o019_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I039 Switch", AFE_CONN19_1, 7, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I081 Switch", AFE_CONN19_2, 17, 1, 0),
+};
+
+static const struct snd_kcontrol_new o020_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I040 Switch", AFE_CONN20_1, 8, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I082 Switch", AFE_CONN20_2, 18, 1, 0),
+};
+
+static const struct snd_kcontrol_new o021_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I041 Switch", AFE_CONN21_1, 9, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I083 Switch", AFE_CONN21_2, 19, 1, 0),
+};
+
+static const struct snd_kcontrol_new o022_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I042 Switch", AFE_CONN22_1, 10, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I084 Switch", AFE_CONN22_2, 20, 1, 0),
+};
+
+static const struct snd_kcontrol_new o023_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I043 Switch", AFE_CONN23_1, 11, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I085 Switch", AFE_CONN23_2, 21, 1, 0),
+};
+
+static const struct snd_kcontrol_new o024_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I044 Switch", AFE_CONN24_1, 12, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I086 Switch", AFE_CONN24_2, 22, 1, 0),
+};
+
+static const struct snd_kcontrol_new o025_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I045 Switch", AFE_CONN25_1, 13, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I087 Switch", AFE_CONN25_2, 23, 1, 0),
+};
+
+static const struct snd_kcontrol_new o026_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I046 Switch", AFE_CONN26_1, 14, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I088 Switch", AFE_CONN26_2, 24, 1, 0),
+};
+
+static const struct snd_kcontrol_new o027_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I047 Switch", AFE_CONN27_1, 15, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I089 Switch", AFE_CONN27_2, 25, 1, 0),
+};
+
+static const struct snd_kcontrol_new o028_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I048 Switch", AFE_CONN28_1, 16, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I090 Switch", AFE_CONN28_2, 26, 1, 0),
+};
+
+static const struct snd_kcontrol_new o029_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I049 Switch", AFE_CONN29_1, 17, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I091 Switch", AFE_CONN29_2, 27, 1, 0),
+};
+
+static const struct snd_kcontrol_new o030_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I050 Switch", AFE_CONN30_1, 18, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I092 Switch", AFE_CONN30_2, 28, 1, 0),
+};
+
+static const struct snd_kcontrol_new o031_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I051 Switch", AFE_CONN31_1, 19, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I093 Switch", AFE_CONN31_2, 29, 1, 0),
+};
+
+static const struct snd_kcontrol_new o032_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I052 Switch", AFE_CONN32_1, 20, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I094 Switch", AFE_CONN32_2, 30, 1, 0),
+};
+
+static const struct snd_kcontrol_new o033_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I053 Switch", AFE_CONN33_1, 21, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I095 Switch", AFE_CONN33_2, 31, 1, 0),
+};
+
+static const struct snd_kcontrol_new o034_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I000 Switch", AFE_CONN34, 0, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I002 Switch", AFE_CONN34, 2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I012 Switch", AFE_CONN34, 12, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I020 Switch", AFE_CONN34, 20, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I070 Switch", AFE_CONN34_2, 6, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I072 Switch", AFE_CONN34_2, 8, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I168 Switch", AFE_CONN34_5, 8, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I170 Switch", AFE_CONN34_5, 10, 1, 0),
+};
+
+static const struct snd_kcontrol_new o035_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I001 Switch", AFE_CONN35, 1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I003 Switch", AFE_CONN35, 3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I013 Switch", AFE_CONN35, 13, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I021 Switch", AFE_CONN35, 21, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I071 Switch", AFE_CONN35_2, 7, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I073 Switch", AFE_CONN35_2, 9, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I137 Switch", AFE_CONN35_4, 9, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I139 Switch", AFE_CONN35_4, 11, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I168 Switch", AFE_CONN35_5, 8, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I169 Switch", AFE_CONN35_5, 9, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I170 Switch", AFE_CONN35_5, 10, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I171 Switch", AFE_CONN35_5, 11, 1, 0),
+};
+
+static const struct snd_kcontrol_new o036_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I000 Switch", AFE_CONN36, 0, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I012 Switch", AFE_CONN36, 12, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I020 Switch", AFE_CONN36, 20, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I070 Switch", AFE_CONN36_2, 6, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I168 Switch", AFE_CONN36_5, 8, 1, 0),
+};
+
+static const struct snd_kcontrol_new o037_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I001 Switch", AFE_CONN37, 1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I013 Switch", AFE_CONN37, 13, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I021 Switch", AFE_CONN37, 21, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I071 Switch", AFE_CONN37_2, 7, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I169 Switch", AFE_CONN37_5, 9, 1, 0),
+};
+
+static const struct snd_kcontrol_new o038_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I022 Switch", AFE_CONN38, 22, 1, 0),
+};
+
+static const struct snd_kcontrol_new o039_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I023 Switch", AFE_CONN39, 23, 1, 0),
+};
+
+static const struct snd_kcontrol_new o040_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I002 Switch", AFE_CONN40, 2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I012 Switch", AFE_CONN40, 12, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I022 Switch", AFE_CONN40, 22, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I168 Switch", AFE_CONN40_5, 8, 1, 0),
+};
+
+static const struct snd_kcontrol_new o041_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I003 Switch", AFE_CONN41, 3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I013 Switch", AFE_CONN41, 13, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I023 Switch", AFE_CONN41, 23, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I169 Switch", AFE_CONN41_5, 9, 1, 0),
+};
+
+static const struct snd_kcontrol_new o042_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I014 Switch", AFE_CONN42, 14, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I024 Switch", AFE_CONN42, 24, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I170 Switch", AFE_CONN42_5, 10, 1, 0),
+};
+
+static const struct snd_kcontrol_new o043_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I015 Switch", AFE_CONN43, 15, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I025 Switch", AFE_CONN43, 25, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I171 Switch", AFE_CONN43_5, 11, 1, 0),
+};
+
+static const struct snd_kcontrol_new o044_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I016 Switch", AFE_CONN44, 16, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I026 Switch", AFE_CONN44, 26, 1, 0),
+};
+
+static const struct snd_kcontrol_new o045_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I017 Switch", AFE_CONN45, 17, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I027 Switch", AFE_CONN45, 27, 1, 0),
+};
+
+static const struct snd_kcontrol_new o046_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I018 Switch", AFE_CONN46, 18, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I028 Switch", AFE_CONN46, 28, 1, 0),
+};
+
+static const struct snd_kcontrol_new o047_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I019 Switch", AFE_CONN47, 19, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I029 Switch", AFE_CONN47, 29, 1, 0),
+};
+
+static const struct snd_kcontrol_new o182_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I024 Switch", AFE_CONN182, 24, 1, 0),
+};
+
+static const struct snd_kcontrol_new o183_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I025 Switch", AFE_CONN183, 25, 1, 0),
+};
+
+static const char * const dl8_dl11_data_sel_mux_text[] = {
+	"dl8", "dl11",
+};
+
+static SOC_ENUM_SINGLE_DECL(dl8_dl11_data_sel_mux_enum,
+	AFE_DAC_CON2, 0, dl8_dl11_data_sel_mux_text);
+
+static const struct snd_kcontrol_new dl8_dl11_data_sel_mux =
+	SOC_DAPM_ENUM("DL8_DL11 Sink", dl8_dl11_data_sel_mux_enum);
+
+static const struct snd_soc_dapm_widget mt8195_memif_widgets[] = {
+	/* DL6 */
+	SND_SOC_DAPM_MIXER("I000", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I001", SND_SOC_NOPM, 0, 0, NULL, 0),
+
+	/* DL3 */
+	SND_SOC_DAPM_MIXER("I020", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I021", SND_SOC_NOPM, 0, 0, NULL, 0),
+
+	/* DL11 */
+	SND_SOC_DAPM_MIXER("I022", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I023", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I024", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I025", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I026", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I027", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I028", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I029", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I030", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I031", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I032", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I033", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I034", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I035", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I036", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I037", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I038", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I039", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I040", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I041", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I042", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I043", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I044", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I045", SND_SOC_NOPM, 0, 0, NULL, 0),
+
+	/* DL11/DL8 */
+	SND_SOC_DAPM_MIXER("I046", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I047", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I048", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I049", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I050", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I051", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I052", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I053", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I054", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I055", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I056", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I057", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I058", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I059", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I060", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I061", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I062", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I063", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I064", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I065", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I066", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I067", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I068", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I069", SND_SOC_NOPM, 0, 0, NULL, 0),
+
+	/* DL2 */
+	SND_SOC_DAPM_MIXER("I070", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I071", SND_SOC_NOPM, 0, 0, NULL, 0),
+
+	SND_SOC_DAPM_MUX("DL8_DL11 Mux",
+			 SND_SOC_NOPM, 0, 0, &dl8_dl11_data_sel_mux),
+
+	/* UL9 */
+	SND_SOC_DAPM_MIXER("O002", SND_SOC_NOPM, 0, 0,
+			   o002_mix, ARRAY_SIZE(o002_mix)),
+	SND_SOC_DAPM_MIXER("O003", SND_SOC_NOPM, 0, 0,
+			   o003_mix, ARRAY_SIZE(o003_mix)),
+	SND_SOC_DAPM_MIXER("O004", SND_SOC_NOPM, 0, 0,
+			   o004_mix, ARRAY_SIZE(o004_mix)),
+	SND_SOC_DAPM_MIXER("O005", SND_SOC_NOPM, 0, 0,
+			   o005_mix, ARRAY_SIZE(o005_mix)),
+	SND_SOC_DAPM_MIXER("O006", SND_SOC_NOPM, 0, 0,
+			   o006_mix, ARRAY_SIZE(o006_mix)),
+	SND_SOC_DAPM_MIXER("O007", SND_SOC_NOPM, 0, 0,
+			   o007_mix, ARRAY_SIZE(o007_mix)),
+	SND_SOC_DAPM_MIXER("O008", SND_SOC_NOPM, 0, 0,
+			   o008_mix, ARRAY_SIZE(o008_mix)),
+	SND_SOC_DAPM_MIXER("O009", SND_SOC_NOPM, 0, 0,
+			   o009_mix, ARRAY_SIZE(o009_mix)),
+	SND_SOC_DAPM_MIXER("O010", SND_SOC_NOPM, 0, 0,
+			   o010_mix, ARRAY_SIZE(o010_mix)),
+	SND_SOC_DAPM_MIXER("O011", SND_SOC_NOPM, 0, 0,
+			   o011_mix, ARRAY_SIZE(o011_mix)),
+	SND_SOC_DAPM_MIXER("O012", SND_SOC_NOPM, 0, 0,
+			   o012_mix, ARRAY_SIZE(o012_mix)),
+	SND_SOC_DAPM_MIXER("O013", SND_SOC_NOPM, 0, 0,
+			   o013_mix, ARRAY_SIZE(o013_mix)),
+	SND_SOC_DAPM_MIXER("O014", SND_SOC_NOPM, 0, 0,
+			   o014_mix, ARRAY_SIZE(o014_mix)),
+	SND_SOC_DAPM_MIXER("O015", SND_SOC_NOPM, 0, 0,
+			   o015_mix, ARRAY_SIZE(o015_mix)),
+	SND_SOC_DAPM_MIXER("O016", SND_SOC_NOPM, 0, 0,
+			   o016_mix, ARRAY_SIZE(o016_mix)),
+	SND_SOC_DAPM_MIXER("O017", SND_SOC_NOPM, 0, 0,
+			   o017_mix, ARRAY_SIZE(o017_mix)),
+	SND_SOC_DAPM_MIXER("O018", SND_SOC_NOPM, 0, 0,
+			   o018_mix, ARRAY_SIZE(o018_mix)),
+	SND_SOC_DAPM_MIXER("O019", SND_SOC_NOPM, 0, 0,
+			   o019_mix, ARRAY_SIZE(o019_mix)),
+	SND_SOC_DAPM_MIXER("O020", SND_SOC_NOPM, 0, 0,
+			   o020_mix, ARRAY_SIZE(o020_mix)),
+	SND_SOC_DAPM_MIXER("O021", SND_SOC_NOPM, 0, 0,
+			   o021_mix, ARRAY_SIZE(o021_mix)),
+	SND_SOC_DAPM_MIXER("O022", SND_SOC_NOPM, 0, 0,
+			   o022_mix, ARRAY_SIZE(o022_mix)),
+	SND_SOC_DAPM_MIXER("O023", SND_SOC_NOPM, 0, 0,
+			   o023_mix, ARRAY_SIZE(o023_mix)),
+	SND_SOC_DAPM_MIXER("O024", SND_SOC_NOPM, 0, 0,
+			   o024_mix, ARRAY_SIZE(o024_mix)),
+	SND_SOC_DAPM_MIXER("O025", SND_SOC_NOPM, 0, 0,
+			   o025_mix, ARRAY_SIZE(o025_mix)),
+	SND_SOC_DAPM_MIXER("O026", SND_SOC_NOPM, 0, 0,
+			   o026_mix, ARRAY_SIZE(o026_mix)),
+	SND_SOC_DAPM_MIXER("O027", SND_SOC_NOPM, 0, 0,
+			   o027_mix, ARRAY_SIZE(o027_mix)),
+	SND_SOC_DAPM_MIXER("O028", SND_SOC_NOPM, 0, 0,
+			   o028_mix, ARRAY_SIZE(o028_mix)),
+	SND_SOC_DAPM_MIXER("O029", SND_SOC_NOPM, 0, 0,
+			   o029_mix, ARRAY_SIZE(o029_mix)),
+	SND_SOC_DAPM_MIXER("O030", SND_SOC_NOPM, 0, 0,
+			   o030_mix, ARRAY_SIZE(o030_mix)),
+	SND_SOC_DAPM_MIXER("O031", SND_SOC_NOPM, 0, 0,
+			   o031_mix, ARRAY_SIZE(o031_mix)),
+	SND_SOC_DAPM_MIXER("O032", SND_SOC_NOPM, 0, 0,
+			   o032_mix, ARRAY_SIZE(o032_mix)),
+	SND_SOC_DAPM_MIXER("O033", SND_SOC_NOPM, 0, 0,
+			   o033_mix, ARRAY_SIZE(o033_mix)),
+
+	/* UL4 */
+	SND_SOC_DAPM_MIXER("O034", SND_SOC_NOPM, 0, 0,
+			   o034_mix, ARRAY_SIZE(o034_mix)),
+	SND_SOC_DAPM_MIXER("O035", SND_SOC_NOPM, 0, 0,
+			   o035_mix, ARRAY_SIZE(o035_mix)),
+
+	/* UL5 */
+	SND_SOC_DAPM_MIXER("O036", SND_SOC_NOPM, 0, 0,
+			   o036_mix, ARRAY_SIZE(o036_mix)),
+	SND_SOC_DAPM_MIXER("O037", SND_SOC_NOPM, 0, 0,
+			   o037_mix, ARRAY_SIZE(o037_mix)),
+
+	/* UL10 */
+	SND_SOC_DAPM_MIXER("O038", SND_SOC_NOPM, 0, 0,
+			   o038_mix, ARRAY_SIZE(o038_mix)),
+	SND_SOC_DAPM_MIXER("O039", SND_SOC_NOPM, 0, 0,
+			   o039_mix, ARRAY_SIZE(o039_mix)),
+	SND_SOC_DAPM_MIXER("O182", SND_SOC_NOPM, 0, 0,
+			   o182_mix, ARRAY_SIZE(o182_mix)),
+	SND_SOC_DAPM_MIXER("O183", SND_SOC_NOPM, 0, 0,
+			   o183_mix, ARRAY_SIZE(o183_mix)),
+
+	/* UL2 */
+	SND_SOC_DAPM_MIXER("O040", SND_SOC_NOPM, 0, 0,
+			   o040_mix, ARRAY_SIZE(o040_mix)),
+	SND_SOC_DAPM_MIXER("O041", SND_SOC_NOPM, 0, 0,
+			   o041_mix, ARRAY_SIZE(o041_mix)),
+	SND_SOC_DAPM_MIXER("O042", SND_SOC_NOPM, 0, 0,
+			   o042_mix, ARRAY_SIZE(o042_mix)),
+	SND_SOC_DAPM_MIXER("O043", SND_SOC_NOPM, 0, 0,
+			   o043_mix, ARRAY_SIZE(o043_mix)),
+	SND_SOC_DAPM_MIXER("O044", SND_SOC_NOPM, 0, 0,
+			   o044_mix, ARRAY_SIZE(o044_mix)),
+	SND_SOC_DAPM_MIXER("O045", SND_SOC_NOPM, 0, 0,
+			   o045_mix, ARRAY_SIZE(o045_mix)),
+	SND_SOC_DAPM_MIXER("O046", SND_SOC_NOPM, 0, 0,
+			   o046_mix, ARRAY_SIZE(o046_mix)),
+	SND_SOC_DAPM_MIXER("O047", SND_SOC_NOPM, 0, 0,
+			   o047_mix, ARRAY_SIZE(o047_mix)),
+};
+
+static const struct snd_soc_dapm_route mt8195_memif_routes[] = {
+	{"I000", NULL, "DL6"},
+	{"I001", NULL, "DL6"},
+
+	{"I020", NULL, "DL3"},
+	{"I021", NULL, "DL3"},
+
+	{"I022", NULL, "DL11"},
+	{"I023", NULL, "DL11"},
+	{"I024", NULL, "DL11"},
+	{"I025", NULL, "DL11"},
+	{"I026", NULL, "DL11"},
+	{"I027", NULL, "DL11"},
+	{"I028", NULL, "DL11"},
+	{"I029", NULL, "DL11"},
+	{"I030", NULL, "DL11"},
+	{"I031", NULL, "DL11"},
+	{"I032", NULL, "DL11"},
+	{"I033", NULL, "DL11"},
+	{"I034", NULL, "DL11"},
+	{"I035", NULL, "DL11"},
+	{"I036", NULL, "DL11"},
+	{"I037", NULL, "DL11"},
+	{"I038", NULL, "DL11"},
+	{"I039", NULL, "DL11"},
+	{"I040", NULL, "DL11"},
+	{"I041", NULL, "DL11"},
+	{"I042", NULL, "DL11"},
+	{"I043", NULL, "DL11"},
+	{"I044", NULL, "DL11"},
+	{"I045", NULL, "DL11"},
+
+	{"DL8_DL11 Mux", "dl8", "DL8"},
+	{"DL8_DL11 Mux", "dl11", "DL11"},
+
+	{"I046", NULL, "DL8_DL11 Mux"},
+	{"I047", NULL, "DL8_DL11 Mux"},
+	{"I048", NULL, "DL8_DL11 Mux"},
+	{"I049", NULL, "DL8_DL11 Mux"},
+	{"I050", NULL, "DL8_DL11 Mux"},
+	{"I051", NULL, "DL8_DL11 Mux"},
+	{"I052", NULL, "DL8_DL11 Mux"},
+	{"I053", NULL, "DL8_DL11 Mux"},
+	{"I054", NULL, "DL8_DL11 Mux"},
+	{"I055", NULL, "DL8_DL11 Mux"},
+	{"I056", NULL, "DL8_DL11 Mux"},
+	{"I057", NULL, "DL8_DL11 Mux"},
+	{"I058", NULL, "DL8_DL11 Mux"},
+	{"I059", NULL, "DL8_DL11 Mux"},
+	{"I060", NULL, "DL8_DL11 Mux"},
+	{"I061", NULL, "DL8_DL11 Mux"},
+	{"I062", NULL, "DL8_DL11 Mux"},
+	{"I063", NULL, "DL8_DL11 Mux"},
+	{"I064", NULL, "DL8_DL11 Mux"},
+	{"I065", NULL, "DL8_DL11 Mux"},
+	{"I066", NULL, "DL8_DL11 Mux"},
+	{"I067", NULL, "DL8_DL11 Mux"},
+	{"I068", NULL, "DL8_DL11 Mux"},
+	{"I069", NULL, "DL8_DL11 Mux"},
+
+	{"I070", NULL, "DL2"},
+	{"I071", NULL, "DL2"},
+
+	{"UL9", NULL, "O002"},
+	{"UL9", NULL, "O003"},
+	{"UL9", NULL, "O004"},
+	{"UL9", NULL, "O005"},
+	{"UL9", NULL, "O006"},
+	{"UL9", NULL, "O007"},
+	{"UL9", NULL, "O008"},
+	{"UL9", NULL, "O009"},
+	{"UL9", NULL, "O010"},
+	{"UL9", NULL, "O011"},
+	{"UL9", NULL, "O012"},
+	{"UL9", NULL, "O013"},
+	{"UL9", NULL, "O014"},
+	{"UL9", NULL, "O015"},
+	{"UL9", NULL, "O016"},
+	{"UL9", NULL, "O017"},
+	{"UL9", NULL, "O018"},
+	{"UL9", NULL, "O019"},
+	{"UL9", NULL, "O020"},
+	{"UL9", NULL, "O021"},
+	{"UL9", NULL, "O022"},
+	{"UL9", NULL, "O023"},
+	{"UL9", NULL, "O024"},
+	{"UL9", NULL, "O025"},
+	{"UL9", NULL, "O026"},
+	{"UL9", NULL, "O027"},
+	{"UL9", NULL, "O028"},
+	{"UL9", NULL, "O029"},
+	{"UL9", NULL, "O030"},
+	{"UL9", NULL, "O031"},
+	{"UL9", NULL, "O032"},
+	{"UL9", NULL, "O033"},
+
+	{"UL4", NULL, "O034"},
+	{"UL4", NULL, "O035"},
+
+	{"UL5", NULL, "O036"},
+	{"UL5", NULL, "O037"},
+
+	{"UL10", NULL, "O038"},
+	{"UL10", NULL, "O039"},
+	{"UL10", NULL, "O182"},
+	{"UL10", NULL, "O183"},
+
+	{"UL2", NULL, "O040"},
+	{"UL2", NULL, "O041"},
+	{"UL2", NULL, "O042"},
+	{"UL2", NULL, "O043"},
+	{"UL2", NULL, "O044"},
+	{"UL2", NULL, "O045"},
+	{"UL2", NULL, "O046"},
+	{"UL2", NULL, "O047"},
+
+	{"O004", "I000 Switch", "I000"},
+	{"O005", "I001 Switch", "I001"},
+
+	{"O006", "I000 Switch", "I000"},
+	{"O007", "I001 Switch", "I001"},
+
+	{"O010", "I022 Switch", "I022"},
+	{"O011", "I023 Switch", "I023"},
+	{"O012", "I024 Switch", "I024"},
+	{"O013", "I025 Switch", "I025"},
+	{"O014", "I026 Switch", "I026"},
+	{"O015", "I027 Switch", "I027"},
+	{"O016", "I028 Switch", "I028"},
+	{"O017", "I029 Switch", "I029"},
+
+	{"O010", "I046 Switch", "I046"},
+	{"O011", "I047 Switch", "I047"},
+	{"O012", "I048 Switch", "I048"},
+	{"O013", "I049 Switch", "I049"},
+	{"O014", "I050 Switch", "I050"},
+	{"O015", "I051 Switch", "I051"},
+	{"O016", "I052 Switch", "I052"},
+	{"O017", "I053 Switch", "I053"},
+	{"O002", "I022 Switch", "I022"},
+	{"O003", "I023 Switch", "I023"},
+	{"O004", "I024 Switch", "I024"},
+	{"O005", "I025 Switch", "I025"},
+	{"O006", "I026 Switch", "I026"},
+	{"O007", "I027 Switch", "I027"},
+	{"O008", "I028 Switch", "I028"},
+	{"O009", "I029 Switch", "I029"},
+	{"O010", "I030 Switch", "I030"},
+	{"O011", "I031 Switch", "I031"},
+	{"O012", "I032 Switch", "I032"},
+	{"O013", "I033 Switch", "I033"},
+	{"O014", "I034 Switch", "I034"},
+	{"O015", "I035 Switch", "I035"},
+	{"O016", "I036 Switch", "I036"},
+	{"O017", "I037 Switch", "I037"},
+	{"O018", "I038 Switch", "I038"},
+	{"O019", "I039 Switch", "I039"},
+	{"O020", "I040 Switch", "I040"},
+	{"O021", "I041 Switch", "I041"},
+	{"O022", "I042 Switch", "I042"},
+	{"O023", "I043 Switch", "I043"},
+	{"O024", "I044 Switch", "I044"},
+	{"O025", "I045 Switch", "I045"},
+	{"O026", "I046 Switch", "I046"},
+	{"O027", "I047 Switch", "I047"},
+	{"O028", "I048 Switch", "I048"},
+	{"O029", "I049 Switch", "I049"},
+	{"O030", "I050 Switch", "I050"},
+	{"O031", "I051 Switch", "I051"},
+	{"O032", "I052 Switch", "I052"},
+	{"O033", "I053 Switch", "I053"},
+
+	{"O002", "I000 Switch", "I000"},
+	{"O003", "I001 Switch", "I001"},
+	{"O002", "I020 Switch", "I020"},
+	{"O003", "I021 Switch", "I021"},
+	{"O002", "I070 Switch", "I070"},
+	{"O003", "I071 Switch", "I071"},
+
+	{"O034", "I000 Switch", "I000"},
+	{"O035", "I001 Switch", "I001"},
+	{"O034", "I002 Switch", "I002"},
+	{"O035", "I003 Switch", "I003"},
+	{"O034", "I012 Switch", "I012"},
+	{"O035", "I013 Switch", "I013"},
+	{"O034", "I020 Switch", "I020"},
+	{"O035", "I021 Switch", "I021"},
+	{"O034", "I070 Switch", "I070"},
+	{"O035", "I071 Switch", "I071"},
+	{"O034", "I072 Switch", "I072"},
+	{"O035", "I073 Switch", "I073"},
+
+	{"O036", "I000 Switch", "I000"},
+	{"O037", "I001 Switch", "I001"},
+	{"O036", "I012 Switch", "I012"},
+	{"O037", "I013 Switch", "I013"},
+	{"O036", "I020 Switch", "I020"},
+	{"O037", "I021 Switch", "I021"},
+	{"O036", "I070 Switch", "I070"},
+	{"O037", "I071 Switch", "I071"},
+	{"O036", "I168 Switch", "I168"},
+	{"O037", "I169 Switch", "I169"},
+
+	{"O038", "I022 Switch", "I022"},
+	{"O039", "I023 Switch", "I023"},
+	{"O182", "I024 Switch", "I024"},
+	{"O183", "I025 Switch", "I025"},
+
+	{"O040", "I022 Switch", "I022"},
+	{"O041", "I023 Switch", "I023"},
+	{"O042", "I024 Switch", "I024"},
+	{"O043", "I025 Switch", "I025"},
+	{"O044", "I026 Switch", "I026"},
+	{"O045", "I027 Switch", "I027"},
+	{"O046", "I028 Switch", "I028"},
+	{"O047", "I029 Switch", "I029"},
+
+	{"O040", "I002 Switch", "I002"},
+	{"O041", "I003 Switch", "I003"},
+	{"O002", "I012 Switch", "I012"},
+	{"O003", "I013 Switch", "I013"},
+	{"O004", "I014 Switch", "I014"},
+	{"O005", "I015 Switch", "I015"},
+	{"O006", "I016 Switch", "I016"},
+	{"O007", "I017 Switch", "I017"},
+	{"O008", "I018 Switch", "I018"},
+	{"O009", "I019 Switch", "I019"},
+
+	{"O040", "I012 Switch", "I012"},
+	{"O041", "I013 Switch", "I013"},
+	{"O042", "I014 Switch", "I014"},
+	{"O043", "I015 Switch", "I015"},
+	{"O044", "I016 Switch", "I016"},
+	{"O045", "I017 Switch", "I017"},
+	{"O046", "I018 Switch", "I018"},
+	{"O047", "I019 Switch", "I019"},
+
+	{"O002", "I072 Switch", "I072"},
+	{"O003", "I073 Switch", "I073"},
+	{"O004", "I074 Switch", "I074"},
+	{"O005", "I075 Switch", "I075"},
+	{"O006", "I076 Switch", "I076"},
+	{"O007", "I077 Switch", "I077"},
+	{"O008", "I078 Switch", "I078"},
+	{"O009", "I079 Switch", "I079"},
+
+	{"O010", "I072 Switch", "I072"},
+	{"O011", "I073 Switch", "I073"},
+	{"O012", "I074 Switch", "I074"},
+	{"O013", "I075 Switch", "I075"},
+	{"O014", "I076 Switch", "I076"},
+	{"O015", "I077 Switch", "I077"},
+	{"O016", "I078 Switch", "I078"},
+	{"O017", "I079 Switch", "I079"},
+	{"O018", "I080 Switch", "I080"},
+	{"O019", "I081 Switch", "I081"},
+	{"O020", "I082 Switch", "I082"},
+	{"O021", "I083 Switch", "I083"},
+	{"O022", "I084 Switch", "I084"},
+	{"O023", "I085 Switch", "I085"},
+	{"O024", "I086 Switch", "I086"},
+	{"O025", "I087 Switch", "I087"},
+	{"O026", "I088 Switch", "I088"},
+	{"O027", "I089 Switch", "I089"},
+	{"O028", "I090 Switch", "I090"},
+	{"O029", "I091 Switch", "I091"},
+	{"O030", "I092 Switch", "I092"},
+	{"O031", "I093 Switch", "I093"},
+	{"O032", "I094 Switch", "I094"},
+	{"O033", "I095 Switch", "I095"},
+
+	{"O002", "I168 Switch", "I168"},
+	{"O003", "I169 Switch", "I169"},
+	{"O004", "I170 Switch", "I170"},
+	{"O005", "I171 Switch", "I171"},
+
+	{"O034", "I168 Switch", "I168"},
+	{"O035", "I168 Switch", "I168"},
+	{"O035", "I169 Switch", "I169"},
+
+	{"O034", "I170 Switch", "I170"},
+	{"O035", "I170 Switch", "I170"},
+	{"O035", "I171 Switch", "I171"},
+
+	{"O040", "I168 Switch", "I168"},
+	{"O041", "I169 Switch", "I169"},
+	{"O042", "I170 Switch", "I170"},
+	{"O043", "I171 Switch", "I171"},
+};
+
+static const char * const mt8195_afe_1x_en_sel_text[] = {
+	"a1sys_a2sys", "a3sys", "a4sys",
+};
+
+static const unsigned int mt8195_afe_1x_en_sel_values[] = {
+	0, 1, 2,
+};
+
+static int mt8195_memif_1x_en_sel_put(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_dai_memif_priv *memif_priv;
+	unsigned int dai_id = kcontrol->id.device;
+	long val = ucontrol->value.integer.value[0];
+	int ret = 0;
+
+	memif_priv = afe_priv->dai_priv[dai_id];
+
+	if (val == memif_priv->asys_timing_sel)
+		return 0;
+
+	ret = snd_soc_put_enum_double(kcontrol, ucontrol);
+
+	memif_priv->asys_timing_sel = val;
+
+	return ret;
+}
+
+static int mt8195_asys_irq_1x_en_sel_put(struct snd_kcontrol *kcontrol,
+					 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	unsigned int id = kcontrol->id.device;
+	long val = ucontrol->value.integer.value[0];
+	int ret = 0;
+
+	if (val == afe_priv->irq_priv[id].asys_timing_sel)
+		return 0;
+
+	ret = snd_soc_put_enum_double(kcontrol, ucontrol);
+
+	afe_priv->irq_priv[id].asys_timing_sel = val;
+
+	return ret;
+}
+
+static SOC_VALUE_ENUM_SINGLE_DECL(dl2_1x_en_sel_enum,
+			A3_A4_TIMING_SEL1, 18, 0x3,
+			mt8195_afe_1x_en_sel_text,
+			mt8195_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(dl3_1x_en_sel_enum,
+			A3_A4_TIMING_SEL1, 20, 0x3,
+			mt8195_afe_1x_en_sel_text,
+			mt8195_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(dl6_1x_en_sel_enum,
+			A3_A4_TIMING_SEL1, 22, 0x3,
+			mt8195_afe_1x_en_sel_text,
+			mt8195_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(dl7_1x_en_sel_enum,
+			A3_A4_TIMING_SEL1, 24, 0x3,
+			mt8195_afe_1x_en_sel_text,
+			mt8195_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(dl8_1x_en_sel_enum,
+			A3_A4_TIMING_SEL1, 26, 0x3,
+			mt8195_afe_1x_en_sel_text,
+			mt8195_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(dl10_1x_en_sel_enum,
+			A3_A4_TIMING_SEL1, 28, 0x3,
+			mt8195_afe_1x_en_sel_text,
+			mt8195_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(dl11_1x_en_sel_enum,
+			A3_A4_TIMING_SEL1, 30, 0x3,
+			mt8195_afe_1x_en_sel_text,
+			mt8195_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul1_1x_en_sel_enum,
+			A3_A4_TIMING_SEL1, 0, 0x3,
+			mt8195_afe_1x_en_sel_text,
+			mt8195_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul2_1x_en_sel_enum,
+			A3_A4_TIMING_SEL1, 2, 0x3,
+			mt8195_afe_1x_en_sel_text,
+			mt8195_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul3_1x_en_sel_enum,
+			A3_A4_TIMING_SEL1, 4, 0x3,
+			mt8195_afe_1x_en_sel_text,
+			mt8195_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul4_1x_en_sel_enum,
+			A3_A4_TIMING_SEL1, 6, 0x3,
+			mt8195_afe_1x_en_sel_text,
+			mt8195_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul5_1x_en_sel_enum,
+			A3_A4_TIMING_SEL1, 8, 0x3,
+			mt8195_afe_1x_en_sel_text,
+			mt8195_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul6_1x_en_sel_enum,
+			A3_A4_TIMING_SEL1, 10, 0x3,
+			mt8195_afe_1x_en_sel_text,
+			mt8195_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul8_1x_en_sel_enum,
+			A3_A4_TIMING_SEL1, 12, 0x3,
+			mt8195_afe_1x_en_sel_text,
+			mt8195_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul9_1x_en_sel_enum,
+			A3_A4_TIMING_SEL1, 14, 0x3,
+			mt8195_afe_1x_en_sel_text,
+			mt8195_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul10_1x_en_sel_enum,
+			A3_A4_TIMING_SEL1, 16, 0x3,
+			mt8195_afe_1x_en_sel_text,
+			mt8195_afe_1x_en_sel_values);
+
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq1_1x_en_sel_enum,
+			A3_A4_TIMING_SEL6, 0, 0x3,
+			mt8195_afe_1x_en_sel_text,
+			mt8195_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq2_1x_en_sel_enum,
+			A3_A4_TIMING_SEL6, 2, 0x3,
+			mt8195_afe_1x_en_sel_text,
+			mt8195_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq3_1x_en_sel_enum,
+			A3_A4_TIMING_SEL6, 4, 0x3,
+			mt8195_afe_1x_en_sel_text,
+			mt8195_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq4_1x_en_sel_enum,
+			A3_A4_TIMING_SEL6, 6, 0x3,
+			mt8195_afe_1x_en_sel_text,
+			mt8195_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq5_1x_en_sel_enum,
+			A3_A4_TIMING_SEL6, 8, 0x3,
+			mt8195_afe_1x_en_sel_text,
+			mt8195_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq6_1x_en_sel_enum,
+			A3_A4_TIMING_SEL6, 10, 0x3,
+			mt8195_afe_1x_en_sel_text,
+			mt8195_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq7_1x_en_sel_enum,
+			A3_A4_TIMING_SEL6, 12, 0x3,
+			mt8195_afe_1x_en_sel_text,
+			mt8195_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq8_1x_en_sel_enum,
+			A3_A4_TIMING_SEL6, 14, 0x3,
+			mt8195_afe_1x_en_sel_text,
+			mt8195_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq9_1x_en_sel_enum,
+			A3_A4_TIMING_SEL6, 16, 0x3,
+			mt8195_afe_1x_en_sel_text,
+			mt8195_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq10_1x_en_sel_enum,
+			A3_A4_TIMING_SEL6, 18, 0x3,
+			mt8195_afe_1x_en_sel_text,
+			mt8195_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq11_1x_en_sel_enum,
+			A3_A4_TIMING_SEL6, 20, 0x3,
+			mt8195_afe_1x_en_sel_text,
+			mt8195_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq12_1x_en_sel_enum,
+			A3_A4_TIMING_SEL6, 22, 0x3,
+			mt8195_afe_1x_en_sel_text,
+			mt8195_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq13_1x_en_sel_enum,
+			A3_A4_TIMING_SEL6, 24, 0x3,
+			mt8195_afe_1x_en_sel_text,
+			mt8195_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq14_1x_en_sel_enum,
+			A3_A4_TIMING_SEL6, 26, 0x3,
+			mt8195_afe_1x_en_sel_text,
+			mt8195_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq15_1x_en_sel_enum,
+			A3_A4_TIMING_SEL6, 28, 0x3,
+			mt8195_afe_1x_en_sel_text,
+			mt8195_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq16_1x_en_sel_enum,
+			A3_A4_TIMING_SEL6, 30, 0x3,
+			mt8195_afe_1x_en_sel_text,
+			mt8195_afe_1x_en_sel_values);
+
+static const struct snd_kcontrol_new mt8195_memif_controls[] = {
+	MT8195_SOC_ENUM_EXT("dl2_1x_en_sel",
+			    dl2_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8195_memif_1x_en_sel_put,
+			    MT8195_AFE_MEMIF_DL2),
+	MT8195_SOC_ENUM_EXT("dl3_1x_en_sel",
+			    dl3_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8195_memif_1x_en_sel_put,
+			    MT8195_AFE_MEMIF_DL3),
+	MT8195_SOC_ENUM_EXT("dl6_1x_en_sel",
+			    dl6_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8195_memif_1x_en_sel_put,
+			    MT8195_AFE_MEMIF_DL6),
+	MT8195_SOC_ENUM_EXT("dl7_1x_en_sel",
+			    dl7_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8195_memif_1x_en_sel_put,
+			    MT8195_AFE_MEMIF_DL7),
+	MT8195_SOC_ENUM_EXT("dl8_1x_en_sel",
+			    dl8_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8195_memif_1x_en_sel_put,
+			    MT8195_AFE_MEMIF_DL8),
+	MT8195_SOC_ENUM_EXT("dl10_1x_en_sel",
+			    dl10_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8195_memif_1x_en_sel_put,
+			    MT8195_AFE_MEMIF_DL10),
+	MT8195_SOC_ENUM_EXT("dl11_1x_en_sel",
+			    dl11_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8195_memif_1x_en_sel_put,
+			    MT8195_AFE_MEMIF_DL11),
+	MT8195_SOC_ENUM_EXT("ul1_1x_en_sel",
+			    ul1_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8195_memif_1x_en_sel_put,
+			    MT8195_AFE_MEMIF_UL1),
+	MT8195_SOC_ENUM_EXT("ul2_1x_en_sel",
+			    ul2_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8195_memif_1x_en_sel_put,
+			    MT8195_AFE_MEMIF_UL2),
+	MT8195_SOC_ENUM_EXT("ul3_1x_en_sel",
+			    ul3_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8195_memif_1x_en_sel_put,
+			    MT8195_AFE_MEMIF_UL3),
+	MT8195_SOC_ENUM_EXT("ul4_1x_en_sel",
+			    ul4_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8195_memif_1x_en_sel_put,
+			    MT8195_AFE_MEMIF_UL4),
+	MT8195_SOC_ENUM_EXT("ul5_1x_en_sel",
+			    ul5_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8195_memif_1x_en_sel_put,
+			    MT8195_AFE_MEMIF_UL5),
+	MT8195_SOC_ENUM_EXT("ul6_1x_en_sel",
+			    ul6_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8195_memif_1x_en_sel_put,
+			    MT8195_AFE_MEMIF_UL6),
+	MT8195_SOC_ENUM_EXT("ul8_1x_en_sel",
+			    ul8_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8195_memif_1x_en_sel_put,
+			    MT8195_AFE_MEMIF_UL8),
+	MT8195_SOC_ENUM_EXT("ul9_1x_en_sel",
+			    ul9_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8195_memif_1x_en_sel_put,
+			    MT8195_AFE_MEMIF_UL9),
+	MT8195_SOC_ENUM_EXT("ul10_1x_en_sel",
+			    ul10_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8195_memif_1x_en_sel_put,
+			    MT8195_AFE_MEMIF_UL10),
+	MT8195_SOC_ENUM_EXT("asys_irq1_1x_en_sel",
+			    asys_irq1_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8195_asys_irq_1x_en_sel_put,
+			    MT8195_AFE_IRQ_13),
+	MT8195_SOC_ENUM_EXT("asys_irq2_1x_en_sel",
+			    asys_irq2_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8195_asys_irq_1x_en_sel_put,
+			    MT8195_AFE_IRQ_14),
+	MT8195_SOC_ENUM_EXT("asys_irq3_1x_en_sel",
+			    asys_irq3_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8195_asys_irq_1x_en_sel_put,
+			    MT8195_AFE_IRQ_15),
+	MT8195_SOC_ENUM_EXT("asys_irq4_1x_en_sel",
+			    asys_irq4_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8195_asys_irq_1x_en_sel_put,
+			    MT8195_AFE_IRQ_16),
+	MT8195_SOC_ENUM_EXT("asys_irq5_1x_en_sel",
+			    asys_irq5_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8195_asys_irq_1x_en_sel_put,
+			    MT8195_AFE_IRQ_17),
+	MT8195_SOC_ENUM_EXT("asys_irq6_1x_en_sel",
+			    asys_irq6_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8195_asys_irq_1x_en_sel_put,
+			    MT8195_AFE_IRQ_18),
+	MT8195_SOC_ENUM_EXT("asys_irq7_1x_en_sel",
+			    asys_irq7_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8195_asys_irq_1x_en_sel_put,
+			    MT8195_AFE_IRQ_19),
+	MT8195_SOC_ENUM_EXT("asys_irq8_1x_en_sel",
+			    asys_irq8_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8195_asys_irq_1x_en_sel_put,
+			    MT8195_AFE_IRQ_20),
+	MT8195_SOC_ENUM_EXT("asys_irq9_1x_en_sel",
+			    asys_irq9_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8195_asys_irq_1x_en_sel_put,
+			    MT8195_AFE_IRQ_21),
+	MT8195_SOC_ENUM_EXT("asys_irq10_1x_en_sel",
+			    asys_irq10_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8195_asys_irq_1x_en_sel_put,
+			    MT8195_AFE_IRQ_22),
+	MT8195_SOC_ENUM_EXT("asys_irq11_1x_en_sel",
+			    asys_irq11_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8195_asys_irq_1x_en_sel_put,
+			    MT8195_AFE_IRQ_23),
+	MT8195_SOC_ENUM_EXT("asys_irq12_1x_en_sel",
+			    asys_irq12_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8195_asys_irq_1x_en_sel_put,
+			    MT8195_AFE_IRQ_24),
+	MT8195_SOC_ENUM_EXT("asys_irq13_1x_en_sel",
+			    asys_irq13_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8195_asys_irq_1x_en_sel_put,
+			    MT8195_AFE_IRQ_25),
+	MT8195_SOC_ENUM_EXT("asys_irq14_1x_en_sel",
+			    asys_irq14_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8195_asys_irq_1x_en_sel_put,
+			    MT8195_AFE_IRQ_26),
+	MT8195_SOC_ENUM_EXT("asys_irq15_1x_en_sel",
+			    asys_irq15_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8195_asys_irq_1x_en_sel_put,
+			    MT8195_AFE_IRQ_27),
+	MT8195_SOC_ENUM_EXT("asys_irq16_1x_en_sel",
+			    asys_irq16_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8195_asys_irq_1x_en_sel_put,
+			    MT8195_AFE_IRQ_28),
+};
+
+static const struct snd_soc_component_driver mt8195_afe_pcm_dai_component = {
+	.name = "mt8195-afe-pcm-dai",
+};
+
+static const struct mtk_base_memif_data memif_data[MT8195_AFE_MEMIF_NUM] = {
+	[MT8195_AFE_MEMIF_DL2] = {
+		.name = "DL2",
+		.id = MT8195_AFE_MEMIF_DL2,
+		.reg_ofs_base = AFE_DL2_BASE,
+		.reg_ofs_cur = AFE_DL2_CUR,
+		.reg_ofs_end = AFE_DL2_END,
+		.fs_reg = AFE_MEMIF_AGENT_FS_CON0,
+		.fs_shift = 10,
+		.fs_maskbit = 0x1f,
+		.mono_reg = -1,
+		.mono_shift = 0,
+		.int_odd_flag_reg = -1,
+		.int_odd_flag_shift = 0,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = 18,
+		.hd_reg = AFE_DL2_CON0,
+		.hd_shift = 5,
+		.agent_disable_reg = AUDIO_TOP_CON5,
+		.agent_disable_shift = 18,
+		.ch_num_reg = AFE_DL2_CON0,
+		.ch_num_shift = 0,
+		.ch_num_maskbit = 0x1f,
+		.msb_reg = AFE_NORMAL_BASE_ADR_MSB,
+		.msb_shift = 18,
+		.msb_end_reg = AFE_NORMAL_END_ADR_MSB,
+		.msb_end_shift = 18,
+	},
+	[MT8195_AFE_MEMIF_DL3] = {
+		.name = "DL3",
+		.id = MT8195_AFE_MEMIF_DL3,
+		.reg_ofs_base = AFE_DL3_BASE,
+		.reg_ofs_cur = AFE_DL3_CUR,
+		.reg_ofs_end = AFE_DL3_END,
+		.fs_reg = AFE_MEMIF_AGENT_FS_CON0,
+		.fs_shift = 15,
+		.fs_maskbit = 0x1f,
+		.mono_reg = -1,
+		.mono_shift = 0,
+		.int_odd_flag_reg = -1,
+		.int_odd_flag_shift = 0,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = 19,
+		.hd_reg = AFE_DL3_CON0,
+		.hd_shift = 5,
+		.agent_disable_reg = AUDIO_TOP_CON5,
+		.agent_disable_shift = 19,
+		.ch_num_reg = AFE_DL3_CON0,
+		.ch_num_shift = 0,
+		.ch_num_maskbit = 0x1f,
+		.msb_reg = AFE_NORMAL_BASE_ADR_MSB,
+		.msb_shift = 19,
+		.msb_end_reg = AFE_NORMAL_END_ADR_MSB,
+		.msb_end_shift = 19,
+	},
+	[MT8195_AFE_MEMIF_DL6] = {
+		.name = "DL6",
+		.id = MT8195_AFE_MEMIF_DL6,
+		.reg_ofs_base = AFE_DL6_BASE,
+		.reg_ofs_cur = AFE_DL6_CUR,
+		.reg_ofs_end = AFE_DL6_END,
+		.fs_reg = AFE_MEMIF_AGENT_FS_CON1,
+		.fs_shift = 0,
+		.fs_maskbit = 0x1f,
+		.mono_reg = -1,
+		.mono_shift = 0,
+		.int_odd_flag_reg = -1,
+		.int_odd_flag_shift = 0,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = 22,
+		.hd_reg = AFE_DL6_CON0,
+		.hd_shift = 5,
+		.agent_disable_reg = AUDIO_TOP_CON5,
+		.agent_disable_shift = 22,
+		.ch_num_reg = AFE_DL6_CON0,
+		.ch_num_shift = 0,
+		.ch_num_maskbit = 0x1f,
+		.msb_reg = AFE_NORMAL_BASE_ADR_MSB,
+		.msb_shift = 22,
+		.msb_end_reg = AFE_NORMAL_END_ADR_MSB,
+		.msb_end_shift = 22,
+	},
+	[MT8195_AFE_MEMIF_DL7] = {
+		.name = "DL7",
+		.id = MT8195_AFE_MEMIF_DL7,
+		.reg_ofs_base = AFE_DL7_BASE,
+		.reg_ofs_cur = AFE_DL7_CUR,
+		.reg_ofs_end = AFE_DL7_END,
+		.fs_reg = -1,
+		.fs_shift = 0,
+		.fs_maskbit = 0,
+		.mono_reg = -1,
+		.mono_shift = 0,
+		.int_odd_flag_reg = -1,
+		.int_odd_flag_shift = 0,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = 23,
+		.hd_reg = AFE_DL7_CON0,
+		.hd_shift = 5,
+		.agent_disable_reg = AUDIO_TOP_CON5,
+		.agent_disable_shift = 23,
+		.ch_num_reg = AFE_DL7_CON0,
+		.ch_num_shift = 0,
+		.ch_num_maskbit = 0x1f,
+		.msb_reg = AFE_NORMAL_BASE_ADR_MSB,
+		.msb_shift = 23,
+		.msb_end_reg = AFE_NORMAL_END_ADR_MSB,
+		.msb_end_shift = 23,
+	},
+	[MT8195_AFE_MEMIF_DL8] = {
+		.name = "DL8",
+		.id = MT8195_AFE_MEMIF_DL8,
+		.reg_ofs_base = AFE_DL8_BASE,
+		.reg_ofs_cur = AFE_DL8_CUR,
+		.reg_ofs_end = AFE_DL8_END,
+		.fs_reg = AFE_MEMIF_AGENT_FS_CON1,
+		.fs_shift = 10,
+		.fs_maskbit = 0x1f,
+		.mono_reg = -1,
+		.mono_shift = 0,
+		.int_odd_flag_reg = -1,
+		.int_odd_flag_shift = 0,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = 24,
+		.hd_reg = AFE_DL8_CON0,
+		.hd_shift = 6,
+		.agent_disable_reg = -1,
+		.agent_disable_shift = 0,
+		.ch_num_reg = AFE_DL8_CON0,
+		.ch_num_shift = 0,
+		.ch_num_maskbit = 0x3f,
+		.msb_reg = AFE_NORMAL_BASE_ADR_MSB,
+		.msb_shift = 24,
+		.msb_end_reg = AFE_NORMAL_END_ADR_MSB,
+		.msb_end_shift = 24,
+	},
+	[MT8195_AFE_MEMIF_DL10] = {
+		.name = "DL10",
+		.id = MT8195_AFE_MEMIF_DL10,
+		.reg_ofs_base = AFE_DL10_BASE,
+		.reg_ofs_cur = AFE_DL10_CUR,
+		.reg_ofs_end = AFE_DL10_END,
+		.fs_reg = AFE_MEMIF_AGENT_FS_CON1,
+		.fs_shift = 20,
+		.fs_maskbit = 0x1f,
+		.mono_reg = -1,
+		.mono_shift = 0,
+		.int_odd_flag_reg = -1,
+		.int_odd_flag_shift = 0,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = 26,
+		.hd_reg = AFE_DL10_CON0,
+		.hd_shift = 5,
+		.agent_disable_reg = -1,
+		.agent_disable_shift = 0,
+		.ch_num_reg = AFE_DL10_CON0,
+		.ch_num_shift = 0,
+		.ch_num_maskbit = 0x1f,
+		.msb_reg = AFE_NORMAL_BASE_ADR_MSB,
+		.msb_shift = 26,
+		.msb_end_reg = AFE_NORMAL_END_ADR_MSB,
+		.msb_end_shift = 26,
+	},
+	[MT8195_AFE_MEMIF_DL11] = {
+		.name = "DL11",
+		.id = MT8195_AFE_MEMIF_DL11,
+		.reg_ofs_base = AFE_DL11_BASE,
+		.reg_ofs_cur = AFE_DL11_CUR,
+		.reg_ofs_end = AFE_DL11_END,
+		.fs_reg = AFE_MEMIF_AGENT_FS_CON1,
+		.fs_shift = 25,
+		.fs_maskbit = 0x1f,
+		.mono_reg = -1,
+		.mono_shift = 0,
+		.int_odd_flag_reg = -1,
+		.int_odd_flag_shift = 0,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = 27,
+		.hd_reg = AFE_DL11_CON0,
+		.hd_shift = 7,
+		.agent_disable_reg = AUDIO_TOP_CON5,
+		.agent_disable_shift = 27,
+		.ch_num_reg = AFE_DL11_CON0,
+		.ch_num_shift = 0,
+		.ch_num_maskbit = 0x7f,
+		.msb_reg = AFE_NORMAL_BASE_ADR_MSB,
+		.msb_shift = 27,
+		.msb_end_reg = AFE_NORMAL_END_ADR_MSB,
+		.msb_end_shift = 27,
+	},
+	[MT8195_AFE_MEMIF_UL1] = {
+		.name = "UL1",
+		.id = MT8195_AFE_MEMIF_UL1,
+		.reg_ofs_base = AFE_UL1_BASE,
+		.reg_ofs_cur = AFE_UL1_CUR,
+		.reg_ofs_end = AFE_UL1_END,
+		.fs_reg = -1,
+		.fs_shift = 0,
+		.fs_maskbit = 0,
+		.mono_reg = AFE_UL1_CON0,
+		.mono_shift = 1,
+		.int_odd_flag_reg = AFE_UL1_CON0,
+		.int_odd_flag_shift = 0,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = 1,
+		.hd_reg = AFE_UL1_CON0,
+		.hd_shift = 5,
+		.agent_disable_reg = AUDIO_TOP_CON5,
+		.agent_disable_shift = 0,
+		.ch_num_reg = -1,
+		.ch_num_shift = 0,
+		.ch_num_maskbit = 0,
+		.msb_reg = AFE_NORMAL_BASE_ADR_MSB,
+		.msb_shift = 0,
+		.msb_end_reg = AFE_NORMAL_END_ADR_MSB,
+		.msb_end_shift = 0,
+	},
+	[MT8195_AFE_MEMIF_UL2] = {
+		.name = "UL2",
+		.id = MT8195_AFE_MEMIF_UL2,
+		.reg_ofs_base = AFE_UL2_BASE,
+		.reg_ofs_cur = AFE_UL2_CUR,
+		.reg_ofs_end = AFE_UL2_END,
+		.fs_reg = AFE_MEMIF_AGENT_FS_CON2,
+		.fs_shift = 5,
+		.fs_maskbit = 0x1f,
+		.mono_reg = AFE_UL2_CON0,
+		.mono_shift = 1,
+		.int_odd_flag_reg = AFE_UL2_CON0,
+		.int_odd_flag_shift = 0,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = 2,
+		.hd_reg = AFE_UL2_CON0,
+		.hd_shift = 5,
+		.agent_disable_reg = AUDIO_TOP_CON5,
+		.agent_disable_shift = 1,
+		.ch_num_reg = -1,
+		.ch_num_shift = 0,
+		.ch_num_maskbit = 0,
+		.msb_reg = AFE_NORMAL_BASE_ADR_MSB,
+		.msb_shift = 1,
+		.msb_end_reg = AFE_NORMAL_END_ADR_MSB,
+		.msb_end_shift = 1,
+	},
+	[MT8195_AFE_MEMIF_UL3] = {
+		.name = "UL3",
+		.id = MT8195_AFE_MEMIF_UL3,
+		.reg_ofs_base = AFE_UL3_BASE,
+		.reg_ofs_cur = AFE_UL3_CUR,
+		.reg_ofs_end = AFE_UL3_END,
+		.fs_reg = AFE_MEMIF_AGENT_FS_CON2,
+		.fs_shift = 10,
+		.fs_maskbit = 0x1f,
+		.mono_reg = AFE_UL3_CON0,
+		.mono_shift = 1,
+		.int_odd_flag_reg = AFE_UL3_CON0,
+		.int_odd_flag_shift = 0,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = 3,
+		.hd_reg = AFE_UL3_CON0,
+		.hd_shift = 5,
+		.agent_disable_reg = AUDIO_TOP_CON5,
+		.agent_disable_shift = 2,
+		.ch_num_reg = -1,
+		.ch_num_shift = 0,
+		.ch_num_maskbit = 0,
+		.msb_reg = AFE_NORMAL_BASE_ADR_MSB,
+		.msb_shift = 2,
+		.msb_end_reg = AFE_NORMAL_END_ADR_MSB,
+		.msb_end_shift = 2,
+	},
+	[MT8195_AFE_MEMIF_UL4] = {
+		.name = "UL4",
+		.id = MT8195_AFE_MEMIF_UL4,
+		.reg_ofs_base = AFE_UL4_BASE,
+		.reg_ofs_cur = AFE_UL4_CUR,
+		.reg_ofs_end = AFE_UL4_END,
+		.fs_reg = AFE_MEMIF_AGENT_FS_CON2,
+		.fs_shift = 15,
+		.fs_maskbit = 0x1f,
+		.mono_reg = AFE_UL4_CON0,
+		.mono_shift = 1,
+		.int_odd_flag_reg = AFE_UL4_CON0,
+		.int_odd_flag_shift = 0,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = 4,
+		.hd_reg = AFE_UL4_CON0,
+		.hd_shift = 5,
+		.agent_disable_reg = AUDIO_TOP_CON5,
+		.agent_disable_shift = 3,
+		.ch_num_reg = -1,
+		.ch_num_shift = 0,
+		.ch_num_maskbit = 0,
+		.msb_reg = AFE_NORMAL_BASE_ADR_MSB,
+		.msb_shift = 3,
+		.msb_end_reg = AFE_NORMAL_END_ADR_MSB,
+		.msb_end_shift = 3,
+	},
+	[MT8195_AFE_MEMIF_UL5] = {
+		.name = "UL5",
+		.id = MT8195_AFE_MEMIF_UL5,
+		.reg_ofs_base = AFE_UL5_BASE,
+		.reg_ofs_cur = AFE_UL5_CUR,
+		.reg_ofs_end = AFE_UL5_END,
+		.fs_reg = AFE_MEMIF_AGENT_FS_CON2,
+		.fs_shift = 20,
+		.fs_maskbit = 0x1f,
+		.mono_reg = AFE_UL5_CON0,
+		.mono_shift = 1,
+		.int_odd_flag_reg = AFE_UL5_CON0,
+		.int_odd_flag_shift = 0,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = 5,
+		.hd_reg = AFE_UL5_CON0,
+		.hd_shift = 5,
+		.agent_disable_reg = AUDIO_TOP_CON5,
+		.agent_disable_shift = 4,
+		.ch_num_reg = -1,
+		.ch_num_shift = 0,
+		.ch_num_maskbit = 0,
+		.msb_reg = AFE_NORMAL_BASE_ADR_MSB,
+		.msb_shift = 4,
+		.msb_end_reg = AFE_NORMAL_END_ADR_MSB,
+		.msb_end_shift = 4,
+	},
+	[MT8195_AFE_MEMIF_UL6] = {
+		.name = "UL6",
+		.id = MT8195_AFE_MEMIF_UL6,
+		.reg_ofs_base = AFE_UL6_BASE,
+		.reg_ofs_cur = AFE_UL6_CUR,
+		.reg_ofs_end = AFE_UL6_END,
+		.fs_reg = -1,
+		.fs_shift = 0,
+		.fs_maskbit = 0,
+		.mono_reg = AFE_UL6_CON0,
+		.mono_shift = 1,
+		.int_odd_flag_reg = AFE_UL6_CON0,
+		.int_odd_flag_shift = 0,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = 6,
+		.hd_reg = AFE_UL6_CON0,
+		.hd_shift = 5,
+		.agent_disable_reg = AUDIO_TOP_CON5,
+		.agent_disable_shift = 5,
+		.ch_num_reg = -1,
+		.ch_num_shift = 0,
+		.ch_num_maskbit = 0,
+		.msb_reg = AFE_NORMAL_BASE_ADR_MSB,
+		.msb_shift = 5,
+		.msb_end_reg = AFE_NORMAL_END_ADR_MSB,
+		.msb_end_shift = 5,
+	},
+	[MT8195_AFE_MEMIF_UL8] = {
+		.name = "UL8",
+		.id = MT8195_AFE_MEMIF_UL8,
+		.reg_ofs_base = AFE_UL8_BASE,
+		.reg_ofs_cur = AFE_UL8_CUR,
+		.reg_ofs_end = AFE_UL8_END,
+		.fs_reg = AFE_MEMIF_AGENT_FS_CON3,
+		.fs_shift = 5,
+		.fs_maskbit = 0x1f,
+		.mono_reg = AFE_UL8_CON0,
+		.mono_shift = 1,
+		.int_odd_flag_reg = AFE_UL8_CON0,
+		.int_odd_flag_shift = 0,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = 8,
+		.hd_reg = AFE_UL8_CON0,
+		.hd_shift = 5,
+		.agent_disable_reg = AUDIO_TOP_CON5,
+		.agent_disable_shift = 7,
+		.ch_num_reg = -1,
+		.ch_num_shift = 0,
+		.ch_num_maskbit = 0,
+		.msb_reg = AFE_NORMAL_BASE_ADR_MSB,
+		.msb_shift = 7,
+		.msb_end_reg = AFE_NORMAL_END_ADR_MSB,
+		.msb_end_shift = 7,
+	},
+	[MT8195_AFE_MEMIF_UL9] = {
+		.name = "UL9",
+		.id = MT8195_AFE_MEMIF_UL9,
+		.reg_ofs_base = AFE_UL9_BASE,
+		.reg_ofs_cur = AFE_UL9_CUR,
+		.reg_ofs_end = AFE_UL9_END,
+		.fs_reg = AFE_MEMIF_AGENT_FS_CON3,
+		.fs_shift = 10,
+		.fs_maskbit = 0x1f,
+		.mono_reg = AFE_UL9_CON0,
+		.mono_shift = 1,
+		.int_odd_flag_reg = AFE_UL9_CON0,
+		.int_odd_flag_shift = 0,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = 9,
+		.hd_reg = AFE_UL9_CON0,
+		.hd_shift = 5,
+		.agent_disable_reg = AUDIO_TOP_CON5,
+		.agent_disable_shift = 8,
+		.ch_num_reg = -1,
+		.ch_num_shift = 0,
+		.ch_num_maskbit = 0,
+		.msb_reg = AFE_NORMAL_BASE_ADR_MSB,
+		.msb_shift = 8,
+		.msb_end_reg = AFE_NORMAL_END_ADR_MSB,
+		.msb_end_shift = 8,
+	},
+	[MT8195_AFE_MEMIF_UL10] = {
+		.name = "UL10",
+		.id = MT8195_AFE_MEMIF_UL10,
+		.reg_ofs_base = AFE_UL10_BASE,
+		.reg_ofs_cur = AFE_UL10_CUR,
+		.reg_ofs_end = AFE_UL10_END,
+		.fs_reg = AFE_MEMIF_AGENT_FS_CON3,
+		.fs_shift = 15,
+		.fs_maskbit = 0x1f,
+		.mono_reg = AFE_UL10_CON0,
+		.mono_shift = 1,
+		.int_odd_flag_reg = AFE_UL10_CON0,
+		.int_odd_flag_shift = 0,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = 10,
+		.hd_reg = AFE_UL10_CON0,
+		.hd_shift = 5,
+		.agent_disable_reg = AUDIO_TOP_CON5,
+		.agent_disable_shift = 9,
+		.ch_num_reg = -1,
+		.ch_num_shift = 0,
+		.ch_num_maskbit = 0,
+		.msb_reg = AFE_NORMAL_BASE_ADR_MSB,
+		.msb_shift = 9,
+		.msb_end_reg = AFE_NORMAL_END_ADR_MSB,
+		.msb_end_shift = 9,
+	},
+};
+
+static const struct mtk_base_irq_data irq_data[MT8195_AFE_IRQ_NUM] = {
+	[MT8195_AFE_IRQ_1] = {
+		.id = MT8195_AFE_IRQ_1,
+		.irq_cnt_reg = -1,
+		.irq_cnt_shift = 0,
+		.irq_cnt_maskbit = 0,
+		.irq_fs_reg = -1,
+		.irq_fs_shift = 0,
+		.irq_fs_maskbit = 0,
+		.irq_en_reg = AFE_IRQ1_CON,
+		.irq_en_shift = 31,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = 0,
+		.irq_status_shift = 16,
+	},
+	[MT8195_AFE_IRQ_2] = {
+		.id = MT8195_AFE_IRQ_2,
+		.irq_cnt_reg = -1,
+		.irq_cnt_shift = 0,
+		.irq_cnt_maskbit = 0,
+		.irq_fs_reg = -1,
+		.irq_fs_shift = 0,
+		.irq_fs_maskbit = 0,
+		.irq_en_reg = AFE_IRQ2_CON,
+		.irq_en_shift = 31,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = 1,
+		.irq_status_shift = 17,
+	},
+	[MT8195_AFE_IRQ_3] = {
+		.id = MT8195_AFE_IRQ_3,
+		.irq_cnt_reg = AFE_IRQ3_CON,
+		.irq_cnt_shift = 0,
+		.irq_cnt_maskbit = 0xffffff,
+		.irq_fs_reg = -1,
+		.irq_fs_shift = 0,
+		.irq_fs_maskbit = 0,
+		.irq_en_reg = AFE_IRQ3_CON,
+		.irq_en_shift = 31,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = 2,
+		.irq_status_shift = 18,
+	},
+	[MT8195_AFE_IRQ_8] = {
+		.id = MT8195_AFE_IRQ_8,
+		.irq_cnt_reg = -1,
+		.irq_cnt_shift = 0,
+		.irq_cnt_maskbit = 0,
+		.irq_fs_reg = -1,
+		.irq_fs_shift = 0,
+		.irq_fs_maskbit = 0,
+		.irq_en_reg = AFE_IRQ8_CON,
+		.irq_en_shift = 31,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = 7,
+		.irq_status_shift = 23,
+	},
+	[MT8195_AFE_IRQ_9] = {
+		.id = MT8195_AFE_IRQ_9,
+		.irq_cnt_reg = AFE_IRQ9_CON,
+		.irq_cnt_shift = 0,
+		.irq_cnt_maskbit = 0xffffff,
+		.irq_fs_reg = -1,
+		.irq_fs_shift = 0,
+		.irq_fs_maskbit = 0,
+		.irq_en_reg = AFE_IRQ9_CON,
+		.irq_en_shift = 31,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = 8,
+		.irq_status_shift = 24,
+	},
+	[MT8195_AFE_IRQ_10] = {
+		.id = MT8195_AFE_IRQ_10,
+		.irq_cnt_reg = -1,
+		.irq_cnt_shift = 0,
+		.irq_cnt_maskbit = 0,
+		.irq_fs_reg = -1,
+		.irq_fs_shift = 0,
+		.irq_fs_maskbit = 0,
+		.irq_en_reg = AFE_IRQ10_CON,
+		.irq_en_shift = 31,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = 9,
+		.irq_status_shift = 25,
+	},
+	[MT8195_AFE_IRQ_13] = {
+		.id = MT8195_AFE_IRQ_13,
+		.irq_cnt_reg = ASYS_IRQ1_CON,
+		.irq_cnt_shift = 0,
+		.irq_cnt_maskbit = 0xffffff,
+		.irq_fs_reg = ASYS_IRQ1_CON,
+		.irq_fs_shift = 24,
+		.irq_fs_maskbit = 0x1ffff,
+		.irq_en_reg = ASYS_IRQ1_CON,
+		.irq_en_shift = 31,
+		.irq_clr_reg =  ASYS_IRQ_CLR,
+		.irq_clr_shift = 0,
+		.irq_status_shift = 0,
+	},
+	[MT8195_AFE_IRQ_14] = {
+		.id = MT8195_AFE_IRQ_14,
+		.irq_cnt_reg = ASYS_IRQ2_CON,
+		.irq_cnt_shift = 0,
+		.irq_cnt_maskbit = 0xffffff,
+		.irq_fs_reg = ASYS_IRQ2_CON,
+		.irq_fs_shift = 24,
+		.irq_fs_maskbit = 0x1ffff,
+		.irq_en_reg = ASYS_IRQ2_CON,
+		.irq_en_shift = 31,
+		.irq_clr_reg =  ASYS_IRQ_CLR,
+		.irq_clr_shift = 1,
+		.irq_status_shift = 1,
+	},
+	[MT8195_AFE_IRQ_15] = {
+		.id = MT8195_AFE_IRQ_15,
+		.irq_cnt_reg = ASYS_IRQ3_CON,
+		.irq_cnt_shift = 0,
+		.irq_cnt_maskbit = 0xffffff,
+		.irq_fs_reg = ASYS_IRQ3_CON,
+		.irq_fs_shift = 24,
+		.irq_fs_maskbit = 0x1ffff,
+		.irq_en_reg = ASYS_IRQ3_CON,
+		.irq_en_shift = 31,
+		.irq_clr_reg =  ASYS_IRQ_CLR,
+		.irq_clr_shift = 2,
+		.irq_status_shift = 2,
+	},
+	[MT8195_AFE_IRQ_16] = {
+		.id = MT8195_AFE_IRQ_16,
+		.irq_cnt_reg = ASYS_IRQ4_CON,
+		.irq_cnt_shift = 0,
+		.irq_cnt_maskbit = 0xffffff,
+		.irq_fs_reg = ASYS_IRQ4_CON,
+		.irq_fs_shift = 24,
+		.irq_fs_maskbit = 0x1ffff,
+		.irq_en_reg = ASYS_IRQ4_CON,
+		.irq_en_shift = 31,
+		.irq_clr_reg =  ASYS_IRQ_CLR,
+		.irq_clr_shift = 3,
+		.irq_status_shift = 3,
+	},
+	[MT8195_AFE_IRQ_17] = {
+		.id = MT8195_AFE_IRQ_17,
+		.irq_cnt_reg = ASYS_IRQ5_CON,
+		.irq_cnt_shift = 0,
+		.irq_cnt_maskbit = 0xffffff,
+		.irq_fs_reg = ASYS_IRQ5_CON,
+		.irq_fs_shift = 24,
+		.irq_fs_maskbit = 0x1ffff,
+		.irq_en_reg = ASYS_IRQ5_CON,
+		.irq_en_shift = 31,
+		.irq_clr_reg =  ASYS_IRQ_CLR,
+		.irq_clr_shift = 4,
+		.irq_status_shift = 4,
+	},
+	[MT8195_AFE_IRQ_18] = {
+		.id = MT8195_AFE_IRQ_18,
+		.irq_cnt_reg = ASYS_IRQ6_CON,
+		.irq_cnt_shift = 0,
+		.irq_cnt_maskbit = 0xffffff,
+		.irq_fs_reg = ASYS_IRQ6_CON,
+		.irq_fs_shift = 24,
+		.irq_fs_maskbit = 0x1ffff,
+		.irq_en_reg = ASYS_IRQ6_CON,
+		.irq_en_shift = 31,
+		.irq_clr_reg =  ASYS_IRQ_CLR,
+		.irq_clr_shift = 5,
+		.irq_status_shift = 5,
+	},
+	[MT8195_AFE_IRQ_19] = {
+		.id = MT8195_AFE_IRQ_19,
+		.irq_cnt_reg = ASYS_IRQ7_CON,
+		.irq_cnt_shift = 0,
+		.irq_cnt_maskbit = 0xffffff,
+		.irq_fs_reg = ASYS_IRQ7_CON,
+		.irq_fs_shift = 24,
+		.irq_fs_maskbit = 0x1ffff,
+		.irq_en_reg = ASYS_IRQ7_CON,
+		.irq_en_shift = 31,
+		.irq_clr_reg =  ASYS_IRQ_CLR,
+		.irq_clr_shift = 6,
+		.irq_status_shift = 6,
+	},
+	[MT8195_AFE_IRQ_20] = {
+		.id = MT8195_AFE_IRQ_20,
+		.irq_cnt_reg = ASYS_IRQ8_CON,
+		.irq_cnt_shift = 0,
+		.irq_cnt_maskbit = 0xffffff,
+		.irq_fs_reg = ASYS_IRQ8_CON,
+		.irq_fs_shift = 24,
+		.irq_fs_maskbit = 0x1ffff,
+		.irq_en_reg = ASYS_IRQ8_CON,
+		.irq_en_shift = 31,
+		.irq_clr_reg =  ASYS_IRQ_CLR,
+		.irq_clr_shift = 7,
+		.irq_status_shift = 7,
+	},
+	[MT8195_AFE_IRQ_21] = {
+		.id = MT8195_AFE_IRQ_21,
+		.irq_cnt_reg = ASYS_IRQ9_CON,
+		.irq_cnt_shift = 0,
+		.irq_cnt_maskbit = 0xffffff,
+		.irq_fs_reg = ASYS_IRQ9_CON,
+		.irq_fs_shift = 24,
+		.irq_fs_maskbit = 0x1ffff,
+		.irq_en_reg = ASYS_IRQ9_CON,
+		.irq_en_shift = 31,
+		.irq_clr_reg =  ASYS_IRQ_CLR,
+		.irq_clr_shift = 8,
+		.irq_status_shift = 8,
+	},
+	[MT8195_AFE_IRQ_22] = {
+		.id = MT8195_AFE_IRQ_22,
+		.irq_cnt_reg = ASYS_IRQ10_CON,
+		.irq_cnt_shift = 0,
+		.irq_cnt_maskbit = 0xffffff,
+		.irq_fs_reg = ASYS_IRQ10_CON,
+		.irq_fs_shift = 24,
+		.irq_fs_maskbit = 0x1ffff,
+		.irq_en_reg = ASYS_IRQ10_CON,
+		.irq_en_shift = 31,
+		.irq_clr_reg =  ASYS_IRQ_CLR,
+		.irq_clr_shift = 9,
+		.irq_status_shift = 9,
+	},
+	[MT8195_AFE_IRQ_23] = {
+		.id = MT8195_AFE_IRQ_23,
+		.irq_cnt_reg = ASYS_IRQ11_CON,
+		.irq_cnt_shift = 0,
+		.irq_cnt_maskbit = 0xffffff,
+		.irq_fs_reg = ASYS_IRQ11_CON,
+		.irq_fs_shift = 24,
+		.irq_fs_maskbit = 0x1ffff,
+		.irq_en_reg = ASYS_IRQ11_CON,
+		.irq_en_shift = 31,
+		.irq_clr_reg =  ASYS_IRQ_CLR,
+		.irq_clr_shift = 10,
+		.irq_status_shift = 10,
+	},
+	[MT8195_AFE_IRQ_24] = {
+		.id = MT8195_AFE_IRQ_24,
+		.irq_cnt_reg = ASYS_IRQ12_CON,
+		.irq_cnt_shift = 0,
+		.irq_cnt_maskbit = 0xffffff,
+		.irq_fs_reg = ASYS_IRQ12_CON,
+		.irq_fs_shift = 24,
+		.irq_fs_maskbit = 0x1ffff,
+		.irq_en_reg = ASYS_IRQ12_CON,
+		.irq_en_shift = 31,
+		.irq_clr_reg =  ASYS_IRQ_CLR,
+		.irq_clr_shift = 11,
+		.irq_status_shift = 11,
+	},
+	[MT8195_AFE_IRQ_25] = {
+		.id = MT8195_AFE_IRQ_25,
+		.irq_cnt_reg = ASYS_IRQ13_CON,
+		.irq_cnt_shift = 0,
+		.irq_cnt_maskbit = 0xffffff,
+		.irq_fs_reg = ASYS_IRQ13_CON,
+		.irq_fs_shift = 24,
+		.irq_fs_maskbit = 0x1ffff,
+		.irq_en_reg = ASYS_IRQ13_CON,
+		.irq_en_shift = 31,
+		.irq_clr_reg =  ASYS_IRQ_CLR,
+		.irq_clr_shift = 12,
+		.irq_status_shift = 12,
+	},
+	[MT8195_AFE_IRQ_26] = {
+		.id = MT8195_AFE_IRQ_26,
+		.irq_cnt_reg = ASYS_IRQ14_CON,
+		.irq_cnt_shift = 0,
+		.irq_cnt_maskbit = 0xffffff,
+		.irq_fs_reg = ASYS_IRQ14_CON,
+		.irq_fs_shift = 24,
+		.irq_fs_maskbit = 0x1ffff,
+		.irq_en_reg = ASYS_IRQ14_CON,
+		.irq_en_shift = 31,
+		.irq_clr_reg =  ASYS_IRQ_CLR,
+		.irq_clr_shift = 13,
+		.irq_status_shift = 13,
+	},
+	[MT8195_AFE_IRQ_27] = {
+		.id = MT8195_AFE_IRQ_27,
+		.irq_cnt_reg = ASYS_IRQ15_CON,
+		.irq_cnt_shift = 0,
+		.irq_cnt_maskbit = 0xffffff,
+		.irq_fs_reg = ASYS_IRQ15_CON,
+		.irq_fs_shift = 24,
+		.irq_fs_maskbit = 0x1ffff,
+		.irq_en_reg = ASYS_IRQ15_CON,
+		.irq_en_shift = 31,
+		.irq_clr_reg =  ASYS_IRQ_CLR,
+		.irq_clr_shift = 14,
+		.irq_status_shift = 14,
+	},
+	[MT8195_AFE_IRQ_28] = {
+		.id = MT8195_AFE_IRQ_28,
+		.irq_cnt_reg = ASYS_IRQ16_CON,
+		.irq_cnt_shift = 0,
+		.irq_cnt_maskbit = 0xffffff,
+		.irq_fs_reg = ASYS_IRQ16_CON,
+		.irq_fs_shift = 24,
+		.irq_fs_maskbit = 0x1ffff,
+		.irq_en_reg = ASYS_IRQ16_CON,
+		.irq_en_shift = 31,
+		.irq_clr_reg =  ASYS_IRQ_CLR,
+		.irq_clr_shift = 15,
+		.irq_status_shift = 15,
+	},
+};
+
+static const int mt8195_afe_memif_const_irqs[MT8195_AFE_MEMIF_NUM] = {
+	[MT8195_AFE_MEMIF_DL2] = MT8195_AFE_IRQ_13,
+	[MT8195_AFE_MEMIF_DL3] = MT8195_AFE_IRQ_14,
+	[MT8195_AFE_MEMIF_DL6] = MT8195_AFE_IRQ_15,
+	[MT8195_AFE_MEMIF_DL7] = MT8195_AFE_IRQ_1,
+	[MT8195_AFE_MEMIF_DL8] = MT8195_AFE_IRQ_16,
+	[MT8195_AFE_MEMIF_DL10] = MT8195_AFE_IRQ_17,
+	[MT8195_AFE_MEMIF_DL11] = MT8195_AFE_IRQ_18,
+	[MT8195_AFE_MEMIF_UL1] = MT8195_AFE_IRQ_3,
+	[MT8195_AFE_MEMIF_UL2] = MT8195_AFE_IRQ_19,
+	[MT8195_AFE_MEMIF_UL3] = MT8195_AFE_IRQ_20,
+	[MT8195_AFE_MEMIF_UL4] = MT8195_AFE_IRQ_21,
+	[MT8195_AFE_MEMIF_UL5] = MT8195_AFE_IRQ_22,
+	[MT8195_AFE_MEMIF_UL6] = MT8195_AFE_IRQ_9,
+	[MT8195_AFE_MEMIF_UL8] = MT8195_AFE_IRQ_23,
+	[MT8195_AFE_MEMIF_UL9] = MT8195_AFE_IRQ_24,
+	[MT8195_AFE_MEMIF_UL10] = MT8195_AFE_IRQ_25,
+};
+
+static bool mt8195_is_volatile_reg(struct device *dev, unsigned int reg)
+{
+	/* these auto-gen reg has read-only bit, so put it as volatile */
+	/* volatile reg cannot be cached, so cannot be set when power off */
+	switch (reg) {
+	case AUDIO_TOP_CON0:
+	case AUDIO_TOP_CON1:
+	case AUDIO_TOP_CON3:
+	case AUDIO_TOP_CON4:
+	case AUDIO_TOP_CON5:
+	case AUDIO_TOP_CON6:
+	case ASYS_IRQ_CLR:
+	case ASYS_IRQ_STATUS:
+	case ASYS_IRQ_MON1:
+	case ASYS_IRQ_MON2:
+	case AFE_IRQ_MCU_CLR:
+	case AFE_IRQ_STATUS:
+	case AFE_IRQ3_CON_MON:
+	case AFE_IRQ_MCU_MON2:
+	case ADSP_IRQ_STATUS:
+	case AFE_APLL_TUNER_CFG:
+	case AFE_APLL_TUNER_CFG1:
+	case AUDIO_TOP_STA0:
+	case AUDIO_TOP_STA1:
+	case AFE_GAIN1_CUR:
+	case AFE_GAIN2_CUR:
+	case AFE_IEC_BURST_INFO:
+	case AFE_IEC_CHL_STAT0:
+	case AFE_IEC_CHL_STAT1:
+	case AFE_IEC_CHR_STAT0:
+	case AFE_IEC_CHR_STAT1:
+	case AFE_SPDIFIN_CHSTS1:
+	case AFE_SPDIFIN_CHSTS2:
+	case AFE_SPDIFIN_CHSTS3:
+	case AFE_SPDIFIN_CHSTS4:
+	case AFE_SPDIFIN_CHSTS5:
+	case AFE_SPDIFIN_CHSTS6:
+	case AFE_SPDIFIN_DEBUG1:
+	case AFE_SPDIFIN_DEBUG2:
+	case AFE_SPDIFIN_DEBUG3:
+	case AFE_SPDIFIN_DEBUG4:
+	case AFE_SPDIFIN_EC:
+	case AFE_SPDIFIN_CKLOCK_CFG:
+	case AFE_SPDIFIN_BR_DBG1:
+	case AFE_SPDIFIN_CKFBDIV:
+	case AFE_SPDIFIN_INT_EXT:
+	case AFE_SPDIFIN_INT_EXT2:
+	case SPDIFIN_FREQ_STATUS:
+	case SPDIFIN_USERCODE1:
+	case SPDIFIN_USERCODE2:
+	case SPDIFIN_USERCODE3:
+	case SPDIFIN_USERCODE4:
+	case SPDIFIN_USERCODE5:
+	case SPDIFIN_USERCODE6:
+	case SPDIFIN_USERCODE7:
+	case SPDIFIN_USERCODE8:
+	case SPDIFIN_USERCODE9:
+	case SPDIFIN_USERCODE10:
+	case SPDIFIN_USERCODE11:
+	case SPDIFIN_USERCODE12:
+	case AFE_SPDIFIN_APLL_TUNER_CFG:
+	case AFE_LINEIN_APLL_TUNER_MON:
+	case AFE_EARC_APLL_TUNER_MON:
+	case AFE_CM0_MON:
+	case AFE_CM1_MON:
+	case AFE_CM2_MON:
+	case AFE_MPHONE_MULTI_DET_MON0:
+	case AFE_MPHONE_MULTI_DET_MON1:
+	case AFE_MPHONE_MULTI_DET_MON2:
+	case AFE_MPHONE_MULTI2_DET_MON0:
+	case AFE_MPHONE_MULTI2_DET_MON1:
+	case AFE_MPHONE_MULTI2_DET_MON2:
+	case AFE_ADDA_MTKAIF_MON0:
+	case AFE_ADDA_MTKAIF_MON1:
+	case AFE_AUD_PAD_TOP:
+	case AFE_ADDA6_MTKAIF_MON0:
+	case AFE_ADDA6_MTKAIF_MON1:
+	case AFE_ADDA6_SRC_DEBUG_MON0:
+	case AFE_ADDA6_UL_SRC_MON0:
+	case AFE_ADDA6_UL_SRC_MON1:
+	case AFE_ASRC11_NEW_CON8:
+	case AFE_ASRC11_NEW_CON9:
+	case AFE_ASRC12_NEW_CON8:
+	case AFE_ASRC12_NEW_CON9:
+	case AFE_LRCK_CNT:
+	case AFE_DAC_MON0:
+	case AFE_DL2_CUR:
+	case AFE_DL3_CUR:
+	case AFE_DL6_CUR:
+	case AFE_DL7_CUR:
+	case AFE_DL8_CUR:
+	case AFE_DL10_CUR:
+	case AFE_DL11_CUR:
+	case AFE_UL1_CUR:
+	case AFE_UL2_CUR:
+	case AFE_UL3_CUR:
+	case AFE_UL4_CUR:
+	case AFE_UL5_CUR:
+	case AFE_UL6_CUR:
+	case AFE_UL8_CUR:
+	case AFE_UL9_CUR:
+	case AFE_UL10_CUR:
+	case AFE_DL8_CHK_SUM1:
+	case AFE_DL8_CHK_SUM2:
+	case AFE_DL8_CHK_SUM3:
+	case AFE_DL8_CHK_SUM4:
+	case AFE_DL8_CHK_SUM5:
+	case AFE_DL8_CHK_SUM6:
+	case AFE_DL10_CHK_SUM1:
+	case AFE_DL10_CHK_SUM2:
+	case AFE_DL10_CHK_SUM3:
+	case AFE_DL10_CHK_SUM4:
+	case AFE_DL10_CHK_SUM5:
+	case AFE_DL10_CHK_SUM6:
+	case AFE_DL11_CHK_SUM1:
+	case AFE_DL11_CHK_SUM2:
+	case AFE_DL11_CHK_SUM3:
+	case AFE_DL11_CHK_SUM4:
+	case AFE_DL11_CHK_SUM5:
+	case AFE_DL11_CHK_SUM6:
+	case AFE_UL1_CHK_SUM1:
+	case AFE_UL1_CHK_SUM2:
+	case AFE_UL2_CHK_SUM1:
+	case AFE_UL2_CHK_SUM2:
+	case AFE_UL3_CHK_SUM1:
+	case AFE_UL3_CHK_SUM2:
+	case AFE_UL4_CHK_SUM1:
+	case AFE_UL4_CHK_SUM2:
+	case AFE_UL5_CHK_SUM1:
+	case AFE_UL5_CHK_SUM2:
+	case AFE_UL6_CHK_SUM1:
+	case AFE_UL6_CHK_SUM2:
+	case AFE_UL8_CHK_SUM1:
+	case AFE_UL8_CHK_SUM2:
+	case AFE_DL2_CHK_SUM1:
+	case AFE_DL2_CHK_SUM2:
+	case AFE_DL3_CHK_SUM1:
+	case AFE_DL3_CHK_SUM2:
+	case AFE_DL6_CHK_SUM1:
+	case AFE_DL6_CHK_SUM2:
+	case AFE_DL7_CHK_SUM1:
+	case AFE_DL7_CHK_SUM2:
+	case AFE_UL9_CHK_SUM1:
+	case AFE_UL9_CHK_SUM2:
+	case AFE_BUS_MON1:
+	case UL1_MOD2AGT_CNT_LAT:
+	case UL2_MOD2AGT_CNT_LAT:
+	case UL3_MOD2AGT_CNT_LAT:
+	case UL4_MOD2AGT_CNT_LAT:
+	case UL5_MOD2AGT_CNT_LAT:
+	case UL6_MOD2AGT_CNT_LAT:
+	case UL8_MOD2AGT_CNT_LAT:
+	case UL9_MOD2AGT_CNT_LAT:
+	case UL10_MOD2AGT_CNT_LAT:
+	case AFE_MEMIF_BUF_FULL_MON:
+	case AFE_MEMIF_BUF_MON1:
+	case AFE_MEMIF_BUF_MON3:
+	case AFE_MEMIF_BUF_MON4:
+	case AFE_MEMIF_BUF_MON5:
+	case AFE_MEMIF_BUF_MON6:
+	case AFE_MEMIF_BUF_MON7:
+	case AFE_MEMIF_BUF_MON8:
+	case AFE_MEMIF_BUF_MON9:
+	case AFE_MEMIF_BUF_MON10:
+	case DL2_AGENT2MODULE_CNT:
+	case DL3_AGENT2MODULE_CNT:
+	case DL6_AGENT2MODULE_CNT:
+	case DL7_AGENT2MODULE_CNT:
+	case DL8_AGENT2MODULE_CNT:
+	case DL10_AGENT2MODULE_CNT:
+	case DL11_AGENT2MODULE_CNT:
+	case UL1_MODULE2AGENT_CNT:
+	case UL2_MODULE2AGENT_CNT:
+	case UL3_MODULE2AGENT_CNT:
+	case UL4_MODULE2AGENT_CNT:
+	case UL5_MODULE2AGENT_CNT:
+	case UL6_MODULE2AGENT_CNT:
+	case UL8_MODULE2AGENT_CNT:
+	case UL9_MODULE2AGENT_CNT:
+	case UL10_MODULE2AGENT_CNT:
+	case AFE_DMIC0_SRC_DEBUG_MON0:
+	case AFE_DMIC0_UL_SRC_MON0:
+	case AFE_DMIC0_UL_SRC_MON1:
+	case AFE_DMIC1_SRC_DEBUG_MON0:
+	case AFE_DMIC1_UL_SRC_MON0:
+	case AFE_DMIC1_UL_SRC_MON1:
+	case AFE_DMIC2_SRC_DEBUG_MON0:
+	case AFE_DMIC2_UL_SRC_MON0:
+	case AFE_DMIC2_UL_SRC_MON1:
+	case AFE_DMIC3_SRC_DEBUG_MON0:
+	case AFE_DMIC3_UL_SRC_MON0:
+	case AFE_DMIC3_UL_SRC_MON1:
+	case DMIC_GAIN1_CUR:
+	case DMIC_GAIN2_CUR:
+	case DMIC_GAIN3_CUR:
+	case DMIC_GAIN4_CUR:
+	case ETDM_IN1_MONITOR:
+	case ETDM_IN2_MONITOR:
+	case ETDM_OUT1_MONITOR:
+	case ETDM_OUT2_MONITOR:
+	case ETDM_OUT3_MONITOR:
+	case AFE_ADDA_SRC_DEBUG_MON0:
+	case AFE_ADDA_SRC_DEBUG_MON1:
+	case AFE_ADDA_DL_SDM_FIFO_MON:
+	case AFE_ADDA_DL_SRC_LCH_MON:
+	case AFE_ADDA_DL_SRC_RCH_MON:
+	case AFE_ADDA_DL_SDM_OUT_MON:
+	case AFE_GASRC0_NEW_CON8:
+	case AFE_GASRC0_NEW_CON9:
+	case AFE_GASRC0_NEW_CON12:
+	case AFE_GASRC1_NEW_CON8:
+	case AFE_GASRC1_NEW_CON9:
+	case AFE_GASRC1_NEW_CON12:
+	case AFE_GASRC2_NEW_CON8:
+	case AFE_GASRC2_NEW_CON9:
+	case AFE_GASRC2_NEW_CON12:
+	case AFE_GASRC3_NEW_CON8:
+	case AFE_GASRC3_NEW_CON9:
+	case AFE_GASRC3_NEW_CON12:
+	case AFE_GASRC4_NEW_CON8:
+	case AFE_GASRC4_NEW_CON9:
+	case AFE_GASRC4_NEW_CON12:
+	case AFE_GASRC5_NEW_CON8:
+	case AFE_GASRC5_NEW_CON9:
+	case AFE_GASRC5_NEW_CON12:
+	case AFE_GASRC6_NEW_CON8:
+	case AFE_GASRC6_NEW_CON9:
+	case AFE_GASRC6_NEW_CON12:
+	case AFE_GASRC7_NEW_CON8:
+	case AFE_GASRC7_NEW_CON9:
+	case AFE_GASRC7_NEW_CON12:
+	case AFE_GASRC8_NEW_CON8:
+	case AFE_GASRC8_NEW_CON9:
+	case AFE_GASRC8_NEW_CON12:
+	case AFE_GASRC9_NEW_CON8:
+	case AFE_GASRC9_NEW_CON9:
+	case AFE_GASRC9_NEW_CON12:
+	case AFE_GASRC10_NEW_CON8:
+	case AFE_GASRC10_NEW_CON9:
+	case AFE_GASRC10_NEW_CON12:
+	case AFE_GASRC11_NEW_CON8:
+	case AFE_GASRC11_NEW_CON9:
+	case AFE_GASRC11_NEW_CON12:
+	case AFE_GASRC12_NEW_CON8:
+	case AFE_GASRC12_NEW_CON9:
+	case AFE_GASRC12_NEW_CON12:
+	case AFE_GASRC13_NEW_CON8:
+	case AFE_GASRC13_NEW_CON9:
+	case AFE_GASRC13_NEW_CON12:
+	case AFE_GASRC14_NEW_CON8:
+	case AFE_GASRC14_NEW_CON9:
+	case AFE_GASRC14_NEW_CON12:
+	case AFE_GASRC15_NEW_CON8:
+	case AFE_GASRC15_NEW_CON9:
+	case AFE_GASRC15_NEW_CON12:
+	case AFE_GASRC16_NEW_CON8:
+	case AFE_GASRC16_NEW_CON9:
+	case AFE_GASRC16_NEW_CON12:
+	case AFE_GASRC17_NEW_CON8:
+	case AFE_GASRC17_NEW_CON9:
+	case AFE_GASRC17_NEW_CON12:
+	case AFE_GASRC18_NEW_CON8:
+	case AFE_GASRC18_NEW_CON9:
+	case AFE_GASRC18_NEW_CON12:
+	case AFE_GASRC19_NEW_CON8:
+	case AFE_GASRC19_NEW_CON9:
+	case AFE_GASRC19_NEW_CON12:
+		return true;
+	default:
+		return false;
+	};
+}
+
+static const struct regmap_config mt8195_afe_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.volatile_reg = mt8195_is_volatile_reg,
+	.max_register = AFE_MAX_REGISTER,
+	.num_reg_defaults_raw = ((AFE_MAX_REGISTER / 4) + 1),
+	.cache_type = REGCACHE_FLAT,
+};
+
+#define AFE_IRQ_CLR_BITS (0x387)
+#define ASYS_IRQ_CLR_BITS (0xffff)
+
+static irqreturn_t mt8195_afe_irq_handler(int irq_id, void *dev_id)
+{
+	struct mtk_base_afe *afe = dev_id;
+	unsigned int val = 0;
+	unsigned int asys_irq_clr_bits = 0;
+	unsigned int afe_irq_clr_bits = 0;
+	unsigned int irq_status_bits = 0;
+	unsigned int irq_clr_bits = 0;
+	unsigned int mcu_irq_mask = 0;
+	int i = 0;
+	int ret = 0;
+
+	ret = regmap_read(afe->regmap, AFE_IRQ_STATUS, &val);
+	if (ret) {
+		dev_info(afe->dev, "%s irq status err\n", __func__);
+		afe_irq_clr_bits = AFE_IRQ_CLR_BITS;
+		asys_irq_clr_bits = ASYS_IRQ_CLR_BITS;
+		goto err_irq;
+	}
+
+	ret = regmap_read(afe->regmap, AFE_IRQ_MASK, &mcu_irq_mask);
+	if (ret) {
+		dev_info(afe->dev, "%s read irq mask err\n", __func__);
+		afe_irq_clr_bits = AFE_IRQ_CLR_BITS;
+		asys_irq_clr_bits = ASYS_IRQ_CLR_BITS;
+		goto err_irq;
+	}
+
+	/* only clr cpu irq */
+	val &= mcu_irq_mask;
+
+	for (i = 0; i < MT8195_AFE_MEMIF_NUM; i++) {
+		struct mtk_base_afe_memif *memif = &afe->memif[i];
+		struct mtk_base_irq_data const *irq_data;
+
+		if (memif->irq_usage < 0)
+			continue;
+
+		irq_data = afe->irqs[memif->irq_usage].irq_data;
+
+		irq_status_bits = BIT(irq_data->irq_status_shift);
+		irq_clr_bits = BIT(irq_data->irq_clr_shift);
+
+		if (!(val & irq_status_bits))
+			continue;
+
+		if (irq_data->irq_clr_reg == ASYS_IRQ_CLR)
+			asys_irq_clr_bits |= irq_clr_bits;
+		else
+			afe_irq_clr_bits |= irq_clr_bits;
+
+		snd_pcm_period_elapsed(memif->substream);
+	}
+
+err_irq:
+	/* clear irq */
+	if (asys_irq_clr_bits)
+		regmap_write(afe->regmap, ASYS_IRQ_CLR, asys_irq_clr_bits);
+	if (afe_irq_clr_bits)
+		regmap_write(afe->regmap, AFE_IRQ_MCU_CLR, afe_irq_clr_bits);
+
+	return IRQ_HANDLED;
+}
+
+static int mt8195_afe_runtime_suspend(struct device *dev)
+{
+	struct mtk_base_afe *afe = dev_get_drvdata(dev);
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+
+	if (!afe->regmap || afe_priv->pm_runtime_bypass_reg_ctl)
+		goto skip_regmap;
+
+	mt8195_afe_disable_main_clock(afe);
+
+	regcache_cache_only(afe->regmap, true);
+	regcache_mark_dirty(afe->regmap);
+
+skip_regmap:
+	mt8195_afe_disable_reg_rw_clk(afe);
+
+	return 0;
+}
+
+static int mt8195_afe_runtime_resume(struct device *dev)
+{
+	struct mtk_base_afe *afe = dev_get_drvdata(dev);
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+
+	mt8195_afe_enable_reg_rw_clk(afe);
+
+	if (!afe->regmap || afe_priv->pm_runtime_bypass_reg_ctl)
+		goto skip_regmap;
+
+	regcache_cache_only(afe->regmap, false);
+	regcache_sync(afe->regmap);
+
+	mt8195_afe_enable_main_clock(afe);
+skip_regmap:
+	return 0;
+}
+
+static int mt8195_afe_component_probe(struct snd_soc_component *component)
+{
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
+	int ret = 0;
+
+	snd_soc_component_init_regmap(component, afe->regmap);
+
+	ret = mtk_afe_add_sub_dai_control(component);
+
+	return ret;
+}
+
+static const struct snd_soc_component_driver mt8195_afe_component = {
+	.name = AFE_PCM_NAME,
+	.pointer = mtk_afe_pcm_pointer,
+	.pcm_construct = mtk_afe_pcm_new,
+	.probe = mt8195_afe_component_probe,
+};
+
+static int init_memif_priv_data(struct mtk_base_afe *afe)
+{
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_dai_memif_priv *memif_priv;
+	int i;
+
+	for (i = MT8195_AFE_MEMIF_START; i < MT8195_AFE_MEMIF_END; i++) {
+		memif_priv = devm_kzalloc(afe->dev,
+					  sizeof(struct mtk_dai_memif_priv),
+					  GFP_KERNEL);
+		if (!memif_priv)
+			return -ENOMEM;
+
+		afe_priv->dai_priv[i] = memif_priv;
+	}
+
+	return 0;
+}
+
+static int mt8195_dai_memif_register(struct mtk_base_afe *afe)
+{
+	struct mtk_base_afe_dai *dai;
+
+	dai = devm_kzalloc(afe->dev, sizeof(*dai), GFP_KERNEL);
+	if (!dai)
+		return -ENOMEM;
+
+	list_add(&dai->list, &afe->sub_dais);
+
+	dai->dai_drivers = mt8195_memif_dai_driver;
+	dai->num_dai_drivers = ARRAY_SIZE(mt8195_memif_dai_driver);
+
+	dai->dapm_widgets = mt8195_memif_widgets;
+	dai->num_dapm_widgets = ARRAY_SIZE(mt8195_memif_widgets);
+	dai->dapm_routes = mt8195_memif_routes;
+	dai->num_dapm_routes = ARRAY_SIZE(mt8195_memif_routes);
+	dai->controls = mt8195_memif_controls;
+	dai->num_controls = ARRAY_SIZE(mt8195_memif_controls);
+
+	return init_memif_priv_data(afe);
+}
+
+typedef int (*dai_register_cb)(struct mtk_base_afe *);
+static const dai_register_cb dai_register_cbs[] = {
+	mt8195_dai_adda_register,
+	mt8195_dai_etdm_register,
+	mt8195_dai_pcm_register,
+	mt8195_dai_memif_register,
+};
+
+static const struct reg_sequence mt8195_afe_reg_defaults[] = {
+	{ AFE_IRQ_MASK, 0x387ffff },
+	{ AFE_IRQ3_CON, BIT(30) },
+	{ AFE_IRQ9_CON, BIT(30) },
+	{ ETDM_IN1_CON4, 0x12000100 },
+	{ ETDM_IN2_CON4, 0x12000100 },
+};
+
+static const struct reg_sequence mt8195_cg_patch[] = {
+	{ AUDIO_TOP_CON0, 0xfffffffb },
+	{ AUDIO_TOP_CON1, 0xfffffffa },
+};
+
+static int mt8195_afe_init_registers(struct mtk_base_afe *afe)
+{
+	return regmap_multi_reg_write(afe->regmap,
+			mt8195_afe_reg_defaults,
+			ARRAY_SIZE(mt8195_afe_reg_defaults));
+}
+
+static void mt8195_afe_parse_of(struct mtk_base_afe *afe,
+				struct device_node *np)
+{
+#if IS_ENABLED(CONFIG_SND_SOC_MT6359)
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+
+	afe_priv->topckgen = syscon_regmap_lookup_by_phandle(afe->dev->of_node,
+							     "mediatek,topckgen");
+	if (IS_ERR(afe_priv->topckgen)) {
+		dev_info(afe->dev, "%s() Cannot find topckgen controller: %ld\n",
+			 __func__, PTR_ERR(afe_priv->topckgen));
+	}
+#endif
+}
+
+static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
+{
+	struct mtk_base_afe *afe;
+	struct mt8195_afe_private *afe_priv;
+	struct resource *res;
+	struct device *dev = &pdev->dev;
+	int i, irq_id, ret;
+	struct snd_soc_component *component;
+
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(33));
+	if (ret)
+		return ret;
+
+	afe = devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
+	if (!afe)
+		return -ENOMEM;
+
+	afe->platform_priv = devm_kzalloc(dev, sizeof(*afe_priv),
+					  GFP_KERNEL);
+	if (!afe->platform_priv)
+		return -ENOMEM;
+
+	afe_priv = afe->platform_priv;
+	afe->dev = &pdev->dev;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	afe->base_addr = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(afe->base_addr))
+		return PTR_ERR(afe->base_addr);
+
+	/* initial audio related clock */
+	ret = mt8195_afe_init_clock(afe);
+	if (ret) {
+		dev_err(dev, "init clock error\n");
+		return ret;
+	}
+
+	spin_lock_init(&afe_priv->afe_ctrl_lock);
+
+	mutex_init(&afe->irq_alloc_lock);
+
+	/* irq initialize */
+	afe->irqs_size = MT8195_AFE_IRQ_NUM;
+	afe->irqs = devm_kcalloc(dev, afe->irqs_size, sizeof(*afe->irqs),
+				 GFP_KERNEL);
+	if (!afe->irqs)
+		return -ENOMEM;
+
+	for (i = 0; i < afe->irqs_size; i++)
+		afe->irqs[i].irq_data = &irq_data[i];
+
+	/* init memif */
+	afe->memif_size = MT8195_AFE_MEMIF_NUM;
+	afe->memif = devm_kcalloc(dev, afe->memif_size, sizeof(*afe->memif),
+				  GFP_KERNEL);
+	if (!afe->memif)
+		return -ENOMEM;
+
+	for (i = 0; i < afe->memif_size; i++) {
+		afe->memif[i].data = &memif_data[i];
+		afe->memif[i].irq_usage = mt8195_afe_memif_const_irqs[i];
+		afe->memif[i].const_irq = 1;
+		afe->irqs[afe->memif[i].irq_usage].irq_occupyed = true;
+	}
+
+	/* request irq */
+	irq_id = platform_get_irq(pdev, 0);
+	if (irq_id < 0) {
+		dev_err(dev, "%s no irq found\n", dev->of_node->name);
+		return -ENXIO;
+	}
+
+	ret = devm_request_irq(dev, irq_id, mt8195_afe_irq_handler,
+			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
+	if (ret) {
+		dev_err(dev, "could not request_irq for asys-isr\n");
+		return ret;
+	}
+
+	/* init sub_dais */
+	INIT_LIST_HEAD(&afe->sub_dais);
+
+	for (i = 0; i < ARRAY_SIZE(dai_register_cbs); i++) {
+		ret = dai_register_cbs[i](afe);
+		if (ret) {
+			dev_warn(dev, "dai register i %d fail, ret %d\n",
+				 i, ret);
+			return ret;
+		}
+	}
+
+	/* init dai_driver and component_driver */
+	ret = mtk_afe_combine_sub_dai(afe);
+	if (ret) {
+		dev_warn(dev, "mtk_afe_combine_sub_dai fail, ret %d\n",
+			 ret);
+		return ret;
+	}
+
+	afe->mtk_afe_hardware = &mt8195_afe_hardware;
+	afe->memif_fs = mt8195_memif_fs;
+	afe->irq_fs = mt8195_irq_fs;
+
+	afe->runtime_resume = mt8195_afe_runtime_resume;
+	afe->runtime_suspend = mt8195_afe_runtime_suspend;
+
+	platform_set_drvdata(pdev, afe);
+
+	mt8195_afe_parse_of(afe, pdev->dev.of_node);
+
+	pm_runtime_enable(dev);
+	if (!pm_runtime_enabled(dev)) {
+		ret = mt8195_afe_runtime_resume(dev);
+		if (ret)
+			return ret;
+	}
+
+	/* enable clock for regcache get default value from hw */
+	afe_priv->pm_runtime_bypass_reg_ctl = true;
+	pm_runtime_get_sync(dev);
+
+	afe->regmap = devm_regmap_init_mmio(&pdev->dev, afe->base_addr,
+					    &mt8195_afe_regmap_config);
+	if (IS_ERR(afe->regmap)) {
+		ret = PTR_ERR(afe->regmap);
+		goto err_pm_put;
+	}
+
+	ret = regmap_register_patch(afe->regmap, mt8195_cg_patch,
+				    ARRAY_SIZE(mt8195_cg_patch));
+	if (ret < 0) {
+		dev_err(dev, "Failed to apply cg patch\n");
+		goto err_pm_put;
+	}
+
+	/* register component */
+	ret = devm_snd_soc_register_component(dev, &mt8195_afe_component,
+					      NULL, 0);
+	if (ret) {
+		dev_warn(dev, "err_platform\n");
+		goto err_pm_put;
+	}
+
+	component = devm_kzalloc(dev, sizeof(*component), GFP_KERNEL);
+	if (!component) {
+		ret = -ENOMEM;
+		goto err_pm_put;
+	}
+
+	ret = snd_soc_component_initialize(component,
+					   &mt8195_afe_pcm_dai_component,
+					   dev);
+	if (ret)
+		goto err_pm_put;
+
+#ifdef CONFIG_DEBUG_FS
+	component->debugfs_prefix = "pcm";
+#endif
+
+	ret = snd_soc_add_component(component,
+				    afe->dai_drivers,
+				    afe->num_dai_drivers);
+	if (ret) {
+		dev_warn(dev, "err_dai_component\n");
+		goto err_pm_put;
+	}
+
+	mt8195_afe_init_registers(afe);
+
+	pm_runtime_put_sync(dev);
+	afe_priv->pm_runtime_bypass_reg_ctl = false;
+
+	regcache_cache_only(afe->regmap, true);
+	regcache_mark_dirty(afe->regmap);
+
+	return 0;
+
+err_pm_put:
+	pm_runtime_put_sync(dev);
+	pm_runtime_disable(dev);
+
+	return ret;
+}
+
+static int mt8195_afe_pcm_dev_remove(struct platform_device *pdev)
+{
+	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
+
+	snd_soc_unregister_component(&pdev->dev);
+
+	pm_runtime_disable(&pdev->dev);
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		mt8195_afe_runtime_suspend(&pdev->dev);
+
+	mt8195_afe_deinit_clock(afe);
+	return 0;
+}
+
+static const struct of_device_id mt8195_afe_pcm_dt_match[] = {
+	{.compatible = "mediatek,mt8195-audio", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mt8195_afe_pcm_dt_match);
+
+static const struct dev_pm_ops mt8195_afe_pm_ops = {
+	SET_RUNTIME_PM_OPS(mt8195_afe_runtime_suspend,
+			   mt8195_afe_runtime_resume, NULL)
+};
+
+static struct platform_driver mt8195_afe_pcm_driver = {
+	.driver = {
+		   .name = "mt8195-audio",
+		   .of_match_table = mt8195_afe_pcm_dt_match,
+#ifdef CONFIG_PM
+		   .pm = &mt8195_afe_pm_ops,
+#endif
+	},
+	.probe = mt8195_afe_pcm_dev_probe,
+	.remove = mt8195_afe_pcm_dev_remove,
+};
+
+module_platform_driver(mt8195_afe_pcm_driver);
+
+MODULE_DESCRIPTION("Mediatek ALSA SoC AFE platform driver for 8195");
+MODULE_AUTHOR("Bicycle Tsai <bicycle.tsai@mediatek.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/mediatek/mt8195/mt8195-reg.h b/sound/soc/mediatek/mt8195/mt8195-reg.h
new file mode 100644
index 000000000000..d06f9cf85a4e
--- /dev/null
+++ b/sound/soc/mediatek/mt8195/mt8195-reg.h
@@ -0,0 +1,2796 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * mt8195-reg.h  --  Mediatek 8195 audio driver reg definition
+ *
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Bicycle Tsai <bicycle.tsai@mediatek.com>
+ *         Trevor Wu <trevor.wu@mediatek.com>
+ */
+
+#ifndef _MT8195_REG_H_
+#define _MT8195_REG_H_
+
+#define AFE_SRAM_BASE                     (0x10880000)
+#define AFE_SRAM_SIZE                     (0x10000)
+
+#define AUDIO_TOP_CON0                    (0x0000)
+#define AUDIO_TOP_CON1                    (0x0004)
+#define AUDIO_TOP_CON2                    (0x0008)
+#define AUDIO_TOP_CON3                    (0x000c)
+#define AUDIO_TOP_CON4                    (0x0010)
+#define AUDIO_TOP_CON5                    (0x0014)
+#define AUDIO_TOP_CON6                    (0x0018)
+#define AFE_MAS_HADDR_MSB                 (0x0020)
+#define PWR1_ASM_CON1                     (0x0108)
+#define ASYS_IRQ_CONFIG                   (0x0110)
+#define ASYS_IRQ1_CON                     (0x0114)
+#define ASYS_IRQ2_CON                     (0x0118)
+#define ASYS_IRQ3_CON                     (0x011c)
+#define ASYS_IRQ4_CON                     (0x0120)
+#define ASYS_IRQ5_CON                     (0x0124)
+#define ASYS_IRQ6_CON                     (0x0128)
+#define ASYS_IRQ7_CON                     (0x012c)
+#define ASYS_IRQ8_CON                     (0x0130)
+#define ASYS_IRQ9_CON                     (0x0134)
+#define ASYS_IRQ10_CON                    (0x0138)
+#define ASYS_IRQ11_CON                    (0x013c)
+#define ASYS_IRQ12_CON                    (0x0140)
+#define ASYS_IRQ13_CON                    (0x0144)
+#define ASYS_IRQ14_CON                    (0x0148)
+#define ASYS_IRQ15_CON                    (0x014c)
+#define ASYS_IRQ16_CON                    (0x0150)
+#define ASYS_IRQ_CLR                      (0x0154)
+#define ASYS_IRQ_STATUS                   (0x0158)
+#define ASYS_IRQ_MON1                     (0x015c)
+#define ASYS_IRQ_MON2                     (0x0160)
+#define AFE_IRQ1_CON                      (0x0164)
+#define AFE_IRQ2_CON                      (0x0168)
+#define AFE_IRQ3_CON                      (0x016c)
+#define AFE_IRQ_MCU_CLR                   (0x0170)
+#define AFE_IRQ_STATUS                    (0x0174)
+#define AFE_IRQ_MASK                      (0x0178)
+#define ASYS_IRQ_MASK                     (0x017c)
+#define AFE_IRQ3_CON_MON                  (0x01b0)
+#define AFE_IRQ_MCU_MON2                  (0x01b4)
+#define AFE_IRQ8_CON                      (0x01b8)
+#define AFE_IRQ9_CON                      (0x01bc)
+#define AFE_IRQ10_CON                     (0x01c0)
+#define AFE_IRQ9_CON_MON                  (0x01c4)
+#define ADSP_IRQ_MASK                     (0x01c8)
+#define ADSP_IRQ_STATUS                   (0x01cc)
+#define AFE_SINEGEN_CON0                  (0x01f0)
+#define AFE_SINEGEN_CON1                  (0x01f4)
+#define AFE_SINEGEN_CON2                  (0x01f8)
+#define AFE_SINEGEN_CON3                  (0x01fc)
+#define AFE_SPDIF_OUT_CON0                (0x0380)
+#define AFE_TDMOUT_CONN0                  (0x0390)
+#define PWR1_ASM_CON2                     (0x03b0)
+#define PWR1_ASM_CON3                     (0x03b4)
+#define PWR1_ASM_CON4                     (0x03b8)
+#define AFE_APLL_TUNER_CFG                (0x03f8)
+#define AFE_APLL_TUNER_CFG1               (0x03fc)
+#define AUDIO_TOP_STA0                    (0x0400)
+#define AUDIO_TOP_STA1                    (0x0404)
+#define AFE_GAIN1_CON0                    (0x0410)
+#define AFE_GAIN1_CON1                    (0x0414)
+#define AFE_GAIN1_CON2                    (0x0418)
+#define AFE_GAIN1_CON3                    (0x041c)
+#define AFE_GAIN1_CUR                     (0x0424)
+#define AFE_GAIN2_CON0                    (0x0428)
+#define AFE_GAIN2_CON1                    (0x042c)
+#define AFE_GAIN2_CON2                    (0x0430)
+#define AFE_GAIN2_CON3                    (0x0434)
+#define AFE_GAIN2_CUR                     (0x043c)
+#define AFE_IEC_CFG                       (0x0480)
+#define AFE_IEC_NSNUM                     (0x0484)
+#define AFE_IEC_BURST_INFO                (0x0488)
+#define AFE_IEC_BURST_LEN                 (0x048c)
+#define AFE_IEC_NSADR                     (0x0490)
+#define AFE_IEC_CHL_STAT0                 (0x04a0)
+#define AFE_IEC_CHL_STAT1                 (0x04a4)
+#define AFE_IEC_CHR_STAT0                 (0x04a8)
+#define AFE_IEC_CHR_STAT1                 (0x04ac)
+#define AFE_SPDIFIN_CFG0                  (0x0500)
+#define AFE_SPDIFIN_CFG1                  (0x0504)
+#define AFE_SPDIFIN_CHSTS1                (0x0508)
+#define AFE_SPDIFIN_CHSTS2                (0x050c)
+#define AFE_SPDIFIN_CHSTS3                (0x0510)
+#define AFE_SPDIFIN_CHSTS4                (0x0514)
+#define AFE_SPDIFIN_CHSTS5                (0x0518)
+#define AFE_SPDIFIN_CHSTS6                (0x051c)
+#define AFE_SPDIFIN_DEBUG1                (0x0520)
+#define AFE_SPDIFIN_DEBUG2                (0x0524)
+#define AFE_SPDIFIN_DEBUG3                (0x0528)
+#define AFE_SPDIFIN_DEBUG4                (0x052c)
+#define AFE_SPDIFIN_EC                    (0x0530)
+#define AFE_SPDIFIN_CKLOCK_CFG            (0x0534)
+#define AFE_SPDIFIN_BR                    (0x053c)
+#define AFE_SPDIFIN_BR_DBG1               (0x0540)
+#define AFE_SPDIFIN_CKFBDIV               (0x0544)
+#define AFE_SPDIFIN_INT_EXT               (0x0548)
+#define AFE_SPDIFIN_INT_EXT2              (0x054c)
+#define SPDIFIN_FREQ_INFO                 (0x0550)
+#define SPDIFIN_FREQ_INFO_2               (0x0554)
+#define SPDIFIN_FREQ_INFO_3               (0x0558)
+#define SPDIFIN_FREQ_STATUS               (0x055c)
+#define SPDIFIN_USERCODE1                 (0x0560)
+#define SPDIFIN_USERCODE2                 (0x0564)
+#define SPDIFIN_USERCODE3                 (0x0568)
+#define SPDIFIN_USERCODE4                 (0x056c)
+#define SPDIFIN_USERCODE5                 (0x0570)
+#define SPDIFIN_USERCODE6                 (0x0574)
+#define SPDIFIN_USERCODE7                 (0x0578)
+#define SPDIFIN_USERCODE8                 (0x057c)
+#define SPDIFIN_USERCODE9                 (0x0580)
+#define SPDIFIN_USERCODE10                (0x0584)
+#define SPDIFIN_USERCODE11                (0x0588)
+#define SPDIFIN_USERCODE12                (0x058c)
+#define AFE_SPDIFIN_APLL_TUNER_CFG        (0x0594)
+#define AFE_SPDIFIN_APLL_TUNER_CFG1       (0x0598)
+#define ASYS_TOP_CON                      (0x0600)
+#define AFE_LINEIN_APLL_TUNER_CFG         (0x0610)
+#define AFE_LINEIN_APLL_TUNER_MON         (0x0614)
+#define AFE_EARC_APLL_TUNER_CFG           (0x0618)
+#define AFE_EARC_APLL_TUNER_MON           (0x061c)
+#define PWR2_TOP_CON0                     (0x0634)
+#define PWR2_TOP_CON1                     (0x0638)
+#define PCM_INTF_CON1                     (0x063c)
+#define PCM_INTF_CON2                     (0x0640)
+#define AFE_CM0_CON                       (0x0660)
+#define AFE_CM1_CON                       (0x0664)
+#define AFE_CM2_CON                       (0x0668)
+#define AFE_CM0_MON                       (0x0670)
+#define AFE_CM1_MON                       (0x0674)
+#define AFE_CM2_MON                       (0x0678)
+#define AFE_MPHONE_MULTI_CON0             (0x06a4)
+#define AFE_MPHONE_MULTI_CON1             (0x06a8)
+#define AFE_MPHONE_MULTI_CON2             (0x06ac)
+#define AFE_MPHONE_MULTI_MON              (0x06b0)
+#define AFE_MPHONE_MULTI_DET_REG_CON0     (0x06b4)
+#define AFE_MPHONE_MULTI_DET_REG_CON1     (0x06b8)
+#define AFE_MPHONE_MULTI_DET_REG_CON2     (0x06bc)
+#define AFE_MPHONE_MULTI_DET_REG_CON3     (0x06c0)
+#define AFE_MPHONE_MULTI_DET_MON0         (0x06c4)
+#define AFE_MPHONE_MULTI_DET_MON1         (0x06c8)
+#define AFE_MPHONE_MULTI_DET_MON2         (0x06d0)
+#define AFE_MPHONE_MULTI2_CON0            (0x06d4)
+#define AFE_MPHONE_MULTI2_CON1            (0x06d8)
+#define AFE_MPHONE_MULTI2_CON2            (0x06dc)
+#define AFE_MPHONE_MULTI2_MON             (0x06e0)
+#define AFE_MPHONE_MULTI2_DET_REG_CON0    (0x06e4)
+#define AFE_MPHONE_MULTI2_DET_REG_CON1    (0x06e8)
+#define AFE_MPHONE_MULTI2_DET_REG_CON2    (0x06ec)
+#define AFE_MPHONE_MULTI2_DET_REG_CON3    (0x06f0)
+#define AFE_MPHONE_MULTI2_DET_MON0        (0x06f4)
+#define AFE_MPHONE_MULTI2_DET_MON1        (0x06f8)
+#define AFE_MPHONE_MULTI2_DET_MON2        (0x06fc)
+#define AFE_ADDA_IIR_COEF_02_01           (0x0700)
+#define AFE_ADDA_IIR_COEF_04_03           (0x0704)
+#define AFE_ADDA_IIR_COEF_06_05           (0x0708)
+#define AFE_ADDA_IIR_COEF_08_07           (0x070c)
+#define AFE_ADDA_IIR_COEF_10_09           (0x0710)
+#define AFE_ADDA_ULCF_CFG_02_01           (0x0714)
+#define AFE_ADDA_ULCF_CFG_04_03           (0x0718)
+#define AFE_ADDA_ULCF_CFG_06_05           (0x071c)
+#define AFE_ADDA_ULCF_CFG_08_07           (0x0720)
+#define AFE_ADDA_ULCF_CFG_10_09           (0x0724)
+#define AFE_ADDA_ULCF_CFG_12_11           (0x0728)
+#define AFE_ADDA_ULCF_CFG_14_13           (0x072c)
+#define AFE_ADDA_ULCF_CFG_16_15           (0x0730)
+#define AFE_ADDA_ULCF_CFG_18_17           (0x0734)
+#define AFE_ADDA_ULCF_CFG_20_19           (0x0738)
+#define AFE_ADDA_ULCF_CFG_22_21           (0x073c)
+#define AFE_ADDA_ULCF_CFG_24_23           (0x0740)
+#define AFE_ADDA_ULCF_CFG_26_25           (0x0744)
+#define AFE_ADDA_ULCF_CFG_28_27           (0x0748)
+#define AFE_ADDA_ULCF_CFG_30_29           (0x074c)
+#define AFE_ADDA6_IIR_COEF_02_01          (0x0750)
+#define AFE_ADDA6_IIR_COEF_04_03          (0x0754)
+#define AFE_ADDA6_IIR_COEF_06_05          (0x0758)
+#define AFE_ADDA6_IIR_COEF_08_07          (0x075c)
+#define AFE_ADDA6_IIR_COEF_10_09          (0x0760)
+#define AFE_ADDA6_ULCF_CFG_02_01          (0x0764)
+#define AFE_ADDA6_ULCF_CFG_04_03          (0x0768)
+#define AFE_ADDA6_ULCF_CFG_06_05          (0x076c)
+#define AFE_ADDA6_ULCF_CFG_08_07          (0x0770)
+#define AFE_ADDA6_ULCF_CFG_10_09          (0x0774)
+#define AFE_ADDA6_ULCF_CFG_12_11          (0x0778)
+#define AFE_ADDA6_ULCF_CFG_14_13          (0x077c)
+#define AFE_ADDA6_ULCF_CFG_16_15          (0x0780)
+#define AFE_ADDA6_ULCF_CFG_18_17          (0x0784)
+#define AFE_ADDA6_ULCF_CFG_20_19          (0x0788)
+#define AFE_ADDA6_ULCF_CFG_22_21          (0x078c)
+#define AFE_ADDA6_ULCF_CFG_24_23          (0x0790)
+#define AFE_ADDA6_ULCF_CFG_26_25          (0x0794)
+#define AFE_ADDA6_ULCF_CFG_28_27          (0x0798)
+#define AFE_ADDA6_ULCF_CFG_30_29          (0x079c)
+#define AFE_ADDA_MTKAIF_CFG0              (0x07a0)
+#define AFE_ADDA_MTKAIF_SYNCWORD_CFG      (0x07a8)
+#define AFE_ADDA_MTKAIF_RX_CFG0           (0x07b4)
+#define AFE_ADDA_MTKAIF_RX_CFG1           (0x07b8)
+#define AFE_ADDA_MTKAIF_RX_CFG2           (0x07bc)
+#define AFE_ADDA_MTKAIF_MON0              (0x07c8)
+#define AFE_ADDA_MTKAIF_MON1              (0x07cc)
+#define AFE_AUD_PAD_TOP                   (0x07d4)
+#define AFE_ADDA6_MTKAIF_MON0             (0x07d8)
+#define AFE_ADDA6_MTKAIF_MON1             (0x07dc)
+#define AFE_ADDA6_MTKAIF_CFG0             (0x07e0)
+#define AFE_ADDA6_MTKAIF_RX_CFG0          (0x07e4)
+#define AFE_ADDA6_MTKAIF_RX_CFG1          (0x07e8)
+#define AFE_ADDA6_MTKAIF_RX_CFG2          (0x07ec)
+#define AFE_ADDA6_TOP_CON0                (0x07f0)
+#define AFE_ADDA6_UL_SRC_CON0             (0x07f4)
+#define AFE_ADDA6_UL_SRC_CON1             (0x07f8)
+#define AFE_ADDA6_SRC_DEBUG               (0x0800)
+#define AFE_ADDA6_SRC_DEBUG_MON0          (0x0804)
+#define AFE_ADDA6_UL_SRC_MON0             (0x0818)
+#define AFE_ADDA6_UL_SRC_MON1             (0x081c)
+#define AFE_CONN0_5                       (0x0830)
+#define AFE_CONN1_5                       (0x0834)
+#define AFE_CONN2_5                       (0x0838)
+#define AFE_CONN3_5                       (0x083c)
+#define AFE_CONN4_5                       (0x0840)
+#define AFE_CONN5_5                       (0x0844)
+#define AFE_CONN6_5                       (0x0848)
+#define AFE_CONN7_5                       (0x084c)
+#define AFE_CONN8_5                       (0x0850)
+#define AFE_CONN9_5                       (0x0854)
+#define AFE_CONN10_5                      (0x0858)
+#define AFE_CONN11_5                      (0x085c)
+#define AFE_CONN12_5                      (0x0860)
+#define AFE_CONN13_5                      (0x0864)
+#define AFE_CONN14_5                      (0x0868)
+#define AFE_CONN15_5                      (0x086c)
+#define AFE_CONN16_5                      (0x0870)
+#define AFE_CONN17_5                      (0x0874)
+#define AFE_CONN18_5                      (0x0878)
+#define AFE_CONN19_5                      (0x087c)
+#define AFE_CONN20_5                      (0x0880)
+#define AFE_CONN21_5                      (0x0884)
+#define AFE_CONN22_5                      (0x0888)
+#define AFE_CONN23_5                      (0x088c)
+#define AFE_CONN24_5                      (0x0890)
+#define AFE_CONN25_5                      (0x0894)
+#define AFE_CONN26_5                      (0x0898)
+#define AFE_CONN27_5                      (0x089c)
+#define AFE_CONN28_5                      (0x08a0)
+#define AFE_CONN29_5                      (0x08a4)
+#define AFE_CONN30_5                      (0x08a8)
+#define AFE_CONN31_5                      (0x08ac)
+#define AFE_CONN32_5                      (0x08b0)
+#define AFE_CONN33_5                      (0x08b4)
+#define AFE_CONN34_5                      (0x08b8)
+#define AFE_CONN35_5                      (0x08bc)
+#define AFE_CONN36_5                      (0x08c0)
+#define AFE_CONN37_5                      (0x08c4)
+#define AFE_CONN38_5                      (0x08c8)
+#define AFE_CONN39_5                      (0x08cc)
+#define AFE_CONN40_5                      (0x08d0)
+#define AFE_CONN41_5                      (0x08d4)
+#define AFE_CONN42_5                      (0x08d8)
+#define AFE_CONN43_5                      (0x08dc)
+#define AFE_CONN44_5                      (0x08e0)
+#define AFE_CONN45_5                      (0x08e4)
+#define AFE_CONN46_5                      (0x08e8)
+#define AFE_CONN47_5                      (0x08ec)
+#define AFE_CONN48_5                      (0x08f0)
+#define AFE_CONN49_5                      (0x08f4)
+#define AFE_CONN50_5                      (0x08f8)
+#define AFE_CONN51_5                      (0x08fc)
+#define AFE_CONN52_5                      (0x0900)
+#define AFE_CONN53_5                      (0x0904)
+#define AFE_CONN54_5                      (0x0908)
+#define AFE_CONN55_5                      (0x090c)
+#define AFE_CONN56_5                      (0x0910)
+#define AFE_CONN57_5                      (0x0914)
+#define AFE_CONN58_5                      (0x0918)
+#define AFE_CONN59_5                      (0x091c)
+#define AFE_CONN60_5                      (0x0920)
+#define AFE_CONN61_5                      (0x0924)
+#define AFE_CONN62_5                      (0x0928)
+#define AFE_CONN63_5                      (0x092c)
+#define AFE_CONN64_5                      (0x0930)
+#define AFE_CONN65_5                      (0x0934)
+#define AFE_CONN66_5                      (0x0938)
+#define AFE_CONN67_5                      (0x093c)
+#define AFE_CONN68_5                      (0x0940)
+#define AFE_CONN69_5                      (0x0944)
+#define AFE_CONN70_5                      (0x0948)
+#define AFE_CONN71_5                      (0x094c)
+#define AFE_CONN72_5                      (0x0950)
+#define AFE_CONN73_5                      (0x0954)
+#define AFE_CONN74_5                      (0x0958)
+#define AFE_CONN75_5                      (0x095c)
+#define AFE_CONN76_5                      (0x0960)
+#define AFE_CONN77_5                      (0x0964)
+#define AFE_CONN78_5                      (0x0968)
+#define AFE_CONN79_5                      (0x096c)
+#define AFE_CONN80_5                      (0x0970)
+#define AFE_CONN81_5                      (0x0974)
+#define AFE_CONN82_5                      (0x0978)
+#define AFE_CONN83_5                      (0x097c)
+#define AFE_CONN84_5                      (0x0980)
+#define AFE_CONN85_5                      (0x0984)
+#define AFE_CONN86_5                      (0x0988)
+#define AFE_CONN87_5                      (0x098c)
+#define AFE_CONN88_5                      (0x0990)
+#define AFE_CONN89_5                      (0x0994)
+#define AFE_CONN90_5                      (0x0998)
+#define AFE_CONN91_5                      (0x099c)
+#define AFE_CONN92_5                      (0x09a0)
+#define AFE_CONN93_5                      (0x09a4)
+#define AFE_CONN94_5                      (0x09a8)
+#define AFE_CONN95_5                      (0x09ac)
+#define AFE_CONN96_5                      (0x09b0)
+#define AFE_CONN97_5                      (0x09b4)
+#define AFE_CONN98_5                      (0x09b8)
+#define AFE_CONN99_5                      (0x09bc)
+#define AFE_CONN100_5                     (0x09c0)
+#define AFE_CONN101_5                     (0x09c4)
+#define AFE_CONN102_5                     (0x09c8)
+#define AFE_CONN103_5                     (0x09cc)
+#define AFE_CONN104_5                     (0x09d0)
+#define AFE_CONN105_5                     (0x09d4)
+#define AFE_CONN106_5                     (0x09d8)
+#define AFE_CONN107_5                     (0x09dc)
+#define AFE_CONN108_5                     (0x09e0)
+#define AFE_CONN109_5                     (0x09e4)
+#define AFE_CONN110_5                     (0x09e8)
+#define AFE_CONN111_5                     (0x09ec)
+#define AFE_CONN112_5                     (0x09f0)
+#define AFE_CONN113_5                     (0x09f4)
+#define AFE_CONN114_5                     (0x09f8)
+#define AFE_CONN115_5                     (0x09fc)
+#define AFE_CONN116_5                     (0x0a00)
+#define AFE_CONN117_5                     (0x0a04)
+#define AFE_CONN118_5                     (0x0a08)
+#define AFE_CONN119_5                     (0x0a0c)
+#define AFE_CONN120_5                     (0x0a10)
+#define AFE_CONN121_5                     (0x0a14)
+#define AFE_CONN122_5                     (0x0a18)
+#define AFE_CONN123_5                     (0x0a1c)
+#define AFE_CONN124_5                     (0x0a20)
+#define AFE_CONN125_5                     (0x0a24)
+#define AFE_CONN126_5                     (0x0a28)
+#define AFE_CONN127_5                     (0x0a2c)
+#define AFE_CONN128_5                     (0x0a30)
+#define AFE_CONN129_5                     (0x0a34)
+#define AFE_CONN130_5                     (0x0a38)
+#define AFE_CONN131_5                     (0x0a3c)
+#define AFE_CONN132_5                     (0x0a40)
+#define AFE_CONN133_5                     (0x0a44)
+#define AFE_CONN134_5                     (0x0a48)
+#define AFE_CONN135_5                     (0x0a4c)
+#define AFE_CONN136_5                     (0x0a50)
+#define AFE_CONN137_5                     (0x0a54)
+#define AFE_CONN138_5                     (0x0a58)
+#define AFE_CONN139_5                     (0x0a5c)
+#define AFE_CONN_RS_5                     (0x0a60)
+#define AFE_CONN_DI_5                     (0x0a64)
+#define AFE_CONN_16BIT_5                  (0x0a68)
+#define AFE_CONN_24BIT_5                  (0x0a6c)
+#define AFE_ASRC11_NEW_CON0               (0x0d80)
+#define AFE_ASRC11_NEW_CON1               (0x0d84)
+#define AFE_ASRC11_NEW_CON2               (0x0d88)
+#define AFE_ASRC11_NEW_CON3               (0x0d8c)
+#define AFE_ASRC11_NEW_CON4               (0x0d90)
+#define AFE_ASRC11_NEW_CON5               (0x0d94)
+#define AFE_ASRC11_NEW_CON6               (0x0d98)
+#define AFE_ASRC11_NEW_CON7               (0x0d9c)
+#define AFE_ASRC11_NEW_CON8               (0x0da0)
+#define AFE_ASRC11_NEW_CON9               (0x0da4)
+#define AFE_ASRC11_NEW_CON10              (0x0da8)
+#define AFE_ASRC11_NEW_CON11              (0x0dac)
+#define AFE_ASRC11_NEW_CON13              (0x0db4)
+#define AFE_ASRC11_NEW_CON14              (0x0db8)
+#define AFE_ASRC12_NEW_CON0               (0x0dc0)
+#define AFE_ASRC12_NEW_CON1               (0x0dc4)
+#define AFE_ASRC12_NEW_CON2               (0x0dc8)
+#define AFE_ASRC12_NEW_CON3               (0x0dcc)
+#define AFE_ASRC12_NEW_CON4               (0x0dd0)
+#define AFE_ASRC12_NEW_CON5               (0x0dd4)
+#define AFE_ASRC12_NEW_CON6               (0x0dd8)
+#define AFE_ASRC12_NEW_CON7               (0x0ddc)
+#define AFE_ASRC12_NEW_CON8               (0x0de0)
+#define AFE_ASRC12_NEW_CON9               (0x0de4)
+#define AFE_ASRC12_NEW_CON10              (0x0de8)
+#define AFE_ASRC12_NEW_CON11              (0x0dec)
+#define AFE_ASRC12_NEW_CON13              (0x0df4)
+#define AFE_ASRC12_NEW_CON14              (0x0df8)
+#define AFE_LRCK_CNT                      (0x1018)
+#define AFE_DAC_CON0                      (0x1200)
+#define AFE_DAC_CON1                      (0x1204)
+#define AFE_DAC_CON2                      (0x1208)
+#define AFE_DAC_MON0                      (0x1218)
+#define AFE_DL2_BASE                      (0x1250)
+#define AFE_DL2_CUR                       (0x1254)
+#define AFE_DL2_END                       (0x1258)
+#define AFE_DL2_CON0                      (0x125c)
+#define AFE_DL3_BASE                      (0x1260)
+#define AFE_DL3_CUR                       (0x1264)
+#define AFE_DL3_END                       (0x1268)
+#define AFE_DL3_CON0                      (0x126c)
+#define AFE_DL6_BASE                      (0x1290)
+#define AFE_DL6_CUR                       (0x1294)
+#define AFE_DL6_END                       (0x1298)
+#define AFE_DL6_CON0                      (0x129c)
+#define AFE_DL7_BASE                      (0x12a0)
+#define AFE_DL7_CUR                       (0x12a4)
+#define AFE_DL7_END                       (0x12a8)
+#define AFE_DL7_CON0                      (0x12ac)
+#define AFE_DL8_BASE                      (0x12b0)
+#define AFE_DL8_CUR                       (0x12b4)
+#define AFE_DL8_END                       (0x12b8)
+#define AFE_DL8_CON0                      (0x12bc)
+#define AFE_DL10_BASE                     (0x12d0)
+#define AFE_DL10_CUR                      (0x12d4)
+#define AFE_DL10_END                      (0x12d8)
+#define AFE_DL10_CON0                     (0x12dc)
+#define AFE_DL11_BASE                     (0x12e0)
+#define AFE_DL11_CUR                      (0x12e4)
+#define AFE_DL11_END                      (0x12e8)
+#define AFE_DL11_CON0                     (0x12ec)
+#define AFE_UL1_BASE                      (0x1300)
+#define AFE_UL1_CUR                       (0x1304)
+#define AFE_UL1_END                       (0x1308)
+#define AFE_UL1_CON0                      (0x130c)
+#define AFE_UL2_BASE                      (0x1310)
+#define AFE_UL2_CUR                       (0x1314)
+#define AFE_UL2_END                       (0x1318)
+#define AFE_UL2_CON0                      (0x131c)
+#define AFE_UL3_BASE                      (0x1320)
+#define AFE_UL3_CUR                       (0x1324)
+#define AFE_UL3_END                       (0x1328)
+#define AFE_UL3_CON0                      (0x132c)
+#define AFE_UL4_BASE                      (0x1330)
+#define AFE_UL4_CUR                       (0x1334)
+#define AFE_UL4_END                       (0x1338)
+#define AFE_UL4_CON0                      (0x133c)
+#define AFE_UL5_BASE                      (0x1340)
+#define AFE_UL5_CUR                       (0x1344)
+#define AFE_UL5_END                       (0x1348)
+#define AFE_UL5_CON0                      (0x134c)
+#define AFE_UL6_BASE                      (0x1350)
+#define AFE_UL6_CUR                       (0x1354)
+#define AFE_UL6_END                       (0x1358)
+#define AFE_UL6_CON0                      (0x135c)
+#define AFE_UL8_BASE                      (0x1370)
+#define AFE_UL8_CUR                       (0x1374)
+#define AFE_UL8_END                       (0x1378)
+#define AFE_UL8_CON0                      (0x137c)
+#define AFE_UL9_BASE                      (0x1380)
+#define AFE_UL9_CUR                       (0x1384)
+#define AFE_UL9_END                       (0x1388)
+#define AFE_UL9_CON0                      (0x138c)
+#define AFE_UL10_BASE                     (0x13d0)
+#define AFE_UL10_CUR                      (0x13d4)
+#define AFE_UL10_END                      (0x13d8)
+#define AFE_UL10_CON0                     (0x13dc)
+#define AFE_DL8_CHK_SUM1                  (0x1400)
+#define AFE_DL8_CHK_SUM2                  (0x1404)
+#define AFE_DL8_CHK_SUM3                  (0x1408)
+#define AFE_DL8_CHK_SUM4                  (0x140c)
+#define AFE_DL8_CHK_SUM5                  (0x1410)
+#define AFE_DL8_CHK_SUM6                  (0x1414)
+#define AFE_DL10_CHK_SUM1                 (0x1418)
+#define AFE_DL10_CHK_SUM2                 (0x141c)
+#define AFE_DL10_CHK_SUM3                 (0x1420)
+#define AFE_DL10_CHK_SUM4                 (0x1424)
+#define AFE_DL10_CHK_SUM5                 (0x1428)
+#define AFE_DL10_CHK_SUM6                 (0x142c)
+#define AFE_DL11_CHK_SUM1                 (0x1430)
+#define AFE_DL11_CHK_SUM2                 (0x1434)
+#define AFE_DL11_CHK_SUM3                 (0x1438)
+#define AFE_DL11_CHK_SUM4                 (0x143c)
+#define AFE_DL11_CHK_SUM5                 (0x1440)
+#define AFE_DL11_CHK_SUM6                 (0x1444)
+#define AFE_UL1_CHK_SUM1                  (0x1450)
+#define AFE_UL1_CHK_SUM2                  (0x1454)
+#define AFE_UL2_CHK_SUM1                  (0x1458)
+#define AFE_UL2_CHK_SUM2                  (0x145c)
+#define AFE_UL3_CHK_SUM1                  (0x1460)
+#define AFE_UL3_CHK_SUM2                  (0x1464)
+#define AFE_UL4_CHK_SUM1                  (0x1468)
+#define AFE_UL4_CHK_SUM2                  (0x146c)
+#define AFE_UL5_CHK_SUM1                  (0x1470)
+#define AFE_UL5_CHK_SUM2                  (0x1474)
+#define AFE_UL6_CHK_SUM1                  (0x1478)
+#define AFE_UL6_CHK_SUM2                  (0x147c)
+#define AFE_UL8_CHK_SUM1                  (0x1488)
+#define AFE_UL8_CHK_SUM2                  (0x148c)
+#define AFE_DL2_CHK_SUM1                  (0x14a0)
+#define AFE_DL2_CHK_SUM2                  (0x14a4)
+#define AFE_DL3_CHK_SUM1                  (0x14b0)
+#define AFE_DL3_CHK_SUM2                  (0x14b4)
+#define AFE_DL6_CHK_SUM1                  (0x14e0)
+#define AFE_DL6_CHK_SUM2                  (0x14e4)
+#define AFE_DL7_CHK_SUM1                  (0x14f0)
+#define AFE_DL7_CHK_SUM2                  (0x14f4)
+#define AFE_UL9_CHK_SUM1                  (0x1528)
+#define AFE_UL9_CHK_SUM2                  (0x152c)
+#define AFE_BUS_MON1                      (0x1540)
+#define UL1_MOD2AGT_CNT_LAT               (0x1568)
+#define UL2_MOD2AGT_CNT_LAT               (0x156c)
+#define UL3_MOD2AGT_CNT_LAT               (0x1570)
+#define UL4_MOD2AGT_CNT_LAT               (0x1574)
+#define UL5_MOD2AGT_CNT_LAT               (0x1578)
+#define UL6_MOD2AGT_CNT_LAT               (0x157c)
+#define UL8_MOD2AGT_CNT_LAT               (0x1588)
+#define UL9_MOD2AGT_CNT_LAT               (0x158c)
+#define UL10_MOD2AGT_CNT_LAT              (0x1590)
+#define AFE_MEMIF_AGENT_FS_CON0           (0x15a0)
+#define AFE_MEMIF_AGENT_FS_CON1           (0x15a4)
+#define AFE_MEMIF_AGENT_FS_CON2           (0x15a8)
+#define AFE_MEMIF_AGENT_FS_CON3           (0x15ac)
+#define AFE_MEMIF_BURST_CFG               (0x1600)
+#define AFE_MEMIF_BUF_FULL_MON            (0x1610)
+#define AFE_MEMIF_BUF_MON1                (0x161c)
+#define AFE_MEMIF_BUF_MON3                (0x1624)
+#define AFE_MEMIF_BUF_MON4                (0x1628)
+#define AFE_MEMIF_BUF_MON5                (0x162c)
+#define AFE_MEMIF_BUF_MON6                (0x1630)
+#define AFE_MEMIF_BUF_MON7                (0x1634)
+#define AFE_MEMIF_BUF_MON8                (0x1638)
+#define AFE_MEMIF_BUF_MON9                (0x163c)
+#define AFE_MEMIF_BUF_MON10               (0x1640)
+#define DL2_AGENT2MODULE_CNT              (0x1678)
+#define DL3_AGENT2MODULE_CNT              (0x167c)
+#define DL6_AGENT2MODULE_CNT              (0x1688)
+#define DL7_AGENT2MODULE_CNT              (0x168c)
+#define DL8_AGENT2MODULE_CNT              (0x1690)
+#define DL10_AGENT2MODULE_CNT             (0x1698)
+#define DL11_AGENT2MODULE_CNT             (0x169c)
+#define UL1_MODULE2AGENT_CNT              (0x16a0)
+#define UL2_MODULE2AGENT_CNT              (0x16a4)
+#define UL3_MODULE2AGENT_CNT              (0x16a8)
+#define UL4_MODULE2AGENT_CNT              (0x16ac)
+#define UL5_MODULE2AGENT_CNT              (0x16b0)
+#define UL6_MODULE2AGENT_CNT              (0x16b4)
+#define UL8_MODULE2AGENT_CNT              (0x16bc)
+#define UL9_MODULE2AGENT_CNT              (0x16c0)
+#define UL10_MODULE2AGENT_CNT             (0x16c4)
+#define AFE_SECURE_CON2                   (0x1798)
+#define AFE_SECURE_CON1                   (0x179c)
+#define AFE_SECURE_CON                    (0x17a0)
+#define AFE_SRAM_BOUND                    (0x17a4)
+#define AFE_SE_SECURE_CON                 (0x17a8)
+#define AFE_SECURE_MASK_LOOPBACK          (0x17bc)
+#define AFE_SECURE_SIDEBAND0              (0x1908)
+#define AFE_SECURE_SIDEBAND1              (0x190c)
+#define AFE_SECURE_SIDEBAND2              (0x1910)
+#define AFE_SECURE_SIDEBAND3              (0x1914)
+#define AFE_SECURE_MASK_BASE_ADR_MSB      (0x1920)
+#define AFE_SECURE_MASK_END_ADR_MSB       (0x1924)
+#define AFE_NORMAL_BASE_ADR_MSB           (0x192c)
+#define AFE_NORMAL_END_ADR_MSB            (0x1930)
+#define AFE_SECURE_MASK_LOOPBACK0         (0x1940)
+#define AFE_SECURE_MASK_LOOPBACK1         (0x1944)
+#define AFE_SECURE_MASK_LOOPBACK2         (0x1948)
+#define AFE_LOOPBACK_CFG0                 (0x1950)
+#define AFE_LOOPBACK_CFG1                 (0x1954)
+#define AFE_LOOPBACK_CFG2                 (0x1958)
+#define AFE_DMIC0_UL_SRC_CON0             (0x1a00)
+#define AFE_DMIC0_UL_SRC_CON1             (0x1a04)
+#define AFE_DMIC0_SRC_DEBUG               (0x1a08)
+#define AFE_DMIC0_SRC_DEBUG_MON0          (0x1a0c)
+#define AFE_DMIC0_UL_SRC_MON0             (0x1a10)
+#define AFE_DMIC0_UL_SRC_MON1             (0x1a14)
+#define AFE_DMIC0_IIR_COEF_02_01          (0x1a18)
+#define AFE_DMIC0_IIR_COEF_04_03          (0x1a1c)
+#define AFE_DMIC0_IIR_COEF_06_05          (0x1a20)
+#define AFE_DMIC0_IIR_COEF_08_07          (0x1a24)
+#define AFE_DMIC0_IIR_COEF_10_09          (0x1a28)
+#define AFE_DMIC1_UL_SRC_CON0             (0x1a68)
+#define AFE_DMIC1_UL_SRC_CON1             (0x1a6c)
+#define AFE_DMIC1_SRC_DEBUG               (0x1a70)
+#define AFE_DMIC1_SRC_DEBUG_MON0          (0x1a74)
+#define AFE_DMIC1_UL_SRC_MON0             (0x1a78)
+#define AFE_DMIC1_UL_SRC_MON1             (0x1a7c)
+#define AFE_DMIC1_IIR_COEF_02_01          (0x1a80)
+#define AFE_DMIC1_IIR_COEF_04_03          (0x1a84)
+#define AFE_DMIC1_IIR_COEF_06_05          (0x1a88)
+#define AFE_DMIC1_IIR_COEF_08_07          (0x1a8c)
+#define AFE_DMIC1_IIR_COEF_10_09          (0x1a90)
+#define AFE_DMIC2_UL_SRC_CON0             (0x1ad0)
+#define AFE_DMIC2_UL_SRC_CON1             (0x1ad4)
+#define AFE_DMIC2_SRC_DEBUG               (0x1ad8)
+#define AFE_DMIC2_SRC_DEBUG_MON0          (0x1adc)
+#define AFE_DMIC2_UL_SRC_MON0             (0x1ae0)
+#define AFE_DMIC2_UL_SRC_MON1             (0x1ae4)
+#define AFE_DMIC2_IIR_COEF_02_01          (0x1ae8)
+#define AFE_DMIC2_IIR_COEF_04_03          (0x1aec)
+#define AFE_DMIC2_IIR_COEF_06_05          (0x1af0)
+#define AFE_DMIC2_IIR_COEF_08_07          (0x1af4)
+#define AFE_DMIC2_IIR_COEF_10_09          (0x1af8)
+#define AFE_DMIC3_UL_SRC_CON0             (0x1b38)
+#define AFE_DMIC3_UL_SRC_CON1             (0x1b3c)
+#define AFE_DMIC3_SRC_DEBUG               (0x1b40)
+#define AFE_DMIC3_SRC_DEBUG_MON0          (0x1b44)
+#define AFE_DMIC3_UL_SRC_MON0             (0x1b48)
+#define AFE_DMIC3_UL_SRC_MON1             (0x1b4c)
+#define AFE_DMIC3_IIR_COEF_02_01          (0x1b50)
+#define AFE_DMIC3_IIR_COEF_04_03          (0x1b54)
+#define AFE_DMIC3_IIR_COEF_06_05          (0x1b58)
+#define AFE_DMIC3_IIR_COEF_08_07          (0x1b5c)
+#define AFE_DMIC3_IIR_COEF_10_09          (0x1b60)
+#define DMIC_BYPASS_HW_GAIN               (0x1bf0)
+#define DMIC_GAIN1_CON0                   (0x1c00)
+#define DMIC_GAIN1_CON1                   (0x1c04)
+#define DMIC_GAIN1_CON2                   (0x1c08)
+#define DMIC_GAIN1_CON3                   (0x1c0c)
+#define DMIC_GAIN1_CUR                    (0x1c10)
+#define DMIC_GAIN2_CON0                   (0x1c20)
+#define DMIC_GAIN2_CON1                   (0x1c24)
+#define DMIC_GAIN2_CON2                   (0x1c28)
+#define DMIC_GAIN2_CON3                   (0x1c2c)
+#define DMIC_GAIN2_CUR                    (0x1c30)
+#define DMIC_GAIN3_CON0                   (0x1c40)
+#define DMIC_GAIN3_CON1                   (0x1c44)
+#define DMIC_GAIN3_CON2                   (0x1c48)
+#define DMIC_GAIN3_CON3                   (0x1c4c)
+#define DMIC_GAIN3_CUR                    (0x1c50)
+#define DMIC_GAIN4_CON0                   (0x1c60)
+#define DMIC_GAIN4_CON1                   (0x1c64)
+#define DMIC_GAIN4_CON2                   (0x1c68)
+#define DMIC_GAIN4_CON3                   (0x1c6c)
+#define DMIC_GAIN4_CUR                    (0x1c70)
+#define ETDM_OUT1_DSD_FADE_CON            (0x2260)
+#define ETDM_OUT1_DSD_FADE_CON1           (0x2264)
+#define ETDM_OUT3_DSD_FADE_CON            (0x2280)
+#define ETDM_OUT3_DSD_FADE_CON1           (0x2284)
+#define ETDM_IN1_AFIFO_CON                (0x2294)
+#define ETDM_IN2_AFIFO_CON                (0x2298)
+#define ETDM_IN1_MONITOR                  (0x22c0)
+#define ETDM_IN2_MONITOR                  (0x22c4)
+#define ETDM_OUT1_MONITOR                 (0x22d0)
+#define ETDM_OUT2_MONITOR                 (0x22d4)
+#define ETDM_OUT3_MONITOR                 (0x22d8)
+#define ETDM_COWORK_SEC_CON0              (0x22e0)
+#define ETDM_COWORK_SEC_CON1              (0x22e4)
+#define ETDM_COWORK_SEC_CON2              (0x22e8)
+#define ETDM_COWORK_SEC_CON3              (0x22ec)
+#define ETDM_COWORK_CON0                  (0x22f0)
+#define ETDM_COWORK_CON1                  (0x22f4)
+#define ETDM_COWORK_CON2                  (0x22f8)
+#define ETDM_COWORK_CON3                  (0x22fc)
+#define ETDM_IN1_CON0                     (0x2300)
+#define ETDM_IN1_CON1                     (0x2304)
+#define ETDM_IN1_CON2                     (0x2308)
+#define ETDM_IN1_CON3                     (0x230c)
+#define ETDM_IN1_CON4                     (0x2310)
+#define ETDM_IN1_CON5                     (0x2314)
+#define ETDM_IN1_CON6                     (0x2318)
+#define ETDM_IN1_CON7                     (0x231c)
+#define ETDM_IN2_CON0                     (0x2320)
+#define ETDM_IN2_CON1                     (0x2324)
+#define ETDM_IN2_CON2                     (0x2328)
+#define ETDM_IN2_CON3                     (0x232c)
+#define ETDM_IN2_CON4                     (0x2330)
+#define ETDM_IN2_CON5                     (0x2334)
+#define ETDM_IN2_CON6                     (0x2338)
+#define ETDM_IN2_CON7                     (0x233c)
+#define ETDM_OUT1_CON0                    (0x2380)
+#define ETDM_OUT1_CON1                    (0x2384)
+#define ETDM_OUT1_CON2                    (0x2388)
+#define ETDM_OUT1_CON3                    (0x238c)
+#define ETDM_OUT1_CON4                    (0x2390)
+#define ETDM_OUT1_CON5                    (0x2394)
+#define ETDM_OUT1_CON6                    (0x2398)
+#define ETDM_OUT1_CON7                    (0x239c)
+#define ETDM_OUT2_CON0                    (0x23a0)
+#define ETDM_OUT2_CON1                    (0x23a4)
+#define ETDM_OUT2_CON2                    (0x23a8)
+#define ETDM_OUT2_CON3                    (0x23ac)
+#define ETDM_OUT2_CON4                    (0x23b0)
+#define ETDM_OUT2_CON5                    (0x23b4)
+#define ETDM_OUT2_CON6                    (0x23b8)
+#define ETDM_OUT2_CON7                    (0x23bc)
+#define ETDM_OUT3_CON0                    (0x23c0)
+#define ETDM_OUT3_CON1                    (0x23c4)
+#define ETDM_OUT3_CON2                    (0x23c8)
+#define ETDM_OUT3_CON3                    (0x23cc)
+#define ETDM_OUT3_CON4                    (0x23d0)
+#define ETDM_OUT3_CON5                    (0x23d4)
+#define ETDM_OUT3_CON6                    (0x23d8)
+#define ETDM_OUT3_CON7                    (0x23dc)
+#define ETDM_OUT3_CON8                    (0x23e0)
+#define ETDM_OUT1_CON8                    (0x23e4)
+#define ETDM_OUT2_CON8                    (0x23e8)
+#define GASRC_TIMING_CON0                 (0x2414)
+#define GASRC_TIMING_CON1                 (0x2418)
+#define GASRC_TIMING_CON2                 (0x241c)
+#define GASRC_TIMING_CON3                 (0x2420)
+#define GASRC_TIMING_CON4                 (0x2424)
+#define GASRC_TIMING_CON5                 (0x2428)
+#define GASRC_TIMING_CON6                 (0x242c)
+#define GASRC_TIMING_CON7                 (0x2430)
+#define A3_A4_TIMING_SEL0                 (0x2440)
+#define A3_A4_TIMING_SEL1                 (0x2444)
+#define A3_A4_TIMING_SEL2                 (0x2448)
+#define A3_A4_TIMING_SEL3                 (0x244c)
+#define A3_A4_TIMING_SEL4                 (0x2450)
+#define A3_A4_TIMING_SEL5                 (0x2454)
+#define A3_A4_TIMING_SEL6                 (0x2458)
+#define ASYS_TOP_DEBUG                    (0x2500)
+#define AFE_DPTX_CON                      (0x2558)
+#define AFE_DPTX_MON                      (0x255c)
+#define AFE_ADDA_DL_SRC2_CON0             (0x2d00)
+#define AFE_ADDA_DL_SRC2_CON1             (0x2d04)
+#define AFE_ADDA_TOP_CON0                 (0x2d0c)
+#define AFE_ADDA_UL_DL_CON0               (0x2d10)
+#define AFE_ADDA_SRC_DEBUG                (0x2d14)
+#define AFE_ADDA_SRC_DEBUG_MON0           (0x2d18)
+#define AFE_ADDA_SRC_DEBUG_MON1           (0x2d20)
+#define AFE_ADDA_PREDIS_CON0              (0x2d24)
+#define AFE_ADDA_PREDIS_CON1              (0x2d28)
+#define AFE_ADDA_PREDIS_CON2              (0x2d2c)
+#define AFE_ADDA_PREDIS_CON3              (0x2d30)
+#define AFE_ADDA_DL_SDM_DCCOMP_CON        (0x2d34)
+#define AFE_ADDA_DL_SDM_TEST              (0x2d38)
+#define AFE_ADDA_DL_DC_COMP_CFG0          (0x2d3c)
+#define AFE_ADDA_DL_DC_COMP_CFG1          (0x2d40)
+#define AFE_ADDA_DL_SDM_FIFO_MON          (0x2d44)
+#define AFE_ADDA_DL_SRC_LCH_MON           (0x2d50)
+#define AFE_ADDA_DL_SRC_RCH_MON           (0x2d54)
+#define AFE_ADDA_DL_SDM_OUT_MON           (0x2d58)
+#define AFE_ADDA_DL_SDM_DITHER_CON        (0x2d5c)
+#define AFE_ADDA_DL_SDM_AUTO_RESET_CON    (0x2d60)
+#define AFE_ADDA_UL_SRC_CON0              (0x2e3c)
+#define AFE_ADDA_UL_SRC_CON1              (0x2e40)
+#define AFE_CONN0                         (0x3000)
+#define AFE_CONN0_1                       (0x3004)
+#define AFE_CONN0_2                       (0x3008)
+#define AFE_CONN0_3                       (0x300c)
+#define AFE_CONN0_4                       (0x3010)
+#define AFE_CONN1                         (0x3014)
+#define AFE_CONN1_1                       (0x3018)
+#define AFE_CONN1_2                       (0x301c)
+#define AFE_CONN1_3                       (0x3020)
+#define AFE_CONN1_4                       (0x3024)
+#define AFE_CONN2                         (0x3028)
+#define AFE_CONN2_1                       (0x302c)
+#define AFE_CONN2_2                       (0x3030)
+#define AFE_CONN2_3                       (0x3034)
+#define AFE_CONN2_4                       (0x3038)
+#define AFE_CONN3                         (0x303c)
+#define AFE_CONN3_1                       (0x3040)
+#define AFE_CONN3_2                       (0x3044)
+#define AFE_CONN3_3                       (0x3048)
+#define AFE_CONN3_4                       (0x304c)
+#define AFE_CONN4                         (0x3050)
+#define AFE_CONN4_1                       (0x3054)
+#define AFE_CONN4_2                       (0x3058)
+#define AFE_CONN4_3                       (0x305c)
+#define AFE_CONN4_4                       (0x3060)
+#define AFE_CONN5                         (0x3064)
+#define AFE_CONN5_1                       (0x3068)
+#define AFE_CONN5_2                       (0x306c)
+#define AFE_CONN5_3                       (0x3070)
+#define AFE_CONN5_4                       (0x3074)
+#define AFE_CONN6                         (0x3078)
+#define AFE_CONN6_1                       (0x307c)
+#define AFE_CONN6_2                       (0x3080)
+#define AFE_CONN6_3                       (0x3084)
+#define AFE_CONN6_4                       (0x3088)
+#define AFE_CONN7                         (0x308c)
+#define AFE_CONN7_1                       (0x3090)
+#define AFE_CONN7_2                       (0x3094)
+#define AFE_CONN7_3                       (0x3098)
+#define AFE_CONN7_4                       (0x309c)
+#define AFE_CONN8                         (0x30a0)
+#define AFE_CONN8_1                       (0x30a4)
+#define AFE_CONN8_2                       (0x30a8)
+#define AFE_CONN8_3                       (0x30ac)
+#define AFE_CONN8_4                       (0x30b0)
+#define AFE_CONN9                         (0x30b4)
+#define AFE_CONN9_1                       (0x30b8)
+#define AFE_CONN9_2                       (0x30bc)
+#define AFE_CONN9_3                       (0x30c0)
+#define AFE_CONN9_4                       (0x30c4)
+#define AFE_CONN10                        (0x30c8)
+#define AFE_CONN10_1                      (0x30cc)
+#define AFE_CONN10_2                      (0x30d0)
+#define AFE_CONN10_3                      (0x30d4)
+#define AFE_CONN10_4                      (0x30d8)
+#define AFE_CONN11                        (0x30dc)
+#define AFE_CONN11_1                      (0x30e0)
+#define AFE_CONN11_2                      (0x30e4)
+#define AFE_CONN11_3                      (0x30e8)
+#define AFE_CONN11_4                      (0x30ec)
+#define AFE_CONN12                        (0x30f0)
+#define AFE_CONN12_1                      (0x30f4)
+#define AFE_CONN12_2                      (0x30f8)
+#define AFE_CONN12_3                      (0x30fc)
+#define AFE_CONN12_4                      (0x3100)
+#define AFE_CONN13                        (0x3104)
+#define AFE_CONN13_1                      (0x3108)
+#define AFE_CONN13_2                      (0x310c)
+#define AFE_CONN13_3                      (0x3110)
+#define AFE_CONN13_4                      (0x3114)
+#define AFE_CONN14                        (0x3118)
+#define AFE_CONN14_1                      (0x311c)
+#define AFE_CONN14_2                      (0x3120)
+#define AFE_CONN14_3                      (0x3124)
+#define AFE_CONN14_4                      (0x3128)
+#define AFE_CONN15                        (0x312c)
+#define AFE_CONN15_1                      (0x3130)
+#define AFE_CONN15_2                      (0x3134)
+#define AFE_CONN15_3                      (0x3138)
+#define AFE_CONN15_4                      (0x313c)
+#define AFE_CONN16                        (0x3140)
+#define AFE_CONN16_1                      (0x3144)
+#define AFE_CONN16_2                      (0x3148)
+#define AFE_CONN16_3                      (0x314c)
+#define AFE_CONN16_4                      (0x3150)
+#define AFE_CONN17                        (0x3154)
+#define AFE_CONN17_1                      (0x3158)
+#define AFE_CONN17_2                      (0x315c)
+#define AFE_CONN17_3                      (0x3160)
+#define AFE_CONN17_4                      (0x3164)
+#define AFE_CONN18                        (0x3168)
+#define AFE_CONN18_1                      (0x316c)
+#define AFE_CONN18_2                      (0x3170)
+#define AFE_CONN18_3                      (0x3174)
+#define AFE_CONN18_4                      (0x3178)
+#define AFE_CONN19                        (0x317c)
+#define AFE_CONN19_1                      (0x3180)
+#define AFE_CONN19_2                      (0x3184)
+#define AFE_CONN19_3                      (0x3188)
+#define AFE_CONN19_4                      (0x318c)
+#define AFE_CONN20                        (0x3190)
+#define AFE_CONN20_1                      (0x3194)
+#define AFE_CONN20_2                      (0x3198)
+#define AFE_CONN20_3                      (0x319c)
+#define AFE_CONN20_4                      (0x31a0)
+#define AFE_CONN21                        (0x31a4)
+#define AFE_CONN21_1                      (0x31a8)
+#define AFE_CONN21_2                      (0x31ac)
+#define AFE_CONN21_3                      (0x31b0)
+#define AFE_CONN21_4                      (0x31b4)
+#define AFE_CONN22                        (0x31b8)
+#define AFE_CONN22_1                      (0x31bc)
+#define AFE_CONN22_2                      (0x31c0)
+#define AFE_CONN22_3                      (0x31c4)
+#define AFE_CONN22_4                      (0x31c8)
+#define AFE_CONN23                        (0x31cc)
+#define AFE_CONN23_1                      (0x31d0)
+#define AFE_CONN23_2                      (0x31d4)
+#define AFE_CONN23_3                      (0x31d8)
+#define AFE_CONN23_4                      (0x31dc)
+#define AFE_CONN24                        (0x31e0)
+#define AFE_CONN24_1                      (0x31e4)
+#define AFE_CONN24_2                      (0x31e8)
+#define AFE_CONN24_3                      (0x31ec)
+#define AFE_CONN24_4                      (0x31f0)
+#define AFE_CONN25                        (0x31f4)
+#define AFE_CONN25_1                      (0x31f8)
+#define AFE_CONN25_2                      (0x31fc)
+#define AFE_CONN25_3                      (0x3200)
+#define AFE_CONN25_4                      (0x3204)
+#define AFE_CONN26                        (0x3208)
+#define AFE_CONN26_1                      (0x320c)
+#define AFE_CONN26_2                      (0x3210)
+#define AFE_CONN26_3                      (0x3214)
+#define AFE_CONN26_4                      (0x3218)
+#define AFE_CONN27                        (0x321c)
+#define AFE_CONN27_1                      (0x3220)
+#define AFE_CONN27_2                      (0x3224)
+#define AFE_CONN27_3                      (0x3228)
+#define AFE_CONN27_4                      (0x322c)
+#define AFE_CONN28                        (0x3230)
+#define AFE_CONN28_1                      (0x3234)
+#define AFE_CONN28_2                      (0x3238)
+#define AFE_CONN28_3                      (0x323c)
+#define AFE_CONN28_4                      (0x3240)
+#define AFE_CONN29                        (0x3244)
+#define AFE_CONN29_1                      (0x3248)
+#define AFE_CONN29_2                      (0x324c)
+#define AFE_CONN29_3                      (0x3250)
+#define AFE_CONN29_4                      (0x3254)
+#define AFE_CONN30                        (0x3258)
+#define AFE_CONN30_1                      (0x325c)
+#define AFE_CONN30_2                      (0x3260)
+#define AFE_CONN30_3                      (0x3264)
+#define AFE_CONN30_4                      (0x3268)
+#define AFE_CONN31                        (0x326c)
+#define AFE_CONN31_1                      (0x3270)
+#define AFE_CONN31_2                      (0x3274)
+#define AFE_CONN31_3                      (0x3278)
+#define AFE_CONN31_4                      (0x327c)
+#define AFE_CONN32                        (0x3280)
+#define AFE_CONN32_1                      (0x3284)
+#define AFE_CONN32_2                      (0x3288)
+#define AFE_CONN32_3                      (0x328c)
+#define AFE_CONN32_4                      (0x3290)
+#define AFE_CONN33                        (0x3294)
+#define AFE_CONN33_1                      (0x3298)
+#define AFE_CONN33_2                      (0x329c)
+#define AFE_CONN33_3                      (0x32a0)
+#define AFE_CONN33_4                      (0x32a4)
+#define AFE_CONN34                        (0x32a8)
+#define AFE_CONN34_1                      (0x32ac)
+#define AFE_CONN34_2                      (0x32b0)
+#define AFE_CONN34_3                      (0x32b4)
+#define AFE_CONN34_4                      (0x32b8)
+#define AFE_CONN35                        (0x32bc)
+#define AFE_CONN35_1                      (0x32c0)
+#define AFE_CONN35_2                      (0x32c4)
+#define AFE_CONN35_3                      (0x32c8)
+#define AFE_CONN35_4                      (0x32cc)
+#define AFE_CONN36                        (0x32d0)
+#define AFE_CONN36_1                      (0x32d4)
+#define AFE_CONN36_2                      (0x32d8)
+#define AFE_CONN36_3                      (0x32dc)
+#define AFE_CONN36_4                      (0x32e0)
+#define AFE_CONN37                        (0x32e4)
+#define AFE_CONN37_1                      (0x32e8)
+#define AFE_CONN37_2                      (0x32ec)
+#define AFE_CONN37_3                      (0x32f0)
+#define AFE_CONN37_4                      (0x32f4)
+#define AFE_CONN38                        (0x32f8)
+#define AFE_CONN38_1                      (0x32fc)
+#define AFE_CONN38_2                      (0x3300)
+#define AFE_CONN38_3                      (0x3304)
+#define AFE_CONN38_4                      (0x3308)
+#define AFE_CONN39                        (0x330c)
+#define AFE_CONN39_1                      (0x3310)
+#define AFE_CONN39_2                      (0x3314)
+#define AFE_CONN39_3                      (0x3318)
+#define AFE_CONN39_4                      (0x331c)
+#define AFE_CONN40                        (0x3320)
+#define AFE_CONN40_1                      (0x3324)
+#define AFE_CONN40_2                      (0x3328)
+#define AFE_CONN40_3                      (0x332c)
+#define AFE_CONN40_4                      (0x3330)
+#define AFE_CONN41                        (0x3334)
+#define AFE_CONN41_1                      (0x3338)
+#define AFE_CONN41_2                      (0x333c)
+#define AFE_CONN41_3                      (0x3340)
+#define AFE_CONN41_4                      (0x3344)
+#define AFE_CONN42                        (0x3348)
+#define AFE_CONN42_1                      (0x334c)
+#define AFE_CONN42_2                      (0x3350)
+#define AFE_CONN42_3                      (0x3354)
+#define AFE_CONN42_4                      (0x3358)
+#define AFE_CONN43                        (0x335c)
+#define AFE_CONN43_1                      (0x3360)
+#define AFE_CONN43_2                      (0x3364)
+#define AFE_CONN43_3                      (0x3368)
+#define AFE_CONN43_4                      (0x336c)
+#define AFE_CONN44                        (0x3370)
+#define AFE_CONN44_1                      (0x3374)
+#define AFE_CONN44_2                      (0x3378)
+#define AFE_CONN44_3                      (0x337c)
+#define AFE_CONN44_4                      (0x3380)
+#define AFE_CONN45                        (0x3384)
+#define AFE_CONN45_1                      (0x3388)
+#define AFE_CONN45_2                      (0x338c)
+#define AFE_CONN45_3                      (0x3390)
+#define AFE_CONN45_4                      (0x3394)
+#define AFE_CONN46                        (0x3398)
+#define AFE_CONN46_1                      (0x339c)
+#define AFE_CONN46_2                      (0x33a0)
+#define AFE_CONN46_3                      (0x33a4)
+#define AFE_CONN46_4                      (0x33a8)
+#define AFE_CONN47                        (0x33ac)
+#define AFE_CONN47_1                      (0x33b0)
+#define AFE_CONN47_2                      (0x33b4)
+#define AFE_CONN47_3                      (0x33b8)
+#define AFE_CONN47_4                      (0x33bc)
+#define AFE_CONN48                        (0x33c0)
+#define AFE_CONN48_1                      (0x33c4)
+#define AFE_CONN48_2                      (0x33c8)
+#define AFE_CONN48_3                      (0x33cc)
+#define AFE_CONN48_4                      (0x33d0)
+#define AFE_CONN49                        (0x33d4)
+#define AFE_CONN49_1                      (0x33d8)
+#define AFE_CONN49_2                      (0x33dc)
+#define AFE_CONN49_3                      (0x33e0)
+#define AFE_CONN49_4                      (0x33e4)
+#define AFE_CONN50                        (0x33e8)
+#define AFE_CONN50_1                      (0x33ec)
+#define AFE_CONN50_2                      (0x33f0)
+#define AFE_CONN50_3                      (0x33f4)
+#define AFE_CONN50_4                      (0x33f8)
+#define AFE_CONN51                        (0x33fc)
+#define AFE_CONN51_1                      (0x3400)
+#define AFE_CONN51_2                      (0x3404)
+#define AFE_CONN51_3                      (0x3408)
+#define AFE_CONN51_4                      (0x340c)
+#define AFE_CONN52                        (0x3410)
+#define AFE_CONN52_1                      (0x3414)
+#define AFE_CONN52_2                      (0x3418)
+#define AFE_CONN52_3                      (0x341c)
+#define AFE_CONN52_4                      (0x3420)
+#define AFE_CONN53                        (0x3424)
+#define AFE_CONN53_1                      (0x3428)
+#define AFE_CONN53_2                      (0x342c)
+#define AFE_CONN53_3                      (0x3430)
+#define AFE_CONN53_4                      (0x3434)
+#define AFE_CONN54                        (0x3438)
+#define AFE_CONN54_1                      (0x343c)
+#define AFE_CONN54_2                      (0x3440)
+#define AFE_CONN54_3                      (0x3444)
+#define AFE_CONN54_4                      (0x3448)
+#define AFE_CONN55                        (0x344c)
+#define AFE_CONN55_1                      (0x3450)
+#define AFE_CONN55_2                      (0x3454)
+#define AFE_CONN55_3                      (0x3458)
+#define AFE_CONN55_4                      (0x345c)
+#define AFE_CONN56                        (0x3460)
+#define AFE_CONN56_1                      (0x3464)
+#define AFE_CONN56_2                      (0x3468)
+#define AFE_CONN56_3                      (0x346c)
+#define AFE_CONN56_4                      (0x3470)
+#define AFE_CONN57                        (0x3474)
+#define AFE_CONN57_1                      (0x3478)
+#define AFE_CONN57_2                      (0x347c)
+#define AFE_CONN57_3                      (0x3480)
+#define AFE_CONN57_4                      (0x3484)
+#define AFE_CONN58                        (0x3488)
+#define AFE_CONN58_1                      (0x348c)
+#define AFE_CONN58_2                      (0x3490)
+#define AFE_CONN58_3                      (0x3494)
+#define AFE_CONN58_4                      (0x3498)
+#define AFE_CONN59                        (0x349c)
+#define AFE_CONN59_1                      (0x34a0)
+#define AFE_CONN59_2                      (0x34a4)
+#define AFE_CONN59_3                      (0x34a8)
+#define AFE_CONN59_4                      (0x34ac)
+#define AFE_CONN60                        (0x34b0)
+#define AFE_CONN60_1                      (0x34b4)
+#define AFE_CONN60_2                      (0x34b8)
+#define AFE_CONN60_3                      (0x34bc)
+#define AFE_CONN60_4                      (0x34c0)
+#define AFE_CONN61                        (0x34c4)
+#define AFE_CONN61_1                      (0x34c8)
+#define AFE_CONN61_2                      (0x34cc)
+#define AFE_CONN61_3                      (0x34d0)
+#define AFE_CONN61_4                      (0x34d4)
+#define AFE_CONN62                        (0x34d8)
+#define AFE_CONN62_1                      (0x34dc)
+#define AFE_CONN62_2                      (0x34e0)
+#define AFE_CONN62_3                      (0x34e4)
+#define AFE_CONN62_4                      (0x34e8)
+#define AFE_CONN63                        (0x34ec)
+#define AFE_CONN63_1                      (0x34f0)
+#define AFE_CONN63_2                      (0x34f4)
+#define AFE_CONN63_3                      (0x34f8)
+#define AFE_CONN63_4                      (0x34fc)
+#define AFE_CONN64                        (0x3500)
+#define AFE_CONN64_1                      (0x3504)
+#define AFE_CONN64_2                      (0x3508)
+#define AFE_CONN64_3                      (0x350c)
+#define AFE_CONN64_4                      (0x3510)
+#define AFE_CONN65                        (0x3514)
+#define AFE_CONN65_1                      (0x3518)
+#define AFE_CONN65_2                      (0x351c)
+#define AFE_CONN65_3                      (0x3520)
+#define AFE_CONN65_4                      (0x3524)
+#define AFE_CONN66                        (0x3528)
+#define AFE_CONN66_1                      (0x352c)
+#define AFE_CONN66_2                      (0x3530)
+#define AFE_CONN66_3                      (0x3534)
+#define AFE_CONN66_4                      (0x3538)
+#define AFE_CONN67                        (0x353c)
+#define AFE_CONN67_1                      (0x3540)
+#define AFE_CONN67_2                      (0x3544)
+#define AFE_CONN67_3                      (0x3548)
+#define AFE_CONN67_4                      (0x354c)
+#define AFE_CONN68                        (0x3550)
+#define AFE_CONN68_1                      (0x3554)
+#define AFE_CONN68_2                      (0x3558)
+#define AFE_CONN68_3                      (0x355c)
+#define AFE_CONN68_4                      (0x3560)
+#define AFE_CONN69                        (0x3564)
+#define AFE_CONN69_1                      (0x3568)
+#define AFE_CONN69_2                      (0x356c)
+#define AFE_CONN69_3                      (0x3570)
+#define AFE_CONN69_4                      (0x3574)
+#define AFE_CONN70                        (0x3578)
+#define AFE_CONN70_1                      (0x357c)
+#define AFE_CONN70_2                      (0x3580)
+#define AFE_CONN70_3                      (0x3584)
+#define AFE_CONN70_4                      (0x3588)
+#define AFE_CONN71                        (0x358c)
+#define AFE_CONN71_1                      (0x3590)
+#define AFE_CONN71_2                      (0x3594)
+#define AFE_CONN71_3                      (0x3598)
+#define AFE_CONN71_4                      (0x359c)
+#define AFE_CONN72                        (0x35a0)
+#define AFE_CONN72_1                      (0x35a4)
+#define AFE_CONN72_2                      (0x35a8)
+#define AFE_CONN72_3                      (0x35ac)
+#define AFE_CONN72_4                      (0x35b0)
+#define AFE_CONN73                        (0x35b4)
+#define AFE_CONN73_1                      (0x35b8)
+#define AFE_CONN73_2                      (0x35bc)
+#define AFE_CONN73_3                      (0x35c0)
+#define AFE_CONN73_4                      (0x35c4)
+#define AFE_CONN74                        (0x35c8)
+#define AFE_CONN74_1                      (0x35cc)
+#define AFE_CONN74_2                      (0x35d0)
+#define AFE_CONN74_3                      (0x35d4)
+#define AFE_CONN74_4                      (0x35d8)
+#define AFE_CONN75                        (0x35dc)
+#define AFE_CONN75_1                      (0x35e0)
+#define AFE_CONN75_2                      (0x35e4)
+#define AFE_CONN75_3                      (0x35e8)
+#define AFE_CONN75_4                      (0x35ec)
+#define AFE_CONN76                        (0x35f0)
+#define AFE_CONN76_1                      (0x35f4)
+#define AFE_CONN76_2                      (0x35f8)
+#define AFE_CONN76_3                      (0x35fc)
+#define AFE_CONN76_4                      (0x3600)
+#define AFE_CONN77                        (0x3604)
+#define AFE_CONN77_1                      (0x3608)
+#define AFE_CONN77_2                      (0x360c)
+#define AFE_CONN77_3                      (0x3610)
+#define AFE_CONN77_4                      (0x3614)
+#define AFE_CONN78                        (0x3618)
+#define AFE_CONN78_1                      (0x361c)
+#define AFE_CONN78_2                      (0x3620)
+#define AFE_CONN78_3                      (0x3624)
+#define AFE_CONN78_4                      (0x3628)
+#define AFE_CONN79                        (0x362c)
+#define AFE_CONN79_1                      (0x3630)
+#define AFE_CONN79_2                      (0x3634)
+#define AFE_CONN79_3                      (0x3638)
+#define AFE_CONN79_4                      (0x363c)
+#define AFE_CONN80                        (0x3640)
+#define AFE_CONN80_1                      (0x3644)
+#define AFE_CONN80_2                      (0x3648)
+#define AFE_CONN80_3                      (0x364c)
+#define AFE_CONN80_4                      (0x3650)
+#define AFE_CONN81                        (0x3654)
+#define AFE_CONN81_1                      (0x3658)
+#define AFE_CONN81_2                      (0x365c)
+#define AFE_CONN81_3                      (0x3660)
+#define AFE_CONN81_4                      (0x3664)
+#define AFE_CONN82                        (0x3668)
+#define AFE_CONN82_1                      (0x366c)
+#define AFE_CONN82_2                      (0x3670)
+#define AFE_CONN82_3                      (0x3674)
+#define AFE_CONN82_4                      (0x3678)
+#define AFE_CONN83                        (0x367c)
+#define AFE_CONN83_1                      (0x3680)
+#define AFE_CONN83_2                      (0x3684)
+#define AFE_CONN83_3                      (0x3688)
+#define AFE_CONN83_4                      (0x368c)
+#define AFE_CONN84                        (0x3690)
+#define AFE_CONN84_1                      (0x3694)
+#define AFE_CONN84_2                      (0x3698)
+#define AFE_CONN84_3                      (0x369c)
+#define AFE_CONN84_4                      (0x36a0)
+#define AFE_CONN85                        (0x36a4)
+#define AFE_CONN85_1                      (0x36a8)
+#define AFE_CONN85_2                      (0x36ac)
+#define AFE_CONN85_3                      (0x36b0)
+#define AFE_CONN85_4                      (0x36b4)
+#define AFE_CONN86                        (0x36b8)
+#define AFE_CONN86_1                      (0x36bc)
+#define AFE_CONN86_2                      (0x36c0)
+#define AFE_CONN86_3                      (0x36c4)
+#define AFE_CONN86_4                      (0x36c8)
+#define AFE_CONN87                        (0x36cc)
+#define AFE_CONN87_1                      (0x36d0)
+#define AFE_CONN87_2                      (0x36d4)
+#define AFE_CONN87_3                      (0x36d8)
+#define AFE_CONN87_4                      (0x36dc)
+#define AFE_CONN88                        (0x36e0)
+#define AFE_CONN88_1                      (0x36e4)
+#define AFE_CONN88_2                      (0x36e8)
+#define AFE_CONN88_3                      (0x36ec)
+#define AFE_CONN88_4                      (0x36f0)
+#define AFE_CONN89                        (0x36f4)
+#define AFE_CONN89_1                      (0x36f8)
+#define AFE_CONN89_2                      (0x36fc)
+#define AFE_CONN89_3                      (0x3700)
+#define AFE_CONN89_4                      (0x3704)
+#define AFE_CONN90                        (0x3708)
+#define AFE_CONN90_1                      (0x370c)
+#define AFE_CONN90_2                      (0x3710)
+#define AFE_CONN90_3                      (0x3714)
+#define AFE_CONN90_4                      (0x3718)
+#define AFE_CONN91                        (0x371c)
+#define AFE_CONN91_1                      (0x3720)
+#define AFE_CONN91_2                      (0x3724)
+#define AFE_CONN91_3                      (0x3728)
+#define AFE_CONN91_4                      (0x372c)
+#define AFE_CONN92                        (0x3730)
+#define AFE_CONN92_1                      (0x3734)
+#define AFE_CONN92_2                      (0x3738)
+#define AFE_CONN92_3                      (0x373c)
+#define AFE_CONN92_4                      (0x3740)
+#define AFE_CONN93                        (0x3744)
+#define AFE_CONN93_1                      (0x3748)
+#define AFE_CONN93_2                      (0x374c)
+#define AFE_CONN93_3                      (0x3750)
+#define AFE_CONN93_4                      (0x3754)
+#define AFE_CONN94                        (0x3758)
+#define AFE_CONN94_1                      (0x375c)
+#define AFE_CONN94_2                      (0x3760)
+#define AFE_CONN94_3                      (0x3764)
+#define AFE_CONN94_4                      (0x3768)
+#define AFE_CONN95                        (0x376c)
+#define AFE_CONN95_1                      (0x3770)
+#define AFE_CONN95_2                      (0x3774)
+#define AFE_CONN95_3                      (0x3778)
+#define AFE_CONN95_4                      (0x377c)
+#define AFE_CONN96                        (0x3780)
+#define AFE_CONN96_1                      (0x3784)
+#define AFE_CONN96_2                      (0x3788)
+#define AFE_CONN96_3                      (0x378c)
+#define AFE_CONN96_4                      (0x3790)
+#define AFE_CONN97                        (0x3794)
+#define AFE_CONN97_1                      (0x3798)
+#define AFE_CONN97_2                      (0x379c)
+#define AFE_CONN97_3                      (0x37a0)
+#define AFE_CONN97_4                      (0x37a4)
+#define AFE_CONN98                        (0x37a8)
+#define AFE_CONN98_1                      (0x37ac)
+#define AFE_CONN98_2                      (0x37b0)
+#define AFE_CONN98_3                      (0x37b4)
+#define AFE_CONN98_4                      (0x37b8)
+#define AFE_CONN99                        (0x37bc)
+#define AFE_CONN99_1                      (0x37c0)
+#define AFE_CONN99_2                      (0x37c4)
+#define AFE_CONN99_3                      (0x37c8)
+#define AFE_CONN99_4                      (0x37cc)
+#define AFE_CONN100                       (0x37d0)
+#define AFE_CONN100_1                     (0x37d4)
+#define AFE_CONN100_2                     (0x37d8)
+#define AFE_CONN100_3                     (0x37dc)
+#define AFE_CONN100_4                     (0x37e0)
+#define AFE_CONN101                       (0x37e4)
+#define AFE_CONN101_1                     (0x37e8)
+#define AFE_CONN101_2                     (0x37ec)
+#define AFE_CONN101_3                     (0x37f0)
+#define AFE_CONN101_4                     (0x37f4)
+#define AFE_CONN102                       (0x37f8)
+#define AFE_CONN102_1                     (0x37fc)
+#define AFE_CONN102_2                     (0x3800)
+#define AFE_CONN102_3                     (0x3804)
+#define AFE_CONN102_4                     (0x3808)
+#define AFE_CONN103                       (0x380c)
+#define AFE_CONN103_1                     (0x3810)
+#define AFE_CONN103_2                     (0x3814)
+#define AFE_CONN103_3                     (0x3818)
+#define AFE_CONN103_4                     (0x381c)
+#define AFE_CONN104                       (0x3820)
+#define AFE_CONN104_1                     (0x3824)
+#define AFE_CONN104_2                     (0x3828)
+#define AFE_CONN104_3                     (0x382c)
+#define AFE_CONN104_4                     (0x3830)
+#define AFE_CONN105                       (0x3834)
+#define AFE_CONN105_1                     (0x3838)
+#define AFE_CONN105_2                     (0x383c)
+#define AFE_CONN105_3                     (0x3840)
+#define AFE_CONN105_4                     (0x3844)
+#define AFE_CONN106                       (0x3848)
+#define AFE_CONN106_1                     (0x384c)
+#define AFE_CONN106_2                     (0x3850)
+#define AFE_CONN106_3                     (0x3854)
+#define AFE_CONN106_4                     (0x3858)
+#define AFE_CONN107                       (0x385c)
+#define AFE_CONN107_1                     (0x3860)
+#define AFE_CONN107_2                     (0x3864)
+#define AFE_CONN107_3                     (0x3868)
+#define AFE_CONN107_4                     (0x386c)
+#define AFE_CONN108                       (0x3870)
+#define AFE_CONN108_1                     (0x3874)
+#define AFE_CONN108_2                     (0x3878)
+#define AFE_CONN108_3                     (0x387c)
+#define AFE_CONN108_4                     (0x3880)
+#define AFE_CONN109                       (0x3884)
+#define AFE_CONN109_1                     (0x3888)
+#define AFE_CONN109_2                     (0x388c)
+#define AFE_CONN109_3                     (0x3890)
+#define AFE_CONN109_4                     (0x3894)
+#define AFE_CONN110                       (0x3898)
+#define AFE_CONN110_1                     (0x389c)
+#define AFE_CONN110_2                     (0x38a0)
+#define AFE_CONN110_3                     (0x38a4)
+#define AFE_CONN110_4                     (0x38a8)
+#define AFE_CONN111                       (0x38ac)
+#define AFE_CONN111_1                     (0x38b0)
+#define AFE_CONN111_2                     (0x38b4)
+#define AFE_CONN111_3                     (0x38b8)
+#define AFE_CONN111_4                     (0x38bc)
+#define AFE_CONN112                       (0x38c0)
+#define AFE_CONN112_1                     (0x38c4)
+#define AFE_CONN112_2                     (0x38c8)
+#define AFE_CONN112_3                     (0x38cc)
+#define AFE_CONN112_4                     (0x38d0)
+#define AFE_CONN113                       (0x38d4)
+#define AFE_CONN113_1                     (0x38d8)
+#define AFE_CONN113_2                     (0x38dc)
+#define AFE_CONN113_3                     (0x38e0)
+#define AFE_CONN113_4                     (0x38e4)
+#define AFE_CONN114                       (0x38e8)
+#define AFE_CONN114_1                     (0x38ec)
+#define AFE_CONN114_2                     (0x38f0)
+#define AFE_CONN114_3                     (0x38f4)
+#define AFE_CONN114_4                     (0x38f8)
+#define AFE_CONN115                       (0x38fc)
+#define AFE_CONN115_1                     (0x3900)
+#define AFE_CONN115_2                     (0x3904)
+#define AFE_CONN115_3                     (0x3908)
+#define AFE_CONN115_4                     (0x390c)
+#define AFE_CONN116                       (0x3910)
+#define AFE_CONN116_1                     (0x3914)
+#define AFE_CONN116_2                     (0x3918)
+#define AFE_CONN116_3                     (0x391c)
+#define AFE_CONN116_4                     (0x3920)
+#define AFE_CONN117                       (0x3924)
+#define AFE_CONN117_1                     (0x3928)
+#define AFE_CONN117_2                     (0x392c)
+#define AFE_CONN117_3                     (0x3930)
+#define AFE_CONN117_4                     (0x3934)
+#define AFE_CONN118                       (0x3938)
+#define AFE_CONN118_1                     (0x393c)
+#define AFE_CONN118_2                     (0x3940)
+#define AFE_CONN118_3                     (0x3944)
+#define AFE_CONN118_4                     (0x3948)
+#define AFE_CONN119                       (0x394c)
+#define AFE_CONN119_1                     (0x3950)
+#define AFE_CONN119_2                     (0x3954)
+#define AFE_CONN119_3                     (0x3958)
+#define AFE_CONN119_4                     (0x395c)
+#define AFE_CONN120                       (0x3960)
+#define AFE_CONN120_1                     (0x3964)
+#define AFE_CONN120_2                     (0x3968)
+#define AFE_CONN120_3                     (0x396c)
+#define AFE_CONN120_4                     (0x3970)
+#define AFE_CONN121                       (0x3974)
+#define AFE_CONN121_1                     (0x3978)
+#define AFE_CONN121_2                     (0x397c)
+#define AFE_CONN121_3                     (0x3980)
+#define AFE_CONN121_4                     (0x3984)
+#define AFE_CONN122                       (0x3988)
+#define AFE_CONN122_1                     (0x398c)
+#define AFE_CONN122_2                     (0x3990)
+#define AFE_CONN122_3                     (0x3994)
+#define AFE_CONN122_4                     (0x3998)
+#define AFE_CONN123                       (0x399c)
+#define AFE_CONN123_1                     (0x39a0)
+#define AFE_CONN123_2                     (0x39a4)
+#define AFE_CONN123_3                     (0x39a8)
+#define AFE_CONN123_4                     (0x39ac)
+#define AFE_CONN124                       (0x39b0)
+#define AFE_CONN124_1                     (0x39b4)
+#define AFE_CONN124_2                     (0x39b8)
+#define AFE_CONN124_3                     (0x39bc)
+#define AFE_CONN124_4                     (0x39c0)
+#define AFE_CONN125                       (0x39c4)
+#define AFE_CONN125_1                     (0x39c8)
+#define AFE_CONN125_2                     (0x39cc)
+#define AFE_CONN125_3                     (0x39d0)
+#define AFE_CONN125_4                     (0x39d4)
+#define AFE_CONN126                       (0x39d8)
+#define AFE_CONN126_1                     (0x39dc)
+#define AFE_CONN126_2                     (0x39e0)
+#define AFE_CONN126_3                     (0x39e4)
+#define AFE_CONN126_4                     (0x39e8)
+#define AFE_CONN127                       (0x39ec)
+#define AFE_CONN127_1                     (0x39f0)
+#define AFE_CONN127_2                     (0x39f4)
+#define AFE_CONN127_3                     (0x39f8)
+#define AFE_CONN127_4                     (0x39fc)
+#define AFE_CONN128                       (0x3a00)
+#define AFE_CONN128_1                     (0x3a04)
+#define AFE_CONN128_2                     (0x3a08)
+#define AFE_CONN128_3                     (0x3a0c)
+#define AFE_CONN128_4                     (0x3a10)
+#define AFE_CONN129                       (0x3a14)
+#define AFE_CONN129_1                     (0x3a18)
+#define AFE_CONN129_2                     (0x3a1c)
+#define AFE_CONN129_3                     (0x3a20)
+#define AFE_CONN129_4                     (0x3a24)
+#define AFE_CONN130                       (0x3a28)
+#define AFE_CONN130_1                     (0x3a2c)
+#define AFE_CONN130_2                     (0x3a30)
+#define AFE_CONN130_3                     (0x3a34)
+#define AFE_CONN130_4                     (0x3a38)
+#define AFE_CONN131                       (0x3a3c)
+#define AFE_CONN131_1                     (0x3a40)
+#define AFE_CONN131_2                     (0x3a44)
+#define AFE_CONN131_3                     (0x3a48)
+#define AFE_CONN131_4                     (0x3a4c)
+#define AFE_CONN132                       (0x3a50)
+#define AFE_CONN132_1                     (0x3a54)
+#define AFE_CONN132_2                     (0x3a58)
+#define AFE_CONN132_3                     (0x3a5c)
+#define AFE_CONN132_4                     (0x3a60)
+#define AFE_CONN133                       (0x3a64)
+#define AFE_CONN133_1                     (0x3a68)
+#define AFE_CONN133_2                     (0x3a6c)
+#define AFE_CONN133_3                     (0x3a70)
+#define AFE_CONN133_4                     (0x3a74)
+#define AFE_CONN134                       (0x3a78)
+#define AFE_CONN134_1                     (0x3a7c)
+#define AFE_CONN134_2                     (0x3a80)
+#define AFE_CONN134_3                     (0x3a84)
+#define AFE_CONN134_4                     (0x3a88)
+#define AFE_CONN135                       (0x3a8c)
+#define AFE_CONN135_1                     (0x3a90)
+#define AFE_CONN135_2                     (0x3a94)
+#define AFE_CONN135_3                     (0x3a98)
+#define AFE_CONN135_4                     (0x3a9c)
+#define AFE_CONN136                       (0x3aa0)
+#define AFE_CONN136_1                     (0x3aa4)
+#define AFE_CONN136_2                     (0x3aa8)
+#define AFE_CONN136_3                     (0x3aac)
+#define AFE_CONN136_4                     (0x3ab0)
+#define AFE_CONN137                       (0x3ab4)
+#define AFE_CONN137_1                     (0x3ab8)
+#define AFE_CONN137_2                     (0x3abc)
+#define AFE_CONN137_3                     (0x3ac0)
+#define AFE_CONN137_4                     (0x3ac4)
+#define AFE_CONN138                       (0x3ac8)
+#define AFE_CONN138_1                     (0x3acc)
+#define AFE_CONN138_2                     (0x3ad0)
+#define AFE_CONN138_3                     (0x3ad4)
+#define AFE_CONN138_4                     (0x3ad8)
+#define AFE_CONN139                       (0x3adc)
+#define AFE_CONN139_1                     (0x3ae0)
+#define AFE_CONN139_2                     (0x3ae4)
+#define AFE_CONN139_3                     (0x3ae8)
+#define AFE_CONN139_4                     (0x3aec)
+#define AFE_CONN_RS                       (0x3af0)
+#define AFE_CONN_RS_1                     (0x3af4)
+#define AFE_CONN_RS_2                     (0x3af8)
+#define AFE_CONN_RS_3                     (0x3afc)
+#define AFE_CONN_RS_4                     (0x3b00)
+#define AFE_CONN_16BIT                    (0x3b04)
+#define AFE_CONN_16BIT_1                  (0x3b08)
+#define AFE_CONN_16BIT_2                  (0x3b0c)
+#define AFE_CONN_16BIT_3                  (0x3b10)
+#define AFE_CONN_16BIT_4                  (0x3b14)
+#define AFE_CONN_24BIT                    (0x3b18)
+#define AFE_CONN_24BIT_1                  (0x3b1c)
+#define AFE_CONN_24BIT_2                  (0x3b20)
+#define AFE_CONN_24BIT_3                  (0x3b24)
+#define AFE_CONN_24BIT_4                  (0x3b28)
+#define AFE_CONN_DI                       (0x3b2c)
+#define AFE_CONN_DI_1                     (0x3b30)
+#define AFE_CONN_DI_2                     (0x3b34)
+#define AFE_CONN_DI_3                     (0x3b38)
+#define AFE_CONN_DI_4                     (0x3b3c)
+#define AFE_CONN176                       (0x3ea0)
+#define AFE_CONN176_1                     (0x3ea4)
+#define AFE_CONN176_2                     (0x3ea8)
+#define AFE_CONN176_3                     (0x3eac)
+#define AFE_CONN176_4                     (0x3eb0)
+#define AFE_CONN176_5                     (0x3eb4)
+#define AFE_CONN177                       (0x3eb8)
+#define AFE_CONN177_1                     (0x3ebc)
+#define AFE_CONN177_2                     (0x3ec0)
+#define AFE_CONN177_3                     (0x3ec4)
+#define AFE_CONN177_4                     (0x3ec8)
+#define AFE_CONN177_5                     (0x3ecc)
+#define AFE_CONN182                       (0x3f30)
+#define AFE_CONN182_1                     (0x3f34)
+#define AFE_CONN182_2                     (0x3f38)
+#define AFE_CONN182_3                     (0x3f3c)
+#define AFE_CONN182_4                     (0x3f40)
+#define AFE_CONN182_5                     (0x3f44)
+#define AFE_CONN183                       (0x3f48)
+#define AFE_CONN183_1                     (0x3f4c)
+#define AFE_CONN183_2                     (0x3f50)
+#define AFE_CONN183_3                     (0x3f54)
+#define AFE_CONN183_4                     (0x3f58)
+#define AFE_CONN183_5                     (0x3f5c)
+#define AFE_SECURE_MASK_CONN0             (0x4000)
+#define AFE_SECURE_MASK_CONN0_1           (0x4004)
+#define AFE_SECURE_MASK_CONN0_2           (0x4008)
+#define AFE_SECURE_MASK_CONN0_3           (0x400c)
+#define AFE_SECURE_MASK_CONN0_4           (0x4010)
+#define AFE_SECURE_MASK_CONN1             (0x4014)
+#define AFE_SECURE_MASK_CONN1_1           (0x4018)
+#define AFE_SECURE_MASK_CONN1_2           (0x401c)
+#define AFE_SECURE_MASK_CONN1_3           (0x4020)
+#define AFE_SECURE_MASK_CONN1_4           (0x4024)
+#define AFE_SECURE_MASK_CONN2             (0x4028)
+#define AFE_SECURE_MASK_CONN2_1           (0x402c)
+#define AFE_SECURE_MASK_CONN2_2           (0x4030)
+#define AFE_SECURE_MASK_CONN2_3           (0x4034)
+#define AFE_SECURE_MASK_CONN2_4           (0x4038)
+#define AFE_SECURE_MASK_CONN3             (0x403c)
+#define AFE_SECURE_MASK_CONN3_1           (0x4040)
+#define AFE_SECURE_MASK_CONN3_2           (0x4044)
+#define AFE_SECURE_MASK_CONN3_3           (0x4048)
+#define AFE_SECURE_MASK_CONN3_4           (0x404c)
+#define AFE_SECURE_MASK_CONN4             (0x4050)
+#define AFE_SECURE_MASK_CONN4_1           (0x4054)
+#define AFE_SECURE_MASK_CONN4_2           (0x4058)
+#define AFE_SECURE_MASK_CONN4_3           (0x405c)
+#define AFE_SECURE_MASK_CONN4_4           (0x4060)
+#define AFE_SECURE_MASK_CONN5             (0x4064)
+#define AFE_SECURE_MASK_CONN5_1           (0x4068)
+#define AFE_SECURE_MASK_CONN5_2           (0x406c)
+#define AFE_SECURE_MASK_CONN5_3           (0x4070)
+#define AFE_SECURE_MASK_CONN5_4           (0x4074)
+#define AFE_SECURE_MASK_CONN6             (0x4078)
+#define AFE_SECURE_MASK_CONN6_1           (0x407c)
+#define AFE_SECURE_MASK_CONN6_2           (0x4080)
+#define AFE_SECURE_MASK_CONN6_3           (0x4084)
+#define AFE_SECURE_MASK_CONN6_4           (0x4088)
+#define AFE_SECURE_MASK_CONN7             (0x408c)
+#define AFE_SECURE_MASK_CONN7_1           (0x4090)
+#define AFE_SECURE_MASK_CONN7_2           (0x4094)
+#define AFE_SECURE_MASK_CONN7_3           (0x4098)
+#define AFE_SECURE_MASK_CONN7_4           (0x409c)
+#define AFE_SECURE_MASK_CONN8             (0x40a0)
+#define AFE_SECURE_MASK_CONN8_1           (0x40a4)
+#define AFE_SECURE_MASK_CONN8_2           (0x40a8)
+#define AFE_SECURE_MASK_CONN8_3           (0x40ac)
+#define AFE_SECURE_MASK_CONN8_4           (0x40b0)
+#define AFE_SECURE_MASK_CONN9             (0x40b4)
+#define AFE_SECURE_MASK_CONN9_1           (0x40b8)
+#define AFE_SECURE_MASK_CONN9_2           (0x40bc)
+#define AFE_SECURE_MASK_CONN9_3           (0x40c0)
+#define AFE_SECURE_MASK_CONN9_4           (0x40c4)
+#define AFE_SECURE_MASK_CONN10            (0x40c8)
+#define AFE_SECURE_MASK_CONN10_1          (0x40cc)
+#define AFE_SECURE_MASK_CONN10_2          (0x40d0)
+#define AFE_SECURE_MASK_CONN10_3          (0x40d4)
+#define AFE_SECURE_MASK_CONN10_4          (0x40d8)
+#define AFE_SECURE_MASK_CONN11            (0x40dc)
+#define AFE_SECURE_MASK_CONN11_1          (0x40e0)
+#define AFE_SECURE_MASK_CONN11_2          (0x40e4)
+#define AFE_SECURE_MASK_CONN11_3          (0x40e8)
+#define AFE_SECURE_MASK_CONN11_4          (0x40ec)
+#define AFE_SECURE_MASK_CONN12            (0x40f0)
+#define AFE_SECURE_MASK_CONN12_1          (0x40f4)
+#define AFE_SECURE_MASK_CONN12_2          (0x40f8)
+#define AFE_SECURE_MASK_CONN12_3          (0x40fc)
+#define AFE_SECURE_MASK_CONN12_4          (0x4100)
+#define AFE_SECURE_MASK_CONN13            (0x4104)
+#define AFE_SECURE_MASK_CONN13_1          (0x4108)
+#define AFE_SECURE_MASK_CONN13_2          (0x410c)
+#define AFE_SECURE_MASK_CONN13_3          (0x4110)
+#define AFE_SECURE_MASK_CONN13_4          (0x4114)
+#define AFE_SECURE_MASK_CONN14            (0x4118)
+#define AFE_SECURE_MASK_CONN14_1          (0x411c)
+#define AFE_SECURE_MASK_CONN14_2          (0x4120)
+#define AFE_SECURE_MASK_CONN14_3          (0x4124)
+#define AFE_SECURE_MASK_CONN14_4          (0x4128)
+#define AFE_SECURE_MASK_CONN15            (0x412c)
+#define AFE_SECURE_MASK_CONN15_1          (0x4130)
+#define AFE_SECURE_MASK_CONN15_2          (0x4134)
+#define AFE_SECURE_MASK_CONN15_3          (0x4138)
+#define AFE_SECURE_MASK_CONN15_4          (0x413c)
+#define AFE_SECURE_MASK_CONN16            (0x4140)
+#define AFE_SECURE_MASK_CONN16_1          (0x4144)
+#define AFE_SECURE_MASK_CONN16_2          (0x4148)
+#define AFE_SECURE_MASK_CONN16_3          (0x414c)
+#define AFE_SECURE_MASK_CONN16_4          (0x4150)
+#define AFE_SECURE_MASK_CONN17            (0x4154)
+#define AFE_SECURE_MASK_CONN17_1          (0x4158)
+#define AFE_SECURE_MASK_CONN17_2          (0x415c)
+#define AFE_SECURE_MASK_CONN17_3          (0x4160)
+#define AFE_SECURE_MASK_CONN17_4          (0x4164)
+#define AFE_SECURE_MASK_CONN18            (0x4168)
+#define AFE_SECURE_MASK_CONN18_1          (0x416c)
+#define AFE_SECURE_MASK_CONN18_2          (0x4170)
+#define AFE_SECURE_MASK_CONN18_3          (0x4174)
+#define AFE_SECURE_MASK_CONN18_4          (0x4178)
+#define AFE_SECURE_MASK_CONN19            (0x417c)
+#define AFE_SECURE_MASK_CONN19_1          (0x4180)
+#define AFE_SECURE_MASK_CONN19_2          (0x4184)
+#define AFE_SECURE_MASK_CONN19_3          (0x4188)
+#define AFE_SECURE_MASK_CONN19_4          (0x418c)
+#define AFE_SECURE_MASK_CONN20            (0x4190)
+#define AFE_SECURE_MASK_CONN20_1          (0x4194)
+#define AFE_SECURE_MASK_CONN20_2          (0x4198)
+#define AFE_SECURE_MASK_CONN20_3          (0x419c)
+#define AFE_SECURE_MASK_CONN20_4          (0x41a0)
+#define AFE_SECURE_MASK_CONN21            (0x41a4)
+#define AFE_SECURE_MASK_CONN21_1          (0x41a8)
+#define AFE_SECURE_MASK_CONN21_2          (0x41ac)
+#define AFE_SECURE_MASK_CONN21_3          (0x41b0)
+#define AFE_SECURE_MASK_CONN21_4          (0x41b4)
+#define AFE_SECURE_MASK_CONN22            (0x41b8)
+#define AFE_SECURE_MASK_CONN22_1          (0x41bc)
+#define AFE_SECURE_MASK_CONN22_2          (0x41c0)
+#define AFE_SECURE_MASK_CONN22_3          (0x41c4)
+#define AFE_SECURE_MASK_CONN22_4          (0x41c8)
+#define AFE_SECURE_MASK_CONN23            (0x41cc)
+#define AFE_SECURE_MASK_CONN23_1          (0x41d0)
+#define AFE_SECURE_MASK_CONN23_2          (0x41d4)
+#define AFE_SECURE_MASK_CONN23_3          (0x41d8)
+#define AFE_SECURE_MASK_CONN23_4          (0x41dc)
+#define AFE_SECURE_MASK_CONN24            (0x41e0)
+#define AFE_SECURE_MASK_CONN24_1          (0x41e4)
+#define AFE_SECURE_MASK_CONN24_2          (0x41e8)
+#define AFE_SECURE_MASK_CONN24_3          (0x41ec)
+#define AFE_SECURE_MASK_CONN24_4          (0x41f0)
+#define AFE_SECURE_MASK_CONN25            (0x41f4)
+#define AFE_SECURE_MASK_CONN25_1          (0x41f8)
+#define AFE_SECURE_MASK_CONN25_2          (0x41fc)
+#define AFE_SECURE_MASK_CONN25_3          (0x4200)
+#define AFE_SECURE_MASK_CONN25_4          (0x4204)
+#define AFE_SECURE_MASK_CONN26            (0x4208)
+#define AFE_SECURE_MASK_CONN26_1          (0x420c)
+#define AFE_SECURE_MASK_CONN26_2          (0x4210)
+#define AFE_SECURE_MASK_CONN26_3          (0x4214)
+#define AFE_SECURE_MASK_CONN26_4          (0x4218)
+#define AFE_SECURE_MASK_CONN27            (0x421c)
+#define AFE_SECURE_MASK_CONN27_1          (0x4220)
+#define AFE_SECURE_MASK_CONN27_2          (0x4224)
+#define AFE_SECURE_MASK_CONN27_3          (0x4228)
+#define AFE_SECURE_MASK_CONN27_4          (0x422c)
+#define AFE_SECURE_MASK_CONN28            (0x4230)
+#define AFE_SECURE_MASK_CONN28_1          (0x4234)
+#define AFE_SECURE_MASK_CONN28_2          (0x4238)
+#define AFE_SECURE_MASK_CONN28_3          (0x423c)
+#define AFE_SECURE_MASK_CONN28_4          (0x4240)
+#define AFE_SECURE_MASK_CONN29            (0x4244)
+#define AFE_SECURE_MASK_CONN29_1          (0x4248)
+#define AFE_SECURE_MASK_CONN29_2          (0x424c)
+#define AFE_SECURE_MASK_CONN29_3          (0x4250)
+#define AFE_SECURE_MASK_CONN29_4          (0x4254)
+#define AFE_SECURE_MASK_CONN30            (0x4258)
+#define AFE_SECURE_MASK_CONN30_1          (0x425c)
+#define AFE_SECURE_MASK_CONN30_2          (0x4260)
+#define AFE_SECURE_MASK_CONN30_3          (0x4264)
+#define AFE_SECURE_MASK_CONN30_4          (0x4268)
+#define AFE_SECURE_MASK_CONN31            (0x426c)
+#define AFE_SECURE_MASK_CONN31_1          (0x4270)
+#define AFE_SECURE_MASK_CONN31_2          (0x4274)
+#define AFE_SECURE_MASK_CONN31_3          (0x4278)
+#define AFE_SECURE_MASK_CONN31_4          (0x427c)
+#define AFE_SECURE_MASK_CONN32            (0x4280)
+#define AFE_SECURE_MASK_CONN32_1          (0x4284)
+#define AFE_SECURE_MASK_CONN32_2          (0x4288)
+#define AFE_SECURE_MASK_CONN32_3          (0x428c)
+#define AFE_SECURE_MASK_CONN32_4          (0x4290)
+#define AFE_SECURE_MASK_CONN33            (0x4294)
+#define AFE_SECURE_MASK_CONN33_1          (0x4298)
+#define AFE_SECURE_MASK_CONN33_2          (0x429c)
+#define AFE_SECURE_MASK_CONN33_3          (0x42a0)
+#define AFE_SECURE_MASK_CONN33_4          (0x42a4)
+#define AFE_SECURE_MASK_CONN34            (0x42a8)
+#define AFE_SECURE_MASK_CONN34_1          (0x42ac)
+#define AFE_SECURE_MASK_CONN34_2          (0x42b0)
+#define AFE_SECURE_MASK_CONN34_3          (0x42b4)
+#define AFE_SECURE_MASK_CONN34_4          (0x42b8)
+#define AFE_SECURE_MASK_CONN35            (0x42bc)
+#define AFE_SECURE_MASK_CONN35_1          (0x42c0)
+#define AFE_SECURE_MASK_CONN35_2          (0x42c4)
+#define AFE_SECURE_MASK_CONN35_3          (0x42c8)
+#define AFE_SECURE_MASK_CONN35_4          (0x42cc)
+#define AFE_SECURE_MASK_CONN36            (0x42d0)
+#define AFE_SECURE_MASK_CONN36_1          (0x42d4)
+#define AFE_SECURE_MASK_CONN36_2          (0x42d8)
+#define AFE_SECURE_MASK_CONN36_3          (0x42dc)
+#define AFE_SECURE_MASK_CONN36_4          (0x42e0)
+#define AFE_SECURE_MASK_CONN37            (0x42e4)
+#define AFE_SECURE_MASK_CONN37_1          (0x42e8)
+#define AFE_SECURE_MASK_CONN37_2          (0x42ec)
+#define AFE_SECURE_MASK_CONN37_3          (0x42f0)
+#define AFE_SECURE_MASK_CONN37_4          (0x42f4)
+#define AFE_SECURE_MASK_CONN38            (0x42f8)
+#define AFE_SECURE_MASK_CONN38_1          (0x42fc)
+#define AFE_SECURE_MASK_CONN38_2          (0x4300)
+#define AFE_SECURE_MASK_CONN38_3          (0x4304)
+#define AFE_SECURE_MASK_CONN38_4          (0x4308)
+#define AFE_SECURE_MASK_CONN39            (0x430c)
+#define AFE_SECURE_MASK_CONN39_1          (0x4310)
+#define AFE_SECURE_MASK_CONN39_2          (0x4314)
+#define AFE_SECURE_MASK_CONN39_3          (0x4318)
+#define AFE_SECURE_MASK_CONN39_4          (0x431c)
+#define AFE_SECURE_MASK_CONN40            (0x4320)
+#define AFE_SECURE_MASK_CONN40_1          (0x4324)
+#define AFE_SECURE_MASK_CONN40_2          (0x4328)
+#define AFE_SECURE_MASK_CONN40_3          (0x432c)
+#define AFE_SECURE_MASK_CONN40_4          (0x4330)
+#define AFE_SECURE_MASK_CONN41            (0x4334)
+#define AFE_SECURE_MASK_CONN41_1          (0x4338)
+#define AFE_SECURE_MASK_CONN41_2          (0x433c)
+#define AFE_SECURE_MASK_CONN41_3          (0x4340)
+#define AFE_SECURE_MASK_CONN41_4          (0x4344)
+#define AFE_SECURE_MASK_CONN42            (0x4348)
+#define AFE_SECURE_MASK_CONN42_1          (0x434c)
+#define AFE_SECURE_MASK_CONN42_2          (0x4350)
+#define AFE_SECURE_MASK_CONN42_3          (0x4354)
+#define AFE_SECURE_MASK_CONN42_4          (0x4358)
+#define AFE_SECURE_MASK_CONN43            (0x435c)
+#define AFE_SECURE_MASK_CONN43_1          (0x4360)
+#define AFE_SECURE_MASK_CONN43_2          (0x4364)
+#define AFE_SECURE_MASK_CONN43_3          (0x4368)
+#define AFE_SECURE_MASK_CONN43_4          (0x436c)
+#define AFE_SECURE_MASK_CONN44            (0x4370)
+#define AFE_SECURE_MASK_CONN44_1          (0x4374)
+#define AFE_SECURE_MASK_CONN44_2          (0x4378)
+#define AFE_SECURE_MASK_CONN44_3          (0x437c)
+#define AFE_SECURE_MASK_CONN44_4          (0x4380)
+#define AFE_SECURE_MASK_CONN45            (0x4384)
+#define AFE_SECURE_MASK_CONN45_1          (0x4388)
+#define AFE_SECURE_MASK_CONN45_2          (0x438c)
+#define AFE_SECURE_MASK_CONN45_3          (0x4390)
+#define AFE_SECURE_MASK_CONN45_4          (0x4394)
+#define AFE_SECURE_MASK_CONN46            (0x4398)
+#define AFE_SECURE_MASK_CONN46_1          (0x439c)
+#define AFE_SECURE_MASK_CONN46_2          (0x43a0)
+#define AFE_SECURE_MASK_CONN46_3          (0x43a4)
+#define AFE_SECURE_MASK_CONN46_4          (0x43a8)
+#define AFE_SECURE_MASK_CONN47            (0x43ac)
+#define AFE_SECURE_MASK_CONN47_1          (0x43b0)
+#define AFE_SECURE_MASK_CONN47_2          (0x43b4)
+#define AFE_SECURE_MASK_CONN47_3          (0x43b8)
+#define AFE_SECURE_MASK_CONN47_4          (0x43bc)
+#define AFE_SECURE_MASK_CONN48            (0x43c0)
+#define AFE_SECURE_MASK_CONN48_1          (0x43c4)
+#define AFE_SECURE_MASK_CONN48_2          (0x43c8)
+#define AFE_SECURE_MASK_CONN48_3          (0x43cc)
+#define AFE_SECURE_MASK_CONN48_4          (0x43d0)
+#define AFE_SECURE_MASK_CONN49            (0x43d4)
+#define AFE_SECURE_MASK_CONN49_1          (0x43d8)
+#define AFE_SECURE_MASK_CONN49_2          (0x43dc)
+#define AFE_SECURE_MASK_CONN49_3          (0x43e0)
+#define AFE_SECURE_MASK_CONN49_4          (0x43e4)
+#define AFE_SECURE_MASK_CONN50            (0x43e8)
+#define AFE_SECURE_MASK_CONN50_1          (0x43ec)
+#define AFE_SECURE_MASK_CONN50_2          (0x43f0)
+#define AFE_SECURE_MASK_CONN50_3          (0x43f4)
+#define AFE_SECURE_MASK_CONN50_4          (0x43f8)
+#define AFE_SECURE_MASK_CONN51            (0x43fc)
+#define AFE_SECURE_MASK_CONN51_1          (0x4400)
+#define AFE_SECURE_MASK_CONN51_2          (0x4404)
+#define AFE_SECURE_MASK_CONN51_3          (0x4408)
+#define AFE_SECURE_MASK_CONN51_4          (0x440c)
+#define AFE_SECURE_MASK_CONN52            (0x4410)
+#define AFE_SECURE_MASK_CONN52_1          (0x4414)
+#define AFE_SECURE_MASK_CONN52_2          (0x4418)
+#define AFE_SECURE_MASK_CONN52_3          (0x441c)
+#define AFE_SECURE_MASK_CONN52_4          (0x4420)
+#define AFE_SECURE_MASK_CONN53            (0x4424)
+#define AFE_SECURE_MASK_CONN53_1          (0x4428)
+#define AFE_SECURE_MASK_CONN53_2          (0x442c)
+#define AFE_SECURE_MASK_CONN53_3          (0x4430)
+#define AFE_SECURE_MASK_CONN53_4          (0x4434)
+#define AFE_SECURE_MASK_CONN54            (0x4438)
+#define AFE_SECURE_MASK_CONN54_1          (0x443c)
+#define AFE_SECURE_MASK_CONN54_2          (0x4440)
+#define AFE_SECURE_MASK_CONN54_3          (0x4444)
+#define AFE_SECURE_MASK_CONN54_4          (0x4448)
+#define AFE_SECURE_MASK_CONN55            (0x444c)
+#define AFE_SECURE_MASK_CONN55_1          (0x4450)
+#define AFE_SECURE_MASK_CONN55_2          (0x4454)
+#define AFE_SECURE_MASK_CONN55_3          (0x4458)
+#define AFE_SECURE_MASK_CONN55_4          (0x445c)
+#define AFE_SECURE_MASK_CONN56            (0x4460)
+#define AFE_SECURE_MASK_CONN56_1          (0x4464)
+#define AFE_SECURE_MASK_CONN56_2          (0x4468)
+#define AFE_SECURE_MASK_CONN56_3          (0x446c)
+#define AFE_SECURE_MASK_CONN56_4          (0x4470)
+#define AFE_SECURE_MASK_CONN57            (0x4474)
+#define AFE_SECURE_MASK_CONN57_1          (0x4478)
+#define AFE_SECURE_MASK_CONN57_2          (0x447c)
+#define AFE_SECURE_MASK_CONN57_3          (0x4480)
+#define AFE_SECURE_MASK_CONN57_4          (0x4484)
+#define AFE_SECURE_MASK_CONN58            (0x4488)
+#define AFE_SECURE_MASK_CONN58_1          (0x448c)
+#define AFE_SECURE_MASK_CONN58_2          (0x4490)
+#define AFE_SECURE_MASK_CONN58_3          (0x4494)
+#define AFE_SECURE_MASK_CONN58_4          (0x4498)
+#define AFE_SECURE_MASK_CONN59            (0x449c)
+#define AFE_SECURE_MASK_CONN59_1          (0x44a0)
+#define AFE_SECURE_MASK_CONN59_2          (0x44a4)
+#define AFE_SECURE_MASK_CONN59_3          (0x44a8)
+#define AFE_SECURE_MASK_CONN59_4          (0x44ac)
+#define AFE_SECURE_MASK_CONN60            (0x44b0)
+#define AFE_SECURE_MASK_CONN60_1          (0x44b4)
+#define AFE_SECURE_MASK_CONN60_2          (0x44b8)
+#define AFE_SECURE_MASK_CONN60_3          (0x44bc)
+#define AFE_SECURE_MASK_CONN60_4          (0x44c0)
+#define AFE_SECURE_MASK_CONN61            (0x44c4)
+#define AFE_SECURE_MASK_CONN61_1          (0x44c8)
+#define AFE_SECURE_MASK_CONN61_2          (0x44cc)
+#define AFE_SECURE_MASK_CONN61_3          (0x44d0)
+#define AFE_SECURE_MASK_CONN61_4          (0x44d4)
+#define AFE_SECURE_MASK_CONN62            (0x44d8)
+#define AFE_SECURE_MASK_CONN62_1          (0x44dc)
+#define AFE_SECURE_MASK_CONN62_2          (0x44e0)
+#define AFE_SECURE_MASK_CONN62_3          (0x44e4)
+#define AFE_SECURE_MASK_CONN62_4          (0x44e8)
+#define AFE_SECURE_MASK_CONN63            (0x44ec)
+#define AFE_SECURE_MASK_CONN63_1          (0x44f0)
+#define AFE_SECURE_MASK_CONN63_2          (0x44f4)
+#define AFE_SECURE_MASK_CONN63_3          (0x44f8)
+#define AFE_SECURE_MASK_CONN63_4          (0x44fc)
+#define AFE_SECURE_MASK_CONN64            (0x4500)
+#define AFE_SECURE_MASK_CONN64_1          (0x4504)
+#define AFE_SECURE_MASK_CONN64_2          (0x4508)
+#define AFE_SECURE_MASK_CONN64_3          (0x450c)
+#define AFE_SECURE_MASK_CONN64_4          (0x4510)
+#define AFE_SECURE_MASK_CONN65            (0x4514)
+#define AFE_SECURE_MASK_CONN65_1          (0x4518)
+#define AFE_SECURE_MASK_CONN65_2          (0x451c)
+#define AFE_SECURE_MASK_CONN65_3          (0x4520)
+#define AFE_SECURE_MASK_CONN65_4          (0x4524)
+#define AFE_SECURE_MASK_CONN66            (0x4528)
+#define AFE_SECURE_MASK_CONN66_1          (0x452c)
+#define AFE_SECURE_MASK_CONN66_2          (0x4530)
+#define AFE_SECURE_MASK_CONN66_3          (0x4534)
+#define AFE_SECURE_MASK_CONN66_4          (0x4538)
+#define AFE_SECURE_MASK_CONN67            (0x453c)
+#define AFE_SECURE_MASK_CONN67_1          (0x4540)
+#define AFE_SECURE_MASK_CONN67_2          (0x4544)
+#define AFE_SECURE_MASK_CONN67_3          (0x4548)
+#define AFE_SECURE_MASK_CONN67_4          (0x454c)
+#define AFE_SECURE_MASK_CONN68            (0x4550)
+#define AFE_SECURE_MASK_CONN68_1          (0x4554)
+#define AFE_SECURE_MASK_CONN68_2          (0x4558)
+#define AFE_SECURE_MASK_CONN68_3          (0x455c)
+#define AFE_SECURE_MASK_CONN68_4          (0x4560)
+#define AFE_SECURE_MASK_CONN69            (0x4564)
+#define AFE_SECURE_MASK_CONN69_1          (0x4568)
+#define AFE_SECURE_MASK_CONN69_2          (0x456c)
+#define AFE_SECURE_MASK_CONN69_3          (0x4570)
+#define AFE_SECURE_MASK_CONN69_4          (0x4574)
+#define AFE_SECURE_MASK_CONN70            (0x4578)
+#define AFE_SECURE_MASK_CONN70_1          (0x457c)
+#define AFE_SECURE_MASK_CONN70_2          (0x4580)
+#define AFE_SECURE_MASK_CONN70_3          (0x4584)
+#define AFE_SECURE_MASK_CONN70_4          (0x4588)
+#define AFE_SECURE_MASK_CONN71            (0x458c)
+#define AFE_SECURE_MASK_CONN71_1          (0x4590)
+#define AFE_SECURE_MASK_CONN71_2          (0x4594)
+#define AFE_SECURE_MASK_CONN71_3          (0x4598)
+#define AFE_SECURE_MASK_CONN71_4          (0x459c)
+#define AFE_SECURE_MASK_CONN72            (0x45a0)
+#define AFE_SECURE_MASK_CONN72_1          (0x45a4)
+#define AFE_SECURE_MASK_CONN72_2          (0x45a8)
+#define AFE_SECURE_MASK_CONN72_3          (0x45ac)
+#define AFE_SECURE_MASK_CONN72_4          (0x45b0)
+#define AFE_SECURE_MASK_CONN73            (0x45b4)
+#define AFE_SECURE_MASK_CONN73_1          (0x45b8)
+#define AFE_SECURE_MASK_CONN73_2          (0x45bc)
+#define AFE_SECURE_MASK_CONN73_3          (0x45c0)
+#define AFE_SECURE_MASK_CONN73_4          (0x45c4)
+#define AFE_SECURE_MASK_CONN74            (0x45c8)
+#define AFE_SECURE_MASK_CONN74_1          (0x45cc)
+#define AFE_SECURE_MASK_CONN74_2          (0x45d0)
+#define AFE_SECURE_MASK_CONN74_3          (0x45d4)
+#define AFE_SECURE_MASK_CONN74_4          (0x45d8)
+#define AFE_SECURE_MASK_CONN75            (0x45dc)
+#define AFE_SECURE_MASK_CONN75_1          (0x45e0)
+#define AFE_SECURE_MASK_CONN75_2          (0x45e4)
+#define AFE_SECURE_MASK_CONN75_3          (0x45e8)
+#define AFE_SECURE_MASK_CONN75_4          (0x45ec)
+#define AFE_SECURE_MASK_CONN76            (0x45f0)
+#define AFE_SECURE_MASK_CONN76_1          (0x45f4)
+#define AFE_SECURE_MASK_CONN76_2          (0x45f8)
+#define AFE_SECURE_MASK_CONN76_3          (0x45fc)
+#define AFE_SECURE_MASK_CONN76_4          (0x4600)
+#define AFE_SECURE_MASK_CONN77            (0x4604)
+#define AFE_SECURE_MASK_CONN77_1          (0x4608)
+#define AFE_SECURE_MASK_CONN77_2          (0x460c)
+#define AFE_SECURE_MASK_CONN77_3          (0x4610)
+#define AFE_SECURE_MASK_CONN77_4          (0x4614)
+#define AFE_SECURE_MASK_CONN78            (0x4618)
+#define AFE_SECURE_MASK_CONN78_1          (0x461c)
+#define AFE_SECURE_MASK_CONN78_2          (0x4620)
+#define AFE_SECURE_MASK_CONN78_3          (0x4624)
+#define AFE_SECURE_MASK_CONN78_4          (0x4628)
+#define AFE_SECURE_MASK_CONN79            (0x462c)
+#define AFE_SECURE_MASK_CONN79_1          (0x4630)
+#define AFE_SECURE_MASK_CONN79_2          (0x4634)
+#define AFE_SECURE_MASK_CONN79_3          (0x4638)
+#define AFE_SECURE_MASK_CONN79_4          (0x463c)
+#define AFE_SECURE_MASK_CONN80            (0x4640)
+#define AFE_SECURE_MASK_CONN80_1          (0x4644)
+#define AFE_SECURE_MASK_CONN80_2          (0x4648)
+#define AFE_SECURE_MASK_CONN80_3          (0x464c)
+#define AFE_SECURE_MASK_CONN80_4          (0x4650)
+#define AFE_SECURE_MASK_CONN81            (0x4654)
+#define AFE_SECURE_MASK_CONN81_1          (0x4658)
+#define AFE_SECURE_MASK_CONN81_2          (0x465c)
+#define AFE_SECURE_MASK_CONN81_3          (0x4660)
+#define AFE_SECURE_MASK_CONN81_4          (0x4664)
+#define AFE_SECURE_MASK_CONN82            (0x4668)
+#define AFE_SECURE_MASK_CONN82_1          (0x466c)
+#define AFE_SECURE_MASK_CONN82_2          (0x4670)
+#define AFE_SECURE_MASK_CONN82_3          (0x4674)
+#define AFE_SECURE_MASK_CONN82_4          (0x4678)
+#define AFE_SECURE_MASK_CONN83            (0x467c)
+#define AFE_SECURE_MASK_CONN83_1          (0x4680)
+#define AFE_SECURE_MASK_CONN83_2          (0x4684)
+#define AFE_SECURE_MASK_CONN83_3          (0x4688)
+#define AFE_SECURE_MASK_CONN83_4          (0x468c)
+#define AFE_SECURE_MASK_CONN84            (0x4690)
+#define AFE_SECURE_MASK_CONN84_1          (0x4694)
+#define AFE_SECURE_MASK_CONN84_2          (0x4698)
+#define AFE_SECURE_MASK_CONN84_3          (0x469c)
+#define AFE_SECURE_MASK_CONN84_4          (0x46a0)
+#define AFE_SECURE_MASK_CONN85            (0x46a4)
+#define AFE_SECURE_MASK_CONN85_1          (0x46a8)
+#define AFE_SECURE_MASK_CONN85_2          (0x46ac)
+#define AFE_SECURE_MASK_CONN85_3          (0x46b0)
+#define AFE_SECURE_MASK_CONN85_4          (0x46b4)
+#define AFE_SECURE_MASK_CONN86            (0x46b8)
+#define AFE_SECURE_MASK_CONN86_1          (0x46bc)
+#define AFE_SECURE_MASK_CONN86_2          (0x46c0)
+#define AFE_SECURE_MASK_CONN86_3          (0x46c4)
+#define AFE_SECURE_MASK_CONN86_4          (0x46c8)
+#define AFE_SECURE_MASK_CONN87            (0x46cc)
+#define AFE_SECURE_MASK_CONN87_1          (0x46d0)
+#define AFE_SECURE_MASK_CONN87_2          (0x46d4)
+#define AFE_SECURE_MASK_CONN87_3          (0x46d8)
+#define AFE_SECURE_MASK_CONN87_4          (0x46dc)
+#define AFE_SECURE_MASK_CONN88            (0x46e0)
+#define AFE_SECURE_MASK_CONN88_1          (0x46e4)
+#define AFE_SECURE_MASK_CONN88_2          (0x46e8)
+#define AFE_SECURE_MASK_CONN88_3          (0x46ec)
+#define AFE_SECURE_MASK_CONN88_4          (0x46f0)
+#define AFE_SECURE_MASK_CONN89            (0x46f4)
+#define AFE_SECURE_MASK_CONN89_1          (0x46f8)
+#define AFE_SECURE_MASK_CONN89_2          (0x46fc)
+#define AFE_SECURE_MASK_CONN89_3          (0x4700)
+#define AFE_SECURE_MASK_CONN89_4          (0x4704)
+#define AFE_SECURE_MASK_CONN90            (0x4708)
+#define AFE_SECURE_MASK_CONN90_1          (0x470c)
+#define AFE_SECURE_MASK_CONN90_2          (0x4710)
+#define AFE_SECURE_MASK_CONN90_3          (0x4714)
+#define AFE_SECURE_MASK_CONN90_4          (0x4718)
+#define AFE_SECURE_MASK_CONN91            (0x471c)
+#define AFE_SECURE_MASK_CONN91_1          (0x4720)
+#define AFE_SECURE_MASK_CONN91_2          (0x4724)
+#define AFE_SECURE_MASK_CONN91_3          (0x4728)
+#define AFE_SECURE_MASK_CONN91_4          (0x472c)
+#define AFE_SECURE_MASK_CONN92            (0x4730)
+#define AFE_SECURE_MASK_CONN92_1          (0x4734)
+#define AFE_SECURE_MASK_CONN92_2          (0x4738)
+#define AFE_SECURE_MASK_CONN92_3          (0x473c)
+#define AFE_SECURE_MASK_CONN92_4          (0x4740)
+#define AFE_SECURE_MASK_CONN93            (0x4744)
+#define AFE_SECURE_MASK_CONN93_1          (0x4748)
+#define AFE_SECURE_MASK_CONN93_2          (0x474c)
+#define AFE_SECURE_MASK_CONN93_3          (0x4750)
+#define AFE_SECURE_MASK_CONN93_4          (0x4754)
+#define AFE_SECURE_MASK_CONN94            (0x4758)
+#define AFE_SECURE_MASK_CONN94_1          (0x475c)
+#define AFE_SECURE_MASK_CONN94_2          (0x4760)
+#define AFE_SECURE_MASK_CONN94_3          (0x4764)
+#define AFE_SECURE_MASK_CONN94_4          (0x4768)
+#define AFE_SECURE_MASK_CONN95            (0x476c)
+#define AFE_SECURE_MASK_CONN95_1          (0x4770)
+#define AFE_SECURE_MASK_CONN95_2          (0x4774)
+#define AFE_SECURE_MASK_CONN95_3          (0x4778)
+#define AFE_SECURE_MASK_CONN95_4          (0x477c)
+#define AFE_SECURE_MASK_CONN96            (0x4780)
+#define AFE_SECURE_MASK_CONN96_1          (0x4784)
+#define AFE_SECURE_MASK_CONN96_2          (0x4788)
+#define AFE_SECURE_MASK_CONN96_3          (0x478c)
+#define AFE_SECURE_MASK_CONN96_4          (0x4790)
+#define AFE_SECURE_MASK_CONN97            (0x4794)
+#define AFE_SECURE_MASK_CONN97_1          (0x4798)
+#define AFE_SECURE_MASK_CONN97_2          (0x479c)
+#define AFE_SECURE_MASK_CONN97_3          (0x47a0)
+#define AFE_SECURE_MASK_CONN97_4          (0x47a4)
+#define AFE_SECURE_MASK_CONN98            (0x47a8)
+#define AFE_SECURE_MASK_CONN98_1          (0x47ac)
+#define AFE_SECURE_MASK_CONN98_2          (0x47b0)
+#define AFE_SECURE_MASK_CONN98_3          (0x47b4)
+#define AFE_SECURE_MASK_CONN98_4          (0x47b8)
+#define AFE_SECURE_MASK_CONN99            (0x47bc)
+#define AFE_SECURE_MASK_CONN99_1          (0x47c0)
+#define AFE_SECURE_MASK_CONN99_2          (0x47c4)
+#define AFE_SECURE_MASK_CONN99_3          (0x47c8)
+#define AFE_SECURE_MASK_CONN99_4          (0x47cc)
+#define AFE_SECURE_MASK_CONN100           (0x47d0)
+#define AFE_SECURE_MASK_CONN100_1         (0x47d4)
+#define AFE_SECURE_MASK_CONN100_2         (0x47d8)
+#define AFE_SECURE_MASK_CONN100_3         (0x47dc)
+#define AFE_SECURE_MASK_CONN100_4         (0x47e0)
+#define AFE_SECURE_MASK_CONN101           (0x47e4)
+#define AFE_SECURE_MASK_CONN101_1         (0x47e8)
+#define AFE_SECURE_MASK_CONN101_2         (0x47ec)
+#define AFE_SECURE_MASK_CONN101_3         (0x47f0)
+#define AFE_SECURE_MASK_CONN101_4         (0x47f4)
+#define AFE_SECURE_MASK_CONN102           (0x47f8)
+#define AFE_SECURE_MASK_CONN102_1         (0x47fc)
+#define AFE_SECURE_MASK_CONN102_2         (0x4800)
+#define AFE_SECURE_MASK_CONN102_3         (0x4804)
+#define AFE_SECURE_MASK_CONN102_4         (0x4808)
+#define AFE_SECURE_MASK_CONN103           (0x480c)
+#define AFE_SECURE_MASK_CONN103_1         (0x4810)
+#define AFE_SECURE_MASK_CONN103_2         (0x4814)
+#define AFE_SECURE_MASK_CONN103_3         (0x4818)
+#define AFE_SECURE_MASK_CONN103_4         (0x481c)
+#define AFE_SECURE_MASK_CONN104           (0x4820)
+#define AFE_SECURE_MASK_CONN104_1         (0x4824)
+#define AFE_SECURE_MASK_CONN104_2         (0x4828)
+#define AFE_SECURE_MASK_CONN104_3         (0x482c)
+#define AFE_SECURE_MASK_CONN104_4         (0x4830)
+#define AFE_SECURE_MASK_CONN105           (0x4834)
+#define AFE_SECURE_MASK_CONN105_1         (0x4838)
+#define AFE_SECURE_MASK_CONN105_2         (0x483c)
+#define AFE_SECURE_MASK_CONN105_3         (0x4840)
+#define AFE_SECURE_MASK_CONN105_4         (0x4844)
+#define AFE_SECURE_MASK_CONN106           (0x4848)
+#define AFE_SECURE_MASK_CONN106_1         (0x484c)
+#define AFE_SECURE_MASK_CONN106_2         (0x4850)
+#define AFE_SECURE_MASK_CONN106_3         (0x4854)
+#define AFE_SECURE_MASK_CONN106_4         (0x4858)
+#define AFE_SECURE_MASK_CONN107           (0x485c)
+#define AFE_SECURE_MASK_CONN107_1         (0x4860)
+#define AFE_SECURE_MASK_CONN107_2         (0x4864)
+#define AFE_SECURE_MASK_CONN107_3         (0x4868)
+#define AFE_SECURE_MASK_CONN107_4         (0x486c)
+#define AFE_SECURE_MASK_CONN108           (0x4870)
+#define AFE_SECURE_MASK_CONN108_1         (0x4874)
+#define AFE_SECURE_MASK_CONN108_2         (0x4878)
+#define AFE_SECURE_MASK_CONN108_3         (0x487c)
+#define AFE_SECURE_MASK_CONN108_4         (0x4880)
+#define AFE_SECURE_MASK_CONN109           (0x4884)
+#define AFE_SECURE_MASK_CONN109_1         (0x4888)
+#define AFE_SECURE_MASK_CONN109_2         (0x488c)
+#define AFE_SECURE_MASK_CONN109_3         (0x4890)
+#define AFE_SECURE_MASK_CONN109_4         (0x4894)
+#define AFE_SECURE_MASK_CONN110           (0x4898)
+#define AFE_SECURE_MASK_CONN110_1         (0x489c)
+#define AFE_SECURE_MASK_CONN110_2         (0x48a0)
+#define AFE_SECURE_MASK_CONN110_3         (0x48a4)
+#define AFE_SECURE_MASK_CONN110_4         (0x48a8)
+#define AFE_SECURE_MASK_CONN111           (0x48ac)
+#define AFE_SECURE_MASK_CONN111_1         (0x48b0)
+#define AFE_SECURE_MASK_CONN111_2         (0x48b4)
+#define AFE_SECURE_MASK_CONN111_3         (0x48b8)
+#define AFE_SECURE_MASK_CONN111_4         (0x48bc)
+#define AFE_SECURE_MASK_CONN112           (0x48c0)
+#define AFE_SECURE_MASK_CONN112_1         (0x48c4)
+#define AFE_SECURE_MASK_CONN112_2         (0x48c8)
+#define AFE_SECURE_MASK_CONN112_3         (0x48cc)
+#define AFE_SECURE_MASK_CONN112_4         (0x48d0)
+#define AFE_SECURE_MASK_CONN113           (0x48d4)
+#define AFE_SECURE_MASK_CONN113_1         (0x48d8)
+#define AFE_SECURE_MASK_CONN113_2         (0x48dc)
+#define AFE_SECURE_MASK_CONN113_3         (0x48e0)
+#define AFE_SECURE_MASK_CONN113_4         (0x48e4)
+#define AFE_SECURE_MASK_CONN114           (0x48e8)
+#define AFE_SECURE_MASK_CONN114_1         (0x48ec)
+#define AFE_SECURE_MASK_CONN114_2         (0x48f0)
+#define AFE_SECURE_MASK_CONN114_3         (0x48f4)
+#define AFE_SECURE_MASK_CONN114_4         (0x48f8)
+#define AFE_SECURE_MASK_CONN115           (0x48fc)
+#define AFE_SECURE_MASK_CONN115_1         (0x4900)
+#define AFE_SECURE_MASK_CONN115_2         (0x4904)
+#define AFE_SECURE_MASK_CONN115_3         (0x4908)
+#define AFE_SECURE_MASK_CONN115_4         (0x490c)
+#define AFE_SECURE_MASK_CONN116           (0x4910)
+#define AFE_SECURE_MASK_CONN116_1         (0x4914)
+#define AFE_SECURE_MASK_CONN116_2         (0x4918)
+#define AFE_SECURE_MASK_CONN116_3         (0x491c)
+#define AFE_SECURE_MASK_CONN116_4         (0x4920)
+#define AFE_SECURE_MASK_CONN117           (0x4924)
+#define AFE_SECURE_MASK_CONN117_1         (0x4928)
+#define AFE_SECURE_MASK_CONN117_2         (0x492c)
+#define AFE_SECURE_MASK_CONN117_3         (0x4930)
+#define AFE_SECURE_MASK_CONN117_4         (0x4934)
+#define AFE_SECURE_MASK_CONN118           (0x4938)
+#define AFE_SECURE_MASK_CONN118_1         (0x493c)
+#define AFE_SECURE_MASK_CONN118_2         (0x4940)
+#define AFE_SECURE_MASK_CONN118_3         (0x4944)
+#define AFE_SECURE_MASK_CONN118_4         (0x4948)
+#define AFE_SECURE_MASK_CONN119           (0x494c)
+#define AFE_SECURE_MASK_CONN119_1         (0x4950)
+#define AFE_SECURE_MASK_CONN119_2         (0x4954)
+#define AFE_SECURE_MASK_CONN119_3         (0x4958)
+#define AFE_SECURE_MASK_CONN119_4         (0x495c)
+#define AFE_SECURE_MASK_CONN120           (0x4960)
+#define AFE_SECURE_MASK_CONN120_1         (0x4964)
+#define AFE_SECURE_MASK_CONN120_2         (0x4968)
+#define AFE_SECURE_MASK_CONN120_3         (0x496c)
+#define AFE_SECURE_MASK_CONN120_4         (0x4970)
+#define AFE_SECURE_MASK_CONN121           (0x4974)
+#define AFE_SECURE_MASK_CONN121_1         (0x4978)
+#define AFE_SECURE_MASK_CONN121_2         (0x497c)
+#define AFE_SECURE_MASK_CONN121_3         (0x4980)
+#define AFE_SECURE_MASK_CONN121_4         (0x4984)
+#define AFE_SECURE_MASK_CONN122           (0x4988)
+#define AFE_SECURE_MASK_CONN122_1         (0x498c)
+#define AFE_SECURE_MASK_CONN122_2         (0x4990)
+#define AFE_SECURE_MASK_CONN122_3         (0x4994)
+#define AFE_SECURE_MASK_CONN122_4         (0x4998)
+#define AFE_SECURE_MASK_CONN123           (0x499c)
+#define AFE_SECURE_MASK_CONN123_1         (0x49a0)
+#define AFE_SECURE_MASK_CONN123_2         (0x49a4)
+#define AFE_SECURE_MASK_CONN123_3         (0x49a8)
+#define AFE_SECURE_MASK_CONN123_4         (0x49ac)
+#define AFE_SECURE_MASK_CONN124           (0x49b0)
+#define AFE_SECURE_MASK_CONN124_1         (0x49b4)
+#define AFE_SECURE_MASK_CONN124_2         (0x49b8)
+#define AFE_SECURE_MASK_CONN124_3         (0x49bc)
+#define AFE_SECURE_MASK_CONN124_4         (0x49c0)
+#define AFE_SECURE_MASK_CONN125           (0x49c4)
+#define AFE_SECURE_MASK_CONN125_1         (0x49c8)
+#define AFE_SECURE_MASK_CONN125_2         (0x49cc)
+#define AFE_SECURE_MASK_CONN125_3         (0x49d0)
+#define AFE_SECURE_MASK_CONN125_4         (0x49d4)
+#define AFE_SECURE_MASK_CONN126           (0x49d8)
+#define AFE_SECURE_MASK_CONN126_1         (0x49dc)
+#define AFE_SECURE_MASK_CONN126_2         (0x49e0)
+#define AFE_SECURE_MASK_CONN126_3         (0x49e4)
+#define AFE_SECURE_MASK_CONN126_4         (0x49e8)
+#define AFE_SECURE_MASK_CONN127           (0x49ec)
+#define AFE_SECURE_MASK_CONN127_1         (0x49f0)
+#define AFE_SECURE_MASK_CONN127_2         (0x49f4)
+#define AFE_SECURE_MASK_CONN127_3         (0x49f8)
+#define AFE_SECURE_MASK_CONN127_4         (0x49fc)
+#define AFE_SECURE_MASK_CONN128           (0x4a00)
+#define AFE_SECURE_MASK_CONN128_1         (0x4a04)
+#define AFE_SECURE_MASK_CONN128_2         (0x4a08)
+#define AFE_SECURE_MASK_CONN128_3         (0x4a0c)
+#define AFE_SECURE_MASK_CONN128_4         (0x4a10)
+#define AFE_SECURE_MASK_CONN129           (0x4a14)
+#define AFE_SECURE_MASK_CONN129_1         (0x4a18)
+#define AFE_SECURE_MASK_CONN129_2         (0x4a1c)
+#define AFE_SECURE_MASK_CONN129_3         (0x4a20)
+#define AFE_SECURE_MASK_CONN129_4         (0x4a24)
+#define AFE_SECURE_MASK_CONN130           (0x4a28)
+#define AFE_SECURE_MASK_CONN130_1         (0x4a2c)
+#define AFE_SECURE_MASK_CONN130_2         (0x4a30)
+#define AFE_SECURE_MASK_CONN130_3         (0x4a34)
+#define AFE_SECURE_MASK_CONN130_4         (0x4a38)
+#define AFE_SECURE_MASK_CONN131           (0x4a3c)
+#define AFE_SECURE_MASK_CONN131_1         (0x4a40)
+#define AFE_SECURE_MASK_CONN131_2         (0x4a44)
+#define AFE_SECURE_MASK_CONN131_3         (0x4a48)
+#define AFE_SECURE_MASK_CONN131_4         (0x4a4c)
+#define AFE_SECURE_MASK_CONN132           (0x4a50)
+#define AFE_SECURE_MASK_CONN132_1         (0x4a54)
+#define AFE_SECURE_MASK_CONN132_2         (0x4a58)
+#define AFE_SECURE_MASK_CONN132_3         (0x4a5c)
+#define AFE_SECURE_MASK_CONN132_4         (0x4a60)
+#define AFE_SECURE_MASK_CONN133           (0x4a64)
+#define AFE_SECURE_MASK_CONN133_1         (0x4a68)
+#define AFE_SECURE_MASK_CONN133_2         (0x4a6c)
+#define AFE_SECURE_MASK_CONN133_3         (0x4a70)
+#define AFE_SECURE_MASK_CONN133_4         (0x4a74)
+#define AFE_SECURE_MASK_CONN134           (0x4a78)
+#define AFE_SECURE_MASK_CONN134_1         (0x4a7c)
+#define AFE_SECURE_MASK_CONN134_2         (0x4a80)
+#define AFE_SECURE_MASK_CONN134_3         (0x4a84)
+#define AFE_SECURE_MASK_CONN134_4         (0x4a88)
+#define AFE_SECURE_MASK_CONN135           (0x4a8c)
+#define AFE_SECURE_MASK_CONN135_1         (0x4a90)
+#define AFE_SECURE_MASK_CONN135_2         (0x4a94)
+#define AFE_SECURE_MASK_CONN135_3         (0x4a98)
+#define AFE_SECURE_MASK_CONN135_4         (0x4a9c)
+#define AFE_SECURE_MASK_CONN136           (0x4aa0)
+#define AFE_SECURE_MASK_CONN136_1         (0x4aa4)
+#define AFE_SECURE_MASK_CONN136_2         (0x4aa8)
+#define AFE_SECURE_MASK_CONN136_3         (0x4aac)
+#define AFE_SECURE_MASK_CONN136_4         (0x4ab0)
+#define AFE_SECURE_MASK_CONN137           (0x4ab4)
+#define AFE_SECURE_MASK_CONN137_1         (0x4ab8)
+#define AFE_SECURE_MASK_CONN137_2         (0x4abc)
+#define AFE_SECURE_MASK_CONN137_3         (0x4ac0)
+#define AFE_SECURE_MASK_CONN137_4         (0x4ac4)
+#define AFE_SECURE_MASK_CONN138           (0x4ac8)
+#define AFE_SECURE_MASK_CONN138_1         (0x4acc)
+#define AFE_SECURE_MASK_CONN138_2         (0x4ad0)
+#define AFE_SECURE_MASK_CONN138_3         (0x4ad4)
+#define AFE_SECURE_MASK_CONN138_4         (0x4ad8)
+#define AFE_SECURE_MASK_CONN139           (0x4adc)
+#define AFE_SECURE_MASK_CONN139_1         (0x4ae0)
+#define AFE_SECURE_MASK_CONN139_2         (0x4ae4)
+#define AFE_SECURE_MASK_CONN139_3         (0x4ae8)
+#define AFE_SECURE_MASK_CONN139_4         (0x4aec)
+#define AFE_SECURE_MASK_CONN_RS           (0x4af0)
+#define AFE_SECURE_MASK_CONN_RS_1         (0x4af4)
+#define AFE_SECURE_MASK_CONN_RS_2         (0x4af8)
+#define AFE_SECURE_MASK_CONN_RS_3         (0x4afc)
+#define AFE_SECURE_MASK_CONN_RS_4         (0x4b00)
+#define AFE_SECURE_MASK_CONN_16BIT        (0x4b04)
+#define AFE_SECURE_MASK_CONN_16BIT_1      (0x4b08)
+#define AFE_SECURE_MASK_CONN_16BIT_2      (0x4b0c)
+#define AFE_SECURE_MASK_CONN_16BIT_3      (0x4b10)
+#define AFE_SECURE_MASK_CONN_16BIT_4      (0x4b14)
+#define AFE_SECURE_MASK_CONN_24BIT        (0x4b18)
+#define AFE_SECURE_MASK_CONN_24BIT_1      (0x4b1c)
+#define AFE_SECURE_MASK_CONN_24BIT_2      (0x4b20)
+#define AFE_SECURE_MASK_CONN_24BIT_3      (0x4b24)
+#define AFE_SECURE_MASK_CONN_24BIT_4      (0x4b28)
+#define AFE_GASRC0_NEW_CON0               (0x4c40)
+#define AFE_GASRC0_NEW_CON1               (0x4c44)
+#define AFE_GASRC0_NEW_CON2               (0x4c48)
+#define AFE_GASRC0_NEW_CON3               (0x4c4c)
+#define AFE_GASRC0_NEW_CON4               (0x4c50)
+#define AFE_GASRC0_NEW_CON5               (0x4c54)
+#define AFE_GASRC0_NEW_CON6               (0x4c58)
+#define AFE_GASRC0_NEW_CON7               (0x4c5c)
+#define AFE_GASRC0_NEW_CON8               (0x4c60)
+#define AFE_GASRC0_NEW_CON9               (0x4c64)
+#define AFE_GASRC0_NEW_CON10              (0x4c68)
+#define AFE_GASRC0_NEW_CON11              (0x4c6c)
+#define AFE_GASRC0_NEW_CON12              (0x4c70)
+#define AFE_GASRC0_NEW_CON13              (0x4c74)
+#define AFE_GASRC0_NEW_CON14              (0x4c78)
+#define AFE_GASRC1_NEW_CON0               (0x4c80)
+#define AFE_GASRC1_NEW_CON1               (0x4c84)
+#define AFE_GASRC1_NEW_CON2               (0x4c88)
+#define AFE_GASRC1_NEW_CON3               (0x4c8c)
+#define AFE_GASRC1_NEW_CON4               (0x4c90)
+#define AFE_GASRC1_NEW_CON5               (0x4c94)
+#define AFE_GASRC1_NEW_CON6               (0x4c98)
+#define AFE_GASRC1_NEW_CON7               (0x4c9c)
+#define AFE_GASRC1_NEW_CON8               (0x4ca0)
+#define AFE_GASRC1_NEW_CON9               (0x4ca4)
+#define AFE_GASRC1_NEW_CON10              (0x4ca8)
+#define AFE_GASRC1_NEW_CON11              (0x4cac)
+#define AFE_GASRC1_NEW_CON12              (0x4cb0)
+#define AFE_GASRC1_NEW_CON13              (0x4cb4)
+#define AFE_GASRC1_NEW_CON14              (0x4cb8)
+#define AFE_GASRC2_NEW_CON0               (0x4cc0)
+#define AFE_GASRC2_NEW_CON1               (0x4cc4)
+#define AFE_GASRC2_NEW_CON2               (0x4cc8)
+#define AFE_GASRC2_NEW_CON3               (0x4ccc)
+#define AFE_GASRC2_NEW_CON4               (0x4cd0)
+#define AFE_GASRC2_NEW_CON5               (0x4cd4)
+#define AFE_GASRC2_NEW_CON6               (0x4cd8)
+#define AFE_GASRC2_NEW_CON7               (0x4cdc)
+#define AFE_GASRC2_NEW_CON8               (0x4ce0)
+#define AFE_GASRC2_NEW_CON9               (0x4ce4)
+#define AFE_GASRC2_NEW_CON10              (0x4ce8)
+#define AFE_GASRC2_NEW_CON11              (0x4cec)
+#define AFE_GASRC2_NEW_CON12              (0x4cf0)
+#define AFE_GASRC2_NEW_CON13              (0x4cf4)
+#define AFE_GASRC2_NEW_CON14              (0x4cf8)
+#define AFE_GASRC3_NEW_CON0               (0x4d00)
+#define AFE_GASRC3_NEW_CON1               (0x4d04)
+#define AFE_GASRC3_NEW_CON2               (0x4d08)
+#define AFE_GASRC3_NEW_CON3               (0x4d0c)
+#define AFE_GASRC3_NEW_CON4               (0x4d10)
+#define AFE_GASRC3_NEW_CON5               (0x4d14)
+#define AFE_GASRC3_NEW_CON6               (0x4d18)
+#define AFE_GASRC3_NEW_CON7               (0x4d1c)
+#define AFE_GASRC3_NEW_CON8               (0x4d20)
+#define AFE_GASRC3_NEW_CON9               (0x4d24)
+#define AFE_GASRC3_NEW_CON10              (0x4d28)
+#define AFE_GASRC3_NEW_CON11              (0x4d2c)
+#define AFE_GASRC3_NEW_CON12              (0x4d30)
+#define AFE_GASRC3_NEW_CON13              (0x4d34)
+#define AFE_GASRC3_NEW_CON14              (0x4d38)
+#define AFE_GASRC4_NEW_CON0               (0x4d40)
+#define AFE_GASRC4_NEW_CON1               (0x4d44)
+#define AFE_GASRC4_NEW_CON2               (0x4d48)
+#define AFE_GASRC4_NEW_CON3               (0x4d4c)
+#define AFE_GASRC4_NEW_CON4               (0x4d50)
+#define AFE_GASRC4_NEW_CON5               (0x4d54)
+#define AFE_GASRC4_NEW_CON6               (0x4d58)
+#define AFE_GASRC4_NEW_CON7               (0x4d5c)
+#define AFE_GASRC4_NEW_CON8               (0x4d60)
+#define AFE_GASRC4_NEW_CON9               (0x4d64)
+#define AFE_GASRC4_NEW_CON10              (0x4d68)
+#define AFE_GASRC4_NEW_CON11              (0x4d6c)
+#define AFE_GASRC4_NEW_CON12              (0x4d70)
+#define AFE_GASRC4_NEW_CON13              (0x4d74)
+#define AFE_GASRC4_NEW_CON14              (0x4d78)
+#define AFE_GASRC5_NEW_CON0               (0x4d80)
+#define AFE_GASRC5_NEW_CON1               (0x4d84)
+#define AFE_GASRC5_NEW_CON2               (0x4d88)
+#define AFE_GASRC5_NEW_CON3               (0x4d8c)
+#define AFE_GASRC5_NEW_CON4               (0x4d90)
+#define AFE_GASRC5_NEW_CON5               (0x4d94)
+#define AFE_GASRC5_NEW_CON6               (0x4d98)
+#define AFE_GASRC5_NEW_CON7               (0x4d9c)
+#define AFE_GASRC5_NEW_CON8               (0x4da0)
+#define AFE_GASRC5_NEW_CON9               (0x4da4)
+#define AFE_GASRC5_NEW_CON10              (0x4da8)
+#define AFE_GASRC5_NEW_CON11              (0x4dac)
+#define AFE_GASRC5_NEW_CON12              (0x4db0)
+#define AFE_GASRC5_NEW_CON13              (0x4db4)
+#define AFE_GASRC5_NEW_CON14              (0x4db8)
+#define AFE_GASRC6_NEW_CON0               (0x4dc0)
+#define AFE_GASRC6_NEW_CON1               (0x4dc4)
+#define AFE_GASRC6_NEW_CON2               (0x4dc8)
+#define AFE_GASRC6_NEW_CON3               (0x4dcc)
+#define AFE_GASRC6_NEW_CON4               (0x4dd0)
+#define AFE_GASRC6_NEW_CON5               (0x4dd4)
+#define AFE_GASRC6_NEW_CON6               (0x4dd8)
+#define AFE_GASRC6_NEW_CON7               (0x4ddc)
+#define AFE_GASRC6_NEW_CON8               (0x4de0)
+#define AFE_GASRC6_NEW_CON9               (0x4de4)
+#define AFE_GASRC6_NEW_CON10              (0x4de8)
+#define AFE_GASRC6_NEW_CON11              (0x4dec)
+#define AFE_GASRC6_NEW_CON12              (0x4df0)
+#define AFE_GASRC6_NEW_CON13              (0x4df4)
+#define AFE_GASRC6_NEW_CON14              (0x4df8)
+#define AFE_GASRC7_NEW_CON0               (0x4e00)
+#define AFE_GASRC7_NEW_CON1               (0x4e04)
+#define AFE_GASRC7_NEW_CON2               (0x4e08)
+#define AFE_GASRC7_NEW_CON3               (0x4e0c)
+#define AFE_GASRC7_NEW_CON4               (0x4e10)
+#define AFE_GASRC7_NEW_CON5               (0x4e14)
+#define AFE_GASRC7_NEW_CON6               (0x4e18)
+#define AFE_GASRC7_NEW_CON7               (0x4e1c)
+#define AFE_GASRC7_NEW_CON8               (0x4e20)
+#define AFE_GASRC7_NEW_CON9               (0x4e24)
+#define AFE_GASRC7_NEW_CON10              (0x4e28)
+#define AFE_GASRC7_NEW_CON11              (0x4e2c)
+#define AFE_GASRC7_NEW_CON12              (0x4e30)
+#define AFE_GASRC7_NEW_CON13              (0x4e34)
+#define AFE_GASRC7_NEW_CON14              (0x4e38)
+#define AFE_GASRC8_NEW_CON0               (0x4e40)
+#define AFE_GASRC8_NEW_CON1               (0x4e44)
+#define AFE_GASRC8_NEW_CON2               (0x4e48)
+#define AFE_GASRC8_NEW_CON3               (0x4e4c)
+#define AFE_GASRC8_NEW_CON4               (0x4e50)
+#define AFE_GASRC8_NEW_CON5               (0x4e54)
+#define AFE_GASRC8_NEW_CON6               (0x4e58)
+#define AFE_GASRC8_NEW_CON7               (0x4e5c)
+#define AFE_GASRC8_NEW_CON8               (0x4e60)
+#define AFE_GASRC8_NEW_CON9               (0x4e64)
+#define AFE_GASRC8_NEW_CON10              (0x4e68)
+#define AFE_GASRC8_NEW_CON11              (0x4e6c)
+#define AFE_GASRC8_NEW_CON12              (0x4e70)
+#define AFE_GASRC8_NEW_CON13              (0x4e74)
+#define AFE_GASRC8_NEW_CON14              (0x4e78)
+#define AFE_GASRC9_NEW_CON0               (0x4e80)
+#define AFE_GASRC9_NEW_CON1               (0x4e84)
+#define AFE_GASRC9_NEW_CON2               (0x4e88)
+#define AFE_GASRC9_NEW_CON3               (0x4e8c)
+#define AFE_GASRC9_NEW_CON4               (0x4e90)
+#define AFE_GASRC9_NEW_CON5               (0x4e94)
+#define AFE_GASRC9_NEW_CON6               (0x4e98)
+#define AFE_GASRC9_NEW_CON7               (0x4e9c)
+#define AFE_GASRC9_NEW_CON8               (0x4ea0)
+#define AFE_GASRC9_NEW_CON9               (0x4ea4)
+#define AFE_GASRC9_NEW_CON10              (0x4ea8)
+#define AFE_GASRC9_NEW_CON11              (0x4eac)
+#define AFE_GASRC9_NEW_CON12              (0x4eb0)
+#define AFE_GASRC9_NEW_CON13              (0x4eb4)
+#define AFE_GASRC9_NEW_CON14              (0x4eb8)
+#define AFE_GASRC10_NEW_CON0              (0x4ec0)
+#define AFE_GASRC10_NEW_CON1              (0x4ec4)
+#define AFE_GASRC10_NEW_CON2              (0x4ec8)
+#define AFE_GASRC10_NEW_CON3              (0x4ecc)
+#define AFE_GASRC10_NEW_CON4              (0x4ed0)
+#define AFE_GASRC10_NEW_CON5              (0x4ed4)
+#define AFE_GASRC10_NEW_CON6              (0x4ed8)
+#define AFE_GASRC10_NEW_CON7              (0x4edc)
+#define AFE_GASRC10_NEW_CON8              (0x4ee0)
+#define AFE_GASRC10_NEW_CON9              (0x4ee4)
+#define AFE_GASRC10_NEW_CON10             (0x4ee8)
+#define AFE_GASRC10_NEW_CON11             (0x4eec)
+#define AFE_GASRC10_NEW_CON12             (0x4ef0)
+#define AFE_GASRC10_NEW_CON13             (0x4ef4)
+#define AFE_GASRC10_NEW_CON14             (0x4ef8)
+#define AFE_GASRC11_NEW_CON0              (0x4f00)
+#define AFE_GASRC11_NEW_CON1              (0x4f04)
+#define AFE_GASRC11_NEW_CON2              (0x4f08)
+#define AFE_GASRC11_NEW_CON3              (0x4f0c)
+#define AFE_GASRC11_NEW_CON4              (0x4f10)
+#define AFE_GASRC11_NEW_CON5              (0x4f14)
+#define AFE_GASRC11_NEW_CON6              (0x4f18)
+#define AFE_GASRC11_NEW_CON7              (0x4f1c)
+#define AFE_GASRC11_NEW_CON8              (0x4f20)
+#define AFE_GASRC11_NEW_CON9              (0x4f24)
+#define AFE_GASRC11_NEW_CON10             (0x4f28)
+#define AFE_GASRC11_NEW_CON11             (0x4f2c)
+#define AFE_GASRC11_NEW_CON12             (0x4f30)
+#define AFE_GASRC11_NEW_CON13             (0x4f34)
+#define AFE_GASRC11_NEW_CON14             (0x4f38)
+#define AFE_GASRC12_NEW_CON0              (0x4f40)
+#define AFE_GASRC12_NEW_CON1              (0x4f44)
+#define AFE_GASRC12_NEW_CON2              (0x4f48)
+#define AFE_GASRC12_NEW_CON3              (0x4f4c)
+#define AFE_GASRC12_NEW_CON4              (0x4f50)
+#define AFE_GASRC12_NEW_CON5              (0x4f54)
+#define AFE_GASRC12_NEW_CON6              (0x4f58)
+#define AFE_GASRC12_NEW_CON7              (0x4f5c)
+#define AFE_GASRC12_NEW_CON8              (0x4f60)
+#define AFE_GASRC12_NEW_CON9              (0x4f64)
+#define AFE_GASRC12_NEW_CON10             (0x4f68)
+#define AFE_GASRC12_NEW_CON11             (0x4f6c)
+#define AFE_GASRC12_NEW_CON12             (0x4f70)
+#define AFE_GASRC12_NEW_CON13             (0x4f74)
+#define AFE_GASRC12_NEW_CON14             (0x4f78)
+#define AFE_GASRC13_NEW_CON0              (0x4f80)
+#define AFE_GASRC13_NEW_CON1              (0x4f84)
+#define AFE_GASRC13_NEW_CON2              (0x4f88)
+#define AFE_GASRC13_NEW_CON3              (0x4f8c)
+#define AFE_GASRC13_NEW_CON4              (0x4f90)
+#define AFE_GASRC13_NEW_CON5              (0x4f94)
+#define AFE_GASRC13_NEW_CON6              (0x4f98)
+#define AFE_GASRC13_NEW_CON7              (0x4f9c)
+#define AFE_GASRC13_NEW_CON8              (0x4fa0)
+#define AFE_GASRC13_NEW_CON9              (0x4fa4)
+#define AFE_GASRC13_NEW_CON10             (0x4fa8)
+#define AFE_GASRC13_NEW_CON11             (0x4fac)
+#define AFE_GASRC13_NEW_CON12             (0x4fb0)
+#define AFE_GASRC13_NEW_CON13             (0x4fb4)
+#define AFE_GASRC13_NEW_CON14             (0x4fb8)
+#define AFE_GASRC14_NEW_CON0              (0x4fc0)
+#define AFE_GASRC14_NEW_CON1              (0x4fc4)
+#define AFE_GASRC14_NEW_CON2              (0x4fc8)
+#define AFE_GASRC14_NEW_CON3              (0x4fcc)
+#define AFE_GASRC14_NEW_CON4              (0x4fd0)
+#define AFE_GASRC14_NEW_CON5              (0x4fd4)
+#define AFE_GASRC14_NEW_CON6              (0x4fd8)
+#define AFE_GASRC14_NEW_CON7              (0x4fdc)
+#define AFE_GASRC14_NEW_CON8              (0x4fe0)
+#define AFE_GASRC14_NEW_CON9              (0x4fe4)
+#define AFE_GASRC14_NEW_CON10             (0x4fe8)
+#define AFE_GASRC14_NEW_CON11             (0x4fec)
+#define AFE_GASRC14_NEW_CON12             (0x4ff0)
+#define AFE_GASRC14_NEW_CON13             (0x4ff4)
+#define AFE_GASRC14_NEW_CON14             (0x4ff8)
+#define AFE_GASRC15_NEW_CON0              (0x5000)
+#define AFE_GASRC15_NEW_CON1              (0x5004)
+#define AFE_GASRC15_NEW_CON2              (0x5008)
+#define AFE_GASRC15_NEW_CON3              (0x500c)
+#define AFE_GASRC15_NEW_CON4              (0x5010)
+#define AFE_GASRC15_NEW_CON5              (0x5014)
+#define AFE_GASRC15_NEW_CON6              (0x5018)
+#define AFE_GASRC15_NEW_CON7              (0x501c)
+#define AFE_GASRC15_NEW_CON8              (0x5020)
+#define AFE_GASRC15_NEW_CON9              (0x5024)
+#define AFE_GASRC15_NEW_CON10             (0x5028)
+#define AFE_GASRC15_NEW_CON11             (0x502c)
+#define AFE_GASRC15_NEW_CON12             (0x5030)
+#define AFE_GASRC15_NEW_CON13             (0x5034)
+#define AFE_GASRC15_NEW_CON14             (0x5038)
+#define AFE_GASRC16_NEW_CON0              (0x5040)
+#define AFE_GASRC16_NEW_CON1              (0x5044)
+#define AFE_GASRC16_NEW_CON2              (0x5048)
+#define AFE_GASRC16_NEW_CON3              (0x504c)
+#define AFE_GASRC16_NEW_CON4              (0x5050)
+#define AFE_GASRC16_NEW_CON5              (0x5054)
+#define AFE_GASRC16_NEW_CON6              (0x5058)
+#define AFE_GASRC16_NEW_CON7              (0x505c)
+#define AFE_GASRC16_NEW_CON8              (0x5060)
+#define AFE_GASRC16_NEW_CON9              (0x5064)
+#define AFE_GASRC16_NEW_CON10             (0x5068)
+#define AFE_GASRC16_NEW_CON11             (0x506c)
+#define AFE_GASRC16_NEW_CON12             (0x5070)
+#define AFE_GASRC16_NEW_CON13             (0x5074)
+#define AFE_GASRC16_NEW_CON14             (0x5078)
+#define AFE_GASRC17_NEW_CON0              (0x5080)
+#define AFE_GASRC17_NEW_CON1              (0x5084)
+#define AFE_GASRC17_NEW_CON2              (0x5088)
+#define AFE_GASRC17_NEW_CON3              (0x508c)
+#define AFE_GASRC17_NEW_CON4              (0x5090)
+#define AFE_GASRC17_NEW_CON5              (0x5094)
+#define AFE_GASRC17_NEW_CON6              (0x5098)
+#define AFE_GASRC17_NEW_CON7              (0x509c)
+#define AFE_GASRC17_NEW_CON8              (0x50a0)
+#define AFE_GASRC17_NEW_CON9              (0x50a4)
+#define AFE_GASRC17_NEW_CON10             (0x50a8)
+#define AFE_GASRC17_NEW_CON11             (0x50ac)
+#define AFE_GASRC17_NEW_CON12             (0x50b0)
+#define AFE_GASRC17_NEW_CON13             (0x50b4)
+#define AFE_GASRC17_NEW_CON14             (0x50b8)
+#define AFE_GASRC18_NEW_CON0              (0x50c0)
+#define AFE_GASRC18_NEW_CON1              (0x50c4)
+#define AFE_GASRC18_NEW_CON2              (0x50c8)
+#define AFE_GASRC18_NEW_CON3              (0x50cc)
+#define AFE_GASRC18_NEW_CON4              (0x50d0)
+#define AFE_GASRC18_NEW_CON5              (0x50d4)
+#define AFE_GASRC18_NEW_CON6              (0x50d8)
+#define AFE_GASRC18_NEW_CON7              (0x50dc)
+#define AFE_GASRC18_NEW_CON8              (0x50e0)
+#define AFE_GASRC18_NEW_CON9              (0x50e4)
+#define AFE_GASRC18_NEW_CON10             (0x50e8)
+#define AFE_GASRC18_NEW_CON11             (0x50ec)
+#define AFE_GASRC18_NEW_CON12             (0x50f0)
+#define AFE_GASRC18_NEW_CON13             (0x50f4)
+#define AFE_GASRC18_NEW_CON14             (0x50f8)
+#define AFE_GASRC19_NEW_CON0              (0x5100)
+#define AFE_GASRC19_NEW_CON1              (0x5104)
+#define AFE_GASRC19_NEW_CON2              (0x5108)
+#define AFE_GASRC19_NEW_CON3              (0x510c)
+#define AFE_GASRC19_NEW_CON4              (0x5110)
+#define AFE_GASRC19_NEW_CON5              (0x5114)
+#define AFE_GASRC19_NEW_CON6              (0x5118)
+#define AFE_GASRC19_NEW_CON7              (0x511c)
+#define AFE_GASRC19_NEW_CON8              (0x5120)
+#define AFE_GASRC19_NEW_CON9              (0x5124)
+#define AFE_GASRC19_NEW_CON10             (0x5128)
+#define AFE_GASRC19_NEW_CON11             (0x512c)
+#define AFE_GASRC19_NEW_CON12             (0x5130)
+#define AFE_GASRC19_NEW_CON13             (0x5134)
+#define AFE_GASRC19_NEW_CON14             (0x5138)
+
+#define AFE_MAX_REGISTER                  (AFE_GASRC19_NEW_CON14)
+
+/* ASYS_TOP_CON */
+#define ASYS_TOP_CON_A1SYS_TIMING_ON       BIT(0)
+#define ASYS_TOP_CON_A2SYS_TIMING_ON       BIT(1)
+#define ASYS_TOP_CON_A3SYS_TIMING_ON       BIT(4)
+#define ASYS_TOP_CON_A4SYS_TIMING_ON       BIT(5)
+#define ASYS_TOP_CON_26M_TIMING_ON         BIT(2)
+
+/* PWR2_TOP_CON0 */
+#define PWR2_TOP_CON_DMIC8_SRC_SEL_MASK     GENMASK(31, 29)
+#define PWR2_TOP_CON_DMIC7_SRC_SEL_MASK     GENMASK(28, 26)
+#define PWR2_TOP_CON_DMIC6_SRC_SEL_MASK     GENMASK(25, 23)
+#define PWR2_TOP_CON_DMIC5_SRC_SEL_MASK     GENMASK(22, 20)
+#define PWR2_TOP_CON_DMIC4_SRC_SEL_MASK     GENMASK(19, 17)
+#define PWR2_TOP_CON_DMIC3_SRC_SEL_MASK     GENMASK(16, 14)
+#define PWR2_TOP_CON_DMIC2_SRC_SEL_MASK     GENMASK(13, 11)
+#define PWR2_TOP_CON_DMIC1_SRC_SEL_MASK     GENMASK(10, 8)
+#define PWR2_TOP_CON_DMIC8_SRC_SEL_VAL(x)   ((x) << 29)
+#define PWR2_TOP_CON_DMIC7_SRC_SEL_VAL(x)   ((x) << 26)
+#define PWR2_TOP_CON_DMIC6_SRC_SEL_VAL(x)   ((x) << 23)
+#define PWR2_TOP_CON_DMIC5_SRC_SEL_VAL(x)   ((x) << 20)
+#define PWR2_TOP_CON_DMIC4_SRC_SEL_VAL(x)   ((x) << 17)
+#define PWR2_TOP_CON_DMIC3_SRC_SEL_VAL(x)   ((x) << 14)
+#define PWR2_TOP_CON_DMIC2_SRC_SEL_VAL(x)   ((x) << 11)
+#define PWR2_TOP_CON_DMIC1_SRC_SEL_VAL(x)   ((x) << 8)
+
+/* PWR2_TOP_CON1 */
+#define PWR2_TOP_CON1_DMIC_CKDIV_ON        BIT(1)
+
+/* PCM_INTF_CON1 */
+#define PCM_INTF_CON1_SYNC_OUT_INV     BIT(23)
+#define PCM_INTF_CON1_BCLK_OUT_INV     BIT(22)
+#define PCM_INTF_CON1_CLK_OUT_INV_MASK GENMASK(23, 22)
+#define PCM_INTF_CON1_SYNC_IN_INV      BIT(21)
+#define PCM_INTF_CON1_BCLK_IN_INV      BIT(20)
+#define PCM_INTF_CON1_CLK_IN_INV_MASK  GENMASK(21, 20)
+#define PCM_INTF_CON1_PCM_24BIT        (0x1 << 16)
+#define PCM_INTF_CON1_PCM_16BIT        (0x0 << 16)
+#define PCM_INTF_CON1_PCM_BIT_MASK     BIT(16)
+#define PCM_INTF_CON1_PCM_WLEN_32BCK   (0x0 << 14)
+#define PCM_INTF_CON1_PCM_WLEN_64BCK   (0x1 << 14)
+#define PCM_INTF_CON1_PCM_WLEN_MASK    BIT(14)
+#define PCM_INTF_CON1_SYNC_LENGTH(x)   (((x) & 0x1f) << 9)
+#define PCM_INTF_CON1_SYNC_LENGTH_MASK (0x1f << 9)
+#define PCM_INTF_CON1_PCM_SLAVE        (0x1 << 5)
+#define PCM_INTF_CON1_PCM_MASTER       (0x0 << 5)
+#define PCM_INTF_CON1_PCM_M_S_MASK     BIT(5)
+#define PCM_INTF_CON1_PCM_MODE(x)      (((x) & 0x3) << 3)
+#define PCM_INTF_CON1_PCM_MODE_MASK    (0x3 << 3)
+#define PCM_INTF_CON1_PCM_FMT(x)       (((x) & 0x3) << 1)
+#define PCM_INTF_CON1_PCM_FMT_MASK     (0x3 << 1)
+#define PCM_INTF_CON1_PCM_EN           BIT(0)
+
+/* PCM_INTF_CON2 */
+#define PCM_INTF_CON2_CLK_DOMAIN_SEL(x)   (((x) & 0x3) << 23)
+#define PCM_INTF_CON2_CLK_DOMAIN_SEL_MASK (0x3 << 23)
+#define PCM_INTF_CON2_SYNC_FREQ_MODE(x)   (((x) & 0x1f) << 12)
+#define PCM_INTF_CON2_SYNC_FREQ_MODE_MASK (0x1f << 12)
+#define PCM_INTF_CON2_PCM_TX2RX_LPBK      BIT(8)
+
+/* AFE_MPHONE_MULTIx_CON0 */
+#define AFE_MPHONE_MULTI_CON0_16BIT_SWAP       BIT(3)
+#define AFE_MPHONE_MULTI_CON0_16BIT_SWAP_MASK  BIT(3)
+#define AFE_MPHONE_MULTI_CON0_24BIT_DATA       (0x1 << 1)
+#define AFE_MPHONE_MULTI_CON0_16BIT_DATA       (0x0 << 1)
+#define AFE_MPHONE_MULIT_CON0_24BIT_DATA_MASK  BIT(1)
+#define AFE_MPHONE_MULTI_CON0_EN               BIT(0)
+#define AFE_MPHONE_MULTI_CON0_EN_MASK          BIT(0)
+
+/* AFE_MPHONE_MULTIx_CON1 */
+#define AFE_MPHONE_MULTI_CON1_SYNC_ON                BIT(24)
+#define AFE_MPHONE_MULTI_CON1_SYNC_ON_MASK           BIT(24)
+#define AFE_MPHONE_MULTI_CON1_24BIT_SWAP_BYPASS      BIT(22)
+#define AFE_MPHONE_MULTI_CON1_24BIT_SWAP_BYPASS_MASK BIT(22)
+#define AFE_MPHONE_MULTI_CON1_NON_COMPACT_MODE       (0x1 << 19)
+#define AFE_MPHONE_MULTI_CON1_COMPACT_MODE           (0x0 << 19)
+#define AFE_MPHONE_MULTI_CON1_NON_COMPACT_MODE_MASK  BIT(19)
+#define AFE_MPHONE_MULTI_CON1_HBR_MODE               BIT(18)
+#define AFE_MPHONE_MULTI_CON1_HBR_MODE_MASK          BIT(18)
+#define AFE_MPHONE_MULTI_CON1_LRCK_32_CYCLE          (0x2 << 16)
+#define AFE_MPHONE_MULTI_CON1_LRCK_24_CYCLE          (0x1 << 16)
+#define AFE_MPHONE_MULTI_CON1_LRCK_16_CYCLE          (0x0 << 16)
+#define AFE_MPHONE_MULTI_CON1_LRCK_CYCLE_SEL_MASK    GENMASK(17, 16)
+#define AFE_MPHONE_MULTI_CON1_LRCK_INV               BIT(15)
+#define AFE_MPHONE_MULTI_CON1_LRCK_INV_MASK          BIT(15)
+#define AFE_MPHONE_MULTI_CON1_DELAY_DATA             BIT(14)
+#define AFE_MPHONE_MULTI_CON1_DELAY_DATA_MASK        BIT(14)
+#define AFE_MPHONE_MULTI_CON1_LEFT_ALIGN             BIT(13)
+#define AFE_MPHONE_MULTI_CON1_LEFT_ALIGN_MASK        BIT(13)
+#define AFE_MPHONE_MULTI_CON1_BIT_NUM(x)             ((((x) - 1) & 0x1f) << 8)
+#define AFE_MPHONE_MULTI_CON1_BIT_NUM_MASK           GENMASK(12, 8)
+#define AFE_MPHONE_MULTI_CON1_BCK_INV                BIT(6)
+#define AFE_MPHONE_MULTI_CON1_BCK_INV_MASK           BIT(6)
+#define AFE_MPHONE_MULTI_CON1_CH_NUM(x)              ((((x) >> 1) - 1) & 0x3)
+#define AFE_MPHONE_MULTI_CON1_CH_NUM_MASK            GENMASK(1, 0)
+
+/* AFE_MPHONE_MULTIx_CON2 */
+#define AFE_MPHONE_MULTI_CON2_SEL_SPDIFIN        BIT(19)
+#define AFE_MPHONE_MULTI_CON2_SEL_SPDIFIN_MASK   BIT(19)
+
+/* AFE_AUD_PAD_TOP */
+#define RG_RX_PROTOCOL2			BIT(3)
+#define RG_RX_FIFO_ON			BIT(0)
+
+/* AFE_ADDA_MTKAIF_CFG0 */
+#define MTKAIF_RXIF_CLKINV_ADC		BIT(31)
+#define MTKAIF_RXIF_PROTOCOL2		BIT(16)
+#define MTKAIF_TXIF_PROTOCOL2		BIT(4)
+#define MTKAIF_TXIF_8TO5		BIT(2)
+#define MTKAIF_RXIF_8TO5		BIT(1)
+#define MTKAIF_IF_LOOPBACK1		BIT(0)
+
+/* AFE_ADDA_MTKAIF_RX_CFG2 */
+#define MTKAIF_RXIF_DELAY_CYCLE(x)	((x) << 12)
+#define MTKAIF_RXIF_DELAY_CYCLE_MASK	GENMASK(15, 12)
+#define MTKAIF_RXIF_DELAY_DATA		BIT(8)
+#define MTKAIF_RXIF_DELAY_DATA_SHIFT	8
+
+/* AFE_ADDA_MTKAIF_SYNCWORD_CFG */
+#define ADDA6_MTKAIF_RX_SYNC_WORD2_DISABLE	BIT(23)
+
+/* AFE_DMICx_UL_SRC_CON0 */
+#define AFE_DMIC_UL_SRC_CON0_UL_PHASE_SEL_CH1(x)   (((x) & 0x7) << 27)
+#define AFE_DMIC_UL_SRC_CON0_UL_PHASE_SEL_CH2(x)   (((x) & 0x7) << 24)
+#define AFE_DMIC_UL_SRC_CON0_UL_TWO_WIRE_MODE_CTL  BIT(23)
+#define AFE_DMIC_UL_SRC_CON0_UL_MODE_3P25M_CH2_CTL BIT(22)
+#define AFE_DMIC_UL_SRC_CON0_UL_MODE_3P25M_CH1_CTL BIT(21)
+#define AFE_DMIC_UL_VOICE_MODE(x)                  (((x) & 0x7) << 17)
+#define AFE_DMIC_UL_CON0_VOCIE_MODE_8K   AFE_DMIC_UL_VOICE_MODE(0)
+#define AFE_DMIC_UL_CON0_VOCIE_MODE_16K  AFE_DMIC_UL_VOICE_MODE(1)
+#define AFE_DMIC_UL_CON0_VOCIE_MODE_32K  AFE_DMIC_UL_VOICE_MODE(2)
+#define AFE_DMIC_UL_CON0_VOCIE_MODE_48K  AFE_DMIC_UL_VOICE_MODE(3)
+#define AFE_DMIC_UL_SRC_CON0_UL_IIR_MODE_CTL(x)    (((x) & 0x7) << 7)
+#define AFE_DMIC_UL_SRC_CON0_UL_IIR_ON_TMP_CTL     BIT(10)
+#define AFE_DMIC_UL_SRC_CON0_UL_SDM_3_LEVEL_CTL    BIT(1)
+#define AFE_DMIC_UL_SRC_CON0_UL_SRC_ON_TMP_CTL     BIT(0)
+
+/* ETDM_INx_AFIFO_CON */
+#define ETDM_IN_USE_AFIFO		BIT(8)
+#define ETDM_IN_AFIFO_CLOCK(x)		((x) << 5)
+#define ETDM_IN_AFIFO_CLOCK_MASK	GENMASK(7, 5)
+#define ETDM_IN_AFIFO_MODE(x)		((x) << 0)
+#define ETDM_IN_AFIFO_MODE_MASK		GENMASK(4, 0)
+
+/* ETDM_COWORK_CON0 */
+#define ETDM_OUT1_SLAVE_SEL(x)		((x) << 20)
+#define ETDM_OUT1_SLAVE_SEL_MASK	GENMASK(23, 20)
+#define ETDM_OUT1_SLAVE_SEL_SHIFT	20
+
+/* ETDM_COWORK_CON1 */
+#define ETDM_IN1_SDATA_SEL(x)		((x) << 20)
+#define ETDM_IN1_SDATA_SEL_MASK		GENMASK(23, 20)
+#define ETDM_IN1_SDATA_SEL_SHIFT	20
+#define ETDM_IN1_SDATA0_SEL(x)		((x) << 16)
+#define ETDM_IN1_SDATA0_SEL_MASK	GENMASK(19, 16)
+#define ETDM_IN1_SDATA0_SEL_SHIFT	16
+#define ETDM_IN1_SLAVE_SEL(x)		((x) << 8)
+#define ETDM_IN1_SLAVE_SEL_MASK		GENMASK(11, 8)
+#define ETDM_IN1_SLAVE_SEL_SHIFT	8
+
+/* ETDM_COWORK_CON2 */
+#define ETDM_IN2_SLAVE_SEL(x)		((x) << 24)
+#define ETDM_IN2_SLAVE_SEL_MASK		GENMASK(27, 24)
+#define ETDM_IN2_SLAVE_SEL_SHIFT	24
+#define ETDM_OUT3_SLAVE_SEL(x)		((x) << 20)
+#define ETDM_OUT3_SLAVE_SEL_MASK	GENMASK(23, 20)
+#define ETDM_OUT3_SLAVE_SEL_SHIFT	20
+#define ETDM_OUT2_SLAVE_SEL(x)		((x) << 8)
+#define ETDM_OUT2_SLAVE_SEL_MASK	GENMASK(11, 8)
+#define ETDM_OUT2_SLAVE_SEL_SHIFT	8
+
+/* ETDM_COWORK_CON3 */
+#define ETDM_IN2_SDATA_SEL(x)		((x) << 4)
+#define ETDM_IN2_SDATA_SEL_MASK		GENMASK(7, 4)
+#define ETDM_IN2_SDATA_SEL_SHIFT	4
+#define ETDM_IN2_SDATA0_SEL(x)		((x) << 0)
+#define ETDM_IN2_SDATA0_SEL_MASK	GENMASK(3, 0)
+#define ETDM_IN2_SDATA0_SEL_SHIFT	0
+
+/* ETDM_x_CONx */
+#define ETDM_CON0_CH_NUM(x)		(((x) - 1) << 23)
+#define ETDM_CON0_CH_NUM_MASK		GENMASK(27, 23)
+#define ETDM_CON0_WORD_LEN(x)		(((x) - 1) << 16)
+#define ETDM_CON0_WORD_LEN_MASK		GENMASK(20, 16)
+#define ETDM_CON0_BIT_LEN(x)		(((x) - 1) << 11)
+#define ETDM_CON0_BIT_LEN_MASK		GENMASK(15, 11)
+#define ETDM_CON0_FORMAT(x)		((x) << 6)
+#define ETDM_CON0_FORMAT_MASK		GENMASK(8, 6)
+#define ETDM_CON0_SLAVE_MODE		BIT(5)
+#define ETDM_CON0_EN			BIT(0)
+
+#define ETDM_OUT_CON0_RELATCH_DOMAIN(x)		((x) << 28)
+#define ETDM_OUT_CON0_RELATCH_DOMAIN_MASK	GENMASK(29, 28)
+
+#define ETDM_CON1_MCLK_OUTPUT			BIT(16)
+#define ETDM_IN_CON1_LRCK_AUTO_MODE		BIT(31)
+#define ETDM_IN_CON1_LRCK_WIDTH(x)		(((x) - 1) << 20)
+#define ETDM_IN_CON1_LRCK_WIDTH_MASK		GENMASK(29, 20)
+#define ETDM_OUT_CON1_LRCK_AUTO_MODE		BIT(29)
+#define ETDM_OUT_CON1_LRCK_WIDTH(x)		(((x) - 1) << 19)
+#define ETDM_OUT_CON1_LRCK_WIDTH_MASK		GENMASK(28, 19)
+
+#define ETDM_IN_CON2_MULTI_IP_2CH_MODE		BIT(31)
+#define ETDM_IN_CON2_MULTI_IP_TOTAL_CH(x)	(((x) - 1) << 15)
+#define ETDM_IN_CON2_MULTI_IP_TOTAL_CH_MASK	GENMASK(19, 15)
+#define ETDM_IN_CON2_CLOCK(x)			((x) << 10)
+#define ETDM_IN_CON2_CLOCK_MASK			GENMASK(12, 10)
+#define ETDM_IN_CON2_CLOCK_SHIFT		10
+#define ETDM_IN_CON2_UPDATE_GAP(x)		((x) << 5)
+#define ETDM_IN_CON2_UPDATE_GAP_MASK		GENMASK(9, 5)
+
+#define ETDM_OUT_CON2_LRCK_DELAY_BCK_INV	BIT(30)
+#define ETDM_OUT_CON2_LRCK_DELAY_0P5T_EN	BIT(29)
+
+#define ETDM_IN_CON3_FS(x)			((x) << 26)
+#define ETDM_IN_CON3_FS_MASK			GENMASK(30, 26)
+#define ETDM_IN_CON3_DISABLE_OUT(x)		BIT(((x) & 0xf))
+#define ETDM_IN_CON3_DISABLE_OUT_MASK		GENMASK(15, 0)
+
+#define ETDM_IN_CON4_MASTER_LRCK_INV		BIT(19)
+#define ETDM_IN_CON4_MASTER_BCK_INV		BIT(18)
+#define ETDM_IN_CON4_SLAVE_LRCK_INV		BIT(17)
+#define ETDM_IN_CON4_SLAVE_BCK_INV		BIT(16)
+
+#define ETDM_OUT_CON4_RELATCH_EN(x)		((x) << 24)
+#define ETDM_OUT_CON4_RELATCH_EN_MASK		GENMASK(28, 24)
+#define ETDM_OUT_CON4_CLOCK(x)			((x) << 6)
+#define ETDM_OUT_CON4_CLOCK_MASK		GENMASK(8, 6)
+#define ETDM_OUT_CON4_CLOCK_SHIFT		6
+#define ETDM_OUT_CON4_FS(x)			((x) << 0)
+#define ETDM_OUT_CON4_FS_MASK			GENMASK(4, 0)
+
+#define ETDM_IN_CON5_LR_SWAP(x)			BIT(((x) & 0xf) + 16)
+#define ETDM_IN_CON5_LR_SWAP_MASK		GENMASK(31, 16)
+#define ETDM_IN_CON5_ENABLE_ODD(x)		BIT(((x) & 0xf))
+#define ETDM_IN_CON5_ENABLE_ODD_MASK		GENMASK(15, 0)
+
+#define ETDM_OUT_CON5_MASTER_LRCK_INV		BIT(10)
+#define ETDM_OUT_CON5_MASTER_BCK_INV		BIT(9)
+#define ETDM_OUT_CON5_SLAVE_LRCK_INV		BIT(8)
+#define ETDM_OUT_CON5_SLAVE_BCK_INV		BIT(7)
+
+/* AFE_DPTX_CON */
+#define AFE_DPTX_CON_CH_EN(x)     (((x) & 0xff) << 8)
+#define AFE_DPTX_CON_CH_EN_2CH    (AFE_DPTX_CON_CH_EN(GENMASK(1, 0)))
+#define AFE_DPTX_CON_CH_EN_4CH    (AFE_DPTX_CON_CH_EN(GENMASK(3, 0)))
+#define AFE_DPTX_CON_CH_EN_6CH    (AFE_DPTX_CON_CH_EN(GENMASK(5, 0)))
+#define AFE_DPTX_CON_CH_EN_8CH    (AFE_DPTX_CON_CH_EN(GENMASK(7, 0)))
+#define AFE_DPTX_CON_CH_EN_MASK   GENMASK(15, 8)
+#define AFE_DPTX_CON_16BIT        (0x1 << 2)
+#define AFE_DPTX_CON_24BIT        (0x0 << 2)
+#define AFE_DPTX_CON_16BIT_MASK   BIT(2)
+#define AFE_DPTX_CON_CH_NUM(x)    (((x) & 0x1) << 1)
+#define AFE_DPTX_CON_CH_NUM_2CH   (AFE_DPTX_CON_CH_NUM(0))
+#define AFE_DPTX_CON_CH_NUM_8CH   (AFE_DPTX_CON_CH_NUM(1))
+#define AFE_DPTX_CON_CH_NUM_MASK  (0x1 << 1)
+#define AFE_DPTX_CON_ON           BIT(0)
+#define AFE_DPTX_CON_ON_MASK      BIT(0)
+
+/* AFE_ADDA_UL_DL_CON0 */
+#define ADDA_AFE_ON_SHIFT		0
+
+/* AFE_ADDA_DL_SRC2_CON0 */
+#define DL_2_INPUT_MODE_CTL(x)		((x) << 28)
+#define DL_2_INPUT_MODE_CTL_MASK	GENMASK(31, 28)
+#define DL_2_CH1_SATURATION_EN_CTL	BIT(27)
+#define DL_2_CH2_SATURATION_EN_CTL	BIT(26)
+#define DL_2_MUTE_CH1_OFF_CTL_PRE	BIT(12)
+#define DL_2_MUTE_CH2_OFF_CTL_PRE	BIT(11)
+#define DL_2_VOICE_MODE_CTL_PRE		BIT(5)
+#define DL_2_GAIN_ON_CTL_PRE_SHIFT	1
+#define DL_2_SRC_ON_TMP_CTRL_PRE_SHIFT	0
+
+/* AFE_ADDA_DL_SRC2_CON1 */
+#define DL_2_GAIN_CTL_PRE(x)		((x) << 16)
+#define DL_2_GAIN_CTL_PRE_MASK		GENMASK(31, 16)
+#define DL_2_GAIN_CTL_PRE_SHIFT		16
+
+/* AFE_ADDA_TOP_CON0 */
+#define C_LOOPBACK_MODE_CTL_MASK	GENMASK(15, 12)
+#define DL_INPUT_FROM_SINEGEN		(4 << 12)
+
+/* AFE_ADDA_DL_SDM_DCCOMP_CON */
+#define DL_USE_NEW_2ND_SDM		BIT(30)
+#define ATTGAIN_CTL_MASK		GENMASK(5, 0)
+
+/* AFE_ADDA_UL_SRC_CON0 */
+#define UL_MODE_3P25M_CH2_CTL		BIT(22)
+#define UL_MODE_3P25M_CH1_CTL		BIT(21)
+#define UL_VOICE_MODE_CTL(x)		((x) << 17)
+#define UL_VOICE_MODE_CTL_MASK		GENMASK(19, 17)
+#define UL_LOOPBACK_MODE_CTL		BIT(2)
+#define UL_SDM3_LEVEL_CTL		BIT(1)
+#define UL_SRC_ON_TMP_CTL_SHIFT		0
+
+#endif
-- 
2.18.0

