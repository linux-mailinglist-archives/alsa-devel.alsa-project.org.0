Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9C143B0FF
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 13:18:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1BAA16CC;
	Tue, 26 Oct 2021 13:17:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1BAA16CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635247120;
	bh=IgZwZ1eS04lFXZZ28Tmag0IUOrzAuofrvddmbZU346Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lWolQgpRa+YYq/eDVaWgw5Nsmg+2Kq5awzZxjFNcGbhjym+9/UMCRSDHghbJ8yhdx
	 BTul3ixPSoIg8F9d/A7yk2E2N1yoT3U/8UEPwQBqSZ9Jl1FDumg320gk6o71IOO/LY
	 PUL+TLtJNrmgTSch7lx/ummPKWDXtDWN8tK1E4NE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7938EF804AF;
	Tue, 26 Oct 2021 13:17:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7058F8010A; Tue, 26 Oct 2021 13:17:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1ED56F8010A
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 13:17:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1ED56F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ov6MgI9g"
Received: by mail-wm1-x331.google.com with SMTP id y78so8458675wmc.0
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 04:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=imP3Ut5HB4n6q2DrZyy9qRcidcMnxdcc3SMVUqr3MKw=;
 b=ov6MgI9gV7COSq0kYVP4ZsSrqjJeiq0HfmMCQQcG8kV5aBIsI36QFBsNC1fcKiBhhL
 J1Cgk3O9amhDqr3z2g9N+g99KmkwHQmuXJ6j2PWQuRLaK5GY5Ff9H2mbZ5iD0qYWs8DS
 Yc/yMIjIESNzffS9viIusFnhvfCZca2PxPjBpAb+/U7dGSZ0A/W5r0DWtMvUtKwGUGHw
 Ezo7l3w0XgIwYHAImSX2Ffvv5KdR5/Gv03dwuA+3wyxe5vxn8Emi9DhbLFQxPy/dPuDy
 5vfCRi1SazhoJKVv9GlSdp1FjaYLiGffg1BNkMGUvI/LpDbQyFEov/ENWrE8puN/xWxU
 dzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=imP3Ut5HB4n6q2DrZyy9qRcidcMnxdcc3SMVUqr3MKw=;
 b=fy//vvafy98Ohlo/xYovm8SomUMwqo9f3TS9HpTKnuwCETctygEt2C8xlHtfv8xMG+
 0qtPToNPEf+nEA7EVIHOaNs4n7de2YRmWlX2V/upE/eLenYOULTl7c+sJvnBRaF0uOQw
 zGJ9gYj3hgzADa+ipZG/V6y2K/vH/e8KC5PAagLgGealuZGh9uzAu//zwSnivKu+ZV03
 sQn1oIOWhLTwRIDMV92t6QljoqcPoPv6ivINXICZzIouCtxrpeQppaK2QEwhT8KZ9Sbw
 pw8T1so+oVcWO/NLv6Or44ZfomoEXP1TdBgtL34phKVyp0W4zfrnbpmqtKpWkPw51K4E
 tF5A==
X-Gm-Message-State: AOAM530+6C2VWQVRLhWlkY3QEUef2DXW8kqGukCY8RhEPkb7ODrAyXuk
 RApZ1/BmEZbvLm03qIdGCnc2kA==
X-Google-Smtp-Source: ABdhPJznEBREDXrlL8Aam0bc5Y9yna0Tsu5b7n96rkRTPp1ZAtfMK+/M+qsWpMAZLrQKXjp/npgcZQ==
X-Received: by 2002:a05:600c:430c:: with SMTP id
 p12mr21686256wme.188.1635247033166; 
 Tue, 26 Oct 2021 04:17:13 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id l124sm355483wml.8.2021.10.26.04.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 04:17:12 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	bjorn.andersson@linaro.org,
	robh@kernel.org
Subject: [PATCH v11 02/17] ASoC: dt-bindings: move LPASS clocks related
 bindings out of q6afe
Date: Tue, 26 Oct 2021 12:16:40 +0100
Message-Id: <20211026111655.1702-3-srinivas.kandagatla@linaro.org>
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

q6afe (Audio Front End) is one of the DSP service that handles both
LPASS (Low Power Audio SubSystem) Audio ports and LPASS clocks.
As LPASS is a hardwware IP and commonly used by Qualcomm Audio DSP.
In order to allow  multiple DSP frameworks to use these bindings
its best to move it out from the dsp specific bindings.

For compatibility reasons and not breaking which is already working
we still maintain same compatible string "qcom,q6afe-clocks"

Also as part of this change convert these LPASS clocks related bindings
into yaml format.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/sound/qcom,q6afe.txt  | 23 --------
 .../sound/qcom,q6dsp-lpass-clocks.yaml        | 56 +++++++++++++++++++
 2 files changed, 56 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6afe.txt b/Documentation/devicetree/bindings/sound/qcom,q6afe.txt
index fcf81058504c..bc6b5f1fe4f1 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6afe.txt
+++ b/Documentation/devicetree/bindings/sound/qcom,q6afe.txt
@@ -12,32 +12,9 @@ used by all apr services. Must contain the following properties.
 		  from DSP.
 		  example "qcom,q6afe"
 
-= AFE CLOCKSS
-"clocks" subnode of the AFE node. It represents q6afe clocks
-"clocks" node should have following properties.
-- compatible:
-	Usage: required
-	Value type: <stringlist>
-	Definition: must be "qcom,q6afe-clocks"
-
-- #clock-cells:
-	Usage: required
-	Value type: <u32>
-	Definition: Must be 2. Clock Id followed by
-		below valid clock coupling attributes.
-		1 - for no coupled clock
-		2 - for dividend of the coupled clock
-		3 - for divisor of the coupled clock
-		4 - for inverted and no couple clock
-
 = EXAMPLE
 
 apr-service@4 {
 	compatible = "qcom,q6afe";
 	reg = <APR_SVC_AFE>;
-
-	clocks {
-		compatible = "qcom,q6afe-clocks";
-		#clock-cells = <2>;
-	};
 };
diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml
new file mode 100644
index 000000000000..c686164732aa
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/sound/qcom,q6dsp-lpass-clocks.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm DSP LPASS Clock Controller binding
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  This binding describes the Qualcomm DSP Clock Controller
+
+properties:
+  compatible:
+    enum:
+      - qcom,q6afe-clocks
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 2
+    description:
+      Clock Id is followed by clock coupling attributes.
+        1 = for no coupled clock
+        2 = for dividend of the coupled clock
+        3 = for divisor of the coupled clock
+        4 = for inverted and no couple clock
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/qcom,apr.h>
+    #include <dt-bindings/sound/qcom,q6afe.h>
+    apr {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        apr-service@4 {
+            reg = <APR_SVC_AFE>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            clock-controller@2 {
+              compatible = "qcom,q6afe-clocks";
+              reg = <2>;
+              #clock-cells = <2>;
+            };
+        };
+      };
-- 
2.21.0

