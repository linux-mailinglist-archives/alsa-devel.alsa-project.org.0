Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5677D76D661
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 20:03:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A48E7844;
	Wed,  2 Aug 2023 20:02:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A48E7844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690999389;
	bh=Fl1bseDgCLGqKsTqJ/RsW3OTeCygOZy/m6F8rLHLTsI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K+csPXkttNB3qv0HYddu1A7ptkV83YBNm6CtRj0yeRoGMHNZJJaEGHwlo5/WBsaCd
	 cQOqkCpTt6/gfUTDQ8fkDk66WrxGZ8ooG4OTANsmFRPH5YM36UtghVeQuI0VZkfz/A
	 T3nECPzrZhxzdvZECQCxMi1V2sAX4QMK1N63E9Jc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAF56F80621; Wed,  2 Aug 2023 19:59:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 597F9F80618;
	Wed,  2 Aug 2023 19:59:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC055F805C1; Wed,  2 Aug 2023 19:58:32 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 06CF9F805AF
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 19:58:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06CF9F805AF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=ckvh3W+O
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fe110de46dso1436895e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 10:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690999108; x=1691603908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tKsk9a4HVB+S55ZghOAU5wwthWw0fqP95yqfmB/mNM=;
        b=ckvh3W+OUeJ7+Uj1dkezwP69ylQ4jMSPMBJAdJM8Qlk7PWfAU/iOqdG1Rto7DD6h55
         TqRRRZA6G96XtSZG/TvqpfP6S9xE34giI8AiFf/cvdIOe2WM2PzJbA2f8KMxQLeZA8NY
         MJEbnD9jaQlUV98eo+bRqc/UNiDvhIOVbwUZBwB7ZFOUwvos6y8dLPgXEIczMURVTOTx
         IKKPpCOBg+PaSefqX/zuPfeiKXa6OaEXDj9aus9LSPN8rybAFjnO0PZZB79gr66Zce9l
         qkjZZTH2ZzDQprQEK+4EjTVTp2lyz7Hh0Q8BjMu5YsnBEIMMahrRrKNXkZ+ZWRFduINF
         AvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690999108; x=1691603908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9tKsk9a4HVB+S55ZghOAU5wwthWw0fqP95yqfmB/mNM=;
        b=Ew0Y9UiI5VQVD/ejNwfffkvEsIvWuzHitfN5bsjwdFFZSJpyu1jB7lvNzY404Ji0C5
         KhaiFCVUWy0hTOTxseoDpeA+7Ktq2gmIh4kq1Oc2DTnkKAjvLV9CVEM/5ZlM2VcXqzmg
         3M/3iWI429dk1uIehrDz7i7v2CyhjDU1Jz8uTkYX2DVj913LsygUvBWW54XXfsi6oyC4
         n8dGqcedtidezUTJwayFhSyii8h9qHTcOZp4FRXm39LHfMR7eYQejwB04tVpEobJ+5Gp
         xuIyBRSGQ6gIlbiJryh96aCpK9ZI/R60F/xgj3X1yLh4MAAGa019NYqv7iuCSfbxw2SZ
         Ky5Q==
X-Gm-Message-State: ABy/qLYH26d4FmWQ/mNIXxiVZFal7sXAFse15v+RmkDyuC5c5hAvj9kH
	cYEIr1CrpdCcC8ZREUYBqKvToRGP0zs=
X-Google-Smtp-Source: 
 APBJJlEF8cOYoAUKlqHUoCLkwAgJHMLQWtyJ153NH2rnGdVlOoGWexOb01jQilkY+8Ksa0H6pPGIwQ==
X-Received: by 2002:a05:600c:2297:b0:3fe:6f7:60aa with SMTP id
 23-20020a05600c229700b003fe06f760aamr5661333wmf.12.1690999107976;
        Wed, 02 Aug 2023 10:58:27 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1])
        by smtp.gmail.com with ESMTPSA id
 l23-20020a7bc457000000b003fe20db88ebsm2192439wmi.31.2023.08.02.10.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 10:58:27 -0700 (PDT)
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
Subject: [PATCH 17/27] ASoC: mediatek: mt8183-mt6358-ts3a227-max98357: Map
 missing jack kcontrols
Date: Wed,  2 Aug 2023 20:57:27 +0300
Message-Id: <20230802175737.263412-18-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230802175737.263412-1-alpernebiyasak@gmail.com>
References: <20230802175737.263412-1-alpernebiyasak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: N6SBCNDHHCOIHUPHIEOBXLOHQXHYV3Z6
X-Message-ID-Hash: N6SBCNDHHCOIHUPHIEOBXLOHQXHYV3Z6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N6SBCNDHHCOIHUPHIEOBXLOHQXHYV3Z6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver does not properly map jack pins to kcontrols that PulseAudio
and PipeWire need to handle jack detection events. The TS3A227 component
used here can detect Headphones and Headset Mic connections. Expose each
to userspace as kcontrols and add the necessary widgets.

Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---
Tested on a "Cozmo" Chromebook.

 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   | 53 ++++++++++++++++---
 1 file changed, 47 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index ce9aedde7e1e..850f4d949d97 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -592,11 +592,38 @@ static struct snd_soc_dai_link mt8183_mt6358_ts3a227_dai_links[] = {
 	},
 };
 
