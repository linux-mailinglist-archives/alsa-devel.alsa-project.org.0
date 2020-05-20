Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 570371DABF1
	for <lists+alsa-devel@lfdr.de>; Wed, 20 May 2020 09:24:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3CD017B8;
	Wed, 20 May 2020 09:23:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3CD017B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589959486;
	bh=86UqdHarucCAnlJEZGFY34/eN4yMg0qC+nkN10Sir0w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aKJTfIAYLJed225UpPrRALHVzAMEKS8RJZXhHm5LtKcjzc6MHzkCNv5aBGyQVocq/
	 05LidtjP+raEWh/jPEmYyrY5vxwiKpEzjSnAktGea0Y6Ukg07qeLnW2NsaSQ5Msxeg
	 UrGoGCLcSYmd5jq3sLrqRk0TGARv3SuqaDxHvbIU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69E78F8028F;
	Wed, 20 May 2020 09:21:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A4B2F8028F; Wed, 20 May 2020 09:21:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34810F80213
 for <alsa-devel@alsa-project.org>; Wed, 20 May 2020 09:21:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34810F80213
IronPort-SDR: d5Qcz4RE0Ijv+ViZ7b3ze/SnGsRl7oYPEOroYadehCk9ocPVGAvFCv4ggJSQh4vkOeyA8gd4DP
 jIbQNrVNRPj/arPe3qA3hDRuaszinOPcGk3Xt8+aE77sP8zTFR4u+kqbpTASWTURtZjO1nyQRy
 pM1qaf8SmqbI3Ymo8JHqnYA2pPuLgUTGXy/Ut7fLBOpQ/SohvV0j6wNGWk6pPRJpMzCrlOcBb8
 G9vgPWaLB0iXypCA4v1gffet+ZcWnjJJLf3PongImwUomvZsDzJ0M9oO2MDOS/iQ/7kTd23lf5
 LW0=
X-IronPort-AV: E=Sophos;i="5.73,413,1583190000"; 
   d="scan'208";a="8907989"
From: Pavel Dobias <dobias@2n.cz>
To: <alsa-devel@alsa-project.org>
Subject: [PATCH 6/6] ASoC: max9867: add digital microphone controls
Date: Wed, 20 May 2020 09:19:04 +0200
Message-ID: <20200520071904.15801-6-dobias@2n.cz>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200520071904.15801-1-dobias@2n.cz>
References: <20200520071904.15801-1-dobias@2n.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX04.axis.com (10.0.5.18) To XBOX04.axis.com (10.0.5.18)
Cc: broonie@kernel.org, ladis@linux-mips.org, Pavel Dobias <dobias@2n.cz>
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

MAX9867 codec has a possibility of connecting digital microphones.
Add DAPM controls to be able to enable them.

Signed-off-by: Pavel Dobias <dobias@2n.cz>
---
 sound/soc/codecs/max9867.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/max9867.c b/sound/soc/codecs/max9867.c
index 902b1387b797..1946dcfa48e1 100644
--- a/sound/soc/codecs/max9867.c
+++ b/sound/soc/codecs/max9867.c
@@ -104,10 +104,24 @@ static const struct snd_kcontrol_new max9867_line_out_control =
 	SOC_DAPM_DOUBLE_R("Switch",
 			  MAX9867_LEFTVOL, MAX9867_RIGHTVOL, 6, 1, 1);
 
+/* DMIC mux */
+static const char *const dmic_mux_text[] = {
+	"ADC", "DMIC"
+};
+static SOC_ENUM_SINGLE_DECL(left_dmic_mux_enum,
+			    MAX9867_MICCONFIG, 5, dmic_mux_text);
+static SOC_ENUM_SINGLE_DECL(right_dmic_mux_enum,
+			    MAX9867_MICCONFIG, 4, dmic_mux_text);
+static const struct snd_kcontrol_new max9867_left_dmic_mux =
+	SOC_DAPM_ENUM("DMICL Mux", left_dmic_mux_enum);
+static const struct snd_kcontrol_new max9867_right_dmic_mux =
+	SOC_DAPM_ENUM("DMICR Mux", right_dmic_mux_enum);
 
 static const struct snd_soc_dapm_widget max9867_dapm_widgets[] = {
 	SND_SOC_DAPM_INPUT("MICL"),
 	SND_SOC_DAPM_INPUT("MICR"),
+	SND_SOC_DAPM_INPUT("DMICL"),
+	SND_SOC_DAPM_INPUT("DMICR"),
 	SND_SOC_DAPM_INPUT("LINL"),
 	SND_SOC_DAPM_INPUT("LINR"),
 
@@ -116,6 +130,10 @@ static const struct snd_soc_dapm_widget max9867_dapm_widgets[] = {
 	SND_SOC_DAPM_MIXER_NAMED_CTL("Input Mixer", SND_SOC_NOPM, 0, 0,
 				     max9867_input_mixer_controls,
 				     ARRAY_SIZE(max9867_input_mixer_controls)),
+	SND_SOC_DAPM_MUX("DMICL Mux", SND_SOC_NOPM, 0, 0,
+			 &max9867_left_dmic_mux),
+	SND_SOC_DAPM_MUX("DMICR Mux", SND_SOC_NOPM, 0, 0,
+			 &max9867_right_dmic_mux),
 	SND_SOC_DAPM_ADC("ADCL", "HiFi Capture", SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_ADC("ADCR", "HiFi Capture", SND_SOC_NOPM, 0, 0),
 
@@ -140,8 +158,12 @@ static const struct snd_soc_dapm_route max9867_audio_map[] = {
 	{"Input Mixer", "Mic Capture Switch", "MICR"},
 	{"Input Mixer", "Line Capture Switch", "Left Line Input"},
 	{"Input Mixer", "Line Capture Switch", "Right Line Input"},
-	{"ADCL", NULL, "Input Mixer"},
-	{"ADCR", NULL, "Input Mixer"},
+	{"DMICL Mux", "DMIC", "DMICL"},
+	{"DMICR Mux", "DMIC", "DMICR"},
+	{"DMICL Mux", "ADC", "Input Mixer"},
+	{"DMICR Mux", "ADC", "Input Mixer"},
+	{"ADCL", NULL, "DMICL Mux"},
+	{"ADCR", NULL, "DMICR Mux"},
 
 	{"Digital", "Sidetone Switch", "ADCL"},
 	{"Digital", "Sidetone Switch", "ADCR"},
-- 
2.20.1

