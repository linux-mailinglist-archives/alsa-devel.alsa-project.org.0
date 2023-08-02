Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F6876D670
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 20:06:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B96D820;
	Wed,  2 Aug 2023 20:05:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B96D820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690999560;
	bh=7yxCq8SfvooL1gtNw23fM6/VI3lMDkq615cFtm+a1WA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FPpjmeebK3nwrtFAb4umMhC4+uDnkHvloE2vXvW5DoDlmChUbzPooJ1PG7kcVHHtD
	 ZlM35nLoEz8paH3TUkGrOCWe2Zf46fxyl3hDdOe/WMhQMTme1Ll3WwB/eZ0EbV/nUM
	 zoqR9TJHJKdP+itVf60ycykG2ji+U6f0MyhHDpaU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96B81F8055C; Wed,  2 Aug 2023 19:59:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B59CF8069C;
	Wed,  2 Aug 2023 19:59:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E514F80611; Wed,  2 Aug 2023 19:58:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 561F3F805F2
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 19:58:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 561F3F805F2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=g1wME0Sd
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fbc5d5742eso1255785e9.3
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 10:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690999128; x=1691603928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tNMbLNyqZ+emJZ68zpth6DtJLmrhI+8LXvJVEDQYQ2I=;
        b=g1wME0SdXRtw9CPo/8HDfKuL4GNNtrvZAGMlwVbhYRcNlUlBDfWZX5k7hH6BkQGS35
         ZpHZJG1yusAGfd6t6AdsltXnnV/D6tMnxJCimEBMEdw8ZJ4zPkBqhrrxj6xn0APWDblT
         K2Miia2BQgJIu01mRQFaeB46Mphnc2dXcOUJn5jQeKteVa8vgMlH9aazo29kqhOq9KWz
         hWsF2Czn+GsI9Bgb6Xfbqba9D/2PlNHj4/bB2aFEspi6lQ3Ts1Fi25gX1+Jq1IwP3477
         00t2m8tO0TpVASZqUf8CpwJSpbiK2idu0SCkqn+Y1KXtOukmnEAZ6lFnzJQzqoXBrJhr
         dWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690999128; x=1691603928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tNMbLNyqZ+emJZ68zpth6DtJLmrhI+8LXvJVEDQYQ2I=;
        b=VfWKTw5asXEj9eBJ9nkgkzMg8WzjsbUvVQwfuPcE2gYzNtuFmQIbu8E1Q6ztapLfXh
         p6NkIlYuzTCpZ5cyCjWDjKP2jrVEvVnclP1iq4xnXqvp351RfKVSslYTl32HokGYs8uA
         duQ5lxDGyG7TuJOSdKdMEI+cfrCj0P4CEFlLcxfREiJ3JDJR1KjCzgcVf7eLBEIBJ7EH
         0FL1yjIj2rvX/vW4a6rJxGEeesZ6af5pId4ohUolCMq3cNkBh9V4nbTRD3zSVCdbauAe
         kGPebOc9jdIupBYuLGA0reaMFS5XzSurV5ihsMDNlHvzDulrcxJaHUw871sgA9LGJ+hc
         d9WA==
X-Gm-Message-State: ABy/qLbn8VujrwImqz1ja+mfDF3+HLd180ISlUZMezF+kiyxD4SakHDx
	K6WtSjd9ga+wz3f9sMOgC0qZsUFq8GA=
X-Google-Smtp-Source: 
 APBJJlF+5skmhEb8aNeWM8Qh6e6Wepa+pivxHF2VJRgf2lqm5GL21Nod6FXyIloCW2/y+9tAYg2k3w==
