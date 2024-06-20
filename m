Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D54F391DF0A
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:23:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 713E023D0;
	Mon,  1 Jul 2024 14:23:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 713E023D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719836604;
	bh=4DQrIUMsTm81JssGC9KBdVsofE3jqG6GAjcZIQrb7tc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g4Sqc9I8yeVLd8cptt3fwPo1i3UJaSPDn8i6OXwbGuVfd4fkyXt0lbuiq7bQU0jVo
	 4Pth+f6yhHhJWozTjv81itwuodL3n0LHjwjXtOtyxRmLg23Eg87sytKi+ysL9A0Ua7
	 iRRpy/toewRlv7xWeqG5Clm0MwyOOsYNxMlVgT3A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADD34F8058C; Mon,  1 Jul 2024 14:20:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47A1BF80798;
	Mon,  1 Jul 2024 14:20:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B54C5F80266; Thu, 20 Jun 2024 19:58:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 143DAF801EB
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 19:58:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 143DAF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=timesys-com.20230601.gappssmtp.com
 header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=V+J8ngMl
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a6e349c0f2bso138827266b.2
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Jun 2024 10:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718906322;
 x=1719511122; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=POfTgIlDMKnuctYd9TdkfbMoA75Hg7wnTz1QoAWu+kM=;
        b=V+J8ngMlMhRsyaOpEnnViH9sgKchVysB2CRrba2uT6e8VSsZoaVYyh2/S5CR4cA8OZ
         g4E+Qtv99WRPS79JZOyhVaiDej2qQRcYSCdjbB7jtJf1HDsg0z2LU2+aiHz+/lNgyg2e
         5IY9fWC8P8ojL0iA7wjwh4QDvbronBnwcSoXgF0pKWk/22gXR0P1HR38KfcqL2o4QPy+
         txKPdZ1vuARe1omcP9rH8oBzNl/2f3M+bgq0IlxTP3WUXE0WSZGz+QwcMoUsywXuZxg0
         OINKHaexh445T5eO5YMYQRIyUTp6f42nws6ld4Wu96avkwMPYLmnRFr0gFIVo5eCQRWA
         nATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906322; x=1719511122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=POfTgIlDMKnuctYd9TdkfbMoA75Hg7wnTz1QoAWu+kM=;
        b=FMG/SOi4/g975cJXiKlCqs+KhMh8MI4gdQ+AKlrCz6TKTKRtE6oLRcmZS14nrHAak3
         QF0sGEWxHPP/7+DmT0R1ZsV1fymdUq2xdMhZIyQgTRQ5/tfBOWcpvO/yKIyHBvdh2mrO
         SW5TFuBIGE2JNACdypqEWGYeMNac5Q0s3beyifpEthQMtntO678N+4RaW+3fcwuwpa4S
         qwHT7XxchyEYDBUrYiiKLnuDv1czIxDzZzK6a+ABrbfBs5dLnj7ru01R0lpeb+ai5et1
         LQocfAmtAVbl+GcsofwTtXTQFkWLXPsdBikVSz4MNOd2d4WYvbdT9JUtSYO+ia3lIgwe
         m6Mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkusEMBZNV/DBZb3adEvou5pjR02VPbw5bJWipLnbFG0UDnpH7/CRTWpTwVenpN3ui8bKqgiHSFjJGCanrtqL/ZC6kx0glBc0yHFc=
X-Gm-Message-State: AOJu0YxL6AkaynNDPGoRiI3+wgjcDMCaP0a4ixVTZvufp1fy3gVr3h2D
	uIQMzoBdnsZ5tChH95A3CpWFlKZTuRfp+zLwPA8F9CXcb7oX+7iKmj07OWnW2MM=
X-Google-Smtp-Source: 
 AGHT+IHTrvjRefjDyJtTKiBTdA/7eaPFIlKAqed0dBKu9bDkvkontU8BQ0nzLod+LvZtaEx3jpBdyA==
X-Received: by 2002:a17:907:8b8b:b0:a6f:ad2f:ac5d with SMTP id
 a640c23a62f3a-a6fad2fad21mr380433766b.6.1718906321968;
        Thu, 20 Jun 2024 10:58:41 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f42e80sm781370766b.186.2024.06.20.10.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 10:58:41 -0700 (PDT)
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
	Yangtao Li <frank.li@vivo.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Li Zetao <lizetao1@huawei.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Chancel Liu <chancel.liu@nxp.com>,
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
Cc: Markus Elfring <Markus.Elfring@web.de>
Subject: [Patch v4 03/10] ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT
 binding
Date: Thu, 20 Jun 2024 19:56:34 +0200
Message-Id: <20240620175657.358273-4-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: piotr.wojtaszczyk@timesys.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: NIC57EVSF3X5QH6NQQT2SOM2VAIJXQRD
X-Message-ID-Hash: NIC57EVSF3X5QH6NQQT2SOM2VAIJXQRD
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:20:07 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NIC57EVSF3X5QH6NQQT2SOM2VAIJXQRD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add nxp,lpc3220-i2s DT binding documentation.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
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
 MAINTAINERS                                   | 10 +++
 2 files changed, 83 insertions(+)
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
index f7adf9f66dfa..fadf1baafd89 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8918,6 +8918,16 @@ S:	Maintained
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
+N:	lpc32xx
+
 FREESCALE SOC SOUND QMC DRIVER
 M:	Herve Codina <herve.codina@bootlin.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
-- 
2.25.1

