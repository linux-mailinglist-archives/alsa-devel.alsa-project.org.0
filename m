Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 954FE8AB141
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Apr 2024 17:03:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0ED8114E5;
	Fri, 19 Apr 2024 17:03:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0ED8114E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713539014;
	bh=bPISGBwHKS65Ig8Nwyh0u0FEtW0ODA1tiQEsn9m1a78=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j6YQ2mRK4QSsLNfi/FfAcqXaBKn3CYBec6uIUIGXfqoRKNmCvTNEGImeHtBSwbawt
	 z9z+cwGq67tlkxZ+I7O525164PCS83KXinRUE5+LFfglYfzmAkxQUYCVPNw/qca9Gm
	 PzhZfTISkij5DHgWYG4p00A8LIXTDmh9X5ME2U8Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB964F80619; Fri, 19 Apr 2024 17:02:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC423F80604;
	Fri, 19 Apr 2024 17:02:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56E6FF805C2; Fri, 19 Apr 2024 17:02:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0635F801C0
	for <alsa-devel@alsa-project.org>; Fri, 19 Apr 2024 17:01:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0635F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=x48LWHGK
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2db17e8767cso30252631fa.3
        for <alsa-devel@alsa-project.org>;
 Fri, 19 Apr 2024 08:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713538913; x=1714143713;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKK2lHWVNTM0FrAdLX6Qzm6HKxic16xHNY/tlXN6dfw=;
        b=x48LWHGKLsac272x5hPR2K9yAWCkMXPlBBq4cI6GvlgjPeQ3gTvCpn1PWPOPmw8JAZ
         188vPlCRugXibcy7qjJSm0v3cD+W+H3IP7XNw54jZRkSLPidKQ6UXespuaQfvq+D/P4/
         WkgqdX44Ub2ClKvqcN66+cDiHPZpa8pci8ABo/62AG8pFjIly78qyk7bkygheg3lhqfq
         gsTyIpQ3mHd724NqlSR1n1VdJKzvZU9BilTaa3VJ6B3EjtkHxzhYQ7uHjT3ccJpnn5+l
         ZTBzPk7DMTGYYKh8f9xdUxuNRja8f8zYEAWDhwWBubMo6gYRgWvdg0/0MPNdhWesCvUI
         RLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713538913; x=1714143713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKK2lHWVNTM0FrAdLX6Qzm6HKxic16xHNY/tlXN6dfw=;
        b=pn5Lee/KFIIdmDC5wAIjbwOIr6yoWq7xhSHjN8c9Wj9OYREjcOkKUJC5FarlaUzdRa
         ITU8CggU8SWirDWZpjKDidUw+qC2O/duQ8Gmzrs+54FsJYk+w1YfisSUbkxfmJsAJT9Z
         rFEoqcr/g+10NaCNar7XrjWJre85zLkqoS4ED0QT/ZKqw4yeTaEpZfLKzARp8an4p44L
         LUTD3I26+rY5nBuBXmlAn5StnwsavJABr5p5L8h89zaioqMejp7O+JoTQ8fTZi5at01w
         0gaJ2R9eh5D4gWSW9nffAc9klyr9a0DAhpRsOW6exq3gMgH/fqKU3ZpifY7JsQzIyp79
         Cvng==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2sfttmfff7hlgVWBsRoB13n5gGYjuvawTDW/OETeyinayRT08wzDDAr0SnNEO8jBo0yHveu4cSy6uQhAEV5IUz4j6hiY1VwzVpM0=
X-Gm-Message-State: AOJu0Yx3Xbb5TiiLuGQA3Nrj4POWjKaCp2HscyE7Y9u6h0qCE5VBaQ/R
	yulf+6B4Xpf/7WSjvThJb/8+rJTqPl0mV1aAVRDci/9nkswGLITq1Jfx2WU9e8o=
X-Google-Smtp-Source: 
 AGHT+IGGJookUTMXcDbddWvz5/sMR1qyz7+vIW0U7CPi5oZhv1EIeWy4UabCosCISYA4f+jbMedvEg==
X-Received: by 2002:a05:651c:3cc:b0:2d8:59cb:89ef with SMTP id
 f12-20020a05651c03cc00b002d859cb89efmr1379263ljp.24.1713538912186;
        Fri, 19 Apr 2024 08:01:52 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 f11-20020a05600c4e8b00b00417ee886977sm10660462wmq.4.2024.04.19.08.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 08:01:51 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	steev@kali.org,
	jenneron@postmarketos.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 4/4] ASoC: qcom: sm8250: fix a typo in function name
Date: Fri, 19 Apr 2024 16:01:40 +0100
Message-Id: <20240419150140.92527-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240419150140.92527-1-srinivas.kandagatla@linaro.org>
References: <20240419150140.92527-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RQUZ6NERVU3DEQ2OLX422BPPRUYMEWB3
X-Message-ID-Hash: RQUZ6NERVU3DEQ2OLX422BPPRUYMEWB3
X-MailFrom: srinivas.kandagatla@linaro.org
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Fix a small type in the function name as its confusing to see a SoC name
that does not exist. 

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/sm8250.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index d70df72c0160..9bd159b81d69 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -70,7 +70,7 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 	return qcom_snd_sdw_startup(substream);
 }
 
-static void sm2450_snd_shutdown(struct snd_pcm_substream *substream)
+static void sm8250_snd_shutdown(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
@@ -115,7 +115,7 @@ static int sm8250_snd_hw_free(struct snd_pcm_substream *substream)
 
 static const struct snd_soc_ops sm8250_be_ops = {
 	.startup = sm8250_snd_startup,
-	.shutdown = sm2450_snd_shutdown,
+	.shutdown = sm8250_snd_shutdown,
 	.hw_params = sm8250_snd_hw_params,
 	.hw_free = sm8250_snd_hw_free,
 	.prepare = sm8250_snd_prepare,
-- 
2.43.0

