Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B09F0B94
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 02:19:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A763016ED;
	Wed,  6 Nov 2019 02:18:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A763016ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573003146;
	bh=qbhZ1yq1J3cw9TEMHqCCmlIoDU1TMpHi2hem9UFg8sE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=khlJqZzJ8jQ9Lus/sc4I32AyFLzxEuNeb5AaBR6CS1Ld3REWqyJnedCe7aIimLkmF
	 tkKgOjmcmy6h/G5pyTX10XSateSsd3aBFgakEnuPjMhZNrMywQwCUDNZ+7UaROoxIU
	 4t25QgwnsIFETRLlSYzeVROef75oVdxt7RhutokU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB0FDF8067A;
	Wed,  6 Nov 2019 02:14:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80F77F8065D; Wed,  6 Nov 2019 02:14:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95D17F8065A
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 02:14:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95D17F8065A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Ri7ictvj"
Received: by mail-pf1-x443.google.com with SMTP id p26so17503283pfq.8
 for <alsa-devel@alsa-project.org>; Tue, 05 Nov 2019 17:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a3zargnqC9GKtfjHZJaDP2IspQtaComj8cQZ+SEc2ag=;
 b=Ri7ictvj8CSaY/csfLZlBISOhTyUcKD/F7ZA1WqYZUDYCgzpEUU1gHidydTsSOjrFR
 h58yH7draxWqdR2Va7BFBW99NzoHLypjJQDdSlzRf1VAQ8KQ/fa03oRTW3MuTezda1zf
 MIS0yMKxKDGOMZy+ZU3zDPsrXl29enM1yxUCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a3zargnqC9GKtfjHZJaDP2IspQtaComj8cQZ+SEc2ag=;
 b=HANLgQnGYxKUSTj5VBuUrbFRRy0MXNF4X6NiVgJp1tPmmqTCemTzCT0f+eIBmm0ajW
 YxPOhJjfTLGCmYbeBk0P8Kzpd7dC7p/lqSn4gIpYoC1qBycl8x2SbHBEyIDvFm7W5CIb
 Ld31ycvBYXSCQ+Nh3n/T5HyOXQSO8jnljVzgfULYdoBQl42+WDss+pmMb90Lp3HspAGK
 ZLVWvooKgm0xTywcFbrcSakM2flMz0KDhAdg3cCXz/uFqKz8ZWgUHY1Ks1KTVtJGFNVs
 Da5ib6yRPG5nf6frvacsKBd4Oy53TtjHDCRSKr/enbd2Aiczh07MBzDlMsRDi3eLl4Ex
 zgpg==
X-Gm-Message-State: APjAAAUjNI6rMJx1Po0U+bWjsNq+Y+OXY8OVVSMuEydVm3OtouzsGDfK
 VvrfAJWww1AralhvmLdpFq66I7a4sn5d
X-Google-Smtp-Source: APXvYqw0U6jJheJ0OxMDBHJFIxXCxwWUssjGtSnXiOjtdktZSFG0Qb4OzctUzyiB3iN/+qFzZbfAqw==
X-Received: by 2002:a17:90a:86c1:: with SMTP id y1mr21253pjv.71.1573002842866; 
 Tue, 05 Nov 2019 17:14:02 -0800 (PST)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id v19sm21273837pff.46.2019.11.05.17.14.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2019 17:14:02 -0800 (PST)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Tue,  5 Nov 2019 17:13:31 -0800
Message-Id: <20191106011335.223061-7-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
In-Reply-To: <20191106011335.223061-1-cujomalainey@chromium.org>
References: <20191106011335.223061-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ben Zhang <benzh@chromium.org>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH v3 06/11] ASoC: rt5677: Stop and restart DSP
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
index e5db9dc60378..eb55d6b9d0c1 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -876,6 +876,7 @@ static int rt5677_load_dsp_from_file(struct rt5677_priv *rt5677)
 static int rt5677_set_dsp_vad(struct snd_soc_component *component, bool on)
 {
 	struct rt5677_priv *rt5677 = snd_soc_component_get_drvdata(component);
+	rt5677->dsp_vad_en_request = on;
 	rt5677->dsp_vad_en = on;
 
 	if (!IS_ENABLED(CONFIG_SND_SOC_RT5677_SPI))
@@ -969,7 +970,7 @@ static int rt5677_dsp_vad_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rt5677_priv *rt5677 = snd_soc_component_get_drvdata(component);
 
-	ucontrol->value.integer.value[0] = rt5677->dsp_vad_en;
+	ucontrol->value.integer.value[0] = rt5677->dsp_vad_en_request;
 
 	return 0;
 }
@@ -4636,14 +4637,15 @@ static int rt5677_set_bias_level(struct snd_soc_component *component,
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
@@ -4667,9 +4669,25 @@ static int rt5677_set_bias_level(struct snd_soc_component *component,
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
index d18b41da1176..046ed2ee8e31 100644
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
2.24.0.rc1.363.gb1bccd3e3d-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
