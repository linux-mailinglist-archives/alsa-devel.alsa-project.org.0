Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D876A6B4E
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Mar 2023 12:03:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6E601D9;
	Wed,  1 Mar 2023 12:02:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6E601D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677668600;
	bh=6dUIO1zA/PijnHVIPvnVhYN2sFgYxl/lET641k9Ml9s=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uxzgk8gzF9WBgz6tAw1q/c2Q/BNPmHCM79pIS2z60R5Uc0UjXxESDODQYAbZ/5QXh
	 xRTwoLGD0lY7i7Ts99S/JAgJUZDMH41RcRotISQJ4dhbwie1yTV0VpO2fJO/su9Q2q
	 E4eg6lJOEPr7mWE58QmOiIh5sYEiKKj9VxXcpM1c=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A535F80310;
	Wed,  1 Mar 2023 12:02:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D42E4F804FE; Wed,  1 Mar 2023 12:02:22 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D3366F80236
	for <alsa-devel@alsa-project.org>; Wed,  1 Mar 2023 12:02:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3366F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=egqhgcTJ
X-UUID: 8001859ab82011eda06fc9ecc4dadd91-20230301
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=JujL0zJMof6BeSlvA5bvmTeu3hHrd2enXVP0mfRzsrA=;
	b=egqhgcTJMRLOXnyC2Ff0GDXNNYeukR0m3xLRRHFCd+mnOv0KWkc568qo0c0p29Vxjn4Ei6J71AJj/05oUc4KGk2qAmCcN1teh94ANqg4KUQBxN6IMxGToEZPeu030fhfBsadFTvqC0lEekh4EsOs+7/LjJAwD66QuPGBoN+TSbs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:aeb25cc6-fab0-4870-898e-b1242d39c4ad,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:25b5999,CLOUDID:49ab6bf4-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 8001859ab82011eda06fc9ecc4dadd91-20230301
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 92384482; Wed, 01 Mar 2023 19:02:04 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Wed, 1 Mar 2023 19:02:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 1 Mar 2023 19:02:03 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>
Subject: [PATCH v2 2/2] ASoC: mediatek: mt8195: add missing initialization
Date: Wed, 1 Mar 2023 19:02:00 +0800
Message-ID: <20230301110200.26177-3-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230301110200.26177-1-trevor.wu@mediatek.com>
References: <20230301110200.26177-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Message-ID-Hash: DJ7OH4UEVHG7AFMFRY3USTMNKSPPUYPN
X-Message-ID-Hash: DJ7OH4UEVHG7AFMFRY3USTMNKSPPUYPN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DJ7OH4UEVHG7AFMFRY3USTMNKSPPUYPN/>
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

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 3 +++
 1 file changed, 3 insertions(+)

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

