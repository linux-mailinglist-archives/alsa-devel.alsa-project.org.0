Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D83C7170046
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2020 14:41:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D2821687;
	Wed, 26 Feb 2020 14:40:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D2821687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582724505;
	bh=nxAS79n8ttJa3VY1a3i+9sar/09j4mOjk5StE6NUxGc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dQeqJMr8g3v4uGf52pXdf3jr6RkJbrSvtolsdDsdONh80mDL2JMb3hGwzZaUsTeZa
	 jKF9wOwekxk6c5aWv4zg45qlBkJeSi/OjM7uSZZ341OM8p356ZXaL7UflUw5YB4Ufa
	 +GjPqNeHo3HrXG+ogQh91exV5ZjCGJ4iiMFGlllw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CEA4F80089;
	Wed, 26 Feb 2020 14:40:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEC95F8014D; Wed, 26 Feb 2020 14:40:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 716A9F800AD
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 14:39:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 716A9F800AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wEwlWUXM"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01QDdrYq034511;
 Wed, 26 Feb 2020 07:39:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582724393;
 bh=HTRVPjh5DuXVRlDJkrZ6Z9RblyZsq7c/8F7wOehG3zw=;
 h=From:To:CC:Subject:Date;
 b=wEwlWUXMOpmqXzaj1p3Iafzy5ChoyhKl77B4qsHA8/3HwDSGESsVVjOYMu42ytA/v
 tdgAZQT/Y6uOQcRRAAJXJ5DDzbAb+IBUS0q7brKAP9ACQ6Kt6dwby3xnH4Hn5EP3/M
 VmG+9wAxq7dQbMzl4n/Os4OHDFCV8VMtNHZGMG04=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01QDdrHb026706;
 Wed, 26 Feb 2020 07:39:53 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 26
 Feb 2020 07:39:52 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 26 Feb 2020 07:39:52 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01QDdqRY023003;
 Wed, 26 Feb 2020 07:39:52 -0600
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH for-next] ASoC: tlv320adcx140: Fix MIC_BIAS defines for ADC
 full scale
Date: Wed, 26 Feb 2020 07:34:39 -0600
Message-ID: <20200226133439.15837-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Ricard Wanderlof <ricardw@axis.com>, Dan Murphy <dmurphy@ti.com>
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

Change the #defines for the ADC full scale bits from MIC_BIAS to
ADC_FSCALE.  This also changes the error message to incidate ADC full
scale value error as opposed to the Mic bias.

Reported-by: Ricard Wanderlof <ricardw@axis.com>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 sound/soc/codecs/tlv320adcx140.c | 12 ++++++------
 sound/soc/codecs/tlv320adcx140.h |  8 ++++----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index 93a0cb8e662c..825ace9b5fa7 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -758,12 +758,12 @@ static int adcx140_codec_probe(struct snd_soc_component *component)
 	ret = device_property_read_u8(adcx140->dev, "ti,vref-source",
 				      &vref_source);
 	if (ret)
-		vref_source = ADCX140_MIC_BIAS_VREF_275V;
+		vref_source = ADCX140_ADC_FSCALE_VREF_275V;
 
-	if (vref_source != ADCX140_MIC_BIAS_VREF_275V &&
-	    vref_source != ADCX140_MIC_BIAS_VREF_25V &&
-	    vref_source != ADCX140_MIC_BIAS_VREF_1375V) {
-		dev_err(adcx140->dev, "Mic Bias source value is invalid\n");
+	if (vref_source != ADCX140_ADC_FSCALE_VREF_275V &&
+	    vref_source != ADCX140_ADC_FSCALE_VREF_25V &&
+	    vref_source != ADCX140_ADC_FSCALE_VREF_1375V) {
+		dev_err(adcx140->dev, "ADC full scale setting is invalid\n");
 		return -EINVAL;
 	}
 
@@ -787,7 +787,7 @@ static int adcx140_codec_probe(struct snd_soc_component *component)
 
 	ret = regmap_update_bits(adcx140->regmap, ADCX140_BIAS_CFG,
 				ADCX140_MIC_BIAS_VAL_MSK |
-				ADCX140_MIC_BIAS_VREF_MSK, bias_source);
+				ADCX140_ADC_FSCALE_VREF_MSK, bias_source);
 	if (ret)
 		dev_err(adcx140->dev, "setting MIC bias failed %d\n", ret);
 out:
diff --git a/sound/soc/codecs/tlv320adcx140.h b/sound/soc/codecs/tlv320adcx140.h
index 6d055e55909e..adb9513900b1 100644
--- a/sound/soc/codecs/tlv320adcx140.h
+++ b/sound/soc/codecs/tlv320adcx140.h
@@ -117,10 +117,10 @@
 #define ADCX140_MIC_BIAS_VAL_AVDD	6
 #define ADCX140_MIC_BIAS_VAL_MSK GENMASK(6, 4)
 
-#define ADCX140_MIC_BIAS_VREF_275V	0
-#define ADCX140_MIC_BIAS_VREF_25V	1
-#define ADCX140_MIC_BIAS_VREF_1375V	2
-#define ADCX140_MIC_BIAS_VREF_MSK GENMASK(1, 0)
+#define ADCX140_ADC_FSCALE_VREF_275V	0
+#define ADCX140_ADC_FSCALE_VREF_25V	1
+#define ADCX140_ADC_FSCALE_VREF_1375V	2
+#define ADCX140_ADC_FSCALE_VREF_MSK GENMASK(1, 0)
 
 #define ADCX140_PWR_CFG_BIAS_PDZ	BIT(7)
 #define ADCX140_PWR_CFG_ADC_PDZ		BIT(6)
-- 
2.25.0

