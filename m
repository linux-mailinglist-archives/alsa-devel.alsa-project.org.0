Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB0C3667CA
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Apr 2021 11:16:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6ABCF168A;
	Wed, 21 Apr 2021 11:15:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6ABCF168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618996576;
	bh=kcudHs/nKo86SbCg4f+llrUeQngbjT9gzklWOjxYYL8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SH05w8QaETqf5+n815yeTmIGIC49W+yVwk6yZS97NBmnoJO4EUgVS4eKW74H19UfU
	 crO7vG8siGF5Tke6waLjEHYf4rZKZYam91tj/Bdav2aOa9paoqZuk1q2UrvFfHKOCv
	 bOHMrleOaTx7dedSucbT0s7YVNPhQq6m0sVIqFTo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6AC4F8019B;
	Wed, 21 Apr 2021 11:14:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CA38F80227; Wed, 21 Apr 2021 11:14:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80F94F800AE
 for <alsa-devel@alsa-project.org>; Wed, 21 Apr 2021 11:14:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80F94F800AE
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 13L9EGgC4014290,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (mapi.realtek.com[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 13L9EGgC4014290
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 21 Apr 2021 17:14:16 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36502.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 21 Apr 2021 17:14:16 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 21 Apr 2021 17:14:15 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH v2] ASoC: rt711-sdca: change capture switch controls
Date: Wed, 21 Apr 2021 17:14:10 +0800
Message-ID: <20210421091410.2300-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXMBS01.realtek.com.tw (172.21.6.94) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzQvMjEgpFekyCAwNzowOTowMA==?=
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 04/21/2021 08:50:58
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 10
X-KSE-AntiSpam-Info: Lua profiles 163258 [Apr 21 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: shumingf@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 442 442 b985cb57763b61d2a20abb585d5d4cc10c315b09
X-KSE-AntiSpam-Info: {Prob_from_in_msgid}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: 127.0.0.199:7.1.2;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; realtek.com:7.1.1
X-KSE-AntiSpam-Info: {Track_Chinese_Simplified, headers_charset}
X-KSE-AntiSpam-Info: Rate: 10
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 04/21/2021 08:54:00
X-KSE-ServerInfo: RTEXH36502.realtek.com.tw, 9
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzQvMjEgpFekyCAwNzozODowMA==?=
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 04/21/2021 08:57:01
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 10
X-KSE-AntiSpam-Info: Lua profiles 163258 [Apr 21 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: shumingf@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 442 442 b985cb57763b61d2a20abb585d5d4cc10c315b09
X-KSE-AntiSpam-Info: {Prob_from_in_msgid}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 127.0.0.199:7.1.2; realtek.com:7.1.1
X-KSE-AntiSpam-Info: {Track_Chinese_Simplified, headers_charset}
X-KSE-AntiSpam-Info: Rate: 10
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 04/21/2021 08:59:00
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, libin.yang@intel.com, derek.fang@realtek.com,
 Shuming Fan <shumingf@realtek.com>, flove@realtek.com
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

From: Shuming Fan <shumingf@realtek.com>

The DAPM event and mixer control could mute/unmute the capture directly.
That will be confused that capture still works if the user settings is unmute before the capture.
Therefore, this patch uses the variables to record the capture switch status of DAPM and mixer.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt711-sdca.c | 125 ++++++++++++++++++++++------------
 sound/soc/codecs/rt711-sdca.h |   2 +
 2 files changed, 84 insertions(+), 43 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
index bfb7f1c8ec8f..95ca0d74bd10 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -642,6 +642,73 @@ static int rt711_sdca_set_gain_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static void rt711_sdca_set_fu0f_capture_ctl(struct rt711_sdca_priv *rt711)
+{
+	if (rt711->fu0f_dapm_mute || rt711->fu0f_mixer_mute) {
+		regmap_write(rt711->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT711_SDCA_ENT_USER_FU0F,
+				RT711_SDCA_CTL_FU_MUTE, CH_L), 0x01);
+		regmap_write(rt711->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT711_SDCA_ENT_USER_FU0F,
+				RT711_SDCA_CTL_FU_MUTE, CH_R), 0x01);
+	} else {
+		regmap_write(rt711->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT711_SDCA_ENT_USER_FU0F,
+				RT711_SDCA_CTL_FU_MUTE, CH_L), 0x00);
+		regmap_write(rt711->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT711_SDCA_ENT_USER_FU0F,
+				RT711_SDCA_CTL_FU_MUTE, CH_R), 0x00);
+	}
+}
+
+static void rt711_sdca_set_fu1e_capture_ctl(struct rt711_sdca_priv *rt711)
+{
+	if (rt711->fu1e_dapm_mute || rt711->fu1e_mixer_mute) {
+		regmap_write(rt711->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT711_SDCA_ENT_USER_FU1E,
+				RT711_SDCA_CTL_FU_MUTE, CH_L), 0x01);
+		regmap_write(rt711->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT711_SDCA_ENT_USER_FU1E,
+				RT711_SDCA_CTL_FU_MUTE, CH_R), 0x01);
+	} else {
+		regmap_write(rt711->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT711_SDCA_ENT_USER_FU1E,
+				RT711_SDCA_CTL_FU_MUTE, CH_L), 0x00);
+		regmap_write(rt711->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT711_SDCA_ENT_USER_FU1E,
+				RT711_SDCA_CTL_FU_MUTE, CH_R), 0x00);
+	}
+}
+
+static int rt711_sdca_capture_switch_get(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rt711_sdca_priv *rt711 = snd_soc_component_get_drvdata(component);
+
+	if (strstr(ucontrol->id.name, "FU1E Capture Switch"))
+		ucontrol->value.integer.value[0] = !rt711->fu1e_mixer_mute;
+	else if (strstr(ucontrol->id.name, "FU0F Capture Switch"))
+		ucontrol->value.integer.value[0] = !rt711->fu0f_mixer_mute;
+	return 0;
+}
+
+static int rt711_sdca_capture_switch_put(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rt711_sdca_priv *rt711 = snd_soc_component_get_drvdata(component);
+
+	if (strstr(ucontrol->id.name, "FU1E Capture Switch")) {
+		rt711->fu1e_mixer_mute = !ucontrol->value.integer.value[0];
+		rt711_sdca_set_fu1e_capture_ctl(rt711);
+	} else if (strstr(ucontrol->id.name, "FU0F Capture Switch")) {
+		rt711->fu0f_mixer_mute = !ucontrol->value.integer.value[0];
+		rt711_sdca_set_fu0f_capture_ctl(rt711);
+	}
+	return 0;
+}
+
 static const DECLARE_TLV_DB_SCALE(out_vol_tlv, -6525, 75, 0);
 static const DECLARE_TLV_DB_SCALE(in_vol_tlv, -1725, 75, 0);
 static const DECLARE_TLV_DB_SCALE(mic_vol_tlv, 0, 1000, 0);
