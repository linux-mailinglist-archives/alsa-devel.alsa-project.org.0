Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C34C976917A
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 11:20:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3B0593A;
	Mon, 31 Jul 2023 11:19:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3B0593A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690795206;
	bh=hJn2Q2wdJLSIZU4Wlc7msVOQnaUplOKODrZ0PNLaTWk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WVRtWkEPZrcfAx8AZYTuPCyUiB4IFP+HNBCkxERb3FcYzFc/f6bgykYWRQppBzXv5
	 z/FBBj7+kqmBuqQqTdXCikVc3mz1YkDnCC4GtLGeIWGyX06zTZc0hzPMNPQnc/teZl
	 4HjksKqDDMJniYsVL4n9+tLtkFV6DrT5wZvGGNCE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CAB3F805BA; Mon, 31 Jul 2023 11:17:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 89A2EF805B0;
	Mon, 31 Jul 2023 11:17:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19553F800C7; Fri, 28 Jul 2023 11:09:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 519FCF80310
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 11:08:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 519FCF80310
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=mSWD02d5
X-UUID: 59e8b5ba2d2611ee9cb5633481061a41-20230728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=6O25UN01f8z68mG3EH8Lj9+JX6dIjVHTITtOhlUCgBI=;
	b=mSWD02d5IovtEeBZ+YZJ7aYZon+dnPVyJmzYLGBp2j0sXmhBmuYAObFAGirhFACkPEnknwpi4DsJsk66+lV02vfgsrTxoIg/XI2q7MEW6DTM+jhTUWq1EBsn1tYnsNAUbutkQoYpORsDZLA2H49K33Lo1IWZt2aaSIRLKoMcDK4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:587dc5d9-47a5-41cf-a717-58a5da2fade5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.30,REQID:587dc5d9-47a5-41cf-a717-58a5da2fade5,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:1fcc6f8,CLOUDID:1fc26dd2-cd77-4e67-bbfd-aa4eaace762f,B
	ulkID:230728170846JIYL7OMV,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,
	TF_CID_SPAM_ASC
