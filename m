Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 632BD51A8D3
	for <lists+alsa-devel@lfdr.de>; Wed,  4 May 2022 19:15:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDB0116CA;
	Wed,  4 May 2022 19:14:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDB0116CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651684501;
	bh=DTmA+5dv8jSfaMx0pyKg2GD3Yad2Qv5/YFTm+OuJhwg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s0LuzuGbI9pDHPoD9sq8n4YD+cBOE0uTukTEFWEBLnu9j9l5hKmQ3hKhOdXJ9swEI
	 w3Ayd9Hu3sMb5pw6VBsPH15bXfKm0q4ITWanp/3hECIJjKzu5AUCtC5cgJEW6pG2Og
	 NCvlMgfEvvoXcrc7ljOvJVWoFWM2kzrN8ZuHYs00=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CBCAF805B3;
	Wed,  4 May 2022 19:09:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73640F80566; Wed,  4 May 2022 19:09:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C0FDF80510
 for <alsa-devel@alsa-project.org>; Wed,  4 May 2022 19:09:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C0FDF80510
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="hukWhjCo"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446EsAA021058;
 Wed, 4 May 2022 12:09:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Kh0pzTHXmAUdN126RAAZDrIy12vFDLPkQR7/bwI2GYE=;
 b=hukWhjCo/UXsKj6wsfiA4F/7ugP5duEVytNQrubD8lSagJx6BsqsO4HCJRuk5WJOaBBq
 azdRI7YnktfKQPYQWPUiOd+G+1olO6r7HKY5RJofYroO3Hb+eBBvchuVtaGRF/P3+Zc8
 JFtjlTqYXLPgE2XGoeaR6MRAcwCD7fk8eFUeEoWHamEwrfXT1VjIBfOtPdOkFt4+ro9b
 k/Ui6X+/FnsiKDxHSkrUjA83U+uotDcv/xuTy04Qmlvv0KuWpL4rsiBhKpz94y7pm0/g
 sgInvA3NUnDpZaFVtdLOYrMiBZVAIjF0Vou4Wp3Z/gOstrouB92vuBJL15LnSGBHTst3 1Q== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fs1hpcxs0-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 May 2022 12:09:13 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:05 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 4 May 2022 18:09:05 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D9314459;
 Wed,  4 May 2022 17:09:05 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 12/38] ASoC: adau1372: Add endianness flag in
 snd_soc_component_driver
Date: Wed, 4 May 2022 18:08:39 +0100
Message-ID: <20220504170905.332415-13-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 8-oc2LovoHt1GPeRlqlvxht7ZimDRRsV
X-Proofpoint-GUID: 8-oc2LovoHt1GPeRlqlvxht7ZimDRRsV
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
 sound/soc/codecs/adau1372.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/adau1372.c b/sound/soc/codecs/adau1372.c
index 1faa4c4263650..a9f89e8565ec6 100644
--- a/sound/soc/codecs/adau1372.c
+++ b/sound/soc/codecs/adau1372.c
@@ -859,6 +859,7 @@ static const struct snd_soc_component_driver adau1372_driver = {
 	.num_dapm_widgets = ARRAY_SIZE(adau1372_dapm_widgets),
 	.dapm_routes = adau1372_dapm_routes,
 	.num_dapm_routes = ARRAY_SIZE(adau1372_dapm_routes),
+	.endianness = 1,
 };
 
 static const struct snd_soc_dai_ops adau1372_dai_ops = {
-- 
2.30.2

