Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4C52CA3D4
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Dec 2020 14:29:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5391217AA;
	Tue,  1 Dec 2020 14:28:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5391217AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606829342;
	bh=u6Jwv0VMLtSJJ2xG8u1Yr1VRjB9ITuCbj5wIMxgNsbU=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WjwaTeVSwsFZ3agC5lLz9CJPvJPyVHIJJjQdv2HnFjxW1IW41/UWBt+2LwbQkvAmu
	 r3shZI4dGENlI6PvBpVBJA77KePqBnrDgSw8oWOawgjVbS/RSzE+tD2wiOxI8hnSB6
	 FjKc2ISR8mJPF2A7qn0GqH23ATtjFcaxiaXFCm3M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AD69F804CC;
	Tue,  1 Dec 2020 14:26:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52C6CF804CB; Tue,  1 Dec 2020 14:26:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88293F80168
 for <alsa-devel@alsa-project.org>; Tue,  1 Dec 2020 14:26:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88293F80168
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="r6Z9Qdqi"
Received: by mail-yb1-xb4a.google.com with SMTP id r4so2395373ybs.1
 for <alsa-devel@alsa-project.org>; Tue, 01 Dec 2020 05:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=xpmr0QppfKaZgs1QfZTCXWDbMOfoG2eoYaqppx7TWQc=;
 b=r6Z9QdqiHKrH2BBNE9kdnblSzW428RnZuze83cE+mVbwyWpOHxsA5P09JZ7L2GUUVC
 ACVaWCWrCv7+9oSBwwUE8Nm0VRYzvwtyK1UR99JUDaC4SUIzdCdM68JjJUHD8lyvKEx1
 Vzv/hL8bvwrH9VMdjJUMkuWNcSH9LtYEOzVscsRP7L1lJY4X/ftCl2YCWeJVPVg/o/hx
 eeJwP8e7C9FqSB8jVUwJTbmc0vbuqBhSnZGjdwqBrpB6ztsYOde/AMblg/Hzwzh1eMIU
 U3pFx3Ug4x4bmC6SmkicAY45hZ7BJ3FLm4QHtnkFH6bMp2BF0EgVb8qB0Na2JB5xsPSJ
 KEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=xpmr0QppfKaZgs1QfZTCXWDbMOfoG2eoYaqppx7TWQc=;
 b=uWzNTtN+I5hERMraZJLU6E5QhWGhMLTUr9NzVhv4PkHhAejq0427ieWnrBohTH8H2P
 16adq/9TldYqqGOpvOGUUL8EQSXInUK6XG0E3mkCkIXd2MWfimlrP+F3jtjob05RlAfJ
 2YIA9iVBcTh+AxJKqEUFkO5ICc0sNDh5s6QFpiiVUghvvbEVLDActH1BOjNDNERZ0N44
 T/OShObmk3T5SU2YRJO8Cpm5qZQqPXdJo3bCnUvEv/cooccg5OPGSDu8Nt2bK/OdhISV
 6pYE/dpdVVoNl1g9goAyTMo1DGrVLuMWIjTzYxS+xvEwo3eYYtIxUQqeIKNbfGSwoqXI
 AnRA==
X-Gm-Message-State: AOAM531CjRofQ4jNmCc8yW9M3UvPyOw1ztZV7vsenKgdBk9Ih8qKcmI6
 tBo41IzFqmzfsjC6lONSIGSrK+W/XHl3
X-Google-Smtp-Source: ABdhPJzXQvl3KcxrG86zIVoJaYcMhh/XfXutz/bOaV5brDNIpgEdVe6dLzgpGlUSZPp0zI3OYxltaRwpylIW
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a25:bf82:: with SMTP id
 l2mr3503068ybk.1.1606829195340; Tue, 01 Dec 2020 05:26:35 -0800 (PST)
Date: Tue,  1 Dec 2020 21:26:10 +0800
In-Reply-To: <20201201132614.1691352-1-tzungbi@google.com>
Message-Id: <20201201132614.1691352-3-tzungbi@google.com>
Mime-Version: 1.0
References: <20201201132614.1691352-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [RESEND PATCH 2/6] ASoC: mediatek: mt8192: extract rt1015_rt5682
 specific DAI link
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

