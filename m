Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C1D30D222
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Feb 2021 04:24:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F407176E;
	Wed,  3 Feb 2021 04:24:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F407176E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612322690;
	bh=4WgTLx9ErT2zHHGmw68QP0r7Rjh6X0NHp5l4lm3X0gk=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D+/ui0HeABWNVtuHl6suOV1i50FV09NN9l0xsJkBKkjSRC81LI6xa3pO88Rd/Ca3p
	 zEjApvqhwV2zSAai0WqEWNeSh4BYCOTQiB1TdBcWkq5gV5i9paiynhjkSugsjHdI/E
	 GSKayE2rHNlcz3X6mEDlL7Cd/9lTS2Zly2MMtWFg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13333F80264;
	Wed,  3 Feb 2021 04:22:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70309F80275; Wed,  3 Feb 2021 04:22:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D544AF80264
 for <alsa-devel@alsa-project.org>; Wed,  3 Feb 2021 04:22:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D544AF80264
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="sMBXOYFT"
Received: by mail-qt1-x84a.google.com with SMTP id f5so15998870qtf.15
 for <alsa-devel@alsa-project.org>; Tue, 02 Feb 2021 19:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=xcrgUrUQo2DvZjID2TAjZHuX8sDLU8yEDiJo6RoM5NU=;
 b=sMBXOYFTaF6AgJ7rAB9ExNvptM66u6TJ5vCvuEuyMN6uaUJn9wrwB14Zxm5y++Lgfe
 z70kjQjrnkSeQTzjEol1EUijVQP462qcsa5z+kuAqaHiE+AS8TGrpU2DmRHPREI9jZh5
 hNzCKqPlq0+RZHkjoP3qIcqtw6EBCmmIWaKLbw2W05e1fvbxJVBB2Bq2cr8sPRIBxRYq
 IZaBGchOywk0NQcfz+YLhQy74xHFNCEG6iASfZPVJ15mhfJFia793eKqTtnU33men0DC
 AKDPFIKBvc/UEFHXRGp9jvZb/l8s3ORjOHcEPoMtK5J1mMhzopMEQAP+JZ6YY+rXNwfo
 WkFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=xcrgUrUQo2DvZjID2TAjZHuX8sDLU8yEDiJo6RoM5NU=;
 b=j54TKtY3ibb9X/FkU6kvpVB+DOwsCTjy+nBxwZCwVpVxcZOhQ9Lp0gbNwwqqd29wnS
 ypjJiHVSiHCiVJmcGGM0hvLReH7tMJFoKfy0fx9+TdyFhMn3OKfGBXdZY3SFr/lL3rl+
 oKJ7CObbzS6MFt2/G8WTYzhoz6/B1w3fTXimI4NYQz9fWT2SjXvG2sNMU8TSqA1Yn0zV
 S6+aWdZrS3cc2+bkgfRyOeyk6GNI5Z9VHNNITBLBguL4Wsz6h5LtMnMn/SxrqYMjwkFm
 b2H7Khc7XN4WlJVsW2v6R38W4Gbb/TH9VK6lVscA6/u9Pglt3XYdhoNSR8nF0QJ2HSxQ
 cJbg==
X-Gm-Message-State: AOAM530ap3eSBBQyte5viUNJDKQlK/FdWjCKhmG4HzNlW+XEBBj68km6
 xRvbY8z3ariD6W1Jcb1XlRDx85AioN4W
X-Google-Smtp-Source: ABdhPJwnPUwuBK/wCcEfIjjaoieFKOC9oUyTJNRx2TXDEr3ESjf1jkDASpl8GFwG09DYTB+ZnmTApOFSr+0b
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:dc88:dd2b:a03:4076])
 (user=tzungbi job=sendgmr) by 2002:a05:6214:443:: with SMTP id
 cc3mr1172561qvb.17.1612322539146; Tue, 02 Feb 2021 19:22:19 -0800 (PST)
Date: Wed,  3 Feb 2021 11:22:01 +0800
In-Reply-To: <20210203032201.2882158-1-tzungbi@google.com>
Message-Id: <20210203032201.2882158-4-tzungbi@google.com>
Mime-Version: 1.0
References: <20210203032201.2882158-1-tzungbi@google.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v3 3/3] ASoC: mediatek: mt8192-mt6359: simplify ops for
 Capture1 DAI link
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

1. Uses rtd->dev to get the device.
2. Generalizes the variable name.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 20 ++++++++-----------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index d2ebf3b6e359..a606133951b7 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -360,14 +360,8 @@ static int mt8192_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 }
 
 static int
-mt8192_mt6359_rt1015_rt5682_cap1_startup(struct snd_pcm_substream *substream)
+mt8192_mt6359_cap1_startup(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_component *component =
-		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
-	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
-	int ret;
-
 	static const unsigned int channels[] = {
 		1, 2, 4
 	};
@@ -385,13 +379,15 @@ mt8192_mt6359_rt1015_rt5682_cap1_startup(struct snd_pcm_substream *substream)
 		.mask = 0,
 	};
 
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
+	int ret;
 
 	ret = snd_pcm_hw_constraint_list(runtime, 0,
 					 SNDRV_PCM_HW_PARAM_CHANNELS,
 					 &constraints_channels);
 	if (ret < 0) {
-		dev_err(afe->dev, "hw_constraint_list channels failed\n");
+		dev_err(rtd->dev, "hw_constraint_list channels failed\n");
 		return ret;
 	}
 
@@ -399,15 +395,15 @@ mt8192_mt6359_rt1015_rt5682_cap1_startup(struct snd_pcm_substream *substream)
 					 SNDRV_PCM_HW_PARAM_RATE,
 					 &constraints_rates);
 	if (ret < 0) {
-		dev_err(afe->dev, "hw_constraint_list rate failed\n");
+		dev_err(rtd->dev, "hw_constraint_list rate failed\n");
 		return ret;
 	}
 
 	return 0;
 }
 
-static const struct snd_soc_ops mt8192_mt6359_rt1015_rt5682_capture1_ops = {
-	.startup = mt8192_mt6359_rt1015_rt5682_cap1_startup,
+static const struct snd_soc_ops mt8192_mt6359_capture1_ops = {
+	.startup = mt8192_mt6359_cap1_startup,
 };
 
 static int
@@ -768,7 +764,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
 		.dpcm_capture = 1,
-		.ops = &mt8192_mt6359_rt1015_rt5682_capture1_ops,
+		.ops = &mt8192_mt6359_capture1_ops,
 		SND_SOC_DAILINK_REG(capture1),
 	},
 	{
-- 
2.30.0.365.g02bc693789-goog

