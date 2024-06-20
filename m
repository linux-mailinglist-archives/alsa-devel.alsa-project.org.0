Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA93A91DF04
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:22:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26734238A;
	Mon,  1 Jul 2024 14:22:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26734238A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719836571;
	bh=qFS8dbUIltaliP34b4s9iOYNBl/H/n7Qhca0kv+Esfk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aMmODuPstz6MghKiqY9G+hZV6R3gcXX0dAS0Sjfr5pEgwbs3peHqaOTpOMMK9/vxj
	 +PZY5zAnOgCsPNM9kPnME/7/j+pogVYdHpR39OzEaqBnS7BLCZYBxTbA/BROjvleWD
	 mv3CD0gmZaamiHZ6+o1PZFKSotiIm8GmDyVFkg5E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51B15F8070D; Mon,  1 Jul 2024 14:20:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DCF1F80709;
	Mon,  1 Jul 2024 14:20:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 256E2F80266; Thu, 20 Jun 2024 19:58:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39D5AF801EB
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 19:58:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39D5AF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=timesys-com.20230601.gappssmtp.com
 header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=RpoEQVN/
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a6265d3ba8fso123791266b.0
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Jun 2024 10:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718906300;
 x=1719511100; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dj3DX12QYavc1OOQJN+Lhj+prqOyJf9zJxwWhTZ5aE8=;
        b=RpoEQVN/Adr001dDQ2t2CZcQ++gue66qEFBvBTD3tWr/BY2w5UUKT+qgC+8mYMuZ9v
         ty1CA4hiSk2Dn6qWyakZwDFgP7ZsDdpHxrFgQe1gA8aPoWoypHPr1PwXMaZSsyKp7rEr
         CqEdKFCiO5uEU3TJTRGqowTfCY7l8n5FIyIautADGaLW1z7EqReCOaj4XYOLrrhnTYfY
         mcmgiVU7OYSWNZ9IZmOT7g047ZUhFM9N64Idq69I4N+DyiOPPzez/Du9qwc/CZBFvXG9
         IGN2xIodPbyVfwhnqH2L7N2+p6MzgOwMblIw2ez5GEgZR8xeFw2dkIsWh8/84pSAAYWD
         38Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906300; x=1719511100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dj3DX12QYavc1OOQJN+Lhj+prqOyJf9zJxwWhTZ5aE8=;
        b=DQL0Yzc+3XLHj+Fcjk6FF7a8aKp8IRTIw2eSCYrpBsOKTwzPy++FNqzKaHQejEiqaO
         nkp36zP+ElwPnlXoRATV/ZCM5jnvvlf75eTF9p+A4mNuu6sj0kv+HL1Noen4t41IReFb
         KA5K0mBbK2Vhfp/DsFay5gUCYzCBdGzYOfLrTIcvJkG9ifehCB+3uA//P85RUaUMRYhL
         d0oNmsBqJVzyFY7kqnkEMN6KRvEDcmkVy7WT7AOXnczRVAUQp6Uee+uQju9BYiaTrnvF
         s9IHskvXAbNTEbA7OAK5hgSmREb3DFvk+1PGo5hWOBery4x9n7f4VDjC+u/2dfSG35Es
         yyQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/KkpcWkQhVLHURGRIcCaoAMBHywI5S5QID2+RKnoGg6xlADxhFrTflcL+VsqTtXbQDtU+CfdPH08jYX6S8Xjvpi3FYNbDrUnkak0=
X-Gm-Message-State: AOJu0YxTAbIvB6+dVZA1Z6cu9P+oQ20jbd5RICfck87pBxLoOAJhwNgN
	iJ07HIr6vxISk4mki7LgCv2CWIdwoVBPWGCep7IDLZCQv6filo4UCoFS0anUrfA=
X-Google-Smtp-Source: 
 AGHT+IEhPPFEKagTHzQMOwX7NrYh9+xyhRsxpQErqvlswtZC5Lb/tm5y+kINO8slxfzNDjQFWUOp4Q==
X-Received: by 2002:a17:907:a646:b0:a6f:5192:6f4d with SMTP id
 a640c23a62f3a-a6fab60321fmr428721866b.8.1718906299800;
        Thu, 20 Jun 2024 10:58:19 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f42e80sm781370766b.186.2024.06.20.10.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 10:58:19 -0700 (PDT)
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
Subject: [Patch v4 02/10] dt-bindings: dma: Add lpc32xx DMA mux binding
Date: Thu, 20 Jun 2024 19:56:33 +0200
Message-Id: <20240620175657.358273-3-piotr.wojtaszczyk@timesys.com>
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
Message-ID-Hash: 564QSAPPFM74FTDMNELCBUG4G265YKYA
X-Message-ID-Hash: 564QSAPPFM74FTDMNELCBUG4G265YKYA
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:20:06 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/564QSAPPFM74FTDMNELCBUG4G265YKYA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

LPC32XX SoCs use pl080 dma controller which have few request signals
multiplexed between peripherals. This binding describes how devices can
use the multiplexed request signals.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v4:
- This patch is new in v4

 .../bindings/dma/nxp,lpc3220-dmamux.yaml      | 56 +++++++++++++++++++
 MAINTAINERS                                   |  9 +++
 2 files changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml

diff --git a/Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml b/Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
new file mode 100644
index 000000000000..a5384b6c67fc
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/nxp,lpc3220-dmamux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DMA multiplexer for LPC32XX SoC (DMA request router)
+
+maintainers:
+  - J.M.B. Downing <jonathan.downing@nautel.com>
+  - Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
+
+allOf:
+  - $ref: dma-router.yaml#
+
+properties:
+  "#dma-cells":
+    const: 3
+    description: |
+      First two cells same as for device pointed in dma-masters.
+      Third cell represents mux value for the request.
+
+  compatible:
+    const: nxp,lpc3220-dmamux
+
+  dma-masters:
+    description: phandle to a dma node compatible with arm,pl080
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - dma-masters
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@40004000 {
+      compatible = "nxp,lpc3220-creg", "syscon", "simple-mfd";
+      reg = <0x40004000 0x114>;
+      ranges = <0 0x40004000 0x114>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      dma-router@7c {
+        compatible = "nxp,lpc3220-dmamux";
+        reg = <0x7c 0x8>;
+        #dma-cells = <3>;
+        dma-masters = <&dma>;
+      };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index aacccb376c28..f7adf9f66dfa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2396,6 +2396,15 @@ F:	drivers/usb/host/ohci-nxp.c
 F:	drivers/watchdog/pnx4008_wdt.c
 N:	lpc32xx
 
+ARM/LPC32XX DMAMUX SUPPORT
+M:	J.M.B. Downing <jonathan.downing@nautel.com>
+M:	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
+R:	Vladimir Zapolskiy <vz@mleia.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
+N:	lpc32xx
+
 ARM/Marvell Dove/MV78xx0/Orion SOC support
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
-- 
2.25.1

