Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B963E44CC
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 13:26:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D80A1695;
	Mon,  9 Aug 2021 13:25:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D80A1695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628508391;
	bh=hCjUd7YDRPl40h6fM6YgDI80rzVgqOXLul+2+ohnvf4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zu7LnETfJHuHWrbVFF4YBnHYnFSiw+P7zBUW6jg5BEHc0AzGRT/grQsk/o85npUfS
	 aC72EsxOWQK1UhsTxPTLEGO7JJury7tE7B8Hxq2Zax9JKUSA5/4VlxGZg2Mp+NuVwb
	 Fhv3gH6qTW+1Ku/XBJF5hOSjdhlvxUlpnU6dM4EE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 023D2F804E4;
	Mon,  9 Aug 2021 13:24:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F052EF800CB; Mon,  9 Aug 2021 13:24:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA6A5F800CB
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 13:24:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA6A5F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="AqAucSpP"
Received: by mail-wm1-x330.google.com with SMTP id x17so10322737wmc.5
 for <alsa-devel@alsa-project.org>; Mon, 09 Aug 2021 04:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GJlsWNgwKODDcwAuvO6G0kTnrLu0l5LAblYrz3XnMPQ=;
 b=AqAucSpP64Wqp523ZRIEm3J4hI333t2QbONzQpUWA+SSbPLfkHIBuwpq2bBUhnxoFf
 aIpAsLCdVi09yBVoe8cFD+hF7JNv/aZVby2BT/kOP+oQBkv5pc/ohrc4AwVFOCcHn4/x
 gmY6QO0P7XvX31OcKwQnU97V5ntYy3h4nVEzW3RJgMUhCIfdhzvhN93zDly1t0W5ClMF
 HiahFil4Dmz4udhG+0P9gm9lONOwv+xyI6zrURV09fn76jBjvoChM1wRuG6/IJw5ZXUB
 MYxLQOYLlmYDdBDOaNnl2jqndszCF9uIlBO250q4Z4pwZCJxvlt02htFvR6GOKklGdNL
 qmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GJlsWNgwKODDcwAuvO6G0kTnrLu0l5LAblYrz3XnMPQ=;
 b=hnqw1kArFAJJxLwcnGSE5LRAXt3eDd0GCZx+RiHep09hC86Bhanb3hYWqFmxZPM/h7
 SUhf4Gc59PV0iR7yP93Fl+hnQjsQD6SmpX+NaNcLdaFWaKudGcV3934NDhm6PIZY0YTB
 5PLKDFt6N31kVvxpqirYvvX/c6tjxBYzvtMP3ZsY1V/RSM03JR64sozg5NR8Bq9oQyJI
 uncOMw1zwJb5z1veEIqzqzA1vdWpeMozYxmEZj1yxR3BWyqE3ClpANZlsZMqVPnzEyV+
 izkz65eyCFb6xGVb3o83lm2YNPYtRCGL1DRfyc2KWwzqQ7VlRXF5JRmzZsJhJwvlJ2/G
 QW0Q==
X-Gm-Message-State: AOAM533/zaJztJ/nHV5FsN8giYyWzFrDQxVO6EHorFJon6eQ+8z9MHHL
 GmjaYXdT5klidFcArXSILwaijA==
X-Google-Smtp-Source: ABdhPJxmllkwCuGTjnqSeeelZre4VuKj6ZzUu+qLlWhSfuORp32DIH4+2Nncd9XqXJsMo3c2Byb9yQ==
X-Received: by 2002:a05:600c:4a12:: with SMTP id
 c18mr33748888wmp.9.1628508273222; 
 Mon, 09 Aug 2021 04:24:33 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id b80sm7774900wmb.2.2021.08.09.04.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 04:24:32 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v4 03/20] soc: dt-bindings: qcom: add gpr bindings
Date: Mon,  9 Aug 2021 12:23:22 +0100
Message-Id: <20210809112339.8368-4-srinivas.kandagatla@linaro.org>
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

Qualcomm Generic Packet router aka GPR is the IPC mechanism found
in AudioReach next generation signal processing framework to perform
command and response messages between various processors.

GPR has concepts of static and dynamic port, all static services like
APM (Audio Processing Manager), PRM (Proxy resource manager) have
fixed port numbers where as dynamic services like graphs have dynamic
port numbers which are allocated at runtime. All GPR packet messages
will have source and destination domain and port along with opcode
and payload.

