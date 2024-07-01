Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A6291D93C
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 09:42:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2588821B8;
	Mon,  1 Jul 2024 09:42:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2588821B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719819739;
	bh=x29wiXWpg6jxb2D1xLhsOVHl1vLxmaL7w/bv/sExbXA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CHi0lcEp6B9NIfGcUo90KBEyZgHOhjuqshVV4Yratp+Mo6bwd/jt/h9AuE1gmG9Zc
	 kDncGfh/zdFgtOFP5RSSLwsIw9Pfd9E+318BmAkk1P9FTyzH1L3iprAcgJX3zj8haM
	 VmrIvDJYYr16pSm3atVmK8goynbcBN6duQ7uIcDQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E3CFF806AF; Mon,  1 Jul 2024 09:40:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BF88F806A3;
	Mon,  1 Jul 2024 09:40:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1999F80652; Mon,  1 Jul 2024 09:40:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C339F8045D
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 09:39:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C339F8045D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Nv8BaKY3
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-362bc731810so2189905f8f.1
        for <alsa-devel@alsa-project.org>;
 Mon, 01 Jul 2024 00:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719819592; x=1720424392;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JlFPWXG6JCmSDQcnpPbHIJV1hXvd50IYEdMdlRm8NpE=;
        b=Nv8BaKY3GYU4L3glyhR76zh5hltrBSJiPLalJDhLjR3pB6CQZcpTTF5JkHW7RS1/7K
         F+cSMptA3PBbRqmMhyabs63dhj7Axa6nVqdE2PHv0NxUu6lh4bwjlhEvabXqxYC4ub9v
         eEvOpXZRDO48Dg2OTpvglgAHUpCoRbtxeBSR1j/JUKxUKbjOfN8cabuCfInE1cEHIK+c
         CFWvi77v+QbivNJA4u7gld6H4ml/w+e36xVluiLlrQktKxC/3SdfUoKoCiT2r/2XcfhR
         FHfmkmbPxDtYyajtNqnn1x3HepB+MufOxmgcGOI60YDomF4CU3vbI4eW14VsuF2OsA38
         cqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719819592; x=1720424392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JlFPWXG6JCmSDQcnpPbHIJV1hXvd50IYEdMdlRm8NpE=;
        b=a8OMJHF2bfVUm6PPvTxhdTBhR61b8wZOfwug2kzDtEGjKSJPQ6wAuA1oOpM19mI3DV
         OwsiDteyauHlBjaNHWCTwYG2X9FEzEb5xRw7BdmwFzMKVsWxoEAeykSrYeY7FuWsVJgs
         sotoS1MYyJ296sf3kRSXuaprzgjOCinqRiP34ZtkF8SU9RNsC1lVSAoC7X9rQB1/Ur34
         qdS8WNfBeZLHUuVMEVvm8GQAiroUKLAs8oLHClP34ZVrQ8rJpzZGXXaED0mbDZBWNFH8
         PpakQzUAoIPFlt7HN4VhnCVn7r4/7/P9FZLWgNULqU9cxzU+M6gF+FRrI6kPJGO6Y2vD
         a80A==
X-Gm-Message-State: AOJu0Yxdtioummz6cFQonCEoURdrhiCBAnUOLfjJ4lldNVh3ADTEQM6y
	p3xjuUGEXLEeJ/94LLn2S1VTTg5Vqm+se2YSg8PClayPiz3eqBQB7apjgpPVEno=
X-Google-Smtp-Source: 
 AGHT+IHHtHxDqWdH128hQmSA0cf68mmpNc9DRTecEH9In5YhAxmj+nZy5eqG4zRev1smLhlwMVcEcg==
X-Received: by 2002:adf:ce0a:0:b0:364:29ce:b14e with SMTP id
 ffacd0b85a97d-367757307aemr4223694f8f.69.1719819592610;
        Mon, 01 Jul 2024 00:39:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0fb9absm9279936f8f.80.2024.07.01.00.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 00:39:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 01 Jul 2024 09:39:37 +0200
Subject: [PATCH v3 5/6] ASoC: codecs: lpass-rx-macro: Use unsigned for
 number of widgets
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-5-6d98d4dd1ef5@linaro.org>
References: 
 <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-0-6d98d4dd1ef5@linaro.org>
In-Reply-To: 
 <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-0-6d98d4dd1ef5@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1007;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=x29wiXWpg6jxb2D1xLhsOVHl1vLxmaL7w/bv/sExbXA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmgl0/b6W/jgS8oAl3i/WUq1uwI+lyOS8exPUTa
 7WelHm2nIOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoJdPwAKCRDBN2bmhouD
 17wJD/4nCEib+5DqPEHKrWFzzhh4Pm8WGZESnEx+zYlUmkRVYwHgyrsI4Mx532DRm3x1JpagKWI
 NNv5xvIOQARUI82dK92tuAaNW1qkThmKV6PIVa+Du38dXD0izYl7MYjaX+uJhODQwLiHXDioanX
 KpTfALvKiVIxq0CV19/BTcBNozPiWxCsCDd2TpnhKcCxes6uHEuU+5+5duoAh9YSqvOc+aOvl2J
 k+JTKgo7R4nN21KhbN+1I9KcV4CsLI/ctn5ck0fMzA0u8qs3dvDI2WbunOPZ5HDm8mPEO6K4Pyt
 CHe+AMqDcnb7v2LAwoD1HcXcGkKPFkBkKQ3JNZtBUB1Eqgrs889RAjPURnmPg56a0Frp261pnKb
 lx05CvmKdZ/BlXGt5Uig+hIaIB7HR45/DLoweL8UVXsZlUlDwhTneAwC9T34dCksGINAGffk3OP
 Q40wmTWZ4CS5nMZQoogd9DKazRdeQ165EUe4eBh+FUJOpJ1NQLPoJE5fkxvCYxrehrZCuAwB0ny
 0GBdeBEWnA9t76TFcHt1c9HajeZ/57VAj6tprxMXq+It1J5C4UPp1zLaqss1o6ifvwVn1JELSJy
 fu38XyflpmvvHQra2o8VTeRd3BIHJ1bWKIQJXt4Em0MHDhTlXrnKEIasb5IYpDW7pwRQ0Xs9j9U
 CnbTb6iGmhl1w4g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: GTWIPNAJH2IOZ4L7OUO43AKPC5DCX4YM
X-Message-ID-Hash: GTWIPNAJH2IOZ4L7OUO43AKPC5DCX4YM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GTWIPNAJH2IOZ4L7OUO43AKPC5DCX4YM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Driver uses ARRAY_SIZE() to get number of widgets later passed to
snd_soc_dapm_new_controls(), which is an 'unsigned int'.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index d4d7e02db83f..ce42749660c8 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3612,8 +3612,8 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
 	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 	const struct snd_soc_dapm_widget *widgets;
 	const struct snd_kcontrol_new *controls;
-	unsigned int num_controls;
-	int ret, num_widgets;
+	unsigned int num_controls, num_widgets;
+	int ret;
 
 	snd_soc_component_init_regmap(component, rx->regmap);
 

-- 
2.43.0

