Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D94D22FFFD2
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 11:11:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6685A1927;
	Fri, 22 Jan 2021 11:10:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6685A1927
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611310277;
	bh=LUKqp8zqxEUdgBwtwNKAn/i6W9Y5KlxQ8UolIAMkn5Q=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hUSCJlNGFypE+IHGUADIB7IO1bB1bBu9W1LcABWSKEuA+fOMSoj3LrC6YLUfj7Xnn
	 /uWxUvy2fc4FfUZLwu8gOvbgrJsxDoALrSf7IDuHQj/ZUdSs+0S/HJlHzUpBnKIfOR
	 srUINCJQDuj8XzNUPdo1Kb+kaZQREFS93jVVn7yI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C48BCF804E5;
	Fri, 22 Jan 2021 11:08:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95CD6F804E3; Fri, 22 Jan 2021 11:08:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6234F804D6
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 11:08:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6234F804D6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="EtDTq9s2"
Received: by mail-qk1-x749.google.com with SMTP id i82so3656813qke.19
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 02:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=VT8zktz3TEuCCmQwwCyPljrpKbHnT0KhRcyC9M4v2Tk=;
 b=EtDTq9s2q602ngX2RA2foe1xZBNf3l1Y5VikPZ/qc430h0+pFqC8VaR0DMZhqQvG5D
 ojpuL7MzZCOEOJUtXW5fdwFQBSkmSry8Stop5R7jjLxKZeqUkbzThULAAT63lz5QV5qK
 wZCvrJPFDLcJClUOg/l5JUdLFgqh5YVAXRoln1v6IwpYrZJ2My87e6ACe2ZOjGk84u8D
 KBE79NCuAXJHGMdLvQG+ar2LpRf+NHPZs56D5Wj1e0DflI4F4AJn+zmlklvT2KNd9vsi
 vxPYjtD1XtKHordn8Tvh66aZzplrHsjgXZktDRz6Lg6UgsUeBWxTC0PWlss+rr+SjuV8
 hAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=VT8zktz3TEuCCmQwwCyPljrpKbHnT0KhRcyC9M4v2Tk=;
 b=IIzwpX8A597Wu1k0h7RACP93LqWCXbT5cQNoB5RnpGw5+D/mxiWgBEw9hQ+J3c2WjQ
 i2CxQQhrZex7z055VaE2CQJrmjhYfmHOvdg8UpoWPjnCjw78n0+SSfIQb4XHnugKjrQX
 i7lS4kM27BayYBf9nBzQlK+XatFX5eBdBntpz/rqh5PLWLHgIMXUygIeZuDnPJd+Ygk2
 WYztYo3pp5wxRv+4lurC9Ta4CW0LU3th7EU8Izi3FPpqD8J1q8X2MTwQa9IQEsRN+MVV
 H1pGArtDgyk3mJn/Lj3BCStB2cOkSFdY6SR69ozelMjxb24BVXkPnQg2vXNaHNdCRo7B
 WOHA==
X-Gm-Message-State: AOAM530YOS5KMVQru3tGHZHhm1PF9s4jUir8doQPbViyfH7bRgkvghSi
 HnqiFd9RaOhuIAunDKqZ6RTR1sFSJQP9
X-Google-Smtp-Source: ABdhPJwwQ0e+ZbLtxylzuXJVDTJwTtYcukwPhfStqB4s/8MdP+MmRFcXgVQzCRyk6uxUbG8eyRPMwACV0q6l
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:4552:5bc1:d50a:b3ff])
 (user=tzungbi job=sendgmr) by 2002:ad4:4e8a:: with SMTP id
 dy10mr3719151qvb.14.1611310085892; Fri, 22 Jan 2021 02:08:05 -0800 (PST)
Date: Fri, 22 Jan 2021 18:07:42 +0800
In-Reply-To: <20210122100742.3699128-1-tzungbi@google.com>
Message-Id: <20210122100742.3699128-5-tzungbi@google.com>
Mime-Version: 1.0
References: <20210122100742.3699128-1-tzungbi@google.com>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH 4/4] ASoC: mediatek: mt8192-mt6359: add format constraints for
 RT5682
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

There is only 1 set of I2S in between MT8192 and RT5682.  Adds format
constraints to the corresponding DAI links to make sure the settings
are symmetric.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index f4b09672af8f..a606133951b7 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -406,6 +406,53 @@ static const struct snd_soc_ops mt8192_mt6359_capture1_ops = {
 	.startup = mt8192_mt6359_cap1_startup,
 };
 
+static int
+mt8192_mt6359_rt5682_startup(struct snd_pcm_substream *substream)
+{
+	static const unsigned int channels[] = {
+		1, 2
+	};
+	static const struct snd_pcm_hw_constraint_list constraints_channels = {
+		.count = ARRAY_SIZE(channels),
+		.list = channels,
+		.mask = 0,
+	};
+	static const unsigned int rates[] = {
+		48000
+	};
+	static const struct snd_pcm_hw_constraint_list constraints_rates = {
+		.count = ARRAY_SIZE(rates),
+		.list  = rates,
+		.mask = 0,
+	};
+
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	int ret;
+
+	ret = snd_pcm_hw_constraint_list(runtime, 0,
+					 SNDRV_PCM_HW_PARAM_CHANNELS,
+					 &constraints_channels);
+	if (ret < 0) {
+		dev_err(rtd->dev, "hw_constraint_list channels failed\n");
+		return ret;
+	}
+
+	ret = snd_pcm_hw_constraint_list(runtime, 0,
+					 SNDRV_PCM_HW_PARAM_RATE,
+					 &constraints_rates);
+	if (ret < 0) {
+		dev_err(rtd->dev, "hw_constraint_list rate failed\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_ops mt8192_mt6359_rt5682_ops = {
+	.startup = mt8192_mt6359_rt5682_startup,
+};
+
 /* FE */
 SND_SOC_DAILINK_DEFS(playback1,
 		     DAILINK_COMP_ARRAY(COMP_CPU("DL1")),
@@ -653,6 +700,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
 		.dpcm_playback = 1,
+		.ops = &mt8192_mt6359_rt5682_ops,
 		SND_SOC_DAILINK_REG(playback3),
 	},
 	{
@@ -726,6 +774,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
 		.dpcm_capture = 1,
+		.ops = &mt8192_mt6359_rt5682_ops,
 		SND_SOC_DAILINK_REG(capture2),
 	},
 	{
-- 
2.30.0.280.ga3ce27912f-goog

