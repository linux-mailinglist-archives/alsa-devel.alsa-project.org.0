Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 121D56E5E0E
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 11:56:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13FDFE80;
	Tue, 18 Apr 2023 11:55:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13FDFE80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681811803;
	bh=SrPCHLxh7qn3Go4wMLkE4nKUTcQcgjRVkpavONMnGlc=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Et4HtytT6h9W7ZqMJoWRMhPNL9sU2NMp/P/IwTUIDanyYmeRGcmwvgvgt2KycqzC+
	 aD8ZkSgkoXJSV+EqApZuy0UuT/luVRju48fVm3V2qE7Ag098H7E7Gf3tpxf+jy3gM7
	 T/+Hx7hBl8SyIv+mrxlS+aZwDg6ARFesEqjhV80M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34BBBF80533;
	Tue, 18 Apr 2023 11:55:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2847CF8019B; Tue, 18 Apr 2023 11:54:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A04E0F800AC
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 11:54:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A04E0F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=C2Gwbgl2
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-94a34a14a54so657834466b.1
        for <alsa-devel@alsa-project.org>;
 Tue, 18 Apr 2023 02:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681811694; x=1684403694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cRfuFeBQF2GhlfpWUoUKdpK75M5MnTFGf0plvdLi68=;
        b=C2Gwbgl2JvkR9/b/grjshd/C+6ox2w0XGOFuJ8S7JpFN4bzNJOp1pHVIwhuGq5bvNk
         r6ww0xJsSxXQ/fBjmaFjwHSYeyAr2Kxe2nsYa+wfmgUO1Dhm/nqVcVAdzN7WAMRFIqnk
         HrApMx7EoUZ5G+Sbj1jWkzhgaOa+WW2EDN4au6jh7qtSdE7wztjWdQaSwHAnQ4fB3qyT
         3UPZ/rJ9vP3Q4tlbNI2otU85R5KO9GcKkglUggsMn4U2m8n20bE+/J4+LtRi3kPXC2y+
         fZSJCKB31kPq0QvEC36AKly99YBANLOD3jFDXWlnRcxZ1AJ70yOCk13vXoGxLa3IOGCm
         Cf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681811694; x=1684403694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9cRfuFeBQF2GhlfpWUoUKdpK75M5MnTFGf0plvdLi68=;
        b=egUYWg8o6CD+59OVHPZoM7ThbJOd2Ee2OVWDb/3/4iBke+PjJwyAP+l+/C8nbQbZCC
         eo/eI75jiiNSAHZaAm7SiqkdcaiB+P19skGzZnb/Fq/OL/uZAB3XiV7fTBBMG3imp2vj
         8R+yB8P6xgHMTfsCXHlclq1yRngvxBSu12OROUR0IQSzSzYXVARYwhiKLXxeGtD/hIgg
         0V9+fjnl3WWCd+VGqTf5pGm2sZAyiIO4umGLy9RxdJEG2fnQ4VSvfjYUbI0YWtJUJtox
         q77dHoZKVf9JFExVmNJFMby1ODD5FPGPtRODoE3awRim6D23Gl2IZf58O2ArXFdw+b8T
         8XSQ==
X-Gm-Message-State: AAQBX9cX+mxTqfORHD/XoDaEmtfNqsJJAocxv4TiemLC3s1FqkXvf9MM
	qWNJEyMQsDD8RRTDCYj+3NK72A==
X-Google-Smtp-Source: 
 AKy350Zv4eAYzjlFPhmgQi9Le6Vg11S1iPenSSp/apV18vS/Di6QxTwegzV01A/ajeWBcJ+evGhJwQ==
X-Received: by 2002:aa7:cb0d:0:b0:506:b120:8df2 with SMTP id
 s13-20020aa7cb0d000000b00506b1208df2mr1389396edt.12.1681811693399;
        Tue, 18 Apr 2023 02:54:53 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a276:7d35:5226:1c77])
        by smtp.gmail.com with ESMTPSA id
 o4-20020a509b04000000b00504d04c939fsm7076578edi.59.2023.04.18.02.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 02:54:53 -0700 (PDT)
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
Subject: [PATCH v3 2/7] dt-bindings: soundwire: qcom: add 16-bit sample
 interval
Date: Tue, 18 Apr 2023 11:54:42 +0200
Message-Id: <20230418095447.577001-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230418095447.577001-1-krzysztof.kozlowski@linaro.org>
References: <20230418095447.577001-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2NBQF3AC52634PSN57XXTJALGKT6MINY
X-Message-ID-Hash: 2NBQF3AC52634PSN57XXTJALGKT6MINY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2NBQF3AC52634PSN57XXTJALGKT6MINY/>
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

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v2:
1. Use uint16 for qcom,ports-sinterval.
   DTS will be fixed in separate patchset.
2. Add tags.
---
 .../bindings/soundwire/qcom,soundwire.yaml    | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index 98c7fc7e1189..fb44b89a754e 100644
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
@@ -94,6 +94,17 @@ properties:
     minItems: 3
     maxItems: 16
 
+  qcom,ports-sinterval:
+    $ref: /schemas/types.yaml#/definitions/uint16-array
+    description:
+      Sample interval of each data port.
+      Out ports followed by In ports. Used for Sample Interval calculation.
+      Value of 0xffff indicates that this option is not implemented
+      or applicable for the respective data port.
+      More info in MIPI Alliance SoundWire 1.0 Specifications.
+    minItems: 3
+    maxItems: 16
+
   qcom,ports-offset1:
     $ref: /schemas/types.yaml#/definitions/uint8-array
     description:
@@ -220,10 +231,15 @@ required:
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

