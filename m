Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 991B76E5E0D
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 11:56:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25817E77;
	Tue, 18 Apr 2023 11:55:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25817E77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681811801;
	bh=qLHMWJLy5LkqLapCkIuDnzl6jL9e95hUVvQqzMFUygI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E+bE44zjIbgUpDKOSlo+qz2JAhzCYXsbt/u+qGsE9vzIXGLrxKpBCqmToBUM0jXA5
	 N+gzxkH/DqU8BzBu6XZ5WTwUL9ymVflUgdLUEoMUoh7VQHFGDrsvBYZePtd1EU5B7d
	 SwW9t97HbsP0VvBsfq5DU0Flop0I0W24UH82EMeg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85962F80212;
	Tue, 18 Apr 2023 11:55:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E1FFF80155; Tue, 18 Apr 2023 11:54:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66008F800AC
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 11:54:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66008F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=RPWTOocd
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5068e99960fso2554571a12.1
        for <alsa-devel@alsa-project.org>;
 Tue, 18 Apr 2023 02:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681811691; x=1684403691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQ8KevaU3QTxraZkfXWWkbBrnYMVguulcoi7GnzRXhI=;
        b=RPWTOocd+41sseJPEHA3IfI9DCZsYutqaxHBRwl1A6XNqRizzEsiS3XBM4oSfs28Fx
         zp3jXQscxLT9M2RbrTVwOuTrxQMYDyDX9f96fY/d72sqFtE2v0HyqeDmNLtRy49Qruj1
         pQgr50Y2nblqGHR96iDIL+a0quDDrVSPI7gZw577X7tgFZD+NJxStQ2KrKH8zc8n6250
         4erldJ7VJXMzt9vA+fR5s0Tr8r2lM7C+LTWYlQf4mDhdBFw2JItJx+P+rkzyswIJyQUN
         1x2fo67hg2v/S/SLs7C8zjKy5bfBM+CIQf3P14jbCMFR+28KcV90S62OO11lMszpAudO
         Ob6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681811691; x=1684403691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qQ8KevaU3QTxraZkfXWWkbBrnYMVguulcoi7GnzRXhI=;
        b=RKDZTZfoghrMXONJjNaonDAh7ZhESIfpii0GqJkGy4mzs3rVH1bOzJ4VzA8a1vER7E
         wvRDHngwJxrBIDb2vHsXZaIudN3isKEEZQY1vk+QqnY4NbVkbYvqmpmFMG5m6ES5egbI
         DBu8kxnlLA210tz84f5wlZuGWI+EJ4DRtGE09gmKkxZ+qDJckxRCtjfet8Ro4SrVh5sf
         jXL0xaj7bT9pn9MO9Ghhz/XB2vxPOKAzTzq4gaMmFfTmJfp2wbxGiRPRYMlELErZQIla
         MtyVLQCApOzoIYHLDX1Q5aw6aAmjeuNUPkE1O0DjLkGnDva5tLTttmzV3if/HFbmbXKJ
         VU6Q==
X-Gm-Message-State: AAQBX9dYRKZNP59kz4ZQWDvVY3sW/UG4OVkKozG4BmfBUdPFzeZp1jmL
	EeHn9yPNNwtozlmkRnZVnu0BaQ==
X-Google-Smtp-Source: 
 AKy350ZJ2akv/lhLAIvrIXntFS6VWUAwO+3l1rJios+Izhwxd25Sw7+kk5nrVxaPll2aNsOcEwv3Zw==
X-Received: by 2002:aa7:c45a:0:b0:504:a2c8:ea60 with SMTP id
 n26-20020aa7c45a000000b00504a2c8ea60mr1740013edr.35.1681811691495;
        Tue, 18 Apr 2023 02:54:51 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a276:7d35:5226:1c77])
        by smtp.gmail.com with ESMTPSA id
 o4-20020a509b04000000b00504d04c939fsm7076578edi.59.2023.04.18.02.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 02:54:51 -0700 (PDT)
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
Subject: [PATCH v3 1/7] dt-bindings: soundwire: qcom: add Qualcomm Soundwire
 v2.0.0
Date: Tue, 18 Apr 2023 11:54:41 +0200
Message-Id: <20230418095447.577001-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230418095447.577001-1-krzysztof.kozlowski@linaro.org>
References: <20230418095447.577001-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Y3ITWJA6EH55OIN3C4DPXG3ZQWWKGYRU
X-Message-ID-Hash: Y3ITWJA6EH55OIN3C4DPXG3ZQWWKGYRU
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y3ITWJA6EH55OIN3C4DPXG3ZQWWKGYRU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add compatible for Qualcomm Soundwire v2.0.0 controller, which comes
with several differences against v1.7.0 in register layout and more
ports (thus increase maxItems of each port-related property to 16).

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v2:
1. Add tags.

Changes since v1:
1. Increase maxItems to 16 for port-related properties.
---
 .../bindings/soundwire/qcom,soundwire.yaml    | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index e4dba825ab11..98c7fc7e1189 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -21,6 +21,7 @@ properties:
       - qcom,soundwire-v1.5.1
       - qcom,soundwire-v1.6.0
       - qcom,soundwire-v1.7.0
+      - qcom,soundwire-v2.0.0
 
   reg:
     maxItems: 1
@@ -80,7 +81,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 8
+    maxItems: 16
 
   qcom,ports-sinterval-low:
     $ref: /schemas/types.yaml#/definitions/uint8-array
@@ -91,7 +92,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 8
+    maxItems: 16
 
   qcom,ports-offset1:
     $ref: /schemas/types.yaml#/definitions/uint8-array
@@ -102,7 +103,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 8
+    maxItems: 16
 
   qcom,ports-offset2:
     $ref: /schemas/types.yaml#/definitions/uint8-array
@@ -113,7 +114,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 8
+    maxItems: 16
 
   qcom,ports-lane-control:
     $ref: /schemas/types.yaml#/definitions/uint8-array
@@ -124,7 +125,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 8
+    maxItems: 16
 
   qcom,ports-block-pack-mode:
     $ref: /schemas/types.yaml#/definitions/uint8-array
@@ -137,7 +138,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 8
+    maxItems: 16
     items:
       oneOf:
         - minimum: 0
@@ -154,7 +155,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 8
+    maxItems: 16
     items:
       oneOf:
         - minimum: 0
@@ -171,7 +172,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 8
+    maxItems: 16
     items:
       oneOf:
         - minimum: 0
@@ -187,7 +188,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 8
+    maxItems: 16
     items:
       oneOf:
         - minimum: 0
-- 
2.34.1

