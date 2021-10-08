Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99572427FE8
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Oct 2021 09:53:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39E221686;
	Sun, 10 Oct 2021 09:52:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39E221686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633852387;
	bh=oebmxZPFm+a7d5U0gkFFe+O2NtJVuw5pEofg3wSADKo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PJx0WY9SLiwf5h5YYwg42JU/IMiyW6ynzeye9t8U5nMc+Gj5BlTX2edhiWAXs/AgM
	 xH3Gus1wvUXiItfwRvpE4A9q3BRzYhZ8eduHB6eH7WZDrcEaFIuNGVYrTNqetNGLwL
	 hxfaEHef3f4wKych1oHoQ0MVHTvcmcqeDmvnx4x8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98B72F80511;
	Sun, 10 Oct 2021 09:49:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF248F8025C; Fri,  8 Oct 2021 06:50:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0F30F800F0
 for <alsa-devel@alsa-project.org>; Fri,  8 Oct 2021 06:50:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0F30F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="en6IZ72u"
Received: by mail-pg1-x52b.google.com with SMTP id a73so2011718pge.0
 for <alsa-devel@alsa-project.org>; Thu, 07 Oct 2021 21:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6Zj8iHIqH+Xnz2r7eN2MsdU1Zj8zoSo9u4Ea2uh5oVk=;
 b=en6IZ72ujMNigCYqRMhZdH6nb4v3yyY8kdx5ZLcvXf8/bilr2/+JsFl5DOgXpJcbu8
 7WYstew6waA92pE48bfaF3fQpLlhpTWh0GTRErluITfVaXfB5NUfDEOnjm3TRu3e8ofH
 FwV/nOC4k/PkgemQ5SQDsH7ssy5Y/DHevIAAq0N7h8zJVr4xrgQuZHTC9exras6X7/O+
 WYvOWsHRqH7nT2q2AO2SfwA8c+Y6n1YWYxIizv9qlV00dUt0DIA8n61LbGpLimM9K9rX
 tfBXUCt2UhAAa6fZmuXPtJknFAbtw2PLzF9t79u0vAamFfmFzSYxouaQUp0kSF7GCOCA
 Z+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6Zj8iHIqH+Xnz2r7eN2MsdU1Zj8zoSo9u4Ea2uh5oVk=;
 b=xI6h4V2/TWo91iAKS6AGqYysPyo2kpZs6LK0AKi6gWCEZymLSs4JF/GBJfRrXKR5kJ
 WuKejEJGdph74LRY2mGdauA7GtBuCw8aNmTrE/rop6ohTGolz1r0jN+TQGUWM5peEs/c
 xczKjw0prktnmah6a1z4O79CzUfO4aTQJbgzcNu6cmkbvu6wefm7wfWYcw2IaoVan39R
 uH8f5aRM/zI7kO6JqZb+J7asjGbtQqCUCASntyZRZd+OivzYQaHbcZhqk40uaGdPfDmv
 ElGPufS1K+MvYpDv5lLTuyiug+oiDiSv2yy65rGjm69aHvo/Eetc7yg53NyKq4/QECtr
 vfVw==
X-Gm-Message-State: AOAM530vObdFAhHKxlTxlxsK18mZMJ/1zVsYQmp0+Imyxrxe5jCVUUnt
 eKUMumMdYLOJ6gEcWZS50iQ=
X-Google-Smtp-Source: ABdhPJxWHPrCQ6OID5EzaLKAXNJdBWsWeUhT+WOHgDk3rI1uR/j5O49qxztLx/KwoLcVHUL4tQHXCg==
X-Received: by 2002:a62:7a4f:0:b0:448:6a41:14bb with SMTP id
 v76-20020a627a4f000000b004486a4114bbmr8269668pfc.31.1633668631638; 
 Thu, 07 Oct 2021 21:50:31 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:479:5014:1d07:e136:b921:8d67])
 by smtp.gmail.com with ESMTPSA id f4sm885182pgn.93.2021.10.07.21.50.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 Oct 2021 21:50:31 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: oder_chiou@realtek.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 robh+dt@kernel.org
Subject: [PATCH v3 1/2] ASoC: dt-bindings: rt9120: Add initial bindings
Date: Fri,  8 Oct 2021 12:50:11 +0800
Message-Id: <1633668612-25524-2-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633668612-25524-1-git-send-email-u0084500@gmail.com>
References: <1633668612-25524-1-git-send-email-u0084500@gmail.com>
X-Mailman-Approved-At: Sun, 10 Oct 2021 09:49:30 +0200
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 allen_lin@richtek.com
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

From: ChiYuan Huang <cy_huang@richtek.com>

Add initial bindings for Richtek rt9120 audio amplifier.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 .../devicetree/bindings/sound/richtek,rt9120.yaml  | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/richtek,rt9120.yaml

diff --git a/Documentation/devicetree/bindings/sound/richtek,rt9120.yaml b/Documentation/devicetree/bindings/sound/richtek,rt9120.yaml
new file mode 100644
index 00000000..5655ca5
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/richtek,rt9120.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/richtek,rt9120.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Richtek RT9120 Class-D audio amplifier
+
+maintainers:
+  - ChiYuan Huang <cy_huang@richtek.com>
+
+description: |
+  The RT9120 is a high efficiency, I2S-input, stereo audio power amplifier
+  delivering 2*20W into 8 Ohm BTL speaker loads. It supports the wide input
+  voltage  range from 4.5V to 26.4V to meet the need on most common
+  applications like as TV, monitors. home entertainment, electronic music
+  equipment.
+
+properties:
+  compatible:
+    enum:
+      - richtek,rt9120
+
+  reg:
+    description: I2C device address
+    maxItems: 1
+
+  pwdnn-gpios:
+    description: GPIO used for power down, low active
+    maxItems: 1
+
+  dvdd-supply:
+    description: |
+      Supply for the default on DVDD power, voltage domain must be 3P3V or 1P8V
+
+  '#sound-dai-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - dvdd-supply
+  - '#sound-dai-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      rt9120@1a {
+        compatible = "richtek,rt9120";
+        reg = <0x1a>;
+        pwdnn-gpios = <&gpio26 2 0>;
+        dvdd-supply = <&vdd_io_reg>;
+        #sound-dai-cells = <0>;
+      };
+    };
-- 
2.7.4

