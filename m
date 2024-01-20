Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B6583338C
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Jan 2024 11:14:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B05E282C;
	Sat, 20 Jan 2024 11:14:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B05E282C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705745692;
	bh=nktPXpHTG5txLhyDhyAWa2XI7cn2h1kJ2RyPfnbfKZs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cjHJawEmaRuivX3zMUp96hnb62LH8hoINIagwiYVzuLzmwyWNrI4OqZ1K1dT1FaCo
	 aCeTOTpdxhk/x0aTR+beBn0e9MXHPNtOh5frjMOst/50YgVXW0ftyj8tp0QcyM/xoe
	 ocYooNu2REaYOxI8Pm/ySwn/osv2rsUuPVu8R5As=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 973A0F805BD; Sat, 20 Jan 2024 11:14:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BCFE8F805BF;
	Sat, 20 Jan 2024 11:14:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 799C0F802E8; Sat, 20 Jan 2024 11:13:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37231F800F5
	for <alsa-devel@alsa-project.org>; Sat, 20 Jan 2024 11:12:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37231F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eTUy5V9I
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-361b0f0f971so2496835ab.2
        for <alsa-devel@alsa-project.org>;
 Sat, 20 Jan 2024 02:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705745570; x=1706350370;
 darn=alsa-project.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MmNb3ymqWtIOO6mpFa0sJnvesbvkzZ3Mqz86FTB3urA=;
        b=eTUy5V9I9pV3SCNfd+DOIp7Ifgf+8TgACuG6PO+9hlTVBudwxlstYis/HXxL59Qhxx
         uFeUGoTGGnYdW2BNMNwYAKeY469iiGr24fAIcez/dNjF5IDdCFRKbPbPXxUCY34D7Glq
         5sGcsWzfL4ihN1QcxcHJl0JbNlWFCMkckpfgD8mTFig6M80LbMghQeu7dmYQjmosM5pX
         CUtK9CB783E+U1+xaDoVfcp1hucoeMjce4hQrFy+zrgZRv47TAuN7DX+M7F3BBxwIFpX
         Lx/4DuFW9QUL+Zdrtco6vXselujFCjQml8549OD1u61vGTTkC0/3Q7UIMHnIQ6N5JFtD
         wa3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705745570; x=1706350370;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MmNb3ymqWtIOO6mpFa0sJnvesbvkzZ3Mqz86FTB3urA=;
        b=rbSuupH8dxJZFdSzvhIJkGq8AXaJtRjufDut/d2Fw5XBPNk9KL117L27O53bNHoQyD
         5Q9qmXLUJNCjsbdPCQ1v+jEFJioiiIZvLEicPJsGBSHaBpHYvRQWZ2Bp517/6nmizrQO
         kUXjVO658rHy3OZnnW3RyEcfsuFTwHBX0naP5t1VO/aa+uMk9DEKa18IdywYYcxcdMSU
         tmLet9moSm17PhhhHxp1JTWB49YA8OuGX5ue/grWQyjE2b0iKOfoQeQQU3ejnX3UKt9W
         06fIusH/FpaWtrR30FXVeSDH4m+NbyeSvLswQHp7jmN2Y2UrKEyW7l3Niigs9UUiuysF
         KoIA==
X-Gm-Message-State: AOJu0YwXbLMXTaRoMp00PuvSF0iDCyR0NGKagpZh9Vfl7H4jVKzbLQOH
	8QVQg7MzvU/aWB9ShUKAiRICcxq6ToUUnMY4pTsSwbNmJCxuR3POfoJDhQ9ugjOj/Q==
X-Google-Smtp-Source: 
 AGHT+IHOucaJWSyKnoknO3nkVh9Qow1B0xqjW5lACj1s9mMOo2AatkcLrm5hxZb4WMLpmIma+gONjQ==
X-Received: by 2002:a05:6e02:d45:b0:360:702a:3f81 with SMTP id
 h5-20020a056e020d4500b00360702a3f81mr1344507ilj.27.1705745570566;
        Sat, 20 Jan 2024 02:12:50 -0800 (PST)
Received: from zy-virtual-machine.localdomain ([222.70.13.170])
        by smtp.gmail.com with ESMTPSA id
 jc17-20020a17090325d100b001d72cf69508sm967365plb.23.2024.01.20.02.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jan 2024 02:12:50 -0800 (PST)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com,
	Zhu Ning <zhuning0077@gmail.com>
Subject: [PATCH v1 1/5] ASoC: codecs: ES8326: improving crosstalk performance
Date: Sat, 20 Jan 2024 18:12:36 +0800
Message-Id: <20240120101240.12496-2-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240120101240.12496-1-zhuning0077@gmail.com>
References: <20240120101240.12496-1-zhuning0077@gmail.com>
Message-ID-Hash: W3SCL62T2LPPIIST5CE52V4Q4IFY7GHB
X-Message-ID-Hash: W3SCL62T2LPPIIST5CE52V4Q4IFY7GHB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W3SCL62T2LPPIIST5CE52V4Q4IFY7GHB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We change the crosstalk parameter in es8326_resume function
to improve crosstalk performance.
Adding crosstalk kcontrol to enhance the flexibility of crosstalk
debugging in machine.
Adding ES8326_DAC_CROSSTALK macro to declare the crosstalk register.