This support is added using existing APR driver to reuse most of
the code.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/soc/qcom/qcom,apr.yaml           | 92 ++++++++++++++++++-
 include/dt-bindings/soc/qcom,gpr.h            | 18 ++++
 2 files changed, 105 insertions(+), 5 deletions(-)
 create mode 100644 include/dt-bindings/soc/qcom,gpr.h

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
index 12650f7084f4..59d8b4dce8b5 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
@@ -4,14 +4,14 @@
 $id: "http://devicetree.org/schemas/soc/qcom/qcom,apr.yaml#"
 $schema: "http://devicetree.org/meta-schemas/core.yaml#"
 
-title: Qualcomm APR (Asynchronous Packet Router) binding
+title: Qualcomm APR/GPR (Asynchronous/Generic Packet Router) binding
 
 maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
 description: |
-  This binding describes the Qualcomm APR, APR is a IPC protocol for
-  communication between Application processor and QDSP. APR is mainly
+  This binding describes the Qualcomm APR/GPR, APR/GPR is a IPC protocol for
+  communication between Application processor and QDSP. APR/GPR is mainly
   used for audio/voice services on the QDSP.
 
 properties:
@@ -19,6 +19,7 @@ properties:
     enum:
       - qcom,apr
       - qcom,apr-v2
+      - qcom,gpr
 
   qcom,apr-domain:
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -33,13 +34,22 @@ properties:
         6 = Modem2 Domain
         7 = Application Processor2 Domain
 
+  qcom,gpr-domain:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 3]
+    description:
+      Selects the processor domain for gpr
+        1 = Modem Domain
+        2 = Audio DSP Domain
+        3 = Application Processor Domain
+
   '#address-cells':
     const: 1
 
   '#size-cells':
     const: 0
 
-#APR Services
+#APR/GPR Services
 patternProperties:
   "^apr-service@[0-9a-e]$":
     type: object
@@ -86,9 +96,66 @@ patternProperties:
 
     additionalProperties: false
 
+  "^gpr-service@[0-9a-e]$":
+    type: object
+    description:
+      GPR node's client devices use subnodes for desired static port services.
+
+    properties:
+      compatible:
+        enum:
+          - qcom,q6apm
+          - qcom,q6prm
+
+      reg:
+        enum: [1, 2, 3, 4]
+        description:
+          GPR Service ID
+            1 = Audio Process Manager Service
+            2 = Proxy Resource Manager Service.
+            3 = AMDB Service.
+            4 = Voice processing manager.
+
+      qcom,protection-domain:
+        $ref: /schemas/types.yaml#/definitions/string-array
+        description: protection domain service name and path for apr service
+          has dependency on.
+        items:
+          - const: avs/audio
+          - const: msm/adsp/audio_pd
+
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    additionalProperties: false
+
 required:
   - compatible
-  - qcom,apr-domain
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,apr-v2
+              - qcom,apr
+    then:
+      required:
+        - qcom,apr-domain
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,gpr
+    then:
+      required:
+        - qcom,gpr-domain
 
 additionalProperties: false
 
@@ -125,3 +192,18 @@ examples:
           qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
         };
     };
+
+  - |
+    #include <dt-bindings/soc/qcom,gpr.h>
+    gpr {
+        compatible = "qcom,gpr";
+        qcom,gpr-domain = <GPR_DOMAIN_ID_ADSP>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        gpr-service@1 {
+          compatible = "qcom,q6apm";
+          reg = <GPR_APM_MODULE_IID>;
+          qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+        };
+    };
diff --git a/include/dt-bindings/soc/qcom,gpr.h b/include/dt-bindings/soc/qcom,gpr.h
new file mode 100644
index 000000000000..1c68906e079c
--- /dev/null
+++ b/include/dt-bindings/soc/qcom,gpr.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __DT_BINDINGS_QCOM_GPR_H
+#define __DT_BINDINGS_QCOM_GPR_H
+
+/* DOMAINS */
+
+#define GPR_DOMAIN_ID_MODEM	1
+#define GPR_DOMAIN_ID_ADSP	2
+#define GPR_DOMAIN_ID_APPS	3
+
+/* Static Services */
+
+#define GPR_APM_MODULE_IID		1
+#define GPR_PRM_MODULE_IID		2
+#define GPR_AMDB_MODULE_IID		3
+#define GPR_VCPM_MODULE_IID		4
+
+#endif /* __DT_BINDINGS_QCOM_GPR_H */
-- 
2.21.0

