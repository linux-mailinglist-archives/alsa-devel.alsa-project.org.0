Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A93AD3DEE6A
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Aug 2021 14:58:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AACE17AD;
	Tue,  3 Aug 2021 14:57:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AACE17AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627995498;
	bh=oeLl8Od03BdlHvEUN+20NeCTas+Anj5xYmXHDt64OBQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RXcvv2YsxP0rYva0K0ojHXGihvXEmDgXxRdxPxTVeAyemHSO4S0USu0pX1XUnIXKk
	 u/RYNLnVk5vpSW8RoQIO3uAz74+evzFVRZcWuSXHa4fXjLpqYQo3ii7b57q2pPKzls
	 VimiBi+DSVGib0SVbGh8w8wIUp+cVDnzPeBIw1gc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5876F8051E;
	Tue,  3 Aug 2021 14:54:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BBA8F804FA; Tue,  3 Aug 2021 14:54:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63811F804E4
 for <alsa-devel@alsa-project.org>; Tue,  3 Aug 2021 14:54:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63811F804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="aIr2pWBK"
Received: by mail-wr1-x42f.google.com with SMTP id b11so19877607wrx.6
 for <alsa-devel@alsa-project.org>; Tue, 03 Aug 2021 05:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yT1WsZzlE0eUDYlRwQaXQCE4J3/gCiPzPuZfeGR1VK8=;
 b=aIr2pWBKDB4M9arf8ZcU2feep2lh01V176PlNamu6beHiTfSB6XPGZbG6oEksZbRVP
 HsiiWvaIXIuFvX2PgAlkUc3dwbt0dbTlGM2q5NStxEbQy4ie4WeT3iTSEJKjawX53Y29
 h3Y+zVJQW3F+N1J3CSYA5VNhflfa29OXEZjCtgUSL0y/lvppERzpJ3K0dzIB5kAhrKJO
 xIiWLAIFihzPJ1+f8kwuD5PcuyauVCzOk77bgncyZ/iQRq37SPlhzUccqG5s8Ns3vsdV
 LhgyX+rD8Ihsf6EZCofJrG1LsJC763d+HkEdeghaF5em/3LyXWdV0HALkFhVnvX8PEqm
 KoAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yT1WsZzlE0eUDYlRwQaXQCE4J3/gCiPzPuZfeGR1VK8=;
 b=XT415F9uY3+W/UVOLaUSLJGDHcVcVv5xW8yPibIcpv9kMgJj5elOWbkEE41bFCcP7U
 AypL/gTs9TyTs4Y1pRDzrWoPpi/dH6/ysPeXrF9p0fLb3fy56Oz/XbClV87apxp/F020
 s/hWTW+9OgSF/ZBftcX1kmVtUEZghr7EsUZtyHs8VOUTw7wxY1iGjm9kiOSx3rXnXsO3
 8YalJR1PRrZpNBP9KVgNdAodTEzre52aNIyGTZU66ZyZkUqGT2Y2h/i8S7o6SGTGU1ta
 E+KuS96jUtygAbR/4W4COr4Js2YMAkpnA14REjFn6hzc9MxyDgyw0yMylJedksfD6dnt
 +qyg==
X-Gm-Message-State: AOAM5306GwZfKlxmreeTS8VUUYzZh8wyCojkL8TcVgsqvIlpsz7xi+fy
 JMWSNzG80Vm+WJpjHEpcwQRoSA==
X-Google-Smtp-Source: ABdhPJxJKuLI5ViW+trLKXA1VVFm2kBnvPS5kUy89pH3LxhPEPOUctp0VrBwfVpi6nZwkz9gOW5GJA==
X-Received: by 2002:adf:db07:: with SMTP id s7mr23829386wri.106.1627995269955; 
 Tue, 03 Aug 2021 05:54:29 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id h14sm14695574wrp.55.2021.08.03.05.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 05:54:29 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v3 06/20] ASoC: dt-bindings: replace q6afe-clk with q6dsp
 audio clk bindings
Date: Tue,  3 Aug 2021 13:53:57 +0100
Message-Id: <20210803125411.28066-7-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210803125411.28066-1-srinivas.kandagatla@linaro.org>
References: <20210803125411.28066-1-srinivas.kandagatla@linaro.org>
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

DSP Audio clock bindings have been documented with DSP services bindings
which makes it difficult to reuse them, so pull them out in to a dedicated
bindings.
Also as part of this change convert them into yaml format.

q6afe-clocks were part of q6afe bindings which are deleted in previous patch, this
patch just adds replacement bindings for clocks in yaml format.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../sound/qcom,q6dsp-audio-clocks.yaml        | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6dsp-audio-clocks.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-audio-clocks.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-audio-clocks.yaml
new file mode 100644
index 000000000000..03ab7451eb1c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-audio-clocks.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/sound/qcom,q6dsp-audio-clocks.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm DSP Clock Controller binding
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  This binding describes the Qualcomm DSP Clock Controller
+
+properties:
+  compatible:
+    const: qcom,q6afe-clocks
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
+            q6afecc@2 {
+              compatible = "qcom,q6afe-clocks";
+              reg = <2>;
+              #clock-cells = <2>;
+            };
+        };
+      };
-- 
2.21.0

