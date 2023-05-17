Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D71470673B
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 13:54:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90AF21FA;
	Wed, 17 May 2023 13:54:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90AF21FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684324498;
	bh=WvTvI4Dm1DjoqEaSGJdLMZI+O+kaZmw+Ac1bt72m2Ck=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YbbHuARM9jSrHEsZuT/QailNE9Cg4iHmIOFPSZCp5hpNy07QTeD6J0PxL3SkPeDuc
	 04hPVMGBwGkjtRRstBxXBwlIB0G18j2wtd087VrQ0PXIGoprQOb+IAOXLkK8eff+1J
	 sDg9NedQzzfNPfBdVtEUfm6dT3DhoKSuSqvoWCoQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66F9AF805A9; Wed, 17 May 2023 13:52:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A9006F805A9;
	Wed, 17 May 2023 13:52:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D610DF80552; Wed, 17 May 2023 13:52:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	RDNS_NONE,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A9A9F802E8
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 13:52:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A9A9F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=iiIwG5y1
X-UUID: 48604eeef4a911edb20a276fd37b9834-20230517
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=EUCXX3qywTmH1/iTn+Vhans2ufli5Vw7rjPGGMD4pM0=;
	b=iiIwG5y1fQM/wo/UR4SD81cMILUd+ZDD6rhc9+pA52HrPUXIErd6zhrs7+mJTRqA1FcRMeQnTMwy8GIZJtK3AFsDdH2PC4eOsgSnT7YCz+zgqm1zlGotjuYV0443fyAaoHC9pQRwaxmZ/l4H2abj5lHf4u1JQEo3zDmMF5cvkAo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:341178e7-a829-4762-9531-ce3da29a6fd5,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:90
X-CID-INFO: VERSION:1.1.25,REQID:341178e7-a829-4762-9531-ce3da29a6fd5,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:90
X-CID-META: VersionHash:d5b0ae3,CLOUDID:e4ca1e6c-2f20-4998-991c-3b78627e4938,B
	ulkID:230517195224OD070BA2,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 48604eeef4a911edb20a276fd37b9834-20230517
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1759731671; Wed, 17 May 2023 19:52:21 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 17 May 2023 19:52:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 17 May 2023 19:52:20 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <bicycle.tsai@mediatek.com>,
	<ting-fang.hou@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [RESEND 3/4] ASoC: mediatek: mt6359: add mtkaif gpio setting
Date: Wed, 17 May 2023 19:52:18 +0800
Message-ID: <20230517115219.532-4-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230517115219.532-1-trevor.wu@mediatek.com>
References: <20230517115219.532-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Message-ID-Hash: RMAK24JCLKRBKE3IV36RPDQQE6VERPN4
X-Message-ID-Hash: RMAK24JCLKRBKE3IV36RPDQQE6VERPN4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RMAK24JCLKRBKE3IV36RPDQQE6VERPN4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add mtkaif gpio driving to increase signal strength and smt setting to
prevent from overshooting.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/codecs/mt6359.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/codecs/mt6359.c b/sound/soc/codecs/mt6359.c
index 65e6d4d08b6a..a37ad61a8253 100644
--- a/sound/soc/codecs/mt6359.c
+++ b/sound/soc/codecs/mt6359.c
@@ -18,6 +18,20 @@
 
 #include "mt6359.h"
 
+static void mt6359_set_gpio_smt(struct mt6359_priv *priv)
+{
+	/* set gpio SMT mode */
+	regmap_update_bits(priv->regmap, MT6359_SMT_CON1, 0x3ff0, 0x3ff0);
+}
+
+static void mt6359_set_gpio_driving(struct mt6359_priv *priv)
+{
+	/* 8:4mA(default), a:8mA, c:12mA, e:16mA */
+	regmap_update_bits(priv->regmap, MT6359_DRV_CON2, 0xffff, 0x8888);
+	regmap_update_bits(priv->regmap, MT6359_DRV_CON3, 0xffff, 0x8888);
+	regmap_update_bits(priv->regmap, MT6359_DRV_CON4, 0x00ff, 0x88);
+}
+
 static void mt6359_set_playback_gpio(struct mt6359_priv *priv)
 {
 	/* set gpio mosi mode, clk / data mosi */
@@ -2745,6 +2759,8 @@ static int mt6359_codec_init_reg(struct snd_soc_component *cmpnt)
 			   0x1 << RG_AUDLOLSCDISABLE_VAUDP32_SFT);
 
 	/* set gpio */
+	mt6359_set_gpio_smt(priv);
+	mt6359_set_gpio_driving(priv);
 	mt6359_reset_playback_gpio(priv);
 	mt6359_reset_capture_gpio(priv);
 
-- 
2.18.0

