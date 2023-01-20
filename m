Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E4D675897
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 16:31:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE2D9333B;
	Fri, 20 Jan 2023 16:31:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE2D9333B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674228717;
	bh=gte6EMLgKAgmVFUq+EX5ihh4HFxZhYxU0Fvsdi0efTg=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t7oI63UV0xs5bFyJsvROjl/9sPINgFIrsQCvBVJ5ArAKz+jGsX3kdsT3ytmyknfNP
	 XnPFVIaOIRLXQZktqJG7Q9IOYdQqO2oaJHypAc8GZ+dlm7laT6HFiNNGXRY0f0CXXA
	 KpBF7JuDIPkuXYNsYxQeByaSk57+pr/rcitNPNz0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E11AF80246;
	Fri, 20 Jan 2023 16:30:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 503B9F80246; Fri, 20 Jan 2023 16:30:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B59A3F80246
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 16:30:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B59A3F80246
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=s0azl5fc
Received: by mail-wr1-x42f.google.com with SMTP id h12so1180042wrv.10
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 07:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CSUzHZD5LBKJ/g0Aj/l6k1M45nF+70c3QfWVTVNtyEc=;
 b=s0azl5fcwGm0b+MKCDTVQOHFd7Si70F6Gn9ADXnrY3sfUu1UZuBbpVYt4JONmM1o/8
 QtTTQkWVOV4208Os9+WQXmBjmRChaZpQqO8d1m+QswUS7RfLtEAvfYwXQlEwqunGwCW8
 QP1efwv2QGe9Wpy/xtDWO8FJiUWsG4ISaWiCZUQkSr1MqRfHUdftiFAVLTMT8ZDNpZ5U
 dkYz3jU7wmZ1CmnFq8IK3Sx2vL0Unpih639jKQLtu+aHDqbQsVLkyPa4AiiMw60999Ox
 Xu3cfybEsWLpoCDLSpjXR3lFqIB8gSnUET9CbgqBvAwx9edeq2538ce45ikLiWtWkqlJ
 dANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CSUzHZD5LBKJ/g0Aj/l6k1M45nF+70c3QfWVTVNtyEc=;
 b=Uw8nvG5ZkaZpOlwhopxbnKxkYLFb95SblpavNDLTmzdizDRv1uGIJBMrUHNfbWCLIx
 yk221TRK0GGxBq1lzEl/AM4+zE24nJNYu2WwL6fnd2FTOxANHz9jKLTmubkgXLZ95ms0
 Y7QDJVFJlDOv4GCZHo4o/F6Wv5SsuxPUK3Ec9/E8qTQ0mmr9v7Atv01iRfnl5rf0Nd3Q
 1ds9+woy2S1JNGyUFnRXVqTFKv8hGUYQAxOPEMBEdgwcnVaP2nUq2jUdrUqSfSyYIBrm
 26RqFqtLVstxIc9QZogFRaq7vGy/A+CklC/Uyf7a6O3LSXQa5ycgKYRTLHJ31SVtL7eS
 hCYQ==
X-Gm-Message-State: AFqh2kruN2Htu1epgyvITFCt4c22Tulc1iOuyRxm00HVIKj4xADsS0pj
 Be/3WX4pWqvLJF9l7gW1zLmYNw==
X-Google-Smtp-Source: AMrXdXtjFXEFy4S+oOquTBe7z/6bYcrA51xEzgiLxJ73uN7p9eekRWSBewsGXzfVek6fmjkEbR7t4A==
X-Received: by 2002:adf:f2c4:0:b0:2be:3503:2dcf with SMTP id
 d4-20020adff2c4000000b002be35032dcfmr8215441wrp.44.1674228625836; 
 Fri, 20 Jan 2023 07:30:25 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 w5-20020adfcd05000000b002bdc914a139sm27656470wrm.108.2023.01.20.07.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 07:30:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: dt-bindings: samsung-i2s: drop unneeded
 assigned-clock*
Date: Fri, 20 Jan 2023 16:30:20 +0100
Message-Id: <20230120153020.320270-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120153020.320270-1-krzysztof.kozlowski@linaro.org>
References: <20230120153020.320270-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

assigned-clock-parents and assigned-clocks are coming from dtschema, so
there is no need anymore to keep them in bindings.  Their presence were
also causing false positives:

  exynos5422-odroidxu3.dtb: i2s@3830000: Unevaluated properties are not allowed ('assigned-clock-rates' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/samsung-i2s.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/samsung-i2s.yaml b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
index 7ae007591080..30b3b6e9824b 100644
--- a/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
@@ -75,9 +75,6 @@ properties:
           - const: rx
           - const: tx-sec
 
-  assigned-clock-parents: true
-  assigned-clocks: true
-
   clocks:
     minItems: 1
     maxItems: 3
-- 
2.34.1

