Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE2260F138
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 09:39:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE97C3197;
	Thu, 27 Oct 2022 09:38:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE97C3197
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666856358;
	bh=mnzMYAtygfpQCJZOOUWOqu7QmEQ55YaCpOKS0lB6xFE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xvsws7CLB4XXaCLEU7Gr57Fu28z/EzLxwiDXK/DJzCx3wrKGTrml3dzv5pmtGNdD+
	 ntZz6LVEadp3B55jq4KRl/dkzm+Bk41edDs5kLt5oEiQW9ViILzPJCoV/yIjheFoZ/
	 I8FOHSqx3G21D+XCqKNwEHRnwFeqCHjv9aY3EXoA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F4B4F80100;
	Thu, 27 Oct 2022 09:38:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAE9DF8025E; Thu, 27 Oct 2022 09:38:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B9B3F80095
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 09:38:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B9B3F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IwKZ8Dru"
Received: by mail-pj1-x1032.google.com with SMTP id
 c15-20020a17090a1d0f00b0021365864446so684629pjd.4
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 00:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tM/cNQz4T9EnxdsC8bkgHOCHrMxNrpjar2ur8aJMg4w=;
 b=IwKZ8DruwcAbajdiPeHI0LIa+k0qItk+t52Jdi7ZT8lr3lPzQZHAnUjJ+vvYBNAP/e
 xyAsnVdNRyzQ5A7nZ+fSaOSKxfe1YgSyJfKgaqWq6arniEbUwzvpsOxIFd1NkRl7xY/F
 iYqtjCITu5RhHFmijXCQpZFaO1I9RS7cEh7U0rZ71FJ4icwb6JujruigRFJHyI8t9CEk
 6U6abKEVAvNh9VBWHP6au7Xt5Cx5ss0tM+DTxpljcWv2cfoTY+XkwyWcz+KFjF6NxfZR
 YKioelhQaE66Ti6/0zl9TGgbPQoIlTlwh2CUa2j+NBz2tz289KGNoIFDJdhxRTBuOsH8
 EL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tM/cNQz4T9EnxdsC8bkgHOCHrMxNrpjar2ur8aJMg4w=;
 b=h1kRz1N5EOajXLZ/YlO0qyuClPszItSv8HaNSmOy01TVP8P9260+kZ5MKkVbF0/8R5
 xx3dqKxtx91zXA7DzaLzwOvAuGHffpZy0/iqF2IvfWHUGpPenqn2zawpupA8lUs6rB1r
 DbQS4BJ1OWxSNXI/bW7sTIV/vvqVaV12ZE8YI5fBv2KCUMe38lgcy5A85k2dt/L9XhaM
 iX1ZWyBsUmP2HDULXy+clkuEvvoC5b5fq2upappAVvwfiykl0mMvSY5M4B1MV+nuBGS+
 +H9+Fe9G1GLjffIewULZMdmTkE713h078AvDNaUkwjLmUIF9IqI+6XIU2Nt84NKW9IJX
 WvTQ==
X-Gm-Message-State: ACrzQf2FU8+oCEP9Pq3AJ6+oNEo50j4xQuiiXV9pr1lps6CYT9uQaTZH
 R1H92ZEkGi5aK3UqG8xsiLXLO9b894DP9U8+
X-Google-Smtp-Source: AMsMyM5wSumDvkEtSgt5n6pnOAeLORf8GNqho9Ay7WjHZ82A+ryZiMj6NtplqNLj9EApvnJGbJlaQQ==
X-Received: by 2002:a17:90b:1d12:b0:20c:8edd:59a3 with SMTP id
 on18-20020a17090b1d1200b0020c8edd59a3mr8574679pjb.222.1666856290776; 
 Thu, 27 Oct 2022 00:38:10 -0700 (PDT)
Received: from localhost ([114.86.225.171]) by smtp.gmail.com with ESMTPSA id
 s17-20020a170902ea1100b0017f778d4543sm528010plg.241.2022.10.27.00.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 00:38:10 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: sof_es8336: reduce pop noise on speaker
Date: Thu, 27 Oct 2022 15:38:07 +0800
Message-Id: <20221027073807.3754-1-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Zhu Ning <zhuning0077@gmail.com>, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, broonie@kernel.org, Zhu Ning <zhuning@everest-semi.com>,
 yangxiaohua@everest-semi.com
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

