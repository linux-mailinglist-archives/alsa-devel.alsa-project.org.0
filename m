Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B94F4DCFC9
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 22:11:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 521EE1670;
	Fri, 18 Oct 2019 22:10:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 521EE1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571429487;
	bh=kYlue9SHtRsxRebN+7Xhn2o8pJZA5oRPw5yYOfVh3js=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GH8ZMhKUhl/uRXqNx8fcUCLSE5TrA/gvCJgVuSgi54GUHSrZiJnBOrgLuoRqS1fCS
	 Vy++D8gRuQQzcPPTiTo8SxAXOCXJAWQ/liuQxAg51U4cYmNl25mQA4T9SrzDtiYb8M
	 KkeEGNZt8jbxzDVkmYN9sI4PAIhTgEmlro1bpUrY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C46C3F80675;
	Fri, 18 Oct 2019 22:05:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54250F80642; Fri, 18 Oct 2019 22:05:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9805F80636
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 22:05:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9805F80636
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="brYpq4D5"
Received: by mail-pf1-x442.google.com with SMTP id a2so4508746pfo.10
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 13:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KAMVXOLUwJkoi6iyTyha/Qysufa1psgvETPY/LJtMtU=;
 b=brYpq4D5DQh6hJzIsLnygbPkZyedCBHE6KgGUTnB2JFBcEA+XMPGI9Bn9U0YFM5pDG
 KNiESCAUokpoPRZp+EyBoFSWnMsUDvYiBBrEEWzeTdtd/M5QKhENLDb/IsqdIIuJi3EU
 45ynlBpUb3E1MyBTnQyz+alZJQeM9zjD1BTVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KAMVXOLUwJkoi6iyTyha/Qysufa1psgvETPY/LJtMtU=;
 b=OGcW1gOOp5TIjTt/NRVmvlJGoulxKYuqqRmOrGa6SWQ190ktJwSvIr5jeoSxdGfT4b
 gbWdthaZQlaw0Ng6uEbPH+IzQTR630OsqDsZ1mPvySn9IqE2bsZnC0Mm8P2sy4Hwc8s2
 FSsfHv5C9V3kJlp+u5QEDDt0s/oH6I2YbJb0hxzPt8mBNu7uIbrYt03oN8wgx+gDv3cI
 Imj9XtmWTmvl54rH2Qq5fZ/v5PWjgs5G8PNSY0vmUpniKyGD4XTb0gfUtSftD8nHrx2M
 7QAPvFObK4FV3P/1me2/lxgfu9+ArogndavRvofKsgC94nHy/VNUWXJwDvveizhI/Ogm
 iDUA==
X-Gm-Message-State: APjAAAV28tjuUM+p59lrCnb5vhxURabeRVUF14/xEaGcB6E8NVhxn6Ng
 FUK3cYYQn9ooPM9g762KIY9sIZ5pekPl
X-Google-Smtp-Source: APXvYqzp7ZkYcx/vksBgN93sPTK+wzumGOiwdSPkgHLgajHSarKUkqaUEyCH0thVGoGjmPhcSO2vwg==
X-Received: by 2002:aa7:8691:: with SMTP id d17mr9010611pfo.212.1571429113584; 
 Fri, 18 Oct 2019 13:05:13 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id p17sm6514439pfn.50.2019.10.18.13.05.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Oct 2019 13:05:13 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Fri, 18 Oct 2019 13:04:44 -0700
Message-Id: <20191018200449.141123-8-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
In-Reply-To: <20191018200449.141123-1-cujomalainey@chromium.org>
References: <20191018200449.141123-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ben Zhang <benzh@chromium.org>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH v2 07/12] ASoC: rt5677: Stop and restart DSP
	over suspend/resume
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Ben Zhang <benzh@chromium.org>

MCLK1 gets disabled at suspend and re-enabled at resume. Before
MCLK1 is re-enabled, if the DSP is already on (either the DSP was
left on during suspend, or the DSP is turned on early at resume),
i2c register read returns garbage and corrupts the regmap cache.