@@ -652,14 +719,10 @@ static const struct snd_kcontrol_new rt711_sdca_snd_controls[] = {
 		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT711_SDCA_ENT_USER_FU05, RT711_SDCA_CTL_FU_VOLUME, CH_R),
 		0x57, 0x57, 0,
 		rt711_sdca_set_gain_get, rt711_sdca_set_gain_put, out_vol_tlv),
-	SOC_DOUBLE_R("FU1E Capture Switch",
-		SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT711_SDCA_ENT_USER_FU1E, RT711_SDCA_CTL_FU_MUTE, CH_L),
-		SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT711_SDCA_ENT_USER_FU1E, RT711_SDCA_CTL_FU_MUTE, CH_R),
-		0, 1, 1),
-	SOC_DOUBLE_R("FU0F Capture Switch",
-		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT711_SDCA_ENT_USER_FU0F, RT711_SDCA_CTL_FU_MUTE, CH_L),
-		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT711_SDCA_ENT_USER_FU0F, RT711_SDCA_CTL_FU_MUTE, CH_R),
-		0, 1, 1),
+	SOC_SINGLE_EXT("FU1E Capture Switch", SND_SOC_NOPM, 0, 1, 0,
+		rt711_sdca_capture_switch_get, rt711_sdca_capture_switch_put),
+	SOC_SINGLE_EXT("FU0F Capture Switch", SND_SOC_NOPM, 0, 1, 0,
+		rt711_sdca_capture_switch_get, rt711_sdca_capture_switch_put),
 	SOC_DOUBLE_R_EXT_TLV("FU1E Capture Volume",
 		SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT711_SDCA_ENT_USER_FU1E, RT711_SDCA_CTL_FU_VOLUME, CH_L),
 		SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT711_SDCA_ENT_USER_FU1E, RT711_SDCA_CTL_FU_VOLUME, CH_R),
