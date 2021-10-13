Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A298D42B241
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Oct 2021 03:31:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24E8C1686;
	Wed, 13 Oct 2021 03:30:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24E8C1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634088668;
	bh=oebmxZPFm+a7d5U0gkFFe+O2NtJVuw5pEofg3wSADKo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BG5SPfqJCEtVgoRY8o3lSJl3Yv8nQXMXCy8DiLtMN7ZVJwN5obOWx22ZioMdoJsVC
	 Fg74tkrNSO/4oHQUgIp6ljx6+0Pw8LZl5TLTQLfsYVZql1a5vUyuaHGi+oeHewaglI
	 S5AFGd23wRdwWCJv+giiBckKK9PE/+R4WRw/DFv8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C36F5F800C0;
	Wed, 13 Oct 2021 03:29:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D6F7F800C0; Wed, 13 Oct 2021 03:29:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE7FAF800C0
 for <alsa-devel@alsa-project.org>; Wed, 13 Oct 2021 03:29:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE7FAF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Ahn7C41x"
Received: by mail-pg1-x52a.google.com with SMTP id f5so713727pgc.12
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 18:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6Zj8iHIqH+Xnz2r7eN2MsdU1Zj8zoSo9u4Ea2uh5oVk=;
 b=Ahn7C41xaOSYn5i5/CFIjFR2Iyuwx1hVDH5QUxnP8pm1qDeoTWsDoK7JfdqGgWMtcI
 dsZqGakmxoTylJxnZE7HDRL1984eG52K03hcU36Zt4AWFn0mYgty1p/m8cVYZhB6HZeG
 frB1lIiz0BBSS9b/aC/aDCOsrLKhcx76jeZW7h3GsVbMRbMxmO0pvtVmsjW7fauC52Cz
 Dgz0YsWnYCCe+ZlCkkDAkQApUjGlvVSS/5CHW54LNdl0PT0kvzp/llKj3ACpe6wL2n2J
 6ToQ01cgcfqM2pzcncLEEwPL0dADx66K+Nx2nyPB2aehgNlyQ3CfqmmFTNOuX4pIMIkM
 nnNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6Zj8iHIqH+Xnz2r7eN2MsdU1Zj8zoSo9u4Ea2uh5oVk=;
 b=M/NvadNCb/Y9zqXzTRQCNpEjJZdQvKI1tBN77ivS1kmg4ilIMj/mkPp+NNFvUW7Gu+
 HcxSkudluASMk3OE52gYleOmGOx62P8e/eMiTk7ctUMWKOSKZxKgf+GM4rLCg7pxNMzE
 jMvMgORUYcqozKpvn+OyFRQcmjvuPBUlr2uk5yW+dwmDEmR/XSs9PcphPrRvTvFu6o0L
 CjuaajAEZ4vsY3iuyvKXnZrVtmuRWb1rGIlkzW/svoOy4ESag0nxmuY2twmmXILMOdOf
 keMMDOa/4Iw36IX+Tl5oCd/KNwzEkQNO3uQ7dPO99tv87waEe6Jx9gd2+22B+tbZ0P0e
 jdFg==
X-Gm-Message-State: AOAM532G4PJ6jmSumixlfIkwv6mlwS29zXudBYbsrEtNr3fd77fxWph9
 miHr+ayGBqd4Ib9fvHCz5J0=
X-Google-Smtp-Source: ABdhPJya3lUcWGxhpCf/15nteOT6Ymflh7gNPtL3WX+m3rWs7z9SK4GdLklnCnEBEEJTL9dqNlIV7A==
X-Received: by 2002:a62:1786:0:b0:445:1a9c:952a with SMTP id
 128-20020a621786000000b004451a9c952amr35493622pfx.39.1634088554179; 
 Tue, 12 Oct 2021 18:29:14 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:578:7fd7:52a:ae77:5bec:efe9])
 by smtp.gmail.com with ESMTPSA id
 b11sm12144788pge.57.2021.10.12.18.29.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Oct 2021 18:29:13 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: oder_chiou@realtek.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 robh+dt@kernel.org
Subject: [PATCH v4 1/2] ASoC: dt-bindings: rt9120: Add initial bindings
Date: Wed, 13 Oct 2021 09:28:38 +0800
Message-Id: <1634088519-995-2-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634088519-995-1-git-send-email-u0084500@gmail.com>
References: <1634088519-995-1-git-send-email-u0084500@gmail.com>
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

