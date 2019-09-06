Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78ED4AC0EA
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2019 21:52:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0BA91670;
	Fri,  6 Sep 2019 21:52:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0BA91670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567799571;
	bh=DMW6yfqfohf1GGOFsCCb3OU1liHID74v1Kb+xvKbjVY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JbzOZQZtfoHZ4Mcq99HtrQcwX7MEP/XhvL/r1Vz7fAC1Vv+fevnrED8297AlGWIaP
	 qu1D2PpNebQs2+B3zav/rVZnj1WP4A8oFGyQWN+2dG5SsZxJWcp/lvRISKEQCjBm5n
	 HNx8L0LE8SO1SV1RWtRV1HaCa9Jjfo9eX/AqElvk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6952FF80672;
	Fri,  6 Sep 2019 21:48:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB7E0F8063A; Fri,  6 Sep 2019 21:48:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3A98F80635
 for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2019 21:47:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3A98F80635
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="afmphl1F"
Received: by mail-pl1-x642.google.com with SMTP id f19so3642231plr.3
 for <alsa-devel@alsa-project.org>; Fri, 06 Sep 2019 12:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YVCTQkuykSmc51JVcb5TCMfC/BldcbHzDSM0b9aVMTE=;
 b=afmphl1F0j+2pBwX51htvQ6z2OZ1fie7MEB7tnc4tFz0IXkBycTN7BsJOSXkvK+hqR
 vwhWIG10GeSe8jPBU2VofEITRGE56cxV1iS70wpQCogDS4TSUnm9mqQsn1lrCBlEspMr
 VKN1RfNw8KbytdETzu7O3roYESqRnwkN4acVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YVCTQkuykSmc51JVcb5TCMfC/BldcbHzDSM0b9aVMTE=;
 b=oRENkdo4KSU1ykdf0mUNXlXhJoC9t4aB5adY+fMnVipIF1aI0/6YLb+s3zP3LykEmT
 y2B4uXraW+jmPCSdwpXjWcTLanMp05hdmVPKFDKt5oxxui7TqZ09A9/kOxCHDbQ45TMR
 kPDv+rauokb2v9eTvlOyb+Qpnh+m5umWGOKEPKwoEdF6Ss/hAqYxQpDQdrvfPwgzGBbr
 7TDZy2OklsRwuUOGRGydj6zGnQOvomw1x6moyB7Y78aaN66gn1fDAlCg+cJIyacyVHMN
 4CGXoSRPd1xo/HcOPd1P45Az4PDCdPTOaxL1cdm4Yr8f+3y89wVKmLng2agJen5+pILM
 pJTQ==
X-Gm-Message-State: APjAAAVGTeH5RKKBPUmqXdAytKCws41DRCoz4LbLuH9/D7kKb4pYDBjB
 u3QIQf1IWTmb5vy6hERC1I5wbltOpQ==
X-Google-Smtp-Source: APXvYqyvgop/xGqvDaCerkvm8+A+wR1wnsg2ykOdlUA4S5qA49vvo89GtvGlQHa6Moi6G1mDg4UBpQ==
X-Received: by 2002:a17:902:8f90:: with SMTP id
 z16mr11075628plo.138.1567799275499; 
 Fri, 06 Sep 2019 12:47:55 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id e24sm7122116pgk.21.2019.09.06.12.47.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2019 12:47:55 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Fri,  6 Sep 2019 12:46:27 -0700
Message-Id: <20190906194636.217881-6-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
In-Reply-To: <20190906194636.217881-1-cujomalainey@chromium.org>
References: <20190906194636.217881-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ben Zhang <benzh@chromium.org>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [RFC 05/15] ASoC: rt5677: Auto enable/disable DSP for
	hotwording
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

The kcontrol 'DSP VAD Switch' is automatically enabled/disabled
when the hotwording PCM stream is opened/closed.

A function pointer in struct rt5677_priv is used to avoid module
dependency cycle between snd_soc_rt5677 and snd_soc_rt5677_spi.

