Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A23033E44EE
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 13:31:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C5BA950;
	Mon,  9 Aug 2021 13:30:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C5BA950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628508681;
	bh=PDf4ewXa1BS8Dm+pNigha4faNn5+mlXw7i6TKmnzs5Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QhjRTfb90ZDPmZnbER7PVGfXseJzXqc5VFzlYDzQoHz3/nvKtab6pO9AXsjwRp1Nv
	 mQgtBjSofbFRt9jQRJbYAr4hvgrkhCCCiMTDgoN07KLXogKiIeDR+fHlH7NNIs697r
	 KTnf9efaz2yCN53ds01cvJ91+X9gGs7ShVpnEET8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7E83F8055A;
	Mon,  9 Aug 2021 13:25:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51413F80518; Mon,  9 Aug 2021 13:25:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7AF89F8032D
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 13:24:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AF89F8032D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Fn/HFDIr"
Received: by mail-wr1-x42f.google.com with SMTP id l18so20953347wrv.5
 for <alsa-devel@alsa-project.org>; Mon, 09 Aug 2021 04:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZwS0pTLfaYvtmnmGSPY2CWYSjvjRmgOXbJ+a8m+7l0Q=;
 b=Fn/HFDIrduoeAGIvQSZhyW2UG9VaxI5LU+PWDnufGBpxXxlf/YpRPsRo59OwwnX5iw
 wLmyRO+KoxArio0pb1VPTu2JlhgG07/ajfrGcA0YMgAuUcC3bjtGvY4gEg5UGp/qZSOn
 2CFjt4mdALYXPsqGjWGcL4Oh1RaeupTcr3iac2bOC3t4ZTZguB2XZxHwm4kPfwEWfQQl
 UDB+xqPgB9zFlHbBSlp5A7mOSNAdfXZ0fgDQ7+dhuTwmZM1Ko/OEL+KOGj0rlxXWjtj7
 fu6j+LIrfrSbbDqKDq+Cg83rNmAUe5US0jBe30s8IkJlNfupmWdPZSFAlmsGFtfFWpS+
 P8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZwS0pTLfaYvtmnmGSPY2CWYSjvjRmgOXbJ+a8m+7l0Q=;
 b=MK4/PP+LHyNTffzyRNvLinOTi0+ekxnu4lnBrNQOK3Ovn2o9RBuTBycu+u65htjW1x
 VBpihf+QUV7sQCBB/jWhVDDIchXWUEMWBBoIYeXWTaPFjsqYiDXLpL/VJSGWfJPkcsTP
 qf885CDkL3SPxlA16K8aTeCnDyS9EDlChhupEsqhY76pvqFTdNbw8NxUO39YQDdsQXm0
 yge0HCCP3AC9bm2fPna3qk7PAZFEIPxqjU95OMcRXech5FxG89P1gUxe88tUvIJv1GSH
 NfAXNGCIEFyX7zHAtCJkFLGbp7X2yoHSobUM+C2NvqHc91x5uHi6d5zD0rhuOrLroMA0
 DSTg==
X-Gm-Message-State: AOAM532VOk071zSFWsDuRkxKZqmXKKNO0yMVoc2V8gjVrhhQC9eWKGk1
 Ijb++qe+h25miBRsrysRmL0KtQ==
X-Google-Smtp-Source: ABdhPJwCI67MRfUSvaUQJxvzTEQtCf5CHHvpolvSbV3NQXq5iQxqzFIN+gPrx6Oh1OXcMeXhOaoDjg==
X-Received: by 2002:adf:a1ca:: with SMTP id v10mr6532991wrv.177.1628508281682; 
 Mon, 09 Aug 2021 04:24:41 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id b80sm7774900wmb.2.2021.08.09.04.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 04:24:41 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v4 10/20] ASoC: dt-bindings: q6dsp: add q6apm-lpass-dai
 compatible
Date: Mon,  9 Aug 2021 12:23:29 +0100
Message-Id: <20210809112339.8368-11-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210809112339.8368-1-srinivas.kandagatla@linaro.org>
References: <20210809112339.8368-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com
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

on AudioReach audio Framework access to LPASS ports is via
Q6APM(Audio Process Manager) service, so add a dedicated compatible
string for this.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../sound/qcom,q6dsp-lpass-ports.yaml         | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
index e6148c17419b..92a641dfe04f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
@@ -16,6 +16,7 @@ properties:
   compatible:
     enum:
       - qcom,q6afe-dais
+      - qcom,q6apm-lpass-dais
 
   reg:
     maxItems: 1
@@ -169,6 +170,29 @@ examples:
               #size-cells = <0>;
               #sound-dai-cells = <1>;
 
+              dai@22 {
+                reg = <QUATERNARY_MI2S_RX>;
+                qcom,sd-lines = <0 1 2 3>;
+              };
+            };
+        };
+      };
+  - |
+    #include <dt-bindings/soc/qcom,gpr.h>
+    gpr {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        gpr-service@1 {
+            reg = <GPR_APM_MODULE_IID>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            q6apmdai@1 {
+              compatible = "qcom,q6apm-lpass-dais";
+              reg = <1>;
+              #address-cells = <1>;
+              #size-cells = <0>;
+              #sound-dai-cells = <1>;
+
               dai@22 {
                 reg = <QUATERNARY_MI2S_RX>;
                 qcom,sd-lines = <0 1 2 3>;
-- 
2.21.0

