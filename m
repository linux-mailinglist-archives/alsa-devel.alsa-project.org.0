Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5571719162
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 05:35:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B301D836;
	Thu,  1 Jun 2023 05:34:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B301D836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685590532;
	bh=s4HuMJ7tbj/SK1YZXo4TU9P/Lcwds0lSt/hZ/5Kb+0k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rhKAOYf/KC+hRmHSwOlQofSLSrRuT5+a0ndJhpIE1rmaXM+XGgsSxiDfAl+mEm/GE
	 Qd4gzQDcY+m+PMdNNLi684hu0yqpbu/AR4UAb32MsfcoqxQ4f6chNmzp4aWEn2g3+r
	 ilqfcFWGZX9dAh+n0I9Qg9C1vN8zgz1cAR/XvDME=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39870F80552; Thu,  1 Jun 2023 05:33:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42D75F80549;
	Thu,  1 Jun 2023 05:33:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 601C6F8016B; Thu,  1 Jun 2023 05:33:45 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 1820DF800ED
	for <alsa-devel@alsa-project.org>; Thu,  1 Jun 2023 05:33:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1820DF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=Gy4e2H7t
X-UUID: 0e36a328002d11ee9cb5633481061a41-20230601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=kq3fxPmyPxw0nJTherBUsZEQDy7iP5h2RMscsulCSdY=;
	b=Gy4e2H7tNR035Gvr5hR3swXO26b8NYZAgGbkZZPdBELzLH7Yn9QtRpfAgu93FcGdJ26MSDCsl62US82R6pk+E+fISAREjnBD883lT0+NXYnJnwxNNmjU2sYPbEC9igC769I9uUR2L5Xpl2kIeWwnzZS2XjWbfL0N580e3bmIe6A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:b27aeaaa-16f5-4e24-869e-64be48e53982,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:d5b0ae3,CLOUDID:95b7a86d-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 0e36a328002d11ee9cb5633481061a41-20230601
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2125065169; Thu, 01 Jun 2023 11:33:20 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 1 Jun 2023 11:33:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 1 Jun 2023 11:33:19 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <dianders@chromium.org>,
	<alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/2] ASoC: mediatek: mt8195: fix use-after-free in driver
 remove path
Date: Thu, 1 Jun 2023 11:33:18 +0800
Message-ID: <20230601033318.10408-3-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230601033318.10408-1-trevor.wu@mediatek.com>
References: <20230601033318.10408-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Message-ID-Hash: DMMNHPGJZ25SE4G2HZ7B64JUVBJDSUF3
X-Message-ID-Hash: DMMNHPGJZ25SE4G2HZ7B64JUVBJDSUF3
X-MailFrom: trevor.wu@mediatek.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DMMNHPGJZ25SE4G2HZ7B64JUVBJDSUF3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

During mt8195_afe_init_clock(), mt8195_audsys_clk_register() was called
followed by several other devm functions. At mt8195_afe_deinit_clock()
located at mt8195_afe_pcm_dev_remove(), mt8195_audsys_clk_unregister()
was called.

However, there was an issue with the order in which these functions were
called. Specifically, the remove callback of platform_driver was called
before devres released the resource, resulting in a use-after-free issue
during remove time.

At probe time, the order of calls was:
1. mt8195_audsys_clk_register
2. afe_priv->clk = devm_kcalloc
3. afe_priv->clk[i] = devm_clk_get

At remove time, the order of calls was:
1. mt8195_audsys_clk_unregister
3. free afe_priv->clk[i]
2. free afe_priv->clk

To resolve the problem, we can utilize devm_add_action_or_reset() in
mt8195_audsys_clk_register() so that the remove order can be changed to
3->2->1.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c    |  5 --
 sound/soc/mediatek/mt8195/mt8195-afe-clk.h    |  1 -
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c    |  4 --
 sound/soc/mediatek/mt8195/mt8195-audsys-clk.c | 47 ++++++++++---------
 sound/soc/mediatek/mt8195/mt8195-audsys-clk.h |  1 -
 5 files changed, 24 insertions(+), 34 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 9ca2cb8c8a9c..f35318ae0739 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -410,11 +410,6 @@ int mt8195_afe_init_clock(struct mtk_base_afe *afe)
 	return 0;
 }
 
