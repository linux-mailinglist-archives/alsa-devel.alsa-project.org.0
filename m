Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CA930D220
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Feb 2021 04:24:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C28921741;
	Wed,  3 Feb 2021 04:23:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C28921741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612322641;
	bh=17oODYzlq8I/zUoUfh9MoZHpUzQfqXQTChy3SsiQ9wc=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Uz2jP7uHNqGhQjJ39a4l+A5CX2WKNckxsZ0lNcMb0LUkB/iGsDHfu8fVwurtTtOce
	 1+t2ygW/xk1VSFm0Lb7AqX4U1D1wcFYEVuMK12H9eKWfWTddTgY81i0Uj7j/If6T9t
	 FFHBhXts6R59lz91lkqFJ/2kinUV1mTXKgFsS+RE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A79BF8023A;
	Wed,  3 Feb 2021 04:22:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49EDBF8023A; Wed,  3 Feb 2021 04:22:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com
 [IPv6:2607:f8b0:4864:20::f49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1A17F80156
 for <alsa-devel@alsa-project.org>; Wed,  3 Feb 2021 04:22:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1A17F80156
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="cJ6T3gbU"
Received: by mail-qv1-xf49.google.com with SMTP id ew14so16651252qvb.21
 for <alsa-devel@alsa-project.org>; Tue, 02 Feb 2021 19:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=qfger17i24S9J1Qv4GPO/hsXEdqSKK2LFoE3W97GT80=;
 b=cJ6T3gbUA4kluvu/+MOPr92jD+9tBSLxn46hZhfaclcNlA1b00qEAyRdNDCr7+Ou3s
 uavwGTSJPE6zJAaARxiz3NQg0FtY1NBIVaqINIJ8RzCBnMNvhTfi6HqNgK9l4piiQ0Wh
 1TVimS4cfxkleRNXIMlIdmomFhGIo/SFk7G9lYQ3ezvZON6cjfNQkv4aKDziGNJNb7vZ
 +s5X0G4DF983XBRlYNz+FY7sVaQoQKRg78VXZXUPMqnHkJ+EnA0ZU5p+Uhjg2fDP34Xe
 1d/DymZdQzJ0qxTCrNHg0Q0STBgk5yJRGocqocvIRyy0MmU8gz6BpzAs4/NGcCt9tTgM
 Aajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=qfger17i24S9J1Qv4GPO/hsXEdqSKK2LFoE3W97GT80=;
 b=c224xV0wksJ7fiBcJy8W41qlJzNWlPVzpku99m+HzPER+0pgf33cfkuWfdIUmOak80
 xUmiuOAOG3AMsAEi/4VJ+4C+LXSurZ0hK9sEFkTWsag6KfuFVmPnxLEOO/YijLNZL5nN
 bJU8pz1enW/ZIdnyVmIGShX88j90h8Vfk/u9oXf1h6Fm4lqRmBmMTCU4cN9sf9lMYyKH
 08Rn/Py2LJy9beMrGXzxmnou8SFqoZJG1tGYrEJPJbC5tjhvHSY5jt37RKEHk7SjW349
 vOR4cKVkBLeQHmVDfT1YngnvNcaXW0A/Y/Y39tuprtcc/msX2jdmyCxIChJmS2QRQ6b3
 Zq9A==
X-Gm-Message-State: AOAM5328zfrVEVoNRkdZPsPFGUtzaxGw5YE2rDWR1oF0Q3+rXl2O/zYS
 5/elqz7SfPq8S08w+VjOriKPyfxQOlB0
X-Google-Smtp-Source: ABdhPJyIkHXFLh6VM2GQSqGoytETeu5FtJrZf0hrkPL2VKJ/phtXq54v54IZGTnC91h1Jr767Yi4yn281ucM
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:dc88:dd2b:a03:4076])
 (user=tzungbi job=sendgmr) by 2002:a0c:f986:: with SMTP id
 t6mr1184475qvn.15.1612322531664; Tue, 02 Feb 2021 19:22:11 -0800 (PST)
Date: Wed,  3 Feb 2021 11:21:59 +0800
In-Reply-To: <20210203032201.2882158-1-tzungbi@google.com>
Message-Id: <20210203032201.2882158-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20210203032201.2882158-1-tzungbi@google.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v3 1/3] ASoC: mediatek: mt8192-mt6359: use
 asoc_substream_to_rtd()
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

Uses asoc_substream_to_rtd() helper.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index c368236d8a3a..d2ebf3b6e359 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -39,7 +39,7 @@ struct mt8192_mt6359_priv {
 static int mt8192_rt1015_i2s_hw_params(struct snd_pcm_substream *substream,
 				       struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai;
@@ -74,7 +74,7 @@ static int mt8192_rt1015_i2s_hw_params(struct snd_pcm_substream *substream,
 static int mt8192_rt5682_i2s_hw_params(struct snd_pcm_substream *substream,
 				       struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
@@ -362,7 +362,7 @@ static int mt8192_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 static int
 mt8192_mt6359_rt1015_rt5682_cap1_startup(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_component *component =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
-- 
2.30.0.365.g02bc693789-goog

