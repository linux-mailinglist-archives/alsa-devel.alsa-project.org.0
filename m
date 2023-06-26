Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B06B73DE0F
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:48:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5470151C;
	Mon, 26 Jun 2023 13:47:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5470151C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687780114;
	bh=2BLYvJvQSllCIi4BMFpTh2kRLL+qk6C6vUPMogk5RWo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TWuNf7DPH707aLnSj1kFKqqiWGxWPU0B8Bg4va8asjd3S4DvJWD6aSSOTiLabAMeg
	 88fOvNdGFftofvJjT3RP5oZXKWe6/AqDkWDO5Y7tMiY/cbJEzGHmHYjEanBr79rqDb
	 vHGEvwdFiTdwEit5YIVFnLMDfyrvSFErgu/5oeH0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26AC9F80630; Mon, 26 Jun 2023 13:43:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9D46F8062E;
	Mon, 26 Jun 2023 13:43:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20B13F80534; Mon, 26 Jun 2023 04:35:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,RDNS_NONE,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8DC6F80246
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 04:35:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8DC6F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=IArIkbT5
X-UUID: 1e0f399e13ca11eeb20a276fd37b9834-20230626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=wnjl5yaKC0oV4FudiXEwd8pFPQGS9Pkhlv469Vk/tDE=;
	b=IArIkbT54+OA95p/FxkDQG6Hul7c3FU6wv69iz3a7L9HHFCxoIb8t3kUMmoYbsHC0RI29ZGNTQcijnWBqNoGguOkVF4MwQDHJFddBdKlc0C36lLcSDbAfMT24p5b1YBLpe4pAqJT1pX8OYSZ1xJ8CMo+g8eZ+ExxIA1GKsI52Zs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:11f4377d-ac4c-4bff-816a-43e3b24119cf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.27,REQID:11f4377d-ac4c-4bff-816a-43e3b24119cf,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:01c9525,CLOUDID:e2761470-2f20-4998-991c-3b78627e4938,B
	ulkID:230626103531PV9Z8MKQ,BulkQuantity:0,Recheck:0,SF:17|19|48|38|29|28,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,
	TF_CID_SPAM_SNR
