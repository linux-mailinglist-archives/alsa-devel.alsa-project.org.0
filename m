Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E74FC4D10EB
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 08:26:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78A2316FB;
	Tue,  8 Mar 2022 08:25:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78A2316FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646724366;
	bh=WxQnVfK/BwlQtnjQgLAt/bJTd+W9sTnGb90AE2apF8o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O7hRf0iSXTZdXdinIDqhOeBgI7mMOFfva7l5jnvbdkBTEzqEH7KjO798UGom698w2
	 vNBT1jXi3RPzLpDs+2KPI6ebZ19dcMLGczy+N6f+xUHD/BgBHcm2Y4OYdFez/jJR7y
	 ENR4DIpGKZjXKyyY+3jtOSMp0ySkpNV83mXofyBQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD463F80508;
	Tue,  8 Mar 2022 08:24:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 855E0F804F3; Tue,  8 Mar 2022 08:24:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCFB9F800D2
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 08:24:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCFB9F800D2
X-UUID: 761774f7553a4f738949973e9d494bd7-20220308
X-UUID: 761774f7553a4f738949973e9d494bd7-20220308
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1803571036; Tue, 08 Mar 2022 15:24:41 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Mar 2022 15:24:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 8 Mar 2022 15:24:41 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
Subject: [PATCH 1/5] ASoC: mediatek: mt8195: add reset controller
Date: Tue, 8 Mar 2022 15:24:31 +0800
Message-ID: <20220308072435.22460-2-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220308072435.22460-1-trevor.wu@mediatek.com>
References: <20220308072435.22460-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, yc.hung@mediatek.com, aaronyu@google.com,
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

Audio hardware is possibly used in the firmware stage, so resetting audio
hardware before regcache records default register values is required.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 550636500949..72b2c6d629b9 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -16,6 +16,7 @@
 #include <linux/of_platform.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include "mt8195-afe-common.h"
 #include "mt8195-afe-clk.h"
 #include "mt8195-reg.h"
@@ -3056,6 +3057,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct mtk_base_afe *afe;
 	struct mt8195_afe_private *afe_priv;
 	struct device *dev = &pdev->dev;
+	struct reset_control *rstc;
 	int i, irq_id, ret;
 	struct snd_soc_component *component;
 
@@ -3092,6 +3094,20 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	/* reset controller to reset audio regs before regmap cache */
+	rstc = devm_reset_control_get_exclusive(dev, "audiosys");
+	if (IS_ERR(rstc)) {
+		ret = PTR_ERR(rstc);
+		dev_err(dev, "could not get audiosys reset:%d\n", ret);
+		return ret;
+	}
+
+	ret = reset_control_reset(rstc);
+	if (ret) {
+		dev_err(dev, "failed to trigger audio reset:%d\n", ret);
+		return ret;
+	}
+
 	spin_lock_init(&afe_priv->afe_ctrl_lock);
 
 	mutex_init(&afe->irq_alloc_lock);
-- 
2.18.0

