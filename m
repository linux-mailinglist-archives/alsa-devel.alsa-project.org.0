Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 686D583C6A3
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jan 2024 16:32:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1055182C;
	Thu, 25 Jan 2024 16:32:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1055182C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706196743;
	bh=zjBwu9W0rqwRURg9L8mUDaX8fs05bU0kiq6bgUgs5BY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ELHVPOi/D6uK9vmesuJbE7RVbR94RghliaVbQFDmExP/GazrKC7KjzrcGtel4Pv/s
	 f/iisF8S99j2My1KA7aKPzsyIfPxJ9btiuQXB3V5/AeD9hM00OVtXWL+GTTYtqB9nT
	 05kJPXgdMIah4HHZUC7jVoLCb+D/K8BRFO6lKiBo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FFFFF805C0; Thu, 25 Jan 2024 16:31:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E53A3F80588;
	Thu, 25 Jan 2024 16:31:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 870A3F805A9; Thu, 25 Jan 2024 16:31:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C0A3F80053
	for <alsa-devel@alsa-project.org>; Thu, 25 Jan 2024 16:31:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C0A3F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=y/tcGVv/
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-599eecbfd5fso266050eaf.3
        for <alsa-devel@alsa-project.org>;
 Thu, 25 Jan 2024 07:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706196678; x=1706801478;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okmBMCvfneah39JFIwu6QSxkQG7oJ5UOCURABzkyOR4=;
        b=y/tcGVv/ww1sjpx4OgTpf2V1cOXn+gi5eSIPtHfckuEAQNHBdCJOUEK6XctuHoKnzv
         ZR9sGrzGaojBytDkTO8RCAo0TFW9PakLY/yWp8wo11XEVzHLHcjlkEm8WsHPlIvh6iwB
         E00qHLkd6y/3KRPwQqW4nsfKBqSPoCqNwGjLfTkWimY1QsMcgBhPKYDYTsLNYD4FuHAj
         /+MMWqjp6MxxTWPPf8CvlREr6CNnCEtoLQIdaqcVHxroFqe/BF8EQJu3Et5O9csDj4BN
         KM4b3ej3C8HQd2XSQZ9R4D34iq/Novhl9+wkzxqqsQoBVXidwQK8KZnYQe2Qdt9FV+Xw
         WBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706196678; x=1706801478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=okmBMCvfneah39JFIwu6QSxkQG7oJ5UOCURABzkyOR4=;
        b=rJ0LZb1+Yjv81b6FwrfPD6O3ieWatP6XG8lerRlI9yqAa2vl9hOrIXbD7wER39C7ty
         6lLiI/UPPok4yK1eVNnOLb/7QJ0UtPggOc7Lv8jr/uNG6M3S9crCjYMsyQVZ+TbDtFgh
         Yjqwh0rmXqBXSZqp0GfdW71DvzmHqTcVoePFhyhubeEXGG6mCJVyYsbSYSz8F8S3kj1K
         +DhKdjuXcNzlPZNN2Lz2wwbgDyo6hFKd1mUs8kLZN/HY9x6nHbavIT8FYUuF+7OJRRRL
         1ZQEGMzAuz6WFnqgYsvugLz7/vK/OcPNMh1GXX8haQTqFBiDa3OS3BwTQN+eCjlqz7P0
         oNUg==
X-Gm-Message-State: AOJu0Yw1YNUTU0rhT/YsblP5HL9A/1TPcHlLb3FFssfy8ueQ8n5YnG/M
	dXbd5TVK4ch50h/lInLr0P21omYW5QKWjyDsvau14V2waNKXP/Bri+9yNPiWA+E=
X-Google-Smtp-Source: 
 AGHT+IH2oX3WT7vkKIeGx5OUmgM24ZDFK1w8j+kEpttVhuKhLTN4u8tLjN+SXlTZgzuBngKuC6G3Dw==
X-Received: by 2002:a05:6820:1c8e:b0:599:ec2d:ef73 with SMTP id
 ct14-20020a0568201c8e00b00599ec2def73mr1026182oob.18.1706196678557;
        Thu, 25 Jan 2024 07:31:18 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id
 d14-20020a4ad34e000000b00599f1741917sm63973oos.43.2024.01.25.07.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 07:31:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] ASoC: codecs: tx-macro: split widgets per different
 LPASS versions
Date: Thu, 25 Jan 2024 16:31:09 +0100
Message-Id: <20240125153110.410295-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240125153110.410295-1-krzysztof.kozlowski@linaro.org>
References: <20240125153110.410295-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OAAJKG3G7YHEWDW47XBVPEJDQUVKSA6S
X-Message-ID-Hash: OAAJKG3G7YHEWDW47XBVPEJDQUVKSA6S
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OAAJKG3G7YHEWDW47XBVPEJDQUVKSA6S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

TX macro codec differs slightly between different Qualcomm Low Power
Audio SubSystem (LPASS) block versions.  In LPASS version 9.2 the
register responsible for TX SMIC MUXn muxes is different, thus to
properly support it, the driver needs to register different widgets per
different LPASS version.

Prepare for supporting this register difference by refactoring existing
code:
1. Move few widgets (TX SMIC MUXn, TX SWR_ADCn, TX SWR_DMICn) out of
   common 'tx_macro_dapm_widgets[]' array to a new per-variant specific
   array 'tx_macro_dapm_widgets_v9[]'.
2. Move also related audio routes into new array.
3. Store pointers to these variant-specific arrays in new variant-data
   structure 'tx_macro_data'.
