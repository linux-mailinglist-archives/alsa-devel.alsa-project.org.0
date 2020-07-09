Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BBF21A757
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 20:54:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4FDC1661;
	Thu,  9 Jul 2020 20:53:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4FDC1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594320862;
	bh=Tq5H8+8pN1gTTI1kDn7fUaE9IK2j9ZCmjTYHN7aCOYM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lwAFypqs1RB2kkV2rCUiNAcGWxPVAmEOL0vSo0Tf+wN7AY1ttKb7Ce/96MxX7RJvD
	 UA1PkOjtBj34kCYyVbZF2ih3kPIt23xnexDcZyQIAj3tCaInfKKZz5kmYVMCnzWw3b
	 LSGb2tjmUqJ2WKUTOcrrrs6Kp51jL7h4w5o9XhKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FACCF80274;
	Thu,  9 Jul 2020 20:51:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15FBDF801F9; Thu,  9 Jul 2020 20:51:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4971DF801F9
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 20:51:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4971DF801F9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QhS++ITn"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 069IpeZp058636;
 Thu, 9 Jul 2020 13:51:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1594320700;
 bh=GtWtWQHKdBXB3CLNnasO+bNWYTz+NerPnNTBio+tRkU=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=QhS++ITnV6S47j8LNZmwdw3dbtxLzP4GSKKOfA5cXwjYgSbCszdTooHYUWXpncK3W
 dqNm4Ok89JXwaT8iKBDYQsa9G3U2C60Ecff8u0pFRBqrMUijlnXWFLFq1aX7AxUCdZ
 Ei2cqFpe5MJ0aaV0iE/Ub7Wsjr2Pl7gSCnUtbKrI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 069IpeE8060318
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 9 Jul 2020 13:51:40 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 9 Jul
 2020 13:51:40 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 9 Jul 2020 13:51:40 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 069Ipdbw009667;
 Thu, 9 Jul 2020 13:51:40 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH 2/2] ASoC: tlv320adcx140: Add tx offset slot programming
Date: Thu, 9 Jul 2020 13:51:29 -0500
Message-ID: <20200709185129.10505-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200709185129.10505-1-dmurphy@ti.com>
References: <20200709185129.10505-1-dmurphy@ti.com>
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

Add the TX offset slot programming.  There is no RX offset slot
register.

Since there is no RX offset the check for slot symmetry can be removed.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 sound/soc/codecs/tlv320adcx140.c | 40 ++++++++------------------------
 1 file changed, 10 insertions(+), 30 deletions(-)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index f884abdb576e..d900af967f8c 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -646,6 +646,8 @@ static int adcx140_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	struct adcx140_priv *adcx140 = snd_soc_component_get_drvdata(component);
 	u8 iface_reg1 = 0;
 	u8 iface_reg2 = 0;
+	int offset = 0;
+	int width = adcx140->slot_width;
 
 	/* set master/slave audio interface */
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
@@ -688,7 +690,10 @@ static int adcx140_set_dai_fmt(struct snd_soc_dai *codec_dai,
 		iface_reg1 |= ADCX140_LEFT_JUST_BIT;
 		break;
 	case SND_SOC_DAIFMT_DSP_A:
+		offset += (adcx140->tdm_delay * width + 1);
+		break;
 	case SND_SOC_DAIFMT_DSP_B:
+		offset += adcx140->tdm_delay * width;
 		break;
 	default:
 		dev_err(component->dev, "Invalid DAI interface format\n");
@@ -705,6 +710,11 @@ static int adcx140_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	snd_soc_component_update_bits(component, ADCX140_MST_CFG0,
 				      ADCX140_BCLK_FSYNC_MASTER, iface_reg2);
 
+	/* Configure data offset */
+	snd_soc_component_update_bits(component, ADCX140_ASI_CFG1,
+				      ADCX140_TX_OFFSET_MASK, offset);
+
+
 	return 0;
 }
 
@@ -716,11 +726,6 @@ static int adcx140_set_dai_tdm_slot(struct snd_soc_dai *codec_dai,
 	struct adcx140_priv *adcx140 = snd_soc_component_get_drvdata(component);
 	unsigned int lsb;
 
-	if (tx_mask != rx_mask) {
-		dev_err(component->dev, "tx and rx masks must be symmetric\n");
-		return -EINVAL;
-	}
-
 	/* TDM based on DSP mode requires slots to be adjacent */
 	lsb = __ffs(tx_mask);
 	if ((lsb + 1) != __fls(tx_mask)) {
@@ -745,34 +750,9 @@ static int adcx140_set_dai_tdm_slot(struct snd_soc_dai *codec_dai,
 	return 0;
 }
 
-static int adcx140_prepare(struct snd_pcm_substream *substream,
-			 struct snd_soc_dai *dai)
-{
-	struct snd_soc_component *component = dai->component;
-	struct adcx140_priv *adcx140 = snd_soc_component_get_drvdata(component);
-	int offset = 0;
-	int width = adcx140->slot_width;
-
-	if (!width)
-		width = substream->runtime->sample_bits;
-
-	/* TDM slot selection only valid in DSP_A/_B mode */
-	if (adcx140->dai_fmt == SND_SOC_DAIFMT_DSP_A)
-		offset += (adcx140->tdm_delay * width + 1);
-	else if (adcx140->dai_fmt == SND_SOC_DAIFMT_DSP_B)
-		offset += adcx140->tdm_delay * width;
-
-	/* Configure data offset */
-	snd_soc_component_update_bits(component, ADCX140_ASI_CFG1,
-				      ADCX140_TX_OFFSET_MASK, offset);
-
-	return 0;
-}
-
 static const struct snd_soc_dai_ops adcx140_dai_ops = {
 	.hw_params	= adcx140_hw_params,
 	.set_fmt	= adcx140_set_dai_fmt,
-	.prepare	= adcx140_prepare,
 	.set_tdm_slot	= adcx140_set_dai_tdm_slot,
 };
 
-- 
2.27.0