X-UUID: 59e8b5ba2d2611ee9cb5633481061a41-20230728
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com
	(envelope-from <maso.huang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1204730561; Fri, 28 Jul 2023 17:08:43 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 28 Jul 2023 17:08:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 28 Jul 2023 17:08:42 +0800
From: Maso Huang <maso.huang@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Trevor Wu <trevor.wu@mediatek.com>, Arnd
 Bergmann <arnd@arndb.de>, Mars Chen
	<chenxiangrui@huaqin.corp-partner.google.com>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Maso Huang <maso.huang@mediatek.com>
Subject: [PATCH v3 1/6] ASoC: mediatek: mt7986: add common header
Date: Fri, 28 Jul 2023 17:08:14 +0800
Message-ID: <20230728090819.18038-2-maso.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230728090819.18038-1-maso.huang@mediatek.com>
References: <20230728090819.18038-1-maso.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MailFrom: maso.huang@mediatek.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 52B572MFTN2VJILYESLWZQFZPKUNOBGY
X-Message-ID-Hash: 52B572MFTN2VJILYESLWZQFZPKUNOBGY
X-Mailman-Approved-At: Mon, 31 Jul 2023 09:17:25 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/52B572MFTN2VJILYESLWZQFZPKUNOBGY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add header files for register definition and structure.

Signed-off-by: Maso Huang <maso.huang@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt7986/mt7986-afe-common.h |  49 +++++
 sound/soc/mediatek/mt7986/mt7986-reg.h        | 206 ++++++++++++++++++
 2 files changed, 255 insertions(+)
 create mode 100644 sound/soc/mediatek/mt7986/mt7986-afe-common.h
 create mode 100644 sound/soc/mediatek/mt7986/mt7986-reg.h

diff --git a/sound/soc/mediatek/mt7986/mt7986-afe-common.h b/sound/soc/mediatek/mt7986/mt7986-afe-common.h
new file mode 100644
index 000000000000..1c59549d91b4
--- /dev/null
+++ b/sound/soc/mediatek/mt7986/mt7986-afe-common.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * mt7986-afe-common.h  --  MediaTek 7986 audio driver definitions
+ *
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Vic Wu <vic.wu@mediatek.com>
+ *         Maso Huang <maso.huang@mediatek.com>
+ */
+
+#ifndef _MT_7986_AFE_COMMON_H_
+#define _MT_7986_AFE_COMMON_H_
+
+#include <sound/soc.h>
+#include <linux/clk.h>
+#include <linux/list.h>
+#include <linux/regmap.h>
+#include "../common/mtk-base-afe.h"
+
+enum {
+	MT7986_MEMIF_DL1,
+	MT7986_MEMIF_VUL12,
+	MT7986_MEMIF_NUM,
+	MT7986_DAI_ETDM = MT7986_MEMIF_NUM,
+	MT7986_DAI_NUM,
+};
+
+enum {
+	MT7986_IRQ_0,
+	MT7986_IRQ_1,
+	MT7986_IRQ_2,
+	MT7986_IRQ_NUM,
+};
+
+struct mt7986_afe_private {
+	struct clk_bulk_data *clks;
+	int num_clks;
+
+	int pm_runtime_bypass_reg_ctl;
+
+	/* dai */
+	void *dai_priv[MT7986_DAI_NUM];
+};
+
+unsigned int mt7986_afe_rate_transform(struct device *dev,
+				       unsigned int rate);
+
+/* dai register */
+int mt7986_dai_etdm_register(struct mtk_base_afe *afe);
+#endif
diff --git a/sound/soc/mediatek/mt7986/mt7986-reg.h b/sound/soc/mediatek/mt7986/mt7986-reg.h
new file mode 100644
index 000000000000..88861f81890f
--- /dev/null
+++ b/sound/soc/mediatek/mt7986/mt7986-reg.h
@@ -0,0 +1,206 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * mt7986-reg.h  --  MediaTek 7986 audio driver reg definition
+ *
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Vic Wu <vic.wu@mediatek.com>
+ *         Maso Huang <maso.huang@mediatek.com>
+ */
+
+#ifndef _MT7986_REG_H_
+#define _MT7986_REG_H_
+
+#define AUDIO_TOP_CON2                  0x0008
+#define AUDIO_TOP_CON4                  0x0010
+#define AUDIO_ENGEN_CON0                0x0014
+#define AFE_IRQ_MCU_EN                  0x0100
+#define AFE_IRQ_MCU_STATUS              0x0120
+#define AFE_IRQ_MCU_CLR                 0x0128
+#define AFE_IRQ0_MCU_CFG0               0x0140
+#define AFE_IRQ0_MCU_CFG1               0x0144
+#define AFE_IRQ1_MCU_CFG0               0x0148
+#define AFE_IRQ1_MCU_CFG1               0x014c
+#define AFE_IRQ2_MCU_CFG0               0x0150
+#define AFE_IRQ2_MCU_CFG1               0x0154
+#define ETDM_IN5_CON0                   0x13f0
+#define ETDM_IN5_CON1                   0x13f4
+#define ETDM_IN5_CON2                   0x13f8
+#define ETDM_IN5_CON3                   0x13fc
+#define ETDM_IN5_CON4                   0x1400
+#define ETDM_OUT5_CON0                  0x1570
+#define ETDM_OUT5_CON4                  0x1580
+#define ETDM_OUT5_CON5                  0x1584
+#define ETDM_4_7_COWORK_CON0            0x15e0
+#define ETDM_4_7_COWORK_CON1            0x15e4
+#define AFE_CONN018_1                   0x1b44
+#define AFE_CONN018_4                   0x1b50
+#define AFE_CONN019_1                   0x1b64
+#define AFE_CONN019_4                   0x1b70
+#define AFE_CONN124_1                   0x2884
+#define AFE_CONN124_4                   0x2890
+#define AFE_CONN125_1                   0x28a4
+#define AFE_CONN125_4                   0x28b0
+#define AFE_CONN_RS_0                   0x3920
+#define AFE_CONN_RS_3                   0x392c
+#define AFE_CONN_16BIT_0                0x3960
+#define AFE_CONN_16BIT_3                0x396c
+#define AFE_CONN_24BIT_0                0x3980
+#define AFE_CONN_24BIT_3                0x398c
+#define AFE_MEMIF_CON0                  0x3d98
+#define AFE_MEMIF_RD_MON                0x3da0
+#define AFE_MEMIF_WR_MON                0x3da4
+#define AFE_DL0_BASE_MSB                0x3e40
+#define AFE_DL0_BASE                    0x3e44
+#define AFE_DL0_CUR_MSB                 0x3e48
+#define AFE_DL0_CUR                     0x3e4c
+#define AFE_DL0_END_MSB                 0x3e50
+#define AFE_DL0_END                     0x3e54
+#define AFE_DL0_RCH_MON                 0x3e58
+#define AFE_DL0_LCH_MON                 0x3e5c
+#define AFE_DL0_CON0                    0x3e60
+#define AFE_VUL0_BASE_MSB               0x4220
+#define AFE_VUL0_BASE                   0x4224
+#define AFE_VUL0_CUR_MSB                0x4228
+#define AFE_VUL0_CUR                    0x422c
+#define AFE_VUL0_END_MSB                0x4230
+#define AFE_VUL0_END                    0x4234
+#define AFE_VUL0_CON0                   0x4238
+
+#define AFE_MAX_REGISTER AFE_VUL0_CON0
+#define AFE_IRQ_STATUS_BITS             0x7
+#define AFE_IRQ_CNT_SHIFT               0
+#define AFE_IRQ_CNT_MASK	        0xffffff
+
+/* AUDIO_TOP_CON2 */
+#define CLK_OUT5_PDN                    BIT(14)
+#define CLK_OUT5_PDN_MASK               BIT(14)
+#define CLK_IN5_PDN                     BIT(7)
+#define CLK_IN5_PDN_MASK                BIT(7)
+
+/* AUDIO_TOP_CON4 */
+#define PDN_APLL_TUNER2                 BIT(12)
+#define PDN_APLL_TUNER2_MASK            BIT(12)
+
+/* AUDIO_ENGEN_CON0 */
+#define AUD_APLL2_EN                    BIT(3)
+#define AUD_APLL2_EN_MASK               BIT(3)
+#define AUD_26M_EN                      BIT(0)
+#define AUD_26M_EN_MASK                 BIT(0)
+
+/* AFE_DL0_CON0 */
+#define DL0_ON_SFT                      28
+#define DL0_ON_MASK                     0x1
+#define DL0_ON_MASK_SFT                 BIT(28)
+#define DL0_MINLEN_SFT                  20
+#define DL0_MINLEN_MASK                 0xf
+#define DL0_MINLEN_MASK_SFT             (0xf << 20)
+#define DL0_MODE_SFT                    8
+#define DL0_MODE_MASK                   0x1f
+#define DL0_MODE_MASK_SFT               (0x1f << 8)
+#define DL0_PBUF_SIZE_SFT               5
+#define DL0_PBUF_SIZE_MASK              0x3
+#define DL0_PBUF_SIZE_MASK_SFT          (0x3 << 5)
+#define DL0_MONO_SFT                    4
+#define DL0_MONO_MASK                   0x1
+#define DL0_MONO_MASK_SFT               BIT(4)
+#define DL0_HALIGN_SFT                  2
+#define DL0_HALIGN_MASK                 0x1
+#define DL0_HALIGN_MASK_SFT             BIT(2)
+#define DL0_HD_MODE_SFT                 0
+#define DL0_HD_MODE_MASK                0x3
+#define DL0_HD_MODE_MASK_SFT            (0x3 << 0)
+
+/* AFE_VUL0_CON0 */
+#define VUL0_ON_SFT                     28
+#define VUL0_ON_MASK                    0x1
+#define VUL0_ON_MASK_SFT                BIT(28)
+#define VUL0_MODE_SFT                   8
+#define VUL0_MODE_MASK                  0x1f
+#define VUL0_MODE_MASK_SFT              (0x1f << 8)
+#define VUL0_MONO_SFT                   4
+#define VUL0_MONO_MASK                  0x1
+#define VUL0_MONO_MASK_SFT              BIT(4)
+#define VUL0_HALIGN_SFT                 2
+#define VUL0_HALIGN_MASK                0x1
+#define VUL0_HALIGN_MASK_SFT            BIT(2)
+#define VUL0_HD_MODE_SFT                0
+#define VUL0_HD_MODE_MASK               0x3
+#define VUL0_HD_MODE_MASK_SFT           (0x3 << 0)
+
+/* AFE_IRQ_MCU_CON */
+#define IRQ_MCU_MODE_SFT                4
+#define IRQ_MCU_MODE_MASK               0x1f
+#define IRQ_MCU_MODE_MASK_SFT           (0x1f << 4)
+#define IRQ_MCU_ON_SFT                  0
+#define IRQ_MCU_ON_MASK                 0x1
+#define IRQ_MCU_ON_MASK_SFT             BIT(0)
+#define IRQ0_MCU_CLR_SFT                0
+#define IRQ0_MCU_CLR_MASK               0x1
+#define IRQ0_MCU_CLR_MASK_SFT           BIT(0)
+#define IRQ1_MCU_CLR_SFT                1
+#define IRQ1_MCU_CLR_MASK               0x1
+#define IRQ1_MCU_CLR_MASK_SFT           BIT(1)
+#define IRQ2_MCU_CLR_SFT                2
+#define IRQ2_MCU_CLR_MASK               0x1
+#define IRQ2_MCU_CLR_MASK_SFT           BIT(2)
+
+/* ETDM_IN5_CON2 */
+#define IN_CLK_SRC(x)                   ((x) << 10)
+#define IN_CLK_SRC_SFT                  10
+#define IN_CLK_SRC_MASK                 GENMASK(12, 10)
+
+/* ETDM_IN5_CON3 */
+#define IN_SEL_FS(x)                    ((x) << 26)
+#define IN_SEL_FS_SFT                   26
+#define IN_SEL_FS_MASK                  GENMASK(30, 26)
+
+/* ETDM_IN5_CON4 */
+#define IN_RELATCH(x)                   ((x) << 20)
+#define IN_RELATCH_SFT                  20
+#define IN_RELATCH_MASK                 GENMASK(24, 20)
+#define IN_CLK_INV                      BIT(18)
+#define IN_CLK_INV_MASK                 BIT(18)
+
+/* ETDM_IN5_CON0 & ETDM_OUT5_CON0 */
+#define RELATCH_SRC(x)                  ((x) << 28)
+#define RELATCH_SRC_SFT                 28
+#define RELATCH_SRC_MASK                GENMASK(30, 28)
+#define ETDM_CH_NUM(x)                  (((x) - 1) << 23)
+#define ETDM_CH_NUM_SFT                 23
+#define ETDM_CH_NUM_MASK                GENMASK(27, 23)
+#define ETDM_WRD_LEN(x)                 (((x) - 1) << 16)
+#define ETDM_WRD_LEN_SFT                16
+#define ETDM_WRD_LEN_MASK               GENMASK(20, 16)
+#define ETDM_BIT_LEN(x)                 (((x) - 1) << 11)
+#define ETDM_BIT_LEN_SFT                11
+#define ETDM_BIT_LEN_MASK               GENMASK(15, 11)
+#define ETDM_FMT(x)                     ((x) << 6)
+#define ETDM_FMT_SFT                    6
+#define ETDM_FMT_MASK                   GENMASK(8, 6)
+#define ETDM_SYNC                       BIT(1)
+#define ETDM_SYNC_MASK                  BIT(1)
+#define ETDM_EN                         BIT(0)
+#define ETDM_EN_MASK                    BIT(0)
+
+/* ETDM_OUT5_CON4 */
+#define OUT_RELATCH(x)                  ((x) << 24)
+#define OUT_RELATCH_SFT                 24
+#define OUT_RELATCH_MASK                GENMASK(28, 24)
+#define OUT_CLK_SRC(x)                  ((x) << 6)
+#define OUT_CLK_SRC_SFT                 6
+#define OUT_CLK_SRC_MASK                GENMASK(8, 6)
+#define OUT_SEL_FS(x)                   (x)
+#define OUT_SEL_FS_SFT                  0
+#define OUT_SEL_FS_MASK                 GENMASK(4, 0)
+
+/* ETDM_OUT5_CON5 */
+#define ETDM_CLK_DIV                    BIT(12)
+#define ETDM_CLK_DIV_MASK               BIT(12)
+#define OUT_CLK_INV                     BIT(9)
+#define OUT_CLK_INV_MASK                BIT(9)
+
+/* ETDM_4_7_COWORK_CON0 */
+#define OUT_SEL(x)                      ((x) << 12)
+#define OUT_SEL_SFT                     12
+#define OUT_SEL_MASK                    GENMASK(15, 12)
+#endif
-- 
2.18.0

