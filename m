Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 403113C87C6
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jul 2021 17:35:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDDE61694;
	Wed, 14 Jul 2021 17:34:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDDE61694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626276922;
	bh=kqskMrFbvKYf5mXMhHXhVzisq96e77cdFazCZKncELY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A+KfDOlDK7/JYasTTQpEY4AF4GVAnIkxOXqRVeX46PeG+Zj6pCe7wVqki4S+PUBBs
	 JhkMit2Q/dNZ8HoEMdPezd/81JqCdqNJG32DH2vHsJwT0blaBo+gkFVpXwvvub+e0V
	 lTuS9iKjU0w7i406fCbp2cFPHPvqYtQsw2JQifeE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B544F8052E;
	Wed, 14 Jul 2021 17:31:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 474D8F8051C; Wed, 14 Jul 2021 17:31:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78ED8F804FB
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 17:31:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78ED8F804FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="agLBPgKG"
Received: by mail-wm1-x335.google.com with SMTP id f190so282741wmf.4
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 08:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=idmBojPKMaEqXxTsPN9NMivz3VoeKNs2nUJ6x42cpzc=;
 b=agLBPgKG6NCQ7IVxrRVEplMT6waFwhNQPFhzQQpnpJKX7/YBMSJxK8w0vmN7DtVDGL
 n6ikaA3s1XieoJ4wRldmKO6pq8vcxxFdy8IS5k8GTYZzMzC+iKIUz673QMQaI8WmL9cZ
 hv2rjCDIlmlUxI4wLEsVn8lUOjIJugBtWJ6S4X1UsBmQM4Usmmy6uM++A73uREFhxFYd
 aFSNA+OW9gwsGk0HhsAlBlgQ3DRIlFuYyzyi6gDhUb+1/Erymzr82qHYGhfPHpJnB2dx
 u35VhguFMJxpiwV+YLjjbLR8WZ0BgLRIrGShF2Wvn25hY2xJVgDmnOKLaz0v/UjyFavT
 FeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=idmBojPKMaEqXxTsPN9NMivz3VoeKNs2nUJ6x42cpzc=;
 b=hAd+9MuMtuRqPMDyRr5OiYEIzEwObY/szVmjAJ12ZqKMjUUkOm/cAs2uaHmGB8eDh/
 ybpkyDD49Ixyy/YitgiDjQFBlNiMaX2J3eMaWk84jl/HBrTPTu/yrDfASZ3T6RoR1AWc
 mvnYHl8WjY+ykrSO7Nbp5eIPXxh8EdnEHMVUubBvoBX0C7Y6SDaVUKRD+BLe0hnwYfpW
 7jU5f/JVTiymCs4iWgR0wdjC/sMF/e016Xzk+n1P78px6lIXIn3QI1c79omLahQVHcxf
 cNNZaiIM17kQoHW/NWYG7tkaJbQgedBBUOXJPvoJFQb4bW0mar2qzaja2ShaGGMFws+m
 z7Wg==
X-Gm-Message-State: AOAM532HjBfyofhz+apDIwacNjkRcaLQ+XeR863nGVYub1cxcyO0gTd4
 IfaZLiJLueU0RNJMOdhWRHi53w==
X-Google-Smtp-Source: ABdhPJyFR8qTlHqmBxq+Y/7qdiBh4rN3/klZm8ldzfOe2/EYYw/757jwvFtTjLXf6nZHKQSaQPgvpA==
X-Received: by 2002:a1c:80cd:: with SMTP id b196mr4732641wmd.179.1626276672854; 
 Wed, 14 Jul 2021 08:31:12 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id y6sm2465174wma.48.2021.07.14.08.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:31:12 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v2 11/16] ASoC: qcom: dt-bindings: add bindings for Proxy
 Resource Manager
Date: Wed, 14 Jul 2021 16:30:34 +0100
Message-Id: <20210714153039.28373-12-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210714153039.28373-1-srinivas.kandagatla@linaro.org>
References: <20210714153039.28373-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com, tiwai@suse.de,
 plai@codeaurora.org, linux-kernel@vger.kernel.org
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

This patch adds bindings support for Qualcomm Proxy Resource Manager
service in Audio DSP.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../devicetree/bindings/sound/qcom,q6prm.yaml | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6prm.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6prm.yaml b/Documentation/devicetree/bindings/sound/qcom,q6prm.yaml
new file mode 100644
index 000000000000..6f14146c1ea1
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,q6prm.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,q6prm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Q6 Proxy Resource Manager
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  Proxy Resource Manager module is core module used to manage
+  core dsp resources like clocks
+
+properties:
+  compatible:
+    const: qcom,q6prm
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    gpr {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        gprservice@2 {
+          compatible = "qcom,q6prm";
+          reg = <2>;
+          #clock-cells = <2>;
+       };
+    };
-- 
2.21.0