Signed-off-by: Ben Zhang <benzh@chromium.org>
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/codecs/rt5677-spi.c | 12 ++++++++++++
 sound/soc/codecs/rt5677.c     |  6 +++++-
 sound/soc/codecs/rt5677.h     |  2 ++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
index 62621fe4747c..25d75a803cb5 100644
--- a/sound/soc/codecs/rt5677-spi.c
+++ b/sound/soc/codecs/rt5677-spi.c
@@ -26,6 +26,7 @@
 
 #include <sound/soc.h>
 
+#include "rt5677.h"
 #include "rt5677-spi.h"
 
 #define DRV_NAME "rt5677spi"
@@ -100,6 +101,12 @@ static struct snd_soc_dai_driver rt5677_spi_dai = {
 /* PCM for streaming audio from the DSP buffer */
 static int rt5677_spi_pcm_open(struct snd_pcm_substream *substream)
 {
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_component *component =
+			snd_soc_rtdcom_lookup(rtd, "rt5677");
+	struct rt5677_priv *rt5677 = snd_soc_component_get_drvdata(component);
+
+	rt5677->set_dsp_vad(component, true);
 	snd_soc_set_runtime_hwparams(substream, &rt5677_spi_pcm_hardware);
 	return 0;
 }
@@ -109,10 +116,15 @@ static int rt5677_spi_pcm_close(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_component *component =
 			snd_soc_rtdcom_lookup(rtd, DRV_NAME);
+	struct snd_soc_component *codec_component =
+			snd_soc_rtdcom_lookup(rtd, "rt5677");
+	struct rt5677_priv *rt5677 =
+			snd_soc_component_get_drvdata(codec_component);
 	struct rt5677_dsp *rt5677_dsp =
 			snd_soc_component_get_drvdata(component);
 
 	cancel_delayed_work_sync(&rt5677_dsp->copy_work);
+	rt5677->set_dsp_vad(codec_component, false);
 	return 0;
 }
 
diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 35d4ec1b7dfd..9cdfe7d488fe 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -918,7 +918,9 @@ static int rt5677_set_dsp_vad(struct snd_soc_component *component, bool on)
 	if (!IS_ENABLED(CONFIG_SND_SOC_RT5677_SPI))
 		return -ENXIO;
 
+	rt5677->dsp_vad_en = on;
 	dev_info(component->dev, "DSP VAD: on=%d, activity=%d\n", on, activity);
+
 	if (on && !activity) {
 		activity = true;
 
@@ -1005,7 +1007,8 @@ static int rt5677_dsp_vad_put(struct snd_kcontrol *kcontrol,
 	rt5677->dsp_vad_en = !!ucontrol->value.integer.value[0];
 
 	if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF)
-		rt5677_set_dsp_vad(component, rt5677->dsp_vad_en);
+		rt5677_set_dsp_vad(component,
+				!!ucontrol->value.integer.value[0]);
 
 	return 0;
 }
@@ -5471,6 +5474,7 @@ static int rt5677_i2c_probe(struct i2c_client *i2c)
 		return -ENOMEM;
 
 	rt5677->dev = &i2c->dev;
+	rt5677->set_dsp_vad = rt5677_set_dsp_vad;
 	i2c_set_clientdata(i2c, rt5677);
 
 	if (i2c->dev.of_node) {
diff --git a/sound/soc/codecs/rt5677.h b/sound/soc/codecs/rt5677.h
index 2bbd618b51ac..ec5be7e01fd1 100644
--- a/sound/soc/codecs/rt5677.h
+++ b/sound/soc/codecs/rt5677.h
@@ -1854,6 +1854,8 @@ struct rt5677_priv {
 	struct irq_domain *domain;
 	struct mutex irq_lock;
 	unsigned int irq_en;
+
+	int (*set_dsp_vad)(struct snd_soc_component *component, bool on);
 };
 
 int rt5677_sel_asrc_clk_src(struct snd_soc_component *component,
-- 
2.23.0.187.g17f5b7556c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
