Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB9E439D5B
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 19:19:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11D7016CB;
	Mon, 25 Oct 2021 19:18:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11D7016CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635182366;
	bh=RrS/YC9yrka5UPSznR9amblm2X0hN9a4tClp4dX1oN4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h7gWX9carsllWwdGIriri5S2YamLsr8uob2cNIlcT3wpFgPKXg0WI2G05t4lT6Z8H
	 pDbpcIWz5s5QLW85BM3ngcko/pav/OuXXoQ+8LvsxDuP0W75Q6MBSVGh0VIl53kcG1
	 cik1eBbz9kOcDjhGvAdODnunOUHFX1z+r+Dkuwe8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 499B8F804FB;
	Mon, 25 Oct 2021 19:17:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53869F804F1; Mon, 25 Oct 2021 19:17:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF5A3F8025E
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 19:17:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF5A3F8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="c7RQ8N0F"
Received: by mail-wr1-x435.google.com with SMTP id z14so12976550wrg.6
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 10:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2dEl9+MXeU9ILc1heZjgbaev2CRPnvoQ4/YvbAvAmQM=;
 b=c7RQ8N0FckCPbiqFmHr2Iee9AMNPrl3pD5lRc9eL4NfuUR4tJMPIpLdgheVNyp3FAA
 o9FB3TUhWLz1cx7GqAhZoTqGkYiVNj/4edPQk2bu3one2Ppfr9HB38N6a6hzKYyWfQye
 dv93GlgjGXAWyXLfVfx99JD/Gcy5qCytQP5aXWO/eVdOSlNzLUOfYTreckiDNquPcId9
 DqSyhHiwArAKvrbOPbPYrWgntQFfNa69b+Yq8klM0dF+XzRSKnmEccf+8HhAs4exaXCW
 QNo01v+bjebG2NUkdO5AF5SiCUWQff1GCAbuOypNPHaQgnDYjMIvsdIr0NbJY27fVb9N
 7eAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2dEl9+MXeU9ILc1heZjgbaev2CRPnvoQ4/YvbAvAmQM=;
 b=zXz0T71IztLVTpKCvqoYhJrp7j0u8P/L528x5c406768um4hyn8eNZaoAf68WIUfZX
 0FomafOrvbxDdX8dACK1y7KOiTbK4JFcJoafPM8h9EkaZ0DwfZzyW/+NpMeddBQ3XQ3L
 tI7EcN/8UExMyF/IgvXI+7T5blqo3dm+QR16+2IPE8WeLPAZHQ6yKHHgSxKY8V8mzxQR
 96RowMoZU9Zf3cnihaDwDb8BCaFpulZOFdw7aCkIpfIK2JbzAb51FPqOhSx6S1Zm/oqK
 4L8vUSbqpllkMNKYOMp4op8yy6sZIauaENuK+fgMGn4Kqc31TFwA8iks2uzfVB09nY6d
 KsCQ==
X-Gm-Message-State: AOAM532AT6uMEDryjISprtm2JE+Z6jnitP/q+ozqjPgevU5/Ld9zw27J
 1xToJ+1Pm+qiu4qnLF9M5cOgFg==
X-Google-Smtp-Source: ABdhPJxasgPnoZsU+rgkUSB9kBqOkjrEXkuiCJapUg3WymuMefB64lEDzsdpNjAzVUPsD3JokBaOjQ==
X-Received: by 2002:a5d:528b:: with SMTP id c11mr24672248wrv.35.1635182237960; 
 Mon, 25 Oct 2021 10:17:17 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id r11sm5181012wrt.42.2021.10.25.10.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 10:17:17 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	bjorn.andersson@linaro.org,
	robh@kernel.org
Subject: [PATCH v10 07/17] ASoC: dt-bindings: lpass-clocks: add q6prm clocks
 compatible
Date: Mon, 25 Oct 2021 18:16:39 +0100
Message-Id: <20211025171649.17730-8-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211025171649.17730-1-srinivas.kandagatla@linaro.org>
References: <20211025171649.17730-1-srinivas.kandagatla@linaro.org>
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

