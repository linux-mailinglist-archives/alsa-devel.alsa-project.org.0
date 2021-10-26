Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D58343B10F
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 13:19:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C28716EF;
	Tue, 26 Oct 2021 13:19:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C28716EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635247195;
	bh=wMkgM8CoglY0fvE9Zf5Mt39swOo7BxD8RsI2fUnIV9I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KsUDAhRL2Av7KsV0um4gaZcI6jWJruzPdQIgPDbv0h8r9LZPH7kFNCnxfob4r0v3/
	 MjPqAEVbu5Ye47ExQ9pjwcBVPu8usFZc1LTQnLr3VBOYbv0wWxM+soI1oDIQu+kOYz
	 hULHRE/6WDAAi9aWV1UTDoYtjsMbml/YXzY+EJdk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63D66F80300;
	Tue, 26 Oct 2021 13:17:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C22EF804FF; Tue, 26 Oct 2021 13:17:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15158F804AE
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 13:17:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15158F804AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="HoT9mSWR"
Received: by mail-wm1-x335.google.com with SMTP id j205so13044930wmj.3
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 04:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZUTQPGMld1NjfHqBeBgP6Q5d4oV2F6unCGQSSDbPgkI=;
 b=HoT9mSWR02oI0cJdFN7jh5/Qf8bpowLGwY80xHBAgSwrF2dQOHSifYlFaRxs3xLcku
 fsA4YIVQkD8bTt2OC1exa7yOBUz4TzZKFtm3IOKHWh/y3jqZa81UGUA0i93l29L9gIpx
 3405qym9sWSms4I85qAw5Okg570DntU3TG6oNxxS/Q1V+kPZRTGXDx9IbxyTpuIbkoEb
 OqmlUtzdmn+Uqlb/7kKRIPT1cmWWu73DTdPuMPsF8rrmRtTgvfnsxfOyWWbL6giBQtEL
 cU6RPfpwA1X/oFe5EmT02HKW1ev44w/TXxKoDz6gM+IqaFp5zhMELRnRXSa+ES0dj9UE
 IFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZUTQPGMld1NjfHqBeBgP6Q5d4oV2F6unCGQSSDbPgkI=;
 b=sSImaHJd9gtY4dck7tyqA43J35q4v5R3k4WjTls8cyF0meRfd4IDC0laQfoibl5O/f
 i+KMkQ5/nNGuLTrSvX2Z6BtE3SQsATG/z6IBvj3/AXIr6d59y2JlwDY+mSXEU+n8RTBm
 BJS4z9UZl2I1ze7s8+NrsNiWg7E1Oooy62PeS2iWjorZf3kSQybMo9OyB9UyVlcXCcJF
 U+47UYtBNvL6EIwTlyYE6wv9B54EOy/vvaKBuVfeBlHUdsKm2HqwgvVzamboxca0yImC
 rGK1UhBGQMqrEdNyyI4AcgAYSY44JBJerCyvL+EhZltguYQWMzV0IqqFq197tx+wzzzA
 /P/A==
X-Gm-Message-State: AOAM530XJl/AJdZ1Ye+B9Nx9kPVRc4LGsahrAQk/FdP9GOiJOeTe0uSC
 qycaoeRBrchStAOhMZlNezh1uQ==
X-Google-Smtp-Source: ABdhPJzQQ6++lOSni9mgb5nZVK0QIU7uvdyNlgihsXqvFpfRauYAYHNfofnfbBa05Yt1kX/H5wsSug==
X-Received: by 2002:a1c:f615:: with SMTP id w21mr26551011wmc.16.1635247040043; 
 Tue, 26 Oct 2021 04:17:20 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id l124sm355483wml.8.2021.10.26.04.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 04:17:19 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	bjorn.andersson@linaro.org,
	robh@kernel.org
Subject: [PATCH v11 08/17] ASoC: dt-bindings: add q6apm digital audio stream
 bindings
Date: Tue, 26 Oct 2021 12:16:46 +0100
Message-Id: <20211026111655.1702-9-srinivas.kandagatla@linaro.org>
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

On AudioReach audio Framework, Audio Streams (PCM/Compressed) are managed by
Q6APM(Audio Process Manager) service. This patch adds bindings for this DAIs
exposed by the DSP.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Hi Rob, 

You might see a dt_binding_check errors as QCOM SoC relevant non-audio patches
in this series have been merged into the Qualcomm drivers-for-5.16 tree,
as this series depends those patches an immutable tag is available at:
https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git
tags/20210927135559.738-6-srinivas.kandagatla@linaro.org

thanks,
srini

 .../bindings/sound/qcom,q6apm-dai.yaml        | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
new file mode 100644
index 000000000000..5d972784321d
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/sound/qcom,q6apm-dai.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm Audio Process Manager Digital Audio Interfaces binding
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  This binding describes the Qualcomm APM DAIs in DSP
+
+properties:
+  compatible:
+    const: qcom,q6apm-dais
+
+  reg:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+required:
+  - compatible
+  - iommus
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/qcom,gpr.h>
+    gpr {
+        compatible = "qcom,gpr";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+        service@1 {
+          compatible = "qcom,q6apm";
+          reg = <1>;
+
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          apm-dai@1 {
+            compatible = "qcom,q6apm-dais";
+            iommus = <&apps_smmu 0x1801 0x0>;
+            reg = <1>;
+          };
+        };
+    };
-- 
2.21.0

