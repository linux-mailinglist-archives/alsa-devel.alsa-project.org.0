Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB548F1C0
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2019 10:03:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A8DE166D;
	Tue, 30 Apr 2019 10:02:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A8DE166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556611423;
	bh=EENjeI9Te/DXJC8FqYHOQ+VTWSL00dN7cMlx+RfYwtQ=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UjKlf2K8i3CNjKXQA8ztwMXfY1yd/rkdY9V0LNfk3sseJAgBoIZzpF9IWUXImxCw0
	 aCiKRXT5HnPrmr0cQfEwBzxxqi/B8QQf+E7LXOLqPjH9Fm/Ag9MxBKjg4E2H8gjl9E
	 +5MhmbMSSzRMLpBjA1ofqdLjY4gy15M49NV/4vVU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DF32F896EC;
	Tue, 30 Apr 2019 10:01:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 510BEF896AA; Tue, 30 Apr 2019 10:01:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [IPv6:2607:f8b0:4864:20::449])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFC2DF80759
 for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2019 10:01:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFC2DF80759
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="G3E1qGaj"
Received: by mail-pf1-x449.google.com with SMTP id g1so8712733pfo.2
 for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2019 01:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=b0eS6J87HRbWlZiqOm1D47fILxdhSO+PpTJzP3/PYc4=;
 b=G3E1qGajppgGMJv/iXFqFh1VC+ndtIWUlkd+sJWgig1vVSTdK+1AMe+B7DbOYjLMLc
 55+lqmJjzxVij+Lhs6dSgUBt4TZjJXvQy9hjgAz5qJyJzwQA9qQjqhjTj2SUejhwiz6U
 uMmdw7uwM2CwoPWJEuWGQBWXZsL5utBYThorKu3bKLrC5IJpjlEelvYueIYNG0WRUTjj
 2ex5ENUVHoQrRuG1f/T3bp7fhB9IuhXqApvBeW4MRS81lD/SgG9ORE8AOybluHfqqTk+
 acJJkYjSOZZ/dTPPQaauIB3TcUx1XzVxkHotIpuvkNdVxFJ9ham6YKNW0pcQTfzvNDRT
 X/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=b0eS6J87HRbWlZiqOm1D47fILxdhSO+PpTJzP3/PYc4=;
 b=alWYYUEiV0Wto51YxX4eaUepYlgHR0LJ75SLQgmHAHA12Ip8yrzR12YXsgM47MO372
 EMaKWbSvz5QBbPUtVBGVFYkuGfAz7zm6CA1BO9mGhR3Orz6rvhHNSXCmrYAwbB2DsaYV
 CpVZOgchuXuSAEkKJZLSCcWHd9DHwtEhiZnrG8IH55GJPQri8o1hxOk0BLnzGto6ilTP
 gDjuPuMqvHN5FCg9lhpfTMYF79nGQPULNTzlw8Ss6Bh4iNysu966GJv3lFglUTAVuulc
 T4/CNwFrYEwyz2CYaepjHyi/gHLp9kmdZjg6JzWOdhkq0ny1cEzQLZz3qARKLI9sSRea
 GfBA==
X-Gm-Message-State: APjAAAXRbSF/N9rPF9G/PoQo6MjdzVZ6fe7NjBHBye/IfAowNxogaSV3
 y7YNEC0CMrmrIhrkH3daKZf5UYNbBT0k
X-Google-Smtp-Source: APXvYqwjM8eBUdMcKpqYlUfjxVNkog1NPiFvJt77wIijn4g1V0YlXWXPBagiBxtzBRlYmsSVsM6R65/R0Bgh
X-Received: by 2002:a63:e304:: with SMTP id f4mr64318328pgh.374.1556611309936; 
 Tue, 30 Apr 2019 01:01:49 -0700 (PDT)
Date: Tue, 30 Apr 2019 16:01:07 +0800
Message-Id: <20190430080107.113871-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, tiwai@suse.com
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [RFC PATCH] ASoC: max98357a: manage GPIO for component
	rebinding
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

Component's probe() gets GPIO for "sdmode-gpios" via
devm_gpiod_get_optional().  The GPIO binds to the device.

