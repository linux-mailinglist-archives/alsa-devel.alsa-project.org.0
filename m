Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF96183F6
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 05:06:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A26D184B;
	Thu,  9 May 2019 05:06:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A26D184B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557371219;
	bh=LtpWph9FGiPlGz9B5At8GCZkFCJBiTs/B2vzwXjuSCo=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q8XbJnSapCyXbj30TZ+nOuJs9PzYqw5QZR/VFuK3ewEmj//yFhrFuldj9OW86outm
	 rtgG7fj5zc7uepM1Yi44wNtMzCUkcn817K8qe70nelf/nalMOJ9Siy3lOmOIAwvOBm
	 p1uL/QVpbPrviA0VRj3f2P8SgsN9gBq7b5V8DQyU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CA45F89673;
	Thu,  9 May 2019 05:05:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4527DF89674; Thu,  9 May 2019 05:05:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, SPF_PASS, T_DKIMWL_WL_MED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43F29F8073C
 for <alsa-devel@alsa-project.org>; Thu,  9 May 2019 05:05:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43F29F8073C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="SNVi3d0g"
Received: by mail-qk1-x74a.google.com with SMTP id t67so716121qkd.15
 for <alsa-devel@alsa-project.org>; Wed, 08 May 2019 20:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=CD0Tc82bRvf51O4bG6cI3uO6s23sGd7WEODAifqaQsg=;
 b=SNVi3d0gGUXuZME2A+JsP6mPeKNKlJz5dLyXlvSoTZHK4h9RuD4ATX+ASe/9GsE3BU
 ZZkWfvGxk/VUYWM6sNvTDc4grpuPjjlArNzJRvhNZy3HdnaGDSo64DIxMc7euI2oTlQl
 xdZgtZYTqxmfWnOZX9mASX4eKN8eOjUrzPmyHhtIK+gvI1MIvod3A1Cv/8By5Ape2TsT
 ph9VoYQW04Dec5lxTXl+kcZ2MXYIALTyUk3hSqQKUlEn0iUkSp3dSfzKd2I9+W8Lv4wT
 cwlUtOeis3wHlBE3xXn57nF/xHIkyGR+vTX8K1a822+klThv95xSZgPf0BvEnzJNIfQd
 Cu2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=CD0Tc82bRvf51O4bG6cI3uO6s23sGd7WEODAifqaQsg=;
 b=dshr4WE7MaNCB8HCgRyNFGIvQ8KqdUAlbe4wZ8L/E+/WBrMwqO/VV+KGYSsTciGzvw
 za8sxaSDczRFCyUt15164AQkznC/V5Njd7qvnTQquIpzXGQVcCxT/OoFxn6wznpfO1uX
 qIejQk5X0P9MMCE0OUqepW2+fBQAfEKIV9jefqWHY7aa5uSDVWMkfQtKVqovfA3CF0TW
 zgazZ/o8Uqi+5AmRNLB/JzcoRHb8r70ytGLh95SVcuirU/NHEnRgRPKS/zmGw40o6J22
 di0TnlnrUfmbxXNNxSwFLaCGcZom7vvt2XDmazp4XxN3c2gLrCQTr0eGLjC1DzBRvQN+
 /D3A==
X-Gm-Message-State: APjAAAVdmnjkR9/k6mkkIRpwW0D+IngIGkMC/zNnEk6wFYEdbkvLbpyQ
 WJHHaWupKPUjSUhE0ZlYVuf+be/0Mgpq
X-Google-Smtp-Source: APXvYqyRNdSRM0dA/N0XZbIyoQUpv8qxFhb0ASydVwaQ45vW4e5ZaY6ZG07pp+pGXJz6sdrnS2VEf0mLFoNs
X-Received: by 2002:ac8:3617:: with SMTP id m23mr1429326qtb.173.1557371104057; 
 Wed, 08 May 2019 20:05:04 -0700 (PDT)
Date: Thu,  9 May 2019 11:04:54 +0800
Message-Id: <20190509030454.216079-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, tiwai@suse.com
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [PATCH v2] ASoC: max98357a: request GPIO when device
	get probed
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

devm_gpiod_get_optional() returns EBUSY after component rebound.

Request GPIO in max98357a_platform_probe() to support component
rebinding.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
v1:
ASoC: max98357a: manage GPIO for component rebinding
=> don't move from devm to non-devm
(https://patchwork.kernel.org/patch/10922979/)

v2:
ASoC: max98357a: release GPIO when component removing
=> only put things that really need the card in component's probe()
=> don't use devm_gpiod_put() if possible
(https://patchwork.kernel.org/patch/10932279/)

v3:
ASoC: max98357a: request GPIO when device get probed
=> remove empty function max98357a_component_probe() and
   max98357a_platform_remove()
(https://patchwork.kernel.org/patch/10936239/)

 sound/soc/codecs/max98357a.c | 29 +++++++++--------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/sound/soc/codecs/max98357a.c b/sound/soc/codecs/max98357a.c
index d037a3e4d323..80080a6415b3 100644
--- a/sound/soc/codecs/max98357a.c
+++ b/sound/soc/codecs/max98357a.c
@@ -59,21 +59,7 @@ static const struct snd_soc_dapm_route max98357a_dapm_routes[] = {
 	{"Speaker", NULL, "HiFi Playback"},
 };
 
-static int max98357a_component_probe(struct snd_soc_component *component)
-{
-	struct gpio_desc *sdmode;
-
-	sdmode = devm_gpiod_get_optional(component->dev, "sdmode", GPIOD_OUT_LOW);
-	if (IS_ERR(sdmode))
-		return PTR_ERR(sdmode);
-
-	snd_soc_component_set_drvdata(component, sdmode);
-
-	return 0;
-}
-
 static const struct snd_soc_component_driver max98357a_component_driver = {
-	.probe			= max98357a_component_probe,
 	.dapm_widgets		= max98357a_dapm_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(max98357a_dapm_widgets),
 	.dapm_routes		= max98357a_dapm_routes,
@@ -112,16 +98,20 @@ static struct snd_soc_dai_driver max98357a_dai_driver = {
 
 static int max98357a_platform_probe(struct platform_device *pdev)
 {
+	struct gpio_desc *sdmode;
+
+	sdmode = devm_gpiod_get_optional(&pdev->dev,
+				"sdmode", GPIOD_OUT_LOW);
+	if (IS_ERR(sdmode))
+		return PTR_ERR(sdmode);
+
+	dev_set_drvdata(&pdev->dev, sdmode);
+
 	return devm_snd_soc_register_component(&pdev->dev,
 			&max98357a_component_driver,
 			&max98357a_dai_driver, 1);
 }
 
-static int max98357a_platform_remove(struct platform_device *pdev)
-{
-	return 0;
-}
-
 #ifdef CONFIG_OF
 static const struct of_device_id max98357a_device_id[] = {
 	{ .compatible = "maxim,max98357a" },
@@ -145,7 +135,6 @@ static struct platform_driver max98357a_platform_driver = {
 		.acpi_match_table = ACPI_PTR(max98357a_acpi_match),
 	},
 	.probe	= max98357a_platform_probe,
-	.remove = max98357a_platform_remove,
 };
 module_platform_driver(max98357a_platform_driver);
 
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
