Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0980E6E0BBC
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Apr 2023 12:48:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9703BE8F;
	Thu, 13 Apr 2023 12:47:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9703BE8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681382915;
	bh=36voQF2/FokRllgA0RUGG8ObTjMzoVuUTlOOVM/OeJU=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=XbzRU+Lr3AC39ZMw1LDjsNVsJeIxGvU3fwZtt5NclzUmm+rS/IKuuLfWs4Ix+DO6n
	 618denzXEjc/KHYqRYEbSfC7kdDqE+GGFsYl8/iN+nA4Zfin6mPt7u1f565HzjvDMq
	 fx6fvy5btElahk+enmqaHnBzqyKN6x7rapdWWBTA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6A67F80524;
	Thu, 13 Apr 2023 12:47:44 +0200 (CEST)
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 6/7] ASoC: mediatek: mt8188: add bus protection
Date: Thu, 13 Apr 2023 18:47:12 +0800
In-Reply-To: <20230413104713.7174-1-trevor.wu@mediatek.com>
References: <20230413104713.7174-1-trevor.wu@mediatek.com>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DWSXIH3JJHJRSP7FPMWLTIEKIWCBQIQD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168138286386.26.13789056864123961576@mailman-core.alsa-project.org>
From: Trevor Wu via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Trevor Wu <trevor.wu@mediatek.com>
Cc: trevor.wu@mediatek.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66FBAF8052D; Thu, 13 Apr 2023 12:47:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	RDNS_NONE,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 62D85F8025E
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 12:47:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62D85F8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=RBAGSaev
X-UUID: 8fd9ac4cd9e811edb6b9f13eb10bd0fe-20230413
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RVqtcIPzTn3ljgLNBGF6OLNjNa9bEk34VJBl1FNNCT0=;
	b=RBAGSaev6NMGOfJhkVVS/MbLJItGOJZTt/8hs3j6EZ9PQkDMhA4lT0zjvq7IO2Wk5Mo5IUGsOjEzcmjAcNfonybZiflb3VZM0Jee3KZheBghC0sKC9ptY2xFSWsk8VA5Zc2aDW9071MKBuySMVMq8mY+zPw2FJJdCkyLK/bHy0A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:260959bb-487a-458d-b9ae-984fe3b4bfd7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.22,REQID:260959bb-487a-458d-b9ae-984fe3b4bfd7,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:120426c,CLOUDID:62bff283-cd9c-45f5-8134-710979e3df0e,B
	ulkID:230413184721ES63JHQS,BulkQuantity:0,Recheck:0,SF:28|17|19|48|38|29,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 8fd9ac4cd9e811edb6b9f13eb10bd0fe-20230413
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1128028323; Thu, 13 Apr 2023 18:47:18 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 13 Apr 2023 18:47:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 13 Apr 2023 18:47:18 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 6/7] ASoC: mediatek: mt8188: add bus protection
Date: Thu, 13 Apr 2023 18:47:12 +0800
Message-ID: <20230413104713.7174-7-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230413104713.7174-1-trevor.wu@mediatek.com>
References: <20230413104713.7174-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Message-ID-Hash: DWSXIH3JJHJRSP7FPMWLTIEKIWCBQIQD
X-Message-ID-Hash: DWSXIH3JJHJRSP7FPMWLTIEKIWCBQIQD
X-MailFrom: trevor.wu@mediatek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: trevor.wu@mediatek.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DWSXIH3JJHJRSP7FPMWLTIEKIWCBQIQD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add bus protection for reset controller.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index fecc891f892d..c3fd32764da0 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -17,6 +17,7 @@
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
+#include <linux/soc/mediatek/infracfg.h>
 #include <linux/reset.h>
 #include <sound/pcm_params.h>
 #include "mt8188-afe-common.h"
@@ -3133,12 +3134,68 @@ static int mt8188_afe_parse_of(struct mtk_base_afe *afe,
 	return 0;
 }
 
