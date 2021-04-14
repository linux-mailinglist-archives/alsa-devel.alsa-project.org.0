Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EA035F82C
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Apr 2021 17:51:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30330166F;
	Wed, 14 Apr 2021 17:51:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30330166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618415511;
	bh=gKYlUs0eUWBlYJEIra1788YCzOATdHXWdV/trnietk0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EZFDr0DldbgPHihufc+Kl5Z4xnDAsAQDPsCb1HVKGu+MIlEguFWdLKYiWD46q/zSB
	 GbMUeVPLUhCh0oGuLqfnn1kG2btmQReCmGuM0CtWuFEbbuipnN8VLJfv0SKhuzqhhp
	 QoRWysUHhxq5BDtUICxinkZ/n8nuvaXnTgE/+Xis=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 763ACF8032C;
	Wed, 14 Apr 2021 17:49:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E1E6F80430; Wed, 14 Apr 2021 17:49:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24BD6F80278
 for <alsa-devel@alsa-project.org>; Wed, 14 Apr 2021 17:49:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24BD6F80278
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="w3P0MHZg"
Received: by mail-ej1-x62a.google.com with SMTP id e14so32109738ejz.11
 for <alsa-devel@alsa-project.org>; Wed, 14 Apr 2021 08:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X9klurVQ9zaPgZiimhz9hUIzAK6dPBY5bXiVGcul6OE=;
 b=w3P0MHZgxNgpNfFYAq2gmPdZrV7GUG+M5QtlVg6DAc8uPqNt93EKgxKPFCjkJ35Q7F
 gmPG+NEEm/uO2i7CkLyIp4plI6sV/IG7gHmngXfZ+QtF+SuPMQ3iujXnmWYlUO+lBBig
 6fuEWVzhrcSBZSdoVB3vBzOUJ4MN0I4IMlo4OmwZOH2PeMl0mry4dsDaMWnMSE41OojN
 16/D0CZ4guSwifAAKV0r6b7OGE45Qq5sj/tjOpAdAlG5RnROkQW5UvdshCSm4v495FFZ
 fUeSQzePBsCFpJzL2VT0m6qU/LBnE4ISp1nevv9dAU5HZht2xOE75ru6s1k1Hl/4+wlh
 I/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X9klurVQ9zaPgZiimhz9hUIzAK6dPBY5bXiVGcul6OE=;
 b=dEUpQu8IOAfiPcOHs37DidtZT/wkiMCM347q4pWmmaEWqys79hW//AG1YR2iaxLMB0
 YeYdTEhOSTdFdSDKCzXLbcxZMmU1hlJLgPHBBlAI92rO85h3NEJYac42U0KiKfgXfB5Z
 KHHD0IugadJWaZNxo0evigdwzyuuzSxNEtUjtUnMYQouxCMFVad9tTS8V6vTQkvSDrsT
 T/+7J6AUiA4HemAdGK18AQJExiMScbIMVLd4FETdDlhzVeEpKhwH8wsDwll4P3KJ5bgf
 NgWqCFc1nzVXR7QzE8Tbici8K8EKQyO+pVOSxd5HcfNLRotv2WdRTQHsE1TDaYEdVOL/
 r+Og==
X-Gm-Message-State: AOAM531cA4ldzIFLuOtowD1MQC7vSK/yUStzKnJdiclyMumUU35qOMlI
 WRWDJuR94WfwSZgV+GpTU30lFw==
X-Google-Smtp-Source: ABdhPJzopcPuHp+P53ubCJe/TbePBdtumhDcyarmzsRWLkCWIDduTL0agiZLzwZxLHSC0aA/ZAzg5w==
X-Received: by 2002:a17:906:ecb8:: with SMTP id
 qh24mr39510393ejb.162.1618415368378; 
 Wed, 14 Apr 2021 08:49:28 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id q12sm10495540ejy.91.2021.04.14.08.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 08:49:27 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v4 4/9] ASoC: dt-bindings: wcd938x-sdw: add bindings for
 wcd938x-sdw
Date: Wed, 14 Apr 2021 16:48:40 +0100
Message-Id: <20210414154845.21964-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210414154845.21964-1-srinivas.kandagatla@linaro.org>
References: <20210414154845.21964-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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

Qualcomm WCD9380/WCD9385 Codec is a standalone Hi-Fi audio codec IC
connected over SoundWire. This device has two SoundWire devices RX and
TX respectively. This bindings is for those slave devices on WCD9380/WCD9385.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/sound/qcom,wcd938x-sdw.yaml      | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd938x-sdw.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd938x-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd938x-sdw.yaml
new file mode 100644
index 000000000000..fff33c65491b
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd938x-sdw.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wcd938x-sdw.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bindings for Qualcomm SoundWire Slave devices on WCD9380/WCD9385
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  Qualcomm WCD9380/WCD9385 Codec is a standalone Hi-Fi audio codec IC.
+  It has RX and TX Soundwire slave devices. This bindings is for the
+  slave devices.
+
+properties:
+  compatible:
+    const: sdw20217010d00
+
+  reg:
+    maxItems: 1
+
+  qcom,direction:
+    description: direction of the SoundWire device instance
+    enum:
+      - rx
+      - tx
+
+  qcom,port-mapping:
+    description: |
+      Specifies static port mapping between slave and master ports.
+      In the order of slave port index.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 4
+    maxItems: 5
+
+required:
+  - compatible
+  - reg
+  - qcom,direction
+  - qcom,port-mapping
+
+additionalProperties: false
+
+examples:
+  - |
+    soundwire@3230000 {
+        #address-cells = <2>;
+        #size-cells = <0>;
+        reg = <0x03230000 0x2000>;
+
+        codec@0,3 {
+            compatible = "sdw20217010d00";
+            reg  = <0 3>;
+            qcom,direction = "tx";
+            qcom,port-mapping = <2 3 4 5>;
+        };
+    };
+
+...
-- 
2.21.0

