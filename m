Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2EF76D667
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 20:03:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EC97886;
	Wed,  2 Aug 2023 20:03:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EC97886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690999434;
	bh=ug6nzxRs9glhiVgb2Ea08/qmpNdzgRpg07YW3+i9oSU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vVrhHCGgcQ6ZdK6j0aTpmuDnaUuE4ofQzFJrQ85N8dOFCDkQfmzRj3WhiNqX8y/Tk
	 2TgYyiv2V52iOyH9LzGpHG9TCEUjCFTyWYQFmhlGeWHBlnDcmj8XU+CEXXoLgHK15U
	 rG0puxCRex6H0O45rMG+VxxPqbbOIvU4ucT8Lmi8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1A32F8063C; Wed,  2 Aug 2023 19:59:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5B70F80637;
	Wed,  2 Aug 2023 19:59:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6AB7F805E4; Wed,  2 Aug 2023 19:58:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 753D4F805DF
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 19:58:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 753D4F805DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=PgoxqIWg
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fbf1b82d9cso1211595e9.2
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 10:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690999114; x=1691603914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+3O1DghoKTsvX8XNtwYPlplZlPGOuzWPkOeAp7AhV4=;
        b=PgoxqIWgtjL86OEBXvSnfsDkFquIuj6IG9GHhXDef7BAFe669yJ8pdHyvfdrYYwBlD
         GJC2YPeLVB7RRDLPXxqeK7DpCf64n+Y0JfuX5QUFoCDLTA1cTLmqwK6MWJXNnoQn9lZ9
         Fnm5eKJbAGoQRfBAAA6Vkn/yc7R5iHcMtX3E9pHKhDjSa85/yQQQfd0ZF1wY8dwEV2AL
         RoC+t9Qx2nm1lUj1c6k9px/zJAIAwTEAFH73/bvyf5o51OKy6gwrFhdABUXUOoaSHxP5
         6UfFHPVJT8zl7mMVEEeo5atAu8JrfZkm8Ve/hqIvlWLmt78EyLV8gdlSoDrl+9IaOsBt
         k2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690999114; x=1691603914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+3O1DghoKTsvX8XNtwYPlplZlPGOuzWPkOeAp7AhV4=;
        b=QCNUa+0nWZshXt6mEqrdUOpcBcP0196BJANzX5YXnfEPgL8cSOsMolQreCadZm5Vjv
         hcXiy6Twc8xTbX7sOyrza0p1nb7xOb66GsYeVQYVO5X3yAAGVp4KzNEeYWJxY19Eo6Cw
         Cc1EjcnwJvvYEBgkeo+VNR/NuwTYeBAayyai2YtwQbvJ9LI6b0GufKyObvQ4rI07N3pD
         oofOBKhA4w/NC6K/NIELmtzZR8jUsU2dBsrDLor6q3RITa9WvZzNRIYHjRGgZO/wjvpp
         G6l0TuXLwH+egQruxEg1TOWbvLI2hwP31rUaegYs4nAgJhdQKbiDPdUj16xYuxvRAEhz
         cxBg==
X-Gm-Message-State: ABy/qLYrJsqKE2Lj2gM+gVbtWWrtfPtCPBLMwVlQz7myVZ0zg/Rduwne
	kHvv3MzIHVXuFtgnGrJJVzSvo002Tv8=
X-Google-Smtp-Source: 
 APBJJlFXfxujtj6YpCKjtWZNCMBWWVwJcXqOlCDQOj6i8alThDmQeh9bj8gaybKQUMc6C5J1umD6GQ==
