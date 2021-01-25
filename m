Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DA930221D
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jan 2021 07:22:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30CF3188A;
	Mon, 25 Jan 2021 07:22:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30CF3188A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611555775;
	bh=AuFaUZmR2fag/V5lwIKWZzyCKHi5IIMnrp2d0KKVNcI=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tmgZXQW9bE1r6AIHb/UWwlnlNX35rMOYxAfAYXpXOJzvhvB01ZoO/kPk4lKa177Ol
	 ntW61qvoExTmSJHiuv/csW/OFREKhl7mB9PjDfG8j0BporHWJpK2gCbAk05VyMPZkk
	 SwwJmOl2Wpsp4lU8cSGrbaZDFsXN/JenQmwJ7gWs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71E17F804CC;
	Mon, 25 Jan 2021 07:21:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45B3FF80269; Mon, 25 Jan 2021 07:20:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com
 [IPv6:2607:f8b0:4864:20::f4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3294AF80130
 for <alsa-devel@alsa-project.org>; Mon, 25 Jan 2021 07:20:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3294AF80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="A/FapsVh"
Received: by mail-qv1-xf4a.google.com with SMTP id h1so8527236qvr.7
 for <alsa-devel@alsa-project.org>; Sun, 24 Jan 2021 22:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=qsJTedifcRHswFbHEXuqWZz0QlBXlCEN/jZfm75ZY+g=;
 b=A/FapsVhD3F2orDZSASSmV6KO0ogDqvKldruyAXTGKJ+I0v+npFDaKjp7wYVFoXCd7
 +4JJvnpHlaRvW0t7+5/NssscqjzfxcSDT7+PFDrYOpjIRRs73IDgOBpQ4NOoZiVxZqXn
 2+pzhTHX8pKkSZSZo181ur8vAEKqJuDxdlrw+fmw6ShPoCfskKscZrRyPNZrzYrOO+G2
 7+uEzkjdN/wFXR1nsQsVckLEWPBBcGSo8R476m5NkX0Ttgd3m1LZYaNXbWNWl5/7Wblx
 7O40QJE8pdJLY7SbkJR4GJYVD9ZnniHrHaBgwqnzU+2mTEvIccWD/OuVtXeGiFnwhnRy
 kOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=qsJTedifcRHswFbHEXuqWZz0QlBXlCEN/jZfm75ZY+g=;
 b=r2nrykSgqvxbB5YcY/MAJqp5jnzAQ7HCONypLZbqhpHa3ptZYNW6Bq4cXGxp8chSee
 ZB90hsJzW7tS8hvpYyO6iqt9F5nn7g+X3id+6mEEAxeQdg5RDeR/AVtlz9H1l75qYfco
 LERXoaqmstbg46pmzRYzAHD/fMM9qKpIvkTuQeJhmWogYsctVUITaBCFqSACyo/1jv+b
 DwKSVv860k3ubs566Dw1uKFtte/Ui4zIMRrxAlesXRMO2KWIUbwrBNoq8dLL/gsO7gBK
 78Svg8bhVOBqEywpbyqWRr8T1tavkiYYPK6PnP391Bb3k0ARujUnJ8vRySBaPi9+knct
 BdNg==
X-Gm-Message-State: AOAM533QlaZhz+uFPMgBCuSov2qJXdMOqfuRS6NH9prF2OEGVPmfLT9/
 I4OIj7WDBHadoBOce0z63oTe/CVNWhMK
X-Google-Smtp-Source: ABdhPJw9hd7h4vVPWmorawaVkeodaDT43omKIPrfqJIjyVamioi6Acs+FVxshEdRyVXY1ui+WlNc2IWp+XBE
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:b870:8946:4704:f6a0])
 (user=tzungbi job=sendgmr) by 2002:ad4:4108:: with SMTP id
 i8mr4556446qvp.49.1611555623848; Sun, 24 Jan 2021 22:20:23 -0800 (PST)
Date: Mon, 25 Jan 2021 14:20:03 +0800
In-Reply-To: <20210125062003.1221810-1-tzungbi@google.com>
Message-Id: <20210125062003.1221810-4-tzungbi@google.com>
Mime-Version: 1.0
References: <20210125062003.1221810-1-tzungbi@google.com>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH v2 3/3] ASoC: mediatek: mt8192-mt6359: simply ops for Capture1
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
2.30.0.280.ga3ce27912f-goog

