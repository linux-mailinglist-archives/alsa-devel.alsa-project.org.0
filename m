Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45ACC84738E
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Feb 2024 16:43:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF09BA4D;
	Fri,  2 Feb 2024 16:42:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF09BA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706888579;
	bh=4X1TPMFs6uYp8v8YB3aNn81TS+wxeI5hvW9G+HbDZuM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eYZ9kuVroipFdxLLodkhn5DzvGGB5rblvI68UKSvSPZFYWfsYYU47rlJoAfIPo8W9
	 4TieXJLk/qqpXSiu9782JCg8NKzJPTbPT9vKteTYywLgnbydK1ZETm8IFrgOf0uE0b
	 dSY+pG49PujUOl8nly6BU2kpShfI4vuVL+WdZ260=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD31AF805EF; Fri,  2 Feb 2024 16:41:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB18EF805ED;
	Fri,  2 Feb 2024 16:41:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3448F80563; Fri,  2 Feb 2024 16:41:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 91A08F8055C
	for <alsa-devel@alsa-project.org>; Fri,  2 Feb 2024 16:41:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91A08F8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=CLLXCE0V
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-55783b7b47aso3141749a12.0
        for <alsa-devel@alsa-project.org>;
 Fri, 02 Feb 2024 07:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706888502; x=1707493302;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LF4BB/ebiJDn9LW6b9s3SFnH7jRadY8xXWrehEGe0f4=;
        b=CLLXCE0Vkfj7zQbFscFiLkrWQmClpY3Jv1cd3ZnXWvSaaI/xiy7Rqgmgz1lmNuLo6a
         eNFWVgu4rfqgw4cSNWiCxtLvv1HNkHHuulXpLnJss+sBcKyn19m7vuWIEvupIGL9NEN7
         AVOkpVr2IaiGHHbVi5ZGxTSnN/kDmK1KOn06vYzDYHcRS91ttbH/yGPMqalFQF5qySYl
         kXmljnhXJCrPD994rFiXqP6jeNi2a3C+AM9QAnSDo/xtpOSj0ISmAZ3mUmYXW3ZL7x5K
         oyao/XRVTAIPdKZWY1N6Fj1Zo+UpHqquXqlq0d5jNxlnqfCxl8Cc9YhYgNipHLCD/4FB
         Yp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706888502; x=1707493302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LF4BB/ebiJDn9LW6b9s3SFnH7jRadY8xXWrehEGe0f4=;
        b=GftTgi4l048dHcXjZ/w+VzLLbnzSkcnAk8+ueADODottYcDbzohUnqw1O1Go3vJ+o2
         W16oaUc3V0TKChKGFTQc84aKZYgaF29e2vQcLH2Bz040XyfMi0WxH5lJfHNx5GI35VUq
         W7uFFP9gLTQ6bdBxh/D3JYhay9wE+eyzgVMazRbR2s94zfdl7wpWKgdKM89v2InoiVKI
         Hhpg6incSpXTiSWl3Iu7PS2j50GWSOQuleqou3VZqU+ak1mCt9RjVfQK8sRR41VY4EpN
         nUy8And2hc8l8EuP/R1U368VMJrd1AAU5EubG6VkwW0sPBH4yvmn7xcqVzGnQaC/yeFW
         wbAg==
X-Gm-Message-State: AOJu0YztGsKGM5yyQnMiXUA67WfXYt2Q999iGt4ECAnghVS6+K1w8Plq
	dQExVFY8wLOnH5qfRmMvHGEHfRcwcFKMLHI54gwJOmmS01MbRZGc268k7IzrPyE=
X-Google-Smtp-Source: 
 AGHT+IFKIHngJwG+a8+K2tvxYalO1Inf+CHn/nPl1OzTiD97fi59n0bVlsRCJVniN7XOzim1bIBKfQ==
X-Received: by 2002:a17:906:7185:b0:a36:7bee:5d9b with SMTP id
 h5-20020a170906718500b00a367bee5d9bmr6375843ejk.76.1706888502620;
        Fri, 02 Feb 2024 07:41:42 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCU22WkjqI/e18Wrj93BXTP/RqCvlOF91i6IDCtxrNbtFQ/ntRsDiAvZ/K18jVxcFpHI1pk0CVuDZ54O36EsmAAGwbTefUaNkK5O5fahsHH9A0Rt65bXEZEhqDana+8PI4mHJHVp/Pc2Oc5jMX/LYGhy0F+cpQhlaNSONnnRl4WSxSpVs03IkzZSEsiLVfGzu9ewDpcnCxcwrrRdpm9dnzHkgBzMGS0lQSZfKnsbU0Hve6UYEfhezQ03++TFMGKRJWzds+4e7EGMcMxvcOkaQT5d+GpVsZPpGmOCCywOk0ImT7iWCB9s
Received: from krzk-bin.. ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id
 cu9-20020a170906ba8900b00a37116e2885sm624819ejd.84.2024.02.02.07.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 07:41:42 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/3] ASoC: codecs: tx-macro: Simplify setting AMIC control
Date: Fri,  2 Feb 2024 16:41:34 +0100
Message-Id: <20240202154134.66967-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240202154134.66967-1-krzysztof.kozlowski@linaro.org>
References: <20240202154134.66967-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: COC5MCYVR33TUMQJ75GHWWZHDCWJUNND
X-Message-ID-Hash: COC5MCYVR33TUMQJ75GHWWZHDCWJUNND
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When updating all bits in AMIC control registers (mask 0xff), use more
obvious snd_soc_component_write().  Replace also hard-coded value 0x00
with a define.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-tx-macro.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 2d4f6c04332b..7e51212d4503 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -1850,8 +1850,10 @@ static int tx_macro_component_probe(struct snd_soc_component *comp)
 	snd_soc_component_update_bits(comp, CDC_TX0_TX_PATH_SEC7, 0x3F,
 				      0x0A);
 	/* Enable swr mic0 and mic1 clock */
-	snd_soc_component_update_bits(comp, CDC_TX_TOP_CSR_SWR_AMIC0_CTL, 0xFF, 0x00);
-	snd_soc_component_update_bits(comp, CDC_TX_TOP_CSR_SWR_AMIC1_CTL, 0xFF, 0x00);
+	snd_soc_component_write(comp, CDC_TX_TOP_CSR_SWR_AMIC0_CTL,
+				CDC_TX_SWR_MIC_CLK_DEFAULT);
+	snd_soc_component_write(comp, CDC_TX_TOP_CSR_SWR_AMIC1_CTL,
+				CDC_TX_SWR_MIC_CLK_DEFAULT);
 
 	return 0;
 }
-- 
2.34.1

