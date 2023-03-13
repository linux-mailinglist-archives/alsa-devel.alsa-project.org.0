Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAED6B70B7
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 08:59:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACBE11492;
	Mon, 13 Mar 2023 08:58:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACBE11492
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678694380;
	bh=ima4IHqVZOJfDwanAmncSDMCsvurQ0bgCKhXhaTy4Ss=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=URwj2sAeD9+UN24KWEb3bUTaz4L5HGghJTATlRzFJFOAekD0zi/WC/xlgnOwyIuCw
	 UHs1pRmb5k7NwDgjnT5sRvQi2saNqMaU2zP18wStzvqSdmLIECClOk922jTcVRHYE3
	 SlIxcB3s5jHWgbqIfVfqzLZqp0G2PVw38JHlptAg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE2C2F80552;
	Mon, 13 Mar 2023 08:57:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04F2FF80425; Mon, 13 Mar 2023 08:55:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E0A6F804B1
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 08:54:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E0A6F804B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=CIJu2Isc
Received: by mail-ed1-x530.google.com with SMTP id o12so44906278edb.9
        for <alsa-devel@alsa-project.org>;
 Mon, 13 Mar 2023 00:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678694097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=goKtutnQ2PFd8NfCZ2pE04cCvKUKzYAaQ26RIq4NWcQ=;
        b=CIJu2IscgcPZmgKaSTO8lOm6S+NIgoh4wZI6BpVbH51qVwz+f7WDUAZymEML4EAEzR
         V6P+T7sj9tBrjvcu5BIbp7/+hva8nP8/4HwdNpa03eUU1jCoTIQ6pSuiDkTC9OeG4Zq7
         cdEJTXfNDxiWc9Xn1E4Pbl37APwDM3KelQUJju3HXy0WqOhRHDTWEP4cY9hKeHx4v1HL
         MZLMV07zKtQZSdpx96n6AvXKdKljlAFT/p5LZFhFnt2JNYHjkXIImT/xLhXIb+LGLt0Z
         C8+4KR53IZT3C37NjDjMU7rxY8QRLdI/nnGipqv0iITglfY3oAIuQZVmzd2kEIx99UQV
         degg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678694097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=goKtutnQ2PFd8NfCZ2pE04cCvKUKzYAaQ26RIq4NWcQ=;
        b=xQpWnX2Quaqxd4wFiRX0+VpQkIq2uKeuGWYSE9Se8wqNDUuSlJml6QpNG3I5oCKPCd
         0aozV1DMQR0wJE8QDaKboHJ9/MPEjnAWX2I6P9CQ55gTYKxT69kncSL4SKP8+Q9n8v1F
         cw19iTYsT32GLECw7u/E6b8+VfUsjVGrtcWGugCvFe/04rTQeX8Zbqlh9WJmnOJfs0Z7
         K649//wD8PbtBiN6Qe1pX59fZ+grnPf0DzLpvzBRam+ZY4Mh7RExd2z0DPrIWHUmynk5
         nJQqn9F5o0iyKEe44l/HZdZA/YFf/Y4eKJbQ/4R3/9klsJcys8Cg/qpLVdRB2zfMaIu5
         adwg==
X-Gm-Message-State: AO0yUKW3m7iThU/SwgthCcIQhnfcPuM4fl6jBYRC+vOuUXHsTOAnmAVV
	QeCcUx9VY8UzDsTjK/Zc5JQBUQ==
X-Google-Smtp-Source: 
 AK7set/Shhtvx7F/zCzjDPFGf/qLGk39vBzVS7puQJx+tO0nnNGWvuz+HfqAg6dwNep2pDdAXQuoVg==
X-Received: by 2002:a17:907:7a86:b0:91f:f1b7:3673 with SMTP id
 mm6-20020a1709077a8600b0091ff1b73673mr7351226ejc.15.1678694097690;
        Mon, 13 Mar 2023 00:54:57 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:f052:f15:3f90:fcb3])
        by smtp.gmail.com with ESMTPSA id
 g7-20020a1709061c8700b008b980c3e013sm3146943ejh.179.2023.03.13.00.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 00:54:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/9] ASoC: dt-bindings: qcom,lpass-va-macro: Add SM8550 VA
 macro
Date: Mon, 13 Mar 2023 08:54:43 +0100
Message-Id: <20230313075445.17160-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230313075445.17160-1-krzysztof.kozlowski@linaro.org>
References: <20230313075445.17160-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: POPQQZPMYOORFQPHUSKQGBOBY4L5WF7U
X-Message-ID-Hash: POPQQZPMYOORFQPHUSKQGBOBY4L5WF7U
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/POPQQZPMYOORFQPHUSKQGBOBY4L5WF7U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the VA macro codec on Qualcomm SM8550, which comes without NPL clock
exposed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on:
https://lore.kernel.org/r/20221118071849.25506-2-srinivas.kandagatla@linaro.org
---
 .../bindings/sound/qcom,lpass-va-macro.yaml    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 528b677a439c..4a56108c444b 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -15,6 +15,7 @@ properties:
       - qcom,sc7280-lpass-va-macro
       - qcom,sm8250-lpass-va-macro
       - qcom,sm8450-lpass-va-macro
+      - qcom,sm8550-lpass-va-macro
       - qcom,sc8280xp-lpass-va-macro
 
   reg:
@@ -110,6 +111,23 @@ allOf:
             - const: dcodec
             - const: npl
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8550-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: mclk
+            - const: macro
+            - const: dcodec
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1

