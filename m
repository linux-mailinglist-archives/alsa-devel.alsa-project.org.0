Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A374876D671
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 20:06:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90F13E87;
	Wed,  2 Aug 2023 20:05:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90F13E87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690999568;
	bh=VT99jrrLdJXWXH5hJGp/KoCfBgX+DjAciXo1+sY7kvs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GhNQlCu0yFTICiGMBsG4YLRjvX8HgA7VFXmLBHUGxvbElogyDPkfDpQsWp/lTP5ys
	 KZjyD8m5U6NdUbvMRbnO9yqGIgpmeOComAEdkP6p5T2+h/7MJ4b2OeBBfgDN/vE5Bg
	 HwSWxnJn0RPMx5U/fwaiBnROGxz2cXtkKNmSoHeg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFE39F8069F; Wed,  2 Aug 2023 19:59:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F212F8069F;
	Wed,  2 Aug 2023 19:59:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A794F8067F; Wed,  2 Aug 2023 19:59:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 20632F80149
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 19:58:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20632F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=RJ4Ld/iv
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3fe24dd8898so1324385e9.2
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 10:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690999084; x=1691603884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5e55/3niGxnTXERcmKYSB94dQwx71jJXMxMhyp26po=;
        b=RJ4Ld/ivmitOHIy6lTXMkEVG49CIs5bqeUEU0wDNDAPlLud4dF2xxgEXUSBvixy2mf
         UslIRyJGR5uGBgM3lFWPetavx6dTJZSYep4mSfril2gJvVWWCzK31xYK+sKaUnCxdgCj
         jwvspYMiCmFB96tmFahpDx9lBdpckAWCEBDmDpYTOea6N3KAiaa5CPg/iHqQOCQ3OpkQ
         WW5VI3oDYHeNjvv2XgkkY6FG7tqkphk7HvUQfMofDp+tiC5ZilzPifOY20Xp8oGrTXCv
         2InKyYQ0LsfPa0vOisXg+/5DA+xQUIzSRtjW1IYmHgsCPDangDcbHMVHhVVpAgzJDV9Z
         q3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690999084; x=1691603884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z5e55/3niGxnTXERcmKYSB94dQwx71jJXMxMhyp26po=;
        b=eY59+u3FMWa3GNTYDwGckLtpPVxb+GEqzr9LD1HpEPzH9FUjsz2mB3gQNNwzGyl7Tn
         xzVg9v8SuM8XpKlDXpm/pNDxvkdqIsS5VXuFrUV+jBtHxiXTLMV/n04oT4xkQAOU5+Al
         wMGGRbxy1AGRl4xbWBXW2jsiNnZfvKibr0euW4jzc0FJkhCYW6orKvYpbY60/zF836el
         gW16GdzliTKiXegG/pY8K9+mKUy6yjXCvh22TcZE1WAYQOK6GRUjB15YSmp/ChB5WkjL
         TLrbl0KF8FBjsGpGuLs7sdkt9+oNwF8x+sv+LqzbCaKx1CwXx/Y2bXxyyZnqoHBya6sO
         txeA==
X-Gm-Message-State: ABy/qLbr1VspOeI0L2yZYZV2fGRXtks0SlJXRks0pRd00r7VmPs7UVtS
	nqGhKEUhxAdhliKaPmBG20s9QeVmF1I=
X-Google-Smtp-Source: 
 APBJJlHe5rsnsWTWy8R/4Vk0CgbZNnBGdJd50hzwNNAsvA3gYagQGA3Vz0KZ61Sahpqg0dwkZEaM9w==