This patch stops the DSP before suspend and restarts it after
resume with a dalay to ensure MCLK is on while loading firmware.

Signed-off-by: Ben Zhang <benzh@chromium.org>
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/codecs/rt5677.c | 24 +++++++++++++++++++++---
 sound/soc/codecs/rt5677.h |  3 ++-
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 7bf8d9fb88a5f..990764a76390f 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -878,6 +878,7 @@ static int rt5677_load_dsp_from_file(struct rt5677_priv *rt5677)
 static int rt5677_set_dsp_vad(struct snd_soc_component *component, bool on)
 {
 	struct rt5677_priv *rt5677 = snd_soc_component_get_drvdata(component);
+	rt5677->dsp_vad_en_request = on;
 	rt5677->dsp_vad_en = on;
 
 	if (!IS_ENABLED(CONFIG_SND_SOC_RT5677_SPI))
@@ -971,7 +972,7 @@ static int rt5677_dsp_vad_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rt5677_priv *rt5677 = snd_soc_component_get_drvdata(component);
 
-	ucontrol->value.integer.value[0] = rt5677->dsp_vad_en;
+	ucontrol->value.integer.value[0] = rt5677->dsp_vad_en_request;
 
 	return 0;
 }
@@ -4638,14 +4639,15 @@ static int rt5677_set_bias_level(struct snd_soc_component *component,
 			enum snd_soc_bias_level level)
 {
 	struct rt5677_priv *rt5677 = snd_soc_component_get_drvdata(component);
+	enum snd_soc_bias_level prev_bias =
+		snd_soc_component_get_bias_level(component);
 
 	switch (level) {
 	case SND_SOC_BIAS_ON:
 		break;
 
 	case SND_SOC_BIAS_PREPARE:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_STANDBY) {
-			rt5677_set_dsp_vad(component, false);
+		if (prev_bias == SND_SOC_BIAS_STANDBY) {
 
 			regmap_update_bits(rt5677->regmap, RT5677_PWR_ANLG1,
 				RT5677_LDO1_SEL_MASK | RT5677_LDO2_SEL_MASK,
@@ -4669,9 +4671,25 @@ static int rt5677_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
+		if (prev_bias == SND_SOC_BIAS_OFF &&
+				rt5677->dsp_vad_en_request) {
+			/* Re-enable the DSP if it was turned off at suspend */
+			rt5677->dsp_vad_en = true;
+			/* The delay is to wait for MCLK */
+			schedule_delayed_work(&rt5677->dsp_work,
+					msecs_to_jiffies(1000));
+		}
 		break;
 
 	case SND_SOC_BIAS_OFF:
+		flush_delayed_work(&rt5677->dsp_work);
+		if (rt5677->is_dsp_mode) {
+			/* Turn off the DSP before suspend */
+			rt5677->dsp_vad_en = false;
+			schedule_delayed_work(&rt5677->dsp_work, 0);
+			flush_delayed_work(&rt5677->dsp_work);
+		}
+
 		regmap_update_bits(rt5677->regmap, RT5677_DIG_MISC, 0x1, 0x0);
 		regmap_write(rt5677->regmap, RT5677_PWR_DIG1, 0x0000);
 		regmap_write(rt5677->regmap, RT5677_PWR_ANLG1,
diff --git a/sound/soc/codecs/rt5677.h b/sound/soc/codecs/rt5677.h
index d18b41da1176b..046ed2ee8e31e 100644
--- a/sound/soc/codecs/rt5677.h
+++ b/sound/soc/codecs/rt5677.h
@@ -1846,7 +1846,8 @@ struct rt5677_priv {
 #ifdef CONFIG_GPIOLIB
 	struct gpio_chip gpio_chip;
 #endif
-	bool dsp_vad_en; /* DSP VAD enable/disable request */
+	bool dsp_vad_en_request; /* DSP VAD enable/disable request */
+	bool dsp_vad_en; /* dsp_work parameter */
 	bool is_dsp_mode;
 	bool is_vref_slow;
 	struct delayed_work dsp_work;
-- 
2.23.0.866.gb869b98d4c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
