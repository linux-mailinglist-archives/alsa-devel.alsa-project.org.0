Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A3676D668
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 20:04:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DC77857;
	Wed,  2 Aug 2023 20:03:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DC77857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690999460;
	bh=lTDp1mQh6vg+tzNpPy7F9URVPhvq+UFfEK0gFqu6edI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iQXdavHsvDaelAMsYdjDfwtIj+ZT0b2JRZ1q4CCECG5wfl10ZrGUtmBdzC6vKnCym
	 qO/aiOnfIQqjae+VCUjAMB5Xt/XwwJRhFzv+hSP7nu7rpV/d5SnZqLdyYHgUvB3EFc
	 kk4Drojk14UAJsfTprsMwNBH32T26JDEbC8lCsvs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62F8AF80651; Wed,  2 Aug 2023 19:59:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DCFC5F8063E;
	Wed,  2 Aug 2023 19:59:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EB15F80558; Wed,  2 Aug 2023 19:58:40 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9CA62F805E2
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 19:58:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CA62F805E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=FTZxpdE5
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fe1d462762so1526365e9.0
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 10:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690999116; x=1691603916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2zh/WX6wdJak4IhHc3jkL9iRoK+aXWh9O/IfQG1cm3A=;
        b=FTZxpdE5nx4Y6zQSk5bttaigS8VbRibjeKA3ZCREfPBwHaEibBv3iLD8k9qccZtT4e
         aZD09HP28KJsaWIUcrXrs3CEfvpd914hlqO0hNaxO+EcVsCXWA3vsRV4ehJWIiH1Wa0m
         4wn57sn5rhYJtHRamKiJfDg/rbcpFgEruL5xAQ7YaHmSl9EWcj3T/Pi3Ruxn6R3agW0U
         m+zQSRysHJ6Kd21dByfuCnyzcfIkxTRth8K/1GH0i/4tP1L1mi7NreUMNxUpIAAYSQbp
         hIF7YEYJeeGSJu2iNQs7+/vSCrUJNyZEcw3URHIRTTdBEPpYg3W/+WNWflv31jJ54L80
         39AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690999116; x=1691603916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2zh/WX6wdJak4IhHc3jkL9iRoK+aXWh9O/IfQG1cm3A=;
        b=kMGrO2Mpn7nkFZq4KGZOnQy8a+w2mnN20yuWQTxPWHbgEUiuhXTTpHBUkR329LSvrl
         dSEpGSV5ma0W1QIda57ukf3pipl7CRv+c3QeiuXieayyAp2FKa2eifNp9eCfghSyDGBJ
         vVHRkRekiA93J5Gf3xE8xtOE+Ad+7W3fBGGUQQbFoDEhCinFslKT7PW07a2WpLhXPU8J
         1BzDn4MjRDj+6U89opuSVRMLSaGm499fUdcim+3xGnDKIi6/XEximmckffcnUpqTif7K
         enCEWLOL4c9MwvZg2035LMGfHTwa2pLZWfZgaiRdlzLOuG8CHttWtiy8t/fW/q9HEqYH
         5BZA==
X-Gm-Message-State: ABy/qLZ1nwijPWhvnGKIAQrQURoseG4ZJM5YzzssmLMblYmmtDQr2aAB
	g8AlOwz9CXIJgMm9G8+eVi4zZwo9+FU=
X-Google-Smtp-Source: 
 APBJJlFfB53UV8DUxJrlC5VR+KxGVU5uRRmKWxImfq+r4JmICNTmBkIhF7ae8zlkVAqNbIoOqNS/zQ==
X-Received: by 2002:a05:600c:20cb:b0:3f8:2777:15e with SMTP id
 y11-20020a05600c20cb00b003f82777015emr5232003wmm.31.1690999115687;
        Wed, 02 Aug 2023 10:58:35 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1])
        by smtp.gmail.com with ESMTPSA id
 l23-20020a7bc457000000b003fe20db88ebsm2192439wmi.31.2023.08.02.10.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 10:58:35 -0700 (PDT)
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
Subject: [PATCH 21/27] ASoC: qcom: sc7280: Map missing jack kcontrols
Date: Wed,  2 Aug 2023 20:57:31 +0300
Message-Id: <20230802175737.263412-22-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230802175737.263412-1-alpernebiyasak@gmail.com>
References: <20230802175737.263412-1-alpernebiyasak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: L56MWMJ5ZETPNW4OCMJKAKVSDVIWYCWY
X-Message-ID-Hash: L56MWMJ5ZETPNW4OCMJKAKVSDVIWYCWY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L56MWMJ5ZETPNW4OCMJKAKVSDVIWYCWY/>
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
Should the SND_JACK_LINEOUT be removed from the jack_new_pins calls?
Would SND_JACK_MECHANICAL be useful as a kcontrol as well?

 sound/soc/qcom/sc7280.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/sc7280.c b/sound/soc/qcom/sc7280.c
index 787dd49e03f6..43010e4e2242 100644
--- a/sound/soc/qcom/sc7280.c
+++ b/sound/soc/qcom/sc7280.c
@@ -43,6 +43,17 @@ static void sc7280_jack_free(struct snd_jack *jack)
 	snd_soc_component_set_jack(component, NULL, NULL);
 }
 
+static struct snd_soc_jack_pin sc7280_jack_pins[] = {
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
 static int sc7280_headset_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
@@ -54,13 +65,15 @@ static int sc7280_headset_init(struct snd_soc_pcm_runtime *rtd)
 	int rval, i;
 
 	if (!pdata->jack_setup) {
-		rval = snd_soc_card_jack_new(card, "Headset Jack",
-					     SND_JACK_HEADSET | SND_JACK_LINEOUT |
-					     SND_JACK_MECHANICAL |
-					     SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-					     SND_JACK_BTN_2 | SND_JACK_BTN_3 |
-					     SND_JACK_BTN_4 | SND_JACK_BTN_5,
-					     &pdata->hs_jack);
+		rval = snd_soc_card_jack_new_pins(card, "Headset Jack",
+						  SND_JACK_HEADSET | SND_JACK_LINEOUT |
+						  SND_JACK_MECHANICAL |
+						  SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+						  SND_JACK_BTN_2 | SND_JACK_BTN_3 |
+						  SND_JACK_BTN_4 | SND_JACK_BTN_5,
+						  &pdata->hs_jack,
+						  sc7280_jack_pins,
+						  ARRAY_SIZE(sc7280_jack_pins));
 
 		if (rval < 0) {
 			dev_err(card->dev, "Unable to add Headset Jack\n");
@@ -361,6 +374,11 @@ static const struct snd_soc_dapm_widget sc7280_snd_widgets[] = {
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 };
 
+static const struct snd_kcontrol_new sc7280_snd_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+};
+
 static int sc7280_snd_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 					 struct snd_pcm_hw_params *params)
 {
@@ -396,6 +414,8 @@ static int sc7280_snd_platform_probe(struct platform_device *pdev)
 
 	card->dapm_widgets = sc7280_snd_widgets;
 	card->num_dapm_widgets = ARRAY_SIZE(sc7280_snd_widgets);
+	card->controls = sc7280_snd_controls;
+	card->num_controls = ARRAY_SIZE(sc7280_snd_controls);
 
 	ret = qcom_snd_parse_of(card);
 	if (ret)
-- 
2.40.1

