Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2A353110F
	for <lists+alsa-devel@lfdr.de>; Mon, 23 May 2022 15:31:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 760E1176B;
	Mon, 23 May 2022 15:30:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 760E1176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653312695;
	bh=OW4sVaAzBOiiOjl3bRtebV4xHf7fb4ahHdoWYBflOl4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QuVvQPF7NcGTLC/iXraekhUVs+7yVAHTYmNCrZSJO6zq/SW07Eq5dgn/Dmj8AZo53
	 Ou3x03QDM5CMX6g6V7cIoiIk+B4928DqpQdBnCMf0jEWkln5ovf6T8pdtSaKxn5g2c
	 6tOkUd9eZRJbPT0utEHYdIlhd7qrsgsMwRdJAzeM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FE6DF80552;
	Mon, 23 May 2022 15:29:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD57DF8051F; Mon, 23 May 2022 15:29:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00710F8051E
 for <alsa-devel@alsa-project.org>; Mon, 23 May 2022 15:29:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00710F8051E
X-UUID: fb3ddf1cd9a540b1bfdf46e4d0bcb397-20220523
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:026fc2ef-8dd0-4b85-9f3c-2f6a663f92a6, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:2a19b09, CLOUDID:2df14d7a-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: fb3ddf1cd9a540b1bfdf46e4d0bcb397-20220523
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1423647117; Mon, 23 May 2022 21:29:05 +0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 23 May 2022 21:29:04 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 21:29:04 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 23 May 2022 21:29:03 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v5 03/20] ASoC: mediatek: mt8186: support audsys clock control
Date: Mon, 23 May 2022 21:28:41 +0800
Message-ID: <20220523132858.22166-4-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220523132858.22166-1-jiaxin.yu@mediatek.com>
References: <20220523132858.22166-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com, julianbraha@gmail.com,
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

Add mt8186 audio cg control. Audio clock gates are registered to
CCF for reference count and clock parent management.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8186/mt8186-audsys-clk.c | 150 ++++++++++++++++++
 sound/soc/mediatek/mt8186/mt8186-audsys-clk.h |  15 ++
 .../soc/mediatek/mt8186/mt8186-audsys-clkid.h |  45 ++++++
 3 files changed, 210 insertions(+)
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-audsys-clk.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-audsys-clk.h
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-audsys-clkid.h

