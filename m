Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 067758C0D0F
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 11:06:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AA6E82A;
	Thu,  9 May 2024 11:06:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AA6E82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715245591;
	bh=2SFbaJQX3uzDIRd0hMWkfCpBr/9eSi36913oX+5xZUo=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=dtgEV+/VXawHSTLQ08D9jqyNp7Lnrq6zmR7VKvDemhky7z8vTv2uwD6Dz7JgiTX2i
	 FKEPyWw0k+zli3dejYrH5FUzY9vW/8OA8aVDvEJV0mPn70nnzs6hpwNkAoOZ3nUef0
	 +RAqCOi7OO20FP72oD+wuAyNBaNIrSeSmGMoCZzY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CA21F8057B; Thu,  9 May 2024 11:05:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA5E3F805A1;
	Thu,  9 May 2024 11:05:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F8F6F804FB; Thu,  9 May 2024 11:04:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EA5B9F805AD
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 11:03:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA5B9F805AD
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 44993e5S21423646,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 44993e5S21423646
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 May 2024 17:03:40 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 17:03:40 +0800
Received: from sw-server.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 17:03:40 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <alsa-devel@alsa-project.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, <pierre-louis.bossart@intel.com>,
        <fred.oh@intel.com>, <marc.herbert@intel.com>,
        Shuming Fan <shumingf@realtek.com>
Subject: [PATCH] ASoC: rt711-sdca: add GE selected mode control
Date: Thu, 9 May 2024 17:03:35 +0800
Message-ID: <20240509090335.2300516-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXH36506.realtek.com.tw (172.21.6.27) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: KCCCXKMK3SQMMAFVVY4F6JGSC2PN34BW
X-Message-ID-Hash: KCCCXKMK3SQMMAFVVY4F6JGSC2PN34BW
X-MailFrom: shumingf@realtek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KCCCXKMK3SQMMAFVVY4F6JGSC2PN34BW/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Shuming Fan <shumingf@realtek.com>

The SDCA spec defines a 'selected_mode' control which can override
the 'detected_mode' reported by hardware.
This is useful for platform integration as well as in cases
where the hardware is not able to accurately detect the jack type.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt711-sdca.c | 79 +++++++++++++++++++++++++++++++++++
 sound/soc/codecs/rt711-sdca.h |  1 +
 2 files changed, 80 insertions(+)

diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
index 1e8dbfc3ecd9..6ff07170d770 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -81,6 +81,24 @@ static void rt711_sdca_reset(struct rt711_sdca_priv *rt711)
 		RT711_HDA_LEGACY_RESET_CTL, 0x1, 0x1);
 }
 
+static void rt711_sdca_ge_force_jack_type(struct rt711_sdca_priv *rt711, unsigned int det_mode)
+{
+	switch (det_mode) {
+	case 0x00:
+		rt711_sdca_index_update_bits(rt711, RT711_VENDOR_REG, RT711_COMBO_JACK_AUTO_CTL1, 0x8000, 0x0000);
+		rt711_sdca_index_update_bits(rt711, RT711_VENDOR_HDA_CTL, RT711_PUSH_BTN_INT_CTL0, 0x10, 0x00);
+		break;
+	case 0x03:
+		rt711_sdca_index_update_bits(rt711, RT711_VENDOR_REG, RT711_COMBO_JACK_AUTO_CTL1, 0x8000, 0x8000);
+		rt711_sdca_index_update_bits(rt711, RT711_VENDOR_HDA_CTL, RT711_PUSH_BTN_INT_CTL0, 0x17, 0x13);
+		break;
+	case 0x05:
+		rt711_sdca_index_update_bits(rt711, RT711_VENDOR_REG, RT711_COMBO_JACK_AUTO_CTL1, 0x8000, 0x8000);
+		rt711_sdca_index_update_bits(rt711, RT711_VENDOR_HDA_CTL, RT711_PUSH_BTN_INT_CTL0, 0x17, 0x15);
+		break;
+	}
+}
+
 static int rt711_sdca_calibration(struct rt711_sdca_priv *rt711)
 {
 	unsigned int val, loop_rc = 0, loop_dc = 0;
@@ -267,6 +285,15 @@ static int rt711_sdca_headset_detect(struct rt711_sdca_priv *rt711)
 		break;
 	}
 
