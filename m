Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBCC83A24E
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 07:51:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12016B60;
	Wed, 24 Jan 2024 07:50:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12016B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706079069;
	bh=tWRA/7uaaCe1jCn8HwB0osuwl+kZUF1Be1t1konx7Q4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q3J44QzpYd5COe8qSFO2SCIDbDM1wnn05phVIM/naPKbwYRvKNuXoOW9BTLF+Elmj
	 nfjFCxylNeiQogOTWXHe1RFMDzFAjKPfdIMw1PT5esC7mh7yjm+qVMz6KYt/62c08s
	 4s52zUEkhLwrmlX+rm0oNo6uID3QR2lQwGCsFv2Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2988EF805B4; Wed, 24 Jan 2024 07:50:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DE53F805C3;
	Wed, 24 Jan 2024 07:50:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A826FF8028D; Wed, 24 Jan 2024 07:48:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D2674F8022B
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 07:48:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2674F8022B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CqyBporl
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-5999ec531dcso920380eaf.3
        for <alsa-devel@alsa-project.org>;
 Tue, 23 Jan 2024 22:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706078901; x=1706683701;
 darn=alsa-project.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MzHMRWnd7DkGoGkoWn5iFA+muMG72M40AIsULK1grS8=;
        b=CqyBporlIQ2p4cfrWHqxjlW7l9+sYqmZSUvO/jCDoMcBHBHURONV3HIZ+J0sUEYubr
         cS4Ti4h9u/flMwtj9Y8mQgv5jCMrDOlqIVVXWvxg75X+jYLiLP58Pyj4iRZr+56jPIqp
         IlHCnagY9WQchdmSauzh2N3BJVXgfZVAgqQeKo2tLAGrJAfLgE5CMPy6N3S4/tdYyiKb
         YPojtmwBL8f7uv/uL9HXswEkRWanW5IMYFUDEE39LcVR092VNRMYswXiC6V789Au9f1j
         gwfgbJsSysO5p/OSzrQ4/fPopLRqrg2gchcoN+nvEXJxZktmOOoS47q9+nDtKs+yvjdV
         8Q1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706078901; x=1706683701;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MzHMRWnd7DkGoGkoWn5iFA+muMG72M40AIsULK1grS8=;
        b=nUzb4T/N32pubRWUW4T0XiPjJNQYsLVw/xdMqfXa8m0f0mxgNvb3VmirviljgIE+v3
         WJ6gUolVX2dHwubVLKh6IEWgWA7icWDRzG3IXLcmRD9XsC8u/wNzftjjyVvV4dtKj8eJ
         Y0kbSzPh7/9n+pxMkO0F4TQDivx+w09GPihwA6R/BfeWLzJ7Am5g88BzhPiibSTz3hKj
         /PP58jg6A2/ZRzZma3dMxg9G9IMcLYY+kt77WNUcIhcu4d5qkCqsTEPSkA5M8IkKgX9l
         G+3TWQ/fSRr6ouOVL4Yqwt81EF/fP63PUIDkg/Ld+bb6Sv323FJOf6vf+6m99ugqRWfX
         6byQ==
X-Gm-Message-State: AOJu0YzQYZqIVaHsGFMyABO0MgCnqKAC76Z26EBf6bEpKQGb2yeiWaAB
	1AfPARIhJEvhvIYokLoUwQD4/3vEfe49QU98897rSM8OTp6ODPcF/5y2P4ysLmQQhA==
X-Google-Smtp-Source: 
 AGHT+IF8BFMdeVmDbCn5hCQlNchEtbNOr+qKPzNXx+RKb/fEDeU3mB3/wZInaqmWNGY6fvP9gXN5SQ==
X-Received: by 2002:a05:6358:3386:b0:172:ab3b:cc1e with SMTP id
 i6-20020a056358338600b00172ab3bcc1emr6820506rwd.4.1706078901023;
        Tue, 23 Jan 2024 22:48:21 -0800 (PST)
Received: from zy-virtual-machine.localdomain ([222.70.13.170])
        by smtp.gmail.com with ESMTPSA id
 x24-20020a056a000bd800b006dda00f224asm534926pfu.166.2024.01.23.22.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 22:48:20 -0800 (PST)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com,
	Zhu Ning <zhuning0077@gmail.com>
