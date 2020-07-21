Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EC6227F32
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 13:44:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2CE916AD;
	Tue, 21 Jul 2020 13:43:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2CE916AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595331885;
	bh=TwAhCtP1SLqqUtZAKyAnFcz5G+ue1cT6e8T/4f1V41o=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oMxeyHoU2G2o+CETEZM0GkwSoDLj3RjRq5cUTAfscsPYhzIzKPsraxzI2snpFAF+n
	 aPZ/jlKKS4RCmlGFCCNYza0Ua4zz1u/b03TvkK1lCMIbuxZwNVWCgCRfX/O3fW/W6O
	 wtTkUz/lJNw9ztBWbg8HcXS1XkD7N2ES+7PE4bS4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34141F8024A;
	Tue, 21 Jul 2020 13:43:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A83BF80268; Tue, 21 Jul 2020 13:43:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 743A1F800CE
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 13:42:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 743A1F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="l/HF4aQ5"
Received: by mail-yb1-xb4a.google.com with SMTP id x184so25380777ybx.10
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 04:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=pUWmRTBLEYRizskyMOfMCe5Obk/Y8AGE+aUZJdC32sg=;
 b=l/HF4aQ5fNmZm4GESxfFtw4LVaeYuPe/3oJyGtRScaxV0iYCBxNY08NUhoekd8lHPD
 jIiMqysHDPw126uGY66NT9TmOOwzF5+49L7/rLSpsYUiMHM7vWAFk7bjaKZPkxFSU/S0
 MLK8wt1HJGdtb7zJWMO7ahQ4TCEahXAE1hXZuD3Jq2K0Vbg0F2eGhQ6yDLX9YsFx5DvH
 RAIdn4Jk++d1hwipDZiHiwxNe5d51fJRAdPKJJlu3jNgrWxKmQroa1K8WmCNW1QfAW9u
 B00tWt4zOkKay9PIIOZVyFobuprBvch01LfN7FKjUxzPXOeJe9R0+XPBnGvbbaZdBJdM
 2zSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=pUWmRTBLEYRizskyMOfMCe5Obk/Y8AGE+aUZJdC32sg=;
 b=gMBIOZ5hMRZD1rcFuXftstjw+1458nZmenGP+XO0WuWcNQM8fFwLgLKiFq4OLCjXZ5
 7i0DA1jfgUZVtCX7WkhM9LMcbu2godsaQme6+Scye0rVwWz1ns1N2ep17CWSdeH+mvXR
 Gwnp20pa7HjGdPkN8FwRF+Oml4EAAyjyMo3N4Gd8qOffJn4Ey+qaQB0ixpxjKbSnNJ6q
 mIWdmTuOCishpIJod5Jd4h0K6ILL1KRCr+/GRGIu0QX+mYMS+SqiksXKjCmLgRfTi7AS
 rBSS8EW6zBzwuFGvLbd05n3ML9zrVfRZ3v7LLkGPYIVr7Z7BbqTkx3BKxN3dprHJnGaA
 sKbg==
X-Gm-Message-State: AOAM532dj5lVOcF9tqJQ9le+KExitX6Xir8wAwNCpbMXfeh0hZHNqqZE
 Jo5hAj90KEFpTm5FUCuQI6MFbYhBF58C
X-Google-Smtp-Source: ABdhPJxOVTW+qU+7x9pffdJYq1aJhi17fw4kRMdHq5/8/hmX03tjuhwXL+fYj8cnBgdZ4GLFPI7WD0kscMEy
X-Received: by 2002:a25:73ce:: with SMTP id o197mr40510611ybc.13.1595331769688; 
 Tue, 21 Jul 2020 04:42:49 -0700 (PDT)
Date: Tue, 21 Jul 2020 19:42:32 +0800
Message-Id: <20200721114232.2812254-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
Subject: [PATCH] ASoC: max98357a: move control of SD_MODE back to DAI ops
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, alpernebiyasak@gmail.com,
 cychiang@google.com, linux-rockchip@lists.infradead.org
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

