Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4D42CA3C4
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Dec 2020 14:28:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F01D17BA;
	Tue,  1 Dec 2020 14:27:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F01D17BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606829300;
	bh=1Rtn3YVm1OW3lOwDdvYUJdJvIMgVb9zeLxwrRUgY9ww=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MYetx3rAKzUtTFWUxj0C4/GfAaJZ2pyHEA15sEbZtSkai1ghc1KOit0vx9pYsITiT
	 BQCEaaThWTUXsciDLj1hrafO2ayWeXeVsgthcHrVXmxHn+vQA1Kx4vc4fYLxP4bcDS
	 jWY1kemAx0U6C8u0GNU+eO9Upe++uAcO56BiMN5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 926CAF8016D;
	Tue,  1 Dec 2020 14:26:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89AC7F8016D; Tue,  1 Dec 2020 14:26:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com
 [IPv6:2607:f8b0:4864:20::f49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 919F1F80168
 for <alsa-devel@alsa-project.org>; Tue,  1 Dec 2020 14:26:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 919F1F80168
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="sBiTWiAS"
Received: by mail-qv1-xf49.google.com with SMTP id y8so1161938qvu.22
 for <alsa-devel@alsa-project.org>; Tue, 01 Dec 2020 05:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=zeBdGQi7aQ2RzZ5oYC/vR5oem1skz7Qr9Eoewd69/U0=;
 b=sBiTWiASpLsq3LJ8BDI2Y+60ZFuYshHMzBf38x4k4bX+31eAuJo+nB4DKrsFFjNV8C
 aH6xszV0gPiWyCE7ttEknJVSpMVfJBLlGpWRLsaTynYSTYQgzTUdPKPMnCRkB6X9pjwX
 ZPrP1ZFeJFV7qDHQ5slC/nQBs6ee872uARmhXyzKsLK0wNHAT11Jeg/eQLAcWeBHEB4h
 N7Pd2bIi9J2+zXLcqomlijYMrJRxxp7PC8NJdBuAYLQm5V8AQWJQ7AmKF48GLEHdxdxL
 WYS1vlpMeFShxIP1uBG2JwcNJ/clnTOJw4CcQ7+4YZphepi4SGqtCaeDeLclMjvRjAXw
 I0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=zeBdGQi7aQ2RzZ5oYC/vR5oem1skz7Qr9Eoewd69/U0=;
 b=e6eCPDB4LpEhuAuw6txZKGDpPjnLiYdVr79njkt9Y/9p75Ha+meoEn+yXmZQlW07qv
 IqO6evv4oPeovYzo3ctc+xjBdu6TyH9I6vgvx6r6F/cX7N1iuAt6xZpaOx/0kZ5xFExv
 0v1x5mxLsTEAI5EhjpUQqvUqAdXQIr+MD41Dpq0a9nWjNsmOv38xiLfnMeEAAQLdM1BI
 u3G13Du4mxavZIAj4ih3oVsxyyIx54SIcr0q8Qy0h7naSZGBUE0DCrhuLecnSglOc9iZ
 xScCOK7y3PpSvAT3uJ0kyqKiju0L/5uYAFZQ7brk6tPFN+ZKuj/7y1AFEG86F7etKv8r
 yFfQ==
X-Gm-Message-State: AOAM5319mlKz3F8AxjCTJYTcPajHYCMEumbRn/cd1VrBNaItFKTKncXo
 vX1Oa2IZoQG2uQmH/uagwrnRtQsEJzeW
X-Google-Smtp-Source: ABdhPJw7TIM5HCPYLlaI5fQSrFU+itpyEW1viJIZMc/uUz1qwlLjP7916UEQrhWQ+oPDWZ9PvierfZBvcJXv
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a0c:f4d0:: with SMTP id
 o16mr2778113qvm.45.1606829191708; Tue, 01 Dec 2020 05:26:31 -0800 (PST)
Date: Tue,  1 Dec 2020 21:26:09 +0800
In-Reply-To: <20201201132614.1691352-1-tzungbi@google.com>
Message-Id: <20201201132614.1691352-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20201201132614.1691352-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [RESEND PATCH 1/6] ASoC: mediatek: mt8192: rename common symbols
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tzungbi@google.com
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

Renames common symbols from "mt8192_mt6359_rt1015_rt5682" to
"mt8192_mt6359".

They will share between a few machine drivers on MT8192 and MT6359
with some different audio components.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 28 +++++++++----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index b7f42a530d06..253c028c1630 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -631,7 +631,7 @@ SND_SOC_DAILINK_DEFS(tdm,
 		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
-static struct snd_soc_dai_link mt8192_mt6359_rt1015_rt5682_dai_links[] = {
+static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 	/* Front End DAI links */
 	{
 		.name = "Playback_1",
@@ -986,8 +986,8 @@ static struct snd_soc_codec_conf rt1015_amp_conf[] = {
 static struct snd_soc_card mt8192_mt6359_rt1015_rt5682_soc_card = {
 	.name = "mt8192_mt6359_rt1015_rt5682",
 	.owner = THIS_MODULE,
-	.dai_link = mt8192_mt6359_rt1015_rt5682_dai_links,
-	.num_links = ARRAY_SIZE(mt8192_mt6359_rt1015_rt5682_dai_links),
+	.dai_link = mt8192_mt6359_dai_links,
+	.num_links = ARRAY_SIZE(mt8192_mt6359_dai_links),
 	.controls = mt8192_mt6359_rt1015_rt5682_controls,
 	.num_controls = ARRAY_SIZE(mt8192_mt6359_rt1015_rt5682_controls),
 	.dapm_widgets = mt8192_mt6359_rt1015_rt5682_widgets,
@@ -998,7 +998,7 @@ static struct snd_soc_card mt8192_mt6359_rt1015_rt5682_soc_card = {
 	.num_configs = ARRAY_SIZE(rt1015_amp_conf),
 };
 
-static int mt8192_mt6359_rt1015_rt5682_dev_probe(struct platform_device *pdev)
+static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = &mt8192_mt6359_rt1015_rt5682_soc_card;
 	struct device_node *platform_node;
@@ -1029,32 +1029,32 @@ static int mt8192_mt6359_rt1015_rt5682_dev_probe(struct platform_device *pdev)
 }
 
 #ifdef CONFIG_OF
-static const struct of_device_id mt8192_mt6359_rt1015_rt5682_dt_match[] = {
+static const struct of_device_id mt8192_mt6359_dt_match[] = {
 	{.compatible = "mediatek,mt8192_mt6359_rt1015_rt5682",},
 	{}
 };
 #endif
 
-static const struct dev_pm_ops mt8192_mt6359_rt1015_rt5682_pm_ops = {
+static const struct dev_pm_ops mt8192_mt6359_pm_ops = {
 	.poweroff = snd_soc_poweroff,
 	.restore = snd_soc_resume,
 };
 
-static struct platform_driver mt8192_mt6359_rt1015_rt5682_driver = {
+static struct platform_driver mt8192_mt6359_driver = {
 	.driver = {
-		.name = "mt8192_mt6359_rt1015_rt5682",
+		.name = "mt8192_mt6359",
 #ifdef CONFIG_OF
-		.of_match_table = mt8192_mt6359_rt1015_rt5682_dt_match,
+		.of_match_table = mt8192_mt6359_dt_match,
 #endif
-		.pm = &mt8192_mt6359_rt1015_rt5682_pm_ops,
+		.pm = &mt8192_mt6359_pm_ops,
 	},
-	.probe = mt8192_mt6359_rt1015_rt5682_dev_probe,
+	.probe = mt8192_mt6359_dev_probe,
 };
 
-module_platform_driver(mt8192_mt6359_rt1015_rt5682_driver);
+module_platform_driver(mt8192_mt6359_driver);
 
 /* Module information */
-MODULE_DESCRIPTION("MT8192-MT6359-RT1015-RT5682 ALSA SoC machine driver");
+MODULE_DESCRIPTION("MT8192-MT6359 ALSA SoC machine driver");
 MODULE_AUTHOR("Jiaxin Yu <jiaxin.yu@mediatek.com>");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("mt8192_mt6359_rt1015_rt5682 soc card");
+MODULE_ALIAS("mt8192_mt6359 soc card");
-- 
2.29.2.454.gaff20da3a2-goog