Extracts rt1015_rt5682 specific DAI link from the common one.  Fills the
DAI link data according to of_match.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 39 +++++++++++++++----
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index 253c028c1630..e841fd32e8cc 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -9,6 +9,7 @@
 
 #include <linux/input.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/pm_runtime.h>
 #include <sound/jack.h>
 #include <sound/pcm_params.h>
@@ -576,7 +577,7 @@ SND_SOC_DAILINK_DEFS(i2s2,
 		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
-SND_SOC_DAILINK_DEFS(i2s3,
+SND_SOC_DAILINK_DEFS(i2s3_rt1015,
 		     DAILINK_COMP_ARRAY(COMP_CPU("I2S3")),
 		     DAILINK_COMP_ARRAY(COMP_CODEC(RT1015_DEV0_NAME,
 						   RT1015_CODEC_DAI),
@@ -894,8 +895,6 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.dpcm_playback = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
-		SND_SOC_DAILINK_REG(i2s3),
-		.ops = &mt8192_rt1015_i2s_ops,
 	},
 	{
 		.name = "I2S5",
@@ -983,7 +982,7 @@ static struct snd_soc_codec_conf rt1015_amp_conf[] = {
 	},
 };
 
-static struct snd_soc_card mt8192_mt6359_rt1015_rt5682_soc_card = {
+static struct snd_soc_card mt8192_mt6359_rt1015_rt5682_card = {
 	.name = "mt8192_mt6359_rt1015_rt5682",
 	.owner = THIS_MODULE,
 	.dai_link = mt8192_mt6359_dai_links,
@@ -1000,12 +999,11 @@ static struct snd_soc_card mt8192_mt6359_rt1015_rt5682_soc_card = {
 
 static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 {
-	struct snd_soc_card *card = &mt8192_mt6359_rt1015_rt5682_soc_card;
+	struct snd_soc_card *card;
 	struct device_node *platform_node;
 	int ret, i;
 	struct snd_soc_dai_link *dai_link;
-
-	card->dev = &pdev->dev;
+	const struct of_device_id *match;
 
 	platform_node = of_parse_phandle(pdev->dev.of_node,
 					 "mediatek,platform", 0);
@@ -1014,7 +1012,29 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	match = of_match_device(pdev->dev.driver->of_match_table, &pdev->dev);
+	if (!match || !match->data)
+		return -EINVAL;
+
+	card = (struct snd_soc_card *)match->data;
+	card->dev = &pdev->dev;
+
 	for_each_card_prelinks(card, i, dai_link) {
+		if (strcmp(dai_link->name, "I2S3") == 0) {
+			if (card == &mt8192_mt6359_rt1015_rt5682_card) {
+				dai_link->ops = &mt8192_rt1015_i2s_ops;
+				dai_link->cpus = i2s3_rt1015_cpus;
+				dai_link->num_cpus =
+					ARRAY_SIZE(i2s3_rt1015_cpus);
+				dai_link->codecs = i2s3_rt1015_codecs;
+				dai_link->num_codecs =
+					ARRAY_SIZE(i2s3_rt1015_codecs);
+				dai_link->platforms = i2s3_rt1015_platforms;
+				dai_link->num_platforms =
+					ARRAY_SIZE(i2s3_rt1015_platforms);
+			}
+		}
+
 		if (!dai_link->platforms->name)
 			dai_link->platforms->of_node = platform_node;
 	}
@@ -1030,7 +1050,10 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 
 #ifdef CONFIG_OF
 static const struct of_device_id mt8192_mt6359_dt_match[] = {
-	{.compatible = "mediatek,mt8192_mt6359_rt1015_rt5682",},
+	{
+		.compatible = "mediatek,mt8192_mt6359_rt1015_rt5682",
+		.data = &mt8192_mt6359_rt1015_rt5682_card,
+	},
 	{}
 };
 #endif
-- 
2.29.2.454.gaff20da3a2-goog

