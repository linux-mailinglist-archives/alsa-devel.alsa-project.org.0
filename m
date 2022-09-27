Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2548C5EC753
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 17:13:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6FA084B;
	Tue, 27 Sep 2022 17:12:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6FA084B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664291581;
	bh=11j1DWcYQenLQKAJfHYCScqK58cZ+h+RiBiDWp3CRV8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=j4ghEkb6Am2N9UcLOpTwMdoas1gIQoA5iYOVYpxr+MZEN20ltb4KSKtmiSCspmxc0
	 P9DfzuiPoYM1Unk4UoTasqwONKtuEf/S3v71I2W9thooRIm7rNgCCONEmnZEohJO4J
	 g5gL8fc0TWKIymp5fvjbLvLarfma5LvifYyALFlk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEE7BF80496;
	Tue, 27 Sep 2022 17:12:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F330F8025E; Tue, 27 Sep 2022 17:12:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled
 version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C06CF800AA
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 17:11:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C06CF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="GM3RIT9O"
X-UUID: 5123190f57b04aac8915a50865dc35ab-20220927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=9tjx5t8k5Luxw2O54U9tC1FC5+hKWB1/DzXaoINrLXE=; 
 b=GM3RIT9OpYSuKnPaqG9AWeo7d2qcRYKpeX4zfRzCi5JhE2D+XFKiHO2uYc8Xc1V5+2beI8LoEsXXGzqxufq4ivMffKvWcJ/W9SNiPDehAu8J9HOiJ4H/6kbdQ1LIGgcTeGAweF1gGbCf7bwhhIzzVeybFNYRh1oCgft6XJ+/NfU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:ed2a5966-de9d-4aa5-a0ce-70977a3e2cd6, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:95
X-CID-INFO: VERSION:1.1.11, REQID:ed2a5966-de9d-4aa5-a0ce-70977a3e2cd6, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
 :quarantine,TS:95
X-CID-META: VersionHash:39a5ff1, CLOUDID:f22d40a3-dc04-435c-b19b-71e131a5fc35,
 B
 ulkID:220927231145B3R6UNXY,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48|823|
 824,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,
 COL:0
X-UUID: 5123190f57b04aac8915a50865dc35ab-20220927
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 474841654; Tue, 27 Sep 2022 23:11:45 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 27 Sep 2022 23:11:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 27 Sep 2022 23:11:44 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>
Subject: [PATCH] ASoC: mediatek: mt8195: update audio tuner settings
Date: Tue, 27 Sep 2022 23:11:41 +0800
Message-ID: <20220927151141.11846-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
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

Audio tuner is used to handle clock drift between 26M and APLL domain.

It's expected when abs(chg_cnt) equals to upper bound, tuner updates pcw
setting automatically, and then abs(chg_cnt) decreases.
In the stress test, we found abs(chg_cnt) possibly equals to 2 at the
unexpected timing. This results in wrong pcw updating.
Finally, abs(chg_cnt) will always be larger than upper bound,

As a result, we update the upper bound to 3 to handle the corner case.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 2ee3872c83c3..9ca2cb8c8a9c 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -117,7 +117,7 @@ static struct mt8195_afe_tuner_cfg mt8195_afe_tuner_cfgs[MT8195_AUD_PLL_NUM] = {
 		.upper_bound_reg = AFE_APLL_TUNER_CFG,
 		.upper_bound_shift = 8,
 		.upper_bound_maskbit = 0xff,
-		.upper_bound_default = 0x2,
+		.upper_bound_default = 0x3,
 	},
 	[MT8195_AUD_PLL2] = {
 		.id = MT8195_AUD_PLL2,
@@ -135,7 +135,7 @@ static struct mt8195_afe_tuner_cfg mt8195_afe_tuner_cfgs[MT8195_AUD_PLL_NUM] = {
 		.upper_bound_reg = AFE_APLL_TUNER_CFG1,
 		.upper_bound_shift = 8,
 		.upper_bound_maskbit = 0xff,
-		.upper_bound_default = 0x2,
+		.upper_bound_default = 0x3,
 	},
 	[MT8195_AUD_PLL3] = {
 		.id = MT8195_AUD_PLL3,
-- 
2.18.0

