Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B776A66E8
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Mar 2023 05:10:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60F8020C;
	Wed,  1 Mar 2023 05:09:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60F8020C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677643799;
	bh=Hp4pbyxhWIZE0XPgB6g0CQXyx3pn0vnnK0V94VXNOuQ=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mzRbE2tlAdKPeBuuakY+pp1wg4Y3dlDQ8O65Cvz/z20Fp7fVVOV10xXUx/I6ganRG
	 Wn8SGF+dPqZ9BSSlO9w/tTbBz62XmVOGLoENErnJ7L/BOO9F6hMBRga+K9fCGG6ptm
	 615dQf1AkAhkHiWytFbeI8UqoVJCar6DVWw4T53o=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6727BF80310;
	Wed,  1 Mar 2023 05:09:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2ADC9F8049C; Wed,  1 Mar 2023 05:09:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	RDNS_NONE,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 14CD9F80236
	for <alsa-devel@alsa-project.org>; Wed,  1 Mar 2023 05:08:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14CD9F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=sVUSENsc
X-UUID: be4ce7b6b7e611eda06fc9ecc4dadd91-20230301
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=xb3SkvGVmzd3yzT6owf7WEvRStA93vi0UuCcvQH8/l4=;
	b=sVUSENsc3VZ0kMe3+EippHA08bvo1h33DIow/TQ8o8VQ3KNRCIYxjtza0xH+0Ysfu4n1cDQa6Y+M79sKKfC0jS+32DySRH0q5Z7arf9BsKWD6vGcYwi5jSHEKu8Nk7qKc6Vd9JQQwkp6wk6+twD257qkUq02yk2WM6W8kWmUgqc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:7be0c588-3004-4e32-aba0-d3ec730eb252,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:25b5999,CLOUDID:ebdfef26-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: be4ce7b6b7e611eda06fc9ecc4dadd91-20230301
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1407312854; Wed, 01 Mar 2023 12:08:38 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Wed, 1 Mar 2023 12:08:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 1 Mar 2023 12:08:36 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>
Subject: [PATCH] ASoC: mediatek: add missing initialization
Date: Wed, 1 Mar 2023 12:08:35 +0800
Message-ID: <20230301040835.6322-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Message-ID-Hash: 2L4OYV2Q4K5ECMFPUNUOMXYZ4GSTRDYU
X-Message-ID-Hash: 2L4OYV2Q4K5ECMFPUNUOMXYZ4GSTRDYU
X-MailFrom: trevor.wu@mediatek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: trevor.wu@mediatek.com, angelogioacchino.delregno@collabora.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2L4OYV2Q4K5ECMFPUNUOMXYZ4GSTRDYU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In etdm dai driver, dai_etdm_parse_of() function is used to parse dts
properties to get parameters. There are two for-loops which are
sepearately for all etdm and etdm input only cases. In etdm in only
loop, dai_id is not initialized, so it keeps the value intiliazed in
another loop.

In the patch, add the missing initialization to fix the unexpected
parsing problem.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8188/mt8188-dai-etdm.c | 3 +++
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c b/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
index 1c53d4cb19bb..7a37752d4244 100644
--- a/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
@@ -2498,6 +2498,9 @@ static void mt8188_dai_etdm_parse_of(struct mtk_base_afe *afe)
 
 	/* etdm in only */
 	for (i = 0; i < 2; i++) {
+		dai_id = ETDM_TO_DAI_ID(i);
+		etdm_data = afe_priv->dai_priv[dai_id];
+
 		snprintf(prop, sizeof(prop), "mediatek,%s-chn-disabled",
 			 of_afe_etdms[i].name);
 
diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index c2e268054773..f2c9a1fdbe0d 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -2567,6 +2567,9 @@ static void mt8195_dai_etdm_parse_of(struct mtk_base_afe *afe)
 
 	/* etdm in only */
 	for (i = 0; i < 2; i++) {
+		dai_id = ETDM_TO_DAI_ID(i);
+		etdm_data = afe_priv->dai_priv[dai_id];
+
 		ret = snprintf(prop, sizeof(prop),
 			       "mediatek,%s-chn-disabled",
 			       of_afe_etdms[i].name);
-- 
2.18.0

