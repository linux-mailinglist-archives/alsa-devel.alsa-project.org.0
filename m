Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30283697C4A
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Feb 2023 13:51:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F03D4828;
	Wed, 15 Feb 2023 13:50:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F03D4828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676465509;
	bh=TAqGnfRVo8ZPmzlxc9Tt4Hx4eMnb2TXN+9YHf6Nvy1k=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=iQwcHO8Jog+CDeiUjeDxrI5tui4mE7xVrhvCoUgrGbwvDKCV57XxN/KoB/SYVz4i4
	 djIO8zOseTLbvB6yJD6TzrVgFKI4uydN6gDThcOgOlqksVmI+clqIQCZL7EEqj3dGD
	 SvZKcBmAKpjzOxrt4SoPoZ8hAocdQGWo1wXwbU0U=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FE4CF801C0;
	Wed, 15 Feb 2023 13:50:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E9C5F8047C; Wed, 15 Feb 2023 13:50:55 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E760F800E4
	for <alsa-devel@alsa-project.org>; Wed, 15 Feb 2023 13:50:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E760F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=rfQBwC1F
X-UUID: 4dc46f1cad2f11ed945fc101203acc17-20230215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=q5UcyJ/aXUNEK20OKjGWiM1tft1sqvEVwCIYOxp3oRw=;
	b=rfQBwC1FRAegN4TG9xZtstNkB0l1+3easYFx++ITMA7ob7OrTvQQJsOUw5pT05slWCBnk7G8/78QyO/E6Az5P2YIsGJamFXPV+JtjXr5kP3Ii8Fh4j8Oa15nUJ5TtOQ94LqsgQUbwOi0dclRsei/ptn7A2sPsAw7Hf5OOciAoTQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:0dcb25e6-fd84-4e59-bb90-536619ea0fbc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.19,REQID:0dcb25e6-fd84-4e59-bb90-536619ea0fbc,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:885ddb2,CLOUDID:5e8117f3-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:230215205020Y8T085S0,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 4dc46f1cad2f11ed945fc101203acc17-20230215
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 424138059; Wed, 15 Feb 2023 20:50:19 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 15 Feb 2023 20:50:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 15 Feb 2023 20:50:18 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>
Subject: [PATCH] ASoC: mediatek: mt8188: correct etdm control return value
Date: Wed, 15 Feb 2023 20:50:16 +0800
Message-ID: <20230215125017.16044-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Message-ID-Hash: UVBZSDECVMTN6XMCGJV3CKFRV4HI2EUR
X-Message-ID-Hash: UVBZSDECVMTN6XMCGJV3CKFRV4HI2EUR
X-MailFrom: trevor.wu@mediatek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: trevor.wu@mediatek.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UVBZSDECVMTN6XMCGJV3CKFRV4HI2EUR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In mt8188_etdm_clk_src_sel_put() function, val retrieved by FIELD_PREP
is shifted to the corresponding bit filed, so it can compare with the
register value directly.

Originally, the redundant bit shift of the register value results in
the wrong comparison result, so we remove bit shift operation in the
patch.

Fixes: 2babb4777489 ("ASoC: mediatek: mt8188: support etdm in platform driver")
Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8188/mt8188-dai-etdm.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c b/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
index 071841903c62..1c53d4cb19bb 100644
--- a/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
@@ -679,7 +679,6 @@ static int mt8188_etdm_clk_src_sel_put(struct snd_kcontrol *kcontrol,
 	unsigned int old_val;
 	unsigned int mask;
 	unsigned int reg;
-	unsigned int shift;
 
 	if (source >= e->items)
 		return -EINVAL;
@@ -687,27 +686,22 @@ static int mt8188_etdm_clk_src_sel_put(struct snd_kcontrol *kcontrol,
 	if (!strcmp(kcontrol->id.name, "ETDM_OUT1_Clock_Source")) {
 		reg = ETDM_OUT1_CON4;
 		mask = ETDM_OUT_CON4_CLOCK_MASK;
-		shift = ETDM_OUT_CON4_CLOCK_SHIFT;
 		val = FIELD_PREP(ETDM_OUT_CON4_CLOCK_MASK, source);
 	} else if (!strcmp(kcontrol->id.name, "ETDM_OUT2_Clock_Source")) {
 		reg = ETDM_OUT2_CON4;
 		mask = ETDM_OUT_CON4_CLOCK_MASK;
-		shift = ETDM_OUT_CON4_CLOCK_SHIFT;
 		val = FIELD_PREP(ETDM_OUT_CON4_CLOCK_MASK, source);
 	} else if (!strcmp(kcontrol->id.name, "ETDM_OUT3_Clock_Source")) {
 		reg = ETDM_OUT3_CON4;
 		mask = ETDM_OUT_CON4_CLOCK_MASK;
-		shift = ETDM_OUT_CON4_CLOCK_SHIFT;
 		val = FIELD_PREP(ETDM_OUT_CON4_CLOCK_MASK, source);
 	} else if (!strcmp(kcontrol->id.name, "ETDM_IN1_Clock_Source")) {
 		reg = ETDM_IN1_CON2;
 		mask = ETDM_IN_CON2_CLOCK_MASK;
-		shift = ETDM_IN_CON2_CLOCK_SHIFT;
 		val = FIELD_PREP(ETDM_IN_CON2_CLOCK_MASK, source);
 	} else if (!strcmp(kcontrol->id.name, "ETDM_IN2_Clock_Source")) {
 		reg = ETDM_IN2_CON2;
 		mask = ETDM_IN_CON2_CLOCK_MASK;
-		shift = ETDM_IN_CON2_CLOCK_SHIFT;
 		val = FIELD_PREP(ETDM_IN_CON2_CLOCK_MASK, source);
 	} else {
 		return -EINVAL;
@@ -715,8 +709,6 @@ static int mt8188_etdm_clk_src_sel_put(struct snd_kcontrol *kcontrol,
 
 	regmap_read(afe->regmap, reg, &old_val);
 	old_val &= mask;
-	old_val >>= shift;
-
 	if (old_val == val)
 		return 0;
 
-- 
2.18.0

