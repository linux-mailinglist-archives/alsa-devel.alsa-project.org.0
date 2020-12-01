Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E89D62CA3A6
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Dec 2020 14:24:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82C411787;
	Tue,  1 Dec 2020 14:23:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82C411787
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606829048;
	bh=u6Jwv0VMLtSJJ2xG8u1Yr1VRjB9ITuCbj5wIMxgNsbU=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KTQZDRXSKy4di7q7OIJsykLPgBn72lgruqcz3fN3LhysDirWWtmVbC29EY8RcNfIP
	 QS8FuWTUlURiRVG72fwQH5uFP7LtCBCTuKcE2rAQIGj5Dxyn3WP3eeTw0yJv9DC7gY
	 uknd6HQKOVMJi3epl+Oc52ENkI5qo9haFS+OSO8k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 619A9F804C1;
	Tue,  1 Dec 2020 14:21:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1851AF80276; Tue,  1 Dec 2020 14:21:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com
 [IPv6:2607:f8b0:4864:20::f4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4C03F80139
 for <alsa-devel@alsa-project.org>; Tue,  1 Dec 2020 14:21:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4C03F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="QlGVESX+"
Received: by mail-qv1-xf4a.google.com with SMTP id b9so1176249qvj.6
 for <alsa-devel@alsa-project.org>; Tue, 01 Dec 2020 05:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=xpmr0QppfKaZgs1QfZTCXWDbMOfoG2eoYaqppx7TWQc=;
 b=QlGVESX+qYQNa0pQMtQd2eaDYuP/ad037MM/4wheOZVF+0GzCsicIBtgwksQXa0XYe
 /FW50tLsz7AVtEWa+58Om4l03iALUJimmhTCot6oeCSAMlQZrPpS8XM8uEe2Up+Sc5xA
 HkHjrmTDjlVA8xUDQM65mjx+QSEZJBi58cJqmFlEJFFnqfilXomTkyDoFg2+pBgWRqwD
 fZSVCvqhss+sq5wo1rA61kepgQHPypXRiJwVDmtJIJX6HJzOGcDPVR6pwk2J2/4ht91D
 HGVq4f5f1+hKJeSO7GKohdjYWB9tFW40mAnk52HxOLVAny0oCagyiJh9KgDvXVDRPjhP
 /p9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=xpmr0QppfKaZgs1QfZTCXWDbMOfoG2eoYaqppx7TWQc=;
 b=pApxWjktT0GaCqcyqsgfsa13rn1Xnt3pMjygUvFT+zY3TlkFHV1PZXlG8UsLQyoknk
 FcWy8PGeTuJY0NtdN+QGJPu6ykAhiB8hvbLcFlpUL6XNmMn+nFefh/uz+i4SpW9w64rk
 UCqtWf1U/gxYTBU90F9dGJcbsXEUkKjdWYUZRZEFDwEMiWrQmy++CXXBRMmDJpSm2JFx
 hfLQAQC1oZEdrps7LG39NtWJ2umDeTujZKlW/jc+X/I+B0fqeNGjFp4t5KxyOzurNTvq
 t5/W5tjPLF42vMzLG4SfI3+BZG8JOh5XZCYdoHWSJanNq/o3C7Y5/p0j3yFAAcaGZ2t/
 psZQ==
X-Gm-Message-State: AOAM5333kmLtUH+4F/KO9TNd8A9np+mvcRW1tcYrWbnZuNNzeTULbf97
 bZeIvhyV1BB8i2oPSZ2+Q4dRFKB5SGyH
X-Google-Smtp-Source: ABdhPJy9OO62JBJqPaFmowVhefh1a5nBvzc5ThO8dkuzseOMIJlNj0ESnJ3WMN0qxWsCAZC0L08xpn7dTDO0
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a0c:8b99:: with SMTP id
 r25mr2758559qva.0.1606828904011; Tue, 01 Dec 2020 05:21:44 -0800 (PST)
Date: Tue,  1 Dec 2020 21:21:22 +0800
In-Reply-To: <20201201132126.1676005-1-tzungbi@google.com>
Message-Id: <20201201132126.1676005-3-tzungbi@google.com>
Mime-Version: 1.0
References: <20201201132126.1676005-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH 2/6] ASoC: mediatek: mt8192: extract rt1015_rt5682 specific
 DAI link
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

