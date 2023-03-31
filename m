Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F22506D2614
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Mar 2023 18:46:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D13F1F7;
	Fri, 31 Mar 2023 18:45:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D13F1F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680281202;
	bh=YGX4JrJVvPNbxB1PnZzjYrQ6/J386muGw6kT5KMAtEE=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZUYIcJUhIDh6G/AclWo8e860sl//CQhmNKC8irhBFOcXkwpIiqlE/GU/FO3QVGFBY
	 jBvQqs2y0AhVJ3BDnQV+yYoxqHMI6jQkuEBxbzUQcT97DDfwa90prPam5QtyYmHBwv
	 LNlwEfYmrs40XxUDreyv76PaIb3GwjaqV62Dqbv4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CAA11F8024E;
	Fri, 31 Mar 2023 18:45:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55FB7F80529; Fri, 31 Mar 2023 18:45:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE59DF80114
	for <alsa-devel@alsa-project.org>; Fri, 31 Mar 2023 18:45:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE59DF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=tivHTCPq
Received: by mail-lf1-x12f.google.com with SMTP id c29so29720390lfv.3
        for <alsa-devel@alsa-project.org>;
 Fri, 31 Mar 2023 09:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680281136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Kmz3C998WVao4UkbIae7gw0Yw5Zh6htrgN/X3GXY8I=;
        b=tivHTCPqdm0bY2kwozGD/QKWMPIb4CuzLIrFj6DOOFKH+FS/YBDS6OLXylZ1y7gm+S
         tjKAFVIhipHhsmQfyAP5qbX38bWcEnP0af54QH9EV5cRmpJdI1572usURQpvu2RZ6IPO
         weos0BDITJkFYi1iXLYZHzpWPWA06UmK68B1zBfiuYu9DVNuS8Wwx4qEk9THlUNdwL7c
         MljcC60TCHbqqo41ZZboSTkLifNmYXc8a4DZ9OFM5CMId2ar+QCIzGmKKJqUGYLyoQG/
         jSaKGL/J4CLMrYhFODT+GksZTq88ceIkmFLaEr616/mHkmySapxTt18oUvsuBVTxT+xH
         gwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680281136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Kmz3C998WVao4UkbIae7gw0Yw5Zh6htrgN/X3GXY8I=;
        b=kVS9WZnFdCcXThwu5d+38npZoOomkoLE2J5z2Zak+sSOBpYk72eQGdnjHlBc4LePOd
         I8FqOrCtXGyk6uuL7dvIrVHGxqJVzrSy1wyucEtPI2Bl2NqDX7vqGO4uRVcY0cEAk/lK
         5olHKDUBQ2qiC6TUrZ00J2FdGItfOUFTfAJt38P4++oMN1i1MF4alDTc3ciMpVicdmAt
         jdcZ6iihrVr2/gvf65jsL5osWByqS0/uCYIgLHAIqAa0upleQ96FriMAeasEgln33XbW
         klS8BFPpmTfzwI8Oc8hVl2nRPyp02YlrmzEKyy2gYxf3NYY2SoUfndm3sJ7QEwkTLA0L
         F3Uw==
X-Gm-Message-State: AAQBX9endCUuD0+w8zYAcP7gJv7VgOGYMB8O7gf146Nk+/xFPYiOtErl
	Xy69f93vEEpM/TbJ8W5QPmrGEQ==
X-Google-Smtp-Source: 
 AKy350bA3F8gy4HD9rUqIR1YmyE+ZIZu7WvWnQcjUjVMMPVpvex7vCu0y68oxuXMTOpqpqKXChytIA==
X-Received: by 2002:a05:6512:961:b0:4eb:274b:a69 with SMTP id
 v1-20020a056512096100b004eb274b0a69mr1754798lft.26.1680281135816;
        Fri, 31 Mar 2023 09:45:35 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id
 u26-20020ac2519a000000b004e8483bff82sm439872lfi.271.2023.03.31.09.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 09:45:35 -0700 (PDT)
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
Subject: [PATCH 1/7] dt-bindings: soundwire: qcom: add 16-bit sample interval
Date: Fri, 31 Mar 2023 18:45:24 +0200
Message-Id: <20230331164530.227302-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SEFRGV7ISXEOVZL6CKK64PA5ZT5X74JD
X-Message-ID-Hash: SEFRGV7ISXEOVZL6CKK64PA5ZT5X74JD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SEFRGV7ISXEOVZL6CKK64PA5ZT5X74JD/>
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
index 3efdc192ab01..e2acfd09fb22 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -85,7 +85,7 @@ properties:
   qcom,ports-sinterval-low:
     $ref: /schemas/types.yaml#/definitions/uint8-array
     description:
-      Sample interval low of each data port.
+      Sample interval (only lowest byte) of each data port.
       Out ports followed by In ports. Used for Sample Interval calculation.
       Value of 0xff indicates that this option is not implemented
       or applicable for the respective data port.
@@ -93,6 +93,19 @@ properties:
     minItems: 3
     maxItems: 8
 
+  qcom,ports-sinterval:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Sample interval of each data port.
+      Out ports followed by In ports. Used for Sample Interval calculation.
+      Value of 0xffff indicates that this option is not implemented
+      or applicable for the respective data port.
+      More info in MIPI Alliance SoundWire 1.0 Specifications.
+    minItems: 3
+    maxItems: 8
+    items:
+      maximum: 0xffff
+
   qcom,ports-offset1:
     $ref: /schemas/types.yaml#/definitions/uint8-array
     description:
@@ -218,10 +231,15 @@ required:
   - '#size-cells'
   - qcom,dout-ports
   - qcom,din-ports
-  - qcom,ports-sinterval-low
   - qcom,ports-offset1
   - qcom,ports-offset2
 
+oneOf:
+  - required:
+      - qcom,ports-sinterval
+  - required:
+      - qcom,ports-sinterval-low
+
 additionalProperties: false
 
 examples:
-- 
2.34.1

