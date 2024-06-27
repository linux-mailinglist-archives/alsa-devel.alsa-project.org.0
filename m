Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 444B991AB29
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 17:25:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 574BD218F;
	Thu, 27 Jun 2024 17:25:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 574BD218F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719501915;
	bh=aBdsa363wYorx7OqK8Nq8RDf9xf/aTP7aoUD8NTcA04=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VzCqKXLtsZfwSoIWPRcPQDQ8OKjLeTyEHJU9Ilac1am4BLXrGvmhD3CUL4bAeK0E/
	 4QFPh6khhMa8/GlfxPkkTuoTJft8fb+MckPumoUDTRIn2UBPS6Pw6JIfEnkyUAiEMR
	 ikZ8yArgiH3cJWPq0eVxh6piOOYkwW2kjOpZdptM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B397EF8061B; Thu, 27 Jun 2024 17:24:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10685F8061F;
	Thu, 27 Jun 2024 17:24:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A06CDF805AB; Thu, 27 Jun 2024 17:23:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE188F800ED
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 17:23:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE188F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=W5AjIeMi
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-42122ac2f38so12552935e9.1
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 08:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719501833; x=1720106633;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z+Qye23XNNbt3oIc75EavUvJnN6rEV1YtqVZ+ai5H9w=;
        b=W5AjIeMi6v7Ihcav5JE2n9BZ+Yma3wB8uFfV7+a5/a4kSSIbAFOOPuOB8t7vjOVf9c
         B79WhlfD2cGal6N+T9iVnHTJ/dbp2St5CfCwEBiOd2WGGrFob80GM7STn5+P9M1Yyks5
         aS1pQD1dmPWhEvJ2xeBrxHTmZYLbnv3sBDwlF7jI4DJpkW7DRQyZrjQZR87x3jz1G9CG
         9OjYJfl9SEs111pOByT9WO4qxuRBu+iWr9XkeTwEM82dstk9VN2GDcIheF0OrVkHfggC
         IKWv94HIAFGc+9JiuVYJhq5KGna+W0x9EDdmlOqsBp8Sk/4adphQVhglr/2zVPwk6PRz
         cXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719501833; x=1720106633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z+Qye23XNNbt3oIc75EavUvJnN6rEV1YtqVZ+ai5H9w=;
        b=DW7fFiz4Tskl4u11RkMA5Qaw89nnlvGYJkr8966Kb2fcwtRxG952U+a2nPRkNh9+/O
         0OtfYSdcpXU5OZYuHFaWXLR/RNj/FKGl2OoK4JH8IMCsEqeK3QlLlUU13T3qfyTivA1x
         +8CDqqEXgqgZCfNd6YL396kTUANZG/EEN9Ph123c7rMVgACZ17PCqQ8gPWU3pDnqk3Il
         +LZkWVrlHy9rVc5oOONdD1VHleC2Mm8h+n9K3pil9qSBtO9z8VUpD/gFgqPuOQIGykF5
         0xCWEq/ZV7d5Y0JbwBcMqeYBTPiz9zPXGrm2iN4wIgBs091p6g0LfFx8S77W0BUKaDc6
         bzEg==
X-Gm-Message-State: AOJu0Yzj+NqsgD/QhaakL7DmpoyNbv6PmCFjNIAZQ5kyk4Z2326EqU7f
	uRqo2B+sTWVs14ltLgLZNDSR2w4Q/RNwNzYQWlfIrn/WCMMHdJxmECyXX+4oeb4=
X-Google-Smtp-Source: 
 AGHT+IEbhmY2QIczH1le+6f1QjH9zMOlmpjfYaMsVN+8XQHIvad2N1tVs+Oa3zO8On+XqmYI5s4aEw==
X-Received: by 2002:a05:600c:3c8b:b0:424:8a34:9890 with SMTP id
 5b1f17b1804b1-4256450c71cmr23818275e9.7.1719501833143;
        Thu, 27 Jun 2024 08:23:53 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42564bb59b7sm32783185e9.34.2024.06.27.08.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:23:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 27 Jun 2024 17:23:45 +0200