X-Received: by 2002:a7b:c5d9:0:b0:3f7:678c:74b0 with SMTP id
 n25-20020a7bc5d9000000b003f7678c74b0mr5632761wmk.12.1690999113752;
        Wed, 02 Aug 2023 10:58:33 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1])
        by smtp.gmail.com with ESMTPSA id
 l23-20020a7bc457000000b003fe20db88ebsm2192439wmi.31.2023.08.02.10.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 10:58:33 -0700 (PDT)
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
Subject: [PATCH 20/27] ASoC: qcom: sc7180: Map missing jack kcontrols
Date: Wed,  2 Aug 2023 20:57:30 +0300
Message-Id: <20230802175737.263412-21-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230802175737.263412-1-alpernebiyasak@gmail.com>
References: <20230802175737.263412-1-alpernebiyasak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZOEKKKFGJGR34H6SAATJL6BG33CY7IIZ
X-Message-ID-Hash: ZOEKKKFGJGR34H6SAATJL6BG33CY7IIZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZOEKKKFGJGR34H6SAATJL6BG33CY7IIZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver does not properly map jack pins to kcontrols that PulseAudio
and PipeWire need to handle jack detection events. The RT5682 and
RT5682s codecs used here can detect Headphone and Headset Mic
connections. Expose each to userspace as a kcontrol.

Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---

 sound/soc/qcom/sc7180.c | 40 +++++++++++++++++++++++++++++++++-------
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
index f5f7c64b23a2..57c5f35dfcc5 100644
--- a/sound/soc/qcom/sc7180.c
+++ b/sound/soc/qcom/sc7180.c
@@ -42,6 +42,17 @@ static void sc7180_jack_free(struct snd_jack *jack)
 	snd_soc_component_set_jack(component, NULL, NULL);
 }
 
+static struct snd_soc_jack_pin sc7180_jack_pins[] = {
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
 static int sc7180_headset_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
@@ -51,13 +62,14 @@ static int sc7180_headset_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_jack *jack;
 	int rval;
 
-	rval = snd_soc_card_jack_new(
-			card, "Headset Jack",
-			SND_JACK_HEADSET |
-			SND_JACK_HEADPHONE |
-			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-			SND_JACK_BTN_2 | SND_JACK_BTN_3,
-			&pdata->hs_jack);
+	rval = snd_soc_card_jack_new_pins(card, "Headset Jack",
+					  SND_JACK_HEADSET |
+					  SND_JACK_HEADPHONE |
+					  SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+					  SND_JACK_BTN_2 | SND_JACK_BTN_3,
+					  &pdata->hs_jack,
+					  sc7180_jack_pins,
+					  ARRAY_SIZE(sc7180_jack_pins));
 
 	if (rval < 0) {
 		dev_err(card->dev, "Unable to add Headset Jack\n");
@@ -297,6 +309,11 @@ static const struct snd_soc_dapm_widget sc7180_snd_widgets[] = {
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 };
 
+static const struct snd_kcontrol_new sc7180_snd_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+};
+
 static const struct snd_soc_dapm_widget sc7180_adau7002_snd_widgets[] = {
 	SND_SOC_DAPM_MIC("DMIC", NULL),
 };
@@ -320,6 +337,11 @@ static const struct snd_soc_dapm_widget sc7180_snd_dual_mic_widgets[] = {
 	SND_SOC_DAPM_MUX("Dmic Mux", SND_SOC_NOPM, 0, 0, &sc7180_dmic_mux_control),
 };
 
+static const struct snd_kcontrol_new sc7180_snd_dual_mic_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+};
+
 static const struct snd_soc_dapm_route sc7180_snd_dual_mic_audio_route[] = {
 	{"Dmic Mux", "Front Mic", "DMIC"},
 	{"Dmic Mux", "Rear Mic", "DMIC"},
@@ -348,10 +370,14 @@ static int sc7180_snd_platform_probe(struct platform_device *pdev)
 	card->dev = dev;
 	card->dapm_widgets = sc7180_snd_widgets;
 	card->num_dapm_widgets = ARRAY_SIZE(sc7180_snd_widgets);
+	card->controls = sc7180_snd_controls;
+	card->num_controls = ARRAY_SIZE(sc7180_snd_controls);
 
 	if (of_property_read_bool(dev->of_node, "dmic-gpios")) {
 		card->dapm_widgets = sc7180_snd_dual_mic_widgets,
 		card->num_dapm_widgets = ARRAY_SIZE(sc7180_snd_dual_mic_widgets),
+		card->controls = sc7180_snd_dual_mic_controls,
+		card->num_controls = ARRAY_SIZE(sc7180_snd_dual_mic_controls),
 		card->dapm_routes = sc7180_snd_dual_mic_audio_route,
 		card->num_dapm_routes = ARRAY_SIZE(sc7180_snd_dual_mic_audio_route),
 		data->dmic_sel = devm_gpiod_get(&pdev->dev, "dmic", GPIOD_OUT_LOW);
-- 
2.40.1

