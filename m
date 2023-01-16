Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 456AD66B654
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jan 2023 04:43:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F4EE4DE8;
	Mon, 16 Jan 2023 04:42:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F4EE4DE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673840622;
	bh=1kdc2JR9jgQ7NQXlqiHv5VTGEhrSv6bj3qlq0o5roIA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=elPuQbr5MQ18IRHNcHMv385BuerVP6wTpSX1C7nMqwFHTHZZUhUj60WZMSlZNyISq
	 8niI5Zj3bsrjTkH841oCin2FgJMUK7frRR0cQZhPr2DKoH5LTYnzrX/zwbr9Ch8QOO
	 D9AgMTGvne5oTT9Ey/TtL6cTWHnRNoc/wHsCTAV0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 060EEF8055B;
	Mon, 16 Jan 2023 04:42:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51030F80543; Mon, 16 Jan 2023 04:42:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 RDNS_NONE,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
 shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 675C6F8023B
 for <alsa-devel@alsa-project.org>; Mon, 16 Jan 2023 04:41:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 675C6F8023B
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=RuGMsMym
X-UUID: aee95228954f11eda06fc9ecc4dadd91-20230116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=QsXVaBlLyZgLe3Omky45vD7Ia8dAb9dNk+EXoNiFXQE=; 
 b=RuGMsMymFkAVicw6LOsqDlpLkRl2osnjAjZE7QvLcOEenn2NoBYw+A15t5LmeWa6/ZPrhWISStgu1oeI0E5XfE7G/Kp02FBePvJhB8JoMAXS/kqs/wnsHphNxbC1IjLeKjXqiPp9b76cQy7x9xjAqpOrj+6byDkTbIUBvVbXW+k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17, REQID:68f84e90-063d-4c0a-8451-dfd6d3202cd7, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:543e81c, CLOUDID:def1bb54-dd49-462e-a4be-2143a3ddc739,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: aee95228954f11eda06fc9ecc4dadd91-20230116
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 423806250; Mon, 16 Jan 2023 11:41:38 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 16 Jan 2023 11:41:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 16 Jan 2023 11:41:37 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
 <perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>
Subject: [RESEND,
 v5 11/13] ASoC: mediatek: common: add soundcard driver common code
Date: Mon, 16 Jan 2023 11:41:29 +0800
Message-ID: <20230116034131.23943-12-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230116034131.23943-1-trevor.wu@mediatek.com>
References: <20230116034131.23943-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add common code to support of_node of codec parsing, so codec phandle
can be assigned by sound-dai in dts.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/common/Makefile            |  2 +-
 .../mediatek/common/mtk-soundcard-driver.c    | 79 +++++++++++++++++++
 .../mediatek/common/mtk-soundcard-driver.h    | 14 ++++
 3 files changed, 94 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/mediatek/common/mtk-soundcard-driver.c
 create mode 100644 sound/soc/mediatek/common/mtk-soundcard-driver.h

diff --git a/sound/soc/mediatek/common/Makefile b/sound/soc/mediatek/common/Makefile
index 576deb7f8cce..42e636c10c1e 100644
--- a/sound/soc/mediatek/common/Makefile
+++ b/sound/soc/mediatek/common/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 # platform driver
-snd-soc-mtk-common-objs := mtk-afe-platform-driver.o mtk-afe-fe-dai.o mtk-dsp-sof-common.o
+snd-soc-mtk-common-objs := mtk-afe-platform-driver.o mtk-afe-fe-dai.o mtk-dsp-sof-common.o mtk-soundcard-driver.o
 obj-$(CONFIG_SND_SOC_MEDIATEK) += snd-soc-mtk-common.o
 
 obj-$(CONFIG_SND_SOC_MTK_BTCVSD) += mtk-btcvsd.o
diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.c b/sound/soc/mediatek/common/mtk-soundcard-driver.c
new file mode 100644
index 000000000000..7c55c2cb1f21
--- /dev/null
+++ b/sound/soc/mediatek/common/mtk-soundcard-driver.c
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * mtk-soundcard-driver.c  --  MediaTek soundcard driver common
+ *
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Trevor Wu <trevor.wu@mediatek.com>
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <sound/soc.h>
+
+#include "mtk-soundcard-driver.h"
+
+static int set_card_codec_info(struct snd_soc_card *card,
+			       struct device_node *sub_node,
+			       struct snd_soc_dai_link *dai_link)
+{
+	struct device *dev = card->dev;
+	struct device_node *codec_node;
+	int ret;
+
+	codec_node = of_get_child_by_name(sub_node, "codec");
+	if (!codec_node)
+		return -EINVAL;
+
+	/* set card codec info */
+	ret = snd_soc_of_get_dai_link_codecs(dev, codec_node, dai_link);
+
+	of_node_put(codec_node);
+
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "%s: codec dai not found\n",
+				     dai_link->name);
+
+	return 0;
+}
+
+int parse_dai_link_info(struct snd_soc_card *card)
+{
+	struct device *dev = card->dev;
+	struct device_node *sub_node;
+	struct snd_soc_dai_link *dai_link;
+	const char *dai_link_name;
+	int ret, i;
+
+	/* Loop over all the dai link sub nodes */
+	for_each_available_child_of_node(dev->of_node, sub_node) {
+		if (of_property_read_string(sub_node, "link-name",
+					    &dai_link_name))
+			return -EINVAL;
+
+		for_each_card_prelinks(card, i, dai_link) {
+			if (!strcmp(dai_link_name, dai_link->name))
+				break;
+		}
+
+		if (i >= card->num_links)
+			return -EINVAL;
+
+		ret = set_card_codec_info(card, sub_node, dai_link);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(parse_dai_link_info);
+
+void clean_card_reference(struct snd_soc_card *card)
+{
+	struct snd_soc_dai_link *dai_link;
+	int i;
+
+	/* release codec reference gotten by set_card_codec_info */
+	for_each_card_prelinks(card, i, dai_link)
+		snd_soc_of_put_dai_link_codecs(dai_link);
+}
+EXPORT_SYMBOL_GPL(clean_card_reference);
diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.h b/sound/soc/mediatek/common/mtk-soundcard-driver.h
new file mode 100644
index 000000000000..d92cac1d7b72
--- /dev/null
+++ b/sound/soc/mediatek/common/mtk-soundcard-driver.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * mtk-soundcard-driver.h  --  MediaTek soundcard driver common definition
+ *
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Trevor Wu <trevor.wu@mediatek.com>
+ */
+
+#ifndef _MTK_SOUNDCARD_DRIVER_H_
+#define _MTK_SOUNDCARD_DRIVER_H_
+
+int parse_dai_link_info(struct snd_soc_card *card);
+void clean_card_reference(struct snd_soc_card *card);
+#endif
-- 
2.18.0

