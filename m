Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 488E77D1057
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Oct 2023 15:15:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83D0393A;
	Fri, 20 Oct 2023 15:14:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83D0393A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697807699;
	bh=bq5q1GCASx/F7qnvwngisEQLZyNY5fz4pkDm+2A4orc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MfU1rovuvHE1/KkbFr/t4nQU6F6SepeiiiHFM20+5UbT3U40gTioLDMVnaayU/U6G
	 x8fMH57WxslzOEW23XbAdjJEn+yEIeCWC3gYsDNIPM3WpHbr3z++zoy8lvYGCcsUyE
	 mB9649NbXe4dyVkJ1atlf/xdnHQoiKpxL1dZ+tEU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D0E5F805C1; Fri, 20 Oct 2023 15:12:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BB20EF805B2;
	Fri, 20 Oct 2023 15:12:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 820DEF8019B; Fri, 20 Oct 2023 11:51:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	by alsa1.perex.cz (Postfix) with ESMTP id 57186F8025F
	for <alsa-devel@alsa-project.org>; Fri, 20 Oct 2023 11:51:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57186F8025F
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(1461490:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256);
 Fri, 20 Oct 2023 17:50:37 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Fri, 20 Oct
 2023 17:50:36 +0800
Received: from linuxcarl2.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1118.25 via Frontend
 Transport; Fri, 20 Oct 2023 17:50:36 +0800
From: <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, ChiYuan Huang <cy_huang@richtek.com>, Allen
 Lin <allen_lin@richtek.com>, <alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] ASoC: codecs: rtq9128: Fix TKA470B E1 version amp on
 sequence
Date: Fri, 20 Oct 2023 17:50:35 +0800
Message-ID: <1697795435-5858-4-git-send-email-cy_huang@richtek.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1697795435-5858-1-git-send-email-cy_huang@richtek.com>
References: <1697795435-5858-1-git-send-email-cy_huang@richtek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MailFrom: prvs=165218EEE3=cy_huang@richtek.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: LR5ZELRWG7UZ35DNN7WAPSULKGI4JCOU
X-Message-ID-Hash: LR5ZELRWG7UZ35DNN7WAPSULKGI4JCOU
X-Mailman-Approved-At: Fri, 20 Oct 2023 13:12:22 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LR5ZELRWG7UZ35DNN7WAPSULKGI4JCOU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: ChiYuan Huang <cy_huang@richtek.com>

For E1 sample, there's the current bias issue. Some undocumented RGs
should be runtime controlled during the DAPM flow to prevent the
abnormal false alarm protection latchup.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
Hi,
  Our E1 sample is evaluated by some end customer. Alghouth it's not the
final MP version. But to be compatible with the engineering sample, this
fix can solve the amp on issue.
---
 sound/soc/codecs/rtq9128.c | 57 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 54 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rtq9128.c b/sound/soc/codecs/rtq9128.c
index 8a61a8a32db1..5d75dc63492b 100644
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
@@ -398,6 +431,7 @@ static int rtq9128_component_probe(struct snd_soc_component *comp)
 
 	switch (FIELD_GET(RTQ9128_DIE_CHECK_MASK, val)) {
 	case RTQ9128_TKA470B_VAL:
+		data->tka470b_e1_ver = true;
 		table = rtq9128_tka470b_tables;
 		table_size = ARRAY_SIZE(rtq9128_tka470b_tables);
 		break;
@@ -626,12 +660,29 @@ static int rtq9128_dai_hw_params(struct snd_pcm_substream *stream, struct snd_pc
 
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

