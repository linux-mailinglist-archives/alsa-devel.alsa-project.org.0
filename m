Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3496719160
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 05:34:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C42B81F4;
	Thu,  1 Jun 2023 05:33:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C42B81F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685590481;
	bh=AnMG0RQkUfvEvTLVuFhrrkl19kR2E9EUlUdIe434LM0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VCXvKoU8DIPjM2A87zHyC8y3JWK6zB0ZuKLKMCef0dZetmOL4kvcK7eFqU4cJS3vV
	 29/EbYDHYLNe6daSMGGKB9b8oKix+xvO94UZZoTrew+VQllAVEIuiHrF/grF25Tb51
	 svDEb8KZyyGJEvV507XdrgPv2QsVVe6tQkiRhMi4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1053AF804DA; Thu,  1 Jun 2023 05:33:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E37AF80132;
	Thu,  1 Jun 2023 05:33:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F22AF80199; Thu,  1 Jun 2023 05:33:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6D8A0F800C1
	for <alsa-devel@alsa-project.org>; Thu,  1 Jun 2023 05:33:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D8A0F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=E3maQCXQ
X-UUID: 0de5c174002d11eeb20a276fd37b9834-20230601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=PvxE9bBd/if4KF5aIDjYjFf4UguqjqlL4OmiATrQGYg=;
	b=E3maQCXQ3pcdmrxljXr6QL7wRUyZxt/MlcKmlDFVal3tan00PJ+34/jOob211J8DB9EUx852Lpz4qMxXwcmscAyDAggsK+qYNVTltHnHeLbPnaHC6Qcg0Rm+zSjr0uj32Z/lg+K35w1MmwxII1Uv/6IIM0xAAhtUcyrK+LCdYU4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:215a5e4a-2c8a-4262-be3d-000812c5b9d6,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:d5b0ae3,CLOUDID:32d5033d-de1e-4348-bc35-c96f92f1dcbb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 0de5c174002d11eeb20a276fd37b9834-20230601
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 163313893; Thu, 01 Jun 2023 11:33:20 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
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
Subject: [PATCH v2 1/2] ASoC: mediatek: mt8188: fix use-after-free in driver
 remove path
Date: Thu, 1 Jun 2023 11:33:17 +0800
Message-ID: <20230601033318.10408-2-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230601033318.10408-1-trevor.wu@mediatek.com>
References: <20230601033318.10408-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Message-ID-Hash: U5UAAHNEANLIRCNJTFWLGKUXVTJ6JBRB
X-Message-ID-Hash: U5UAAHNEANLIRCNJTFWLGKUXVTJ6JBRB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U5UAAHNEANLIRCNJTFWLGKUXVTJ6JBRB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

During mt8188_afe_init_clock(), mt8188_audsys_clk_register() was called
followed by several other devm functions. The caller of
mt8188_afe_init_clock() utilized devm_add_action_or_reset() to call
mt8188_afe_deinit_clock(). However, the order was incorrect, causing a
use-after-free issue during remove time.

At probe time, the order of calls was:
1. mt8188_audsys_clk_register
2. afe_priv->clk = devm_kcalloc
3. afe_priv->clk[i] = devm_clk_get

At remove time, the order of calls was:
1. mt8188_audsys_clk_unregister
3. free afe_priv->clk[i]
2. free afe_priv->clk

To resolve the problem, it's necessary to move devm_add_action_or_reset()
to the appropriate position so that the remove order can be 3->2->1.

Fixes: f6b026479b13 ("ASoC: mediatek: mt8188: support audio clock control")
Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c    |  7 ---
 sound/soc/mediatek/mt8188/mt8188-afe-clk.h    |  1 -
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c    |  4 --
 sound/soc/mediatek/mt8188/mt8188-audsys-clk.c | 47 ++++++++++---------
 sound/soc/mediatek/mt8188/mt8188-audsys-clk.h |  1 -
 5 files changed, 24 insertions(+), 36 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
index 4c24d0b9e90d..e69c1bb2cb23 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
@@ -436,13 +436,6 @@ int mt8188_afe_init_clock(struct mtk_base_afe *afe)
 	return 0;
 }
 
-void mt8188_afe_deinit_clock(void *priv)
-{
-	struct mtk_base_afe *afe = priv;
-
-	mt8188_audsys_clk_unregister(afe);
-}
-
 int mt8188_afe_enable_clk(struct mtk_base_afe *afe, struct clk *clk)
 {
 	int ret;
diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.h b/sound/soc/mediatek/mt8188/mt8188-afe-clk.h
index 904505d10841..ec53c171c170 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-clk.h
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.h
@@ -111,7 +111,6 @@ int mt8188_afe_get_default_mclk_source_by_rate(int rate);
 int mt8188_get_apll_by_rate(struct mtk_base_afe *afe, int rate);
 int mt8188_get_apll_by_name(struct mtk_base_afe *afe, const char *name);
 int mt8188_afe_init_clock(struct mtk_base_afe *afe);
-void mt8188_afe_deinit_clock(void *priv);
 int mt8188_afe_enable_clk(struct mtk_base_afe *afe, struct clk *clk);
 void mt8188_afe_disable_clk(struct mtk_base_afe *afe, struct clk *clk);
 int mt8188_afe_set_clk_rate(struct mtk_base_afe *afe, struct clk *clk,
diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index c3fd32764da0..6a24b339444b 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -3256,10 +3256,6 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "init clock error");
 
-	ret = devm_add_action_or_reset(dev, mt8188_afe_deinit_clock, (void *)afe);
-	if (ret)
-		return ret;
-
 	spin_lock_init(&afe_priv->afe_ctrl_lock);
 
 	mutex_init(&afe->irq_alloc_lock);
diff --git a/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c b/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
index be1c53bf4729..c796ad8b62ee 100644
--- a/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
+++ b/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
@@ -138,6 +138,29 @@ static const struct afe_gate aud_clks[CLK_AUD_NR_CLK] = {
 	GATE_AUD6(CLK_AUD_GASRC11, "aud_gasrc11", "top_asm_h", 11),
 };
 
+static void mt8188_audsys_clk_unregister(void *data)
+{
+	struct mtk_base_afe *afe = data;
+	struct mt8188_afe_private *afe_priv = afe->platform_priv;
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
 int mt8188_audsys_clk_register(struct mtk_base_afe *afe)
 {
 	struct mt8188_afe_private *afe_priv = afe->platform_priv;
@@ -179,27 +202,5 @@ int mt8188_audsys_clk_register(struct mtk_base_afe *afe)
 		afe_priv->lookup[i] = cl;
 	}
 
-	return 0;
-}
-
-void mt8188_audsys_clk_unregister(struct mtk_base_afe *afe)
-{
-	struct mt8188_afe_private *afe_priv = afe->platform_priv;
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
+	return devm_add_action_or_reset(afe->dev, mt8188_audsys_clk_unregister, afe);
 }
diff --git a/sound/soc/mediatek/mt8188/mt8188-audsys-clk.h b/sound/soc/mediatek/mt8188/mt8188-audsys-clk.h
index 6c5f463ad7e4..45b0948c4a06 100644
--- a/sound/soc/mediatek/mt8188/mt8188-audsys-clk.h
+++ b/sound/soc/mediatek/mt8188/mt8188-audsys-clk.h
@@ -10,6 +10,5 @@
 #define _MT8188_AUDSYS_CLK_H_
 
 int mt8188_audsys_clk_register(struct mtk_base_afe *afe);
-void mt8188_audsys_clk_unregister(struct mtk_base_afe *afe);
 
 #endif
-- 
2.18.0

