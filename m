Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BE221AE9A
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jul 2020 07:28:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EABB1662;
	Fri, 10 Jul 2020 07:28:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EABB1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594358938;
	bh=BAtaCAuhTuY+rglUGgeJN5y4Boy7Nrfv25Jp13fvMV4=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EkObHPiECgGq81qFgRM4gfNepMDwX5jPiQnKc33AhTB5cDCgHlzs2gyAp00I8fRSl
	 iSYUYRm3ZGo/mePPbW2LPX0dAqgbPRrYS/WrDyEw5bxsiIh3K8cvDQ5ulTm5+2vEo6
	 3wq83Enw0Elqj2N4Ej1M2nphaGLuz784fHZ8N6tQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94398F802D2;
	Fri, 10 Jul 2020 07:25:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B922F80268; Fri, 10 Jul 2020 07:25:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D38ABF8011C
 for <alsa-devel@alsa-project.org>; Fri, 10 Jul 2020 07:25:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D38ABF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="VWwToPDP"
Received: by mail-yb1-xb49.google.com with SMTP id g10so5816353ybd.0
 for <alsa-devel@alsa-project.org>; Thu, 09 Jul 2020 22:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=i2NhQTpZuhCYWTnxTi14iTiCHJsPokmxWx+SDqUiObw=;
 b=VWwToPDPM0rGsgdyXx/MPzUW2/SUmATrBTK/cVKkCbVOG57hyj0/7MaNB26EhSt0J8
 Ime7xaCK6wahKUFxUHqAPrrf5uzNNen9Pnz5GK2LmkS84Y4xZUwN2cbHM+3fpiv1tnCR
 gJdrh1puHrnTOK19Aaa531xhgtHEtW/23Gdk/5RDzNWleHEv8BTC8wm/Qod2SR2ocr1g
 /BZb2oPsB+2USOHWcs0mFdSboheF7YB+1KrfRrwUxdDYj4P/R3T6B6g01GhtP9AnPdn2
 Y5qiFKx15E/18d7prk1YpciA4Js8VqJApyoKaQTd/of3WGBmtRgm1b3rUOl9XX1E/4ye
 4PXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=i2NhQTpZuhCYWTnxTi14iTiCHJsPokmxWx+SDqUiObw=;
 b=rivymRqNZo+qBjzx6EOfiul23OGYWoo2nackqcj4cGmHXoXc6OPDKF3a5M47MMfU8R
 +vV3lzUQO0A7YtupoIdULl/E/AEk+CTqCszTDmfrcazil4K6GZ2uIB1VEXD5PvpwkO6l
 wyCdB7Br0mHJ0v9kv/HWB9huZrZSp5SuV9BR98NLD+ZiAaXlA2uuMLhjLWhGkdNzVCeo
 eEefxsffwgCdGi0ZsC0RKovg9TpZ0gFFpJ6urCJ2HkWqVqdm3la2tC4unqE84chP1BDV
 yXD58EQnqWhfMo92XC1SyELL0nQzID4XLAb2cHTWwyIgF94XHs61ImNzxs/lAQrW9GH/
 vAmA==
X-Gm-Message-State: AOAM530AbmDq1JHcOYgWelKkXGfu/CBYIznwgnZDQk/XmzdSyI/ZySuq
 hwvBvxOVZgeVorwmOxlJVmwCCrOiNf+v
X-Google-Smtp-Source: ABdhPJyxdVQdC7BceZ8J2XZQ+dXvuO4Jq88o+nRWRKXh9lYZoRE6UwV4YfwXKJyNApczRBaWatW2bG5w5N0t
X-Received: by 2002:a25:cb42:: with SMTP id b63mr45668907ybg.266.1594358725304; 
 Thu, 09 Jul 2020 22:25:25 -0700 (PDT)
Date: Fri, 10 Jul 2020 13:25:02 +0800
In-Reply-To: <20200710052505.3664118-1-tzungbi@google.com>
Message-Id: <20200710052505.3664118-4-tzungbi@google.com>
Mime-Version: 1.0
References: <20200710052505.3664118-1-tzungbi@google.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [PATCH 3/6] ASoC: mediatek: mt8183: support HDMI jack reporting
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tzungbi@google.com
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

Supports HDMI jack reporting.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/mediatek/Kconfig                    |  1 +
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   | 20 ++++++++++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 786a8d5031e4..ba120e9441d0 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -127,6 +127,7 @@ config SND_SOC_MT8183_MT6358_TS3A227E_MAX98357A
 	select SND_SOC_BT_SCO
 	select SND_SOC_TS3A227E
 	select SND_SOC_CROS_EC_CODEC if CROS_EC
+	select SND_SOC_HDMI_CODEC
 	help
 	  This adds ASoC driver for Mediatek MT8183 boards
 	  with the MT6358 TS3A227E MAX98357A RT1015 audio codec.
diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index c375e9f91a34..bd04c4bd309b 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/pinctrl/consumer.h>
+#include <sound/hdmi-codec.h>
 #include <sound/jack.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -36,7 +37,7 @@ static const char * const mt8183_pin_str[PIN_STATE_MAX] = {
 struct mt8183_mt6358_ts3a227_max98357_priv {
 	struct pinctrl *pinctrl;
 	struct pinctrl_state *pin_states[PIN_STATE_MAX];
-	struct snd_soc_jack headset_jack;
+	struct snd_soc_jack headset_jack, hdmi_jack;
 };
 
 static int mt8183_mt6358_i2s_hw_params(struct snd_pcm_substream *substream,
@@ -337,6 +338,22 @@ static const struct snd_soc_ops mt8183_mt6358_ts3a227_max98357_wov_ops = {
 	.shutdown = mt8183_mt6358_ts3a227_max98357_wov_shutdown,
 };
 
+static int
+mt8183_mt6358_ts3a227_max98357_hdmi_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct mt8183_mt6358_ts3a227_max98357_priv *priv =
+		snd_soc_card_get_drvdata(rtd->card);
+	int ret;
+
+	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
+				    &priv->hdmi_jack, NULL, 0);
+	if (ret)
+		return ret;
+
+	return hdmi_codec_set_jack_detect(asoc_rtd_to_codec(rtd, 0)->component,
+					  &priv->hdmi_jack);
+}
+
 static struct snd_soc_dai_link mt8183_mt6358_ts3a227_dai_links[] = {
 	/* FE */
 	{
@@ -499,6 +516,7 @@ static struct snd_soc_dai_link mt8183_mt6358_ts3a227_dai_links[] = {
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
 		.ops = &mt8183_mt6358_tdm_ops,
+		.init = mt8183_mt6358_ts3a227_max98357_hdmi_init,
 		SND_SOC_DAILINK_REG(tdm),
 	},
 };
-- 
2.27.0.383.g050319c2ae-goog