Signed-off-by: Zhu Ning <zhuning0077@gmail.com>
---
 sound/soc/codecs/es8326.c | 82 +++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/es8326.h |  1 +
 2 files changed, 83 insertions(+)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index fa890f6205e2..82d1c4f8324c 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -45,6 +45,82 @@ struct es8326_priv {
 	int jack_remove_retry;
 };
 
+static int es8326_crosstalk1_get(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
+	unsigned int crosstalk_h, crosstalk_l;
+	unsigned int crosstalk;
+
+	regmap_read(es8326->regmap, ES8326_DAC_RAMPRATE, &crosstalk_h);
+	regmap_read(es8326->regmap, ES8326_DAC_CROSSTALK, &crosstalk_l);
+	crosstalk_h &= 0x20;
+	crosstalk_l &= 0xf0;
+	crosstalk = crosstalk_h >> 1 | crosstalk_l >> 4;
+	ucontrol->value.integer.value[0] = crosstalk;
+
+	return 0;
+}
+
+static int es8326_crosstalk1_set(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
+	unsigned int crosstalk_h, crosstalk_l;
+	unsigned int crosstalk;
+
+	crosstalk = ucontrol->value.integer.value[0];
+	regmap_read(es8326->regmap, ES8326_DAC_CROSSTALK, &crosstalk_l);
+	crosstalk_h = (crosstalk & 0x10) << 1;
+	crosstalk_l &= 0x0f;
+	crosstalk_l |= (crosstalk & 0x0f) << 4;
+	regmap_update_bits(es8326->regmap, ES8326_DAC_RAMPRATE,
+			0x20, crosstalk_h);
+	regmap_write(es8326->regmap, ES8326_DAC_CROSSTALK, crosstalk_l);
+
+	return 0;
+}
+
+static int es8326_crosstalk2_get(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
+	unsigned int crosstalk_h, crosstalk_l;
+	unsigned int crosstalk;
+
+	regmap_read(es8326->regmap, ES8326_DAC_RAMPRATE, &crosstalk_h);
+	regmap_read(es8326->regmap, ES8326_DAC_CROSSTALK, &crosstalk_l);
+	crosstalk_h &= 0x10;
+	crosstalk_l &= 0x0f;
+	crosstalk = crosstalk_h  | crosstalk_l;
+	ucontrol->value.integer.value[0] = crosstalk;
+
+	return 0;
+}
+
+static int es8326_crosstalk2_set(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
+	unsigned int crosstalk_h, crosstalk_l;
+	unsigned int crosstalk;
+
+	crosstalk = ucontrol->value.integer.value[0];
+	regmap_read(es8326->regmap, ES8326_DAC_CROSSTALK, &crosstalk_l);
+	crosstalk_h = crosstalk & 0x10;
+	crosstalk_l &= 0xf0;
+	crosstalk_l |= crosstalk & 0x0f;
+	regmap_update_bits(es8326->regmap, ES8326_DAC_RAMPRATE,
+			0x10, crosstalk_h);
+	regmap_write(es8326->regmap, ES8326_DAC_CROSSTALK, crosstalk_l);
+
+	return 0;
+}
+
 static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(dac_vol_tlv, -9550, 50, 0);
 static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(adc_vol_tlv, -9550, 50, 0);
 static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(adc_analog_pga_tlv, 0, 300, 0);
@@ -102,6 +178,10 @@ static const struct snd_kcontrol_new es8326_snd_controls[] = {
 	SOC_SINGLE_TLV("ALC Capture Target Level", ES8326_ALC_LEVEL,
 			0, 0x0f, 0, drc_target_tlv),
 
+	SOC_SINGLE_EXT("CROSSTALK1", SND_SOC_NOPM, 0, 31, 0,
+			es8326_crosstalk1_get, es8326_crosstalk1_set),
+	SOC_SINGLE_EXT("CROSSTALK2", SND_SOC_NOPM, 0, 31, 0,
+			es8326_crosstalk2_get, es8326_crosstalk2_set),
 };
 
 static const struct snd_soc_dapm_widget es8326_dapm_widgets[] = {
@@ -844,6 +924,8 @@ static int es8326_resume(struct snd_soc_component *component)
 	regmap_write(es8326->regmap, ES8326_CLK_CAL_TIME, 0x00);
 	/* calibrate for B version */
 	es8326_calibrate(component);
+	regmap_write(es8326->regmap, ES8326_DAC_CROSSTALK, 0xaa);
+	regmap_write(es8326->regmap, ES8326_DAC_RAMPRATE, 0x00);
 	/* turn off headphone out */
 	regmap_write(es8326->regmap, ES8326_HP_CAL, 0x00);
 	/* set ADC and DAC in low power mode */
diff --git a/sound/soc/codecs/es8326.h b/sound/soc/codecs/es8326.h
index 90a08351d6ac..dfef808673f4 100644
--- a/sound/soc/codecs/es8326.h
+++ b/sound/soc/codecs/es8326.h
@@ -72,6 +72,7 @@
 #define ES8326_DAC_VOL		0x50
 #define ES8326_DRC_RECOVERY	0x53
 #define ES8326_DRC_WINSIZE	0x54
+#define ES8326_DAC_CROSSTALK	0x55
 #define ES8326_HPJACK_TIMER	0x56
 #define ES8326_HPDET_TYPE	0x57
 #define ES8326_INT_SOURCE	0x58
-- 
2.17.1

