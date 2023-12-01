Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA0C800CA1
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Dec 2023 14:54:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C629DF2;
	Fri,  1 Dec 2023 14:54:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C629DF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701438888;
	bh=ZJNWSrBVIxrYl6laCN7UCmBXkuBCoxLvH1O7vzmlMq4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AGcgvVX2EmXOrj92blW91gXpefBWhiLxx/rLJI9bh4W1TA/0xDE1C/OgSCmRNeck4
	 Vpv7HbeXt2Ilcu9AJ5Hw3bl028DtJhC00Gks7ENTqcWnvl0tCol6Pib88UCIQXqr7D
	 7/MW2j6xipR7GWBf4nlvQ7miQi5vmlqmxe2dIMvs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6E5AF805A1; Fri,  1 Dec 2023 14:53:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19C2EF80588;
	Fri,  1 Dec 2023 14:53:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A74D9F8016E; Fri,  1 Dec 2023 14:53:44 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 04F09F80166
	for <alsa-devel@alsa-project.org>; Fri,  1 Dec 2023 14:53:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04F09F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=TaCYxfM0
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-54c1cd8d239so1976584a12.0
        for <alsa-devel@alsa-project.org>;
 Fri, 01 Dec 2023 05:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701438817; x=1702043617;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0XO1jfSNAX5UUapl1o0DoRwp6Muw1NAKcPjYnOb3wSQ=;
        b=TaCYxfM07+I/giksAJ+40jdppsaSHH1W5RGQxvkPUohn1FworKAvpiE8VKyRN8GYpH
         Abc+d4V6DHhx5ZSnszwVjTk8HlHG0TT2CH3vt4ZuQGjCB3wmqKVFFew0PUHItgS6XHGE
         +cExSIjrRcTLrqr9lazvUjCp6c9HSae+TYj6V1fSQHyJxL/RCBPnNib02p5injDtrihc
         iArrLhv/cPVADXU8Hxjlj5tLSVZDi3/OscmQ2SYc0Mr2oCLSoZAUZr0dAMLKorR1sFIu
         ldhDTg3Yj3XCkWbEUU96wRTwcke1b0yL6x7QEIJgAX5r6R927ADXCPpwfiurIwkMc+Yg
         AS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701438817; x=1702043617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0XO1jfSNAX5UUapl1o0DoRwp6Muw1NAKcPjYnOb3wSQ=;
        b=IvGoKuDchQn8Z/WlXS1STAD1B+vtfAi9gUU3WcxFd3nX+HFwetdw2SocKUgX5KgAzP
         a+JJV2vNnKH6ttm2YQWXiRF4EdFGS5B47WeiZQ9OYXztNj+Sv0r87j81s2JitFcOzHzx
         dIVRyXLiHQBIVXTqgSFmFB3IDQy0x+c0U7KtPED2NA9ZbiAWGG6so44+/WKhh8RL4ii0
         +18g1Cclz9PCspsxFBEARhKYc1CQgKdlMnHG1Id5p+13FS5IvGoR94DJzVfMFYIWYwOT
         +KMjuUaKMKvXhfCgRi0UmXFAtU77Z/f+dx5gOMO3j8hycaVExtmy/ID0kLgA8DpsNuMD
         b+zA==
X-Gm-Message-State: AOJu0YzgEjkYPJaI9t0O+bm25wbPkWFeTCARioRMl8HzP1nVUcu7lfH7
	DOWlFQi3GBvZiku9+iiXMw+wgA==
X-Google-Smtp-Source: 
 AGHT+IEUEBgek6GqGcBQw9JPEGr/EOjPY1nRmeSrVXDWF27h8GC0nLXB3/Be8p+vpwpYsM4Ye9nsOw==
X-Received: by 2002:a50:d651:0:b0:54c:4fec:f1 with SMTP id
 c17-20020a50d651000000b0054c4fec00f1mr361610edj.128.1701438816710;
        Fri, 01 Dec 2023 05:53:36 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id
 d20-20020a056402001400b0054b531907f8sm1643159edu.73.2023.12.01.05.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 05:53:36 -0800 (PST)
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
Subject: [PATCH 2/2] ASoC: qcom: sc8280xp: Add support for SM8450 and SM8550
Date: Fri,  1 Dec 2023 14:53:32 +0100
Message-Id: <20231201135332.154017-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231201135332.154017-1-krzysztof.kozlowski@linaro.org>
References: <20231201135332.154017-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LHNODDP5G7FNQFODOO3B4TBV46KRP32O
X-Message-ID-Hash: LHNODDP5G7FNQFODOO3B4TBV46KRP32O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LHNODDP5G7FNQFODOO3B4TBV46KRP32O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add compatibles for sound card on Qualcomm SM8450 and SM8550 boards.
The compatibles were already documented.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/sc8280xp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 7df28ecefd65..837356ac541f 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -138,6 +138,8 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
 
 static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{.compatible = "qcom,sc8280xp-sndcard", "sc8280xp"},
+	{.compatible = "qcom,sm8450-sndcard", "sm8450"},
+	{.compatible = "qcom,sm8550-sndcard", "sm8550"},
 	{}
 };
 
-- 
2.34.1

