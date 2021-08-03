Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 967843DEE73
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Aug 2021 14:59:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3BCD17AA;
	Tue,  3 Aug 2021 14:58:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3BCD17AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627995543;
	bh=+dkgU52cVby4N69KEbOntoE9pwg/akwjaJElmBvfgMs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r20X/lKGuTMWOgxiz5rvlSPU3fakb1oZv4l2xMaurT1xdnOR75DFzmcrFJeP9tEmT
	 0Ni9s4xOCwLn8CHtUP1M/fhM3l7ATsqIvFyIxPLvDfGZU9Pqmtnsp3YfVE5iJQsD9D
	 vny1lbOfSN/bNO3SGG4aSWC/f1Th9d/JjQxJ/tk4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69E08F8052E;
	Tue,  3 Aug 2021 14:54:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23965F80516; Tue,  3 Aug 2021 14:54:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A68A9F804E6
 for <alsa-devel@alsa-project.org>; Tue,  3 Aug 2021 14:54:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A68A9F804E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="nVyh6G47"
Received: by mail-wr1-x433.google.com with SMTP id h13so11740348wrp.1
 for <alsa-devel@alsa-project.org>; Tue, 03 Aug 2021 05:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IlmDW4jjHYqf7npFSuyYq2N19CPmEjH+lYW7doFg1hM=;
 b=nVyh6G47UYVGSE9L9QqWstwZFdNMZR+jq6FcKPWrcowYJRQdH50mxX6IPAkF+Kaero
 +rgy/7MxhgAGS9b7gMW0/aOcD2rl8jvn+NETDRljOZk6OYYNL5l98rlaenUR1BSaBDUO
 iDtSPUBamua35GpML1/iy+EYZlnWOvb/3gS6u2DBZQqr6h+wVhDeH06besXJt6xa8oVm
 iP9OkyneXHaUw+uwutuIYYsDxW1kL9Dm6jLJZs8DV1uQH/NnutCxTiO5JZa3PJol26Uy
 lik4Dh8k/p9YUQoxESXANq1yfmLVwhfs+TYf7igzAmgC1ff5O/ORul8wp5BKDmgXU347
 YAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IlmDW4jjHYqf7npFSuyYq2N19CPmEjH+lYW7doFg1hM=;
 b=X3ZUqqy59lZVBH3GpiF/xZJSGUpVCPp4G7FGnaHsuGGI1dlNeU1iXnIRCO1VE67QkK
 9pS+5Av0UxtOH38uXd3cUGz0tHRmudZG0eyr6t8U9r10SvU9nw8MeU7/aDsscqM7VqeH
 z0WAEDZWZnaKXUmNKt+aRBQ/aQQzDJLDPHfTiLjmBoTedjWk5PNGLDjkKGoZoQUNwux1
 bRmObpVUr1Y+9B16X+jMDIO0GcE+wiDmCaAGUgKlbmRNSwhYfebkU6d85cXh0RrCmAwA
 KNDgl8XX3LApH3wFEYg1sxOiPXwGKcz97y4MRjOmYeYY+PPfkbisp6g8iCvnDkAy62Cz
 W+1Q==
X-Gm-Message-State: AOAM533ti1qHrz5DeUQ6D0F/EC7XsIw1WsD+FPdUnZBfyEYrjxLxQpCs
 veF8XJIfbAS+RXHO9NpHd+bbwA==
X-Google-Smtp-Source: ABdhPJxs45mKUPPN4nXgD/va3gEMHh1SAfuQBQ4Bm5BBqAugpV9ll94j2e5GavFplgUWipuCnrrt/g==
X-Received: by 2002:adf:ed50:: with SMTP id u16mr22855123wro.174.1627995276270; 
 Tue, 03 Aug 2021 05:54:36 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id h14sm14695574wrp.55.2021.08.03.05.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 05:54:35 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v3 12/20] ASoC: dt-bindings: q6dsp-clocks: add q6prm clocks
 compatible
Date: Tue,  3 Aug 2021 13:54:03 +0100
Message-Id: <20210803125411.28066-13-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210803125411.28066-1-srinivas.kandagatla@linaro.org>
References: <20210803125411.28066-1-srinivas.kandagatla@linaro.org>
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

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../sound/qcom,q6dsp-audio-clocks.yaml        | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-audio-clocks.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-audio-clocks.yaml
index 03ab7451eb1c..c4814ae00712 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-audio-clocks.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-audio-clocks.yaml
@@ -14,7 +14,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,q6afe-clocks
+    enum:
+      - qcom,q6afe-clocks
+      - qcom,q6prm-clocks
 
   reg:
     maxItems: 1
@@ -53,3 +55,20 @@ examples:
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
+              compatible = "qcom,q6prm-clocks";
+              reg = <2>;
+              #clock-cells = <2>;
+            };
+        };
+      };
-- 
2.21.0