X-UUID: 1e0f399e13ca11eeb20a276fd37b9834-20230626
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com
	(envelope-from <maso.huang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 381454555; Mon, 26 Jun 2023 10:35:30 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 26 Jun 2023 10:35:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 26 Jun 2023 10:35:29 +0800
From: Maso Huang <maso.huang@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Trevor Wu <trevor.wu@mediatek.com>, Jiaxin Yu
	<jiaxin.yu@mediatek.com>, Ren Zhijie <renzhijie2@huawei.com>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Maso Huang <maso.huang@mediatek.com>
Subject: [PATCH v2 2/7] ASoC: mediatek: mt7986: support audio clock control
Date: Mon, 26 Jun 2023 10:34:56 +0800
Message-ID: <20230626023501.11120-3-maso.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230626023501.11120-1-maso.huang@mediatek.com>
References: <20230626023501.11120-1-maso.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MailFrom: maso.huang@mediatek.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZEERK5QIGWGLZRJNUNZOF6OCA6KM7JTZ
X-Message-ID-Hash: ZEERK5QIGWGLZRJNUNZOF6OCA6KM7JTZ
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:41:55 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZEERK5QIGWGLZRJNUNZOF6OCA6KM7JTZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add audio clock wrapper and audio tuner control.

Signed-off-by: Maso Huang <maso.huang@mediatek.com>
---
 sound/soc/mediatek/mt7986/mt7986-afe-clk.c | 75 ++++++++++++++++++++++
 sound/soc/mediatek/mt7986/mt7986-afe-clk.h | 18 ++++++
 2 files changed, 93 insertions(+)
 create mode 100644 sound/soc/mediatek/mt7986/mt7986-afe-clk.c
 create mode 100644 sound/soc/mediatek/mt7986/mt7986-afe-clk.h

diff --git a/sound/soc/mediatek/mt7986/mt7986-afe-clk.c b/sound/soc/mediatek/mt7986/mt7986-afe-clk.c
new file mode 100644
index 000000000000..a8b5fae05673
--- /dev/null
+++ b/sound/soc/mediatek/mt7986/mt7986-afe-clk.c
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * mt7986-afe-clk.c  --  MediaTek 7986 afe clock ctrl
+ *
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Vic Wu <vic.wu@mediatek.com>
+ *         Maso Huang <maso.huang@mediatek.com>
+ */
+
+#include <linux/clk.h>
+
+#include "mt7986-afe-common.h"
+#include "mt7986-afe-clk.h"
+#include "mt7986-reg.h"
+
+enum {
+	CK_INFRA_AUD_BUS_CK = 0,
+	CK_INFRA_AUD_26M_CK,
+	CK_INFRA_AUD_L_CK,
+	CK_INFRA_AUD_AUD_CK,
+	CK_INFRA_AUD_EG2_CK,
+	CLK_NUM
+};
+
+static const char *aud_clks[CLK_NUM] = {
+	[CK_INFRA_AUD_BUS_CK] = "aud_bus_ck",
+	[CK_INFRA_AUD_26M_CK] = "aud_26m_ck",
+	[CK_INFRA_AUD_L_CK] = "aud_l_ck",
+	[CK_INFRA_AUD_AUD_CK] = "aud_aud_ck",
+	[CK_INFRA_AUD_EG2_CK] = "aud_eg2_ck",
+};
+
+int mt7986_init_clock(struct mtk_base_afe *afe)
+{
+	struct mt7986_afe_private *afe_priv = afe->platform_priv;
+	int ret, i;
+
+	afe_priv->clks = devm_kcalloc(afe->dev, CLK_NUM,
+				sizeof(*afe_priv->clks), GFP_KERNEL);
+	if (!afe_priv->clks)
+		return -ENOMEM;
+	afe_priv->num_clks = CLK_NUM;
+
+	for (i = 0; i < afe_priv->num_clks; i++)
+		afe_priv->clks[i].id = aud_clks[i];
+
+	ret = devm_clk_bulk_get(afe->dev, afe_priv->num_clks, afe_priv->clks);
+	if (ret)
+		return dev_err_probe(afe->dev, ret, "Failed to get clocks\n");
+
+	return 0;
+}
+
+int mt7986_afe_enable_clock(struct mtk_base_afe *afe)
+{
+	struct mt7986_afe_private *afe_priv = afe->platform_priv;
+	int ret;
+
+	ret = clk_bulk_prepare_enable(afe_priv->num_clks, afe_priv->clks);
+	if (ret)
+		return dev_err_probe(afe->dev, ret, "Failed to enable clocks\n");
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt7986_afe_enable_clock);
+
+int mt7986_afe_disable_clock(struct mtk_base_afe *afe)
+{
+	struct mt7986_afe_private *afe_priv = afe->platform_priv;
+
+	clk_bulk_disable_unprepare(afe_priv->num_clks, afe_priv->clks);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt7986_afe_disable_clock);
diff --git a/sound/soc/mediatek/mt7986/mt7986-afe-clk.h b/sound/soc/mediatek/mt7986/mt7986-afe-clk.h
new file mode 100644
index 000000000000..2f15b7a54bdc
--- /dev/null
+++ b/sound/soc/mediatek/mt7986/mt7986-afe-clk.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * mt7986-afe-clk.h  --  MediaTek 7986 afe clock ctrl definition
+ *
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Vic Wu <vic.wu@mediatek.com>
+ *         Maso Huang <maso.huang@mediatek.com>
+ */
+
+#ifndef _MT7986_AFE_CLK_H_
+#define _MT7986_AFE_CLK_H_
+
+struct mtk_base_afe;
+
+int mt7986_init_clock(struct mtk_base_afe *afe);
+int mt7986_afe_enable_clock(struct mtk_base_afe *afe);
+int mt7986_afe_disable_clock(struct mtk_base_afe *afe);
+#endif
-- 
2.18.0

