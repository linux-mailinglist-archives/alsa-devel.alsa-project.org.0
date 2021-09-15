Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBF340C62B
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 15:19:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D09FB187A;
	Wed, 15 Sep 2021 15:18:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D09FB187A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631711987;
	bh=FTNshx8mgD/4dsjBE7iHgoCsCH/9Xhlk/9MW2GTlrRw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KmL4Gp9WtHWdu/2SD8gVzWkTsPAGAaluWMHKt5+/PXWBYIJv28/ay2mhZiN/SC0KE
	 o80g9BoYU9VCtSpXB5Rqv9Dlh6WQhP6fwC5GBCknuZy75VxlNKif2beO1vcrHOHlM3
	 7Rl6t+KQMEn6c4aWwCdosgtWWDyk9TTfOBEMTCHc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E783F80524;
	Wed, 15 Sep 2021 15:15:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D4F6F80528; Wed, 15 Sep 2021 15:15:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D388F804EC
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 15:14:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D388F804EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="VKAKkRSc"
Received: by mail-wr1-x42f.google.com with SMTP id d21so3807332wra.12
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 06:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0TebeQ0TXJpETl5yyZtrFs6HbXMx9cchKOW5rtUhE/g=;
 b=VKAKkRScP2Ss7XNPItGNsO1kHw6FNFTif5cWTVXhySk5F6VRJ+fLUog7QgeiShPYUO
 mUGT7+IkarbckNzxoqp1V70mN1dB76PTVj5vvR1h3zV/4NX0U2MtxYAHauRfwPOFaiwE
 csDWwu6irQRRt0n7bvz0AkWEPP0YzHgVGhXJAOm0akilJsumku1paDzbNAbtH0CHT9bz
 uThRfPR306qXDNCp3JOpFADItDX7fi0XcFQK1psecoQQfiLRu9Z7gQDPiiUJIBj79rN3
 DRv8OYFTlWjlCeEoErQq1qkR/sz9ICbFKwZdQFYwXABSA6XYhBjgnOjTENtQdYoXk0uc
 WlEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0TebeQ0TXJpETl5yyZtrFs6HbXMx9cchKOW5rtUhE/g=;
 b=CJVLA0ynY+hKrKHBYl5CVWUjsFoisAM/iezjIzT3IuJA8sUgtYYb4h7Gcj5wls2eet
 jKIXtX6Pn5mUpiBUyu9Q4/i+nK4Y0fzXMptTFugaLouxmfgq9ZmQBSe3ZMM65Mv0u4DH
 CNvnyVrziIgoajn4sUqAMPfRt/CgBykenSpWTQaM0mmkwEJ5MssDh0WSgYP/PV2Bh89p
 BxDHbU18gXISqzuGHpQyGcguccCWj9art0Wgq5il33Gnd+S928Tc08rPX2KGV+ug+hAI
 XozVhlMbHAm0flSpjBBXnO56fwobSywEYFhispXWQ45RgfRwx/UKvKapmahY36LKzM/z
 JE5w==
X-Gm-Message-State: AOAM531q+Hin8kIEKE+kLfXGy0SJduqqu3DbLtfSoBzqip5l2QXkUzil
 B7zXl5hb43kCdcI1GY3IddsQYg==
X-Google-Smtp-Source: ABdhPJzRvVjmGkM2gGD4eHqpCGRKQ+3zxZuPZt2KTU+h45aC3THfvytrxcYbt4QFm2YyCW6n7kE+Ag==
X-Received: by 2002:adf:c550:: with SMTP id s16mr5138535wrf.25.1631711694296; 
 Wed, 15 Sep 2021 06:14:54 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id m29sm14501717wrb.89.2021.09.15.06.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 06:14:53 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v6 11/22] ASoC: dt-bindings: q6dsp: add q6apm-lpass-dai
 compatible
Date: Wed, 15 Sep 2021 14:13:22 +0100
Message-Id: <20210915131333.19047-12-srinivas.kandagatla@linaro.org>
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

