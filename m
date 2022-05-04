Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E59951A983
	for <lists+alsa-devel@lfdr.de>; Wed,  4 May 2022 19:18:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B35F816FC;
	Wed,  4 May 2022 19:17:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B35F816FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651684690;
	bh=X+w2zqMK1pp5/NF0lMnVACq6fHGwfER0aQmL09ru70c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ipm+V2sUp84lBr1qfl6u3tLnpbMG22YDjoM2gRDUkh+xkwjzLEF/wbCR0/AQBfitq
	 wkusKaf7Ehrl9kRp5pqmlxQ0SfEiueJZOTAk3C+n9mWxnlh8VPK1XyuIZoT9xKpuSf
	 HNuFMEoMVAgRQtVxdjJP/L0f6ZAZc9u/+cq9ifb4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26E9CF805E9;
	Wed,  4 May 2022 19:10:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A68FDF805F4; Wed,  4 May 2022 19:10:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0D08F805E1
 for <alsa-devel@alsa-project.org>; Wed,  4 May 2022 19:10:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0D08F805E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Re7yfdks"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446EsAG021058;
 Wed, 4 May 2022 12:09:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=uYui3GUDReHMEoWVOJgVxZHHd2RXTViPFt1wsoGQ19o=;
 b=Re7yfdkslZnIrb1pNPjJSH9s+n+1xHAE9/IXko/1POV1sqG9bXZC9oSNz7m5xAb1is5A
 hRdwJX8OviE5RFZmfnt26trniYExXeqzUmE11e6En+8Em8t8UsagNsL8Q59NTnLeNgc4
 2X15BFHYbkc4UamVDGStWVCKg7ffm+xpMyG4gxEK8biwZ3cHZ9oo87VDIPrUg97kjRGX
 s0oGcn63RQy9ooAb/92UHKrb8If/SEUyVoeiI+6GLbWi8ENdBAEJ77grNJ38u+atL6ft
 pYAxkVB8bNwLrzj5XQMsxZAPswaeQikhbFLw4G9ROaHzPfr908FdSISxkcVpYFxIm83E 2A== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fs1hpcxs0-12
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 May 2022 12:09:18 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 4 May 2022 18:09:06 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 72A2811D1;
 Wed,  4 May 2022 17:09:06 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 22/38] ASoC: rt1019: Add endianness flag in
 snd_soc_component_driver
Date: Wed, 4 May 2022 18:08:49 +0100
Message-ID: <20220504170905.332415-23-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: SkOcWsdXVRIzmtixodHsTRnGBSLVo9f5
X-Proofpoint-GUID: SkOcWsdXVRIzmtixodHsTRnGBSLVo9f5
X-Proofpoint-Spam-Reason: safe
Cc: oder_chiou@realtek.com, steven.eckhoff.opensource@gmail.com,
 alexandre.belloni@bootlin.com, lars@metafoo.de,
 kuninori.morimoto.gx@renesas.com, kmarinushkin@birdec.com,
 patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org,
 lgirdwood@gmail.com, jiaxin.yu@mediatek.com, tzungbi@google.com,
 srinivas.kandagatla@linaro.org, matthias.bgg@gmail.com,
 chrome-platform@lists.linux.dev, codrin.ciubotariu@microchip.com,
 alsa-devel@alsa-project.org, bleung@chromium.org, cychiang@chromium.org
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

The endianness flag is used on the CODEC side to specify an
ambivalence to endian, typically because it is lost over the hardware
link. This device receives audio over an I2S DAI and as such should
have endianness applied.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/rt1019.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1019.c b/sound/soc/codecs/rt1019.c
index d45d14fe5c427..f3f15fbe85d0e 100644
--- a/sound/soc/codecs/rt1019.c
+++ b/sound/soc/codecs/rt1019.c
@@ -515,7 +515,7 @@ static struct snd_soc_dai_driver rt1019_dai[] = {
 };
 
 static const struct snd_soc_component_driver soc_component_dev_rt1019 = {
-	.probe = rt1019_probe,
+	.probe			= rt1019_probe,
 	.controls		= rt1019_snd_controls,
 	.num_controls		= ARRAY_SIZE(rt1019_snd_controls),
 	.dapm_widgets		= rt1019_dapm_widgets,
@@ -523,6 +523,7 @@ static const struct snd_soc_component_driver soc_component_dev_rt1019 = {
 	.dapm_routes		= rt1019_dapm_routes,
 	.num_dapm_routes	= ARRAY_SIZE(rt1019_dapm_routes),
 	.non_legacy_dai_naming	= 1,
+	.endianness		= 1,
 };
 
 static const struct regmap_config rt1019_regmap = {
-- 
2.30.2

