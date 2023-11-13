Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FA07E9B7D
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 12:54:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9119FDEB;
	Mon, 13 Nov 2023 12:53:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9119FDEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699876458;
	bh=SATDo3tdJq8o3lqyMHRjvzwyAALZZ5eaDEcLHh+gXXM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PyY9B5V5nwdyGq4Tv0AUFO2GPUhrFmjAj+4HO32iqTaBgGD2em1H0cJ9yB+/8Tr5s
	 UPtDoWeI8iBJTtR+qqSmPOyObZSOGlqHSMzd3L0jQlUPDGWlKgjGu6PH/zcMy8leMM
	 YxKheja7oRrenol5w2JCMKZqX7KwRr9A/mVL0ODs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A52AF805CB; Mon, 13 Nov 2023 12:51:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3210F805C4;
	Mon, 13 Nov 2023 12:51:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA691F80249; Mon, 13 Nov 2023 08:57:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C040F801D5
	for <alsa-devel@alsa-project.org>; Mon, 13 Nov 2023 08:56:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C040F801D5
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
Received: from 192.168.10.47
	by mg.richtek.com with MailGates ESMTPS Server V6.0(1769606:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256);
 Mon, 13 Nov 2023 15:56:18 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex4.rt.l (192.168.10.47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.27; Mon, 13 Nov
 2023 15:56:18 +0800
Received: from linuxcarl2.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1258.27 via Frontend
 Transport; Mon, 13 Nov 2023 15:56:18 +0800
From: <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>
CC: Liam Girdwood <lgirdwood@gmail.com>, Oder Chiou <oder_chiou@realtek.com>,
	ChiYuan Huang <cy_huang@richtek.com>, Allen Lin <allen_lin@richtek.com>,
	<alsa-devel@alsa-project.org>
Subject: [PATCH v1 3/3] ASoC: codecs: rtq9128: Fix E1 eng version amp on
 sequence
Date: Mon, 13 Nov 2023 15:56:16 +0800
Message-ID: <1699862176-23710-4-git-send-email-cy_huang@richtek.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1699862176-23710-1-git-send-email-cy_huang@richtek.com>
References: <1699862176-23710-1-git-send-email-cy_huang@richtek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MailFrom: prvs=1680C42439=cy_huang@richtek.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TJJASY4ZAGWF7Q5VKV5TYEFCRU2VD6I4
X-Message-ID-Hash: TJJASY4ZAGWF7Q5VKV5TYEFCRU2VD6I4
X-Mailman-Approved-At: Mon, 13 Nov 2023 11:51:21 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TJJASY4ZAGWF7Q5VKV5TYEFCRU2VD6I4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: ChiYuan Huang <cy_huang@richtek.com>

For E1 eng sample, there's the current bias issue. Some undocumented RGs
should be runtime controlled during the DAPM flow to prevent the
abnormal false alarm protection latchup.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 sound/soc/codecs/rtq9128.c | 57 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 54 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rtq9128.c b/sound/soc/codecs/rtq9128.c
index aa3eadecd974..b1b889cbbc6f 100644
--- a/sound/soc/codecs/rtq9128.c
+++ b/sound/soc/codecs/rtq9128.c
@@ -63,6 +63,7 @@ struct rtq9128_data {
 	int tdm_slots;
 	int tdm_slot_width;
 	bool tdm_input_data2_select;
+	bool tka470b_e1_ver;
 };
 
 struct rtq9128_init_reg {
@@ -171,7 +172,7 @@ static bool rtq9128_is_writeable_reg(struct device *dev, unsigned int reg)
 	case 0x80 ... 0x8B:
 	case 0xA0 ... 0xAD:
 	case 0xB0 ... 0xBA:
-	case 0xC0:
+	case 0xC0 ... 0xC1:
 	case 0xD0 ... 0xDE:
 	case 0xE0 ... 0xE5:
 	case 0xF0 ... 0xF3:
@@ -283,6 +284,33 @@ static const struct snd_kcontrol_new rtq9128_snd_ctrls[] = {
 	SOC_ENUM("DVDD UV Threshold Select", rtq9128_dvdduv_select_enum),
 };
 
+static int rtq9128_int_power_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol,
+				   int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	struct rtq9128_data *data = snd_soc_component_get_drvdata(comp);
+	int ret;
+
+	dev_dbg(comp->dev, "%s: event %d, ver %d\n", __func__, event, data->tka470b_e1_ver);
+
+	if (!data->tka470b_e1_ver)
+		return 0;
+
+	if (event == SND_SOC_DAPM_POST_PMU) {
+		ret = snd_soc_component_write(comp, 0xB9, 0x03);
+		if (ret)
+			return ret;
+
+		return snd_soc_component_write(comp, 0xC1, 0);
+	}
+
+	ret = snd_soc_component_write(comp, 0xA1, 0x02);
+	if (ret)
+		return ret;
+
+	return snd_soc_component_write(comp, 0xA8, 0x01);
+}
+
 static int rtq9128_dac_power_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol,
 				   int event)
 {
@@ -320,6 +348,8 @@ static int rtq9128_dac_power_event(struct snd_soc_dapm_widget *w, struct snd_kco
 }
 
 static const struct snd_soc_dapm_widget rtq9128_dapm_widgets[] = {
+	SND_SOC_DAPM_SUPPLY("PWR", SND_SOC_NOPM, 0, 0, rtq9128_int_power_event,
+			    SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_DAC_E("DAC1", NULL, SND_SOC_NOPM, 0, 0, rtq9128_dac_power_event,
 			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_DAC_E("DAC2", NULL, SND_SOC_NOPM, 0, 0, rtq9128_dac_power_event,
@@ -339,6 +369,10 @@ static const struct snd_soc_dapm_route rtq9128_dapm_routes[] = {
 	{ "DAC2", NULL, "Playback" },
 	{ "DAC3", NULL, "Playback" },
 	{ "DAC4", NULL, "Playback" },
+	{ "DAC1", NULL, "PWR" },
+	{ "DAC2", NULL, "PWR" },
+	{ "DAC3", NULL, "PWR" },
+	{ "DAC4", NULL, "PWR" },
 	{ "OUT1", NULL, "DAC1" },
 	{ "OUT2", NULL, "DAC2" },
 	{ "OUT3", NULL, "DAC3" },
@@ -358,9 +392,7 @@ static const struct rtq9128_init_reg rtq9128_tka470b_tables[] = {
 	{ 0x70, 0x11 },
 	{ 0x75, 0x1F },
 	{ 0xB6, 0x03 },
-	{ 0xB9, 0x03 },
 	{ 0xB8, 0x03 },
-	{ 0xC1, 0xFF },
 	{ 0xF8, 0x72 },
 	{ 0x30, 0x180 },
 };
@@ -387,6 +419,7 @@ static const struct rtq9128_init_reg rtq9128_dl_tables[] = {
 
 static int rtq9128_component_probe(struct snd_soc_component *comp)
 {
+	struct rtq9128_data *data = snd_soc_component_get_drvdata(comp);
 	const struct rtq9128_init_reg *table, *curr;
 	size_t table_size;
 	unsigned int val;
@@ -402,6 +435,7 @@ static int rtq9128_component_probe(struct snd_soc_component *comp)
 
 	switch (FIELD_GET(RTQ9128_DIE_CHECK_MASK, val)) {
 	case RTQ9128_TKA470B_VAL:
+		data->tka470b_e1_ver = true;
 		table = rtq9128_tka470b_tables;
 		table_size = ARRAY_SIZE(rtq9128_tka470b_tables);
 		break;
@@ -630,12 +664,29 @@ static int rtq9128_dai_hw_params(struct snd_pcm_substream *stream, struct snd_pc
 
 static int rtq9128_dai_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 {
+	struct rtq9128_data *data = snd_soc_dai_get_drvdata(dai);
 	struct snd_soc_component *comp = dai->component;
 	struct device *dev = dai->dev;
 	int ret;
 
 	dev_dbg(dev, "%s: mute (%d), stream (%d)\n", __func__, mute, stream);
 
+	if (data->tka470b_e1_ver && !mute) {
+		ret = snd_soc_component_write(comp, 0xB9, 0x02);
+		if (ret)
+			return ret;
+
+		usleep_range(10000, 11000);
+
+		ret = snd_soc_component_write(comp, 0xA1, 0xF2);
+		if (ret)
+			return ret;
+
+		ret = snd_soc_component_write(comp, 0xA8, 0x00);
+		if (ret)
+			return ret;
+	}
+
 	ret = snd_soc_component_write_field(comp, RTQ9128_REG_DSP_EN, RTQ9128_MSMUTE_MASK,
 					    mute ? 1 : 0);
 	return ret < 0 ? ret : 0;
-- 
2.34.1