@@ -809,28 +872,15 @@ static int rt711_sdca_fu0f_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component =
 		snd_soc_dapm_to_component(w->dapm);
 	struct rt711_sdca_priv *rt711 = snd_soc_component_get_drvdata(component);
-	unsigned char unmute = 0x0, mute = 0x1;
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		regmap_write(rt711->regmap,
-			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT711_SDCA_ENT_USER_FU0F,
-				RT711_SDCA_CTL_FU_MUTE, CH_L),
-				unmute);
-		regmap_write(rt711->regmap,
-			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT711_SDCA_ENT_USER_FU0F,
-				RT711_SDCA_CTL_FU_MUTE, CH_R),
-				unmute);
+		rt711->fu0f_dapm_mute = false;
+		rt711_sdca_set_fu0f_capture_ctl(rt711);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
-		regmap_write(rt711->regmap,
-			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT711_SDCA_ENT_USER_FU0F,
-				RT711_SDCA_CTL_FU_MUTE, CH_L),
-				mute);
-		regmap_write(rt711->regmap,
-			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT711_SDCA_ENT_USER_FU0F,
-				RT711_SDCA_CTL_FU_MUTE, CH_R),
-				mute);
+		rt711->fu0f_dapm_mute = true;
+		rt711_sdca_set_fu0f_capture_ctl(rt711);
 		break;
 	}
 	return 0;
@@ -842,29 +892,16 @@ static int rt711_sdca_fu1e_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component =
 		snd_soc_dapm_to_component(w->dapm);
 	struct rt711_sdca_priv *rt711 = snd_soc_component_get_drvdata(component);
-	unsigned char unmute = 0x0, mute = 0x1;
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		regmap_write(rt711->regmap,
-			SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT711_SDCA_ENT_USER_FU1E,
-				RT711_SDCA_CTL_FU_MUTE, CH_L),
-				unmute);
-		regmap_write(rt711->regmap,
-			SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT711_SDCA_ENT_USER_FU1E,
-				RT711_SDCA_CTL_FU_MUTE, CH_R),
-				unmute);
+		rt711->fu1e_dapm_mute = false;
+		rt711_sdca_set_fu1e_capture_ctl(rt711);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
-		regmap_write(rt711->regmap,
-			SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT711_SDCA_ENT_USER_FU1E,
-				RT711_SDCA_CTL_FU_MUTE, CH_L),
-				mute);
-		regmap_write(rt711->regmap,
-			SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT711_SDCA_ENT_USER_FU1E,
-				RT711_SDCA_CTL_FU_MUTE, CH_R),
-				mute);
-			break;
+		rt711->fu1e_dapm_mute = true;
+		rt711_sdca_set_fu1e_capture_ctl(rt711);
+		break;
 	}
 	return 0;
 }
@@ -1330,6 +1367,8 @@ int rt711_sdca_init(struct device *dev, struct regmap *regmap,
 	 */
 	rt711->hw_init = false;
 	rt711->first_hw_init = false;
+	rt711->fu0f_dapm_mute = rt711->fu0f_mixer_mute = true;
+	rt711->fu1e_dapm_mute = rt711->fu1e_mixer_mute = true;
 
 	/* JD source uses JD2 in default */
 	rt711->jd_src = RT711_JD2;
diff --git a/sound/soc/codecs/rt711-sdca.h b/sound/soc/codecs/rt711-sdca.h
index 98a022cec0bd..a3b3a95094c0 100644
--- a/sound/soc/codecs/rt711-sdca.h
+++ b/sound/soc/codecs/rt711-sdca.h
@@ -30,6 +30,8 @@ struct  rt711_sdca_priv {
 	int jack_type, jd_src;
 	unsigned int scp_sdca_stat1, scp_sdca_stat2;
 	int hw_ver;
+	bool fu0f_dapm_mute, fu0f_mixer_mute;
+	bool fu1e_dapm_mute, fu1e_mixer_mute;
 };
 
 struct sdw_stream_data {
-- 
2.29.0

