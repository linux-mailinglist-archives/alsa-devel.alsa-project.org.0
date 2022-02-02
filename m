Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC56C4A7628
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Feb 2022 17:47:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A438166B;
	Wed,  2 Feb 2022 17:46:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A438166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643820427;
	bh=1OLSLTBGS8vmp72x0nbsVxN4hYeSQmPp5cntNhuFq1c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=R2an/PVK/DFrToe9gJjLgXXIcOwkfM5C2h3fJgGAKg4hpJDUT1FW0kcMKuXdQwACF
	 vFqOLyDY4eJa9fP12I164wXew1xuVg0NkJJcvbnxfLcBIljNoExa7bjynux25Q4xGB
	 xohkoHKXiOaQR1OaOBzdrdClN6QQcPplIYsan2J8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9670DF80095;
	Wed,  2 Feb 2022 17:46:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A07FF804B0; Wed,  2 Feb 2022 17:45:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C215F80095
 for <alsa-devel@alsa-project.org>; Wed,  2 Feb 2022 17:45:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C215F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="YOVfJ0zd"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 212GAUu0005105;
 Wed, 2 Feb 2022 10:45:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=Nlx3Zm9MfzgvM5SG4Ylhe+koqwOdfIQcc1dECMZk/KU=;
 b=YOVfJ0zdsE8ZpgcIBzsKRaCTMVK4q5O8RwHuLSZ/4ivsQvdjzVGaQhIfZMxMqJ01aAZ3
 RdPHKXhHJNCH2lnczjljPkv4yflXCbQzvUOfy0p3p8yTxPmxPh+LeYpna8UcloQFvkvX
 lvg+6yNcHy3Kz132SM8XRR2omk5zylXSArE7xc6oeFVyhdaD47hE4gS/86DDJObnjlB5
 VjCpMCamPVKsjlnmF4cO24AizE2vFRFRpeyrPkzTYq0MH5nKEfby2CYHtujZ0BcL5MaG
 MfGME6bjDC/6TEAKtjfLCT2Trh2zv+kAHiQi/M3wRKKq1byBt/tufXXO652mYjYTkiCE oA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3dyw8cg165-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 02 Feb 2022 10:45:47 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 2 Feb
 2022 16:45:45 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Wed, 2 Feb 2022 16:45:45 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DF34D11D7;
 Wed,  2 Feb 2022 16:45:45 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: wm8962: Allow switching between analog and digital
 inputs
Date: Wed, 2 Feb 2022 16:45:45 +0000
Message-ID: <20220202164545.30457-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: UVfUpr8w-bxAbuHgCW24JGA7ehOzxRwc
X-Proofpoint-ORIG-GUID: UVfUpr8w-bxAbuHgCW24JGA7ehOzxRwc
X-Proofpoint-Spam-Reason: safe
Cc: martin.kepplinger@puri.sm, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, shengjiu.wang@nxp.com, lgirdwood@gmail.com,
 daniel.baluta@nxp.com
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

When the DMIC_ENA bit is set the analogue inputs are disconnected from
the digital core of the chip, in favour of the digital microphones.
Currently the driver will always enable DMIC_ENA whilst the GPIOs are
configured for the DMIC function, this means the user can't currently
use both the analog inputs and the digital inputs in one system.

Add an additional DAPM mutex that allows switching between analog and
digital inputs into the digital core.

Reported-by: Martin Kepplinger <martin.kepplinger@puri.sm>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/wm8962.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index a5584ba962dcf..2c41d31956aa8 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -2049,6 +2049,13 @@ static SOC_ENUM_SINGLE_DECL(hpoutl_enum,
 static const struct snd_kcontrol_new hpoutl_mux =
 	SOC_DAPM_ENUM("HPOUTL Mux", hpoutl_enum);
 
+static const char * const input_mode_text[] = { "Analog", "Digital" };
+
+static SOC_ENUM_SINGLE_VIRT_DECL(input_mode_enum, input_mode_text);
+
+static const struct snd_kcontrol_new input_mode_mux =
+	SOC_DAPM_ENUM("Input Mode", input_mode_enum);
+
 static const struct snd_kcontrol_new inpgal[] = {
 SOC_DAPM_SINGLE("IN1L Switch", WM8962_LEFT_INPUT_PGA_CONTROL, 3, 1, 0),
 SOC_DAPM_SINGLE("IN2L Switch", WM8962_LEFT_INPUT_PGA_CONTROL, 2, 1, 0),
@@ -2147,6 +2154,9 @@ SND_SOC_DAPM_MIXER("MIXINR", WM8962_PWR_MGMT_1, 4, 0,
 
 SND_SOC_DAPM_AIF_IN("DMIC_ENA", NULL, 0, WM8962_PWR_MGMT_1, 10, 0),
 
+SND_SOC_DAPM_MUX("Input Mode L", SND_SOC_NOPM, 0, 0, &input_mode_mux),
+SND_SOC_DAPM_MUX("Input Mode R", SND_SOC_NOPM, 0, 0, &input_mode_mux),
+
 SND_SOC_DAPM_ADC("ADCL", "Capture", WM8962_PWR_MGMT_1, 3, 0),
 SND_SOC_DAPM_ADC("ADCR", "Capture", WM8962_PWR_MGMT_1, 2, 0),
 
@@ -2226,16 +2236,19 @@ static const struct snd_soc_dapm_route wm8962_intercon[] = {
 
 	{ "DMIC_ENA", NULL, "DMICDAT" },
 
+	{ "Input Mode L", "Analog", "MIXINL" },
+	{ "Input Mode L", "Digital", "DMIC_ENA" },
+	{ "Input Mode R", "Analog", "MIXINR" },
+	{ "Input Mode R", "Digital", "DMIC_ENA" },
+
 	{ "ADCL", NULL, "SYSCLK" },
 	{ "ADCL", NULL, "TOCLK" },
-	{ "ADCL", NULL, "MIXINL" },
-	{ "ADCL", NULL, "DMIC_ENA" },
+	{ "ADCL", NULL, "Input Mode L" },
 	{ "ADCL", NULL, "DSP2" },
 
 	{ "ADCR", NULL, "SYSCLK" },
 	{ "ADCR", NULL, "TOCLK" },
-	{ "ADCR", NULL, "MIXINR" },
-	{ "ADCR", NULL, "DMIC_ENA" },
+	{ "ADCR", NULL, "Input Mode R" },
 	{ "ADCR", NULL, "DSP2" },
 
 	{ "STL", "Left", "ADCL" },
-- 
2.11.0

