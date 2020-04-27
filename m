Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D631BAFA9
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 22:44:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7ACF168C;
	Mon, 27 Apr 2020 22:43:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7ACF168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588020239;
	bh=u653IUXh3zj5cB7zfcD5riRt9iiLON0pUv7R7iQePwQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Hq5X81yloubjAIxp73PY7amjgCo91HO0nEMyjKgAZTpjuNLFWsjobyj3leEionw7I
	 GS0e0XzimEsmMlZFh+enqYxtSuPTs+9lctr2MVMJEyKruweNM1uC3eJCkbH0y91Ogo
	 ZwAICDA1cUnRTEYB+bxWs9zLg3myJnrEuDwJqFPw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2E1BF80112;
	Mon, 27 Apr 2020 22:42:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8086AF8022B; Mon, 27 Apr 2020 22:42:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34645F80112
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 22:42:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34645F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="noKuBg1N"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03RKg7ao016845;
 Mon, 27 Apr 2020 15:42:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1588020127;
 bh=lsXYqzJZ87/b6MFwb+B5fUGJvdO4PlNLviGnIO0YnAo=;
 h=From:To:CC:Subject:Date;
 b=noKuBg1NElWkIauG42saatFVPHdxtBT6s7C7V9rBxs1bD2QpLjquLnhOTElNvrbdb
 pz36GfwWTSnnxJoHkFP4+VD97M4nE1PwA19O+niyJZUBTrJG6i+6QjqKGI/t5oUWq3
 HRTL76pFRPgpFPGtefghQpe3rRaUbV1z6SxWENI8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03RKg7Yf070719;
 Mon, 27 Apr 2020 15:42:07 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 27
 Apr 2020 15:42:07 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 27 Apr 2020 15:42:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03RKg7gb098139;
 Mon, 27 Apr 2020 15:42:07 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH] ASoC: tlv320adcx140: Fix mic gain registers
Date: Mon, 27 Apr 2020 15:36:08 -0500
Message-ID: <20200427203608.7031-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
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

Fix the mic gain registers for channels 2-4.
The incorret register was being set as it was touching the CH1 config
registers.

Fixes: 37bde5acf040 ("ASoC: tlv320adcx140: Add the tlv320adcx140 codec driver family")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 sound/soc/codecs/tlv320adcx140.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index 38897568ee96..0f713efde046 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -511,11 +511,11 @@ static const struct snd_soc_dapm_route adcx140_audio_map[] = {
 static const struct snd_kcontrol_new adcx140_snd_controls[] = {
 	SOC_SINGLE_TLV("Analog CH1 Mic Gain Volume", ADCX140_CH1_CFG1, 2, 42, 0,
 			adc_tlv),
-	SOC_SINGLE_TLV("Analog CH2 Mic Gain Volume", ADCX140_CH1_CFG2, 2, 42, 0,
+	SOC_SINGLE_TLV("Analog CH2 Mic Gain Volume", ADCX140_CH2_CFG1, 2, 42, 0,
 			adc_tlv),
-	SOC_SINGLE_TLV("Analog CH3 Mic Gain Volume", ADCX140_CH1_CFG3, 2, 42, 0,
+	SOC_SINGLE_TLV("Analog CH3 Mic Gain Volume", ADCX140_CH3_CFG1, 2, 42, 0,
 			adc_tlv),
-	SOC_SINGLE_TLV("Analog CH4 Mic Gain Volume", ADCX140_CH1_CFG4, 2, 42, 0,
+	SOC_SINGLE_TLV("Analog CH4 Mic Gain Volume", ADCX140_CH4_CFG1, 2, 42, 0,
 			adc_tlv),
 
 	SOC_SINGLE_TLV("DRE Threshold", ADCX140_DRE_CFG0, 4, 9, 0,
-- 
2.25.1

