Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FD515A0EF
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2020 06:58:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88A261676;
	Wed, 12 Feb 2020 06:57:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88A261676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581487089;
	bh=c6REEeojrRjiTRrGRUJDG8IYMLg3vomyGhockgLwGnA=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gs4gasgT92o1OxR9Speg4WU4xmWFN88pdt2WTnRIRS0+CI2l7POk6dpqlAwi9UcO4
	 rrVhisjZxyzPXeTeja8lrTAc3XtkYXY2voLvyMfwnmGGFTT3zWNls/Yx89gEu6nZSW
	 KP1HifkeueBID5AqobZfedyz9137Sc5lXTjp8ygU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 467F8F80228;
	Wed, 12 Feb 2020 06:55:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09BDCF80234; Wed, 12 Feb 2020 06:55:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-vk1-xa4a.google.com (mail-vk1-xa4a.google.com
 [IPv6:2607:f8b0:4864:20::a4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92CD9F800F0
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 06:55:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92CD9F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="vYeptxR3"
Received: by mail-vk1-xa4a.google.com with SMTP id m72so244922vka.20
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 21:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=T60LOCjPX6TJQwQlvV4ZuiXfhokY8vrCKTqwwXh4oRA=;
 b=vYeptxR3Y8uLJT0XvCS8OLsW4Ae+UrC0srPfn/1F2NFVCNQqv2nqRiQ4Qg0PYcJn8j
 yRa47eXrQkIJLF5BA1zHVbK+ETch276LdHyZb3K6WSR57uTiT2WnJqzL7jWKQDCA7SLr
 gCTiEDs8UsSqPM5Iue3ScIBHkuR2OURxEX58hwDHdD+GgbuOdvkKHukuxLm264aB+QBe
 31PFD5N7eT4XfCsteOpWhbAyG+MmFJGHVP595ydsOasUYiP24pSOlthnbQTxqbUgdl0F
 GyTRFaCMKz5AxZBFqLehaCzskqLlcIhopwPHoWRwAHDJQL7vRs9XRn9UpI+Tg0E0okiF
 DJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=T60LOCjPX6TJQwQlvV4ZuiXfhokY8vrCKTqwwXh4oRA=;
 b=qYobtOYcbMJQd4Ya6HEXJ/jhrFg+sezaORJkRz4bayAWpwlwNR2EVSo1BNF4tR9DBh
 1DseREQtUf1LUWrJ0Zr2L6DkUrX1/spTjeLSA4W4XcaSD+Iw9J/fTQ6gyArX3pLgeL+l
 onI9kDUwOVnvc6XQRD6qI1hs2kKrapy7+YuJv/e/ZHu2rRsaUhDgM/LbNI2BGkVjIVEU
 eMo/glP9VzCEnjFKs34KPFPzWlWRwasI3B3mbcY5WSvnMuh2jh+hubmbMaVYSoP638hH
 L5e0po/piC4WvIMiUHu2lC3umOUYUdmvZLx/0sG8xvOF4SlDJooEBeWSUz+vxt5Ks3C3
 IVSw==
X-Gm-Message-State: APjAAAX2eIlUrv7Q+Xbb2E0JV/65S0IjUi6dieVIyg52Nl/ITbeA/5cU
 xWkqxQtDn0R/yxhoOoW1R2x3aC78G6fh
X-Google-Smtp-Source: APXvYqy3G+uYIbveEvkXqN5P2rfmyGDXMWZFHeGABiyWI7Nsuw+axh0qqhLAgl+68CveCTz8UoVYdLTHzlMz
X-Received: by 2002:a1f:9684:: with SMTP id y126mr6738778vkd.84.1581486938338; 
 Tue, 11 Feb 2020 21:55:38 -0800 (PST)
Date: Wed, 12 Feb 2020 13:55:16 +0800
In-Reply-To: <20200212055517.122728-1-tzungbi@google.com>
Message-Id: <20200212124608.1.I73b26b5e319de173d05823e79f5861bf1826261c@changeid>
Mime-Version: 1.0
References: <20200212055517.122728-1-tzungbi@google.com>
X-Mailer: git-send-email 2.25.0.225.g125e21ebc7-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com, jiaxin.yu@mediatek.com
Subject: [alsa-devel] [PATCH 1/2] ASoC: max98357a: move control of SD_MODE
	to DAPM
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

Some machine may share the same I2S lines for multiple codecs. For
example, mediatek/mt8183/mt8183-da7219-max98357 shares the same lines
between max98357a and da7219.  When writing audio data through the I2S
lines, all codecs on the lines would try to generate sound if they
accepts DO line.  As a result, multiple codecs generate sound at a
time.

Moves control of SD_MODE to DAPM so that machine drivers have chances
to manipulate DAPM widget to turn on/off max98357a.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/codecs/max98357a.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/sound/soc/codecs/max98357a.c b/sound/soc/codecs/max98357a.c
index 16313b973eaa..74f20114297c 100644
--- a/sound/soc/codecs/max98357a.c
+++ b/sound/soc/codecs/max98357a.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/gpio.h>
@@ -24,26 +25,24 @@ struct max98357a_priv {
 	unsigned int sdmode_delay;
 };
 
-static int max98357a_daiops_trigger(struct snd_pcm_substream *substream,
-		int cmd, struct snd_soc_dai *dai)
+static int max98357a_sdmode_event(struct snd_soc_dapm_widget *w,
+		struct snd_kcontrol *kcontrol, int event)
 {
-	struct max98357a_priv *max98357a = snd_soc_dai_get_drvdata(dai);
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct max98357a_priv *max98357a =
+		snd_soc_component_get_drvdata(component);
 
 	if (!max98357a->sdmode)
 		return 0;
 
-	switch (cmd) {
-	case SNDRV_PCM_TRIGGER_START:
-	case SNDRV_PCM_TRIGGER_RESUME:
-	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		mdelay(max98357a->sdmode_delay);
+	if (event & SND_SOC_DAPM_POST_PMU) {
+		msleep(max98357a->sdmode_delay);
 		gpiod_set_value(max98357a->sdmode, 1);
-		break;
-	case SNDRV_PCM_TRIGGER_STOP:
-	case SNDRV_PCM_TRIGGER_SUSPEND:
-	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		dev_dbg(component->dev, "set sdmode to 1");
+	} else if (event & SND_SOC_DAPM_PRE_PMD) {
 		gpiod_set_value(max98357a->sdmode, 0);
-		break;
+		dev_dbg(component->dev, "set sdmode to 0");
 	}
 
 	return 0;
@@ -51,10 +50,14 @@ static int max98357a_daiops_trigger(struct snd_pcm_substream *substream,
 
 static const struct snd_soc_dapm_widget max98357a_dapm_widgets[] = {
 	SND_SOC_DAPM_OUTPUT("Speaker"),
+	SND_SOC_DAPM_OUT_DRV_E("SD_MODE", SND_SOC_NOPM, 0, 0, NULL, 0,
+			max98357a_sdmode_event,
+			SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
 };
 
 static const struct snd_soc_dapm_route max98357a_dapm_routes[] = {
-	{"Speaker", NULL, "HiFi Playback"},
+	{"SD_MODE", NULL, "HiFi Playback"},
+	{"Speaker", NULL, "SD_MODE"},
 };
 
 static const struct snd_soc_component_driver max98357a_component_driver = {
@@ -68,10 +71,6 @@ static const struct snd_soc_component_driver max98357a_component_driver = {
 	.non_legacy_dai_naming	= 1,
 };
 
-static const struct snd_soc_dai_ops max98357a_dai_ops = {
-	.trigger	= max98357a_daiops_trigger,
-};
-
 static struct snd_soc_dai_driver max98357a_dai_driver = {
 	.name = "HiFi",
 	.playback = {
@@ -91,7 +90,6 @@ static struct snd_soc_dai_driver max98357a_dai_driver = {
 		.channels_min	= 1,
 		.channels_max	= 2,
 	},
-	.ops    = &max98357a_dai_ops,
 };
 
 static int max98357a_platform_probe(struct platform_device *pdev)
-- 
2.25.0.225.g125e21ebc7-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
