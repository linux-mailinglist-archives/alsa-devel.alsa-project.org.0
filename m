Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E132A6D45BF
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 15:27:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E11856C0;
	Mon,  3 Apr 2023 15:26:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E11856C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680528421;
	bh=t/Yxk92dFGyrQRmMLJB8vDXDM/CrLS3CART8oFMN91w=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ev+52VLaNP06TLzX+u7Cpgelo7iGzqIEY6t0NO/ImTx0yFiieG+p2UyUD97BmQZit
	 jqBNzeWFEGxM29fCrDZ8ierBEVv082bdBiAjxgZm0a7jngMZLjPNxfuTwFLorj7w7P
	 S9c9xkJ6BYxhli5SyiRXpuqF2ys8iVzGeUZ8kURM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CDD74F80534;
	Mon,  3 Apr 2023 15:25:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB442F8052D; Mon,  3 Apr 2023 15:25:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6B98F8015B
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 15:25:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6B98F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Tiga6SZa
Received: by mail-ed1-x52f.google.com with SMTP id r11so117313894edd.5
        for <alsa-devel@alsa-project.org>;
 Mon, 03 Apr 2023 06:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680528307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Xj4CTRinflcxOVayiTMz9WtxgGqTvIRz0yGnEcLNC0=;
        b=Tiga6SZac5A0+DwPw/KvVilfsYhOAAcMOPt56brfrQiwIo+tTkYqcantPych6Q8ab4
         DRxtExBGgV07rCXVGbA053nbq87kiUapgw4074QebtoevYLnGRJx1lMtoK7fzd2JmhKi
         X+iatoBosPFI1i+DmmyQBvrlB5BPE38SGaZAWjJ6G+uWAR1VTzBglrWfGk1fdsGi8geN
         RK1Lr/5wTut7Rd6+vlrJlH+8zNpkDRT0rdh85Xyuk+qBQ7XvC95gZjUtclkGght18wC6
         +FD0KMy6r1BM8FMNNuXTcOFxjNM1Cvw3AiqUY0c2v8Z8h4LbWnrIpe/i+B/gQKYhIx+T
         V3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680528307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Xj4CTRinflcxOVayiTMz9WtxgGqTvIRz0yGnEcLNC0=;
        b=GZNjGSKdDIxLLrBUs2sfJZFheO7XTzVutBPwV+sDsXzrNeHYmg4TpzoA9TGyo7O1ol
         3oo2hYFFAVQvyLryztYpg0o8MJAdJCMPK/QOFrYtr9otlfNHyvreOvXCp1DJW/YTmN6R
         lSPtUtDEo+DPsQR7A6KtBDDirh4ZYMgdiCWyVdRFfOigLhM+G+S/GaZjnBiQ7r7+83m8
         ob7uBJLsTWTI+px1zWLbJou6/KXrmeeNb92ssUxfbisXG7/AOxrmmtdqEJHhwj+HqL+q
         feHyPf1CEoU4V6xInxKqVjYfPCZi2+H2QEbT7WPX70l4bkvY53EGWIhPC25bUaxiUAl0
         dgiA==
X-Gm-Message-State: AAQBX9d+GhC3hc+XWAFMPspAhCqdFccKQdu5Y8RHdRU24xPDzB8+qxJF
	Rbei6/ktoC5j5U9G2/ct+Je/cg==
X-Google-Smtp-Source: 
 AKy350aCyayjO5DJHRY/k+rW+4Gb6yqQoFcG0vmK4uQdZNTIc8xwhJvY27roHiPoh0relKkHpqrauA==
X-Received: by 2002:a17:906:3118:b0:930:d319:d947 with SMTP id
 24-20020a170906311800b00930d319d947mr34635741ejx.74.1680528307706;
        Mon, 03 Apr 2023 06:25:07 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:ae90:d80:1069:4805])
        by smtp.gmail.com with ESMTPSA id
 p18-20020a170906229200b00930ba362216sm4658489eja.176.2023.04.03.06.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 06:25:07 -0700 (PDT)
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
Subject: [PATCH v2 1/7] dt-bindings: soundwire: qcom: add Qualcomm Soundwire
 v2.0.0
Date: Mon,  3 Apr 2023 15:24:57 +0200
Message-Id: <20230403132503.62090-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230403132503.62090-1-krzysztof.kozlowski@linaro.org>
References: <20230403132503.62090-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: F43HRFQJVOAAYRDDIF57377CZWKPXSBR
X-Message-ID-Hash: F43HRFQJVOAAYRDDIF57377CZWKPXSBR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F43HRFQJVOAAYRDDIF57377CZWKPXSBR/>
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Increase maxItems to 16 for port-related properties.
---
 .../bindings/soundwire/qcom,soundwire.yaml    | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index 3efdc192ab01..c283c594fb5c 100644
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

