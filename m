Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EA791BC76
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2024 12:14:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DA9C2319;
	Fri, 28 Jun 2024 12:14:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DA9C2319
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719569688;
	bh=Ad+uKCGSDe8rakMGGeF23SfGPaAfcaquc5R5IIxLKwU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BCqATJd49YbIe1Zihd2mxyDaWPS6tXiCi3FjM9LknCnbiNb+Cixt3RCWAXRrwsJyJ
	 1K1LQI3sppAglGhiMsmeFSi5tuKl0xvZLe1QsjrE65bwmhKOA+au1SQhpbUnamwKew
	 zJzxTXcVm/ZVhRwRQFQH6m1brGETPLKYBl56bsIo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A80AF805F8; Fri, 28 Jun 2024 12:13:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1F59F805D8;
	Fri, 28 Jun 2024 12:13:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81A6BF805C4; Fri, 28 Jun 2024 12:13:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4A089F80495
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 12:11:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A089F80495
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=KOXdc/XO
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42562fde108so4105815e9.0
        for <alsa-devel@alsa-project.org>;
 Fri, 28 Jun 2024 03:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719569495; x=1720174295;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PicI/VwwrTj8z258jc72WwlXuJ32jmr5AxPeFVRGEyg=;
        b=KOXdc/XOhRP0Ey4m0aUWPJEV+ArTvpkyekuC+5lH8UR/5Brt1MoQ76+ar/p2tKoj2y
         P/bMKi3S4BbXRYEZ39zWJ22x6f0W5z6lJamU15K2HiaEfWrJK68PIHaEog7FfbNVsJzY
         UfF07AaNWio7xzEgKdhXnj6fTzxCzqCHgmYpd3mC1cyO65hyok5rlGUM3zPiWrof7PRM
         W0K2wHjNX6CCfO1LG3sj1g5KXXLTCF1hRvn64NijWsNkXVkB8NZnoECfjlTA+hPGRw92
         bgZB12EIoShAD8wxtg7lCgJGqZpsHTkl0jtjJ6XMkRX8X3TdiTEGYxzdpMYuew4Wrs1P
         q+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719569495; x=1720174295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PicI/VwwrTj8z258jc72WwlXuJ32jmr5AxPeFVRGEyg=;
        b=ke2yhkHSR1r2TKAYDkEIQgbS29ysPv4zwACVAw37w707P/obJxv1s7cWG4k639Ao4c
         vPEm6Uz52ZAj6Eu+eAMnkDGdR1fa5jTNgswIwPH0kZCj2r/nY9+wE2kYFKNvoqTHhhD5
         XKPBSLvO33kEnWysgOa/87NzwCjSfVhY4ZNM8ABWFJzexiIfeTnWJoyzM0nErTq1f6QG
         1EEr+70rOrv7RshbwlJUCfjxEFyFcAinCH7pVemI0MXpwukDn3SYUghXsbl/fzGtKRwJ
         kMsQNJvGDUKdEPSJj8BmWbI6o/CObweBHwEeoo2ZRspQHcDYNglhtMqPc7Dx37zS/tGB
         K6SA==
X-Gm-Message-State: AOJu0YyyKUfCs1VBVAgMl7y4tfhn+j18zhkfZUucgDHJNX0x1CG5ZK0H
	cMBC4oD0qcYGZGteSig5X5EG2epG/X8rBcAW7TVsrwrgtBFZwRUPVhPsJCMR6VM=
X-Google-Smtp-Source: 
 AGHT+IF+pgGQZfU5lPr4i1g9vWtUS2+TH+xCGlGbz2/0V8EIqgNIpPGUYP3hYpebbJgktsPW2jhF5Q==
X-Received: by 2002:a05:600c:4f09:b0:425:680b:a6a8 with SMTP id
 5b1f17b1804b1-425680ba7camr30266455e9.15.1719569495149;
        Fri, 28 Jun 2024 03:11:35 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b0c15f8sm27024605e9.47.2024.06.28.03.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 03:11:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 28 Jun 2024 12:10:57 +0200
Subject: [PATCH v2 3/5] ASoC: dapm: Use unsigned for number of widgets in
 snd_soc_dapm_new_controls()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240628-b4-qcom-audio-lpass-codec-cleanups-v2-3-e9741143e485@linaro.org>
References: 
 <20240628-b4-qcom-audio-lpass-codec-cleanups-v2-0-e9741143e485@linaro.org>
In-Reply-To: 
 <20240628-b4-qcom-audio-lpass-codec-cleanups-v2-0-e9741143e485@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1647;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Ad+uKCGSDe8rakMGGeF23SfGPaAfcaquc5R5IIxLKwU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmfow/CHxJHKXSrU35rkMdrR/G9PK+UceqkN2/f
 TIzT+/6MeyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZn6MPwAKCRDBN2bmhouD
 1+KNEACA0txoe8z7xQCp/1czBOAR3nyYD2oUsKtrvoP8vdBhLubYOsiEFloCmFR/ZLXhAUeBpSZ
 Ij3B8o+u+G1bfFTjd0Byp3WN0BPFQCisLH49FSEGr1fBcMNgMJSF25LqOCQwPzBXjG9CDfEmqRU
 bhu6w6HssqzUJOT+ajHvj6zxaAuHvxBeML73axj07tSLsMrs35Ci8hmvs3+F4rqTpV9ByxALm3O
 ci30+PYDQPCCzi+DdYh57C96mDXD3znkqoefIBLTkMy+ALLXZcYN49ZPUxVOh5WBGh1h1uTwrcR
 26MLyFv+4DMlHOCPw0LU4jR9uiEt6YdefoNDSz899AYAN8DPjTzS2lXTl7obdAuc6W+gVg1+TaN
 c+syZ9sPsBTfKI/vQx4aUz3UIe3LTuMwNaNePuPRo56a+/SeuSSMH09UYPQpu6S44mQBIWC+MBs
 6uf8jtC0pkustFnarOJazUm4YZzE2gL0egzCOO6hwcmmcWu+jtHvo0F24nwQ3dthFXaCPTpuT6L
 BZo8SvhUoyLqeoH32Asa57EbAIfGUSDxBtAGRXtplJOKyac/OzY0CLvhnatbSt1dVk25sf0ohxO
 2HrYjJ6ic4Qv9TQrr0iQiESClW1cW9bIGQWUc4/duxR7wZVwweMeWwOX/yPRxretk+Y4oSj96bH
 KK+Fxrl+6oGyE3g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: QKSU5BZTU3AOPTSN7JURWCCKSLWXXSJV
X-Message-ID-Hash: QKSU5BZTU3AOPTSN7JURWCCKSLWXXSJV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QKSU5BZTU3AOPTSN7JURWCCKSLWXXSJV/>
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

