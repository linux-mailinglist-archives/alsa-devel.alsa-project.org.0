Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E334A211B
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 18:40:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACB5216B9;
	Thu, 29 Aug 2019 18:39:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACB5216B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567096811;
	bh=XLlWZva17gTpmsjzP1n5NY0XmZEJ7vgHcPfPGy50RNg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i7PrwzelI8vSetAUvlqLoGNyn3TsL+QlZtbfJVQITVnczgB8GATmedCH96xeJ3IuB
	 yZGyUZB1EwxoVTfl7CGTfR/jUVa8R1xWcJyqDnhlMYWXLGARbYt69+s7rtPHOC/77R
	 5x6cUTIy/W43ghPRaUZAo/NkUrPkUDXu5nNcZuPY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16D26F805A9;
	Thu, 29 Aug 2019 18:36:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9AB8F802A1; Thu, 29 Aug 2019 18:36:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3B36F80148
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 18:36:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3B36F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="mApPXG0X"
Received: by mail-wr1-x444.google.com with SMTP id y19so4125161wrd.3
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 09:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uODZAlCkiSE/bKJhKAz8rlp7NCW9snJyiy8JBrR1VCw=;
 b=mApPXG0XWA1gfN05UGmqu2X89CUhhEFqhFFUCJsa9sadnG82mtfokDvxwlYTDWpieO
 F6SldFti2FnAMbHlNVojpVAr+OllpG7MgvdO/Z6LiSOUhWw6mdzFGLHOS8EnpoR81PxQ
 Xa/GRf5fSw1R+iZXUFxSc7FUNN2XLgOvHXGZInynrzyDkyQC5LbpLHMjcbmf7mJE7FO6
 HLh45DZxuXMzpiyQ89u9qsevOaSr/Iy651odrCGgVZeIJmtY3jOnPZu9pIQSU0wl97yX
 o9w37UW7CZNmeahBINh9vKz3iSMA6h1TErX5v8Fg2wNTl4uG1MrE6z5fQI5qf2vhD0vt
 /loQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uODZAlCkiSE/bKJhKAz8rlp7NCW9snJyiy8JBrR1VCw=;
 b=djb2fgqASvtyMokH9azpZT4v/154M9W6IJOCOvpH+JOZxNqTLhBVesLeL7re1ujS9S
 /5xq1fF7nuH88nDAQgYHAOFABciutJyCEmqzNwMZSJ7yN/tRmHUoBPLbFfpSA02gl3i3
 NZwreYCkP3N/Wtks3yek7ui82WJJmjIgJ+FGWGSqnai5ceDQIy7GdY75n3jQKlZ1nyp+
 z87BGIE0fWdlUVf+hXF7wYjdyVH2UfDMpZtACkYlGGl2qbR6h0/PahBm4BfRRXUf86cv
 9yc/ZWLUBF93Va9b7NcuzhWZQxnRybxP7Ntk8zAWHzsDXcsZH3PtnozlGSGjog7CrYNv
 D4Sg==
X-Gm-Message-State: APjAAAXu7ajTe34Hyiul2osi7tMHX2vjHYw9C4nL5ERGF+JcPdGKweES
 RWjKAQcOLIw/n0suihjDnpW4vQ==
X-Google-Smtp-Source: APXvYqzGyFneHpcFhMPPomV4ePM5ce4JBgHf2enu6MOATiDfOAfr/WVqucexAtZ9BMn2awNiWQ3KiQ==
X-Received: by 2002:adf:e50b:: with SMTP id j11mr12682651wrm.65.1567096599459; 
 Thu, 29 Aug 2019 09:36:39 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id k9sm4398243wrq.15.2019.08.29.09.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 09:36:38 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	robh+dt@kernel.org,
	vkoul@kernel.org
Date: Thu, 29 Aug 2019 17:35:13 +0100
Message-Id: <20190829163514.11221-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829163514.11221-1-srinivas.kandagatla@linaro.org>
References: <20190829163514.11221-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, spapothi@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v6 3/4] dt-bindings: ASoC: Add WSA881x bindings
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch adds bindings for WSA8810/WSA8815 Class-D Smart Speaker
Amplifier. This Amplifier also has a simple thermal sensor for
over temperature and speaker protection.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/sound/qcom,wsa881x.yaml          | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
new file mode 100644
index 000000000000..faa90966a33a
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wsa881x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bindings for Qualcomm WSA8810/WSA8815 Class-D Smart Speaker Amplifier
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  WSA8810 is a class-D smart speaker amplifier and WSA8815
+  is a high-output power class-D smart speaker amplifier.
+  Their primary operating mode uses a SoundWire digital audio
+  interface. This binding is for SoundWire interface.
+
+properties:
+  compatible:
+    const: sdw10217201000
+
+  reg:
+    maxItems: 1
+
+  powerdown-gpios:
+    description: GPIO spec for Powerdown/Shutdown line to use
+    maxItems: 1
+
+  '#thermal-sensor-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - powerdown-gpios
+  - "#thermal-sensor-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    soundwire@c2d0000 {
+        #address-cells = <2>;
+        #size-cells = <0>;
+        reg = <0x0c2d0000 0x2000>;
+
+        speaker@0,1 {
+            compatible = "sdw10217201000";
+            reg = <0 1>;
+            powerdown-gpios = <&wcdpinctrl 2 0>;
+            #thermal-sensor-cells = <0>;
+        };
+
+        speaker@0,2 {
+            compatible = "sdw10217201000";
+            reg = <0 2>;
+            powerdown-gpios = <&wcdpinctrl 2 0>;
+            #thermal-sensor-cells = <0>;
+        };
+    };
+
+...
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