Partially reverts commit 128f825aeab7 ("ASoC: max98357a: move control
of SD_MODE to DAPM").

In order to have mute control of max98357 from machine drivers, commit
128f825aeab7 ("ASoC: max98357a: move control of SD_MODE to DAPM")
moves the control of SD_MODE from DAI ops to DAPM events.  However, pop
noise has been observed on rk3399-gru-kevin boards due to this commit.

The commit 128f825aeab7 caused sequence of DAI clocks and SD_MODE
changed on rk3399-gru-kevin boards.

With the commit 128f825aeab7:
- SD_MODE will be set to 1 before DAI clocks start.
- SD_MODE will be set to 0 after DAI clocks stop.
As a result, pop noise.

Moves the control of SD_MODE back to DAI ops.  In the meantime, uses an
additional flag in DAPM event to provide chance of mute control for
machine drivers.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---

This patch addresses the reported issue in the thread
https://lkml.org/lkml/2020/7/16/427

 sound/soc/codecs/max98357a.c | 50 ++++++++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/max98357a.c b/sound/soc/codecs/max98357a.c
index 4f431133d0bb..918812763884 100644
--- a/sound/soc/codecs/max98357a.c
+++ b/sound/soc/codecs/max98357a.c
@@ -23,36 +23,61 @@
 struct max98357a_priv {
 	struct gpio_desc *sdmode;
 	unsigned int sdmode_delay;
+	int sdmode_switch;
 };
 
-static int max98357a_sdmode_event(struct snd_soc_dapm_widget *w,
-		struct snd_kcontrol *kcontrol, int event)
+static int max98357a_daiops_trigger(struct snd_pcm_substream *substream,
+		int cmd, struct snd_soc_dai *dai)
 {
-	struct snd_soc_component *component =
-		snd_soc_dapm_to_component(w->dapm);
+	struct snd_soc_component *component = dai->component;
 	struct max98357a_priv *max98357a =
 		snd_soc_component_get_drvdata(component);
 
 	if (!max98357a->sdmode)
 		return 0;
 
-	if (event & SND_SOC_DAPM_POST_PMU) {
-		msleep(max98357a->sdmode_delay);
-		gpiod_set_value(max98357a->sdmode, 1);
-		dev_dbg(component->dev, "set sdmode to 1");
-	} else if (event & SND_SOC_DAPM_PRE_PMD) {
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		mdelay(max98357a->sdmode_delay);
+		if (max98357a->sdmode_switch) {
+			gpiod_set_value(max98357a->sdmode, 1);
+			dev_dbg(component->dev, "set sdmode to 1");
+		}
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		gpiod_set_value(max98357a->sdmode, 0);
 		dev_dbg(component->dev, "set sdmode to 0");
+		break;
 	}
 
 	return 0;
 }
 
+static int max98357a_sdmode_event(struct snd_soc_dapm_widget *w,
+		struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct max98357a_priv *max98357a =
+		snd_soc_component_get_drvdata(component);
+
+	if (event & SND_SOC_DAPM_POST_PMU)
+		max98357a->sdmode_switch = 1;
+	else if (event & SND_SOC_DAPM_POST_PMD)
+		max98357a->sdmode_switch = 0;
+
+	return 0;
+}
+
 static const struct snd_soc_dapm_widget max98357a_dapm_widgets[] = {
 	SND_SOC_DAPM_OUTPUT("Speaker"),
 	SND_SOC_DAPM_OUT_DRV_E("SD_MODE", SND_SOC_NOPM, 0, 0, NULL, 0,
 			max98357a_sdmode_event,
-			SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+			SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
 };
 
 static const struct snd_soc_dapm_route max98357a_dapm_routes[] = {
@@ -71,6 +96,10 @@ static const struct snd_soc_component_driver max98357a_component_driver = {
 	.non_legacy_dai_naming	= 1,
 };
 
+static const struct snd_soc_dai_ops max98357a_dai_ops = {
+	.trigger        = max98357a_daiops_trigger,
+};
+
 static struct snd_soc_dai_driver max98357a_dai_driver = {
 	.name = "HiFi",
 	.playback = {
@@ -90,6 +119,7 @@ static struct snd_soc_dai_driver max98357a_dai_driver = {
 		.channels_min	= 1,
 		.channels_max	= 2,
 	},
+	.ops    = &max98357a_dai_ops,
 };
 
 static int max98357a_platform_probe(struct platform_device *pdev)
-- 
2.28.0.rc0.105.gf9edc3c819-goog

