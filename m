Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA2F925FF8
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2024 14:16:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14140DF8;
	Wed,  3 Jul 2024 14:16:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14140DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720008985;
	bh=ocz/1r0t2NeXjhVsBlqlh8PIa6EhEItAnc8FRU38Kqk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UaqAPKC904G93DoT8t4zvpnKN0E35LvzWInoG4aIsPFvMFS3g1UUHY2drRLBimOwO
	 bJ1+6VMrBSRdDm/K4I/lqTEI5BUt4YqBdalRbZqcuUFFQ0odMQ+Vx0Ith1ht8xkcnk
	 yHPna7ct3lOEMTlIbB0ENi6IXmJwwqbs486zbrxA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9624FF806B9; Wed,  3 Jul 2024 14:14:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61CE8F806B9;
	Wed,  3 Jul 2024 14:14:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2CBEF8025E; Wed,  3 Jul 2024 14:11:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 26FECF80588
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 14:11:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26FECF80588
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=M+gM1rTV
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52cecba8d11so6446898e87.1
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jul 2024 05:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720008685; x=1720613485;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dztGUki9Ak6jIf4+9h9y7V5UCrSXr1J8tuwOdQ2U8CA=;
        b=M+gM1rTVkDMCOV6CvNZTnAFJogyuL3KFI/jRM3+RBzy2WvXRGbE6FxeQWul+XZThx3
         V7nzQhh1YE6Pw248zB/JL+Bu065xQ+QITXOHMSGQcmcmw+iwUz0Gm6gb1G8yKhVtL8pU
         J5Dw1wJ/Mj9cigT6SwcbkyQSHGg/ufMU4Ytk4ihVWX4pGcl3V21VwY8Wy/Xxvzcf0PM9
         xdIrOnxT22tsLw1NutwnFdqiRdqDPIAGQgQHyVbBAm3NKlCT+8fcl4HO6ixTsh++8/3U
         ySZn6LaK7vmoZg+DFlZfYyPHl+FWAt99k5KlmMpkmmDwtwdka1wOBlxEFQPFSdGfoEIO
         +JnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720008685; x=1720613485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dztGUki9Ak6jIf4+9h9y7V5UCrSXr1J8tuwOdQ2U8CA=;
        b=qZ6/EZETTlWKQF2M4XWVSy62VEdsMqvmPzgIIiZCldJgyZe7hZ7k0g8tw9iO/aVsFI
         866PLTLaFwq6FhEULxuNBB/8Vemo/0iHrXoXfqfBeMfuOPtZ7X23+OVKtv2gKm7Aq6g/
         PIIwGH8UWzwMj63IWOWSki/wMs2rKJMcGxGg8Xr4HFNq9uE8qDxD0ZJ3F0e8lyepeN0N
         Q3BCBFiyNs3XzfBL/sBhJj8HZN+k2Ka6nKB84IG9ouVNI92RJPit54ctXFyhlWfnAohX
         bJJqXK4BK44AN5Hf/1xrim/XbMgEf8udk+wTKT4r2M0w1EoSbFJIPqnn+A6urKjPZhGA
         jc+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhE3kCvQrlwh1d8Yfdxh6d8lNduHzzbKh7LVijyktxmGKfaLpNvuefINgaspTVjNZqRALAz9/hlmlKqU8kK4HZrToBIQCjGFi0A2w=
X-Gm-Message-State: AOJu0YxPjMuzf1/7aZwzdSexpnKjyuH2+z2t36IKKukX4nUSMq2Ma/q0
	2k7qfZTLRZRSgl1zhd9ts9IQFqqyEJcMBfTPZl5gOluLCwVgknTWXMLaORJ23sA=
X-Google-Smtp-Source: 
 AGHT+IGNlkQo2U/mD/9Q0gW4rGoUl/Mk1IXpMr281TpcdB+aTLXI1fJpFBZHFvhjmGczWXJCD0A4og==
X-Received: by 2002:a05:6512:3a83:b0:52c:dcea:86e2 with SMTP id
 2adb3069b0e04-52e82646dd4mr9034143e87.1.1720008684737;
        Wed, 03 Jul 2024 05:11:24 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a10307bsm15716222f8f.94.2024.07.03.05.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 05:11:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Jul 2024 14:11:05 +0200
Subject: [PATCH 11/11] ASoC: dapm: Simplify
 snd_soc_dai_link_event_pre_pmu() with cleanup.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-asoc-cleanup-h-v1-11-71219dfd0aef@linaro.org>
