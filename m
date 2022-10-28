Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E78461079B
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 04:06:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09A1B2AFC;
	Fri, 28 Oct 2022 04:05:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09A1B2AFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666922767;
	bh=9VS1pgNDCS2ZSURUuTagRPUskjKjTg4/IiYWB5ualMM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NGGTHHa6a42vKpZXExeDm1hymWUSYzDP3SjWGp0GOnTVvihvJ2MCeoagCyIgi2OZ7
	 We+6fuH1/rQ8oI8ytxLcw4wYUZmSIW73FHeu/OZzW0dBbDinsr8mAvYaz+k3ZDcQeh
	 LuPCg0T9hPEi8APzNSYr3syIQNUVDaiRk33R9kjA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70E55F804BD;
	Fri, 28 Oct 2022 04:05:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF86DF8025A; Fri, 28 Oct 2022 04:05:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7138DF800E1
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 04:05:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7138DF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XsXJYqPK"
Received: by mail-pl1-x62f.google.com with SMTP id f23so3599775plr.6
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 19:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CtkfxuL3SBLlD88tuz/f1paKiwFmKn/vjuKEUjO8cqY=;
 b=XsXJYqPK4JB3mQvipMsjAP9YV0KxlKsKuibMQGgAAj2QsZ3PTj52EMjdyGx7Owftm9
 w+6r7aVMpBzW6hQZaZcrs7y28UggkX0wpkdpgUNS1YXF5WaiLg+33bZa7gXEqxPVv+OQ
 Pvgn46O1PHN6Du5bhJ0yefdZtY4J8NVPvz2cNJveVEb01zJSEDUwrz+phB7J1l4/3Gh5
 M5cz1x32xJX8hNuEy1BLULv1N59tBKJwExNOJjVsEEZOm9yNXvyrX/L+FvqJx9jWR+y5
 ImYD5VyG/M8MWPa/KkPm6aQcboM2wJO362towx4iERqjo+zb6wLy+9TVr+NkBEYhqHFX
 n+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CtkfxuL3SBLlD88tuz/f1paKiwFmKn/vjuKEUjO8cqY=;
 b=z0377ZQR0ObPbtbTaTU58f+9I6hBxnHpFAjAWJ7HqeznCwCGCwzEY6RFm2LYSqdCHC
 5feqhg45PlrZ+amz90NnvOtQO8Jmd/tUloOmGfWEos4lzojxnNxgRv0f8KX/II2cfb1X
 fJRHIOHVH/O3yNbzZfsSOhRC1glF+bTgwo/G6vP/ryJnLcwNRPhIDKE+sxmXM4704YTZ
 Cmbe2OLJbEPE+0SaDbjWLFTg0Grh054KJLxZAIx4m9KySpX90Nu4Q6C85ridWVLmc8HQ
 RgW5A4dVPVAQPDxsWTa/tHOMHL/BAAY+Yw3t+eXK2pFWDK30o8dWfVZcmvaYSgEggZKq
 yZaQ==
X-Gm-Message-State: ACrzQf06aZEoUkvFDjyJu1E8HPBQD0phNSuXGpVgS1Dsj/FZLxFiq4HN
 9+WmUoTpP8Mr3EHk1+rGAralkUnoip4WUjMQ
X-Google-Smtp-Source: AMsMyM4ELz96nBdYlMpa9oj/SbM3Wvtf0e0xog72r/K2cnDTkbiJYJ+88LTsxyIlzFH5GTS2YvygBA==
X-Received: by 2002:a17:903:2411:b0:184:7159:dce6 with SMTP id
 e17-20020a170903241100b001847159dce6mr53958020plo.101.1666922699622; 
 Thu, 27 Oct 2022 19:04:59 -0700 (PDT)
Received: from localhost ([114.86.225.171]) by smtp.gmail.com with ESMTPSA id
 y29-20020aa79e1d000000b0056b9df2a15esm1792528pfq.62.2022.10.27.19.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 19:04:59 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v1] ASoC: sof_es8336: reduce pop noise on speaker
Date: Fri, 28 Oct 2022 10:04:56 +0800
Message-Id: <20221028020456.90286-1-zhuning0077@gmail.com>
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

------------

v1: cancel delayed work while disabling speaker.
---
 sound/soc/intel/boards/sof_es8336.c | 60 ++++++++++++++++++++++-------
 1 file changed, 46 insertions(+), 14 deletions(-)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index fbb42e54947a..70713e4b07dc 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -63,6 +63,7 @@ struct sof_es8336_private {
 	struct snd_soc_jack jack;
 	struct list_head hdmi_pcm_list;
 	bool speaker_en;
+	struct delayed_work pcm_pop_work;
 };
 
 struct sof_hdmi_pcm {
@@ -111,6 +112,46 @@ static void log_quirks(struct device *dev)
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
+			if (substream->stream == 0) {
+				cancel_delayed_work(&priv->pcm_pop_work);
+				gpiod_set_value_cansleep(priv->gpio_speakers, true);
+			}
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
@@ -122,19 +163,7 @@ static int sof_es8316_speaker_power_event(struct snd_soc_dapm_widget *w,
 
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
 
@@ -344,6 +373,7 @@ static int sof_es8336_hw_params(struct snd_pcm_substream *substream,
 /* machine stream operations */
 static struct snd_soc_ops sof_es8336_ops = {
 	.hw_params = sof_es8336_hw_params,
+	.trigger = sof_8336_trigger,
 };
 
 static struct snd_soc_dai_link_component platform_component[] = {
@@ -723,7 +753,8 @@ static int sof_es8336_probe(struct platform_device *pdev)
 	}
 
 	INIT_LIST_HEAD(&priv->hdmi_pcm_list);
-
+	INIT_DELAYED_WORK(&priv->pcm_pop_work,
+				pcm_pop_work_events);
 	snd_soc_card_set_drvdata(card, priv);
 
 	if (mach->mach_params.dmic_num > 0) {
@@ -752,6 +783,7 @@ static int sof_es8336_remove(struct platform_device *pdev)
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 	struct sof_es8336_private *priv = snd_soc_card_get_drvdata(card);
 
+	cancel_delayed_work(&priv->pcm_pop_work);
 	gpiod_put(priv->gpio_speakers);
 	device_remove_software_node(priv->codec_dev);
 	put_device(priv->codec_dev);
-- 
2.37.2

