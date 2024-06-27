Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F17F791DF57
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:33:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7191E238D;
	Mon,  1 Jul 2024 14:32:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7191E238D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719837184;
	bh=pLhrZ5IemSdTOWROkP7c38cEvRC3LBemwPPuEetKG/I=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=QnrixO2uUOtfFYdloh/bKtQQQhbTdwuO9z6F1n/1egXoDQtDYabO/J5JVOQ9fHuqW
	 KIPrburITU/QMtT7M1751xzewPRZ5kQkFPJnpxAmLLMrCH2Y5O2GuGtYOxDXZJG2H7
	 dUikGZ0LB0wBfpKKuUc8GCpvt7jZvXBzZcgDjDHg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E0BDF8996B; Mon,  1 Jul 2024 14:23:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25BEFF89968;
	Mon,  1 Jul 2024 14:23:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A00DF80423; Thu, 27 Jun 2024 17:02:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CD177F800ED
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 17:01:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD177F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=timesys-com.20230601.gappssmtp.com
 header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=IMAipuIM
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-57d203d4682so2134108a12.0
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 08:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1719500517;
 x=1720105317; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/QdVnRUTOEEApM29843GOo6CpoS9PWsW91LmoTv3mk=;
        b=IMAipuIMzoWLmbtVcUs7oiaIGXMv0n75T1BehH1NfnjyiFGX8zGJjf7S8e6BJ8ADS7
         F5KXSwBW6dDVTJDVxQ+IyTEQxseaCUS5xhNR2YwsZFMKZNoLhP+AiUQSEMK1BjzHA3QM
         yEdjZcTyNdwgCKSVORMZjkQc48wHu3uoNbs633sYOHdzt9mYXyiDjobi8bNLsiMnKiEf
         oSEWvLz+JhecNyINKqTirnjldVQZs5hgg9Hhvi0vtu0WpsKJpQlFGxQfUj9EHnCB+wU/
         8VK/ehQxsjpL3acJ4tOu5iiWvSZIyQj1CPxKlhPFpS9q/b1tdS201bhUrW66RiBlyoGn
         qO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719500517; x=1720105317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/QdVnRUTOEEApM29843GOo6CpoS9PWsW91LmoTv3mk=;
        b=mIYPpXq/mTz9HUsNmGvgxP97F/rk889ejilFxXrTBt2vIBiQz3Q5fmm8b/s6J9mAvO
         gMGr1Mwygayoi+KZASCHLmaCtMC6POkXyrFD7qRQd0c7cSN4DoTkVvKZA0LEbbU0Ze5Z
         ZphbJ8ooBBibw21ghRkZ+bfZnhzaSxamFS26MXmtoyo5XblTdbUXAwxHL0Ea5NdMDA3l
         mLMEGccZfP2xw+7A/yPo69i0oVc5bvKNDx8bnD2g0fylccbZmlhjWgmQ624uyc/+xAb9
         1j3ACdrKcquPLgFm4B4mA3J6UT3iTv30OffWNK+cIt8YEaTii1pXJ+8XpXqCgHqABMhv
         r0OA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrm+H/0rhPniNPVrwIFSznL6YLXup/F3XHueaGniDNRX5Gj0K+oMinQzhqlv7JnpXkEeZOaBbjr2DsF0GVcsAHHJyxSclgNMc77+o=
X-Gm-Message-State: AOJu0YwMHX2tbzlqN7lF6HxKVWj8m4c0MXtE3Tej3vg/VKkJ0fUWSsAB
	bPpG4aSULSGrifjGC4Z1P0Yw1iIARWoohLLvnX/xMTuAoZjRnmMAskstW//p0CQ=
X-Google-Smtp-Source: 
 AGHT+IEWo8x1/iXINSSRXRjfHX6NuiOJZ+9H3uzsJ+4Q86IVM9o4hb3qxcQgbAHUbFD+wWnFiMHwIQ==
X-Received: by 2002:a17:906:4a12:b0:a6f:d085:9e32 with SMTP id
 a640c23a62f3a-a716593e3efmr933093866b.76.1719500516992;
        Thu, 27 Jun 2024 08:01:56 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a729d7ca289sm67189066b.222.2024.06.27.08.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:01:56 -0700 (PDT)
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
Subject: [Patch v5 02/12] dt-bindings: dma: Add lpc32xx DMA mux binding
Date: Thu, 27 Jun 2024 17:00:20 +0200
Message-Id: <20240627150046.258795-3-piotr.wojtaszczyk@timesys.com>
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
Message-ID-Hash: WJGLJZR7FO6X45QFZEYIIJOQPANS5BON
X-Message-ID-Hash: WJGLJZR7FO6X45QFZEYIIJOQPANS5BON
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:23:04 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WJGLJZR7FO6X45QFZEYIIJOQPANS5BON/>
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
Changes for v5:
- Corrected property order
- Added maxItems to properties
- Fixed example
- Removed "N:: from the MAINTAINERS entry
- Added Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com> to LPC32XX maintainers

Changes for v4:
- This patch is new in v4

 .../bindings/dma/nxp,lpc3220-dmamux.yaml      | 49 +++++++++++++++++++
 MAINTAINERS                                   |  9 ++++
 2 files changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml

diff --git a/Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml b/Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
new file mode 100644
index 000000000000..32f208744154
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
@@ -0,0 +1,49 @@
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
+  compatible:
+    const: nxp,lpc3220-dmamux
+
+  reg:
+    maxItems: 1
+
+  dma-masters:
+    description: phandle to a dma node compatible with arm,pl080
+    maxItems: 1
+
+  "#dma-cells":
+    const: 3
+    description: |
+      First two cells same as for device pointed in dma-masters.
+      Third cell represents mux value for the request.
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
+    dma-router@7c {
+      compatible = "nxp,lpc3220-dmamux";
+      reg = <0x7c 0x8>;
+      dma-masters = <&dma>;
+      #dma-cells = <3>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index aacccb376c28..79b44addc139 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2384,6 +2384,7 @@ N:	lpc18xx
 
 ARM/LPC32XX SOC SUPPORT
 M:	Vladimir Zapolskiy <vz@mleia.com>
+M:	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 T:	git git://github.com/vzapolskiy/linux-lpc32xx.git
@@ -2396,6 +2397,14 @@ F:	drivers/usb/host/ohci-nxp.c
 F:	drivers/watchdog/pnx4008_wdt.c
 N:	lpc32xx
 
+LPC32XX DMAMUX SUPPORT
+M:	J.M.B. Downing <jonathan.downing@nautel.com>
+M:	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
+R:	Vladimir Zapolskiy <vz@mleia.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
+
 ARM/Marvell Dove/MV78xx0/Orion SOC support
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
-- 
2.25.1

