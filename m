Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F914195CC
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 16:01:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C39916D4;
	Mon, 27 Sep 2021 16:00:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C39916D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632751277;
	bh=FTNshx8mgD/4dsjBE7iHgoCsCH/9Xhlk/9MW2GTlrRw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aKJsVDCVQYmakUHLdYDeoKmsL0M0VF3QhQEZDNf1h2URPOSb21ApFOmiXin3LC+mO
	 zZ+cuntj3oYf5AFbUKTuMPu+bKfXuYsJSLjaQHqWeq9Rhi6E7PmVw3jNPPUfB27An+
	 NRaTx0qbygsevB80XKpbNjKniiWCJDIjv/w+m644=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76BE7F8053B;
	Mon, 27 Sep 2021 15:56:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FF6CF8051A; Mon, 27 Sep 2021 15:56:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33609F804FD
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 15:56:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33609F804FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="aD4CvHR+"
Received: by mail-wr1-x42e.google.com with SMTP id w29so52004085wra.8
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 06:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0TebeQ0TXJpETl5yyZtrFs6HbXMx9cchKOW5rtUhE/g=;
 b=aD4CvHR+ZQkz5XAu0OSPF4jHMzIIAjOJIpI8+E8VvLfsjwiXTzETWzSI/VPbF4rfJi
 2tBr0a6hoMbGlToBypfkItdLKZxgP9xUtudU3R0mwRZf+L0s5XiOC+Dcp3sxBxWQnTJL
 5Yx6mx0SRoyPv4Ndx9OCVjlXdQjLK7EGoMuh9wEu/ytPwTStgJ4b2+GhsM+EBaLeD0H6
 DdmULyIUp+LNh7i3C86ViHINrXtqg+gp7gbeBRk9TSo7ve9VBWahdsdI7pU7TbAlLLgy
 WAO5pUV00ePKVxD5vU4i63aBsswUDHOPuGoyVcQmIf1ENrx08eowXb4Een4XbTIbKymY
 q2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0TebeQ0TXJpETl5yyZtrFs6HbXMx9cchKOW5rtUhE/g=;
 b=o0tqolpuxSLpB+uYQhiSvhkNqqw3NZmcXpYgkQ0D9SoNeMd+PqgctcMaHfPwrPmXC1
 z7DKri1MnqxUuBBLfqGsmovXnUh6VUA6LWCz74h3eZ7S8p2XtAmE5eL1CZ1XZqldAwhc
 PYnZ9b3T9O611mkEe6mI5RwYSa5cVD4k+KwqSxWYdNN4ECsLIjvcihbnfn7fL9mXB8xK
 7OW2AqGO5dYh6aaZ4nW0fE3yHnbWaa46JghUGEUKHR5oPQT7nA3xM+WBU7mDjKOO6dtj
 IXdqcVhyAULHm2iqDRj4L4l/qR+Fu5JwUmcrS4wwyI/HJNZ/WQmCKqyQ0YRj0OloCCh2
 AIoA==
X-Gm-Message-State: AOAM531Sfo53a9zRoo2gNPi0c+tU9kn8jWqT+wRXzkJyGootuY4SHnXP
 pHqQ2UEQ4Wskp8dUU+hHXOGfGg==
X-Google-Smtp-Source: ABdhPJy1lXMT8mdMnx+FjqmzrE3eXkoohZj4XsTJEzS6wy4nlayEvgd2GitTbf6qsZ+5junzUxljyw==
X-Received: by 2002:adf:ea45:: with SMTP id j5mr15408688wrn.291.1632750996922; 
 Mon, 27 Sep 2021 06:56:36 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id b7sm20485606wrm.9.2021.09.27.06.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 06:56:36 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v8 11/22] ASoC: dt-bindings: q6dsp: add q6apm-lpass-dai
 compatible
Date: Mon, 27 Sep 2021 14:55:48 +0100
Message-Id: <20210927135559.738-12-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210927135559.738-1-srinivas.kandagatla@linaro.org>
References: <20210927135559.738-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com, tiwai@suse.de,
 plai@codeaurora.org, pierre-louis.bossart@linux.intel.com
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../sound/qcom,q6dsp-lpass-ports.yaml         | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
index e6148c17419b..dc7fba7b92d5 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
@@ -16,6 +16,7 @@ properties:
   compatible:
     enum:
       - qcom,q6afe-dais
+      - qcom,q6apm-lpass-dais
 
   reg:
     maxItems: 1
@@ -169,6 +170,32 @@ examples:
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
+        compatible = "qcom,gpr";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+        service@1 {
+            compatible = "qcom,q6apm";
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

