Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D41043AC2D
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 08:17:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D442116E9;
	Tue, 26 Oct 2021 08:16:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D442116E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635229031;
	bh=u9s8SLQDpCTGbLCUK7CGre1/6mJRhAMIX/DpXLpgiOI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TbvQc7Tdg6fup0FO9aeOX097rhBkE8bToHIRzhbyX0boAuhZD+uBswHnm7t2v80Fm
	 jKOof1OXCuXPaGXb1EAR8VM0LtD4ZNqx2Znq9p0vZf0N3DQEeRDmATopUAyWV7y5Om
	 HDPZfWcndMZxKzJhMiYxrAa8mTKWq6tWU2aV5VYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2574F804F3;
	Tue, 26 Oct 2021 08:14:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C80CF802C8; Sun, 24 Oct 2021 11:43:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 026C3F8013D
 for <alsa-devel@alsa-project.org>; Sun, 24 Oct 2021 11:43:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 026C3F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TlcuVmmn"
Received: by mail-pj1-x1041.google.com with SMTP id
 o4-20020a17090a3d4400b001a1c8344c3fso6961152pjf.3
 for <alsa-devel@alsa-project.org>; Sun, 24 Oct 2021 02:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lqm98wEFYJSr54W/wNfWgM+OWyfT9zNKGkY/snl5uHg=;
 b=TlcuVmmnJYhlSjtz2sWfeqC0pHcK97U/MkU/2q94d5vDNKKj1yTUUtlnmUgmgYIhES
 1wjP2NpZ7tNvFk4I5qDTnoZQWtdaqnTJbSE8pxjHeH3XlMzVjV3vxg0bS+eKhKzYJboO
 Xc6zTZ7dlziDgWJsW7DgRtlWdAlTsoPV7tab+x4wTmNZ08xv7iV5/ThSGlQhw8nALCF8
 zvWr/VcvmOqP8ce8xQh7db8HQvPdMRPCPEOfj69Xw0DVRoMY+srKe/7NVPwn3a6+l8l2
 CePm/HjaMxSGxeao2ASsNVNucP1cuJzEcAMWOXiBXe5OoBYBl3wAZsQweV+vj7NfCJ3w
 8uHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lqm98wEFYJSr54W/wNfWgM+OWyfT9zNKGkY/snl5uHg=;
 b=R46i8+G2Z/RAZ1UfDFVguX8m5snjTklW7f8dfRPTUcyhH6Yj+qPj6IxZLfM0+EKwTq
 BBuBHAGQobz2fQa8TNSYgoEcX4+fNOErwrWF5DliO7srY2UDNII7DrHSE7e2JwMyLGaF
 n6bSDuLdEmM1O6adkE35lSGrA+r+1+6Klcc58ss6zI0OkfFhJ1DVDHhj44+SKxoJddhF
 LIv5FDCNi6CRsk8kkx73Z4X+XjPfPHZMCh/tVigedo4TSlbEy3JMoQ82UNzPs7Dzbwjx
 MIuA5QzyoDoRpLtaStwq5iO5vBKMe10wZyHQuXJUucgAxNWczRpGPIjlqAo7nqbKZQ4R
 sFNg==
X-Gm-Message-State: AOAM532Ggr9ofK7Jyy91bHeEZYTElasept2Fxkukbxc7xPi7uMcGmZzQ
 ApK/R1jfPtszD4aGeDgc06I=
X-Google-Smtp-Source: ABdhPJyiey9Yydyrsr3LNLq9tQqCFFJuBfLGyiF5iUoGYbMc5sKz2Cefd+gB7j5JKsIwhdqePVtEnw==
X-Received: by 2002:a17:90a:2a8e:: with SMTP id
 j14mr10106348pjd.227.1635068620020; 
 Sun, 24 Oct 2021 02:43:40 -0700 (PDT)
Received: from lxb-server.lan ([2403:18c0:2:7e::1926:817])
 by smtp.gmail.com with ESMTPSA id p16sm17636619pfh.97.2021.10.24.02.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 02:43:39 -0700 (PDT)
From: Yunhao Tian <t123yh.xyz@gmail.com>
X-Google-Original-From: Yunhao Tian <t123yh@outlook.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/3] ASoC: dt-bindings: rockchip: add spdifrx bindings
Date: Sun, 24 Oct 2021 17:43:16 +0800
Message-Id: <20211024094317.1641949-3-t123yh@outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211024094317.1641949-1-t123yh@outlook.com>
References: <20211024094317.1641949-1-t123yh@outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 26 Oct 2021 08:14:36 +0200
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Yunhao Tian <t123yh.xyz@gmail.com>, linux-arm-kernel@lists.infradead.org
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

From: Yunhao Tian <t123yh.xyz@gmail.com>

This adds the YAML bindings for the Rockchip S/PDIF receiver driver.

Signed-off-by: Yunhao Tian <t123yh.xyz@gmail.com>
---
 .../bindings/sound/rockchip-spdifrx.yaml      | 80 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip-spdifrx.yaml

diff --git a/Documentation/devicetree/bindings/sound/rockchip-spdifrx.yaml b/Documentation/devicetree/bindings/sound/rockchip-spdifrx.yaml
new file mode 100644
index 000000000000..fcbbc3e8786a
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/rockchip-spdifrx.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/rockchip-spdif.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip SPDIF Receiver
+
+description:
+  The SPDIF receiver block allows the processor to
+  receive digital audio via a coaxial cable or a fibre cable.
+
+properties:
+  compatible:
+    oneOf:
+      - const: rockchip,rk3308-spdifrx
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: clock for SPDIF bus
+      - description: clock for SPDIF controller
+
+  clock-names:
+    items:
+      - const: mclk
+      - const: hclk
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
+  reset-names:
+    const: spdifrx-m
+
+  power-domains:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - dmas
+  - dma-names
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3308-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    spdif_rx: spdif-rx@ff3b0000 {
+      #sound-dai-cells = <0>;
+      compatible = "rockchip,rk3308-spdifrx";
+      reg = <0x0 0xff3b0000 0x0 0x1000>;
+      interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&cru SCLK_SPDIF_RX>, <&cru HCLK_SPDIFRX>;
+      clock-names = "mclk", "hclk";
+      dmas = <&dmac1 14>;
+      dma-names = "rx";
+      resets = <&cru SRST_SPDIFRX_M>;
+      reset-names = "spdifrx-m";
+      status = "disabled";
+    };
\ No newline at end of file
diff --git a/MAINTAINERS b/MAINTAINERS
index a2bee2166a39..82e0fa37c5b1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15985,6 +15985,7 @@ M:	Yunhao Tian <t123yh.xyz@gmail.com>
 L:	linux-rockchip@lists.infradead.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/sound/rockchip-spdifrx.yaml
 F:	sound/soc/rockchip/rockchip_spdifrx.*
 
 ROCKCHIP VIDEO DECODER DRIVER
 M:	Ezequiel Garcia <ezequiel@collabora.com>
-- 
2.25.1

