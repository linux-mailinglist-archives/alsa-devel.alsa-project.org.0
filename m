Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF857E035C
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 13:49:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 403081658;
	Tue, 22 Oct 2019 13:48:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 403081658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571744964;
	bh=N0Ra5v6ncfivvR4ViBN4JpOh91qMtywBhzQ0bM6Qgek=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QDg3WwUl9yzAsR6i4RLgWG9ix0XRI6+ndfFg0zm/tgumlbvQk3nkGsbjQ0xJcyJbF
	 k5UCeBGiVHJHWU67qYy0SiDx2fxFMiBftP3IJxm/UmQb/NJ0nhXwr9EvV+0fSGPWAq
	 Mcln1iDurx62K6aRgbniYOwJuoGvc9XxKGymzPIg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30A21F8058C;
	Tue, 22 Oct 2019 13:47:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9614CF80539; Tue, 22 Oct 2019 13:46:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-vk1-xa49.google.com (mail-vk1-xa49.google.com
 [IPv6:2607:f8b0:4864:20::a49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC834F80112
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 13:46:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC834F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="fvUU4X0S"
Received: by mail-vk1-xa49.google.com with SMTP id i20so7455655vkk.21
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 04:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=q90rWJEkGm2l9nI3fLz2Cj+itxcilYQDCfUCXu1yWQg=;
 b=fvUU4X0Sib4BfXVWA9CPePFVHefO+pH8Ci8fFdRiFSB5iTPQA+ra5mL+VLYXS7IZNR
 zt4DCioEFPM6+qZU7/V76QviJtdzE8pWUIIYz25OGqu8fcCg/ad/mBFD0X3VMj6iE6sl
 5e5jBG8G1FjxHr/xlaM66aihrErDmJqsgHtVlTctEF8nGdpQyh3/iGguis1EpaVIXxFc
 r9FVu8lnN5mq2/lZJKIog6SciWR7ePKbkaMVHBwIX4gQOmsutILG/GhOmCeRGTxxkxUJ
 a75pPUwAB59Lx1guwRD0KIOKxiPcMXxt31Pn9IJzZN9q+c/Rv4tOuPJCaKinGj7AQDa0
 0CQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=q90rWJEkGm2l9nI3fLz2Cj+itxcilYQDCfUCXu1yWQg=;
 b=KCgwF2foBVOW5NVV2U+pOsIfizNsvE2euYIu+jF1wgh/V/Ytiri2AdTUjT7ON2I7rK
 FGGcNT1utfpmgGyK38jVPiTz/LbKRKcSuPNtQIEn95GRZUimGzwWhRte7B1A5jGLkI9s
 CUegvthfxenQNq1Wp6utJW0Z+FQHxOHkRs5MyDEliRKP8VN99m0Zk4+rFhjk0FahjXsb
 2mw+uWYlJ/Kw2PfT9ZjJJX2H7ZORpG5/Bj8gnycc0ZIOqZ63qOuwzIbywWv81Yr1/XYd
 fLlSqq4OijoctemwgSm8lRmqXDMBflDNjyKEiVLovoIargvr4bvK6u4Gv9i6m6Q2F7po
 /TIQ==
X-Gm-Message-State: APjAAAVqOlJfQjWyFXRomYvjCjm0At5SKeRDDjnRIhbgakJH5j+32HpD
 HfAa5LUG7HDkp9LcZCfzrhZ6b9vHq8IA
X-Google-Smtp-Source: APXvYqzsB+mP+SYK0nkZDI+E5ctlzYSDa2qZV3FsZvCzlBqBSD0WoJVKv1DehaXyYVIbfl0rJsvRLOUyAOTG
X-Received: by 2002:a67:8841:: with SMTP id k62mr1532968vsd.101.1571744809794; 
 Tue, 22 Oct 2019 04:46:49 -0700 (PDT)
Date: Tue, 22 Oct 2019 19:45:00 +0800
In-Reply-To: <20191022114505.196852-1-tzungbi@google.com>
Message-Id: <20191022193301.1.I3039014cf259de5e4d6315fc05dff111591a0901@changeid>
Mime-Version: 1.0
References: <20191022114505.196852-1-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org, narmstrong@baylibre.com
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, jonas@kwiboo.se, allen.chen@ite.com.tw,
 jernej.skrabec@siol.net, dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, tzungbi@google.com, dgreid@google.com
Subject: [alsa-devel] [PATCH 1/6] ASoC: hdmi-codec: add PCM trigger operator
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

HDMI codec may be also interested in PCM triggers.  Add PCM trigger
operator.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 include/sound/hdmi-codec.h    | 13 +++++++++++++
 sound/soc/codecs/hdmi-codec.c | 31 +++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
index 83b17682e01c..9de462ef170d 100644
--- a/include/sound/hdmi-codec.h
+++ b/include/sound/hdmi-codec.h
@@ -50,6 +50,13 @@ struct hdmi_codec_params {
 typedef void (*hdmi_codec_plugged_cb)(struct device *dev,
 				      bool plugged);
 
+enum {
+	HDMI_CODEC_TRIGGER_EVENT_STOP,
+	HDMI_CODEC_TRIGGER_EVENT_START,
+	HDMI_CODEC_TRIGGER_EVENT_SUSPEND,
+	HDMI_CODEC_TRIGGER_EVENT_RESUME,
+};
+
 struct hdmi_codec_pdata;
 struct hdmi_codec_ops {
 	/*
@@ -66,6 +73,12 @@ struct hdmi_codec_ops {
 			 struct hdmi_codec_daifmt *fmt,
 			 struct hdmi_codec_params *hparms);
 
+	/*
+	 * PCM trigger callback.
+	 * Optional
+	 */
+	int (*trigger)(struct device *dev, int event);
+
 	/*
 	 * Shuts down the audio stream.
 	 * Mandatory
diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index b5fd8f08726e..1ba2fa26ba03 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -565,12 +565,42 @@ static int hdmi_codec_digital_mute(struct snd_soc_dai *dai, int mute)
 	return 0;
 }
 
+static int hdmi_codec_trigger(struct snd_pcm_substream *substream, int cmd,
+			      struct snd_soc_dai *dai)
+{
+	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
+	int event;
+
+	if (!hcp->hcd.ops->trigger)
+		return 0;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_STOP:
+		event = HDMI_CODEC_TRIGGER_EVENT_STOP;
+		break;
+	case SNDRV_PCM_TRIGGER_START:
+		event = HDMI_CODEC_TRIGGER_EVENT_START;
+		break;
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+		event = HDMI_CODEC_TRIGGER_EVENT_SUSPEND;
+		break;
+	case SNDRV_PCM_TRIGGER_RESUME:
+		event = HDMI_CODEC_TRIGGER_EVENT_RESUME;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return hcp->hcd.ops->trigger(dai->dev->parent, event);
+}
+
 static const struct snd_soc_dai_ops hdmi_codec_i2s_dai_ops = {
 	.startup	= hdmi_codec_startup,
 	.shutdown	= hdmi_codec_shutdown,
 	.hw_params	= hdmi_codec_hw_params,
 	.set_fmt	= hdmi_codec_i2s_set_fmt,
 	.digital_mute	= hdmi_codec_digital_mute,
+	.trigger	= hdmi_codec_trigger,
 };
 
 static const struct snd_soc_dai_ops hdmi_codec_spdif_dai_ops = {
@@ -578,6 +608,7 @@ static const struct snd_soc_dai_ops hdmi_codec_spdif_dai_ops = {
 	.shutdown	= hdmi_codec_shutdown,
 	.hw_params	= hdmi_codec_hw_params,
 	.digital_mute	= hdmi_codec_digital_mute,
+	.trigger	= hdmi_codec_trigger,
 };
 
 #define HDMI_RATES	(SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 |\
-- 
2.23.0.866.gb869b98d4c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