References: <20240703-asoc-cleanup-h-v1-0-71219dfd0aef@linaro.org>
In-Reply-To: <20240703-asoc-cleanup-h-v1-0-71219dfd0aef@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3431;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ocz/1r0t2NeXjhVsBlqlh8PIa6EhEItAnc8FRU38Kqk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmhT/bjwP82Ll7/Nq3E6/J1YP7S7FSG2p3Rdr/N
 yTrQYiInu+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoU/2wAKCRDBN2bmhouD
 1zcRD/94Lda9sMm0G7QiNx3/BCP8Knn4BEHAJ/1nV+02XXqBJHOiIM3wg/uwJtiTzlQntM24Zat
 3teyDWqFA5YYeSe/86lkREkefYyFQ6nWFGq9QH4Q32fVGpdhJb2gwSRGtvwO4zoLGQIBwsOa83U
 xJy5HJyg4qpx2OHbyncoymS4fSR2mtmnymx9SHl95mAExMKX2g4M55KsGv6fYXnHoZ9EcY+KJVd
 OG1OKvBm8oBBmlpa+gReQhOEqfYNtGZey3+gwHPah/Nsn4sojeFzQ0rRgwejELXxNPiHICokR87
 gSiA0O6A8jGF6Vy8AdzcFbJEFyxOOXIHMnVXT2x4TaDEGdG9VZzEP9ZPnPg9dAsLjQEbwnGBKxk
 6VdqN3VG25DGsYpM5Rmj6G4CSJ10qj1wkgeC41xYHTuPKr+2IpEbU03h7Q4+B4aR88dL+VYmFC0
 zRFI0B4nNnyDI+Ea4V5itvg1aIb5HVy4IQbRHTeKQ/iLMrwanzWCn1yZsRBLGPswwxqUdBHX3cK
 xBIceH3GYOF/+WCN62NKbu5J/JxkH2Bn19S22rIajO2ZZAbBjFMeqhRRUon0YI3GqXO0CreBtwl
 th5pGtju3/Yx8jL8jEVmDKS++OBMCrMPOtjZeo9ypw2ddzgy9EKDqolk6u3XB3b3LScGGh9xZDV
 4125OyJ7qHqKw0w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: MH7YNEPAIWICYVHZZZFXPKZJDIFUAWFD
X-Message-ID-Hash: MH7YNEPAIWICYVHZZZFXPKZJDIFUAWFD
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MH7YNEPAIWICYVHZZZFXPKZJDIFUAWFD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Allocate the memory with scoped/cleanup.h in
snd_soc_dai_link_event_pre_pmu() to reduce error handling (less error
paths) and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/soc-dapm.c | 32 ++++++++++++--------------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 236aa3c8eea1..fa6f19d26c78 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3882,11 +3882,10 @@ snd_soc_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
 	struct snd_soc_dapm_path *path;
 	struct snd_soc_dai *source, *sink;
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_pcm_hw_params *params = NULL;
 	const struct snd_soc_pcm_stream *config = NULL;
 	struct snd_pcm_runtime *runtime = NULL;
 	unsigned int fmt;
-	int ret = 0;
+	int ret;
 
 	/*
 	 * NOTE
@@ -3897,15 +3896,14 @@ snd_soc_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
 	 * stuff that increases stack usage.
 	 * So, we use kzalloc()/kfree() for params in this function.
 	 */
-	params = kzalloc(sizeof(*params), GFP_KERNEL);
+	struct snd_pcm_hw_params *params __free(kfree) = kzalloc(sizeof(*params),
+								 GFP_KERNEL);
 	if (!params)
 		return -ENOMEM;
 
 	runtime = kzalloc(sizeof(*runtime), GFP_KERNEL);
-	if (!runtime) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!runtime)
+		return -ENOMEM;
 
 	substream->runtime = runtime;
 
@@ -3915,7 +3913,7 @@ snd_soc_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
 
 		ret = snd_soc_dai_startup(source, substream);
 		if (ret < 0)
-			goto out;
+			return ret;
 
 		snd_soc_dai_activate(source, substream->stream);
 	}
@@ -3926,7 +3924,7 @@ snd_soc_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
 
 		ret = snd_soc_dai_startup(sink, substream);
 		if (ret < 0)
-			goto out;
+			return ret;
 
 		snd_soc_dai_activate(sink, substream->stream);
 	}
@@ -3941,16 +3939,14 @@ snd_soc_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
 	config = rtd->dai_link->c2c_params + rtd->c2c_params_select;
 	if (!config) {
 		dev_err(w->dapm->dev, "ASoC: link config missing\n");
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	/* Be a little careful as we don't want to overflow the mask array */
 	if (!config->formats) {
 		dev_warn(w->dapm->dev, "ASoC: Invalid format was specified\n");
 
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	fmt = ffs(config->formats) - 1;
@@ -3971,7 +3967,7 @@ snd_soc_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
 
 		ret = snd_soc_dai_hw_params(source, substream, params);
 		if (ret < 0)
-			goto out;
+			return ret;
 
 		dapm_update_dai_unlocked(substream, params, source);
 	}
@@ -3982,7 +3978,7 @@ snd_soc_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
 
 		ret = snd_soc_dai_hw_params(sink, substream, params);
 		if (ret < 0)
-			goto out;
+			return ret;
 
 		dapm_update_dai_unlocked(substream, params, sink);
 	}
@@ -3992,11 +3988,7 @@ snd_soc_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
 	runtime->channels = params_channels(params);
 	runtime->rate = params_rate(params);
 
-out:
-	/* see above NOTE */
-	kfree(params);
-
-	return ret;
+	return 0;
 }
 
 static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,

-- 
2.43.0

