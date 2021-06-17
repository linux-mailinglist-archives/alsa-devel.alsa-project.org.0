Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DAE3AB664
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 16:47:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D93371797;
	Thu, 17 Jun 2021 16:46:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D93371797
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623941221;
	bh=y6cjEpVd+V+tJAw+GIypQK4ipAJtUbGit06AFfHPcgc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AuAaD/8oGhoxhje55v0MVEfOF5wl0uikvCn/VdvZX1TyDCDguIDS+ZXqf8ucgMXqP
	 dcsiSRa7+0Gdbf7eg6xB01FCPLazPOZC6DA2GulroDIE5liptS7HoGGNGIsCKnq3IE
	 wXQhKJpfjvXor2yPnVjI6wx74lqjPy4IclDubNBw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE7E0F805D5;
	Thu, 17 Jun 2021 16:35:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E89B2F8025A; Thu, 17 Jun 2021 15:10:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODY_26,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98623F8016D
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 15:10:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98623F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="skyBd/9D"
Received: by mail-pg1-x52d.google.com with SMTP id v7so4959433pgl.2
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 06:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UOFgVdq99sW7T1eG1SUViNQCGmp0W3yjcis3mlNBZoU=;
 b=skyBd/9Dm0thru78YAtGmq+L1MBQ0RUmLGkFEkX1EZEbMRT/LDpNvljdVdFxpsTn3N
 FHZVRTubNZfKAO7tbCe3n0D1zA6EJyKbbpfuTVHMUC7RKW2NBMf/N0Jj7WkK3L2Hr5cy
 npad/1H5s8g8JJ8HJ5WUwDBuy9Rr25DSbjnhmRWdjEwtwLjagbLbRu/SkC6YXcyvcihz
 H9hmpaI6FoS60/ak5RirHYtQGd6m67pQT+/c8xXGCrMVcd8VlCEWrFcw4hmx/xToku2k
 H5QpPJNf0++ZFzYfZv4HihmbzG32Fs4cN3tj92SioJAg+zjT5BsEEfP0YYCBmI2zK0CS
 zarw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UOFgVdq99sW7T1eG1SUViNQCGmp0W3yjcis3mlNBZoU=;
 b=CvcX3/aBGZ6xYbEJa0dL0y5xY06MMDO3AxiVWaUc2P/B5pcNlcIMtvJq4+Q8MkkX3Z
 GeSThSOh9MV2a5lfRih7hh+O3P8CHrxQafkC7dZ9R8+TxzWFtGgjr3Zrmlb237FhBhBz
 vy653CiZEuJ1NoeMxtzRfZHYwT+R2uT0QzYPE69rq5QSsu/h3G0ZQXdkY6H8rnpB/yOR
 FsHaEa8IcvzVyvlIKurDjIKmlyMuaX9QMXMLY3kVdSMjwELoAfebpc9Xgf3XMhav4+4G
 42/MsFCwq/nLQcvDGjxhaCNDAKLqQhPhSvXX+2ck1VGDV31y6tWJjEj2GXMZ4lim8zez
 Z1lw==
X-Gm-Message-State: AOAM530RYz6UIRPVYBNJJzNa+ZLfUGZv+hJxGJWLmT96Rgg2n1HAWyLn
 pwOQfsjK3+N8KFyopq6d5g==
X-Google-Smtp-Source: ABdhPJzSgU/A5ZxjBlB9fG4bdYO+g/gurotFxuMeO7UShx88LpKXdA45n8aWt8qOFxjac6QNRWmcCQ==
X-Received: by 2002:a05:6a00:1994:b029:2fe:c076:8359 with SMTP id
 d20-20020a056a001994b02902fec0768359mr2941921pfl.24.1623935411872; 
 Thu, 17 Jun 2021 06:10:11 -0700 (PDT)
Received: from INTERNET-129.allwinnertech.com ([223.197.233.48])
 by smtp.gmail.com with ESMTPSA id a15sm5426754pfl.100.2021.06.17.06.10.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Jun 2021 06:10:11 -0700 (PDT)
From: Ban Tao <fengzheng923@gmail.com>
To: fengzheng923@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, mripard@kernel.org, wens@csie.org,
 jernej.skrabec@gmail.com
Subject: [PATCH v2 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings for
 DMIC controller
Date: Thu, 17 Jun 2021 21:10:05 +0800
Message-Id: <20210617131005.2416-1-fengzheng923@gmail.com>
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

DT binding documentation for this new ASoC driver.

Signed-off-by: Ban Tao <fengzheng923@gmail.com>
---
 .../sound/allwinner,sun50i-h6-dmic.yaml       | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
new file mode 100644
index 000000000000..d7af66775e86
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/allwinner,sun50i-h6-dmic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner H6 DMIC Device Tree Bindings
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
+      - const: bus
+      - const: mod
+
+  dmas:
+    items:
+      - description: RX DMA Channel
+
+  dma-names:
+    items:
+      - const: rx
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
+    dmic: dmic@5095000 {
+      #sound-dai-cells = <1>;
+      compatible = "allwinner,sun50i-h6-dmic";
+      reg = <0x05095000 0x400>;
+      clocks = <&ccu 101>, <&ccu 100>;
+      clock-names = "bus", "mod";
+      dmas = <&dma 7>;
+      dma-names = "rx";
+      resets = <&ccu 42>;
+    };
+
+...
-- 
2.29.0

