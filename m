Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87819255962
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 13:31:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57E4A185B;
	Fri, 28 Aug 2020 13:30:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57E4A185B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598614260;
	bh=r0auWt1WLe3bPMB8HsfLvODhQKFzRQ6uKSJCYvvsEMA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=unNYkSVv8ExEpI+asF+mq+KgZmycGhdfHXSmEM/DrN99IbDFEpg682TpvPJc0skic
	 UJD+q8sCTgF0nN/o5N9hIesFS6koWGdYd9Zff/AvZtIDo16Xe5G/kc51cm2aAEd565
	 Ccz8BnafGJhOAoXKiQ2qTVAqd06/sevJbLI7p7g8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70EF1F801D9;
	Fri, 28 Aug 2020 13:29:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E8B0F8016F; Fri, 28 Aug 2020 13:29:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 827B3F800EB
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 13:28:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 827B3F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qWvhfPBP"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07SBSubY057960;
 Fri, 28 Aug 2020 06:28:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1598614136;
 bh=K6J1dxqpyjkqrS/MebKa8sgd6/5VHr1CiLNX3jpx7pw=;
 h=From:To:CC:Subject:Date;
 b=qWvhfPBPFpUdwKJGs7+w7SHCWETcn124eVl+LPdMUmLNya2liW/NM8mAwMbM1wprG
 zioL7jtMPyJ7cbuhOP2ENK+lBv1rtBfTcZjwrlZhgyaujt/wxgFfNi5F5t4yLn33Xu
 jnCNEN0QFrpeySO3fchJ9ljMo9zkedIF7AjfY0E4=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07SBSuas117700
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 28 Aug 2020 06:28:56 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 28
 Aug 2020 06:28:56 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 28 Aug 2020 06:28:56 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07SBStBb116292;
 Fri, 28 Aug 2020 06:28:55 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <robh@kernel.org>
Subject: [PATCH] ASoC: tlv320adcx140: Add digital mic channel enable routing
Date: Fri, 28 Aug 2020 06:28:55 -0500
Message-ID: <20200828112855.10112-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
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

Add the audio routing map to enable the digital mic paths when the
analog mic paths are not enabled.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 sound/soc/codecs/tlv320adcx140.c | 37 ++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index 5cd50d841177..5d1b2a03f0ac 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -412,6 +412,16 @@ static const struct snd_soc_dapm_widget adcx140_dapm_widgets[] = {
 	SND_SOC_DAPM_ADC("CH3_ADC", "CH3 Capture", ADCX140_IN_CH_EN, 5, 0),
 	SND_SOC_DAPM_ADC("CH4_ADC", "CH4 Capture", ADCX140_IN_CH_EN, 4, 0),
 
+	SND_SOC_DAPM_ADC("CH1_DIG", "CH1 Capture", ADCX140_IN_CH_EN, 7, 0),
+	SND_SOC_DAPM_ADC("CH2_DIG", "CH2 Capture", ADCX140_IN_CH_EN, 6, 0),
+	SND_SOC_DAPM_ADC("CH3_DIG", "CH3 Capture", ADCX140_IN_CH_EN, 5, 0),
+	SND_SOC_DAPM_ADC("CH4_DIG", "CH4 Capture", ADCX140_IN_CH_EN, 4, 0),
+	SND_SOC_DAPM_ADC("CH5_DIG", "CH5 Capture", ADCX140_IN_CH_EN, 3, 0),
+	SND_SOC_DAPM_ADC("CH6_DIG", "CH6 Capture", ADCX140_IN_CH_EN, 2, 0),
+	SND_SOC_DAPM_ADC("CH7_DIG", "CH7 Capture", ADCX140_IN_CH_EN, 1, 0),
+	SND_SOC_DAPM_ADC("CH8_DIG", "CH8 Capture", ADCX140_IN_CH_EN, 0, 0),
+
+
 	SND_SOC_DAPM_SWITCH("CH1_ASI_EN", SND_SOC_NOPM, 0, 0,
 			    &adcx140_dapm_ch1_en_switch),
 	SND_SOC_DAPM_SWITCH("CH2_ASI_EN", SND_SOC_NOPM, 0, 0,
@@ -470,6 +480,15 @@ static const struct snd_soc_dapm_route adcx140_audio_map[] = {
 	{"CH3_ASI_EN", "Switch", "CH3_ADC"},
 	{"CH4_ASI_EN", "Switch", "CH4_ADC"},
 
+	{"CH1_ASI_EN", "Switch", "CH1_DIG"},
+	{"CH2_ASI_EN", "Switch", "CH2_DIG"},
+	{"CH3_ASI_EN", "Switch", "CH3_DIG"},
+	{"CH4_ASI_EN", "Switch", "CH4_DIG"},
+	{"CH5_ASI_EN", "Switch", "CH5_DIG"},
+	{"CH6_ASI_EN", "Switch", "CH6_DIG"},
+	{"CH7_ASI_EN", "Switch", "CH7_DIG"},
+	{"CH8_ASI_EN", "Switch", "CH8_DIG"},
+
 	{"CH5_ASI_EN", "Switch", "CH5_OUT"},
 	{"CH6_ASI_EN", "Switch", "CH6_OUT"},
 	{"CH7_ASI_EN", "Switch", "CH7_OUT"},
@@ -541,6 +560,15 @@ static const struct snd_soc_dapm_route adcx140_audio_map[] = {
 	{"PDM Clk Div Select", "705.6 kHz", "MIC1P Input Mux"},
 	{"PDM Clk Div Select", "5.6448 MHz", "MIC1P Input Mux"},
 
+	{"MIC1P Input Mux", NULL, "CH1_DIG"},
+	{"MIC1M Input Mux", NULL, "CH2_DIG"},
+	{"MIC2P Input Mux", NULL, "CH3_DIG"},
+	{"MIC2M Input Mux", NULL, "CH4_DIG"},
+	{"MIC3P Input Mux", NULL, "CH5_DIG"},
+	{"MIC3M Input Mux", NULL, "CH6_DIG"},
+	{"MIC4P Input Mux", NULL, "CH7_DIG"},
+	{"MIC4M Input Mux", NULL, "CH8_DIG"},
+
 	{"MIC1 Analog Mux", "Line In", "MIC1P"},
 	{"MIC2 Analog Mux", "Line In", "MIC2P"},
 	{"MIC3 Analog Mux", "Line In", "MIC3P"},
@@ -554,6 +582,15 @@ static const struct snd_soc_dapm_route adcx140_audio_map[] = {
 	{"MIC3M Input Mux", "Analog", "MIC3M"},
 	{"MIC4P Input Mux", "Analog", "MIC4P"},
 	{"MIC4M Input Mux", "Analog", "MIC4M"},
+
+	{"MIC1P Input Mux", "Digital", "MIC1P"},
+	{"MIC1M Input Mux", "Digital", "MIC1M"},
+	{"MIC2P Input Mux", "Digital", "MIC2P"},
+	{"MIC2M Input Mux", "Digital", "MIC2M"},
+	{"MIC3P Input Mux", "Digital", "MIC3P"},
+	{"MIC3M Input Mux", "Digital", "MIC3M"},
+	{"MIC4P Input Mux", "Digital", "MIC4P"},
+	{"MIC4M Input Mux", "Digital", "MIC4M"},
 };
 
 static const struct snd_kcontrol_new adcx140_snd_controls[] = {
-- 
2.28.0

