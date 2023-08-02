Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA3176D65A
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 20:01:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E5FB845;
	Wed,  2 Aug 2023 20:00:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E5FB845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690999299;
	bh=oc5gk1XJjGYzCBoz6J7X4YrGf4tf2hoTQ0yGwVRmX5U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Bsmh8n24eCmNgcT+yJAPuR48CsgSH8JKLNCUfbTrpU9Z27otUj38/WLzIt3Ghv4Di
	 t0hmuiimwM/1z/gSARPoYxbYGKytVLdqXwlA0wXzdThp1oip5jwbBlNcqiZhl+znqi
	 sluU9TcN6Sm8F1hV4+MXA2irDYKrwH5I87wYsdT8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2F25F805E8; Wed,  2 Aug 2023 19:58:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 291BBF805E0;
	Wed,  2 Aug 2023 19:58:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7362AF805AE; Wed,  2 Aug 2023 19:58:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2773AF80588
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 19:58:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2773AF80588
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=Pq/1FGIB
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fe32016bc8so1307505e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 10:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690999096; x=1691603896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6nMyjPDcYHJiCu1T+2rryAVPMQB1lBdVoigClnfhE0=;
        b=Pq/1FGIBfPTM8xlFaIMjn1o5wOEU2kj7KT9xR0Ocy74eFT33CbYnmhRBhR6j9R5E17
         JY+Ym9jIvVshplH76FYvLhFYDjAequ6p4yKAyd3p6zPGrYwKGxSUorDNyq0sEIxqk7V6
         TDesnd7jp/JgGl2o6TMcfn8Z5DQzwD5vJ92w2OXss9yUzTbZvDRkzz98k0NPHU4lyIoK
         5+o21smSqiKlegxyL6wmHLoh6Q/ga98Vws/YXX54PxTQOZaYt8JLCa8h2ZKC4B6Qiaew
         snYgYsWQok08PMvzc99N5232Ue9F0+AETxpai+w0wlrgq+1Va0fLhnWWgx3x3Jw95BIl
         qxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690999096; x=1691603896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N6nMyjPDcYHJiCu1T+2rryAVPMQB1lBdVoigClnfhE0=;
        b=UzW9KJvF/KF1NEZi6IV2rZqidh/HrAUINn8MWDZ1fNT7WIkkwOmxWWaBz8XvP03nho
         +sOdjvP2sVIoIWYHGxpI9P3P//0NJsi9mxijYrhtN2ctzYH7EN+8E7hE4TCnF33abkyK
         U998ufx/hA3Kv4bCwlCtNXHT+5IzM7qrgsVkN0Zu5CfSbm5Uy/aUeipApAhYUEumBkJl
         MSiguMWANlByLfmOFd/4UsNIeQsdlQ3gRD2TOfBy4470pQGLEPD3PLgB/42V+5ry0f5H
         bZUvkSdXnAYgcpGtNKFVC8KNwPXrcZx0Y5QBus1kkjLjAolyByLvSBqB7SQpsKm9w3gs
         YRXA==
X-Gm-Message-State: ABy/qLaDprQK5qq8cB5YpfxcWI2miXLrSMYXkjVxQ3fh8oyaLpyRadI1
	Rsu5liPPTvXOSgLNHKaAUTO89uwq9K8=
X-Google-Smtp-Source: 
 APBJJlGPaCnmxQZeBSmFQkM3APRCZ94arRA5batOsSBNcMoomdpSEqWIssz4EhlEA3s+ieoFUM4XnQ==
X-Received: by 2002:a1c:f202:0:b0:3fb:f926:4937 with SMTP id
 s2-20020a1cf202000000b003fbf9264937mr5004542wmc.31.1690999096274;
        Wed, 02 Aug 2023 10:58:16 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1])
        by smtp.gmail.com with ESMTPSA id
 l23-20020a7bc457000000b003fe20db88ebsm2192439wmi.31.2023.08.02.10.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 10:58:15 -0700 (PDT)
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
Subject: [PATCH 11/27] ASoC: imx-es8328: Map missing jack kcontrols
Date: Wed,  2 Aug 2023 20:57:21 +0300
Message-Id: <20230802175737.263412-12-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230802175737.263412-1-alpernebiyasak@gmail.com>
References: <20230802175737.263412-1-alpernebiyasak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RGY6GPS5C3UIYRIWEWV62LINDS2BTXEM
X-Message-ID-Hash: RGY6GPS5C3UIYRIWEWV62LINDS2BTXEM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RGY6GPS5C3UIYRIWEWV62LINDS2BTXEM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver does not properly map jack pins to kcontrols that PulseAudio
and PipeWire need to handle jack detection events. It seems to have a
single detection GPIO pin used to report everything as a Headset. But it
has widgets for Headphone and Mic Jack, so expose both to userspace as
kcontrols.

Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---
Also see https://github.com/xobs/pulseaudio-novena though I don't
really understand PulseAudio configuration.

 sound/soc/fsl/imx-es8328.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/imx-es8328.c b/sound/soc/fsl/imx-es8328.c
index 85bd36fb68a2..6f0d031c1d5f 100644
--- a/sound/soc/fsl/imx-es8328.c
+++ b/sound/soc/fsl/imx-es8328.c
@@ -37,6 +37,16 @@ static struct snd_soc_jack_gpio headset_jack_gpios[] = {
 };
 
 static struct snd_soc_jack headset_jack;
+static struct snd_soc_jack_pin headset_jack_pins[] = {
+	{
+		.pin = "Headphone",
+		.mask = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin = "Mic Jack",
+		.mask = SND_JACK_MICROPHONE,
+	},
+};
 
 static int imx_es8328_dai_init(struct snd_soc_pcm_runtime *rtd)
 {
@@ -46,9 +56,11 @@ static int imx_es8328_dai_init(struct snd_soc_pcm_runtime *rtd)
 
 	/* Headphone jack detection */
 	if (gpio_is_valid(data->jack_gpio)) {
-		ret = snd_soc_card_jack_new(rtd->card, "Headphone",
-					    SND_JACK_HEADPHONE | SND_JACK_BTN_0,
-					    &headset_jack);
+		ret = snd_soc_card_jack_new_pins(rtd->card, "Headphone",
+						 SND_JACK_HEADSET | SND_JACK_BTN_0,
+						 &headset_jack,
+						 headset_jack_pins,
+						 ARRAY_SIZE(headset_jack_pins));
 		if (ret)
 			return ret;
 
@@ -68,6 +80,11 @@ static const struct snd_soc_dapm_widget imx_es8328_dapm_widgets[] = {
 	SND_SOC_DAPM_REGULATOR_SUPPLY("audio-amp", 1, 0),
 };
 
+static const struct snd_kcontrol_new imx_es8328_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Mic Jack"),
+};
+
 static int imx_es8328_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -183,6 +200,8 @@ static int imx_es8328_probe(struct platform_device *pdev)
 	data->card.dev = dev;
 	data->card.dapm_widgets = imx_es8328_dapm_widgets;
 	data->card.num_dapm_widgets = ARRAY_SIZE(imx_es8328_dapm_widgets);
+	data->card.controls = imx_es8328_controls;
+	data->card.num_controls = ARRAY_SIZE(imx_es8328_controls);
 	ret = snd_soc_of_parse_card_name(&data->card, "model");
 	if (ret) {
 		dev_err(dev, "Unable to parse card name\n");
-- 
2.40.1

