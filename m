Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A33602D517F
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Dec 2020 04:39:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3975316B6;
	Thu, 10 Dec 2020 04:38:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3975316B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607571562;
	bh=ySoo1eNSFyGnGGIy0/6PU9WTamFMHJXRsvpsULdB8zA=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UYwOVp7vly6HgBFbaPKD5QZOdChBmhiuVG3hmkAG5A5pMonIx7fnO+NksQNmw03Kr
	 Lf2POJdPtsT4Svv6OZBfo0x4tjibJfqDIwztuyIrwZiYCuYqz+rinjmNQaJtKoszQ4
	 BWxrSlexC/p5So2lDwzrl0s7UpOiTwvGlkRsx7rM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F5C7F804BD;
	Thu, 10 Dec 2020 04:37:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C823FF804B0; Thu, 10 Dec 2020 04:37:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [IPv6:2607:f8b0:4864:20::54a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA948F80105
 for <alsa-devel@alsa-project.org>; Thu, 10 Dec 2020 04:36:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA948F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Ed4R8RwB"
Received: by mail-pg1-x54a.google.com with SMTP id u26so2686134pgl.15
 for <alsa-devel@alsa-project.org>; Wed, 09 Dec 2020 19:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=SXEsGufkNT6FIQKldy/p5vuu9+Knx6UWImuXquPu91k=;
 b=Ed4R8RwBbxAZXAlAdPScpKQoInNg8qmTJyqoR9C7oNLg0dLr2npAOjNyIHOHcpZSnV
 OGsxcSdm8H5C/+NTPefF5NeZMSrR3Lx6GB7/KeMrLhxD2yrFdiV8lgyEngdb2N8esYGF
 oRxp/36jaZQh9IPc4BfDIdF1OjsS9a6Y06jMkkjIKAhOG+ebdKNQlMMUpQtFrT0D/9am
 0Bg74Ban7iFJPPyWcFB+ZHVmkPAb5aescMFfNE1fUle/VY+lXh6z8+oqXqqf1C+OXWgM
 VsZ6pAN/HAumBipJ6YKDqkyVsY2TmJ1xVBkcvLcHDTkVSmh3M/TiuTUcmwtRRX0JCZ+m
 ZB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=SXEsGufkNT6FIQKldy/p5vuu9+Knx6UWImuXquPu91k=;
 b=D4oMXr3Sw1hkW8TOzJH6oFkVbW69fG9JGEAnbi175z4YPZNOvXJHftLP46badZ7qf8
 c7AZD2xAsYXpmrzFj7XgGf1jxkJEeTAAC1CKLx/jhHB0x+WIkhYL07Hrv+JXM3/LpfvU
 K68kfMrqS86HcLkvsBSugMz3RQPPymZQOxLNPQXZoC+drxaEjzQCDWaK9SjrxW/izjKo
 jL+wo+QPX8pmstZxtPoSUuyn1k4s9Oty8rnS6LIjwWpzvkArMCxnHIIi9u02Bm/jm3Bs
 uQ2EFNnThye+gTnGQ33UP1Wjfp9mwvhgnOCrlwNiCYRV9XAum8rwn6dgcJRu1OpTDVO1
 MeUA==
X-Gm-Message-State: AOAM531DDwCON8YpysqVmF+gKDjgxFfqRWwRvFyWwmklLx6mqQJAyEqe
 l6tWPqgag+FV4KGfZajs7mEl8KJ3eoGc
X-Google-Smtp-Source: ABdhPJyNYeQodq0/GJGj+R0EMpW8yP+kZn0/HBbfvOxjeG2RAcLqSSyD2pC1XlRssc2TLJ94o0W7w7kokBAA
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a17:90a:460a:: with SMTP id
 w10mr522743pjg.1.1607571410663; Wed, 09 Dec 2020 19:36:50 -0800 (PST)
Date: Thu, 10 Dec 2020 11:36:16 +0800
In-Reply-To: <20201210033617.79300-1-tzungbi@google.com>
Message-Id: <20201210033617.79300-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20201210033617.79300-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
Subject: [PATCH v2 1/2] ASoC: rt1015p: move SDB control from trigger to DAPM
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org
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

Moves SDB control from DAI ops trigger to DAPM.

As long as BCLK and LRCLK are ready, SDB can be toggled earlier.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/codecs/rt1015p.c | 49 ++++++++++----------------------------
 1 file changed, 12 insertions(+), 37 deletions(-)

diff --git a/sound/soc/codecs/rt1015p.c b/sound/soc/codecs/rt1015p.c
index 59bb60682270..397083ee5b37 100644
--- a/sound/soc/codecs/rt1015p.c
+++ b/sound/soc/codecs/rt1015p.c
@@ -19,60 +19,40 @@
 
 struct rt1015p_priv {
 	struct gpio_desc *sdb;
-	int sdb_switch;
 };
 
-static int rt1015p_daiops_trigger(struct snd_pcm_substream *substream,
-		int cmd, struct snd_soc_dai *dai)
+static int rt1015p_sdb_event(struct snd_soc_dapm_widget *w,
+		struct snd_kcontrol *kcontrol, int event)
 {
-	struct snd_soc_component *component = dai->component;
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
 	struct rt1015p_priv *rt1015p =
 		snd_soc_component_get_drvdata(component);
 
 	if (!rt1015p->sdb)
 		return 0;
 
-	switch (cmd) {
-	case SNDRV_PCM_TRIGGER_START:
-	case SNDRV_PCM_TRIGGER_RESUME:
-	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		if (rt1015p->sdb_switch) {
-			gpiod_set_value(rt1015p->sdb, 1);
-			dev_dbg(component->dev, "set sdb to 1");
-		}
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		gpiod_set_value(rt1015p->sdb, 1);
+		dev_dbg(component->dev, "set sdb to 1");
 		break;
-	case SNDRV_PCM_TRIGGER_STOP:
-	case SNDRV_PCM_TRIGGER_SUSPEND:
-	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SND_SOC_DAPM_POST_PMD:
 		gpiod_set_value(rt1015p->sdb, 0);
 		dev_dbg(component->dev, "set sdb to 0");
 		break;
+	default:
+		break;
 	}
 
 	return 0;
 }
 
-static int rt1015p_sdb_event(struct snd_soc_dapm_widget *w,
-		struct snd_kcontrol *kcontrol, int event)
-{
-	struct snd_soc_component *component =
-		snd_soc_dapm_to_component(w->dapm);
-	struct rt1015p_priv *rt1015p =
-		snd_soc_component_get_drvdata(component);
-
-	if (event & SND_SOC_DAPM_POST_PMU)
-		rt1015p->sdb_switch = 1;
-	else if (event & SND_SOC_DAPM_POST_PMD)
-		rt1015p->sdb_switch = 0;
-
-	return 0;
-}
-
 static const struct snd_soc_dapm_widget rt1015p_dapm_widgets[] = {
 	SND_SOC_DAPM_OUTPUT("Speaker"),
 	SND_SOC_DAPM_OUT_DRV_E("SDB", SND_SOC_NOPM, 0, 0, NULL, 0,
 			rt1015p_sdb_event,
-			SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
+			SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 };
 
 static const struct snd_soc_dapm_route rt1015p_dapm_routes[] = {
@@ -91,10 +71,6 @@ static const struct snd_soc_component_driver rt1015p_component_driver = {
 	.non_legacy_dai_naming	= 1,
 };
 
-static const struct snd_soc_dai_ops rt1015p_dai_ops = {
-	.trigger        = rt1015p_daiops_trigger,
-};
-
 static struct snd_soc_dai_driver rt1015p_dai_driver = {
 	.name = "HiFi",
 	.playback = {
@@ -104,7 +80,6 @@ static struct snd_soc_dai_driver rt1015p_dai_driver = {
 		.channels_min	= 1,
 		.channels_max	= 2,
 	},
-	.ops    = &rt1015p_dai_ops,
 };
 
 static int rt1015p_platform_probe(struct platform_device *pdev)
-- 
2.29.2.576.ga3fc446d84-goog

