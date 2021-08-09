Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F9C3E44E4
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 13:30:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 968E116DF;
	Mon,  9 Aug 2021 13:30:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 968E116DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628508653;
	bh=M75VjAePp5xxN6vkI3+ydrgQkMRpP9j42m6a3+3YrME=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MJ6vlNcGfkK4gRzorg1FbAPWrJKerMwDbU9+qryab319nklS6USMgR39h8u/7YPgj
	 u3J61DrlsxWJOaVW0x0d0lHAp5G4v0+LBvt4bobUZOFhiT0UpKTr/l5R+k+O7s8sDe
	 VqSYhqYT3AdOCx2nOY5mILmXHy+70d3S+hUniW80=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 318A3F80553;
	Mon,  9 Aug 2021 13:25:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33965F8051B; Mon,  9 Aug 2021 13:25:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B9E2F804E6
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 13:24:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B9E2F804E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="QvD7nzEs"
Received: by mail-wm1-x336.google.com with SMTP id
 h24-20020a1ccc180000b029022e0571d1a0so11281506wmb.5
 for <alsa-devel@alsa-project.org>; Mon, 09 Aug 2021 04:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XrcdWigOrJBOqNH3/v+b+R+GIipVI1XmPMk0yejMbMo=;
 b=QvD7nzEsRjPxWIit4L+5LSu2gd9d6gRBzyEs62A9RprUqA7t93ZQYfBB8exftwlanp
 utU2hVroQTDCfKGMMvl5VTBBgXbfmxNXakmSdIvZKUvgPzlS4fqxzp30eWRo8cSMJgLh
 KkCUuE5hTj03XSh9APb18Q8jm0ZTFC9yR9+BEBSdCdNt93Z4eneBlo4T0Oge6BnueqIV
 J1xOHcPaU6K0WjZrXKnfM+2gUcohcMdSRlPKdRcptIjkACZsgBlSp5O1ujOgeopzrNpO
 GANjUwKEw8THwQl9q19+rGa086BjRA99v2MPvbDK7PDIoKGeGCL1SRrY11ucqOnzRy4h
 gH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XrcdWigOrJBOqNH3/v+b+R+GIipVI1XmPMk0yejMbMo=;
 b=b6HLOktgoyUraCzzJ2y+SWY1BHNMR8bDqhTCa/4kFuz8mm/rm82NQ37Kj1MxuAtm9y
 EAlNVL4iWVHUEVsY+3bs68QhiTk+eu9dSZiXzydOPoKB31pbV7YKSCL28xNe4xsp1lwn
 juUbcf97Hawi8kElnff7AJMbc/Au0pDyfWrLwDVs695q6Pppe+LADPwrxcMnAKROzfHX
 m4HDL3ODPTkFNt4cKgN2sO/uJRM5iUV1/NV7Z/WjDiLPPjPOA33zEI7TaTyVzgNdu56p
 Cw1vu9iF74kNrf+EABkvjm1HyllpRVjN/1M/UDjLObWgpR4LW9u81cMnkhWhLwWwoCE6
 02rQ==
X-Gm-Message-State: AOAM533xRgz06uxUj6mrVvHR2CzfyNtsky2IWr/T9YlgBAFo88ewAzHr
 bzr4VyCmvzyWcmGa5Tqv4XkuWQ==
X-Google-Smtp-Source: ABdhPJwRBWDY3oYEYKCgAsSGYyPBG7FIKQUZ54kmuDdnJtSQgMaJKUTYWxH++BLxGb2N1PqZTw+E+A==
X-Received: by 2002:a1c:7907:: with SMTP id l7mr33250294wme.87.1628508282678; 
 Mon, 09 Aug 2021 04:24:42 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id b80sm7774900wmb.2.2021.08.09.04.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 04:24:42 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v4 11/20] ASoC: dt-bindings: lpass-clocks: add q6prm clocks
 compatible
Date: Mon,  9 Aug 2021 12:23:30 +0100
Message-Id: <20210809112339.8368-12-srinivas.kandagatla@linaro.org>
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

On AudioReach audio Framework access to LPASS ports is via Q6PRM
(Proxy Resource Manager) service, so add a dedicated lpass-clock compatible
string for this.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../sound/qcom,q6dsp-lpass-clocks.yaml         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml
index 589c3f1e2008..9f3de2307d1c 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml
@@ -16,6 +16,7 @@ properties:
   compatible:
     enum:
       - qcom,q6afe-clocks
+      - qcom,q6prm-lpass-clocks
 
   reg:
     maxItems: 1
@@ -54,3 +55,20 @@ examples:
             };
         };
       };
+
+  - |
+    #include <dt-bindings/soc/qcom,gpr.h>
+    gpr {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        gpr-service@2 {
+            reg = <GPR_PRM_MODULE_IID>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            q6prmcc@2 {
+              compatible = "qcom,q6prm-lpass-clocks";
+              reg = <2>;
+              #clock-cells = <2>;
+            };
+        };
+      };
-- 
2.21.0

