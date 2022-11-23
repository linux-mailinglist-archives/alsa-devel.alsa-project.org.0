Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4998B635D50
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Nov 2022 13:43:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6A211655;
	Wed, 23 Nov 2022 13:42:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6A211655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669207430;
	bh=NP08Bu41lnXELqkflD2hs9IQL0DrhHcjsLCdz4Yc2as=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LZcDTl6/yt+aCCTjSjJMcvZpNxIyf6xjHByeVhsS5WEb6ZQUnMEqFwwQtFsRHPDPG
	 hoOQsmR9/txxOvKR9NCjBVjxGepZ6YBo/dLzCKykdLJOxW3187FtywZJpSR9i5IXUP
	 EsDJQy6e2ZuzG0rKSBylwDNWN8qc5I9zWjNtw31Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 659BEF80579;
	Wed, 23 Nov 2022 13:41:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00EBDF8057C; Wed, 23 Nov 2022 13:41:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3149F8057C
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 13:41:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3149F8057C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TCVFyfqY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A36C961C65;
 Wed, 23 Nov 2022 12:41:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35516C433D6;
 Wed, 23 Nov 2022 12:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669207293;
 bh=NP08Bu41lnXELqkflD2hs9IQL0DrhHcjsLCdz4Yc2as=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TCVFyfqYC3cQZGgsnSlTrH9cKkkWgGW3fXkww52cyI+E5DODOR6UJ3X+oDUmlyGdW
 71QTEVPaC0o9855ZefGk3RZE7oowdLEpAChsGl0kWto8d5RfpPqzJlZ1WEeJAMfZkm
 KUtwWAQDgCDmpO2ItQXniygpUDmktszK0awy2yaZUn1jYVMNqDOlmRCvrDfqmI7/jn
 VvJWuIzXkUGYPfsE7aD3iWQV96JKMM/uGKqjKpWNX8tpt9X+EMQGMLVIc+f9QnocIE
 +DKxKJCU+mdX7HTPvYu/4GOolSsaglZ96xkhwszuKZMeL+ESIEdji+0j/j4ZQsa1KN
 x/GTH3xla3Hfw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 14/44] ASoC: sof_es8336: reduce pop noise on
 speaker
Date: Wed, 23 Nov 2022 07:40:23 -0500
Message-Id: <20221123124057.264822-14-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123124057.264822-1-sashal@kernel.org>
References: <20221123124057.264822-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, cezary.rojewski@intel.com,
 mchehab@kernel.org, andrey.turkin@gmail.com, Zhu Ning <zhuning0077@gmail.com>,
 kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 liam.r.girdwood@linux.intel.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, muralidhar.reddy@intel.com,
 Zhu Ning <zhuning@everest-semi.com>, peter.ujfalusi@linux.intel.com
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

From: Zhu Ning <zhuning0077@gmail.com>

[ Upstream commit 89cdb224f2abe37ec4ac21ba0d9ddeb5a6a9cf68 ]

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
Link: https://lore.kernel.org/r/20221028020456.90286-1-zhuning0077@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_es8336.c | 60 ++++++++++++++++++++++-------
 1 file changed, 46 insertions(+), 14 deletions(-)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index 606cc3242a60..5c218a39ca20 100644
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
@@ -722,7 +752,8 @@ static int sof_es8336_probe(struct platform_device *pdev)
 	}
 
 	INIT_LIST_HEAD(&priv->hdmi_pcm_list);
-
+	INIT_DELAYED_WORK(&priv->pcm_pop_work,
+				pcm_pop_work_events);
 	snd_soc_card_set_drvdata(card, priv);
 
 	if (mach->mach_params.dmic_num > 0) {
@@ -751,6 +782,7 @@ static int sof_es8336_remove(struct platform_device *pdev)
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 	struct sof_es8336_private *priv = snd_soc_card_get_drvdata(card);
 
+	cancel_delayed_work(&priv->pcm_pop_work);
 	gpiod_put(priv->gpio_speakers);
 	device_remove_software_node(priv->codec_dev);
 	put_device(priv->codec_dev);
-- 
2.35.1