When the component get removed but the device does not, the GPIO
still binds to the device.

Then, when the component be probed again, devm_gpiod_get_optional()
returns EBUSY.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
Hi,

We discovered the issue when rebinding sound card.  We found that the
rebinding failed due to the GPIO was hold by the first time component's
probe() in max98357.

The patch changes devm to non-devm API, because we don't have equivalent
API for ASoC components (e.g. compm_).

Question: we are not very sure to move from devm to non-devm, because
devm should be most encouraged.
Question: does it suggest not to use devm for GPIO in component's
probe()?  It seems there are still some such usages, for example
sound/soc/codecs/dmic.c.

 sound/soc/codecs/max98357a.c | 42 ++++++++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/max98357a.c b/sound/soc/codecs/max98357a.c
index d037a3e4d323..4e90876f6ef6 100644
--- a/sound/soc/codecs/max98357a.c
+++ b/sound/soc/codecs/max98357a.c
@@ -27,24 +27,28 @@
 #include <sound/soc-dai.h>
 #include <sound/soc-dapm.h>
 
+struct max98357a_priv {
+	struct gpio_desc *sdmode;
+};
+
 static int max98357a_daiops_trigger(struct snd_pcm_substream *substream,
 		int cmd, struct snd_soc_dai *dai)
 {
-	struct gpio_desc *sdmode = snd_soc_dai_get_drvdata(dai);
+	struct max98357a_priv *max98357a = snd_soc_dai_get_drvdata(dai);
 
-	if (!sdmode)
+	if (!max98357a->sdmode)
 		return 0;
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		gpiod_set_value(sdmode, 1);
+		gpiod_set_value(max98357a->sdmode, 1);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		gpiod_set_value(sdmode, 0);
+		gpiod_set_value(max98357a->sdmode, 0);
 		break;
 	}
 
@@ -61,19 +65,31 @@ static const struct snd_soc_dapm_route max98357a_dapm_routes[] = {
 
 static int max98357a_component_probe(struct snd_soc_component *component)
 {
-	struct gpio_desc *sdmode;
+	struct max98357a_priv *max98357a =
+			snd_soc_component_get_drvdata(component);
 
-	sdmode = devm_gpiod_get_optional(component->dev, "sdmode", GPIOD_OUT_LOW);
-	if (IS_ERR(sdmode))
-		return PTR_ERR(sdmode);
+	max98357a->sdmode = gpiod_get_optional(component->dev,
+					"sdmode", GPIOD_OUT_LOW);
+	if (IS_ERR(max98357a->sdmode))
+		return PTR_ERR(max98357a->sdmode);
 
-	snd_soc_component_set_drvdata(component, sdmode);
+	snd_soc_component_set_drvdata(component, max98357a);
 
 	return 0;
 }
 
+static void max98357a_component_remove(struct snd_soc_component *component)
+{
+	struct max98357a_priv *max98357a =
+			snd_soc_component_get_drvdata(component);
+
+	if (max98357a->sdmode)
+		gpiod_put(max98357a->sdmode);
+}
+
 static const struct snd_soc_component_driver max98357a_component_driver = {
 	.probe			= max98357a_component_probe,
+	.remove			= max98357a_component_remove,
 	.dapm_widgets		= max98357a_dapm_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(max98357a_dapm_widgets),
 	.dapm_routes		= max98357a_dapm_routes,
@@ -112,6 +128,14 @@ static struct snd_soc_dai_driver max98357a_dai_driver = {
 
 static int max98357a_platform_probe(struct platform_device *pdev)
 {
+	struct max98357a_priv *max98357a;
+
+	max98357a = devm_kzalloc(&pdev->dev, sizeof(*max98357a), GFP_KERNEL);
+	if (!max98357a)
+		return -ENOMEM;
+
+	dev_set_drvdata(&pdev->dev, max98357a);
+
 	return devm_snd_soc_register_component(&pdev->dev,
 			&max98357a_component_driver,
 			&max98357a_dai_driver, 1);
-- 
2.21.0.593.g511ec345e18-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
