Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4586D45C0
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 15:27:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 956647F4;
	Mon,  3 Apr 2023 15:26:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 956647F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680528441;
	bh=PxYd3yv+A2KL28K9DPVIoPVnzepXRiQZB+vO/YriA44=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GRsaTbnpWS8Pjav9WEMTinGpEIcVHMrvCBbX4ylCTQERaPh4LOUSFDtXapxz+EPtT
	 1yGwiYhn9GQlArovrvGziChiiIRngaCb0v0UjmmTKelnnxBo5l0lZmiJd/4mjFLRXs
	 VY2tHxshJ7kxE+rLMx6UrlZ9K5SbkWFOU/+0itCQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D772BF80548;
	Mon,  3 Apr 2023 15:25:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 456AFF801C0; Mon,  3 Apr 2023 15:25:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6138CF801C0
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 15:25:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6138CF801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=tzRfk8NO
Received: by mail-ed1-x530.google.com with SMTP id r11so117314146edd.5
        for <alsa-devel@alsa-project.org>;
 Mon, 03 Apr 2023 06:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680528309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cFC2doK7pP+oZeom2O+jOvVNNVc+JGEYRAe06U7TEU=;
        b=tzRfk8NOdb/h927gg/TWagqrk60Ev0iFDYfLVXJiwNd5qxCR4SaQ12ZujIf+zwJPb5
         veojcYiD+25NuWCpRkUWd+Xk5H0ZJzqrPqYGlkNI8Wfj7rGpj8OOfclitrkW26YSgM7e
         gUqdtm4+pOs2MZ4vDSvBBt7Vc+23eB6tEd9u3XxkK4a50d470J1R/D0hgFmSUNmHQ1dX
         Hp35beC+zAdmSVeHdaKkKFHDknXrxGxGIIBm8Ud3AcM/Z5XOHLB0mxVWiyrONl5McQq3
         2HLsFHd/vlD+txHkqAuUppb5au7uD1atcUsR5VXz3SHg8S0Bq7F3/WFOS8V1cMage530
         g+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680528309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1cFC2doK7pP+oZeom2O+jOvVNNVc+JGEYRAe06U7TEU=;
        b=l52OqiuAhfYE85i5vv8xykBFgNKFoKOcSm1UkUfjylVhyeUgL2LqLOxsJ8h0GqWCvZ
         v/hXyHig5nGMpXQOmxRun6aqRap7oaTGLs01f1ssxoMSAO8tpoaMfNwbCyG7waVzWKtQ
         y0UXh/KKgCkbPh3h2m/BjbVmZR3Znhy9GFUY+JWnZ0luhtLlHvOhNUXkX3EqX18JgZo1
         daXffAYfSuBVxnm/h2wIzMcAPbssSADgdoRMjACHmqngxw+OWAUyPu4jszGP03IStqqz
         8WIdsTjzNSwtoZ6UkKJ9JLdiWcXNVqAQXPH2ifaG2ne8+AhPCwHvyN9PfL5605T5BeiP
         gNiQ==
X-Gm-Message-State: AAQBX9fT8/ZPADRit39Vq7DZ92bj/UBjH2O/Ko9XGv21LO6IZZ3fVWc1
	SRsOJ6KcVGgeo53qVTrlIu0Uew==
X-Google-Smtp-Source: 
 AKy350YbAnSJzJAryYy5Z4w+TUXHLgy/iWJlundDtd2T8cKcldJbO5NJI5MUclajMl0qDLW39vc2ZA==
X-Received: by 2002:a17:907:75f2:b0:88a:1ea9:a5ea with SMTP id
 jz18-20020a17090775f200b0088a1ea9a5eamr32427334ejc.65.1680528308765;
        Mon, 03 Apr 2023 06:25:08 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:ae90:d80:1069:4805])
        by smtp.gmail.com with ESMTPSA id
 p18-20020a170906229200b00930ba362216sm4658489eja.176.2023.04.03.06.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 06:25:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rao Mandadapu <quic_srivasam@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 2/7] dt-bindings: soundwire: qcom: add 16-bit sample
 interval
Date: Mon,  3 Apr 2023 15:24:58 +0200
Message-Id: <20230403132503.62090-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230403132503.62090-1-krzysztof.kozlowski@linaro.org>
References: <20230403132503.62090-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MIFYP44Q7LZTS4U4Q4BFPANABGC7PH64
X-Message-ID-Hash: MIFYP44Q7LZTS4U4Q4BFPANABGC7PH64
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Patrick Lai <quic_plai@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MIFYP44Q7LZTS4U4Q4BFPANABGC7PH64/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The port sample interval was always 16-bit, split into low and high
bytes.  This split was unnecessary, although harmless for older devices
because all of them used only lower byte (so values < 0xff).  With
support for Soundwire controller on Qualcomm SM8550 and its devices,
both bytes will be used, thus add a new 'qcom,ports-sinterval' property
to allow 16-bit sample intervals.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/soundwire/qcom,soundwire.yaml    | 22 +++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index c283c594fb5c..883b8be9be1b 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -86,7 +86,7 @@ properties:
   qcom,ports-sinterval-low:
     $ref: /schemas/types.yaml#/definitions/uint8-array
     description:
-      Sample interval low of each data port.
+      Sample interval (only lowest byte) of each data port.
       Out ports followed by In ports. Used for Sample Interval calculation.
       Value of 0xff indicates that this option is not implemented
       or applicable for the respective data port.
@@ -94,6 +94,19 @@ properties:
     minItems: 3
     maxItems: 16
 
+  qcom,ports-sinterval:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Sample interval of each data port.
+      Out ports followed by In ports. Used for Sample Interval calculation.
+      Value of 0xffff indicates that this option is not implemented
+      or applicable for the respective data port.
+      More info in MIPI Alliance SoundWire 1.0 Specifications.
+    minItems: 3
+    maxItems: 16
+    items:
+      maximum: 0xffff
+
   qcom,ports-offset1:
     $ref: /schemas/types.yaml#/definitions/uint8-array
     description:
@@ -219,10 +232,15 @@ required:
   - '#size-cells'
   - qcom,dout-ports
   - qcom,din-ports
-  - qcom,ports-sinterval-low
   - qcom,ports-offset1
   - qcom,ports-offset2
 
+oneOf:
+  - required:
+      - qcom,ports-sinterval-low
+  - required:
+      - qcom,ports-sinterval
+
 additionalProperties: false
 
 examples:
-- 
2.34.1

