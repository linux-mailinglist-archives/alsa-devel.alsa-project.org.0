Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 406CA76D666
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 20:03:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B177823;
	Wed,  2 Aug 2023 20:02:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B177823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690999420;
	bh=fdaWNroSz3paV7Ti/BUf8H74FpjKuhGjaT41yF1b7ck=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qHBc3g+vxS45sJPL9DBJSbEKMdVAYdBRzSZUQGvfCDhohznTcaHJtGYGY7FyoVQEs
	 Ik/AtkYrsLU2+4i0MQNw5kqDjH1eG1ASlXOEzXNFTkHum/jISAciBYODQLB8ARGZdh
	 HIhvYHEuVVwPBPFjlAX8G4+ZPa2E2maRBsvLCIE8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92B59F80578; Wed,  2 Aug 2023 19:59:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94BC1F80632;
	Wed,  2 Aug 2023 19:59:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07A72F805E2; Wed,  2 Aug 2023 19:58:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ABE88F805AF
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 19:58:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABE88F805AF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=oNo4Wjet
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fe2bc2701bso1288095e9.2
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 10:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690999112; x=1691603912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxOrpyuPOmymgtlpLpXF+pVhKHjkFdHFw3wiijDx7h4=;
        b=oNo4WjetICtChH1ktYq4b21m9aftBtQTSD6LlcebwyItLqzIhF7TAMisJPe7yIgXIz
         vg0KkchbM4hQ6e/v+haVCtbS1VbuHjGucUljM+pFrC2+o9iwaF0M0l6K2vMadQEaJ+tP
         Yz7e49XYRobQqI1Augs3Y1352cEwAY7rA69I7fO4UJGyqV+IvRUQapSiCTV6C37ALdYz
         Kz074OS1rFUpq61Pwc4GhaN6eb1UgKEeTR1IlzIfWNE96bhEN1MzeU8r2HBR8X5gqSup
         RdXrNniSwS37eV7RCPnUi5kgfVHGqcwaXhRrTx72nPBtD4T+A0aRyaXEMMew0n64o37M
         PV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690999112; x=1691603912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxOrpyuPOmymgtlpLpXF+pVhKHjkFdHFw3wiijDx7h4=;
        b=QLYuN2Diw+7GijhmYs75rzHHC3W++qFfAebjWdxnAQ/OBp35cy+y+Dc3FIrDaxXMlA
         cG8oYOPFNUtpTgMbIK0ehIUNsAb5rfcO0d1/VUSHTObADmIQ6xAzpsXqLeMG+fLO89xv
         +NhsWSqoCV9vOux3blR/vCJ692LEThlJGoWVM7IoQP3fTlnAxTRWahvugZCk/MK4VK2f
         9rSN2kSe+jeGIunfMNfHUg/eSB5YuFcJbq9qTVUnm7OxrrAEZT3QkeoVKwA+mtaj9oRl
         18R9xztaEoQOiS8qbQFEenDPeycMTv1oXhiCc4A+xNYz5KOa7Oiwo3z53w/B/xtAxKi7
         ZaeQ==
X-Gm-Message-State: ABy/qLaO1iTpLAVyHXMXJBRg6dhA7NcIQXyNyeULFC4HqSFO5AwesLAH
	0q9DNB4EeY2qBKlO/otCujJ9AhMXDdo=
X-Google-Smtp-Source: 
 APBJJlE9K3tR2ClpMYZTwTaCYVhiIb9nZbiQ1C7lY7tlCoz1Rl6MrRaS9ngzVQ5fg3zuMCGQaROKgQ==