+#define MT8188_DELAY_US 10
+#define MT8188_TIMEOUT_US USEC_PER_SEC
+
+static int bus_protect_enable(struct regmap *regmap)
+{
+	int ret;
+	u32 val;
+	u32 mask;
+
+	val = 0;
+	mask = MT8188_TOP_AXI_PROT_EN_2_AUDIO_STEP1;
+	regmap_write(regmap, MT8188_TOP_AXI_PROT_EN_2_SET, mask);
+
+	ret = regmap_read_poll_timeout(regmap, MT8188_TOP_AXI_PROT_EN_2_STA,
+				       val, (val & mask) == mask,
+				       MT8188_DELAY_US, MT8188_TIMEOUT_US);
+	if (ret)
+		return ret;
+
+	val = 0;
+	mask = MT8188_TOP_AXI_PROT_EN_2_AUDIO_STEP2;
+	regmap_write(regmap, MT8188_TOP_AXI_PROT_EN_2_SET, mask);
+
+	ret = regmap_read_poll_timeout(regmap, MT8188_TOP_AXI_PROT_EN_2_STA,
+				       val, (val & mask) == mask,
+				       MT8188_DELAY_US, MT8188_TIMEOUT_US);
+	return ret;
+}
+
+static int bus_protect_disable(struct regmap *regmap)
+{
+	int ret;
+	u32 val;
+	u32 mask;
+
+	val = 0;
+	mask = MT8188_TOP_AXI_PROT_EN_2_AUDIO_STEP2;
+	regmap_write(regmap, MT8188_TOP_AXI_PROT_EN_2_CLR, mask);
+
+	ret = regmap_read_poll_timeout(regmap, MT8188_TOP_AXI_PROT_EN_2_STA,
+				       val, !(val & mask),
+				       MT8188_DELAY_US, MT8188_TIMEOUT_US);
+	if (ret)
+		return ret;
+
+	val = 0;
+	mask = MT8188_TOP_AXI_PROT_EN_2_AUDIO_STEP1;
+	regmap_write(regmap, MT8188_TOP_AXI_PROT_EN_2_CLR, mask);
+
+	ret = regmap_read_poll_timeout(regmap, MT8188_TOP_AXI_PROT_EN_2_STA,
+				       val, !(val & mask),
+				       MT8188_DELAY_US, MT8188_TIMEOUT_US);
+	return ret;
+}
+
 static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe;
 	struct mt8188_afe_private *afe_priv;
 	struct device *dev;
 	struct reset_control *rstc;
+	struct regmap *infra_ao;
 	int i, irq_id, ret;
 
 	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(33));
@@ -3163,18 +3220,37 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(afe->base_addr),
 				     "AFE base_addr not found\n");
 
+	infra_ao = syscon_regmap_lookup_by_phandle(dev->of_node,
+						   "mediatek,infracfg");
+	if (IS_ERR(infra_ao))
+		return dev_err_probe(dev, PTR_ERR(infra_ao),
+				     "%s() Cannot find infra_ao controller\n",
+				     __func__);
+
 	/* reset controller to reset audio regs before regmap cache */
 	rstc = devm_reset_control_get_exclusive(dev, "audiosys");
 	if (IS_ERR(rstc))
 		return dev_err_probe(dev, PTR_ERR(rstc),
 				     "could not get audiosys reset\n");
 
+	ret = bus_protect_enable(infra_ao);
+	if (ret) {
+		dev_err(dev, "bus_protect_enable failed\n");
+		return ret;
+	}
+
 	ret = reset_control_reset(rstc);
 	if (ret) {
 		dev_err(dev, "failed to trigger audio reset:%d\n", ret);
 		return ret;
 	}
 
+	ret = bus_protect_disable(infra_ao);
+	if (ret) {
+		dev_err(dev, "bus_protect_disable failed\n");
+		return ret;
+	}
+
 	/* initial audio related clock */
 	ret = mt8188_afe_init_clock(afe);
 	if (ret)
-- 
2.18.0

