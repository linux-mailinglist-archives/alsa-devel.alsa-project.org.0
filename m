Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8022226AD07
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Sep 2020 21:08:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 160251612;
	Tue, 15 Sep 2020 21:07:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 160251612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600196913;
	bh=eFKRLsM1wi5VpXmo7Rx+cZCFXk0sF3mV9/p1jJ+if5s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WmTZbjvfdjkc1ZpH+4WbaYZIAh7mTJa1tgKzBKuk6NKykB7Me5MdWUqAHISlUiLIE
	 nJMu7O7gqsjDUVHvvvltmTi3IQHck9EVObeQ35LXROZzRvN4FQj60tUtVJw9AX4wgd
	 t2vBsb2+wv62y1Jvtq0UkirPF3OgBv+1e/25HupY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37E41F8028B;
	Tue, 15 Sep 2020 21:06:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34CADF80290; Tue, 15 Sep 2020 21:06:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E6F6F8025E
 for <alsa-devel@alsa-project.org>; Tue, 15 Sep 2020 21:06:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E6F6F8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dJDHqhDL"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08FJ6HwF013519;
 Tue, 15 Sep 2020 14:06:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600196777;
 bh=DkyZu5LoKU5RAM9n+bYIZ61osvE1080309ep6aCvTeQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=dJDHqhDLlbu/voylnBEqiHCcamsxrLf7XEuptb+xoVF1Dy5AtnD6Zdb+GfFaiKH14
 0mQ8Swajq7q18FBSuLLnOa7qwHAJPg/3/+xrEPYEoHHisv5tqt5I0parp7Hs2OuFUF
 boZeL5akkfU/5gvYj5CbHftCbDOExC0ehAQB9neo=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08FJ6HI8060486
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Sep 2020 14:06:17 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Sep 2020 14:06:17 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Sep 2020 14:06:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08FJ6HpF008040;
 Tue, 15 Sep 2020 14:06:17 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>,
 <robh+dt@kernel.org>
Subject: [PATCH 2/6] ASoC: tlv320adcx140: Fix BCLK inversion for DSP modes
Date: Tue, 15 Sep 2020 14:06:02 -0500
Message-ID: <20200915190606.1744-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200915190606.1744-1-dmurphy@ti.com>
References: <20200915190606.1744-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>, camel.guo@axis.com
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

Fix the BCLK inversion for DSP modes
This is how it is defined by ASoC:
 * BCLK:
 * - "normal" polarity means signal is available at rising edge of BCLK
 * - "inverted" polarity means signal is available at falling edge of BCLK

The adcx140 defines the BCLK edge based on coding type.
The PCM (DSP_A/B) should drive on rising and sample on falling edge, so
from ASoC pov, it is IB_NF. But from the codec pov if it is configured in
DSP mode, then the BCLK should not be inverted, defaults to the coding
standard.

For i2s, it is NB_NF from ASoC pov (drive on falling, sample on rising).
From the codec's pov BCLK should not invert either, as this is the default
for the coding.

So, inversion must take the format into account:
IB_NF + DSP_A/B == the codec bclk inversion should be disabled
NB_NF + DSP_A/B == the codec bclk inversion should be enabled
NB_NF + I2S == the codec bclk inversion should be disabled

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 sound/soc/codecs/tlv320adcx140.c | 44 +++++++++++++++++---------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index 3909c1cf52be..73d18e8002e4 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -673,7 +673,7 @@ static int adcx140_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	u8 iface_reg1 = 0;
 	u8 iface_reg2 = 0;
 	int offset = 0;
-	int width = adcx140->slot_width;
+	bool inverted_bclk = false;
 
 	/* set master/slave audio interface */
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
@@ -689,24 +689,6 @@ static int adcx140_set_dai_fmt(struct snd_soc_dai *codec_dai,
 		return -EINVAL;
 	}
 
-	/* signal polarity */
-	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
-	case SND_SOC_DAIFMT_NB_IF:
-		iface_reg1 |= ADCX140_FSYNCINV_BIT;
-		break;
-	case SND_SOC_DAIFMT_IB_IF:
-		iface_reg1 |= ADCX140_BCLKINV_BIT | ADCX140_FSYNCINV_BIT;
-		break;
-	case SND_SOC_DAIFMT_IB_NF:
-		iface_reg1 |= ADCX140_BCLKINV_BIT;
-		break;
-	case SND_SOC_DAIFMT_NB_NF:
-		break;
-	default:
-		dev_err(component->dev, "Invalid DAI clock signal polarity\n");
-		return -EINVAL;
-	}
-
 	/* interface format */
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
@@ -716,16 +698,36 @@ static int adcx140_set_dai_fmt(struct snd_soc_dai *codec_dai,
 		iface_reg1 |= ADCX140_LEFT_JUST_BIT;
 		break;
 	case SND_SOC_DAIFMT_DSP_A:
-		offset += (adcx140->tdm_delay * width + 1);
+		offset = 1;
+		inverted_bclk = true;
 		break;
 	case SND_SOC_DAIFMT_DSP_B:
-		offset += adcx140->tdm_delay * width;
+		inverted_bclk = true;
 		break;
 	default:
 		dev_err(component->dev, "Invalid DAI interface format\n");
 		return -EINVAL;
 	}
 
+	/* signal polarity */
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_IB_NF:
+	case SND_SOC_DAIFMT_IB_IF:
+		inverted_bclk = !inverted_bclk;
+		break;
+	case SND_SOC_DAIFMT_NB_IF:
+		iface_reg1 |= ADCX140_FSYNCINV_BIT;
+		break;
+	case SND_SOC_DAIFMT_NB_NF:
+		break;
+	default:
+		dev_err(component->dev, "Invalid DAI clock signal polarity\n");
+		return -EINVAL;
+	}
+
+	if (inverted_bclk)
+		iface_reg1 |= ADCX140_BCLKINV_BIT;
+
 	adcx140->dai_fmt = fmt & SND_SOC_DAIFMT_FORMAT_MASK;
 
 	adcx140_pwr_ctrl(adcx140, false);
-- 
2.28.0

