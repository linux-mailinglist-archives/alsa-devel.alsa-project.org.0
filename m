Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A9F76D669
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 20:04:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CF8DE10;
	Wed,  2 Aug 2023 20:03:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CF8DE10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690999468;
	bh=ow6fDWt0WObDBYahHVnM6QbjxhM0w9c6lGP7g/cwpr4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tcirq9j4KMybeA+I8FZozbBeXCUNEUmYibllMznKs6a86mVj96gwzrckbGm7sY7lU
	 VM8Z0g02wOv2hIMJcGYfq2A0zu+Uae6fRt+ok3VJWNUo9XsTv2uHPjP9FxyPoOr0ef
	 5rYSZq5QnDcDY02OrWyN8+s8rNXOFE/5h+zRRJkU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5D5BF8065E; Wed,  2 Aug 2023 19:59:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F51FF8065B;
	Wed,  2 Aug 2023 19:59:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29580F80558; Wed,  2 Aug 2023 19:58:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E880F805E6
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 19:58:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E880F805E6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=MqN6xWER
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fbef8ad9bbso1523135e9.0
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 10:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690999118; x=1691603918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivMSWY5W5vVdPZxQIPJMmrp6wGH4fY48CYl1yy0Ej0E=;
        b=MqN6xWERzMdTN+8tcVQSYKf9fLJTD2JZeiFLCObyl03B60/xzXmwB02zYmsL/6x5bh
         OypDvc0pipYf79vcMZBq/krvgrlOWmGzv8CDKGkHLLK7TgJU4MVfnrvrDh2thBvBT1dd
         QkoovvMpj5cgJVQfpsnAXhS6tMxnLU+wwEHTjMLCX3OtsGSbWfFbxjftEWlabVbs5EUY
         aXBMEU+9yTyyFnJ/4at2Acvmhpbn5B/B0LUutW3a7+HLu8sBqpNyPmx1mb4Zg4z+wi6+
         1LcEYnMoL85zbG7A/QuYxq6WKO5Hj0q4Bbg+zKZFayu/C06IqhWqdqwCKyAN/n6clMZC
         myAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690999118; x=1691603918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ivMSWY5W5vVdPZxQIPJMmrp6wGH4fY48CYl1yy0Ej0E=;
        b=cMQbIJBIG5oP2w7WLZxJgGSbGuWRcBdzuIaaef1RDHN36ytcLstxYUuS0N2zX+NNqr
         Fvqi66Vz1Xk4TY+4B+dI295X1N5V0GJw0eJ4NU9as6ZKeDC4s1JiZ8ArihDxJgKpScJP
         BkZmhku9B8NxI7WqJ2o5hx5d1t8CbC/sGXUGlwgBtNec9PYElrtJwRF7oU66FHeuZDRq
         NI57xAt8q2kR0S1gwb+UjQp3BiwTMih+pN2TizS1NjHuO17WLslndQuuyGTZdzNLQ0Gz
         dc5P31CZWUTwkMk1ctVKM6N/1itu5xX0HVCr+qybqaGrIzpWYzHIW7OU7lfn2BxNKDyR
         aN+g==
X-Gm-Message-State: ABy/qLZCcPJD0Et1vcwUgR6Oofy2uzCj1PHc35fRfuuJdBuWmBVrIthq
	NIabuE7HI8LzHti+oQoBfsyi0S7z6lk=
X-Google-Smtp-Source: 
 APBJJlGB+L4H3MvyOOJOR2XlHFtV3VEIC2qwY2/AoQPP1pkVYrM+PTm/KjqODvQdydcUzgWfP3aCAA==
X-Received: by 2002:a7b:cc12:0:b0:3fb:dd9c:72d2 with SMTP id
 f18-20020a7bcc12000000b003fbdd9c72d2mr5153102wmh.31.1690999117652;
        Wed, 02 Aug 2023 10:58:37 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1])
        by smtp.gmail.com with ESMTPSA id
 l23-20020a7bc457000000b003fe20db88ebsm2192439wmi.31.2023.08.02.10.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 10:58:37 -0700 (PDT)
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
Subject: [PATCH 22/27] ASoC: qcom: sdm845: Map missing jack kcontrols
Date: Wed,  2 Aug 2023 20:57:32 +0300
Message-Id: <20230802175737.263412-23-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230802175737.263412-1-alpernebiyasak@gmail.com>
References: <20230802175737.263412-1-alpernebiyasak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Q5YINVGX7GJIBOXD7JBEORTED3IZMBJS
X-Message-ID-Hash: Q5YINVGX7GJIBOXD7JBEORTED3IZMBJS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q5YINVGX7GJIBOXD7JBEORTED3IZMBJS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver does not properly map jack pins to kcontrols that PulseAudio
and PipeWire need to handle jack detection events. The RT5663 codec used
here can detect Headphone and Headset Mic connections. Expose each to
userspace as a kcontrol.

Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---

 sound/soc/qcom/sdm845.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index 02612af714a8..29d23fe5dfa2 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -42,6 +42,17 @@ struct sdm845_snd_data {
 	struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
 };
 
+static struct snd_soc_jack_pin sdm845_jack_pins[] = {
+	{
+		.pin = "Headphone Jack",
+		.mask = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin = "Headset Mic",
+		.mask = SND_JACK_MICROPHONE,
+	},
+};
+
 static unsigned int tdm_slot_offset[8] = {0, 4, 8, 12, 16, 20, 24, 28};
 
 static int sdm845_slim_snd_hw_params(struct snd_pcm_substream *substream,
@@ -242,12 +253,14 @@ static int sdm845_dai_init(struct snd_soc_pcm_runtime *rtd)
 
 
 	if (!pdata->jack_setup) {
-		rval = snd_soc_card_jack_new(card, "Headset Jack",
-				SND_JACK_HEADSET |
-				SND_JACK_HEADPHONE |
-				SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-				SND_JACK_BTN_2 | SND_JACK_BTN_3,
-				&pdata->jack);
+		rval = snd_soc_card_jack_new_pins(card, "Headset Jack",
+						  SND_JACK_HEADSET |
+						  SND_JACK_HEADPHONE |
+						  SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+						  SND_JACK_BTN_2 | SND_JACK_BTN_3,
+						  &pdata->jack,
+						  sdm845_jack_pins,
+						  ARRAY_SIZE(sdm845_jack_pins));
 
 		if (rval < 0) {
 			dev_err(card->dev, "Unable to add Headphone Jack\n");
@@ -539,6 +552,11 @@ static const struct snd_soc_dapm_widget sdm845_snd_widgets[] = {
 	SND_SOC_DAPM_MIC("Int Mic", NULL),
 };
 
+static const struct snd_kcontrol_new sdm845_snd_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+};
+
 static void sdm845_add_ops(struct snd_soc_card *card)
 {
 	struct snd_soc_dai_link *link;
@@ -572,6 +590,8 @@ static int sdm845_snd_platform_probe(struct platform_device *pdev)
 	card->driver_name = DRIVER_NAME;
 	card->dapm_widgets = sdm845_snd_widgets;
 	card->num_dapm_widgets = ARRAY_SIZE(sdm845_snd_widgets);
+	card->controls = sdm845_snd_controls;
+	card->num_controls = ARRAY_SIZE(sdm845_snd_controls);
 	card->dev = dev;
 	card->owner = THIS_MODULE;
 	dev_set_drvdata(dev, card);
-- 
2.40.1