4. Add variant-specific widgets and routes in component probe, instead
   of driver probe.

The change should have no real impact, except re-shuffling code and
registering some widgets and audio routes in component probe, instead of
driver probe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Keep all the MSM_DMIC/TX DMIC MUX audio routes in the shared
   tx_audio_map, because it does not differ between v9 and v9.2.

2. Rebase. qcom,sm6115-lpass-tx-macro appeared so add new
   lpass_ver_10_sm6115 entry.
---
 sound/soc/codecs/lpass-macro-common.h |   6 +
 sound/soc/codecs/lpass-tx-macro.c     | 377 +++++++++++++++-----------
 2 files changed, 232 insertions(+), 151 deletions(-)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index d3684c7ab930..18f5b8c8e822 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -11,6 +11,12 @@
 /* The soundwire block should be internally reset at probe */
 #define LPASS_MACRO_FLAG_RESET_SWR		BIT(1)
 
+enum lpass_version {
+	LPASS_VER_9_0_0,
+	LPASS_VER_10_0_0,
+	LPASS_VER_11_0_0,
+};
+
 struct lpass_macro {
 	struct device *macro_pd;
 	struct device *dcodec_pd;
diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 124c2e144f33..ecc8565ff4bb 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -253,8 +253,18 @@ struct hpf_work {
 	struct delayed_work dwork;
 };
 
+struct tx_macro_data {
+	unsigned int flags;
+	unsigned int ver;
+	const struct snd_soc_dapm_widget *extra_widgets;
+	size_t extra_widgets_num;
+	const struct snd_soc_dapm_route *extra_routes;
+	size_t extra_routes_num;
+};
+
 struct tx_macro {
 	struct device *dev;
+	const struct tx_macro_data *data;
 	struct snd_soc_component *component;
 	struct hpf_work tx_hpf_work[NUM_DECIMATORS];
 	struct tx_mute_work tx_mute_dwork[NUM_DECIMATORS];
@@ -1235,53 +1245,6 @@ static const struct snd_kcontrol_new tx_dec5_mux = SOC_DAPM_ENUM("tx_dec5", tx_d
 static const struct snd_kcontrol_new tx_dec6_mux = SOC_DAPM_ENUM("tx_dec6", tx_dec6_enum);
 static const struct snd_kcontrol_new tx_dec7_mux = SOC_DAPM_ENUM("tx_dec7", tx_dec7_enum);
 
-static const char * const smic_mux_text[] = {
-	"ZERO", "ADC0", "ADC1", "ADC2", "ADC3", "SWR_DMIC0",
-	"SWR_DMIC1", "SWR_DMIC2", "SWR_DMIC3", "SWR_DMIC4",
-	"SWR_DMIC5", "SWR_DMIC6", "SWR_DMIC7"
-};
-
-static SOC_ENUM_SINGLE_DECL(tx_smic0_enum, CDC_TX_INP_MUX_ADC_MUX0_CFG0,
-			0, smic_mux_text);
-
-static SOC_ENUM_SINGLE_DECL(tx_smic1_enum, CDC_TX_INP_MUX_ADC_MUX1_CFG0,
-			0, smic_mux_text);
-
-static SOC_ENUM_SINGLE_DECL(tx_smic2_enum, CDC_TX_INP_MUX_ADC_MUX2_CFG0,
-			0, smic_mux_text);
-
-static SOC_ENUM_SINGLE_DECL(tx_smic3_enum, CDC_TX_INP_MUX_ADC_MUX3_CFG0,
-			0, smic_mux_text);
-
-static SOC_ENUM_SINGLE_DECL(tx_smic4_enum, CDC_TX_INP_MUX_ADC_MUX4_CFG0,
-			0, smic_mux_text);
-
-static SOC_ENUM_SINGLE_DECL(tx_smic5_enum, CDC_TX_INP_MUX_ADC_MUX5_CFG0,
-			0, smic_mux_text);
-
-static SOC_ENUM_SINGLE_DECL(tx_smic6_enum, CDC_TX_INP_MUX_ADC_MUX6_CFG0,
-			0, smic_mux_text);
-
-static SOC_ENUM_SINGLE_DECL(tx_smic7_enum, CDC_TX_INP_MUX_ADC_MUX7_CFG0,
-			0, smic_mux_text);
-
-static const struct snd_kcontrol_new tx_smic0_mux = SOC_DAPM_ENUM_EXT("tx_smic0", tx_smic0_enum,
-			snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
-static const struct snd_kcontrol_new tx_smic1_mux = SOC_DAPM_ENUM_EXT("tx_smic1", tx_smic1_enum,
-			snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
-static const struct snd_kcontrol_new tx_smic2_mux = SOC_DAPM_ENUM_EXT("tx_smic2", tx_smic2_enum,
-			snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
-static const struct snd_kcontrol_new tx_smic3_mux = SOC_DAPM_ENUM_EXT("tx_smic3", tx_smic3_enum,
-			snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
-static const struct snd_kcontrol_new tx_smic4_mux = SOC_DAPM_ENUM_EXT("tx_smic4", tx_smic4_enum,
-			snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
-static const struct snd_kcontrol_new tx_smic5_mux = SOC_DAPM_ENUM_EXT("tx_smic5", tx_smic5_enum,
-			snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
-static const struct snd_kcontrol_new tx_smic6_mux = SOC_DAPM_ENUM_EXT("tx_smic6", tx_smic6_enum,
-			snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
-static const struct snd_kcontrol_new tx_smic7_mux = SOC_DAPM_ENUM_EXT("tx_smic7", tx_smic7_enum,
-			snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
-
 static const char * const dmic_mux_text[] = {
 	"ZERO", "DMIC0", "DMIC1", "DMIC2", "DMIC3",
 	"DMIC4", "DMIC5", "DMIC6", "DMIC7"
@@ -1427,15 +1390,6 @@ static const struct snd_soc_dapm_widget tx_macro_dapm_widgets[] = {
 	SND_SOC_DAPM_MIXER("TX_AIF3_CAP Mixer", SND_SOC_NOPM, TX_MACRO_AIF3_CAP, 0,
 		tx_aif3_cap_mixer, ARRAY_SIZE(tx_aif3_cap_mixer)),
 
-	SND_SOC_DAPM_MUX("TX SMIC MUX0", SND_SOC_NOPM, 0, 0, &tx_smic0_mux),
-	SND_SOC_DAPM_MUX("TX SMIC MUX1", SND_SOC_NOPM, 0, 0, &tx_smic1_mux),
-	SND_SOC_DAPM_MUX("TX SMIC MUX2", SND_SOC_NOPM, 0, 0, &tx_smic2_mux),
-	SND_SOC_DAPM_MUX("TX SMIC MUX3", SND_SOC_NOPM, 0, 0, &tx_smic3_mux),
-	SND_SOC_DAPM_MUX("TX SMIC MUX4", SND_SOC_NOPM, 0, 0, &tx_smic4_mux),
-	SND_SOC_DAPM_MUX("TX SMIC MUX5", SND_SOC_NOPM, 0, 0, &tx_smic5_mux),
-	SND_SOC_DAPM_MUX("TX SMIC MUX6", SND_SOC_NOPM, 0, 0, &tx_smic6_mux),
-	SND_SOC_DAPM_MUX("TX SMIC MUX7", SND_SOC_NOPM, 0, 0, &tx_smic7_mux),
-
 	SND_SOC_DAPM_MUX("TX DMIC MUX0", SND_SOC_NOPM, 4, 0, &tx_dmic0_mux),
 	SND_SOC_DAPM_MUX("TX DMIC MUX1", SND_SOC_NOPM, 4, 0, &tx_dmic1_mux),
 	SND_SOC_DAPM_MUX("TX DMIC MUX2", SND_SOC_NOPM, 4, 0, &tx_dmic2_mux),
@@ -1445,18 +1399,6 @@ static const struct snd_soc_dapm_widget tx_macro_dapm_widgets[] = {
 	SND_SOC_DAPM_MUX("TX DMIC MUX6", SND_SOC_NOPM, 4, 0, &tx_dmic6_mux),
 	SND_SOC_DAPM_MUX("TX DMIC MUX7", SND_SOC_NOPM, 4, 0, &tx_dmic7_mux),
 
-	SND_SOC_DAPM_INPUT("TX SWR_ADC0"),
-	SND_SOC_DAPM_INPUT("TX SWR_ADC1"),
-	SND_SOC_DAPM_INPUT("TX SWR_ADC2"),
-	SND_SOC_DAPM_INPUT("TX SWR_ADC3"),
-	SND_SOC_DAPM_INPUT("TX SWR_DMIC0"),
-	SND_SOC_DAPM_INPUT("TX SWR_DMIC1"),
-	SND_SOC_DAPM_INPUT("TX SWR_DMIC2"),
-	SND_SOC_DAPM_INPUT("TX SWR_DMIC3"),
-	SND_SOC_DAPM_INPUT("TX SWR_DMIC4"),
-	SND_SOC_DAPM_INPUT("TX SWR_DMIC5"),
-	SND_SOC_DAPM_INPUT("TX SWR_DMIC6"),
-	SND_SOC_DAPM_INPUT("TX SWR_DMIC7"),
 	SND_SOC_DAPM_INPUT("TX DMIC0"),
 	SND_SOC_DAPM_INPUT("TX DMIC1"),
 	SND_SOC_DAPM_INPUT("TX DMIC2"),
@@ -1578,6 +1520,150 @@ static const struct snd_soc_dapm_route tx_audio_map[] = {
 	{"TX DMIC MUX0", "DMIC6", "TX DMIC6"},
 	{"TX DMIC MUX0", "DMIC7", "TX DMIC7"},
 
+	{"TX DEC1 MUX", "MSM_DMIC", "TX DMIC MUX1"},
+	{"TX DMIC MUX1", "DMIC0", "TX DMIC0"},
+	{"TX DMIC MUX1", "DMIC1", "TX DMIC1"},
+	{"TX DMIC MUX1", "DMIC2", "TX DMIC2"},
+	{"TX DMIC MUX1", "DMIC3", "TX DMIC3"},
+	{"TX DMIC MUX1", "DMIC4", "TX DMIC4"},
+	{"TX DMIC MUX1", "DMIC5", "TX DMIC5"},
+	{"TX DMIC MUX1", "DMIC6", "TX DMIC6"},
+	{"TX DMIC MUX1", "DMIC7", "TX DMIC7"},
+
+	{"TX DEC2 MUX", "MSM_DMIC", "TX DMIC MUX2"},
+	{"TX DMIC MUX2", "DMIC0", "TX DMIC0"},
+	{"TX DMIC MUX2", "DMIC1", "TX DMIC1"},
+	{"TX DMIC MUX2", "DMIC2", "TX DMIC2"},
+	{"TX DMIC MUX2", "DMIC3", "TX DMIC3"},
+	{"TX DMIC MUX2", "DMIC4", "TX DMIC4"},
+	{"TX DMIC MUX2", "DMIC5", "TX DMIC5"},
+	{"TX DMIC MUX2", "DMIC6", "TX DMIC6"},
+	{"TX DMIC MUX2", "DMIC7", "TX DMIC7"},
+
+	{"TX DEC3 MUX", "MSM_DMIC", "TX DMIC MUX3"},
+	{"TX DMIC MUX3", "DMIC0", "TX DMIC0"},
+	{"TX DMIC MUX3", "DMIC1", "TX DMIC1"},
+	{"TX DMIC MUX3", "DMIC2", "TX DMIC2"},
+	{"TX DMIC MUX3", "DMIC3", "TX DMIC3"},
+	{"TX DMIC MUX3", "DMIC4", "TX DMIC4"},
+	{"TX DMIC MUX3", "DMIC5", "TX DMIC5"},
+	{"TX DMIC MUX3", "DMIC6", "TX DMIC6"},
+	{"TX DMIC MUX3", "DMIC7", "TX DMIC7"},
+
+	{"TX DEC4 MUX", "MSM_DMIC", "TX DMIC MUX4"},
+	{"TX DMIC MUX4", "DMIC0", "TX DMIC0"},
+	{"TX DMIC MUX4", "DMIC1", "TX DMIC1"},
+	{"TX DMIC MUX4", "DMIC2", "TX DMIC2"},
+	{"TX DMIC MUX4", "DMIC3", "TX DMIC3"},
+	{"TX DMIC MUX4", "DMIC4", "TX DMIC4"},
+	{"TX DMIC MUX4", "DMIC5", "TX DMIC5"},
+	{"TX DMIC MUX4", "DMIC6", "TX DMIC6"},
+	{"TX DMIC MUX4", "DMIC7", "TX DMIC7"},
+
+	{"TX DEC5 MUX", "MSM_DMIC", "TX DMIC MUX5"},
+	{"TX DMIC MUX5", "DMIC0", "TX DMIC0"},
+	{"TX DMIC MUX5", "DMIC1", "TX DMIC1"},
+	{"TX DMIC MUX5", "DMIC2", "TX DMIC2"},
+	{"TX DMIC MUX5", "DMIC3", "TX DMIC3"},
+	{"TX DMIC MUX5", "DMIC4", "TX DMIC4"},
+	{"TX DMIC MUX5", "DMIC5", "TX DMIC5"},
+	{"TX DMIC MUX5", "DMIC6", "TX DMIC6"},
+	{"TX DMIC MUX5", "DMIC7", "TX DMIC7"},
+
+	{"TX DEC6 MUX", "MSM_DMIC", "TX DMIC MUX6"},
+	{"TX DMIC MUX6", "DMIC0", "TX DMIC0"},
+	{"TX DMIC MUX6", "DMIC1", "TX DMIC1"},
+	{"TX DMIC MUX6", "DMIC2", "TX DMIC2"},
+	{"TX DMIC MUX6", "DMIC3", "TX DMIC3"},
+	{"TX DMIC MUX6", "DMIC4", "TX DMIC4"},
+	{"TX DMIC MUX6", "DMIC5", "TX DMIC5"},
+	{"TX DMIC MUX6", "DMIC6", "TX DMIC6"},
+	{"TX DMIC MUX6", "DMIC7", "TX DMIC7"},
+
+	{"TX DEC7 MUX", "MSM_DMIC", "TX DMIC MUX7"},
+	{"TX DMIC MUX7", "DMIC0", "TX DMIC0"},
+	{"TX DMIC MUX7", "DMIC1", "TX DMIC1"},
+	{"TX DMIC MUX7", "DMIC2", "TX DMIC2"},
+	{"TX DMIC MUX7", "DMIC3", "TX DMIC3"},
+	{"TX DMIC MUX7", "DMIC4", "TX DMIC4"},
+	{"TX DMIC MUX7", "DMIC5", "TX DMIC5"},
+	{"TX DMIC MUX7", "DMIC6", "TX DMIC6"},
+	{"TX DMIC MUX7", "DMIC7", "TX DMIC7"},
+};
+
+/* Controls and routes specific to LPASS <= v9.0.0 */
+static const char * const smic_mux_text_v9[] = {
+	"ZERO", "ADC0", "ADC1", "ADC2", "ADC3", "SWR_DMIC0",
+	"SWR_DMIC1", "SWR_DMIC2", "SWR_DMIC3", "SWR_DMIC4",
+	"SWR_DMIC5", "SWR_DMIC6", "SWR_DMIC7"
+};
+
+static SOC_ENUM_SINGLE_DECL(tx_smic0_enum_v9, CDC_TX_INP_MUX_ADC_MUX0_CFG0,
+			0, smic_mux_text_v9);
+
+static SOC_ENUM_SINGLE_DECL(tx_smic1_enum_v9, CDC_TX_INP_MUX_ADC_MUX1_CFG0,
+			0, smic_mux_text_v9);
+
+static SOC_ENUM_SINGLE_DECL(tx_smic2_enum_v9, CDC_TX_INP_MUX_ADC_MUX2_CFG0,
+			0, smic_mux_text_v9);
+
+static SOC_ENUM_SINGLE_DECL(tx_smic3_enum_v9, CDC_TX_INP_MUX_ADC_MUX3_CFG0,
+			0, smic_mux_text_v9);
+
+static SOC_ENUM_SINGLE_DECL(tx_smic4_enum_v9, CDC_TX_INP_MUX_ADC_MUX4_CFG0,
+			0, smic_mux_text_v9);
+
+static SOC_ENUM_SINGLE_DECL(tx_smic5_enum_v9, CDC_TX_INP_MUX_ADC_MUX5_CFG0,
+			0, smic_mux_text_v9);
+
+static SOC_ENUM_SINGLE_DECL(tx_smic6_enum_v9, CDC_TX_INP_MUX_ADC_MUX6_CFG0,
+			0, smic_mux_text_v9);
+
+static SOC_ENUM_SINGLE_DECL(tx_smic7_enum_v9, CDC_TX_INP_MUX_ADC_MUX7_CFG0,
+			0, smic_mux_text_v9);
+
+static const struct snd_kcontrol_new tx_smic0_mux_v9 = SOC_DAPM_ENUM_EXT("tx_smic0", tx_smic0_enum_v9,
+			snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+static const struct snd_kcontrol_new tx_smic1_mux_v9 = SOC_DAPM_ENUM_EXT("tx_smic1", tx_smic1_enum_v9,
+			snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+static const struct snd_kcontrol_new tx_smic2_mux_v9 = SOC_DAPM_ENUM_EXT("tx_smic2", tx_smic2_enum_v9,
+			snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+static const struct snd_kcontrol_new tx_smic3_mux_v9 = SOC_DAPM_ENUM_EXT("tx_smic3", tx_smic3_enum_v9,
+			snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+static const struct snd_kcontrol_new tx_smic4_mux_v9 = SOC_DAPM_ENUM_EXT("tx_smic4", tx_smic4_enum_v9,
+			snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+static const struct snd_kcontrol_new tx_smic5_mux_v9 = SOC_DAPM_ENUM_EXT("tx_smic5", tx_smic5_enum_v9,
+			snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+static const struct snd_kcontrol_new tx_smic6_mux_v9 = SOC_DAPM_ENUM_EXT("tx_smic6", tx_smic6_enum_v9,
+			snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+static const struct snd_kcontrol_new tx_smic7_mux_v9 = SOC_DAPM_ENUM_EXT("tx_smic7", tx_smic7_enum_v9,
+			snd_soc_dapm_get_enum_double, tx_macro_put_dec_enum);
+
+static const struct snd_soc_dapm_widget tx_macro_dapm_widgets_v9[] = {
+	SND_SOC_DAPM_MUX("TX SMIC MUX0", SND_SOC_NOPM, 0, 0, &tx_smic0_mux_v9),
+	SND_SOC_DAPM_MUX("TX SMIC MUX1", SND_SOC_NOPM, 0, 0, &tx_smic1_mux_v9),
+	SND_SOC_DAPM_MUX("TX SMIC MUX2", SND_SOC_NOPM, 0, 0, &tx_smic2_mux_v9),
+	SND_SOC_DAPM_MUX("TX SMIC MUX3", SND_SOC_NOPM, 0, 0, &tx_smic3_mux_v9),
+	SND_SOC_DAPM_MUX("TX SMIC MUX4", SND_SOC_NOPM, 0, 0, &tx_smic4_mux_v9),
+	SND_SOC_DAPM_MUX("TX SMIC MUX5", SND_SOC_NOPM, 0, 0, &tx_smic5_mux_v9),
+	SND_SOC_DAPM_MUX("TX SMIC MUX6", SND_SOC_NOPM, 0, 0, &tx_smic6_mux_v9),
+	SND_SOC_DAPM_MUX("TX SMIC MUX7", SND_SOC_NOPM, 0, 0, &tx_smic7_mux_v9),
+
+	SND_SOC_DAPM_INPUT("TX SWR_ADC0"),
+	SND_SOC_DAPM_INPUT("TX SWR_ADC1"),
+	SND_SOC_DAPM_INPUT("TX SWR_ADC2"),
+	SND_SOC_DAPM_INPUT("TX SWR_ADC3"),
+	SND_SOC_DAPM_INPUT("TX SWR_DMIC0"),
+	SND_SOC_DAPM_INPUT("TX SWR_DMIC1"),
+	SND_SOC_DAPM_INPUT("TX SWR_DMIC2"),
+	SND_SOC_DAPM_INPUT("TX SWR_DMIC3"),
+	SND_SOC_DAPM_INPUT("TX SWR_DMIC4"),
+	SND_SOC_DAPM_INPUT("TX SWR_DMIC5"),
+	SND_SOC_DAPM_INPUT("TX SWR_DMIC6"),
+	SND_SOC_DAPM_INPUT("TX SWR_DMIC7"),
+};
+
+static const struct snd_soc_dapm_route tx_audio_map_v9[] = {
 	{"TX DEC0 MUX", "SWR_MIC", "TX SMIC MUX0"},
 	{"TX SMIC MUX0", NULL, "TX_SWR_CLK"},
 	{"TX SMIC MUX0", "ADC0", "TX SWR_ADC0"},
@@ -1593,16 +1679,6 @@ static const struct snd_soc_dapm_route tx_audio_map[] = {
 	{"TX SMIC MUX0", "SWR_DMIC6", "TX SWR_DMIC6"},
 	{"TX SMIC MUX0", "SWR_DMIC7", "TX SWR_DMIC7"},
 
-	{"TX DEC1 MUX", "MSM_DMIC", "TX DMIC MUX1"},
-	{"TX DMIC MUX1", "DMIC0", "TX DMIC0"},
-	{"TX DMIC MUX1", "DMIC1", "TX DMIC1"},
-	{"TX DMIC MUX1", "DMIC2", "TX DMIC2"},
-	{"TX DMIC MUX1", "DMIC3", "TX DMIC3"},
-	{"TX DMIC MUX1", "DMIC4", "TX DMIC4"},
-	{"TX DMIC MUX1", "DMIC5", "TX DMIC5"},
-	{"TX DMIC MUX1", "DMIC6", "TX DMIC6"},
-	{"TX DMIC MUX1", "DMIC7", "TX DMIC7"},
-
 	{"TX DEC1 MUX", "SWR_MIC", "TX SMIC MUX1"},
 	{"TX SMIC MUX1", NULL, "TX_SWR_CLK"},
 	{"TX SMIC MUX1", "ADC0", "TX SWR_ADC0"},
@@ -1618,16 +1694,6 @@ static const struct snd_soc_dapm_route tx_audio_map[] = {
 	{"TX SMIC MUX1", "SWR_DMIC6", "TX SWR_DMIC6"},
 	{"TX SMIC MUX1", "SWR_DMIC7", "TX SWR_DMIC7"},
 
-	{"TX DEC2 MUX", "MSM_DMIC", "TX DMIC MUX2"},
-	{"TX DMIC MUX2", "DMIC0", "TX DMIC0"},
-	{"TX DMIC MUX2", "DMIC1", "TX DMIC1"},
-	{"TX DMIC MUX2", "DMIC2", "TX DMIC2"},
-	{"TX DMIC MUX2", "DMIC3", "TX DMIC3"},
-	{"TX DMIC MUX2", "DMIC4", "TX DMIC4"},
-	{"TX DMIC MUX2", "DMIC5", "TX DMIC5"},
-	{"TX DMIC MUX2", "DMIC6", "TX DMIC6"},
-	{"TX DMIC MUX2", "DMIC7", "TX DMIC7"},
-
 	{"TX DEC2 MUX", "SWR_MIC", "TX SMIC MUX2"},
 	{"TX SMIC MUX2", NULL, "TX_SWR_CLK"},
 	{"TX SMIC MUX2", "ADC0", "TX SWR_ADC0"},
@@ -1643,16 +1709,6 @@ static const struct snd_soc_dapm_route tx_audio_map[] = {
 	{"TX SMIC MUX2", "SWR_DMIC6", "TX SWR_DMIC6"},
 	{"TX SMIC MUX2", "SWR_DMIC7", "TX SWR_DMIC7"},
 
-	{"TX DEC3 MUX", "MSM_DMIC", "TX DMIC MUX3"},
-	{"TX DMIC MUX3", "DMIC0", "TX DMIC0"},
-	{"TX DMIC MUX3", "DMIC1", "TX DMIC1"},
-	{"TX DMIC MUX3", "DMIC2", "TX DMIC2"},
-	{"TX DMIC MUX3", "DMIC3", "TX DMIC3"},
-	{"TX DMIC MUX3", "DMIC4", "TX DMIC4"},
-	{"TX DMIC MUX3", "DMIC5", "TX DMIC5"},
-	{"TX DMIC MUX3", "DMIC6", "TX DMIC6"},
-	{"TX DMIC MUX3", "DMIC7", "TX DMIC7"},
-
 	{"TX DEC3 MUX", "SWR_MIC", "TX SMIC MUX3"},
 	{"TX SMIC MUX3", NULL, "TX_SWR_CLK"},
 	{"TX SMIC MUX3", "ADC0", "TX SWR_ADC0"},
@@ -1668,16 +1724,6 @@ static const struct snd_soc_dapm_route tx_audio_map[] = {
 	{"TX SMIC MUX3", "SWR_DMIC6", "TX SWR_DMIC6"},
 	{"TX SMIC MUX3", "SWR_DMIC7", "TX SWR_DMIC7"},
 
-	{"TX DEC4 MUX", "MSM_DMIC", "TX DMIC MUX4"},
-	{"TX DMIC MUX4", "DMIC0", "TX DMIC0"},
-	{"TX DMIC MUX4", "DMIC1", "TX DMIC1"},
-	{"TX DMIC MUX4", "DMIC2", "TX DMIC2"},
-	{"TX DMIC MUX4", "DMIC3", "TX DMIC3"},
-	{"TX DMIC MUX4", "DMIC4", "TX DMIC4"},
-	{"TX DMIC MUX4", "DMIC5", "TX DMIC5"},
-	{"TX DMIC MUX4", "DMIC6", "TX DMIC6"},
-	{"TX DMIC MUX4", "DMIC7", "TX DMIC7"},
-
 	{"TX DEC4 MUX", "SWR_MIC", "TX SMIC MUX4"},
 	{"TX SMIC MUX4", NULL, "TX_SWR_CLK"},
 	{"TX SMIC MUX4", "ADC0", "TX SWR_ADC0"},
@@ -1693,16 +1739,6 @@ static const struct snd_soc_dapm_route tx_audio_map[] = {
 	{"TX SMIC MUX4", "SWR_DMIC6", "TX SWR_DMIC6"},
 	{"TX SMIC MUX4", "SWR_DMIC7", "TX SWR_DMIC7"},
 
-	{"TX DEC5 MUX", "MSM_DMIC", "TX DMIC MUX5"},
-	{"TX DMIC MUX5", "DMIC0", "TX DMIC0"},
-	{"TX DMIC MUX5", "DMIC1", "TX DMIC1"},
-	{"TX DMIC MUX5", "DMIC2", "TX DMIC2"},
-	{"TX DMIC MUX5", "DMIC3", "TX DMIC3"},
-	{"TX DMIC MUX5", "DMIC4", "TX DMIC4"},
-	{"TX DMIC MUX5", "DMIC5", "TX DMIC5"},
-	{"TX DMIC MUX5", "DMIC6", "TX DMIC6"},
-	{"TX DMIC MUX5", "DMIC7", "TX DMIC7"},
-
 	{"TX DEC5 MUX", "SWR_MIC", "TX SMIC MUX5"},
 	{"TX SMIC MUX5", NULL, "TX_SWR_CLK"},
 	{"TX SMIC MUX5", "ADC0", "TX SWR_ADC0"},
@@ -1718,16 +1754,6 @@ static const struct snd_soc_dapm_route tx_audio_map[] = {
 	{"TX SMIC MUX5", "SWR_DMIC6", "TX SWR_DMIC6"},
 	{"TX SMIC MUX5", "SWR_DMIC7", "TX SWR_DMIC7"},
 
-	{"TX DEC6 MUX", "MSM_DMIC", "TX DMIC MUX6"},
-	{"TX DMIC MUX6", "DMIC0", "TX DMIC0"},
-	{"TX DMIC MUX6", "DMIC1", "TX DMIC1"},
-	{"TX DMIC MUX6", "DMIC2", "TX DMIC2"},
-	{"TX DMIC MUX6", "DMIC3", "TX DMIC3"},
-	{"TX DMIC MUX6", "DMIC4", "TX DMIC4"},
-	{"TX DMIC MUX6", "DMIC5", "TX DMIC5"},
-	{"TX DMIC MUX6", "DMIC6", "TX DMIC6"},
-	{"TX DMIC MUX6", "DMIC7", "TX DMIC7"},
-
 	{"TX DEC6 MUX", "SWR_MIC", "TX SMIC MUX6"},
 	{"TX SMIC MUX6", NULL, "TX_SWR_CLK"},
 	{"TX SMIC MUX6", "ADC0", "TX SWR_ADC0"},
@@ -1743,16 +1769,6 @@ static const struct snd_soc_dapm_route tx_audio_map[] = {
 	{"TX SMIC MUX6", "SWR_DMIC6", "TX SWR_DMIC6"},
 	{"TX SMIC MUX6", "SWR_DMIC7", "TX SWR_DMIC7"},
 
-	{"TX DEC7 MUX", "MSM_DMIC", "TX DMIC MUX7"},
-	{"TX DMIC MUX7", "DMIC0", "TX DMIC0"},
-	{"TX DMIC MUX7", "DMIC1", "TX DMIC1"},
-	{"TX DMIC MUX7", "DMIC2", "TX DMIC2"},
-	{"TX DMIC MUX7", "DMIC3", "TX DMIC3"},
-	{"TX DMIC MUX7", "DMIC4", "TX DMIC4"},
-	{"TX DMIC MUX7", "DMIC5", "TX DMIC5"},
-	{"TX DMIC MUX7", "DMIC6", "TX DMIC6"},
-	{"TX DMIC MUX7", "DMIC7", "TX DMIC7"},
-
 	{"TX DEC7 MUX", "SWR_MIC", "TX SMIC MUX7"},
 	{"TX SMIC MUX7", NULL, "TX_SWR_CLK"},
 	{"TX SMIC MUX7", "ADC0", "TX SWR_ADC0"},
@@ -1823,10 +1839,41 @@ static const struct snd_kcontrol_new tx_macro_snd_controls[] = {
 		       tx_macro_get_bcs, tx_macro_set_bcs),
 };
 
+static int tx_macro_component_extend(struct snd_soc_component *comp)
+{
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(comp);
+	struct tx_macro *tx = snd_soc_component_get_drvdata(comp);
+	int ret;
+
+	if (tx->data->extra_widgets_num) {
+		ret = snd_soc_dapm_new_controls(dapm, tx->data->extra_widgets,
+						tx->data->extra_widgets_num);
+		if (ret) {
+			dev_err(tx->dev, "failed to add extra widgets: %d\n", ret);
+			return ret;
+		}
+	}
+
+	if (tx->data->extra_routes_num) {
+		ret = snd_soc_dapm_add_routes(dapm, tx->data->extra_routes,
+					      tx->data->extra_routes_num);
+		if (ret) {
+			dev_err(tx->dev, "failed to add extra routes: %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static int tx_macro_component_probe(struct snd_soc_component *comp)
 {
 	struct tx_macro *tx = snd_soc_component_get_drvdata(comp);
-	int i;
+	int i, ret;
+
+	ret = tx_macro_component_extend(comp);
+	if (ret)
+		return ret;
 
 	snd_soc_component_init_regmap(comp, tx->regmap);
 
@@ -1954,17 +2001,16 @@ static int tx_macro_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	kernel_ulong_t flags;
 	struct tx_macro *tx;
 	void __iomem *base;
 	int ret, reg;
 
-	flags = (kernel_ulong_t)device_get_match_data(dev);
-
 	tx = devm_kzalloc(dev, sizeof(*tx), GFP_KERNEL);
 	if (!tx)
 		return -ENOMEM;
 
+	tx->data = device_get_match_data(dev);
+
 	tx->macro = devm_clk_get_optional(dev, "macro");
 	if (IS_ERR(tx->macro))
 		return dev_err_probe(dev, PTR_ERR(tx->macro), "unable to get macro clock\n");
@@ -1977,7 +2023,7 @@ static int tx_macro_probe(struct platform_device *pdev)
 	if (IS_ERR(tx->mclk))
 		return dev_err_probe(dev, PTR_ERR(tx->mclk), "unable to get mclk clock\n");
 
-	if (flags & LPASS_MACRO_FLAG_HAS_NPL_CLOCK) {
+	if (tx->data->flags & LPASS_MACRO_FLAG_HAS_NPL_CLOCK) {
 		tx->npl = devm_clk_get(dev, "npl");
 		if (IS_ERR(tx->npl))
 			return dev_err_probe(dev, PTR_ERR(tx->npl), "unable to get npl clock\n");
@@ -2052,7 +2098,7 @@ static int tx_macro_probe(struct platform_device *pdev)
 
 
 	/* reset soundwire block */
-	if (flags & LPASS_MACRO_FLAG_RESET_SWR)
+	if (tx->data->flags & LPASS_MACRO_FLAG_RESET_SWR)
 		regmap_update_bits(tx->regmap, CDC_TX_CLK_RST_CTRL_SWR_CONTROL,
 				   CDC_TX_SWR_RESET_MASK, CDC_TX_SWR_RESET_ENABLE);
 
@@ -2060,7 +2106,7 @@ static int tx_macro_probe(struct platform_device *pdev)
 			   CDC_TX_SWR_CLK_EN_MASK,
 			   CDC_TX_SWR_CLK_ENABLE);
 
-	if (flags & LPASS_MACRO_FLAG_RESET_SWR)
+	if (tx->data->flags & LPASS_MACRO_FLAG_RESET_SWR)
 		regmap_update_bits(tx->regmap, CDC_TX_CLK_RST_CTRL_SWR_CONTROL,
 				   CDC_TX_SWR_RESET_MASK, 0x0);
 
@@ -2164,25 +2210,54 @@ static const struct dev_pm_ops tx_macro_pm_ops = {
 	SET_RUNTIME_PM_OPS(tx_macro_runtime_suspend, tx_macro_runtime_resume, NULL)
 };
 
+static const struct tx_macro_data lpass_ver_9 = {
+	.flags			= LPASS_MACRO_FLAG_HAS_NPL_CLOCK |
+				  LPASS_MACRO_FLAG_RESET_SWR,
+	.ver			= LPASS_VER_9_0_0,
+	.extra_widgets		= tx_macro_dapm_widgets_v9,
+	.extra_widgets_num	= ARRAY_SIZE(tx_macro_dapm_widgets_v9),
+	.extra_routes		= tx_audio_map_v9,
+	.extra_routes_num	= ARRAY_SIZE(tx_audio_map_v9),
+};
+
+static const struct tx_macro_data lpass_ver_10_sm6115 = {
+	.flags			= LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+	.ver			= LPASS_VER_10_0_0,
+	.extra_widgets		= tx_macro_dapm_widgets_v9,
+	.extra_widgets_num	= ARRAY_SIZE(tx_macro_dapm_widgets_v9),
+	.extra_routes		= tx_audio_map_v9,
+	.extra_routes_num	= ARRAY_SIZE(tx_audio_map_v9),
+};
+
+
+static const struct tx_macro_data lpass_ver_11 = {
+	.flags			= LPASS_MACRO_FLAG_RESET_SWR,
+	.ver			= LPASS_VER_11_0_0,
+	.extra_widgets		= tx_macro_dapm_widgets_v9,
+	.extra_widgets_num	= ARRAY_SIZE(tx_macro_dapm_widgets_v9),
+	.extra_routes		= tx_audio_map_v9,
+	.extra_routes_num	= ARRAY_SIZE(tx_audio_map_v9),
+};
+
 static const struct of_device_id tx_macro_dt_match[] = {
 	{
 		.compatible = "qcom,sc7280-lpass-tx-macro",
-		.data = (void *)(LPASS_MACRO_FLAG_HAS_NPL_CLOCK | LPASS_MACRO_FLAG_RESET_SWR),
+		.data = &lpass_ver_9,
 	}, {
 		.compatible = "qcom,sm6115-lpass-tx-macro",
-		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+		.data = &lpass_ver_10_sm6115,
 	}, {
 		.compatible = "qcom,sm8250-lpass-tx-macro",
-		.data = (void *)(LPASS_MACRO_FLAG_HAS_NPL_CLOCK | LPASS_MACRO_FLAG_RESET_SWR),
+		.data = &lpass_ver_9,
 	}, {
 		.compatible = "qcom,sm8450-lpass-tx-macro",
-		.data = (void *)(LPASS_MACRO_FLAG_HAS_NPL_CLOCK | LPASS_MACRO_FLAG_RESET_SWR),
+		.data = &lpass_ver_9,
 	}, {
 		.compatible = "qcom,sm8550-lpass-tx-macro",
-		.data = (void *)LPASS_MACRO_FLAG_RESET_SWR,
+		.data = &lpass_ver_11,
 	}, {
 		.compatible = "qcom,sc8280xp-lpass-tx-macro",
-		.data = (void *)(LPASS_MACRO_FLAG_HAS_NPL_CLOCK | LPASS_MACRO_FLAG_RESET_SWR),
+		.data = &lpass_ver_9,
 	},
 	{ }
 };
-- 
2.34.1

