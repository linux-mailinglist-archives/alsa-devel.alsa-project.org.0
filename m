Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE74C21A756
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 20:53:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B0191612;
	Thu,  9 Jul 2020 20:52:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B0191612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594320815;
	bh=m4jJFPhxyEMKTNH+uW48s4LyrJrb71c7eBieh8N1beQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fyLGwLb+wmeBUXqOFzOKUpX8faZXrAi2+Tle55vG89M/1HbQSTd+JhkcFP2DqnBOL
	 Cgd/0ir/3VGDtNFC7S8bf8UqqvC7+SKxhAvPa94i/ipW5wfXckr0d0qCYDdxkyHrpf
	 ESCwF3q2solNfZJdnl31ZDO5VzZy1mnEqYirdrIY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26D77F80255;
	Thu,  9 Jul 2020 20:51:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3030F80257; Thu,  9 Jul 2020 20:51:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABD69F8011F
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 20:51:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABD69F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fzsXfH7d"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 069IpZP8081572;
 Thu, 9 Jul 2020 13:51:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1594320695;
 bh=kVHUj/pUhDJLhp9BWExKzyYt8MAbgZ/5AWHDTvmTgUk=;
 h=From:To:CC:Subject:Date;
 b=fzsXfH7dcMl1VpeFcbpPS0nXJIQ4lYEewH+0B3NOEV8MFc2IIY6onyw90xIYxw3lt
 M5qpLVI19goRAVff0xebiNhyO/lVJEXu6gwqehcGudDEaXVG3U7rvnXUZqMZVzJBl9
 hIIGQXrd2Jqh//sPCQiLRcJBhcmccQZ8yWdUytVw=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 069IpZjh121764;
 Thu, 9 Jul 2020 13:51:35 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 9 Jul
 2020 13:51:34 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 9 Jul 2020 13:51:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 069IpYBB009610;
 Thu, 9 Jul 2020 13:51:34 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH 1/2] ASoC: tlv320adcx140: Add ASI enable for channel 5-8
Date: Thu, 9 Jul 2020 13:51:28 -0500
Message-ID: <20200709185129.10505-1-dmurphy@ti.com>
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

Add the ALSA controls to enable the ASI for channels 5-8

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 sound/soc/codecs/tlv320adcx140.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index 35fe8ee5bce9..f884abdb576e 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -313,6 +313,14 @@ static const struct snd_kcontrol_new adcx140_dapm_ch3_en_switch =
 	SOC_DAPM_SINGLE("Switch", ADCX140_ASI_OUT_CH_EN, 5, 1, 0);
 static const struct snd_kcontrol_new adcx140_dapm_ch4_en_switch =
 	SOC_DAPM_SINGLE("Switch", ADCX140_ASI_OUT_CH_EN, 4, 1, 0);
+static const struct snd_kcontrol_new adcx140_dapm_ch5_en_switch =
+	SOC_DAPM_SINGLE("Switch", ADCX140_ASI_OUT_CH_EN, 3, 1, 0);
+static const struct snd_kcontrol_new adcx140_dapm_ch6_en_switch =
+	SOC_DAPM_SINGLE("Switch", ADCX140_ASI_OUT_CH_EN, 2, 1, 0);
+static const struct snd_kcontrol_new adcx140_dapm_ch7_en_switch =
+	SOC_DAPM_SINGLE("Switch", ADCX140_ASI_OUT_CH_EN, 1, 1, 0);
+static const struct snd_kcontrol_new adcx140_dapm_ch8_en_switch =
+	SOC_DAPM_SINGLE("Switch", ADCX140_ASI_OUT_CH_EN, 0, 1, 0);
 
 static const struct snd_kcontrol_new adcx140_dapm_ch1_dre_en_switch =
 	SOC_DAPM_SINGLE("Switch", ADCX140_CH1_CFG0, 0, 1, 0);
@@ -406,6 +414,15 @@ static const struct snd_soc_dapm_widget adcx140_dapm_widgets[] = {
 	SND_SOC_DAPM_SWITCH("CH4_ASI_EN", SND_SOC_NOPM, 0, 0,
 			    &adcx140_dapm_ch4_en_switch),
 
+	SND_SOC_DAPM_SWITCH("CH5_ASI_EN", SND_SOC_NOPM, 0, 0,
+			    &adcx140_dapm_ch5_en_switch),
+	SND_SOC_DAPM_SWITCH("CH6_ASI_EN", SND_SOC_NOPM, 0, 0,
+			    &adcx140_dapm_ch6_en_switch),
+	SND_SOC_DAPM_SWITCH("CH7_ASI_EN", SND_SOC_NOPM, 0, 0,
+			    &adcx140_dapm_ch7_en_switch),
+	SND_SOC_DAPM_SWITCH("CH8_ASI_EN", SND_SOC_NOPM, 0, 0,
+			    &adcx140_dapm_ch8_en_switch),
+
 	SND_SOC_DAPM_SWITCH("DRE_ENABLE", SND_SOC_NOPM, 0, 0,
 			    &adcx140_dapm_dre_en_switch),
 
@@ -446,6 +463,11 @@ static const struct snd_soc_dapm_route adcx140_audio_map[] = {
 	{"CH3_ASI_EN", "Switch", "CH3_ADC"},
 	{"CH4_ASI_EN", "Switch", "CH4_ADC"},
 
+	{"CH5_ASI_EN", "Switch", "CH5_OUT"},
+	{"CH6_ASI_EN", "Switch", "CH6_OUT"},
+	{"CH7_ASI_EN", "Switch", "CH7_OUT"},
+	{"CH8_ASI_EN", "Switch", "CH8_OUT"},
+
 	{"Decimation Filter", "Linear Phase", "DRE_ENABLE"},
 	{"Decimation Filter", "Low Latency", "DRE_ENABLE"},
 	{"Decimation Filter", "Ultra-low Latency", "DRE_ENABLE"},
-- 
2.27.0

