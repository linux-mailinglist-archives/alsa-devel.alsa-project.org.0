Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A6783338D
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Jan 2024 11:15:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DF6784D;
	Sat, 20 Jan 2024 11:14:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DF6784D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705745709;
	bh=4XTMv/27kW3P5osWJ1kSddhcEjOZbvIuwRXxZPpGMlQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b1u93QqQJ77atI6/HYD2khtFtPHGS7ZX03uHAHjJLU+A9vVuuy+Bf1dYRiBXmpkhv
	 fZlj6/4D7/4JiKdsBqcYjL93N6koyJ4vvm+RORthKKQ00iPmCFZs0prWluGIg/Qylw
	 g9YUxUI+jzG4bKxX9jUEWMwM/YYQJlYieZHRFWRM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5986AF805EB; Sat, 20 Jan 2024 11:14:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5ED67F805F0;
	Sat, 20 Jan 2024 11:14:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16764F802BE; Sat, 20 Jan 2024 11:13:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0557FF80074
	for <alsa-devel@alsa-project.org>; Sat, 20 Jan 2024 11:13:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0557FF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PZv0iu+J
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-5ce74ea4bf2so1089567a12.0
        for <alsa-devel@alsa-project.org>;
 Sat, 20 Jan 2024 02:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705745576; x=1706350376;
 darn=alsa-project.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mL1Pe0qczNWUMTVPbR6DgJnFhcx08H1tylBUx7/ziTo=;
        b=PZv0iu+JjpTgZEM9Z/fi5S+whtJW1baovv+kvI3pV/dDu4MTLREXLk8jpeXHOTmfyj
         YcyugN0uMuBwMIiBcmOsZ6L5ADcsaerirBbGTd6utIF1IqF/+yAwChfnf5R221exmulm
         lLJ4NNqQIiek28kfMKvWbZn0qKVlzlSUeTmIjsd9JD+mzBXKv4TU4ZjHqIbiJc4n7RZl
         5vLsbbXI3Uxkxoc/74eMwltK57zsMJ0UHr4ngoa0ncqk7zkZApvvpHGdAv1nirwpIpzM
         exopK6AYYS9DwdB+TdXpF9Lcp9DbedPWz47LHe8L48yBXBG55rQ22o3E6GQUFoR30LmB
         xv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705745576; x=1706350376;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mL1Pe0qczNWUMTVPbR6DgJnFhcx08H1tylBUx7/ziTo=;
        b=THVxbgZeMZSXfop6C/xAzlD8DBmMgfkVaB1uFlgSXfqw40sSoAy/JYphyxLKWp96qZ
         8kZPA8aBNfXlD2ueaJHF2hsi+LnRbI2KG3+PS/SJrVC84QflQBwH80wsX1qPb7Begaak
         zzI0q3bkl7jkSNtLXfs46o5jAyvpLI8WOIKPdNUjsp7qRdLbVYd7Ocn/7iAImoEa3lUo
         H8TqROcLfsJYXcvW7zzuqubm4ZoH4s8nNRTyRtFy7Th4uhV42zjsojmHfMcP3ZWkiB+r
         QTumHHHzOmR0KAWM2b1gHBtfnAV4hj3BDrg/k/sKYrJobWPBNPApRwFnoczQb/GZhEEp
         /Xew==
X-Gm-Message-State: AOJu0YwdQlaaj0oo7tkvyGIppMX1ggREUn+1D8SJUs1EpQTmnbEeyIZq
	ht2pKSPoO3dTAqovzo6ABuVNdsrZdagDhUA5Wg6MYBqA4PwJxYn4A96vAi9ODpLEtA==
X-Google-Smtp-Source: 
 AGHT+IHeCmQ1DMOPuaYVZ7vXg/L9UHqgrChyCXK4VKCTUIImDtAFtV0oIDMe4GctpmoZw4VS5BdywQ==
X-Received: by 2002:a17:90a:9306:b0:28d:d3bb:7359 with SMTP id
 p6-20020a17090a930600b0028dd3bb7359mr1607351pjo.8.1705745576336;
        Sat, 20 Jan 2024 02:12:56 -0800 (PST)
Received: from zy-virtual-machine.localdomain ([222.70.13.170])
        by smtp.gmail.com with ESMTPSA id
 jc17-20020a17090325d100b001d72cf69508sm967365plb.23.2024.01.20.02.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jan 2024 02:12:56 -0800 (PST)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com,
	Zhu Ning <zhuning0077@gmail.com>
