Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 587D640C621
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 15:17:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEF1B17C7;
	Wed, 15 Sep 2021 15:17:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEF1B17C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631711873;
	bh=6S4MMf0P9KUf4QLmZga52h7TMUJCzxWqw1kXeq7znlo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BwIw83ip94W2jd4HwPhwHwLeXD0I2gGJUbJ9DhBWKzby7KaSRtg0FXFFavNQm8k0y
	 tIxz/tI0PqtAhU4DUvduXlfhb2yDBclwPAslldhSnJLljzkF2YRHXVaKbnCinZATlw
	 8y1Q/Xy8iVf2Hbvk1Ng1B12KtTpjyKc5+t7qnlsA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8133F80519;
	Wed, 15 Sep 2021 15:15:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3DA9F80227; Wed, 15 Sep 2021 15:14:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67DADF80227
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 15:14:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67DADF80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="e+XMGdan"
Received: by mail-wm1-x330.google.com with SMTP id 140so2178093wma.0
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 06:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JXUzKXqyFK0FF7TuDfDOhSheb5jJRieIFIcaHFlaH0I=;
 b=e+XMGdanY0/eYMfrz4B3FQ9ISacQb6ccxeueJqMUhtHmyU9qA1kps040zqO18Wlvwr
 xx6kY8y70AbTje1rYu3Fo2KwmZR3QPH6W42JunwVLujhvnb/Rn0hC2tdB6mVRYMLniIc
 G0e6Tvpd6AY9wllU9deFQf0brVfPXYONteDNcbaWRCx/n9DYiTBdkLaeHzZj1QwS+/0V
 LM4dpJSfqT8mCrYxecywlTc4Jbv6f8mnp+lXCOMhxTGapvSC5926yOCrjEf3H/lwXbKE
 XQEJcM+AIJHws+0RnMYDQ3mmoTHOktxze/nzpHbUuqDe/p33WkbMKuD6eG0wcGYnr4+x
 bIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JXUzKXqyFK0FF7TuDfDOhSheb5jJRieIFIcaHFlaH0I=;
 b=w8Qwxb5tc58LoZk8QwyMfRasAIoL1kaLHiBwhgH/w1nrmdFFkE7pr8Mdy93yuQtC3s
 jJ+l8OfHKc6GFqttraVpkD1iiLOHoa8VsCv6y02EnwUI5p0qYchqiezcEdpeHqfzGAWN
 4Zo+if2B8L3oDLrFxjcAMcR8n1TtPi8L/Qjjtd6xfr4jVIuYkTLqkKkpxhvrZhO2vZWL
 hqA7te1stSzykW0ppTUQEY5AZ+GgFgEEoNRAOLUxQn/OBBjBKGj0p0eJNK7tI67ryfwb
 wpzF9I5DExC3EAK4LAtf8xan58HzVuYoECXZLpirFq6HC5/lTrxMyZTq/Wans1sDAol2
 Rh0Q==
X-Gm-Message-State: AOAM530t6/klmT5rRqhflue7elwR9WyYiOWEk/+/SRpMoEsi8+hmNCRA
 rgBIPi6FpX7QY6DI1h4N39rZWRcNB6EW9Q==
X-Google-Smtp-Source: ABdhPJyHhGNdmGfTv9wtq6gJn80pNJ9SBtwDPfGsQybAYgtpi/0Bld6HttsqWC613iZsz2rWX+dseA==
X-Received: by 2002:a7b:c3d4:: with SMTP id t20mr4382511wmj.27.1631711680290; 
 Wed, 15 Sep 2021 06:14:40 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id m29sm14501717wrb.89.2021.09.15.06.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 06:14:39 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v6 02/22] soc: dt-bindings: qcom: apr: deprecate qcom,
 apr-domain property
Date: Wed, 15 Sep 2021 14:13:13 +0100
Message-Id: <20210915131333.19047-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210915131333.19047-1-srinivas.kandagatla@linaro.org>
References: <20210915131333.19047-1-srinivas.kandagatla@linaro.org>
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

replace usage of qcom,apr-domain property with qcom,domain property so
that bindings and driver can be reused.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/soc/qcom/qcom,apr.yaml           | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
index a52b955b8b39..bfe04fca8aa3 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
@@ -31,6 +31,21 @@ properties:
         5 = Application processor Domain
         6 = Modem2 Domain
         7 = Application Processor2 Domain
+    deprecated: true
+
+  qcom,domain:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 7
+    description:
+      Selects the processor domain for apr
+        1 = APR simulator
+        2 = PC Domain
+        3 = Modem Domain
+        4 = ADSP Domain
+        5 = Application processor Domain
+        6 = Modem2 Domain
+        7 = Application Processor2 Domain
 
   '#address-cells':
     const: 1
@@ -96,7 +111,7 @@ patternProperties:
 
 required:
   - compatible
-  - qcom,apr-domain
+  - qcom,domain
 
 additionalProperties: false
 
@@ -105,7 +120,7 @@ examples:
     #include <dt-bindings/soc/qcom,apr.h>
     apr {
         compatible = "qcom,apr-v2";
-        qcom,apr-domain = <APR_DOMAIN_ADSP>;
+        qcom,domain = <APR_DOMAIN_ADSP>;
         #address-cells = <1>;
         #size-cells = <0>;
 
-- 
2.21.0