diff --git a/sound/soc/mediatek/mt8186/mt8186-audsys-clk.c b/sound/soc/mediatek/mt8186/mt8186-audsys-clk.c
new file mode 100644
index 000000000000..578969ca91c8
--- /dev/null
+++ b/sound/soc/mediatek/mt8186/mt8186-audsys-clk.c
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// mt8186-audsys-clk.h  --  Mediatek 8186 audsys clock control
+//
+// Copyright (c) 2022 MediaTek Inc.
+// Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/clkdev.h>
+#include "mt8186-afe-common.h"
+#include "mt8186-audsys-clk.h"
+#include "mt8186-audsys-clkid.h"
+#include "mt8186-reg.h"
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
+#define GATE_AUD2(_id, _name, _parent, _bit)			\
+	GATE_AFE(_id, _name, _parent, AUDIO_TOP_CON2, _bit)
+
+static const struct afe_gate aud_clks[CLK_AUD_NR_CLK] = {
+	/* AUD0 */
+	GATE_AUD0(CLK_AUD_AFE, "aud_afe_clk", "top_audio", 2),
+	GATE_AUD0(CLK_AUD_22M, "aud_apll22m_clk", "top_aud_engen1", 8),
+	GATE_AUD0(CLK_AUD_24M, "aud_apll24m_clk", "top_aud_engen2", 9),
+	GATE_AUD0(CLK_AUD_APLL2_TUNER, "aud_apll2_tuner_clk", "top_aud_engen2", 18),
+	GATE_AUD0(CLK_AUD_APLL_TUNER, "aud_apll_tuner_clk", "top_aud_engen1", 19),
+	GATE_AUD0(CLK_AUD_TDM, "aud_tdm_clk", "top_aud_1", 20),
+	GATE_AUD0(CLK_AUD_ADC, "aud_adc_clk", "top_audio", 24),
+	GATE_AUD0(CLK_AUD_DAC, "aud_dac_clk", "top_audio", 25),
+	GATE_AUD0(CLK_AUD_DAC_PREDIS, "aud_dac_predis_clk", "top_audio", 26),
+	GATE_AUD0(CLK_AUD_TML, "aud_tml_clk", "top_audio", 27),
+	GATE_AUD0(CLK_AUD_NLE, "aud_nle_clk", "top_audio", 28),
+
+	/* AUD1 */
+	GATE_AUD1(CLK_AUD_I2S1_BCLK, "aud_i2s1_bclk", "top_audio", 4),
+	GATE_AUD1(CLK_AUD_I2S2_BCLK, "aud_i2s2_bclk", "top_audio", 5),
+	GATE_AUD1(CLK_AUD_I2S3_BCLK, "aud_i2s3_bclk", "top_audio", 6),
+	GATE_AUD1(CLK_AUD_I2S4_BCLK, "aud_i2s4_bclk", "top_audio", 7),
+	GATE_AUD1(CLK_AUD_CONNSYS_I2S_ASRC, "aud_connsys_i2s_asrc", "top_audio", 12),
+	GATE_AUD1(CLK_AUD_GENERAL1_ASRC, "aud_general1_asrc", "top_audio", 13),
+	GATE_AUD1(CLK_AUD_GENERAL2_ASRC, "aud_general2_asrc", "top_audio", 14),
+	GATE_AUD1(CLK_AUD_DAC_HIRES, "aud_dac_hires_clk", "top_audio_h", 15),
+	GATE_AUD1(CLK_AUD_ADC_HIRES, "aud_adc_hires_clk", "top_audio_h", 16),
+	GATE_AUD1(CLK_AUD_ADC_HIRES_TML, "aud_adc_hires_tml", "top_audio_h", 17),
+	GATE_AUD1(CLK_AUD_ADDA6_ADC, "aud_adda6_adc", "top_audio", 20),
+	GATE_AUD1(CLK_AUD_ADDA6_ADC_HIRES, "aud_adda6_adc_hires", "top_audio_h", 21),
+	GATE_AUD1(CLK_AUD_3RD_DAC, "aud_3rd_dac", "top_audio", 28),
+	GATE_AUD1(CLK_AUD_3RD_DAC_PREDIS, "aud_3rd_dac_predis", "top_audio", 29),
+	GATE_AUD1(CLK_AUD_3RD_DAC_TML, "aud_3rd_dac_tml", "top_audio", 30),
+	GATE_AUD1(CLK_AUD_3RD_DAC_HIRES, "aud_3rd_dac_hires", "top_audio_h", 31),
+
+	/* AUD2 */
+	GATE_AUD2(CLK_AUD_ETDM_IN1_BCLK, "aud_etdm_in1_bclk", "top_audio", 23),
+	GATE_AUD2(CLK_AUD_ETDM_OUT1_BCLK, "aud_etdm_out1_bclk", "top_audio", 24),
+};
+
+int mt8186_audsys_clk_register(struct mtk_base_afe *afe)
+{
+	struct mt8186_afe_private *afe_priv = afe->platform_priv;
+	struct clk *clk;
+	struct clk_lookup *cl;
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
+void mt8186_audsys_clk_unregister(struct mtk_base_afe *afe)
+{
+	struct mt8186_afe_private *afe_priv = afe->platform_priv;
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
diff --git a/sound/soc/mediatek/mt8186/mt8186-audsys-clk.h b/sound/soc/mediatek/mt8186/mt8186-audsys-clk.h
new file mode 100644
index 000000000000..b8d6a06e11e8
--- /dev/null
+++ b/sound/soc/mediatek/mt8186/mt8186-audsys-clk.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * mt8186-audsys-clk.h  --  Mediatek 8186 audsys clock definition
+ *
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Trevor Wu <trevor.wu@mediatek.com>
+ */
+
+#ifndef _MT8186_AUDSYS_CLK_H_
+#define _MT8186_AUDSYS_CLK_H_
+
+int mt8186_audsys_clk_register(struct mtk_base_afe *afe);
+void mt8186_audsys_clk_unregister(struct mtk_base_afe *afe);
+
+#endif
diff --git a/sound/soc/mediatek/mt8186/mt8186-audsys-clkid.h b/sound/soc/mediatek/mt8186/mt8186-audsys-clkid.h
new file mode 100644
index 000000000000..3ce5937c1823
--- /dev/null
+++ b/sound/soc/mediatek/mt8186/mt8186-audsys-clkid.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * mt8186-audsys-clkid.h  --  Mediatek 8186 audsys clock id definition
+ *
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
+ */
+
+#ifndef _MT8186_AUDSYS_CLKID_H_
+#define _MT8186_AUDSYS_CLKID_H_
+
+enum{
+	CLK_AUD_AFE,
+	CLK_AUD_22M,
+	CLK_AUD_24M,
+	CLK_AUD_APLL2_TUNER,
+	CLK_AUD_APLL_TUNER,
+	CLK_AUD_TDM,
+	CLK_AUD_ADC,
+	CLK_AUD_DAC,
+	CLK_AUD_DAC_PREDIS,
+	CLK_AUD_TML,
+	CLK_AUD_NLE,
+	CLK_AUD_I2S1_BCLK,
+	CLK_AUD_I2S2_BCLK,
+	CLK_AUD_I2S3_BCLK,
+	CLK_AUD_I2S4_BCLK,
+	CLK_AUD_CONNSYS_I2S_ASRC,
+	CLK_AUD_GENERAL1_ASRC,
+	CLK_AUD_GENERAL2_ASRC,
+	CLK_AUD_DAC_HIRES,
+	CLK_AUD_ADC_HIRES,
+	CLK_AUD_ADC_HIRES_TML,
+	CLK_AUD_ADDA6_ADC,
+	CLK_AUD_ADDA6_ADC_HIRES,
+	CLK_AUD_3RD_DAC,
+	CLK_AUD_3RD_DAC_PREDIS,
+	CLK_AUD_3RD_DAC_TML,
+	CLK_AUD_3RD_DAC_HIRES,
+	CLK_AUD_ETDM_IN1_BCLK,
+	CLK_AUD_ETDM_OUT1_BCLK,
+	CLK_AUD_NR_CLK,
+};
+
+#endif
-- 
2.18.0

