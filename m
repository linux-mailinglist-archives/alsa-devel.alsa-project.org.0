Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 729472FFFD0
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 11:10:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC9DB1AFA;
	Fri, 22 Jan 2021 11:09:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC9DB1AFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611310240;
	bh=JSrcH25uU6k+4IdJ0WxUZZ9HydDPuRmuHb50hFIQ3pc=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tP6cj4vi+wsNlceskHU6LWDBlwf+IO7QOrqDDM7Kp7ZYMaK75AtIBE6EEqbmvObI+
	 18t9Z3q3mnXgSyMzKsJjdzc0OM7+1cbbBRJ9TgHP9UgEuO1ZEW17/lESseCqGsFu8X
	 kRGwz+4GTwBHH2sIjCpMtifqPQgXVJhk9CrE3ssw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1D66F804D6;
	Fri, 22 Jan 2021 11:08:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C65DBF804DF; Fri, 22 Jan 2021 11:08:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7ED1CF80218
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 11:08:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7ED1CF80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="gQb84yUJ"
Received: by mail-qt1-x84a.google.com with SMTP id d26so3246660qto.7
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 02:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=mpdOlUQG7HCH3v6aSqXckNjDcNbTAl3Fz0V1ytYnX38=;
 b=gQb84yUJnfXmWVFSvExrzLPdjHMQZfJHtT0Zx438VwFU3iQcpiZOAQPjtoLLFY0B6o
 Sjnpe+HYiFFxYbKFYbd+GOQTlVPSN3CVhLnDjJ/fJ0vjY80R2dvLEd+NEAXdbEyxbf9d
 mZ6RFRiCX7iYFhi02ItKuYpQufoj+uth6VoAw2Q40HPEoRbsOaknXFCNf73FfzqfBm2W
 tRIivHTQ6NbbgoP4OQdbS6yoN1jKCi3sjiYagNcNfTMwX9TWEi666G6sZpbyGHzTRkRd
 vxpjo9DwX7YmzdUCESBGWqSzVzsUbmHQo7WGrlZrCRoYCr+mWnRBZGf7R5i7/YZtDakp
 /w7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=mpdOlUQG7HCH3v6aSqXckNjDcNbTAl3Fz0V1ytYnX38=;
 b=VsgbKcVO59nqENXBNy7bVWacjwj5Dh/opRplX440RFT3fS7aT8I98n82L+s8Ch1hbr
 mR5rsjJKecP2KRDY4XruT1ZujZf59rZliulJ9aGGKIRicaAF8yvsWq5h+Nf2iAah7c1m
 58fXolUpoJpRzNi1s5pVH2NPR6wnIAzECUKcESx6qhc7jJA+7qOvHzxAvnM5+Ezsi/Z4
 E91p+z42iIGJ9aHXzjK6Iw01+7s4xK4hfl3JEzv7RAQra7CkMGn3ZrjJyDijd2E2Aqdx
 N3oOGrb5QZhCJHAADbQaBotBTvsXZolbKMLe4NJRE1RoO2YVqvIxKkahXywJalB14JPN
 cKXg==
X-Gm-Message-State: AOAM533UhJwZvlq6gKE9AJ9IqlNnvHQ3xoX8kRrSXiwaa1L/eTpGjgAb
 hqAlTdIyfvFlePLRC0o9QkwGyqTH/G+x
X-Google-Smtp-Source: ABdhPJz5Bia5WknNGmpRpRe3GnYpkvei+Ebh1fW3g09SQRzznPNAgPoy6OstoeS2SLsCG1xPiizbh7hdtSxZ
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:4552:5bc1:d50a:b3ff])
 (user=tzungbi job=sendgmr) by 2002:ad4:4108:: with SMTP id
 i8mr3512825qvp.49.1611310081790; Fri, 22 Jan 2021 02:08:01 -0800 (PST)
Date: Fri, 22 Jan 2021 18:07:41 +0800
In-Reply-To: <20210122100742.3699128-1-tzungbi@google.com>
Message-Id: <20210122100742.3699128-4-tzungbi@google.com>
Mime-Version: 1.0
References: <20210122100742.3699128-1-tzungbi@google.com>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH 3/4] ASoC: mediatek: mt8192-mt6359: simply ops for Capture1
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

1. Uses rtd->dev to get the device.
2. Generalizes the variable name.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 20 ++++++++-----------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index f5c1c10408c9..f4b09672af8f 100644
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
 
 /* FE */
@@ -720,7 +716,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
 		.dpcm_capture = 1,
-		.ops = &mt8192_mt6359_rt1015_rt5682_capture1_ops,
+		.ops = &mt8192_mt6359_capture1_ops,
 		SND_SOC_DAILINK_REG(capture1),
 	},
 	{
-- 
2.30.0.280.ga3ce27912f-goog