Subject: [PATCH 1/1] ASoC: codecs: ES8326: Adding new volume kcontrols
Date: Wed, 24 Jan 2024 14:48:06 +0800
Message-Id: <20240124064806.30511-2-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240124064806.30511-1-zhuning0077@gmail.com>
References: <20240124064806.30511-1-zhuning0077@gmail.com>
Message-ID-Hash: B74H6TLX2C2IF3JTZ6FGLIVCDOEZJXUA
X-Message-ID-Hash: B74H6TLX2C2IF3JTZ6FGLIVCDOEZJXUA
X-MailFrom: zhuning0077@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B74H6TLX2C2IF3JTZ6FGLIVCDOEZJXUA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ES8326 features a headphone volume control register and four DAC
volume control registers.
We add new volume Kcontrols for these registers to enhance the
configurability of the volume settings, providing users with
greater flexibility.

Signed-off-by: Zhu Ning <zhuning0077@gmail.com>
---
 sound/soc/codecs/es8326.c | 92 ++++++++++++++++++++++++++++++++++++++-
 sound/soc/codecs/es8326.h |  5 ++-
 2 files changed, 95 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index cbcd02ec6ba4..608862aebd71 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -36,6 +36,8 @@ struct es8326_priv {
 	u8 jack_pol;
 	u8 interrupt_src;
 	u8 interrupt_clk;
+	u8 hpl_vol;
+	u8 hpr_vol;
 	bool jd_inverted;
 	unsigned int sysclk;
 
@@ -121,6 +123,72 @@ static int es8326_crosstalk2_set(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static int es8326_hplvol_get(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = es8326->hpl_vol;
+
+	return 0;
+}
+
+static int es8326_hplvol_set(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
+	unsigned int hp_vol;
+
+	hp_vol = ucontrol->value.integer.value[0];
+	if (hp_vol > 5)
+		return -EINVAL;
+	if (es8326->hpl_vol != hp_vol) {
+		es8326->hpl_vol = hp_vol;
+		if (hp_vol >= 3)
+			hp_vol++;
+		regmap_update_bits(es8326->regmap, ES8326_HP_VOL,
+				0x70, (hp_vol << 4));
+		return 1;
+	}
+
+	return 0;
+}
+
+static int es8326_hprvol_get(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = es8326->hpr_vol;
+
+	return 0;
+}
+
+static int es8326_hprvol_set(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
+	unsigned int hp_vol;
+
+	hp_vol = ucontrol->value.integer.value[0];
+	if (hp_vol > 5)
+		return -EINVAL;
+	if (es8326->hpr_vol != hp_vol) {
+		es8326->hpr_vol = hp_vol;
+		if (hp_vol >= 3)
+			hp_vol++;
+		regmap_update_bits(es8326->regmap, ES8326_HP_VOL,
+				0x07, hp_vol);
+		return 1;
+	}
+
+	return 0;
+}
+
 static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(dac_vol_tlv, -9550, 50, 0);
 static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(adc_vol_tlv, -9550, 50, 0);
 static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(adc_analog_pga_tlv, 0, 300, 0);
@@ -151,15 +219,24 @@ static const char *const winsize[] = {
 static const char *const dacpol_txt[] =	{
 	"Normal", "R Invert", "L Invert", "L + R Invert" };
 
+static const char *const hp_spkvol_switch[] = {
+	"HPVOL: HPL+HPL, SPKVOL: HPL+HPL",
+	"HPVOL: HPL+HPR, SPKVOL: HPL+HPR",
+	"HPVOL: HPL+HPL, SPKVOL: SPKL+SPKR",
+	"HPVOL: HPL+HPR, SPKVOL: SPKL+SPKR",
+};
+
 static const struct soc_enum dacpol =
 	SOC_ENUM_SINGLE(ES8326_DAC_DSM, 4, 4, dacpol_txt);
 static const struct soc_enum alc_winsize =
 	SOC_ENUM_SINGLE(ES8326_ADC_RAMPRATE, 4, 16, winsize);
 static const struct soc_enum drc_winsize =
 	SOC_ENUM_SINGLE(ES8326_DRC_WINSIZE, 4, 16, winsize);
+static const struct soc_enum hpvol_spkvol_switch =
+	SOC_ENUM_SINGLE(ES8326_HP_MISC, 6, 4, hp_spkvol_switch);
 
 static const struct snd_kcontrol_new es8326_snd_controls[] = {
-	SOC_SINGLE_TLV("DAC Playback Volume", ES8326_DAC_VOL, 0, 0xbf, 0, dac_vol_tlv),
+	SOC_SINGLE_TLV("DAC Playback Volume", ES8326_DACL_VOL, 0, 0xbf, 0, dac_vol_tlv),
 	SOC_ENUM("Playback Polarity", dacpol),
 	SOC_SINGLE_TLV("DAC Ramp Rate", ES8326_DAC_RAMPRATE, 0, 0x0f, 0, softramp_rate),
 	SOC_SINGLE_TLV("DRC Recovery Level", ES8326_DRC_RECOVERY, 0, 4, 0, drc_recovery_tlv),
@@ -182,6 +259,17 @@ static const struct snd_kcontrol_new es8326_snd_controls[] = {
 			es8326_crosstalk1_get, es8326_crosstalk1_set),
 	SOC_SINGLE_EXT("CROSSTALK2", SND_SOC_NOPM, 0, 31, 0,
 			es8326_crosstalk2_get, es8326_crosstalk2_set),
+	SOC_SINGLE_EXT("HPL Volume", SND_SOC_NOPM, 0, 5, 0,
+			es8326_hplvol_get, es8326_hplvol_set),
+	SOC_SINGLE_EXT("HPR Volume", SND_SOC_NOPM, 0, 5, 0,
+			es8326_hprvol_get, es8326_hprvol_set),
+
+	SOC_SINGLE_TLV("HPL Playback Volume", ES8326_DACL_VOL, 0, 0xbf, 0, dac_vol_tlv),
+	SOC_SINGLE_TLV("HPR Playback Volume", ES8326_DACR_VOL, 0, 0xbf, 0, dac_vol_tlv),
+	SOC_SINGLE_TLV("SPKL Playback Volume", ES8326_SPKL_VOL, 0, 0xbf, 0, dac_vol_tlv),
+	SOC_SINGLE_TLV("SPKR Playback Volume", ES8326_SPKR_VOL, 0, 0xbf, 0, dac_vol_tlv),
+
+	SOC_ENUM("HPVol SPKVol Switch", hpvol_spkvol_switch),
 };
 
 static const struct snd_soc_dapm_widget es8326_dapm_widgets[] = {
@@ -972,6 +1060,8 @@ static int es8326_resume(struct snd_soc_component *component)
 
 	es8326->jack_remove_retry = 0;
 	es8326->hp = 0;
+	es8326->hpl_vol = 0x03;
+	es8326->hpr_vol = 0x03;
 	return 0;
 }
 
diff --git a/sound/soc/codecs/es8326.h b/sound/soc/codecs/es8326.h
index 4234bbb900c4..ee12caef8105 100644
--- a/sound/soc/codecs/es8326.h
+++ b/sound/soc/codecs/es8326.h
@@ -69,7 +69,7 @@
 #define ES8326_DAC_DSM		0x4D
 #define ES8326_DAC_RAMPRATE	0x4E
 #define ES8326_DAC_VPPSCALE	0x4F
-#define ES8326_DAC_VOL		0x50
+#define ES8326_DACL_VOL	        0x50
 #define ES8326_DRC_RECOVERY	0x53
 #define ES8326_DRC_WINSIZE	0x54
 #define ES8326_DAC_CROSSTALK	0x55
@@ -81,6 +81,9 @@
 #define ES8326_SDINOUT23_IO	0x5B
 #define ES8326_JACK_PULSE	0x5C
 
+#define ES8326_DACR_VOL		0xF4
+#define ES8326_SPKL_VOL		0xF5
+#define ES8326_SPKR_VOL		0xF6
 #define ES8326_HP_MISC		0xF7
 #define ES8326_CTIA_OMTP_STA	0xF8
 #define ES8326_PULLUP_CTL	0xF9
-- 
2.17.1