Subject: [PATCH 3/4] ASoC: dapm: Use unsigned for number of widgets in
 snd_soc_dapm_new_controls()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-3-ede31891d238@linaro.org>
References: 
 <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-0-ede31891d238@linaro.org>
In-Reply-To: 
 <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-0-ede31891d238@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1586;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=aBdsa363wYorx7OqK8Nq8RDf9xf/aTP7aoUD8NTcA04=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmfYQC2DaMhs+zDgAaWx2Kzj30we//VkAvaxY8i
 WfJkJ5viuOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZn2EAgAKCRDBN2bmhouD
 1z6GD/93ndHokDVXfI34SLvxVyQePq57WTmIum2zcV1FB4uydLnPOanizt/2hF+tlqvJ7hfpG0X
 cQDCkUvB6uFUTlDKz0hwjnkFknvQHlwXopBbmk6x8G38HyRPrgF18YWhcQxLl+hoB/nyTFzoW9B
 VfS8Cgr5LU1YNElJ1agEmd4kpewhiCflZ7yJ9lJJb9g/HiW7dwOR+X09UNi7OgmQ0DkutH+qRha
 b5S0uRxDQ0JRMdE0o8PZryhVfyVfEqYbn4YCuBiTYgMqcFENyhqda31Pt0wNgmjXgdfvRsCcWf5
 eq3QJ10MJ5wVXNLPYtu3B4lh/35ZulFxNG3ciTRxBMkJhI7D+o1SATbtN+0Rt5ERFStCc4mz8+0
 XZGt8sUVcG0Y458AHWuviebgAd3+6x/Xq6BhAK/MiJeT1X20wtFfXtPAXOqRKONEAdTlip+Cl4t
 4BY5/5URrVRz+GqeiTN4MWDnW5MbKXZ5XIgLmjZmu54QxPdH6UFQtsT+PbitrZp4y9Pjo/C7UNB
 w1DzVlmS7ukcP/DlQtuvwQeoEqAUqcoERhSZWTAC0rqed91oWvcbq7D90NGWgqeNz/+1atwP34t
 F5osG8x7tGBQjbnCXtiRk7XgTM1FR6Nhx7otPlcy9TVeNPgfQP62/lMDheoaFyhdEKNEduUnXKp
 /PswNYJwN2P+U2A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: VJBQZUBA4MZZRCKWV53QUT5D37GYJJG7
X-Message-ID-Hash: VJBQZUBA4MZZRCKWV53QUT5D37GYJJG7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VJBQZUBA4MZZRCKWV53QUT5D37GYJJG7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Number of widgets in array passed to snd_soc_dapm_new_controls() cannot
be negative, so make it explicit by using 'unsigned int', just like
snd_soc_add_component_controls() is doing.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/sound/soc-dapm.h | 2 +-
 sound/soc/soc-dapm.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 667ecd4daa68..12cd7b5a2202 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -457,7 +457,7 @@ int snd_soc_dapm_get_pin_switch(struct snd_kcontrol *kcontrol,
 int snd_soc_dapm_put_pin_switch(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *uncontrol);
 int snd_soc_dapm_new_controls(struct snd_soc_dapm_context *dapm,
-	const struct snd_soc_dapm_widget *widget, int num);
+	const struct snd_soc_dapm_widget *widget, unsigned int num);
 struct snd_soc_dapm_widget *snd_soc_dapm_new_control(struct snd_soc_dapm_context *dapm,
 		const struct snd_soc_dapm_widget *widget);
 struct snd_soc_dapm_widget *snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 16dad4a45443..32cc90d09bc2 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3857,7 +3857,7 @@ EXPORT_SYMBOL_GPL(snd_soc_dapm_new_control);
  */
 int snd_soc_dapm_new_controls(struct snd_soc_dapm_context *dapm,
 	const struct snd_soc_dapm_widget *widget,
-	int num)
+	unsigned int num)
 {
 	int i;
 	int ret = 0;

-- 
2.43.0

