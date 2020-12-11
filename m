Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DB92D6F86
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Dec 2020 06:14:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93D2816AE;
	Fri, 11 Dec 2020 06:13:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93D2816AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607663673;
	bh=jXxYaAuXHJ+Hdwy7K4MymAsdlmLKgeo8jLHLhmKoV1g=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OmMRgon5BGjqbTUiTqSLzSSRsxp/sPY0OeuXU2BsyML/vvCmxISBdBgU76o9auR0K
	 DZASQtV7KnuSLEPF3dityhqLRryxPW5gQ8lVP1vIhcLTWZ9BAcEMxX4G8FSz7AXe23
	 XTNSpTz8UkD/xqs4ikXkjGla++/cuTLDAFX2fvK0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68A3DF8026A;
	Fri, 11 Dec 2020 06:12:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02004F801D8; Fri, 11 Dec 2020 06:12:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AA09F801D8
 for <alsa-devel@alsa-project.org>; Fri, 11 Dec 2020 06:12:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AA09F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="C8s23TgB"
Received: by mail-qk1-x749.google.com with SMTP id n137so553791qkn.10
 for <alsa-devel@alsa-project.org>; Thu, 10 Dec 2020 21:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=uY9sa0AMR9OUDAQO7CpayjoGwpWP3KncZQ/PeW43hFw=;
 b=C8s23TgBg/qP3DNn+SvIIZxUHyBZ6CeOdnX2Ab7CFt3z/11U0W0UIfcbgkel6QWC0u
 G8npUPT23LClG//9So/Lo+9MXUb9wium6Cpz2upsF1/EKNt2o5VEzRuZP5L+h9ue5JgO
 jVqITXPaxmc+zCThQWF3ZbeKQ61Sh4Z+RfEfDCDdRXpsDlC4bNXPgmGPz82eVgl8bfJt
 7OITThR43p0oJq7lRfROsZ3ULRN3TUt3otsAdsaJVxcXbpDFjTs/oZzXlqESMAB+l4m8
 cZPtuF1A9FV2/aqKyvhDIHsrEQoxIzFG+6FcHGHoCn4E0FOJWrqW0205QJBXOapjHlRP
 c7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=uY9sa0AMR9OUDAQO7CpayjoGwpWP3KncZQ/PeW43hFw=;
 b=ry4Wc3k5X2dB3gZoyc5+CZ3jllL0BJIs9EnW9dpXrQ8dyxz+iaySrp3y99wrBBlsjD
 hEa/W08+g1iKwG9FHiKItAi7JmxQCkt/BsyCrnpj5BFcuLuu+0f7ZxEKuGu80Z1OoQkI
 tDQ2yzezjz2C4h4yvQvZPG9aUXvapFHuC1lBZJTB4bnwqd/J961LMPwZp/dVuMZOZd5n
 ESvHTUYSbd4wX5SXQ/ySH2cNNtH3KU49gSD6BSEnZn816U2QrTOOOT1gfyaQCqqqA41n
 Mpxbw22LxLEWT0zQZ1AXiC5mP5mGhYBZwVDtuWtYyy9krFetoprdqG+ogkPhi4Em0ZsF
 YUzQ==
X-Gm-Message-State: AOAM533ZLMzf1Mg+5vDfdYY8mNgQ4Y4F46kxO9wINoszTkBS/ifOLtuK
 S/ljYsEv0kBwUmX6vZw/45jlYTnB9bx7
X-Google-Smtp-Source: ABdhPJxrLHUHiAM/LXcQ319w3jyRx10QLv0egKrc75X3PaAB/FTq4rFuO3FEJp+8E/yWxdtsnWmsOfoAaTwx
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a0c:cd89:: with SMTP id
 v9mr13845980qvm.37.1607663563748; Thu, 10 Dec 2020 21:12:43 -0800 (PST)
Date: Fri, 11 Dec 2020 13:12:23 +0800
In-Reply-To: <20201211051224.2307349-1-tzungbi@google.com>
Message-Id: <20201211051224.2307349-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20201211051224.2307349-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH v3 1/2] ASoC: rt1015p: move SDB control from trigger to DAPM
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Moves SDB control from DAI ops trigger to DAPM.  As long as BCLK
and LRCLK are ready, SDB can be toggled earlier.

