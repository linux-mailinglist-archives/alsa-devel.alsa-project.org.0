Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2003AB618
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 16:37:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98A75171F;
	Thu, 17 Jun 2021 16:36:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98A75171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623940640;
	bh=r7LqySUjrJ6YUf0ApHt1RQh9xTGadnqmCmYK6dmL6ow=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KiqDBZzpuiaGukCxDhx3QHyOxQZ2IwqGcgF2JDbRdm1xViOcjCxmwwqf0W923sbDT
	 wlu7dl1bI+rf6zu7MYmyzJszV8Bnid1dJzw11sBbHj95vV7fP9C3cd4anfmw5MYJ5x
	 FuJfDBOBmYAidGcofw1fa1+wFDCnitqzYmHCiA0Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E03ACF804DF;
	Thu, 17 Jun 2021 16:34:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06DB9F80165; Tue, 15 Jun 2021 15:07:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODY_26,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C19EF80165
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 15:07:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C19EF80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="n7x038ln"
Received: by mail-pf1-x42b.google.com with SMTP id x16so9016090pfa.13
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 06:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B6awZixPEBIc1khaAEYvB0eLqjgA3TvS8zRyCjLVg8M=;
 b=n7x038lnwlPdOc1w4l4gFub8lJPwPclJPWsYqMy1Wc8MbjD/zVwvxANPeRHHjVosGh
 0dVfYRasW68lEiiA7i0f/fdIigTDl9Nj/D3O8zZ7E6W76uH3SXj0bMB2tYcFEAA/yWPl
 1L7C6HpLQJ5Rj80ZWdANpc+nccdfD9Ai8XIxrp2+w/2rHFZ1UVbiMLeAA6oEV7QluYWl
 CziCGByCjnhSp4pNfuZ+8TLMh4AHd+JPzFXYYR7pIsNd8QxzlBhBK/K/NDuYByReGWZq
 ha21WkCl0P8csN/DrnXO4QNBXtIJpsj4C6+tQB/txwpBD3vxXnKt9xvxoBMGuPK3liu8
 YZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B6awZixPEBIc1khaAEYvB0eLqjgA3TvS8zRyCjLVg8M=;
 b=HQDiiGPWdsRQIo2EPkQp941fRSC15tveuG0u1TM8oojsZ5Wmfh2kZ/tjtq32JWtJz7
 oiXp0nl006m6/Q5bfcJEcNYuBtz0SErYn/TcfrjYUalrXqlGuyQHYMiondytMafg8gVy
 oElsOornbWCYiaw/Usay+sQKV6NkQ6ffbfF8h99qnpbXbdVdpUhKx9qMfSxXaKhpFO0O
 Rn6m+uyWviGuwwwk5ylLDHzR8n9faa7SvopQNyBAJ/2V8C6PCtJBS2oAEqy/tz5yezpL
 z6zMt+WaypU76/6FeUDxvmsiKVIsvgnwBvMALLfl0mXMPn2KQzRbGNAf/jNM361O2fu0
 0kPg==
X-Gm-Message-State: AOAM531OVqe3kFZ+e2EXYO+T2Npi5gHbPBS3GnYTzKQwzM9pTplLWcGa
 9DOwLWj722k3BVwc097tCQ==
X-Google-Smtp-Source: ABdhPJybqEKw7feR8dYi/lWxFb3O2c8qqo8a+8pYqsq3Gq2My0PZ0nz16HwDobhs4XvfWtt4mW2bYw==
X-Received: by 2002:a05:6a00:1a41:b029:2ef:9721:879e with SMTP id
 h1-20020a056a001a41b02902ef9721879emr4352418pfv.74.1623762463956; 
 Tue, 15 Jun 2021 06:07:43 -0700 (PDT)
Received: from INTERNET-129.allwinnertech.com ([223.197.233.48])
 by smtp.gmail.com with ESMTPSA id s4sm15218877pjn.31.2021.06.15.06.07.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Jun 2021 06:07:43 -0700 (PDT)
From: Ban Tao <fengzheng923@gmail.com>
To: fengzheng923@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, mripard@kernel.org, wens@csie.org,
 jernej.skrabec@gmail.com
Subject: [PATCH 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings for DMIC
 controller
Date: Tue, 15 Jun 2021 21:07:37 +0800
Message-Id: <20210615130737.2098-1-fengzheng923@gmail.com>
X-Mailer: git-send-email 2.22.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 17 Jun 2021 16:34:45 +0200
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
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

The Allwinner SoCs feature an I2S controller across multiple SoC
generations.

Signed-off-by: Ban Tao <fengzheng923@gmail.com>
---
 .../sound/allwinner,sun50i-h6-dmic.yaml       | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
new file mode 100644
index 000000000000..81d40c374e44
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/allwinner,sun50i-h6-dmic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner H6 DMIC Controller Device Tree Bindings
+
+maintainers:
+  - Ban Tao <fengzheng923@gmail.com>
+
+properties:
+  "#sound-dai-cells":
+    const: 0
+
+  compatible:
+    const: allwinner,sun50i-h6-dmic
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Bus Clock
+      - description: Module Clock
+
+  clock-names:
+    items:
+      - const: apb
+      - const: dmic
+
+  dmas:
+    maxItems: 1
+
+  dma-names:
+    const: rx
+
+  resets:
+    maxItems: 1
+
+required:
+  - "#sound-dai-cells"
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - dmas
+  - dma-names
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    spdif: spdif@5095000 {
+        #sound-dai-cells = <0>;
+        compatible = "allwinner,sun50i-h6-dmic";
+        reg = <0x05095000 0x400>;
+        clocks = <&ccu CLK_BUS_DMIC>, <&ccu CLK_DMIC>;
+        clock-names = "apb", "dmic";
+        dmas = <&dma 7>;
+        dma-names = "rx";
+        resets = <&ccu RST_BUS_DMIC>;
+    };
+
+...
-- 
2.29.0

