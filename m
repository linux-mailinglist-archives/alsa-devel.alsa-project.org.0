Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7924B3FFA1B
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 08:02:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA2971684;
	Fri,  3 Sep 2021 08:01:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA2971684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630648949;
	bh=5vPY6qWmjvJN3cjDkGeRI42rVx0cggdmsA5dApm4unk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=He/L3IgX05OGE3bS8DOAFOMfWVJlUIYsZf06H619v1Xcr9xNtrFIBbihUbEP+xN9o
	 nLAqOVQrUohdaYvJk5CUXcHlIsILNwjGPLZD5+qrLw/N/1CWNMA4gK3gIOHL+EErSq
	 QRBarpLQq2SnQ9Vxn1YXp0D4Pp5nutKU0fbXy5rc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68380F80088;
	Fri,  3 Sep 2021 08:01:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 261A0F80254; Fri,  3 Sep 2021 08:01:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCB0AF8020D
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 08:01:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCB0AF8020D
X-UUID: 45ec8858fcea4a23a0db6e31cc49a40a-20210903
X-UUID: 45ec8858fcea4a23a0db6e31cc49a40a-20210903
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1630697288; Fri, 03 Sep 2021 14:00:51 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Sep 2021 14:00:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 3 Sep 2021 14:00:50 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>
Subject: [PATCH] ASoC: mt8195: correct the dts parsing logic about DPTX and
 HDMITX
Date: Fri, 3 Sep 2021 14:00:49 +0800
Message-ID: <20210903060049.20764-1-trevor.wu@mediatek.com>
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

According to the description in dt-bindings, phandle assignment of
HDMI TX and DP TX are not required properties, but driver regards them
as required properties.
In real use case, it's expected that DP TX and HDMI TX are optional
features, so correct the behavior in driver.

Fixes: 40d605df0a7b ("ASoC: mediatek: mt8195: add machine driver with mt6359, rt1019 and rt5682")
Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 .../mt8195/mt8195-mt6359-rt1019-rt5682.c      | 22 +++++++++----------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
index 5dc217f59bd6..c97ace7387b4 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
@@ -1018,13 +1018,12 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 				of_parse_phandle(pdev->dev.of_node,
 						 "mediatek,dptx-codec", 0);
 			if (!dai_link->codecs->of_node) {
-				dev_err(&pdev->dev, "Property 'dptx-codec' missing or invalid\n");
-				return -EINVAL;
+				dev_dbg(&pdev->dev, "No property 'dptx-codec'\n");
+			} else {
+				dai_link->codecs->name = NULL;
+				dai_link->codecs->dai_name = "i2s-hifi";
+				dai_link->init = mt8195_dptx_codec_init;
 			}
-
-			dai_link->codecs->name = NULL;
-			dai_link->codecs->dai_name = "i2s-hifi";
-			dai_link->init = mt8195_dptx_codec_init;
 		}
 
 		if (strcmp(dai_link->name, "ETDM3_OUT_BE") == 0) {
@@ -1032,13 +1031,12 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 				of_parse_phandle(pdev->dev.of_node,
 						 "mediatek,hdmi-codec", 0);
 			if (!dai_link->codecs->of_node) {
-				dev_err(&pdev->dev, "Property 'hdmi-codec' missing or invalid\n");
-				return -EINVAL;
+				dev_dbg(&pdev->dev, "No property 'hdmi-codec'\n");
+			} else {
+				dai_link->codecs->name = NULL;
+				dai_link->codecs->dai_name = "i2s-hifi";
+				dai_link->init = mt8195_hdmi_codec_init;
 			}
-
-			dai_link->codecs->name = NULL;
-			dai_link->codecs->dai_name = "i2s-hifi";
-			dai_link->init = mt8195_hdmi_codec_init;
 		}
 	}
 
-- 
2.18.0

