Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A93576B70BE
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 09:00:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1E0D1493;
	Mon, 13 Mar 2023 08:59:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1E0D1493
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678694422;
	bh=pMXK2nU9TDhsMNF2O0ysGc2eN8QSKaEidbOTfNnAhHo=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VCEQ9BnEDDEv3qU8d/0Vnn+DYZ4Xd1RqJ6jPiGyqp1T+we34Dxn1tLAdCL21ygSXz
	 +PrjBitHcRZjbg/IJcDajfB1dYMeOF/KknkpOTznnxJAQpnp2AXrHkfK6v55ZtQybg
	 5SQrAmu/FPrxZGMQvhp3RjtDXV+ZzvKEXRuiJCFo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 32198F80570;
	Mon, 13 Mar 2023 08:57:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22B65F80425; Mon, 13 Mar 2023 08:56:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0F479F8016C
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 08:54:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F479F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=lLbMCDNB
Received: by mail-ed1-x52f.google.com with SMTP id ek18so13787225edb.6
        for <alsa-devel@alsa-project.org>;
 Mon, 13 Mar 2023 00:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678694092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcXL6MCdOOilzj/9V8Bxhr6PgZvPsGUvEZbtUrf8CA0=;
        b=lLbMCDNB8izZF0fMR6XD6CON56cutGL+/47tYCKHA5REqfw0OHpU5thIMeGFsVNMYt
         2G0eJymUZKnlJOXDMn8isJG5H3Zp5q8EcBslx3NyoV0oePVWELvAGHbBOpnij18+4vXK
         sKji7OnEoFB5VGB/aa2bpE5JTNOee2r9C9mEGzTNyJWGepq56pWje0dnQzTMLBMNA2gA
         7oUCP/HhpyQxPtI5nw4EoTCINxCc/zTdz13pEjogkCY2hdsqjQbGgfSJzzmbJExKjvKO
         uC+gdGF6wBXChBD0mfvj3adWHkcIheeOyZrPZR3oEt7j7pd70fi8ARY3jyU+Gh91Cuph
         wsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678694092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AcXL6MCdOOilzj/9V8Bxhr6PgZvPsGUvEZbtUrf8CA0=;
        b=QogIrhxZqATzQIALC5NiMJb3Qlzt3ZN/TSucp+aQmIW+D+HPFkOmtK7opSQQE6omOh
         82sDcem+39zDU5wopm3wZ7q+mOIAkchvQNh3i0uma+FF8/GcKR77ZJcjydeTZuOE+5ye
         WjISGVSJUQeEq5w2wstXo50yj25HEMLCg7sRlv3/LXCJCCQ1saclizwLd1RiXCeyl83u
         IL1Uces6ZLyle66Ay5G2Hmvu6IrkXqhZaGv8UFFxvQubqIlWtCWEp//3ZWK/44CwFWZ5
         SDT50F6HCVTxdW1WCTxXFeE4GX72QEKkExjftmLpPg1g800+38UThsItpjrP5SQ9j+TT
         5UHg==
X-Gm-Message-State: AO0yUKXHTD2dMqk9U3DyMQsMCTaXcFAA/fYK6/PByOuYMOdDNKmG6DAK
	26U2weGOOLgVmnbBCJpWFuwx5Q==
X-Google-Smtp-Source: 
 AK7set+m4WhsczrGwKvch2GzsDuipvIzOAeVXm2+r2tgr1spqAPI7mk1/Gr1PcaQM3BIxlNKL8vOpQ==
X-Received: by 2002:a17:906:8d86:b0:8f9:ed75:f962 with SMTP id
 ry6-20020a1709068d8600b008f9ed75f962mr36202738ejc.18.1678694092265;
        Mon, 13 Mar 2023 00:54:52 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:f052:f15:3f90:fcb3])
        by smtp.gmail.com with ESMTPSA id
 g7-20020a1709061c8700b008b980c3e013sm3146943ejh.179.2023.03.13.00.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 00:54:51 -0700 (PDT)
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
Subject: [PATCH v2 2/9] ASoC: dt-bindings: qcom,lpass-rx-macro: Add SM8550 RX
 macro
Date: Mon, 13 Mar 2023 08:54:38 +0100
Message-Id: <20230313075445.17160-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230313075445.17160-1-krzysztof.kozlowski@linaro.org>
References: <20230313075445.17160-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: F3HI2MTNY7UJHPSYJGKSEQGNQOSVW7P7
X-Message-ID-Hash: F3HI2MTNY7UJHPSYJGKSEQGNQOSVW7P7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F3HI2MTNY7UJHPSYJGKSEQGNQOSVW7P7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the RX macro codec on Qualcomm SM8550, which comes without NPL clock
exposed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/qcom,lpass-rx-macro.yaml    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 8b3d617a9578..0ae3c81abdf8 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -15,6 +15,7 @@ properties:
       - qcom,sc7280-lpass-rx-macro
       - qcom,sm8250-lpass-rx-macro
       - qcom,sm8450-lpass-rx-macro
+      - qcom,sm8550-lpass-rx-macro
       - qcom,sc8280xp-lpass-rx-macro
 
   reg:
@@ -92,6 +93,23 @@ allOf:
             - const: dcodec
             - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm8550-lpass-rx-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: macro
+            - const: dcodec
+            - const: fsgen
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1