X-Received: by 2002:a1c:7419:0:b0:3fb:e2af:49f6 with SMTP id
 p25-20020a1c7419000000b003fbe2af49f6mr5114900wmc.39.1690999127599;
        Wed, 02 Aug 2023 10:58:47 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1])
        by smtp.gmail.com with ESMTPSA id
 l23-20020a7bc457000000b003fe20db88ebsm2192439wmi.31.2023.08.02.10.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 10:58:47 -0700 (PDT)
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
Subject: [PATCH 27/27] ASoC: samsung: midas_wm1811: Map missing jack kcontrols
Date: Wed,  2 Aug 2023 20:57:37 +0300
Message-Id: <20230802175737.263412-28-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230802175737.263412-1-alpernebiyasak@gmail.com>
References: <20230802175737.263412-1-alpernebiyasak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SF2OE2VICHLEE2QT7COEGE55POQY63VF
X-Message-ID-Hash: SF2OE2VICHLEE2QT7COEGE55POQY63VF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SF2OE2VICHLEE2QT7COEGE55POQY63VF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver does not map jack pins to kcontrols that PulseAudio/PipeWire
need to handle jack detection events. The WM1811 codec used here seems
to support detecting Headphone and Headset Mic connections. Expose each
to userspace as a kcontrol and add the necessary widgets.

Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---
There's a "HP" widget as well, should the jack kcontrol use that?
Would SND_JACK_MECHANICAL be useful as a kcontrol as well?

 sound/soc/samsung/midas_wm1811.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/sound/soc/samsung/midas_wm1811.c b/sound/soc/samsung/midas_wm1811.c
index 6931b9a45b3e..44b32f5cddca 100644
--- a/sound/soc/samsung/midas_wm1811.c
+++ b/sound/soc/samsung/midas_wm1811.c
@@ -38,6 +38,17 @@ struct midas_priv {
 	struct snd_soc_jack headset_jack;
 };
 
+static struct snd_soc_jack_pin headset_jack_pins[] = {
+	{
+		.pin = "Headphone",
+		.mask = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin = "Headset Mic",
+		.mask = SND_JACK_MICROPHONE,
+	},
+};
+
 static int midas_start_fll1(struct snd_soc_pcm_runtime *rtd, unsigned int rate)
 {
 	struct snd_soc_card *card = rtd->card;
@@ -246,6 +257,7 @@ static const struct snd_kcontrol_new midas_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Main Mic"),
 	SOC_DAPM_PIN_SWITCH("Sub Mic"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+	SOC_DAPM_PIN_SWITCH("Headphone"),
 
 	SOC_DAPM_PIN_SWITCH("FM In"),
 };
@@ -261,6 +273,7 @@ static const struct snd_soc_dapm_widget midas_dapm_widgets[] = {
 	SND_SOC_DAPM_LINE("HDMI", NULL),
 	SND_SOC_DAPM_LINE("FM In", midas_fm_set),
 
+	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 	SND_SOC_DAPM_MIC("Main Mic", midas_mic_bias),
 	SND_SOC_DAPM_MIC("Sub Mic", midas_submic_bias),
@@ -305,11 +318,13 @@ static int midas_late_probe(struct snd_soc_card *card)
 		return ret;
 	}
 
-	ret = snd_soc_card_jack_new(card, "Headset",
-			SND_JACK_HEADSET | SND_JACK_MECHANICAL |
-			SND_JACK_BTN_0 | SND_JACK_BTN_1 | SND_JACK_BTN_2 |
-			SND_JACK_BTN_3 | SND_JACK_BTN_4 | SND_JACK_BTN_5,
-			&priv->headset_jack);
+	ret = snd_soc_card_jack_new_pins(card, "Headset",
+					 SND_JACK_HEADSET | SND_JACK_MECHANICAL |
+					 SND_JACK_BTN_0 | SND_JACK_BTN_1 | SND_JACK_BTN_2 |
+					 SND_JACK_BTN_3 | SND_JACK_BTN_4 | SND_JACK_BTN_5,
+					 &priv->headset_jack,
+					 headset_jack_pins,
+					 ARRAY_SIZE(headset_jack_pins));
 	if (ret)
 		return ret;
 
-- 
2.40.1