X-Received: by 2002:a05:600c:2210:b0:3fe:ad4:27b1 with SMTP id
 z16-20020a05600c221000b003fe0ad427b1mr5437497wml.28.1690999084261;
        Wed, 02 Aug 2023 10:58:04 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1])
        by smtp.gmail.com with ESMTPSA id
 l23-20020a7bc457000000b003fe20db88ebsm2192439wmi.31.2023.08.02.10.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 10:58:03 -0700 (PDT)
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
To: alsa-devel@alsa-project.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>
Subject: [PATCH 05/27] ASoC: Intel: avs: da7219: Map missing jack kcontrols
Date: Wed,  2 Aug 2023 20:57:15 +0300
Message-Id: <20230802175737.263412-6-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230802175737.263412-1-alpernebiyasak@gmail.com>
References: <20230802175737.263412-1-alpernebiyasak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3NAK676IDGTTCBGOMOSL5KEGSJ5T3PVQ
X-Message-ID-Hash: 3NAK676IDGTTCBGOMOSL5KEGSJ5T3PVQ
X-MailFrom: alpernebiyasak@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3NAK676IDGTTCBGOMOSL5KEGSJ5T3PVQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver does not properly map jack pins to kcontrols that PulseAudio
and PipeWire need to handle jack detection events. The DA7219 codec used
here can detect Headphones, Headset Mic and Line Out connections. Expose
each to userspace as kcontrols and add the necessary widgets.

Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---
I'm not sure the use of devm_kmemdup is necessary here, but it's what
avs/boards/nau8825.c does, I copied from that. Is it just to sidestep
the "const" modifier on snd_soc_jack_pin?

Also see a similar construct in nt8625.c (already in linux-next):
https://lore.kernel.org/all/20230629112449.1755928-8-cezary.rojewski@intel.com/

 sound/soc/intel/avs/boards/da7219.c | 34 +++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/avs/boards/da7219.c b/sound/soc/intel/avs/boards/da7219.c
index 964a763732ab..85014d98f7e8 100644
--- a/sound/soc/intel/avs/boards/da7219.c
+++ b/sound/soc/intel/avs/boards/da7219.c
@@ -22,6 +22,7 @@
 static const struct snd_kcontrol_new card_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+	SOC_DAPM_PIN_SWITCH("Line Out"),
 };
 
 static int platform_clock_control(struct snd_soc_dapm_widget *w,
@@ -55,6 +56,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 static const struct snd_soc_dapm_widget card_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_LINE("Line Out", NULL),
 	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0, platform_clock_control,
 			    SND_SOC_DAPM_POST_PMD | SND_SOC_DAPM_PRE_PMU),
 };
@@ -68,6 +70,22 @@ static const struct snd_soc_dapm_route card_base_routes[] = {
 
 	{ "Headphone Jack", NULL, "Platform Clock" },
 	{ "Headset Mic", NULL, "Platform Clock" },
+	{ "Line Out", NULL, "Platform Clock" },
+};
+
+static const struct snd_soc_jack_pin card_headset_pins[] = {
+	{
+		.pin = "Headphone Jack",
+		.mask = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin = "Headset Mic",
+		.mask = SND_JACK_MICROPHONE,
+	},
+	{
+		.pin = "Line Out",
+		.mask = SND_JACK_LINEOUT,
+	},
 };
 
 static int avs_da7219_codec_init(struct snd_soc_pcm_runtime *runtime)
@@ -75,7 +93,9 @@ static int avs_da7219_codec_init(struct snd_soc_pcm_runtime *runtime)
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(runtime, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	struct snd_soc_card *card = runtime->card;
+	struct snd_soc_jack_pin *pins;
 	struct snd_soc_jack *jack;
+	int num_pins;
 	int clk_freq;
 	int ret;
 
@@ -91,14 +111,20 @@ static int avs_da7219_codec_init(struct snd_soc_pcm_runtime *runtime)
 		return ret;
 	}
 
+	num_pins = ARRAY_SIZE(card_headset_pins);
+	pins = devm_kmemdup(card->dev, card_headset_pins, sizeof(*pins) * num_pins, GFP_KERNEL);
+	if (!pins)
+		return -ENOMEM;
+
 	/*
 	 * Headset buttons map to the google Reference headset.
 	 * These can be configured by userspace.
 	 */
-	ret = snd_soc_card_jack_new(card, "Headset Jack",
-				    SND_JACK_HEADSET | SND_JACK_BTN_0 |
-				    SND_JACK_BTN_1 | SND_JACK_BTN_2 |
-				    SND_JACK_BTN_3 | SND_JACK_LINEOUT, jack);
+	ret = snd_soc_card_jack_new_pins(card, "Headset Jack",
+					 SND_JACK_HEADSET | SND_JACK_BTN_0 |
+					 SND_JACK_BTN_1 | SND_JACK_BTN_2 |
+					 SND_JACK_BTN_3 | SND_JACK_LINEOUT,
+					 jack, pins, num_pins);
 	if (ret) {
 		dev_err(card->dev, "Headset Jack creation failed: %d\n", ret);
 		return ret;
-- 
2.40.1

