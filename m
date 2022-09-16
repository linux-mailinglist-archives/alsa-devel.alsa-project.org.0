Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FD15BAE1A
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 15:26:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CED81AA4;
	Fri, 16 Sep 2022 15:25:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CED81AA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663334770;
	bh=7qWrf3sKtPASMILcFg85yEk3tUOXmxcCqnXejWXQ0xM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TA7gTSscUOzlAL4LRvptAMXUaRkMFbPXT2s63PZia3PXH8mabapsVypM21q4+1o2R
	 8qw2AQgwTx40dJCzuurXNfY2GpqsjlQ7m09H3LO7TdJ22/xMYXF34sWPETo/6sI1Ql
	 YFjVCwxKpMiRNGDnnmPqoCh2zDqGpr1hF9+IOiSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65B4BF80496;
	Fri, 16 Sep 2022 15:24:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F6E0F80537; Fri, 16 Sep 2022 15:24:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC307F804D2
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 15:24:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC307F804D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="vZoDLfSL"
Received: by mail-wr1-x42e.google.com with SMTP id z6so3528665wrq.1
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 06:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=+W+mJGcR2EndruN0lglfV6ZFhxv7HYvptaoPjmljPEQ=;
 b=vZoDLfSLqQEgTYVavNcrVAvUnwNBVnu2uL/Hrd6HyBmmXLkf/10NuukyptOlvS5UHo
 z7ST7w7cP6evDi+WKJ9Qmkba+o8nfUVB8mTISbz+Q4v810ZCX2FN+PFPBGA1CAYvGLtH
 YL5WOlhPiKXophIAMEEJQc4QMSTzMlOfUIN1j/LV1dpZS4xkSgnsP7wgQI38ImPFjMk9
 KA/DGy/aSc/tJAThdedMXwJcRFFi5YYOgK1pr7MMOBhjEujqKlT+ELtJHecp0synIZu7
 ECgO4nf+W9Gw1Jui2G2Mq7EU01QGR1il7a8lmYlVuOcqdLKX81aA7n0Gf3yrt94bDrHy
 PcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+W+mJGcR2EndruN0lglfV6ZFhxv7HYvptaoPjmljPEQ=;
 b=6fjmj7T/4DPvsUKWDvYiPuOEO4R0NFFg0VMc7/rLHFY8y/1lA83KCjEVsBRW4K66OM
 32KABrJ9p354jAFZ5lh08877nuXsMbczJCIX6JvHEP6+7LiY9n2Levpd9xrWkTo16bEA
 OJDXmpgpMT5gfWQcttM+qVe2WRBK4I9PO8mFkmcQviHIRPGyVqOmRBZM2U9kFZQRAV+l
 zGoClDXD8lZReMqKGju5cPF3Rs0WsU24OhC+nzpuZs/Vnm6w4pzaLsl/VAd4tXHp79pn
 QH9ldb9gYk3rCvcitIWU+hpusVc2aZJ80aA48/Z/qCnA6gQEeFIRWc9SyA3YuMocqG+A
 IqXQ==
X-Gm-Message-State: ACrzQf1YhVo+bplN69gseBneezLDi07rhjBDBqCgtvKtDHzBaHOV5KCS
 d6UxLC0b2TZM6hnH++3S2ZvSMA==
X-Google-Smtp-Source: AMsMyM65rHm2cl2xkabgfqjleJ+Ut49AmRpBnqIa4zx8l1mPDXedZJjTcAdd/NSjcB4nW9/5wDCY2A==
X-Received: by 2002:a05:6000:1363:b0:228:d605:f9dc with SMTP id
 q3-20020a056000136300b00228d605f9dcmr2703108wrz.109.1663334681983; 
 Fri, 16 Sep 2022 06:24:41 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a05600c358500b003a608d69a64sm2387061wmq.21.2022.09.16.06.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Sep 2022 06:24:41 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v5 3/5] ASoC: dt-bindings: qcom,
 sm8250: add compatibles for sm8450 and sm8250
Date: Fri, 16 Sep 2022 14:24:25 +0100
Message-Id: <20220916132427.1845-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220916132427.1845-1-srinivas.kandagatla@linaro.org>
References: <20220916132427.1845-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski+dt@linaro.org, Rob Herring <robh@kernel.org>,
 linux-arm-msm@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, bgoswami@quicinc.com,
 linux-kernel@vger.kernel.org
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

Add compatibles for sm8450 and sm8250xp based soundcards.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index bab1a6f1890f..70080d04ddc9 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -21,8 +21,10 @@ properties:
       - qcom,db845c-sndcard
       - qcom,msm8916-qdsp6-sndcard
       - qcom,qrb5165-rb5-sndcard
+      - qcom,sc8280xp-sndcard
       - qcom,sdm845-sndcard
       - qcom,sm8250-sndcard
+      - qcom,sm8450-sndcard
 
   audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-- 
2.21.0

