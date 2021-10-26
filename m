Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF2243B122
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 13:21:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1D401714;
	Tue, 26 Oct 2021 13:20:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1D401714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635247272;
	bh=RrS/YC9yrka5UPSznR9amblm2X0hN9a4tClp4dX1oN4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J3iesF3QZr0YwGBx4qRsyL8ItGtm1puH7aCc9DqoIAlUcUpm5GOY/XD787Vix2+Ut
	 HAWRs678RCaSPMsVjBAFHDlkP343kv8+nGmhIPtWD1zxdbJikGXRAAEM6pw91+EIAZ
	 08wgWPF0eUvEQ52mgnxzewZOGyG92dW5VV0zfDew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B5D6F804E7;
	Tue, 26 Oct 2021 13:17:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F88DF80524; Tue, 26 Oct 2021 13:17:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16612F804E2
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 13:17:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16612F804E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="NNT79ihZ"
Received: by mail-wr1-x42b.google.com with SMTP id v17so17232327wrv.9
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 04:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2dEl9+MXeU9ILc1heZjgbaev2CRPnvoQ4/YvbAvAmQM=;
 b=NNT79ihZhqCH1NnMfKt396guBBo1Hz43HuY1RcTXXdLru/JiZNRlwkHzZJQYKWf59g
 fm4DtNxt2Zq19wr4QCX3VP1J+iZnX+QT499St4d+ld7y8638sUKvtNXxyykYtwkeCyCA
 H7jMnPTxJX6nsFGZza9bTFYS4n8sSrpPLltMuMsxkXg2ffREBU6uGPDCYYAHTsS0N5w9
 BRbN2wbwCq8HiU1SLGaaJIB0BB4RgbeAWO6iUcE39OuQl5RCOz0C7pPIkT6vab7ATl4H
 jyNZfUdL9j+6w/IMe2/IdA6agLdim3beF8PDdh7ARJAEESO9qlVTOY2VMRfayUiq0G+V
 bxrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2dEl9+MXeU9ILc1heZjgbaev2CRPnvoQ4/YvbAvAmQM=;
 b=cCdLg+LxtfGIG/zALzeIn37t+c+Lo+L/Lz9gNmSP1lZ2L59DOCniOJFoHTkLS4AW0n
 gTJrzbhvlKoTFkZrFwLbwDcm9U45QvWsKi9vbcqym/zs+LI5VIYV8BzkArGF8m9Pa3rw
 qbSO+rd3FIFJIu56ZwAOneOijdfFjBRbVzjpL6lazxG1/8Q/OHCKL8NsTbpH8piz3gkp
 m3nWv4J5Z+KMKjyIar7T4/+3ImYvg7qWP1y/dDErOH0ix6VkpNPPXamYrQhmWS8FPYsw
 bZHZJDrzjsm8ke5l0eqE1IAIad/K3QK1oWEKFYhma1Z2l06lzmhDX/hZ09TgLTqdsBjh
 jR+A==
X-Gm-Message-State: AOAM532jkq+fKBKnRROZ46bx8nQjd0p7LCUSXnosq8ST27bEYBy4cGcY
 AmjostdMJd8o7ZYJdnoBB9ppbg==
X-Google-Smtp-Source: ABdhPJwNCiPDSmBzcf71Ksb3aIT1sAswFCCLLNeiUP7Gqduq1anFTv1p+mYfClnwboSUqSVIbn3+DQ==
X-Received: by 2002:a5d:5259:: with SMTP id k25mr21452296wrc.132.1635247039035; 
 Tue, 26 Oct 2021 04:17:19 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id l124sm355483wml.8.2021.10.26.04.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 04:17:18 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	bjorn.andersson@linaro.org,
	robh@kernel.org
Subject: [PATCH v11 07/17] ASoC: dt-bindings: lpass-clocks: add q6prm clocks
 compatible
Date: Tue, 26 Oct 2021 12:16:45 +0100
Message-Id: <20211026111655.1702-8-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211026111655.1702-1-srinivas.kandagatla@linaro.org>
References: <20211026111655.1702-1-srinivas.kandagatla@linaro.org>
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