+	if (rt711->ge_mode_override) {
+		if ((det_mode != rt711->ge_mode_override) && det_mode) {
+			det_mode = rt711->ge_mode_override;
+			rt711->jack_type =
+				(rt711->jack_type == SND_JACK_HEADPHONE) ? SND_JACK_HEADSET : SND_JACK_HEADPHONE;
+		}
+		rt711_sdca_ge_force_jack_type(rt711, det_mode);
+	}
+
 	/* write selected_mode */
 	if (det_mode) {
 		ret = regmap_write(rt711->regmap,
@@ -790,6 +817,56 @@ static int rt711_sdca_fu0f_capture_put(struct snd_kcontrol *kcontrol,
 	return changed;
 }
 
+static int rt711_sdca_ge_select_get(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct rt711_sdca_priv *rt711 = snd_soc_component_get_drvdata(component);
+	unsigned int val, item;
+
+	val = (rt711->ge_mode_override >> e->shift_l) & e->mask;
+	item = snd_soc_enum_val_to_item(e, val);
+	ucontrol->value.enumerated.item[0] = item;
+	return 0;
+}
+
+static int rt711_sdca_ge_select_put(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	unsigned int *item = ucontrol->value.enumerated.item;
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct rt711_sdca_priv *rt711 = snd_soc_component_get_drvdata(component);
+	unsigned int val, change = 0;
+
+	if (item[0] >= e->items)
+		return -EINVAL;
+
+	val = snd_soc_enum_item_to_val(e, item[0]) << e->shift_l;
+	if (rt711->ge_mode_override != val) {
+		rt711->ge_mode_override = val;
+		change = 1;
+	}
+
+	return change;
+}
+
+static const char * const rt711_sdca_ge_select[] = {
+	"None",
+	"Headphone",
+	"Headset",
+};
+
+static int rt711_sdca_ge_select_values[] = {
+	0,
+	3,
+	5,
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(rt711_sdca_ge_mode_enum, SND_SOC_NOPM,
+	0, 0x7, rt711_sdca_ge_select, rt711_sdca_ge_select_values);
+
 static const DECLARE_TLV_DB_SCALE(out_vol_tlv, -6525, 75, 0);
 static const DECLARE_TLV_DB_SCALE(in_vol_tlv, -1725, 75, 0);
 static const DECLARE_TLV_DB_SCALE(mic_vol_tlv, 0, 1000, 0);
@@ -824,6 +901,8 @@ static const struct snd_kcontrol_new rt711_sdca_snd_controls[] = {
 		SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT711_SDCA_ENT_PLATFORM_FU15, RT711_SDCA_CTL_FU_CH_GAIN, CH_R),
 		8, 3, 0,
 		rt711_sdca_set_gain_get, rt711_sdca_set_gain_put, mic_vol_tlv),
+	SOC_ENUM_EXT("GE49 Selected Mode", rt711_sdca_ge_mode_enum,
+		rt711_sdca_ge_select_get, rt711_sdca_ge_select_put),
 };
 
 static int rt711_sdca_mux_get(struct snd_kcontrol *kcontrol,
diff --git a/sound/soc/codecs/rt711-sdca.h b/sound/soc/codecs/rt711-sdca.h
index 11d421e8ab2b..15263dcb0314 100644
--- a/sound/soc/codecs/rt711-sdca.h
+++ b/sound/soc/codecs/rt711-sdca.h
@@ -33,6 +33,7 @@ struct  rt711_sdca_priv {
 	int hw_ver;
 	bool fu0f_dapm_mute, fu0f_mixer_l_mute, fu0f_mixer_r_mute;
 	bool fu1e_dapm_mute, fu1e_mixer_l_mute, fu1e_mixer_r_mute;
+	unsigned int ge_mode_override;
 };
 
 /* NID */
-- 
2.34.1