Subject: [PATCH v1 3/5] ASoC: codecs: ES8326: Adding new volume kcontrols
Date: Sat, 20 Jan 2024 18:12:38 +0800
Message-Id: <20240120101240.12496-4-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240120101240.12496-1-zhuning0077@gmail.com>
References: <20240120101240.12496-1-zhuning0077@gmail.com>
Message-ID-Hash: PJ6KZ36YTJYD7R2JEBD4SEANK6ANG6X6
X-Message-ID-Hash: PJ6KZ36YTJYD7R2JEBD4SEANK6ANG6X6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PJ6KZ36YTJYD7R2JEBD4SEANK6ANG6X6/>
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
 sound/soc/codecs/es8326.c | 88 ++++++++++++++++++++++++++++++++++++++-
 sound/soc/codecs/es8326.h |  5 ++-
 2 files changed, 91 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 10157a4bd500..51dc8081e475 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -121,6 +121,72 @@ static int es8326_crosstalk2_set(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static int es8326_hplvol_get(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
+	unsigned int hp_vol;
+
+	regmap_read(es8326->regmap, ES8326_HP_VOL, &hp_vol);
+	hp_vol &= 0x70;
+	ucontrol->value.integer.value[0] = hp_vol >> 4;
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
+	if (ucontrol->value.integer.value[0] == 3) {
+		dev_dbg(component->dev, "HPL_VOL does not change");
+		return 0;
+	}
+	regmap_read(es8326->regmap, ES8326_HP_VOL, &hp_vol);
+	hp_vol &= 0x8F;
+	hp_vol |= ucontrol->value.integer.value[0] << 4;
+	regmap_write(es8326->regmap, ES8326_HP_VOL, hp_vol);
+
+	return 0;
+}
+
+static int es8326_hprvol_get(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
+	unsigned int hp_vol;
+
+	regmap_read(es8326->regmap, ES8326_HP_VOL, &hp_vol);
+	hp_vol &= 0x07;
+	ucontrol->value.integer.value[0] = hp_vol;
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
+	if (ucontrol->value.integer.value[0] == 3) {
+		dev_dbg(component->dev, "HPR_VOL does not change");
+		return 0;
+	}
+	regmap_read(es8326->regmap, ES8326_HP_VOL, &hp_vol);
+	hp_vol &= 0xF8;
+	hp_vol |= ucontrol->value.integer.value[0];
+	regmap_write(es8326->regmap, ES8326_HP_VOL, hp_vol);
+
+	return 0;
+}
+
 static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(dac_vol_tlv, -9550, 50, 0);
 static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(adc_vol_tlv, -9550, 50, 0);
 static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(adc_analog_pga_tlv, 0, 300, 0);
@@ -151,15 +217,24 @@ static const char *const winsize[] = {
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
@@ -182,6 +257,17 @@ static const struct snd_kcontrol_new es8326_snd_controls[] = {
 			es8326_crosstalk1_get, es8326_crosstalk1_set),
 	SOC_SINGLE_EXT("CROSSTALK2", SND_SOC_NOPM, 0, 31, 0,
 			es8326_crosstalk2_get, es8326_crosstalk2_set),
+	SOC_SINGLE_EXT("HPL Volume", SND_SOC_NOPM, 0, 6, 0,
+			es8326_hplvol_get, es8326_hplvol_set),
+	SOC_SINGLE_EXT("HPR Volume", SND_SOC_NOPM, 0, 6, 0,
+			es8326_hprvol_get, es8326_hprvol_set),
+
+	SOC_SINGLE_TLV("HPL Playback Volume", ES8326_DACL_VOL, 0, 0xbf, 0, dac_vol_tlv),
+	SOC_SINGLE_TLV("HPR Playback Volume", ES8326_DACR_VOL, 0, 0xbf, 0, dac_vol_tlv),
+	SOC_SINGLE_TLV("SPKL Playback Volume", ES8326_SPKL_VOL, 0, 0xbf, 0, dac_vol_tlv),
+	SOC_SINGLE_TLV("SPKR Playback Volume", ES8326_SPKR_VOL, 0, 0xbf, 0, dac_vol_tlv),
+
+	SOC_ENUM("HPVol SPKVol switch", hpvol_spkvol_switch),
 };
 
 static const struct snd_soc_dapm_widget es8326_dapm_widgets[] = {
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