The Speaker GPIO needs to be turned on slightly behind the codec turned on.
It also need to be turned off slightly before the codec turned down.
Current code uses delay in DAPM_EVENT to do it but the mdelay delays the
DAPM itself and thus has no effect. A delayed_work is added to turn on the
speaker.
The Speaker is turned off in .trigger since trigger is called slightly
before the DAPM events.

Signed-off-by: Zhu Ning <zhuning@everest-semi.com>
---
 sound/soc/intel/boards/sof_es8336.c | 58 ++++++++++++++++++++++-------
 1 file changed, 44 insertions(+), 14 deletions(-)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index fbb42e54947a..7fde36a02d11 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -63,6 +63,7 @@ struct sof_es8336_private {
 	struct snd_soc_jack jack;
 	struct list_head hdmi_pcm_list;
 	bool speaker_en;
+	struct delayed_work pcm_pop_work;
 };
 
 struct sof_hdmi_pcm {
@@ -111,6 +112,44 @@ static void log_quirks(struct device *dev)
 		dev_info(dev, "quirk headset at mic1 port enabled\n");
 }
 
+static void pcm_pop_work_events(struct work_struct *work)
+{
+	struct sof_es8336_private *priv =
+		container_of(work, struct sof_es8336_private, pcm_pop_work.work);
+
+	gpiod_set_value_cansleep(priv->gpio_speakers, priv->speaker_en);
+
+	if (quirk & SOF_ES8336_HEADPHONE_GPIO)
+		gpiod_set_value_cansleep(priv->gpio_headphone, priv->speaker_en);
+
+}
+
+static int sof_8336_trigger(struct snd_pcm_substream *substream, int cmd)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_card *card = rtd->card;
+	struct sof_es8336_private *priv = snd_soc_card_get_drvdata(card);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+	case SNDRV_PCM_TRIGGER_RESUME:
+		break;
+
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_STOP:
+		if (priv->speaker_en == false)
+			if (substream->stream == 0)
+				gpiod_set_value_cansleep(priv->gpio_speakers, true);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int sof_es8316_speaker_power_event(struct snd_soc_dapm_widget *w,
 					  struct snd_kcontrol *kcontrol, int event)
 {
@@ -122,19 +161,7 @@ static int sof_es8316_speaker_power_event(struct snd_soc_dapm_widget *w,
 
 	priv->speaker_en = !SND_SOC_DAPM_EVENT_ON(event);
 
-	if (SND_SOC_DAPM_EVENT_ON(event))
-		msleep(70);
-
-	gpiod_set_value_cansleep(priv->gpio_speakers, priv->speaker_en);
-
-	if (!(quirk & SOF_ES8336_HEADPHONE_GPIO))
-		return 0;
-
-	if (SND_SOC_DAPM_EVENT_ON(event))
-		msleep(70);
-
-	gpiod_set_value_cansleep(priv->gpio_headphone, priv->speaker_en);
-
+	queue_delayed_work(system_wq, &priv->pcm_pop_work, msecs_to_jiffies(70));
 	return 0;
 }
 
@@ -344,6 +371,7 @@ static int sof_es8336_hw_params(struct snd_pcm_substream *substream,
 /* machine stream operations */
 static struct snd_soc_ops sof_es8336_ops = {
 	.hw_params = sof_es8336_hw_params,
+	.trigger = sof_8336_trigger,
 };
 
 static struct snd_soc_dai_link_component platform_component[] = {
@@ -723,7 +751,8 @@ static int sof_es8336_probe(struct platform_device *pdev)
 	}
 
 	INIT_LIST_HEAD(&priv->hdmi_pcm_list);
-
+	INIT_DELAYED_WORK(&priv->pcm_pop_work,
+				pcm_pop_work_events);
 	snd_soc_card_set_drvdata(card, priv);
 
 	if (mach->mach_params.dmic_num > 0) {
@@ -752,6 +781,7 @@ static int sof_es8336_remove(struct platform_device *pdev)
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 	struct sof_es8336_private *priv = snd_soc_card_get_drvdata(card);
 
+	cancel_delayed_work(&priv->pcm_pop_work);
 	gpiod_put(priv->gpio_speakers);
 	device_remove_software_node(priv->codec_dev);
 	put_device(priv->codec_dev);
-- 
2.37.2

