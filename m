Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 530963E4342
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 11:51:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4CC7168D;
	Mon,  9 Aug 2021 11:50:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4CC7168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628502660;
	bh=nijULORP5IDr7isD8JTd0MIz3JxrHggq9obLiqD7Kqk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u5iI8u4N/WdWGT9c6NBnaJ92/0GqkShCRGJpCjhFyUXeEJ82sU0e3ehvwtcr74sN3
	 V6r95A1tLO1l/WmOpibOPGzVWSeEgNtU/EClcBB+9Sqil1xGC73euQgzEqaxAKy0iM
	 vW+n0ZjyFrwQfsNYdt8heF0Her3NAF6/HX3naMU4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48D3AF804AE;
	Mon,  9 Aug 2021 11:49:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43EECF804E6; Mon,  9 Aug 2021 11:49:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88664F800CB
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 11:49:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88664F800CB
X-UUID: 9b7ff837a71c41f28d4124ccbc4651dc-20210809
X-UUID: 9b7ff837a71c41f28d4124ccbc4651dc-20210809
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1011270957; Mon, 09 Aug 2021 17:48:59 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Aug 2021 17:48:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 9 Aug 2021 17:48:58 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
Subject: [PATCH v3 2/9] ASoC: mediatek: mt8195: support audsys clock control
Date: Mon, 9 Aug 2021 17:48:48 +0800
Message-ID: <20210809094855.7169-3-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210809094855.7169-1-trevor.wu@mediatek.com>
References: <20210809094855.7169-1-trevor.wu@mediatek.com>
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

This patch adds mt8195 audio cg control.
Audio clock gates are registered to CCF for reference count and
clock parent management.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8195/mt8195-audsys-clk.c | 217 ++++++++++++++++++
 sound/soc/mediatek/mt8195/mt8195-audsys-clk.h |  15 ++
 .../soc/mediatek/mt8195/mt8195-audsys-clkid.h |  93 ++++++++
 3 files changed, 325 insertions(+)
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-audsys-clk.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-audsys-clk.h
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-audsys-clkid.h

