Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BFF40198B
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Sep 2021 12:13:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 962A5177C;
	Mon,  6 Sep 2021 12:13:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 962A5177C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630923232;
	bh=xmZftmrAnaV6TaFVaeuFuzQG0+gwmwIonr25eFRioXQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=szZf3VOTwW7LVIOuTPPyONZx92IaCRzJpBvpTS+ogVvzK0ifgtwgi8mx5sKIbA6DY
	 6dHCaiCgr6JfIEqFuZ5Aaqoin9qe8F7yt5soH4aVDH+aq0b+ODHEwxbGUdOD0+6vKz
	 jb0SkllsfT7hPJ17I2Km8Bk8qgzC0PeKxRQNPuZk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB547F800C7;
	Mon,  6 Sep 2021 12:12:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FCEBF802E7; Mon,  6 Sep 2021 12:12:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE768F800C7
 for <alsa-devel@alsa-project.org>; Mon,  6 Sep 2021 12:12:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE768F800C7
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 186ACH0F0002016,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36503.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 186ACH0F0002016
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 6 Sep 2021 18:12:17 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36503.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Mon, 6 Sep 2021 18:12:16 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 6 Sep 2021 18:12:15 +0800
From: Jack Yu <jack.yu@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: rt1011: add i2s reference control for rt1011
Date: Mon, 6 Sep 2021 18:12:08 +0800
Message-ID: <20210906101208.11585-1-jack.yu@realtek.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXH36503.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 09/06/2021 09:54:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzkvNiCkV6TIIDA4OjA4OjAw?=
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-ServerInfo: RTEXH36503.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 09/06/2021 09:50:45
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 165979 [Sep 06 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: jack.yu@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 461 461 c95454ca24f64484bdf56c7842a96dd24416624e
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 127.0.0.199:7.1.2; realtek.com:7.1.1
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 09/06/2021 09:54:00
Cc: oder_chiou@realtek.com, Jack Yu <jack.yu@realtek.com>,
 alsa-devel@alsa-project.org, lars@metafoo.de, kent_chen@realtek.com,
 derek.fang@realtek.com, shumingf@realtek.com, flove@realtek.com
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

Add i2s reference control for rt1011 amp.

Signed-off-by: Jack Yu <jack.yu@realtek.com>
---
 sound/soc/codecs/rt1011.c | 54 +++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/rt1011.h |  7 +++++
 2 files changed, 61 insertions(+)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index faff2b558687..508597866dff 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -1311,6 +1311,57 @@ static int rt1011_r0_load_info(struct snd_kcontrol *kcontrol,
 	.put = rt1011_r0_load_mode_put \
 }
 
+static const char * const rt1011_i2s_ref[] = {
+	"None", "Left Channel", "Right Channel"
+};
+
+static SOC_ENUM_SINGLE_DECL(rt1011_i2s_ref_enum, 0, 0,
+	rt1011_i2s_ref);
+
+static int rt1011_i2s_ref_put(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct rt1011_priv *rt1011 =
+		snd_soc_component_get_drvdata(component);
+	int i2s_ref_ch = ucontrol->value.integer.value[0];
+
+	switch (i2s_ref_ch) {
+	case RT1011_I2S_REF_LEFT_CH:
+		regmap_write(rt1011->regmap, RT1011_TDM_TOTAL_SET, 0x0240);
+		regmap_write(rt1011->regmap, RT1011_TDM1_SET_2, 0x8);
+		regmap_write(rt1011->regmap, RT1011_TDM1_SET_1, 0x1022);
+		regmap_write(rt1011->regmap, RT1011_ADCDAT_OUT_SOURCE, 0x4);
+		break;
+	case RT1011_I2S_REF_RIGHT_CH:
+		regmap_write(rt1011->regmap, RT1011_TDM_TOTAL_SET, 0x0240);
+		regmap_write(rt1011->regmap, RT1011_TDM1_SET_2, 0x8);
+		regmap_write(rt1011->regmap, RT1011_TDM1_SET_1, 0x10a2);
+		regmap_write(rt1011->regmap, RT1011_ADCDAT_OUT_SOURCE, 0x4);
+		break;
+	default:
+		dev_info(component->dev, "I2S Reference: Do nothing\n");
+	}
+
+	rt1011->i2s_ref = ucontrol->value.integer.value[0];
+
+	return 0;
+}
+
+static int rt1011_i2s_ref_get(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct rt1011_priv *rt1011 =
+		snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = rt1011->i2s_ref;
+
+	return 0;
+}
+
 static const struct snd_kcontrol_new rt1011_snd_controls[] = {
 	/* I2S Data In Selection */
 	SOC_ENUM("DIN Source", rt1011_din_source_enum),
@@ -1349,6 +1400,9 @@ static const struct snd_kcontrol_new rt1011_snd_controls[] = {
 	/* R0 temperature */
 	SOC_SINGLE("R0 Temperature", RT1011_STP_INITIAL_RESISTANCE_TEMP,
 		2, 255, 0),
+	/* I2S Reference */
+	SOC_ENUM_EXT("I2S Reference", rt1011_i2s_ref_enum,
+		rt1011_i2s_ref_get, rt1011_i2s_ref_put),
 };
 
 static int rt1011_is_sys_clk_from_pll(struct snd_soc_dapm_widget *source,
diff --git a/sound/soc/codecs/rt1011.h b/sound/soc/codecs/rt1011.h
index 68fadc15fa8c..afb2fad94216 100644
--- a/sound/soc/codecs/rt1011.h
+++ b/sound/soc/codecs/rt1011.h
@@ -654,6 +654,12 @@ enum {
 	RT1011_AIFS
 };
 
+enum {
+	RT1011_I2S_REF_NONE,
+	RT1011_I2S_REF_LEFT_CH,
+	RT1011_I2S_REF_RIGHT_CH,
+};
+
 /* BiQual & DRC related settings */
 #define RT1011_BQ_DRC_NUM 128
 struct rt1011_bq_drc_params {
@@ -692,6 +698,7 @@ struct rt1011_priv {
 	unsigned int r0_reg, cali_done;
 	unsigned int r0_calib, temperature_calib;
 	int recv_spk_mode;
+	unsigned int i2s_ref;
 };
 
 #endif		/* end of _RT1011_H_ */
-- 
2.31.1

