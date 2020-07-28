Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9DF23100A
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jul 2020 18:45:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A42F170E;
	Tue, 28 Jul 2020 18:44:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A42F170E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595954742;
	bh=EyH5KZ/u4sjimRw6RW29SPh18agPcQjEPE2ZcZoWaBA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DlTFIIjbVcil1cU5KMEUGEc+J2KIKwvKV8HzLDGGNmpWNIC1gTj9g6mvT+VIW/O3l
	 9TJAaUEIOQ286RbX/u+tumPMR4NcVR68W7bv8JZg7Azo67R1/1v+eyB0LUYQieU48l
	 E00ZFGtaaVlol7nfE2pb3on+GDhUJzysKW0pEJ2k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8188EF8012F;
	Tue, 28 Jul 2020 18:44:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8032F8021E; Tue, 28 Jul 2020 18:43:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50AF3F800AD
 for <alsa-devel@alsa-project.org>; Tue, 28 Jul 2020 18:43:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50AF3F800AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GsxHbf/V"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06SGhjX5011284;
 Tue, 28 Jul 2020 11:43:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1595954625;
 bh=jdKE6zp5yHn3EXrC6YzjiSN2SMWcYzGzcRo94VExG04=;
 h=From:To:CC:Subject:Date;
 b=GsxHbf/Vhiz/kQkg7HJD+yIGBIyujCrnwfv30wckn2JXpWcLvTrhjHlapqqPm0RPV
 XbtIicT1OO1lDKqVMGwH84aowDsIrfjfSpTsNsVba7iLiJ8HzsB6TyVWDBLJMPPrCl
 wUfB/8qTLcaDtGKSPnyl/4daiW384d7IMJ1qRaOM=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06SGhjmV065653
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 Jul 2020 11:43:45 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 28
 Jul 2020 11:43:45 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 28 Jul 2020 11:43:45 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06SGhjQi011670;
 Tue, 28 Jul 2020 11:43:45 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH] ASoC: tlv320adcx140: Fix various style errors and warnings
Date: Tue, 28 Jul 2020 11:43:39 -0500
Message-ID: <20200728164339.16841-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
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

Fix white space issues and remove else case where it was not needed.
Convert "static const char *" to "static const char * const"

Fixes: 689c7655b50 ("ASoC: tlv320adcx140: Add the tlv320adcx140 codec driver family")
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 sound/soc/codecs/tlv320adcx140.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index 49dcdd72e5c6..938c5ef17e61 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -218,8 +218,8 @@ static const struct snd_kcontrol_new in4_resistor_controls[] = {
 };
 
 /* Analog/Digital Selection */
-static const char *adcx140_mic_sel_text[] = {"Analog", "Line In", "Digital"};
-static const char *adcx140_analog_sel_text[] = {"Analog", "Line In"};
+static const char * const adcx140_mic_sel_text[] = {"Analog", "Line In", "Digital"};
+static const char * const adcx140_analog_sel_text[] = {"Analog", "Line In"};
 
 static SOC_ENUM_SINGLE_DECL(adcx140_mic1p_enum,
 			    ADCX140_CH1_CFG0, 5,
@@ -598,7 +598,7 @@ static int adcx140_reset(struct adcx140_priv *adcx140)
 		gpiod_direction_output(adcx140->gpio_reset, 1);
 	} else {
 		ret = regmap_write(adcx140->regmap, ADCX140_SW_RESET,
-		          ADCX140_RESET);
+				   ADCX140_RESET);
 	}
 
 	/* 8.4.2: wait >= 10 ms after entering sleep mode. */
@@ -841,7 +841,7 @@ static int adcx140_codec_probe(struct snd_soc_component *component)
 	if (ret)
 		goto out;
 
-	if(adcx140->supply_areg == NULL)
+	if (adcx140->supply_areg == NULL)
 		sleep_cfg_val |= ADCX140_AREG_INTERNAL;
 
 	ret = regmap_write(adcx140->regmap, ADCX140_SLEEP_CFG, sleep_cfg_val);
@@ -942,8 +942,8 @@ static int adcx140_i2c_probe(struct i2c_client *i2c,
 	if (IS_ERR(adcx140->supply_areg)) {
 		if (PTR_ERR(adcx140->supply_areg) == -EPROBE_DEFER)
 			return -EPROBE_DEFER;
-		else
-			adcx140->supply_areg = NULL;
+
+		adcx140->supply_areg = NULL;
 	} else {
 		ret = regulator_enable(adcx140->supply_areg);
 		if (ret) {
-- 
2.28.0

