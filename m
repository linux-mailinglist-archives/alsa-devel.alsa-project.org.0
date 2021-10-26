Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9ADB43B059
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 12:42:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E8E016E0;
	Tue, 26 Oct 2021 12:41:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E8E016E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635244923;
	bh=RrS/YC9yrka5UPSznR9amblm2X0hN9a4tClp4dX1oN4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hll9A+SL6nUSyht6mLIDbF94WTjH9odK/+KmMpDF8gxVT/MMFARmnI8roEcNQz+FH
	 Cb7jgXmG1tc97d4hBXflTdIJVdQQ0DrKW77bxibP8Y1NGHL2LL8irAgLusybB/FP4G
	 5y5cc8gxdnPjIhb1/GlKdBK/D+Ln6S76eijY7tUQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90228F8051D;
	Tue, 26 Oct 2021 12:38:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06756F8050F; Tue, 26 Oct 2021 12:38:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 158C2F804D8
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 12:38:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 158C2F804D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Wvj+BKhB"
Received: by mail-wm1-x32f.google.com with SMTP id
 j35-20020a05600c1c2300b0032caeca81b7so874694wms.0
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 03:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2dEl9+MXeU9ILc1heZjgbaev2CRPnvoQ4/YvbAvAmQM=;
 b=Wvj+BKhBm4VGMC7KHzY5id/v4UWwUMA6n8H2QiJ94R/hGlGEHoQhZSBVi67jmc2ufp
 txuZbk0P8Wyyzddgnb6mRHNhe2ZhNiB74oE5B+LW1kaP4hyRJBSd6T2m0LK0HwDj5r0O
 242BNdJtbBCSp3WfGxa0XDHuX5ztXMOboF++uMJG7ruH5RGx4Zq2oInIjkKI1m2R9xC8
 VN5XbAyYiFOJE7wDljbPwAnGeBMo1eMWV+kKA8/yYHS8sdAOIRvI29g7mAIwPA5W4ti8
 WvqnR2TFF0Dh9+jbLxn/LyHibt+L6UPjQdMABWd6rU9ovY4VVPrTZlUmLNN3H1k3Arey
 xsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2dEl9+MXeU9ILc1heZjgbaev2CRPnvoQ4/YvbAvAmQM=;
 b=yH2axz/dup1H3dJSuswSSBQpvlymM0GqprSm77WTSO7aiQdB76UDjd5s6xmedsPdzF
 FkN0x0755zwSX0nzBZ92lYY1zNom95XEbx7qNTsshERhplJZndjkhc2pgGiNwUFvlJHf
 O3O329UdwGXdVR2dZdRInxJnk9xX4sjG2MmTHSALyEp/eeBBKBPbYHBdYuoTb++6LI/M
 u4l6DkSdZSCuXCFp1m67sFhNO5++AAZCVt7MDqp5Cww2pMMixHjyOR/s2xw0NhNpjKHF
 qyvRK/GZM5gVKAKCREbg2dbRT1//2UE2B3hUjgvjQWrRkc4J8eGlEuedc8CRe/JoQzpV
 GpUw==
X-Gm-Message-State: AOAM533vFsvKDV+rkeLlIK3C7XJy3pgOpirAO1ShbmBb8zO6GawtQkEw
 VsOE45nRD+ztsiHpb1D0PHvnBg==
X-Google-Smtp-Source: ABdhPJwoBnWM4nlbZNJEzSZkG657rzRvTmphTxu+do8W6XvZ27EZCHgRUkJwOGCtA4p/p9T5OthBHw==
X-Received: by 2002:a05:600c:4f81:: with SMTP id
 n1mr55547518wmq.63.1635244717523; 
 Tue, 26 Oct 2021 03:38:37 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id x21sm221397wmc.14.2021.10.26.03.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 03:38:37 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	bjorn.andersson@linaro.org,
	robh@kernel.org
Subject: [RESEND PATCH v10 07/17] ASoC: dt-bindings: lpass-clocks: add q6prm
 clocks compatible
Date: Tue, 26 Oct 2021 11:38:05 +0100
Message-Id: <20211026103815.19468-8-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211026103815.19468-1-srinivas.kandagatla@linaro.org>
References: <20211026103815.19468-1-srinivas.kandagatla@linaro.org>
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

On AudioReach audio Framework access to LPASS ports is via Q6PRM
(Proxy Resource Manager) service, so add a dedicated lpass-clock compatible
string for this.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../sound/qcom,q6dsp-lpass-clocks.yaml        | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml
index c686164732aa..f83f00737a2f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml
@@ -16,6 +16,7 @@ properties:
   compatible:
     enum:
       - qcom,q6afe-clocks
+      - qcom,q6prm-lpass-clocks
 
   reg:
     maxItems: 1
@@ -54,3 +55,23 @@ examples:
             };
         };
       };
+
+  - |
+    #include <dt-bindings/soc/qcom,gpr.h>
+    gpr {
+        compatible = "qcom,gpr";
+        qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        service@2 {
+            reg = <GPR_PRM_MODULE_IID>;
+            compatible = "qcom,q6prm";
+            #address-cells = <1>;
+            #size-cells = <0>;
+            clock-controller@2 {
+              compatible = "qcom,q6prm-lpass-clocks";
+              reg = <2>;
+              #clock-cells = <2>;
+            };
+        };
+      };
-- 
2.21.0