X-Received: by 2002:a7b:cb88:0:b0:3fc:f9c:a3e6 with SMTP id
 m8-20020a7bcb88000000b003fc0f9ca3e6mr5561916wmi.9.1690999111841;
        Wed, 02 Aug 2023 10:58:31 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1])
        by smtp.gmail.com with ESMTPSA id
 l23-20020a7bc457000000b003fe20db88ebsm2192439wmi.31.2023.08.02.10.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 10:58:31 -0700 (PDT)
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
Subject: [PATCH 19/27] ASoC: qcom: apq8016_sbc: Map missing jack kcontrols
Date: Wed,  2 Aug 2023 20:57:29 +0300
Message-Id: <20230802175737.263412-20-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230802175737.263412-1-alpernebiyasak@gmail.com>
References: <20230802175737.263412-1-alpernebiyasak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WOI2SYEM6WYOZE4O6HGKDOQ4SFPEZSIG
X-Message-ID-Hash: WOI2SYEM6WYOZE4O6HGKDOQ4SFPEZSIG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WOI2SYEM6WYOZE4O6HGKDOQ4SFPEZSIG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver does not properly map jack pins to kcontrols that PulseAudio
and PipeWire need to handle jack detection events. It seems to support
detecting Headphone and Headset Mic connections. Expose each to
userspace as a kcontrol and add the necessary widgets.

Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---
Tried to match sound/soc/qcom/common.c a bit. But that seems to be
selected by this, maybe it's jack setup code can be reused?

 sound/soc/qcom/apq8016_sbc.c | 37 ++++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
index e54b8961112f..6de533d45e7d 100644
--- a/sound/soc/qcom/apq8016_sbc.c
+++ b/sound/soc/qcom/apq8016_sbc.c
@@ -44,6 +44,17 @@ struct apq8016_sbc_data {
 #define DEFAULT_MCLK_RATE		9600000
 #define MI2S_BCLK_RATE			1536000
 
+static struct snd_soc_jack_pin apq8016_sbc_jack_pins[] = {
+	{
+		.pin = "Mic Jack",
+		.mask = SND_JACK_MICROPHONE,
+	},
+	{
+		.pin = "Headphone Jack",
+		.mask = SND_JACK_HEADPHONE,
+	},
+};
+
 static int apq8016_dai_init(struct snd_soc_pcm_runtime *rtd, int mi2s)
 {
 	struct snd_soc_dai *codec_dai;
@@ -90,13 +101,15 @@ static int apq8016_dai_init(struct snd_soc_pcm_runtime *rtd, int mi2s)
 	if (!pdata->jack_setup) {
 		struct snd_jack *jack;
 
-		rval = snd_soc_card_jack_new(card, "Headset Jack",
-					     SND_JACK_HEADSET |
-					     SND_JACK_HEADPHONE |
-					     SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-					     SND_JACK_BTN_2 | SND_JACK_BTN_3 |
-					     SND_JACK_BTN_4,
-					     &pdata->jack);
+		rval = snd_soc_card_jack_new_pins(card, "Headset Jack",
+						  SND_JACK_HEADSET |
+						  SND_JACK_HEADPHONE |
+						  SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+						  SND_JACK_BTN_2 | SND_JACK_BTN_3 |
+						  SND_JACK_BTN_4,
+						  &pdata->jack,
+						  apq8016_sbc_jack_pins,
+						  ARRAY_SIZE(apq8016_sbc_jack_pins));
 
 		if (rval < 0) {
 			dev_err(card->dev, "Unable to add Headphone Jack\n");
@@ -255,8 +268,14 @@ static void msm8916_qdsp6_add_ops(struct snd_soc_card *card)
 	}
 }
 
-static const struct snd_soc_dapm_widget apq8016_sbc_dapm_widgets[] = {
+static const struct snd_kcontrol_new apq8016_sbc_snd_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
+	SOC_DAPM_PIN_SWITCH("Mic Jack"),
+};
 
+static const struct snd_soc_dapm_widget apq8016_sbc_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Mic Jack", NULL),
 	SND_SOC_DAPM_MIC("Handset Mic", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 	SND_SOC_DAPM_MIC("Secondary Mic", NULL),
@@ -285,6 +304,8 @@ static int apq8016_sbc_platform_probe(struct platform_device *pdev)
 	card->owner = THIS_MODULE;
 	card->dapm_widgets = apq8016_sbc_dapm_widgets;
 	card->num_dapm_widgets = ARRAY_SIZE(apq8016_sbc_dapm_widgets);
+	card->controls = apq8016_sbc_snd_controls;
+	card->num_controls = ARRAY_SIZE(apq8016_sbc_snd_controls);
 
 	ret = qcom_snd_parse_of(card);
 	if (ret)
-- 
2.40.1

