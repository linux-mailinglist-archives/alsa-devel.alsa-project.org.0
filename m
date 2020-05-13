Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B75D61D17C3
	for <lists+alsa-devel@lfdr.de>; Wed, 13 May 2020 16:39:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D03F1666;
	Wed, 13 May 2020 16:38:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D03F1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589380771;
	bh=h+SoyBekSKISkqys7t9OLIbUrQYEV2mRE86BLHJBVU0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YFNtFw8KwiRUvYy7hqy2E1OhKNlBpAzmxwyU3MJc97VCEidzg+W8ImvjTLlKAnSRl
	 KccGdIgSos3HCyTWcnDY/WMlwyVirR4m36RTSfDLLfKVLqjp0sQUosb03XM6mSj4mC
	 NfN2tIIJS5ilvqQcMStpuMzcMV3nBYLajDvslT2A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57AF9F800E3;
	Wed, 13 May 2020 16:37:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCB31F80247; Wed, 13 May 2020 16:37:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39E76F800B7
 for <alsa-devel@alsa-project.org>; Wed, 13 May 2020 16:37:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39E76F800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="U14KrHHU"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04DEbZsx007038;
 Wed, 13 May 2020 09:37:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1589380655;
 bh=y/YaegT2DGD/8Lmf/IfgyqvQ89iKHw+Iptrkg/MbCp8=;
 h=From:To:CC:Subject:Date;
 b=U14KrHHUWdqyXt9cQFRAWWnBCTwWA3fq1gBPyh6YvsRL/TQ8LZHwL39ZpFxTepJ2x
 mQRD+DuxYXLhuWxqp3cvq6KkUKbw5Tp/DmZV5c4k+G5O58YdpMHd4BAw+cPU6oefGn
 CdqyoXHULLcn46pyVoZx12+YCgkMesPkjM+PO3DI=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04DEbYoG129497
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 13 May 2020 09:37:34 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 13
 May 2020 09:37:34 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 13 May 2020 09:37:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04DEbYNx077984;
 Wed, 13 May 2020 09:37:34 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH] ASoC: tlv320adcx140: Fix bias config values
Date: Wed, 13 May 2020 09:28:07 -0500
Message-ID: <20200513142807.11802-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Dan Murphy <dmurphy@ti.com>
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

The device tree binding declares the ti,mic-bias-source and the
ti,vref-source properties as u32.  The code reads them as u8 which is
incorrect.  Since the device tree binding indicates them as u32 the
conde needs to be updated to read u32.

In addition the bias source needs to be shifted 4 bits to
correctly write the register.

Fixes: 37bde5acf040 ("ASoC: tlv320adcx140: Add the tlv320adcx140 codec
driver family")
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 sound/soc/codecs/tlv320adcx140.c | 13 +++++++------
 sound/soc/codecs/tlv320adcx140.h |  1 +
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index 0f713efde046..1d7d7b34a46e 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -739,11 +739,12 @@ static int adcx140_codec_probe(struct snd_soc_component *component)
 {
 	struct adcx140_priv *adcx140 = snd_soc_component_get_drvdata(component);
 	int sleep_cfg_val = ADCX140_WAKE_DEV;
-	u8 bias_source;
-	u8 vref_source;
+	u32 bias_source;
+	u32 vref_source;
+	u8 bias_cfg;
 	int ret;
 
-	ret = device_property_read_u8(adcx140->dev, "ti,mic-bias-source",
+	ret = device_property_read_u32(adcx140->dev, "ti,mic-bias-source",
 				      &bias_source);
 	if (ret)
 		bias_source = ADCX140_MIC_BIAS_VAL_VREF;
@@ -754,7 +755,7 @@ static int adcx140_codec_probe(struct snd_soc_component *component)
 		return -EINVAL;
 	}
 
-	ret = device_property_read_u8(adcx140->dev, "ti,vref-source",
+	ret = device_property_read_u32(adcx140->dev, "ti,vref-source",
 				      &vref_source);
 	if (ret)
 		vref_source = ADCX140_MIC_BIAS_VREF_275V;
@@ -765,7 +766,7 @@ static int adcx140_codec_probe(struct snd_soc_component *component)
 		return -EINVAL;
 	}
 
-	bias_source |= vref_source;
+	bias_cfg = bias_source << ADCX140_MIC_BIAS_SHIFT | vref_source;
 
 	ret = adcx140_reset(adcx140);
 	if (ret)
@@ -785,7 +786,7 @@ static int adcx140_codec_probe(struct snd_soc_component *component)
 
 	ret = regmap_update_bits(adcx140->regmap, ADCX140_BIAS_CFG,
 				ADCX140_MIC_BIAS_VAL_MSK |
-				ADCX140_MIC_BIAS_VREF_MSK, bias_source);
+				ADCX140_MIC_BIAS_VREF_MSK, bias_cfg);
 	if (ret)
 		dev_err(adcx140->dev, "setting MIC bias failed %d\n", ret);
 out:
diff --git a/sound/soc/codecs/tlv320adcx140.h b/sound/soc/codecs/tlv320adcx140.h
index 6d055e55909e..69de52d473f4 100644
--- a/sound/soc/codecs/tlv320adcx140.h
+++ b/sound/soc/codecs/tlv320adcx140.h
@@ -116,6 +116,7 @@
 #define ADCX140_MIC_BIAS_VAL_VREF_1096	1
 #define ADCX140_MIC_BIAS_VAL_AVDD	6
 #define ADCX140_MIC_BIAS_VAL_MSK GENMASK(6, 4)
+#define ADCX140_MIC_BIAS_SHIFT		4
 
 #define ADCX140_MIC_BIAS_VREF_275V	0
 #define ADCX140_MIC_BIAS_VREF_25V	1
-- 
2.26.2

