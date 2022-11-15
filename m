Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 050EA62967F
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 11:57:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 980C71681;
	Tue, 15 Nov 2022 11:56:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 980C71681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668509843;
	bh=8Mfz63865NKkE7Y4Z/RE20JucZ8ZWD6F1unB+B7Nrvs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d1vDAFelLFpVtxFQqRWVqUGZI30859k426THzZDI+qSVEou6kSQy8RlWvg/DomaI+
	 GYZiDZ3N+xeFzjMIJwum31UTWcp0J+LD82F8SblASsskEzUr1rqHpKVIOt1Mjqu5ZM
	 ol3BOzE2HofhSijkxdk43g7F4GpQyRhUf754O7Dg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52D7DF80542;
	Tue, 15 Nov 2022 11:56:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A405FF800AA; Tue, 15 Nov 2022 11:56:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A0F9F800AA
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 11:56:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A0F9F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="d2snvaMp"
Received: by mail-wm1-x336.google.com with SMTP id v7so9412209wmn.0
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 02:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bCi7YFy2fjbBE3WEf3zcS1kGXNt63J9q4Tgiqiwur08=;
 b=d2snvaMp96sDrYHfndctd8uvR2posqG3lOgKLGpu8H38Gs46hOBPPnJkWcCwKXdPD2
 NSNTvr7gwRTLab2w2L57LA76aluuMFKthfckaCkDazbgZtkhoNWS6zrt6Cx/MH9+R1q9
 Lvx7Hz6cd3nBqi62rFoGeaaC6UYhvMdpQqPG0bLO9Z17a78LkfnSys2ZCtOnxmUnP16r
 ZnnTJESLFwNMoZs1ZF+ocEDQBbp0ukiV2EXLpK/rGSLBaCp8ctOaQg7HEajNCtEeDCZr
 caO2OyjV5qF9ColI0fUiyE2D4QaV8ASpriwjIr4Q/giiRzU1NaLZ0Wn4bC9p870qdyMX
 ZHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bCi7YFy2fjbBE3WEf3zcS1kGXNt63J9q4Tgiqiwur08=;
 b=1vw/BCBzMw7B92jd3rI5yZhfm7TBANLHJzI7ybn2I8LELG7BifV0O/TIj4q4nxCnvR
 2CYLElkPardkOM5ZdQLRVCA3m2jvKgnST9SjAKdGnjLgmj6QF6rXuBe7U3paLyoOQ5cw
 b+G6WJdryXTXeP3p8HVx1wgjZVLunUuMEb6eQmZaBDdqnSRLkq3A2fmTN3g14g2FB8/Q
 0bRn+PN+C7lGFse1FfzLHHTs2wqgcyigvhrgbYbNLBE9r1mGgjkjb6n/FWOJCZVLdp/h
 FqkG4uMwuRXaGNjlhDXWjat/paJCbWI4dRzpd1gMVdc44SEoWJ2IDVdzQuHEmvIB+rMW
 xJJA==
X-Gm-Message-State: ANoB5pl0c2bzVv7OhGlZWMp3fkYHmxbqFSVIG/iK3CxhuSqIkD5cdE8O
 Foh2tg/qLcNNG6qXDPBGHmTVNw==
X-Google-Smtp-Source: AA0mqf7dHxz7sn1ZpVdYHHEUGbzqS80S0bgteW5WYyL8drX0zBxNtZAfHdQDJNKkkT8Iaiq1PVS4yA==
X-Received: by 2002:a05:600c:1f0d:b0:3cf:7556:a592 with SMTP id
 bd13-20020a05600c1f0d00b003cf7556a592mr1004863wmb.199.1668509759244; 
 Tue, 15 Nov 2022 02:55:59 -0800 (PST)
Received: from localhost.localdomain ([185.201.60.217])
 by smtp.gmail.com with ESMTPSA id
 r18-20020adfe692000000b00238df11940fsm12185046wrm.16.2022.11.15.02.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 02:55:58 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 1/2] ASoC: dt-bindings: lpass-va: add npl clock for new VA
 macro
Date: Tue, 15 Nov 2022 10:55:40 +0000
Message-Id: <20221115105541.16322-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221115105541.16322-1-srinivas.kandagatla@linaro.org>
References: <20221115105541.16322-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 krzysztof.kozlowski+dt@linaro.org
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

LPASS VA Macro now has soundwire master to deal with access to
analog mic in low power island use cases. This also means that VA macro
now needs to get hold of the npl clock too. Add clock bindings required
for this.

As part of adding this bindings, also update bindings to be able to
specific and associate the clock names specific to the SoC.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/sound/qcom,lpass-va-macro.yaml   | 72 ++++++++++++++++---
 1 file changed, 64 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index c36caf90b837..848e34111df1 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -27,16 +27,13 @@ properties:
     const: 0
 
   clocks:
-    maxItems: 3
+    minItems: 1
+    maxItems: 4
+
 
   clock-names:
-    oneOf:
-      - items:   #for ADSP based platforms
-          - const: mclk
-          - const: core
-          - const: dcodec
-      - items:   #for ADSP bypass based platforms
-          - const: mclk
+    minItems: 1
+    maxItems: 4
 
   clock-output-names:
     maxItems: 1
@@ -61,6 +58,65 @@ required:
   - reg
   - "#sound-dai-cells"
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sc7280-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          minItems: 1
+          maxItems: 1
+        clock-names:
+          items:
+            - const: mclk
+      required:
+        - clock-names
+        - clocks
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8250-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: mclk
+            - const: core
+            - const: dcodec
+      required:
+        - clock-names
+        - clocks
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc8280xp-lpass-va-macro
+              - qcom,sm8450-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: npl
+            - const: core
+            - const: dcodec
+      required:
+        - clock-names
+        - clocks
+
 additionalProperties: false
 
 examples:
-- 
2.25.1

