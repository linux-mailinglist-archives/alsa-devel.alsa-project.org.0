Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 081616FD4D8
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 05:58:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0812F3B;
	Wed, 10 May 2023 05:57:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0812F3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683691101;
	bh=yn5EIhMRYetfeNoGEG1YRuu+ERvCgVMeB3Cy3CvolWI=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=VKzYbpUmi/RlGfm74Lua7pAM43Bmfq5xRxiAZJMb0xhP8ee7Scj44Rffj1P98DDqu
	 T0c5gkCH9K2piAV7/dIskrKQJCjNz5+Z9AtnV8HcbVAJ1YsagUB0D15mQOkyaDBeTT
	 5A+8+/1gh1MgTPSHn+VzA4smKpqcFZFSD6R9e8io=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 053A1F80563;
	Wed, 10 May 2023 05:56:06 +0200 (CEST)
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v4 7/9] ASoC: mediatek: mt8188: add required clocks
Date: Wed, 10 May 2023 11:55:24 +0800
In-Reply-To: <20230510035526.18137-1-trevor.wu@mediatek.com>
References: <20230510035526.18137-1-trevor.wu@mediatek.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WYTDB7J65GL6PU2C7QQAUJDBJ7OPG237/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168369096495.26.2324414942981971046@mailman-core.alsa-project.org>
From: Trevor Wu via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Trevor Wu <trevor.wu@mediatek.com>
Cc: trevor.wu@mediatek.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08FEAF8055C; Wed, 10 May 2023 05:56:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	RDNS_NONE,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6B79F8053B
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 05:55:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6B79F8053B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=WP8p5lVH
X-UUID: 8174241ceee611ed9cb5633481061a41-20230510
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RI8vc5HHHEzczfqD16t7nOkGfbMNwVJXLerS6sexQ5w=;
	b=WP8p5lVHB2iRhsw3yWoULaQS3ZXl6lJItGTnJN+iS0kfpyDmHfWuDscRoqJs/+ZmfVB/El81tk2tvRs0ie3e02mQVwLioxF0QVUFDX10Iud6mqq5VtrqQgk17YW7fyqrBK5SUqoOFb593RlNbtwpkb0e0bv7HfeMXoKoU11h/DA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24,REQID:79d321e6-0e29-428b-8150-5748a62a51ec,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:178d4d4,CLOUDID:791d516b-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 8174241ceee611ed9cb5633481061a41-20230510
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1065781609; Wed, 10 May 2023 11:55:30 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 10 May 2023 11:55:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 10 May 2023 11:55:29 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v4 7/9] ASoC: mediatek: mt8188: add required clocks
Date: Wed, 10 May 2023 11:55:24 +0800
Message-ID: <20230510035526.18137-8-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230510035526.18137-1-trevor.wu@mediatek.com>
References: <20230510035526.18137-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Message-ID-Hash: WYTDB7J65GL6PU2C7QQAUJDBJ7OPG237
X-Message-ID-Hash: WYTDB7J65GL6PU2C7QQAUJDBJ7OPG237
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WYTDB7J65GL6PU2C7QQAUJDBJ7OPG237/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

apll2_d4, apll12_div4, top_a2sys and top_aud_iec are possibly used in
the future. To prevent from breaking binding ABI after any mt8188 dts
upstream, add these clocks to clock list in advance.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c | 4 ++++
 sound/soc/mediatek/mt8188/mt8188-afe-clk.h | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
index 02411be93900..4c24d0b9e90d 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
@@ -25,14 +25,18 @@ static const char *aud_clks[MT8188_CLK_NUM] = {
 
 	/* divider */
 	[MT8188_CLK_TOP_APLL1_D4] = "apll1_d4",
+	[MT8188_CLK_TOP_APLL2_D4] = "apll2_d4",
 	[MT8188_CLK_TOP_APLL12_DIV0] = "apll12_div0",
 	[MT8188_CLK_TOP_APLL12_DIV1] = "apll12_div1",
 	[MT8188_CLK_TOP_APLL12_DIV2] = "apll12_div2",
 	[MT8188_CLK_TOP_APLL12_DIV3] = "apll12_div3",
+	[MT8188_CLK_TOP_APLL12_DIV4] = "apll12_div4",
 	[MT8188_CLK_TOP_APLL12_DIV9] = "apll12_div9",
 
 	/* mux */
 	[MT8188_CLK_TOP_A1SYS_HP_SEL] = "top_a1sys_hp",
+	[MT8188_CLK_TOP_A2SYS_SEL] = "top_a2sys",
+	[MT8188_CLK_TOP_AUD_IEC_SEL] = "top_aud_iec",
 	[MT8188_CLK_TOP_AUD_INTBUS_SEL] = "top_aud_intbus",
 	[MT8188_CLK_TOP_AUDIO_H_SEL] = "top_audio_h",
 	[MT8188_CLK_TOP_AUDIO_LOCAL_BUS_SEL] = "top_audio_local_bus",
diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.h b/sound/soc/mediatek/mt8188/mt8188-afe-clk.h
index 04cb476f0bcb..904505d10841 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-clk.h
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.h
@@ -23,13 +23,17 @@ enum {
 	MT8188_CLK_APMIXED_APLL2,
 	/* divider */
 	MT8188_CLK_TOP_APLL1_D4,
+	MT8188_CLK_TOP_APLL2_D4,
 	MT8188_CLK_TOP_APLL12_DIV0,
 	MT8188_CLK_TOP_APLL12_DIV1,
 	MT8188_CLK_TOP_APLL12_DIV2,
 	MT8188_CLK_TOP_APLL12_DIV3,
+	MT8188_CLK_TOP_APLL12_DIV4,
 	MT8188_CLK_TOP_APLL12_DIV9,
 	/* mux */
 	MT8188_CLK_TOP_A1SYS_HP_SEL,
+	MT8188_CLK_TOP_A2SYS_SEL,
+	MT8188_CLK_TOP_AUD_IEC_SEL,
 	MT8188_CLK_TOP_AUD_INTBUS_SEL,
 	MT8188_CLK_TOP_AUDIO_H_SEL,
 	MT8188_CLK_TOP_AUDIO_LOCAL_BUS_SEL,
-- 
2.18.0