Changes from using gpiod_set_value() to gpiod_set_value_cansleep()
because it executes in non-atomic context.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/codecs/rt1015p.c | 51 ++++++++++----------------------------
 1 file changed, 13 insertions(+), 38 deletions(-)

diff --git a/sound/soc/codecs/rt1015p.c b/sound/soc/codecs/rt1015p.c
index 59bb60682270..ee9dfa2dbbf0 100644
--- a/sound/soc/codecs/rt1015p.c
+++ b/sound/soc/codecs/rt1015p.c
@@ -19,60 +19,40 @@
 
 struct rt1015p_priv {
 	struct gpio_desc *sdb;
-	int sdb_switch;
 };
 
-static int rt1015p_daiops_trigger(struct snd_pcm_substream *substream,
-		int cmd, struct snd_soc_dai *dai)
+static int rt1015p_sdb_event(struct snd_soc_dapm_widget *w,
+		struct snd_kcontrol *kcontrol, int event)
 {
-	struct snd_soc_component *component = dai->component;
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
 	struct rt1015p_priv *rt1015p =
 		snd_soc_component_get_drvdata(component);
 
 	if (!rt1015p->sdb)
 		return 0;
 
-	switch (cmd) {
-	case SNDRV_PCM_TRIGGER_START:
-	case SNDRV_PCM_TRIGGER_RESUME:
-	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		if (rt1015p->sdb_switch) {
-			gpiod_set_value(rt1015p->sdb, 1);
-			dev_dbg(component->dev, "set sdb to 1");
-		}
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		gpiod_set_value_cansleep(rt1015p->sdb, 1);
+		dev_dbg(component->dev, "set sdb to 1");
 		break;
-	case SNDRV_PCM_TRIGGER_STOP:
-	case SNDRV_PCM_TRIGGER_SUSPEND:
-	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		gpiod_set_value(rt1015p->sdb, 0);
+	case SND_SOC_DAPM_POST_PMD:
+		gpiod_set_value_cansleep(rt1015p->sdb, 0);
 		dev_dbg(component->dev, "set sdb to 0");
 		break;
+	default:
+		break;
 	}
 
 	return 0;
 }
 
-static int rt1015p_sdb_event(struct snd_soc_dapm_widget *w,
-		struct snd_kcontrol *kcontrol, int event)
-{
-	struct snd_soc_component *component =
-		snd_soc_dapm_to_component(w->dapm);
-	struct rt1015p_priv *rt1015p =
-		snd_soc_component_get_drvdata(component);
-
-	if (event & SND_SOC_DAPM_POST_PMU)
-		rt1015p->sdb_switch = 1;
-	else if (event & SND_SOC_DAPM_POST_PMD)
-		rt1015p->sdb_switch = 0;
-
-	return 0;
-}
-
 static const struct snd_soc_dapm_widget rt1015p_dapm_widgets[] = {
 	SND_SOC_DAPM_OUTPUT("Speaker"),
 	SND_SOC_DAPM_OUT_DRV_E("SDB", SND_SOC_NOPM, 0, 0, NULL, 0,
 			rt1015p_sdb_event,
-			SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
+			SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 };
 
 static const struct snd_soc_dapm_route rt1015p_dapm_routes[] = {
@@ -91,10 +71,6 @@ static const struct snd_soc_component_driver rt1015p_component_driver = {
 	.non_legacy_dai_naming	= 1,
 };
 
-static const struct snd_soc_dai_ops rt1015p_dai_ops = {
-	.trigger        = rt1015p_daiops_trigger,
-};
-
 static struct snd_soc_dai_driver rt1015p_dai_driver = {
 	.name = "HiFi",
 	.playback = {
@@ -104,7 +80,6 @@ static struct snd_soc_dai_driver rt1015p_dai_driver = {
 		.channels_min	= 1,
 		.channels_max	= 2,
 	},
-	.ops    = &rt1015p_dai_ops,
 };
 
 static int rt1015p_platform_probe(struct platform_device *pdev)
-- 
2.29.2.684.gfbc64c5ab5-goog