+static const
+struct snd_kcontrol_new mt8183_mt6358_ts3a227_max98357_snd_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+};
+
+static const
+struct snd_soc_dapm_widget mt8183_mt6358_ts3a227_max98357_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+};
+
+static struct snd_soc_jack_pin mt8183_mt6358_ts3a227_max98357_jack_pins[] = {
+	{
+		.pin	= "Headphone",
+		.mask	= SND_JACK_HEADPHONE,
+	},
+	{
+		.pin	= "Headset Mic",
+		.mask	= SND_JACK_MICROPHONE,
+	},
+};
+
 static struct snd_soc_card mt8183_mt6358_ts3a227_max98357_card = {
 	.name = "mt8183_mt6358_ts3a227_max98357",
 	.owner = THIS_MODULE,
 	.dai_link = mt8183_mt6358_ts3a227_dai_links,
 	.num_links = ARRAY_SIZE(mt8183_mt6358_ts3a227_dai_links),
+	.controls = mt8183_mt6358_ts3a227_max98357_snd_controls,
+	.num_controls = ARRAY_SIZE(mt8183_mt6358_ts3a227_max98357_snd_controls),
+	.dapm_widgets = mt8183_mt6358_ts3a227_max98357_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(mt8183_mt6358_ts3a227_max98357_dapm_widgets),
 };
 
 static struct snd_soc_card mt8183_mt6358_ts3a227_max98357b_card = {
@@ -604,6 +631,10 @@ static struct snd_soc_card mt8183_mt6358_ts3a227_max98357b_card = {
 	.owner = THIS_MODULE,
 	.dai_link = mt8183_mt6358_ts3a227_dai_links,
 	.num_links = ARRAY_SIZE(mt8183_mt6358_ts3a227_dai_links),
+	.controls = mt8183_mt6358_ts3a227_max98357_snd_controls,
+	.num_controls = ARRAY_SIZE(mt8183_mt6358_ts3a227_max98357_snd_controls),
+	.dapm_widgets = mt8183_mt6358_ts3a227_max98357_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(mt8183_mt6358_ts3a227_max98357_dapm_widgets),
 };
 
 static struct snd_soc_codec_conf mt8183_mt6358_ts3a227_rt1015_amp_conf[] = {
@@ -624,6 +655,10 @@ static struct snd_soc_card mt8183_mt6358_ts3a227_rt1015_card = {
 	.num_links = ARRAY_SIZE(mt8183_mt6358_ts3a227_dai_links),
 	.codec_conf = mt8183_mt6358_ts3a227_rt1015_amp_conf,
 	.num_configs = ARRAY_SIZE(mt8183_mt6358_ts3a227_rt1015_amp_conf),
+	.controls = mt8183_mt6358_ts3a227_max98357_snd_controls,
+	.num_controls = ARRAY_SIZE(mt8183_mt6358_ts3a227_max98357_snd_controls),
+	.dapm_widgets = mt8183_mt6358_ts3a227_max98357_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(mt8183_mt6358_ts3a227_max98357_dapm_widgets),
 };
 
 static struct snd_soc_card mt8183_mt6358_ts3a227_rt1015p_card = {
@@ -631,6 +666,10 @@ static struct snd_soc_card mt8183_mt6358_ts3a227_rt1015p_card = {
 	.owner = THIS_MODULE,
 	.dai_link = mt8183_mt6358_ts3a227_dai_links,
 	.num_links = ARRAY_SIZE(mt8183_mt6358_ts3a227_dai_links),
+	.controls = mt8183_mt6358_ts3a227_max98357_snd_controls,
+	.num_controls = ARRAY_SIZE(mt8183_mt6358_ts3a227_max98357_snd_controls),
+	.dapm_widgets = mt8183_mt6358_ts3a227_max98357_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(mt8183_mt6358_ts3a227_max98357_dapm_widgets),
 };
 
 static int
@@ -641,12 +680,14 @@ mt8183_mt6358_ts3a227_max98357_headset_init(struct snd_soc_component *component)
 			snd_soc_card_get_drvdata(component->card);
 
 	/* Enable Headset and 4 Buttons Jack detection */
-	ret = snd_soc_card_jack_new(component->card,
-				    "Headset Jack",
-				    SND_JACK_HEADSET |
-				    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-				    SND_JACK_BTN_2 | SND_JACK_BTN_3,
-				    &priv->headset_jack);
+	ret = snd_soc_card_jack_new_pins(component->card,
+					 "Headset Jack",
+					 SND_JACK_HEADSET |
+					 SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+					 SND_JACK_BTN_2 | SND_JACK_BTN_3,
+					 &priv->headset_jack,
+					 mt8183_mt6358_ts3a227_max98357_jack_pins,
+					 ARRAY_SIZE(mt8183_mt6358_ts3a227_max98357_jack_pins));
 	if (ret)
 		return ret;
 
-- 
2.40.1

