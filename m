Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4808362EE36
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Nov 2022 08:20:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D4A416C0;
	Fri, 18 Nov 2022 08:19:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D4A416C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668756024;
	bh=O+EzqeJPw8qt9aqHip1zX32iI27+CFw14OZ6hXnv0Zc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZHxRCfM4X1CP5+vi6Tnz5YbpjDZdpDRWtU/c8gLNPkqfQimfo3h5R2fv9PXfjgMDv
	 8yBVxferupEN/bbFX0stZJz/cxEK1ieOHk+ulkvkZnj88/GrgTgNgVievds4tfbLhM
	 pXcJMuu/KFYe/Ueg63AJwf3geNOb05nDTrRpf+zw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68D3AF800FD;
	Fri, 18 Nov 2022 08:19:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCCF6F804D8; Fri, 18 Nov 2022 08:19:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2075F8016E
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 08:18:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2075F8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="KmXkPxIl"
Received: by mail-wr1-x434.google.com with SMTP id cl5so7872770wrb.9
 for <alsa-devel@alsa-project.org>; Thu, 17 Nov 2022 23:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MFo0v4KNc4REjP1ZSh0NPt20T7LaZ0hO2WW0XyMGjCg=;
 b=KmXkPxIl/R8/F5oT/7mZUORqHKj+sPJXa6wgeXYfzNCuIV3LmB7HVmcOkGGU/c0cRD
 3fIcb1nlL7aSReeophpnLQ7Jf9GQuIi+pqe30bdcJd3958HEL7rc00d1aplmHfOZY+ap
 Mrf2+Ctb23p2TPN4djwVuN2895OKzbemmvUNtZCrV7og7Gdiu67etBGb/GP6hsTgXn9I
 YC1tbNpZwwXvopbmtmC9+Kq9uuSGXtwngoPN62HXj5pQyHzy2UIw8K0X6nb9otZa6/xS
 obOyxsMXkQuCwjyyCBakPosvCrQsJz5Ko+4gHrMMrMWxykn0s7YKclL7nkLdS1WfbFvx
 Qr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MFo0v4KNc4REjP1ZSh0NPt20T7LaZ0hO2WW0XyMGjCg=;
 b=hkfTz/3aj9FdqNqALgT+wN+1kGbWc61y2JmEsJkH/ryPBv0MhA5ZOnvehHc++Gh/j9
 bJWDtuEtwgYol6I0peQwo5+3B6WPbQ2Qn6TpYgByEmeU8Qot0Ey+fUWHIEfE/7Nb/cy+
 GYS0gWXETTZ69q4gDPkNHbS81RcBjQaukKfkVClESMNdMi66wh3k1S0fW0PuIp057uu1
 eyFBkPg2c7YljyZ7l1Ot4PQ0RZznk6eLJfJioQxPEINGaO1r44P2EXtPJNi+LknzZ7uW
 NJrCJ5ZTqVibgrnJQhe8qd9MVUjLjXoaO120FDNEkbPrvrNJyFJL0S9J1aAvM4NLQu60
 v6jQ==
X-Gm-Message-State: ANoB5ploQlnHZXMRVUqOJDHxxLrFUK8yTrWB2LbpA9j33ANNbdL5uVfz
 IUJA4hQvm0d9fMhj7iupUORx+w==
X-Google-Smtp-Source: AA0mqf5zFz7PnrSQFfguNBbj0H3t7AhE02V4UlfSsryCTAVwFxwhryqUZGaaREdA9buZL/wnfwEhXg==
X-Received: by 2002:a05:6000:1c4:b0:241:792f:a914 with SMTP id
 t4-20020a05600001c400b00241792fa914mr3478420wrx.117.1668755935610; 
 Thu, 17 Nov 2022 23:18:55 -0800 (PST)
Received: from localhost.localdomain ([167.98.215.174])
 by smtp.gmail.com with ESMTPSA id
 j16-20020adff010000000b002302dc43d77sm2754349wro.115.2022.11.17.23.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 23:18:55 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 1/2] ASoC: dt-bindings: lpass-va: add npl clock for new VA
 macro
Date: Fri, 18 Nov 2022 07:18:48 +0000
Message-Id: <20221118071849.25506-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221118071849.25506-1-srinivas.kandagatla@linaro.org>
References: <20221118071849.25506-1-srinivas.kandagatla@linaro.org>
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
 .../bindings/sound/qcom,lpass-va-macro.yaml   | 63 ++++++++++++++++---
 1 file changed, 55 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index c36caf90b837..288a1d5ad585 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -27,16 +27,12 @@ properties:
     const: 0
 
   clocks:
-    maxItems: 3
+    minItems: 1
+    maxItems: 4
 
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
@@ -60,6 +56,57 @@ required:
   - compatible
   - reg
   - "#sound-dai-cells"
+  - clock-names
+  - clocks
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sc7280-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          items:
+            - const: mclk
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
+            - const: core
+            - const: dcodec
+            - const: npl
 
 additionalProperties: false
 
-- 
2.25.1

