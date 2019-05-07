Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37552158CF
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 07:14:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1BE61838;
	Tue,  7 May 2019 07:13:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1BE61838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557206057;
	bh=Oj+GBhErxa7qPw38ilgBVFgf955jAXdSVP5+qj4h9Sg=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Myaedg9z45vj3Zqitzqt1lOxmUm3M4qJ22MpHdwt8q3ezohHYJZ0eYEytVuWV5E6g
	 D9fR4EMhxjlA3Ibbhw/SaUL26W9bCpQyxt3dKoAkdQn9dTkbftem1UHnTPr1wjKoYn
	 xcPAkBle8vX5Xg+T9hmEvIxaq9StxpXqh3om3gN0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DE1CF89673;
	Tue,  7 May 2019 07:12:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A688DF89674; Tue,  7 May 2019 07:12:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, SPF_PASS, T_DKIMWL_WL_MED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-yw1-xc49.google.com (mail-yw1-xc49.google.com
 [IPv6:2607:f8b0:4864:20::c49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79C9AF89671
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 07:12:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79C9AF89671
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="tmPYiA88"
Received: by mail-yw1-xc49.google.com with SMTP id v123so29617166ywf.16
 for <alsa-devel@alsa-project.org>; Mon, 06 May 2019 22:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=Pvv2wbS5Kj009HIS8CNJwa937mTMwhbCEwAVBmg46RY=;
 b=tmPYiA88sQ238n487Rt0I0ebfaLgp4YU7aJEHj/2irRmaD6dkYf5Dfsqe2hWccHheh
 Vi16PnSs3saLor4yWFAv6hJ121FJMzS4xjXGekjAzjjDMoAJjONgGoMUXoRGsGXpGMQx
 9OGNmkKUvKwftPDm3SeCzue/rAfyIISAmsLCwI2KxBcRk0Cc1J3PRO6v2VClivrbJIhN
 D77d9LW5YWnIDmOQGdy9EqlxHwoFOPCFDfT7zEkmD8Z1J7BSn3yS8K5KoHS9NnchpmNe
 m/z95A25xnrBcdmUz3FoGJdE5G4+Li/BQmp89PtkROpgtvznq/VLW/16RHu64g8/w7cj
 ug4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=Pvv2wbS5Kj009HIS8CNJwa937mTMwhbCEwAVBmg46RY=;
 b=JfG6yAU8/8vuZPlmMYGqoF1sDJKvkj8Fgn0y8bu3LViQ4NqkgXKf0O0nbxBlca1Ii6
 KOnftxPhrKgY7kf9o2ZKFymsep33ACwT3X2pwDgsanriYgYWJod84b+6hJ+XmfjTbMgT
 gMEj6iK3DsTPNlsKcJhWzaRnf800drWJZjprbISPo+WFAtGcjDLA4MNPxWqo9ByRGjc7
 MNMM9GjbhUJQb3Fud/2WLG43+V/CmJfS6FCZZJwK4YouSsxEI76CajNMgwYah8xtVwL8
 g4PTwpWHLRuhca/TOUGhmoyyPIMTVdAvazA30CcqWA2PykkUP4WnetiF3RiEIprvkCUM
 MjOA==
X-Gm-Message-State: APjAAAU4Ba5wYxeZMYG7Va/LBagqVkVbN3I7Zl9VkLbxSRYAhNljMci/
 TDzdx6ihZr+rb8hBOxiqh6g4zRA7QbQV
X-Google-Smtp-Source: APXvYqxjP/I6HDLlioM/ew2vO9f68fgZSHblWQowF+5LEIF3/u78ItoyeSzrLRCiX0PEhOobcBR8UVOLGZQ0
X-Received: by 2002:a81:84cc:: with SMTP id
 u195mr21463128ywf.501.1557205942471; 
 Mon, 06 May 2019 22:12:22 -0700 (PDT)
Date: Tue,  7 May 2019 13:11:40 +0800
Message-Id: <20190507051140.240245-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, tiwai@suse.com
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [PATCH] ASoC: max98357a: release GPIO when component
	removing
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
still binds to the device.  Then, when the component be probed
again, devm_gpiod_get_optional() returns EBUSY.

Release the GPIO proactively when component is removing.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/codecs/max98357a.c | 42 ++++++++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/max98357a.c b/sound/soc/codecs/max98357a.c
index d037a3e4d323..b11c6cb81f55 100644
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
+	max98357a->sdmode = devm_gpiod_get_optional(component->dev,
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
+		devm_gpiod_put(component->dev, max98357a->sdmode);
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
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