diff --git a/sound/soc/mediatek/mt8195/mt8195-audsys-clk.c b/sound/soc/mediatek/mt8195/mt8195-audsys-clk.c
new file mode 100644
index 000000000000..40942239e240
--- /dev/null
+++ b/sound/soc/mediatek/mt8195/mt8195-audsys-clk.c
@@ -0,0 +1,217 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * mt8195-audsys-clk.h  --  Mediatek 8195 audsys clock control
+ *
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Trevor Wu <trevor.wu@mediatek.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/clkdev.h>
+#include "mt8195-afe-common.h"
+#include "mt8195-audsys-clk.h"
+#include "mt8195-audsys-clkid.h"
+#include "mt8195-reg.h"
+
+struct afe_gate {
+	int id;
+	const char *name;
+	const char *parent_name;
+	int reg;
+	u8 bit;
+	const struct clk_ops *ops;
+	unsigned long flags;
+	u8 cg_flags;
+};
+
+#define GATE_AFE_FLAGS(_id, _name, _parent, _reg, _bit, _flags, _cgflags) {\
+		.id = _id,					\
+		.name = _name,					\
+		.parent_name = _parent,				\
+		.reg = _reg,					\
+		.bit = _bit,					\
+		.flags = _flags,				\
+		.cg_flags = _cgflags,				\
+	}
+
+#define GATE_AFE(_id, _name, _parent, _reg, _bit)		\
+	GATE_AFE_FLAGS(_id, _name, _parent, _reg, _bit,		\
+		       CLK_SET_RATE_PARENT, CLK_GATE_SET_TO_DISABLE)
+
+#define GATE_AUD0(_id, _name, _parent, _bit)			\
+	GATE_AFE(_id, _name, _parent, AUDIO_TOP_CON0, _bit)
+
+#define GATE_AUD1(_id, _name, _parent, _bit)			\
+	GATE_AFE(_id, _name, _parent, AUDIO_TOP_CON1, _bit)
+
+#define GATE_AUD3(_id, _name, _parent, _bit)			\
+	GATE_AFE(_id, _name, _parent, AUDIO_TOP_CON3, _bit)
+
+#define GATE_AUD4(_id, _name, _parent, _bit)			\
+	GATE_AFE(_id, _name, _parent, AUDIO_TOP_CON4, _bit)
+
+#define GATE_AUD5(_id, _name, _parent, _bit)			\
+	GATE_AFE(_id, _name, _parent, AUDIO_TOP_CON5, _bit)
+
+#define GATE_AUD6(_id, _name, _parent, _bit)			\
+	GATE_AFE(_id, _name, _parent, AUDIO_TOP_CON6, _bit)
+
+static const struct afe_gate aud_clks[CLK_AUD_NR_CLK] = {
+	/* AUD0 */
+	GATE_AUD0(CLK_AUD_AFE, "aud_afe", "a1sys_hp_sel", 2),
+	GATE_AUD0(CLK_AUD_LRCK_CNT, "aud_lrck_cnt", "a1sys_hp_sel", 4),
+	GATE_AUD0(CLK_AUD_SPDIFIN_TUNER_APLL, "aud_spdifin_tuner_apll", "apll4_sel", 10),
+	GATE_AUD0(CLK_AUD_SPDIFIN_TUNER_DBG, "aud_spdifin_tuner_dbg", "apll4_sel", 11),
+	GATE_AUD0(CLK_AUD_UL_TML, "aud_ul_tml", "a1sys_hp_sel", 18),
+	GATE_AUD0(CLK_AUD_APLL1_TUNER, "aud_apll1_tuner", "apll1_sel", 19),
+	GATE_AUD0(CLK_AUD_APLL2_TUNER, "aud_apll2_tuner", "apll2_sel", 20),
+	GATE_AUD0(CLK_AUD_TOP0_SPDF, "aud_top0_spdf", "aud_iec_sel", 21),
+	GATE_AUD0(CLK_AUD_APLL, "aud_apll", "apll1_sel", 23),
+	GATE_AUD0(CLK_AUD_APLL2, "aud_apll2", "apll2_sel", 24),
+	GATE_AUD0(CLK_AUD_DAC, "aud_dac", "a1sys_hp_sel", 25),
+	GATE_AUD0(CLK_AUD_DAC_PREDIS, "aud_dac_predis", "a1sys_hp_sel", 26),
+	GATE_AUD0(CLK_AUD_TML, "aud_tml", "a1sys_hp_sel", 27),
+	GATE_AUD0(CLK_AUD_ADC, "aud_adc", "a1sys_hp_sel", 28),
+	GATE_AUD0(CLK_AUD_DAC_HIRES, "aud_dac_hires", "audio_h_sel", 31),
+
+	/* AUD1 */
+	GATE_AUD1(CLK_AUD_A1SYS_HP, "aud_a1sys_hp", "a1sys_hp_sel", 2),
+	GATE_AUD1(CLK_AUD_AFE_DMIC1, "aud_afe_dmic1", "a1sys_hp_sel", 10),
+	GATE_AUD1(CLK_AUD_AFE_DMIC2, "aud_afe_dmic2", "a1sys_hp_sel", 11),
+	GATE_AUD1(CLK_AUD_AFE_DMIC3, "aud_afe_dmic3", "a1sys_hp_sel", 12),
+	GATE_AUD1(CLK_AUD_AFE_DMIC4, "aud_afe_dmic4", "a1sys_hp_sel", 13),
+	GATE_AUD1(CLK_AUD_AFE_26M_DMIC_TM, "aud_afe_26m_dmic_tm", "a1sys_hp_sel", 14),
+	GATE_AUD1(CLK_AUD_UL_TML_HIRES, "aud_ul_tml_hires", "audio_h_sel", 16),
+	GATE_AUD1(CLK_AUD_ADC_HIRES, "aud_adc_hires", "audio_h_sel", 17),
+	GATE_AUD1(CLK_AUD_ADDA6_ADC, "aud_adda6_adc", "a1sys_hp_sel", 18),
+	GATE_AUD1(CLK_AUD_ADDA6_ADC_HIRES, "aud_adda6_adc_hires", "audio_h_sel", 19),
+
+	/* AUD3 */
+	GATE_AUD3(CLK_AUD_LINEIN_TUNER, "aud_linein_tuner", "apll5_sel", 5),
+	GATE_AUD3(CLK_AUD_EARC_TUNER, "aud_earc_tuner", "apll3_sel", 7),
+
+	/* AUD4 */
+	GATE_AUD4(CLK_AUD_I2SIN, "aud_i2sin", "a1sys_hp_sel", 0),
+	GATE_AUD4(CLK_AUD_TDM_IN, "aud_tdm_in", "a1sys_hp_sel", 1),
+	GATE_AUD4(CLK_AUD_I2S_OUT, "aud_i2s_out", "a1sys_hp_sel", 6),
+	GATE_AUD4(CLK_AUD_TDM_OUT, "aud_tdm_out", "a1sys_hp_sel", 7),
+	GATE_AUD4(CLK_AUD_HDMI_OUT, "aud_hdmi_out", "a1sys_hp_sel", 8),
+	GATE_AUD4(CLK_AUD_ASRC11, "aud_asrc11", "a1sys_hp_sel", 16),
+	GATE_AUD4(CLK_AUD_ASRC12, "aud_asrc12", "a1sys_hp_sel", 17),
+	GATE_AUD4(CLK_AUD_MULTI_IN, "aud_multi_in", "mphone_slave_b", 19),
+	GATE_AUD4(CLK_AUD_INTDIR, "aud_intdir", "intdir_sel", 20),
+	GATE_AUD4(CLK_AUD_A1SYS, "aud_a1sys", "a1sys_hp_sel", 21),
+	GATE_AUD4(CLK_AUD_A2SYS, "aud_a2sys", "a2sys_sel", 22),
+	GATE_AUD4(CLK_AUD_PCMIF, "aud_pcmif", "a1sys_hp_sel", 24),
+	GATE_AUD4(CLK_AUD_A3SYS, "aud_a3sys", "a3sys_sel", 30),
+	GATE_AUD4(CLK_AUD_A4SYS, "aud_a4sys", "a4sys_sel", 31),
+
+	/* AUD5 */
+	GATE_AUD5(CLK_AUD_MEMIF_UL1, "aud_memif_ul1", "a1sys_hp_sel", 0),
+	GATE_AUD5(CLK_AUD_MEMIF_UL2, "aud_memif_ul2", "a1sys_hp_sel", 1),
+	GATE_AUD5(CLK_AUD_MEMIF_UL3, "aud_memif_ul3", "a1sys_hp_sel", 2),
+	GATE_AUD5(CLK_AUD_MEMIF_UL4, "aud_memif_ul4", "a1sys_hp_sel", 3),
+	GATE_AUD5(CLK_AUD_MEMIF_UL5, "aud_memif_ul5", "a1sys_hp_sel", 4),
+	GATE_AUD5(CLK_AUD_MEMIF_UL6, "aud_memif_ul6", "a1sys_hp_sel", 5),
+	GATE_AUD5(CLK_AUD_MEMIF_UL8, "aud_memif_ul8", "a1sys_hp_sel", 7),
+	GATE_AUD5(CLK_AUD_MEMIF_UL9, "aud_memif_ul9", "a1sys_hp_sel", 8),
+	GATE_AUD5(CLK_AUD_MEMIF_UL10, "aud_memif_ul10", "a1sys_hp_sel", 9),
+	GATE_AUD5(CLK_AUD_MEMIF_DL2, "aud_memif_dl2", "a1sys_hp_sel", 18),
+	GATE_AUD5(CLK_AUD_MEMIF_DL3, "aud_memif_dl3", "a1sys_hp_sel", 19),
+	GATE_AUD5(CLK_AUD_MEMIF_DL6, "aud_memif_dl6", "a1sys_hp_sel", 22),
+	GATE_AUD5(CLK_AUD_MEMIF_DL7, "aud_memif_dl7", "a1sys_hp_sel", 23),
+	GATE_AUD5(CLK_AUD_MEMIF_DL8, "aud_memif_dl8", "a1sys_hp_sel", 24),
+	GATE_AUD5(CLK_AUD_MEMIF_DL10, "aud_memif_dl10", "a1sys_hp_sel", 26),
+	GATE_AUD5(CLK_AUD_MEMIF_DL11, "aud_memif_dl11", "a1sys_hp_sel", 27),
+
+	/* AUD6 */
+	GATE_AUD6(CLK_AUD_GASRC0, "aud_gasrc0", "asm_h_sel", 0),
+	GATE_AUD6(CLK_AUD_GASRC1, "aud_gasrc1", "asm_h_sel", 1),
+	GATE_AUD6(CLK_AUD_GASRC2, "aud_gasrc2", "asm_h_sel", 2),
+	GATE_AUD6(CLK_AUD_GASRC3, "aud_gasrc3", "asm_h_sel", 3),
+	GATE_AUD6(CLK_AUD_GASRC4, "aud_gasrc4", "asm_h_sel", 4),
+	GATE_AUD6(CLK_AUD_GASRC5, "aud_gasrc5", "asm_h_sel", 5),
+	GATE_AUD6(CLK_AUD_GASRC6, "aud_gasrc6", "asm_h_sel", 6),
+	GATE_AUD6(CLK_AUD_GASRC7, "aud_gasrc7", "asm_h_sel", 7),
+	GATE_AUD6(CLK_AUD_GASRC8, "aud_gasrc8", "asm_h_sel", 8),
+	GATE_AUD6(CLK_AUD_GASRC9, "aud_gasrc9", "asm_h_sel", 9),
+	GATE_AUD6(CLK_AUD_GASRC10, "aud_gasrc10", "asm_h_sel", 10),
+	GATE_AUD6(CLK_AUD_GASRC11, "aud_gasrc11", "asm_h_sel", 11),
+	GATE_AUD6(CLK_AUD_GASRC12, "aud_gasrc12", "asm_h_sel", 12),
+	GATE_AUD6(CLK_AUD_GASRC13, "aud_gasrc13", "asm_h_sel", 13),
+	GATE_AUD6(CLK_AUD_GASRC14, "aud_gasrc14", "asm_h_sel", 14),
+	GATE_AUD6(CLK_AUD_GASRC15, "aud_gasrc15", "asm_h_sel", 15),
+	GATE_AUD6(CLK_AUD_GASRC16, "aud_gasrc16", "asm_h_sel", 16),
+	GATE_AUD6(CLK_AUD_GASRC17, "aud_gasrc17", "asm_h_sel", 17),
+	GATE_AUD6(CLK_AUD_GASRC18, "aud_gasrc18", "asm_h_sel", 18),
+	GATE_AUD6(CLK_AUD_GASRC19, "aud_gasrc19", "asm_h_sel", 19),
+};
+
+int mt8195_audsys_clk_register(struct mtk_base_afe *afe)
+{
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	struct clk_onecell_data *clk_data;
+	struct clk *clk;
+	struct clk_lookup *cl;
+	int ret;
+	int i;
+
+	afe_priv->lookup = devm_kcalloc(afe->dev, CLK_AUD_NR_CLK,
+					sizeof(*afe_priv->lookup),
+					GFP_KERNEL);
+
+	if (!afe_priv->lookup)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(aud_clks); i++) {
+		const struct afe_gate *gate = &aud_clks[i];
+
+		clk = clk_register_gate(afe->dev, gate->name, gate->parent_name,
+					gate->flags, afe->base_addr + gate->reg,
+					gate->bit, gate->cg_flags, NULL);
+
+		if (IS_ERR(clk)) {
+			dev_err(afe->dev, "Failed to register clk %s: %ld\n",
+				gate->name, PTR_ERR(clk));
+			continue;
+		}
+
+		/* add clk_lookup for devm_clk_get(SND_SOC_DAPM_CLOCK_SUPPLY) */
+		cl = kzalloc(sizeof(*cl), GFP_KERNEL);
+		if (!cl)
+			return -ENOMEM;
+
+		cl->clk = clk;
+		cl->con_id = gate->name;
+		cl->dev_id = dev_name(afe->dev);
+		clkdev_add(cl);
+
+		afe_priv->lookup[i] = cl;
+	}
+
+	return 0;
+}
+
+void mt8195_audsys_clk_unregister(struct mtk_base_afe *afe)
+{
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	struct clk *clk;
+	struct clk_lookup *cl;
+	int i;
+
+	if (!afe_priv)
+		return;
+
+	for (i = 0; i < CLK_AUD_NR_CLK; i++) {
+		cl = afe_priv->lookup[i];
+		if (!cl)
+			continue;
+
+		clk = cl->clk;
+		clk_unregister_gate(clk);
+
+		clkdev_drop(cl);
+	}
+}
+
diff --git a/sound/soc/mediatek/mt8195/mt8195-audsys-clk.h b/sound/soc/mediatek/mt8195/mt8195-audsys-clk.h
new file mode 100644
index 000000000000..239d31016ba7
--- /dev/null
+++ b/sound/soc/mediatek/mt8195/mt8195-audsys-clk.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * mt8195-audsys-clk.h  --  Mediatek 8195 audsys clock definition
+ *
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Trevor Wu <trevor.wu@mediatek.com>
+ */
+
+#ifndef _MT8195_AUDSYS_CLK_H_
+#define _MT8195_AUDSYS_CLK_H_
+
+int mt8195_audsys_clk_register(struct mtk_base_afe *afe);
+void mt8195_audsys_clk_unregister(struct mtk_base_afe *afe);
+
+#endif
diff --git a/sound/soc/mediatek/mt8195/mt8195-audsys-clkid.h b/sound/soc/mediatek/mt8195/mt8195-audsys-clkid.h
new file mode 100644
index 000000000000..4dd0a5c8b8fa
--- /dev/null
+++ b/sound/soc/mediatek/mt8195/mt8195-audsys-clkid.h
@@ -0,0 +1,93 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * mt8195-audsys-clkid.h  --  Mediatek 8195 audsys clock id definition
+ *
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Trevor Wu <trevor.wu@mediatek.com>
+ */
+
+#ifndef _MT8195_AUDSYS_CLKID_H_
+#define _MT8195_AUDSYS_CLKID_H_
+
+enum{
+	CLK_AUD_AFE,
+	CLK_AUD_LRCK_CNT,
+	CLK_AUD_SPDIFIN_TUNER_APLL,
+	CLK_AUD_SPDIFIN_TUNER_DBG,
+	CLK_AUD_UL_TML,
+	CLK_AUD_APLL1_TUNER,
+	CLK_AUD_APLL2_TUNER,
+	CLK_AUD_TOP0_SPDF,
+	CLK_AUD_APLL,
+	CLK_AUD_APLL2,
+	CLK_AUD_DAC,
+	CLK_AUD_DAC_PREDIS,
+	CLK_AUD_TML,
+	CLK_AUD_ADC,
+	CLK_AUD_DAC_HIRES,
+	CLK_AUD_A1SYS_HP,
+	CLK_AUD_AFE_DMIC1,
+	CLK_AUD_AFE_DMIC2,
+	CLK_AUD_AFE_DMIC3,
+	CLK_AUD_AFE_DMIC4,
+	CLK_AUD_AFE_26M_DMIC_TM,
+	CLK_AUD_UL_TML_HIRES,
+	CLK_AUD_ADC_HIRES,
+	CLK_AUD_ADDA6_ADC,
+	CLK_AUD_ADDA6_ADC_HIRES,
+	CLK_AUD_LINEIN_TUNER,
+	CLK_AUD_EARC_TUNER,
+	CLK_AUD_I2SIN,
+	CLK_AUD_TDM_IN,
+	CLK_AUD_I2S_OUT,
+	CLK_AUD_TDM_OUT,
+	CLK_AUD_HDMI_OUT,
+	CLK_AUD_ASRC11,
+	CLK_AUD_ASRC12,
+	CLK_AUD_MULTI_IN,
+	CLK_AUD_INTDIR,
+	CLK_AUD_A1SYS,
+	CLK_AUD_A2SYS,
+	CLK_AUD_PCMIF,
+	CLK_AUD_A3SYS,
+	CLK_AUD_A4SYS,
+	CLK_AUD_MEMIF_UL1,
+	CLK_AUD_MEMIF_UL2,
+	CLK_AUD_MEMIF_UL3,
+	CLK_AUD_MEMIF_UL4,
+	CLK_AUD_MEMIF_UL5,
+	CLK_AUD_MEMIF_UL6,
+	CLK_AUD_MEMIF_UL8,
+	CLK_AUD_MEMIF_UL9,
+	CLK_AUD_MEMIF_UL10,
+	CLK_AUD_MEMIF_DL2,
+	CLK_AUD_MEMIF_DL3,
+	CLK_AUD_MEMIF_DL6,
+	CLK_AUD_MEMIF_DL7,
+	CLK_AUD_MEMIF_DL8,
+	CLK_AUD_MEMIF_DL10,
+	CLK_AUD_MEMIF_DL11,
+	CLK_AUD_GASRC0,
+	CLK_AUD_GASRC1,
+	CLK_AUD_GASRC2,
+	CLK_AUD_GASRC3,
+	CLK_AUD_GASRC4,
+	CLK_AUD_GASRC5,
+	CLK_AUD_GASRC6,
+	CLK_AUD_GASRC7,
+	CLK_AUD_GASRC8,
+	CLK_AUD_GASRC9,
+	CLK_AUD_GASRC10,
+	CLK_AUD_GASRC11,
+	CLK_AUD_GASRC12,
+	CLK_AUD_GASRC13,
+	CLK_AUD_GASRC14,
+	CLK_AUD_GASRC15,
+	CLK_AUD_GASRC16,
+	CLK_AUD_GASRC17,
+	CLK_AUD_GASRC18,
+	CLK_AUD_GASRC19,
+	CLK_AUD_NR_CLK,
+};
+
+#endif
-- 
2.18.0