-void mt8195_afe_deinit_clock(struct mtk_base_afe *afe)
-{
-	mt8195_audsys_clk_unregister(afe);
-}
-
 int mt8195_afe_enable_clk(struct mtk_base_afe *afe, struct clk *clk)
 {
 	int ret;
diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.h b/sound/soc/mediatek/mt8195/mt8195-afe-clk.h
index 40663e31becd..a08c0ee6c860 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.h
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.h
@@ -101,7 +101,6 @@ int mt8195_afe_get_mclk_source_clk_id(int sel);
 int mt8195_afe_get_mclk_source_rate(struct mtk_base_afe *afe, int apll);
 int mt8195_afe_get_default_mclk_source_by_rate(int rate);
 int mt8195_afe_init_clock(struct mtk_base_afe *afe);
-void mt8195_afe_deinit_clock(struct mtk_base_afe *afe);
 int mt8195_afe_enable_clk(struct mtk_base_afe *afe, struct clk *clk);
 void mt8195_afe_disable_clk(struct mtk_base_afe *afe, struct clk *clk);
 int mt8195_afe_prepare_clk(struct mtk_base_afe *afe, struct clk *clk);
diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index d22cf1664d8a..a0f2012211fb 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3224,15 +3224,11 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 
 static void mt8195_afe_pcm_dev_remove(struct platform_device *pdev)
 {
-	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
-
 	snd_soc_unregister_component(&pdev->dev);
 
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		mt8195_afe_runtime_suspend(&pdev->dev);
-
-	mt8195_afe_deinit_clock(afe);
 }
 
 static const struct of_device_id mt8195_afe_pcm_dt_match[] = {
diff --git a/sound/soc/mediatek/mt8195/mt8195-audsys-clk.c b/sound/soc/mediatek/mt8195/mt8195-audsys-clk.c
index e0670e0dbd5b..38594bc3f2f7 100644
--- a/sound/soc/mediatek/mt8195/mt8195-audsys-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-audsys-clk.c
@@ -148,6 +148,29 @@ static const struct afe_gate aud_clks[CLK_AUD_NR_CLK] = {
 	GATE_AUD6(CLK_AUD_GASRC19, "aud_gasrc19", "top_asm_h", 19),
 };
 
+static void mt8195_audsys_clk_unregister(void *data)
+{
+	struct mtk_base_afe *afe = data;
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
 int mt8195_audsys_clk_register(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
@@ -188,27 +211,5 @@ int mt8195_audsys_clk_register(struct mtk_base_afe *afe)
 		afe_priv->lookup[i] = cl;
 	}
 
-	return 0;
-}
-
-void mt8195_audsys_clk_unregister(struct mtk_base_afe *afe)
-{
-	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-	struct clk *clk;
-	struct clk_lookup *cl;
-	int i;
-
-	if (!afe_priv)
-		return;
-
-	for (i = 0; i < CLK_AUD_NR_CLK; i++) {
-		cl = afe_priv->lookup[i];
-		if (!cl)
-			continue;
-
-		clk = cl->clk;
-		clk_unregister_gate(clk);
-
-		clkdev_drop(cl);
-	}
+	return devm_add_action_or_reset(afe->dev, mt8195_audsys_clk_unregister, afe);
 }
diff --git a/sound/soc/mediatek/mt8195/mt8195-audsys-clk.h b/sound/soc/mediatek/mt8195/mt8195-audsys-clk.h
index 239d31016ba7..69db2dd1c9e0 100644
--- a/sound/soc/mediatek/mt8195/mt8195-audsys-clk.h
+++ b/sound/soc/mediatek/mt8195/mt8195-audsys-clk.h
@@ -10,6 +10,5 @@
 #define _MT8195_AUDSYS_CLK_H_
 
 int mt8195_audsys_clk_register(struct mtk_base_afe *afe);
-void mt8195_audsys_clk_unregister(struct mtk_base_afe *afe);
 
 #endif
-- 
2.18.0

