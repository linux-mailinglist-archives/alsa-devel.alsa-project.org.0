Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9956B91DF58
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:33:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E29C22C19;
	Mon,  1 Jul 2024 14:33:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E29C22C19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719837204;
	bh=BLOQubT6+WDGMXLbalL2gtus5F0xeE3IKPVA5IYu2Zs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TrsdAAppcsUP5i9npVXtyRQTbQ/wVMxq2Eu68HcGijAffCz+Ul6WvYoPkFKmV13K/
	 zcMCdWYJkQCi822abw+r3hvjK9oGqaUC0yZ3NPFDRDMr1CCz7B0ND2hPvPlGVoHnQp
	 ODXSgskFkg2s9qt5Z/yeiKaprwK8I18t5RzmAjv8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB71FF89981; Mon,  1 Jul 2024 14:23:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E42BDF89986;
	Mon,  1 Jul 2024 14:23:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C456F80423; Thu, 27 Jun 2024 17:02:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B785F8013D
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 17:02:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B785F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=timesys-com.20230601.gappssmtp.com
 header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=25mTqmT4
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a7245453319so338754366b.1
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 08:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1719500538;
 x=1720105338; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILtq9+4c141AHxBgbXMa+RP0emWEvg+/fmgpWsAX5kw=;
        b=25mTqmT4Yz+n/EAbx31+SeoidRjwigSff/lpks25XqNh6Ih39/mZpW5MuYg7S0qFJ5
         hKehjOfkLkuJ1+BFoLL1RKrDqM5+OaV8vxZmP5OFZp6UsHhauCn18ipxBHYndX8ZQk2v
         qe0CNiL2uaUnBBRxiItr9G8DwMXg2hn/OXBQUSkzo5I431mCLc6FTOMQ5lpg/TpNcKpG
         DYiycVQCBHxR1zcEZdaBS89z1I4yuIY7vvu7x1ckADJOG7AWPl4ym9y0krOcq0bIP8oT
         LPrZ6guos05ABcUltYAiuMBKFEcY2UL3vHWK1VyNVlvNI4xmyXxz/o8Jz0VxayOp7RsD
         6GwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719500538; x=1720105338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILtq9+4c141AHxBgbXMa+RP0emWEvg+/fmgpWsAX5kw=;
        b=Hl+4jnXGarkTB+6dbNupYNMI3gxQvkrICTM/jxzQWHWkftA4HWQIAWMEkahFxh1rRf
         Q0eGSCyBXzAPL/8yvt0W435itAST0KHu+Afah/WW6EfGg85Jp6JvpOhy5kwhBDfVIKmo
         mAkgbDeB7xTlQ61IloCFWy/w09kl66cLm457dxdeFUk0D5db16z3QBFi1SDXipbqCzuy
         MynP0fYolm62R9zMPu7vBilCoC2um2lF8jnT+hVcWrzuSCdf7Cjc7q+A2wFXruJD6ytV
         QnhBZtYw9pIW181MdNyvkKYPm1fqT9B36xnJ8iYR1Fzl23fJeTga4TBeKRikjfhrjvsO
         +OOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjiP1tGu+kNJVR+uz9EILcYfP17EVZsh9H7wSFeqjt9uKukCJN8ZvfbYrZqVx3PRL0pT0g/Dg/uFkHhOgctmYwNyGGFq1WZ4V4mdM=
X-Gm-Message-State: AOJu0YySr+BeDaxm17+mjZouJxU4rcAQE1T/ToJjr7PMmDggq7sA5V/4
	7Ty8wwquD3jsC+0fj9Qv/ztNE8IU+SnyHyKWapzuzh8ctv5tFKsrlQE1kB5EqqA=
X-Google-Smtp-Source: 
 AGHT+IGhzRCqP2RV73RAfCGRkGAsHtE5znhuHD+qNGBvgcJ+PHUmpdeZlb/WN59v+vhaTirBRQcRFg==
X-Received: by 2002:a17:906:dfc7:b0:a6e:f869:d718 with SMTP id
 a640c23a62f3a-a7296f808e2mr189909566b.21.1719500537821;
        Thu, 27 Jun 2024 08:02:17 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a729d7ca289sm67189066b.222.2024.06.27.08.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:02:17 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Yangtao Li <frank.li@vivo.com>,
	Li Zetao <lizetao1@huawei.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Chancel Liu <chancel.liu@nxp.com>,
	Corentin Labbe <clabbe@baylibre.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Patch v5 03/12] ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT
 binding
Date: Thu, 27 Jun 2024 17:00:21 +0200
Message-Id: <20240627150046.258795-4-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
References: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: piotr.wojtaszczyk@timesys.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: NCYC6CA7AI3PJMQVZUP4BM4OTT2LGIZW
X-Message-ID-Hash: NCYC6CA7AI3PJMQVZUP4BM4OTT2LGIZW
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:23:04 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NCYC6CA7AI3PJMQVZUP4BM4OTT2LGIZW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add nxp,lpc3220-i2s DT binding documentation.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes for v5:
- Removed "N:" from the MAINTAINERS entry

Changes for v4:
- Custom dma-vc-names property with standard dmas and dma-names
- Added to MAINTAINERS

Changes for v3:
- Added '$ref: dai-common.yaml#' and '#sound-dai-cells'
- Dropped all clock-names, references
- Dropped status property from the example
- Added interrupts property
- 'make dt_binding_check' pass

Changes for v2:
- Added maintainers field
- Dropped clock-names
- Dropped unused unneded interrupts field

 .../bindings/sound/nxp,lpc3220-i2s.yaml       | 73 +++++++++++++++++++
 MAINTAINERS                                   |  9 +++
 2 files changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml

diff --git a/Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml b/Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
new file mode 100644
index 000000000000..40a0877a8aba
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nxp,lpc3220-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC32XX I2S Controller
+
+description:
+  The I2S controller in LPC32XX SoCs, ASoC DAI.
+
+maintainers:
+  - J.M.B. Downing <jonathan.downing@nautel.com>
+  - Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nxp,lpc3220-i2s
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: input clock of the peripheral.
+
+  dmas:
+    items:
+      - description: RX DMA Channel
+      - description: TX DMA Channel
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - dmas
+  - dma-names
+  - '#sound-dai-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/lpc32xx-clock.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2s@20094000 {
+      compatible = "nxp,lpc3220-i2s";
+      reg = <0x20094000 0x1000>;
+      interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&clk LPC32XX_CLK_I2S0>;
+      dmas = <&dma 0 1>, <&dma 13 1>;
+      dma-names = "rx", "tx";
+      #sound-dai-cells = <0>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 79b44addc139..ceec359c68fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8918,6 +8918,15 @@ S:	Maintained
 F:	sound/soc/fsl/fsl*
 F:	sound/soc/fsl/imx*
 
+FREESCALE SOC LPC32XX SOUND DRIVERS
+M:	J.M.B. Downing <jonathan.downing@nautel.com>
+M:	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
+R:	Vladimir Zapolskiy <vz@mleia.com>
+L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
+L:	linuxppc-dev@lists.ozlabs.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
+
 FREESCALE SOC SOUND QMC DRIVER
 M:	Herve Codina <herve.codina@bootlin.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
-- 
2.25.1

