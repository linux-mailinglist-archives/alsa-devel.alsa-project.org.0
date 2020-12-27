Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC3F2E32E7
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Dec 2020 22:19:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02E021812;
	Sun, 27 Dec 2020 22:18:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02E021812
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609103975;
	bh=AANgixua2zLE2CSF6IDvxn8PCvzR2bCY9eqnXnjtM5k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AZoW+s3adhilRuHG+hBnotWF2eM3ThPPoQcQXE0D/ZGPZUn5Lgejwv1PJQBayQUmQ
	 TCS1ChXz/83KI3ZV5CLTCc+ZI/ZQuW9WWMu030qsvUex31ic2RjZ2ttrfcn6WDeI+i
	 t1eBUH/y+eZJxgC8ydw5pFZHIXz1hTSSnXCmX7zY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D9FCF80528;
	Sun, 27 Dec 2020 22:13:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BD90F80529; Sun, 27 Dec 2020 22:13:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21848F80525
 for <alsa-devel@alsa-project.org>; Sun, 27 Dec 2020 22:13:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21848F80525
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Imn/SzCX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609103597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7vh/KkzsTKpkkyc1hK+SFAImLEHZ8ZJqj8ya7YteCNo=;
 b=Imn/SzCXtd7BZq0QafFAm+YLkiHNCeEsBCc/TfcP68HictvXr0KLtYnob6sQTQmxTXwb+I
 IgSxOUcuHADNSxGZGn+8Bex3WmoL6vb+IRXP2dVcEJva4zXEYk/0eOhvaRe9YsSUNlMvZR
 fwmSmgEfiF+tx5Bp5Az8TJH57ooQbHU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-0G39lbq8OpGDDFYAz4Hm_A-1; Sun, 27 Dec 2020 16:13:14 -0500
X-MC-Unique: 0G39lbq8OpGDDFYAz4Hm_A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20A39107ACE3;
 Sun, 27 Dec 2020 21:13:12 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-25.ams2.redhat.com [10.36.112.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8EB21ACB9;
 Sun, 27 Dec 2020 21:13:09 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Lee Jones <lee.jones@linaro.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 14/14] ASoC: Intel: bytcr_wm5102: Add jack detect support
Date: Sun, 27 Dec 2020 22:12:32 +0100
Message-Id: <20201227211232.117801-15-hdegoede@redhat.com>
In-Reply-To: <20201227211232.117801-1-hdegoede@redhat.com>
References: <20201227211232.117801-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
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

The Linux Arizona/WM5102 driver uses the MFD framework to create several
sub-devices for the WM5102 codec and then uses a driver per function.

The jack-detect support for the WM5102 codec is handled by the
extcon-arizona driver. This driver exports info about the jack state
to userspace through the standard extcon sysfs class interface.

But standard Linux userspace does not monitor/use the extcon sysfs
interface for jack-detection.

The extcon-arizona driver can also report jack-detect state through
the standard ASoC jack interface. For this we need to create a
snd_soc_jack and pass this to the extcon-arizona driver through the
shared arizona data struct.

The extcon-arizona code already depends on (waits for with -EPROBE_DEFER)
the snd_card being registered by the machine driver, so this does not
cause any ordering issues.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcr_wm5102.c | 36 ++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
index 7de09cb5c50e..25c7a6cacaad 100644
--- a/sound/soc/intel/boards/bytcr_wm5102.c
+++ b/sound/soc/intel/boards/bytcr_wm5102.c
@@ -13,11 +13,13 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/init.h>
+#include <linux/input.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/spi/spi.h>
+#include <sound/jack.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -31,6 +33,8 @@
 #define WM5102_MAX_SYSCLK_11025	45158400 /* max sysclk for 11.025K family */
 
 struct byt_wm5102_private {
+	struct snd_soc_jack jack;
+	struct arizona *arizona;
 	struct clk *mclk;
 	struct gpio_desc *spkvdd_en_gpio;
 };
@@ -184,11 +188,22 @@ static const struct snd_kcontrol_new byt_wm5102_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Speaker"),
 };
 
+static struct snd_soc_jack_pin byt_wm5102_pins[] = {
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
 static int byt_wm5102_init(struct snd_soc_pcm_runtime *runtime)
 {
 	struct snd_soc_card *card = runtime->card;
 	struct byt_wm5102_private *priv = snd_soc_card_get_drvdata(card);
-	int ret;
+	int ret, jack_type;
 
 	card->dapm.idle_bias_off = true;
 
@@ -217,6 +232,22 @@ static int byt_wm5102_init(struct snd_soc_pcm_runtime *runtime)
 		return ret;
 	}
 
+	jack_type = SND_JACK_HEADSET | SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+		    SND_JACK_BTN_2 | SND_JACK_BTN_3;
+	ret = snd_soc_card_jack_new(card, "Headset", jack_type,
+				    &priv->jack, byt_wm5102_pins,
+				    ARRAY_SIZE(byt_wm5102_pins));
+	if (ret) {
+		dev_err(card->dev, "Error creating jack: %d\n", ret);
+		return ret;
+	}
+	snd_jack_set_key(priv->jack.jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+	snd_jack_set_key(priv->jack.jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
+	snd_jack_set_key(priv->jack.jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
+	snd_jack_set_key(priv->jack.jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
+
+	priv->arizona->jack = &priv->jack;
+
 	return 0;
 }
 
@@ -409,6 +440,8 @@ static int snd_byt_wm5102_mc_probe(struct platform_device *pdev)
 
 	/* Note no devm_ here since we call gpiod_get on codec_dev rather then dev */
 	priv->spkvdd_en_gpio = gpiod_get(codec_dev, "wlf,spkvdd-ena", GPIOD_OUT_LOW);
+
+	priv->arizona = dev_get_drvdata(codec_dev);
 	put_device(codec_dev);
 
 	if (IS_ERR(priv->spkvdd_en_gpio))
@@ -452,6 +485,7 @@ static int snd_byt_wm5102_mc_remove(struct platform_device *pdev)
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 	struct byt_wm5102_private *priv = snd_soc_card_get_drvdata(card);
 
+	priv->arizona->jack = NULL;
 	gpiod_put(priv->spkvdd_en_gpio);
 	return 0;
 }
-- 
2.28.0

