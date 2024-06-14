Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3ED90C343
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 07:54:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8725E93A;
	Tue, 18 Jun 2024 07:54:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8725E93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718690091;
	bh=FCvdQ9Mqq/5f6omtz21uDArlMjNyLNbyl+OdqwEiar8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uwX3+aw8mk+J0jk+lc0iCUICqKOYuwN21Sip2lg2IuXY/gReA5ZbnKXAVtnaUqlnd
	 8/wHb1+wLtVEVbEV9fO0zLMjfAIQW7/i1kzy+gAdX/7XO7vZ/v+ZmWXsEKe8PP1Td8
	 oyaPes2gJC9dlPgzTj7VwntFzpObO2/X/mLSjq/U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BAD8F805AA; Tue, 18 Jun 2024 07:54:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B01EF805C6;
	Tue, 18 Jun 2024 07:54:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19177F80448; Fri, 14 Jun 2024 18:35:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AEF94F800E9
	for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2024 18:35:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEF94F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=timesys-com.20230601.gappssmtp.com
 header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=NUa57kOQ
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-57c76497cefso2805744a12.1
        for <alsa-devel@alsa-project.org>;
 Fri, 14 Jun 2024 09:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718382938;
 x=1718987738; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9oBeI9t2GnUOwDqqWhnLz6JoWWhocuIEEtazuodx7Q=;
        b=NUa57kOQbdw1tW934gLDBNRtFThOnlRqyAMgeuyGjXpVoBq38E6+KjN1+c8QbLOFL/
         40WNnUdQPTa1/VAlJJYRTJ2vlv4hkT4BCQZgPuJnKcviJ9ieq9sgwmfTPYtRz8+E3LDq
         /aON3FI20H6i4PWOu0wAivgCFdytoKxmP+IWJZOSDFBFAvzUjZOM4gjV8Nq3IFRnBEXa
         vCrphKCd5r0KaamenhZQ7FFlYQse56eOFpuHGpBm3HjSpVdh7rycJvC8vjii7dXAnoi0
         F6yuYmu5Xj93u24KRjrtK+ADlUUhdDEnr2msEtqCajLGSONh3GPlZlkquSNXaM1G6OhH
         ie5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718382938; x=1718987738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9oBeI9t2GnUOwDqqWhnLz6JoWWhocuIEEtazuodx7Q=;
        b=gQ+/+pyiOWJZ5Jkj7LqcLrfZrfDtiV1XzGPZdPVJmxQ7ls3q+H2AoJMOX0MLgxGwQ4
         fL+twpEDjgDtR3u4Enb+L5wJ4lN3o7IaQf425JcRW3Zt4L1zV28zKCGKdqy7Ios+PzxT
         Jl/DQUoGdKPsIuV8qr2NFjN5yD5PfcolvN/rfd486qPMQYjgfqEBM/tdKnh0UeCFZMzp
         p58WP0zkst5IB14O0MsdrPAhpTeQOBjHMdYZSUghHrm7cs3yjpnSHQ2UZUcI2wMOu63H
         /NhS2a05gFmFV/WlkL5ghQzop7w35M8eik7CB4QK4D5K6Z8BCu1kqhJqaGYi4n2QE6Eq
         Lneg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5xMqpvAmDF8YNapbe+b7PrB309Jc/yt0dK9jM6uSuuZbsR6DyTyr77mDlMfTFKNjdVKvyGY1qFdcJz+dubk593Gn1Tyxeuv3/wbs=
X-Gm-Message-State: AOJu0Yz/k5LC6sZ0oXoxWfklPcyGNrA1Ptc0xxm4L1ylZsQoFcOQSe9y
	uI0+I2oF71rnG3x+WtZcTVIYtKHBT5EIwIirsZ2eRSWNGO3Ga3KGY/d3sdxHRd8=
X-Google-Smtp-Source: 
 AGHT+IHnLwjsD9g/DM137764Vs7MfVOMBOwOsSoO0JMf1vY4fTQen0QFGoBNKv8y01TlfePSSWUDFw==
X-Received: by 2002:a50:c19a:0:b0:57c:7eb6:440a with SMTP id
 4fb4d7f45d1cf-57cbd6497ccmr2425469a12.3.1718382938387;
        Fri, 14 Jun 2024 09:35:38 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72da156sm2462893a12.22.2024.06.14.09.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 09:35:38 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: 
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Russell King <linux@armlinux.org.uk>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Chancel Liu <chancel.liu@nxp.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 1/4] ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT binding
Date: Fri, 14 Jun 2024 18:34:49 +0200
Message-Id: <20240614163500.386747-2-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240614163500.386747-1-piotr.wojtaszczyk@timesys.com>
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
 <20240614163500.386747-1-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: piotr.wojtaszczyk@timesys.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5ZZ3QJ7WMAHFHGWYUZ7HPRCMEZV7QIK7
X-Message-ID-Hash: 5ZZ3QJ7WMAHFHGWYUZ7HPRCMEZV7QIK7
X-Mailman-Approved-At: Tue, 18 Jun 2024 05:28:28 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5ZZ3QJ7WMAHFHGWYUZ7HPRCMEZV7QIK7/>
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

 .../bindings/sound/nxp,lpc3220-i2s.yaml       | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml

diff --git a/Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml b/Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
new file mode 100644
index 000000000000..04a1090f70cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
@@ -0,0 +1,69 @@
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
+  dma-vc-names:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description: |
+      names of virtual pl08x dma channels for tx and rx
+      directions in this order.
+    minItems: 2
+    maxItems: 2
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - dma-vc-names
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
+      dma-vc-names = "i2s0-tx", "i2s0-rx";
+      #sound-dai-cells = <0>;
+    };
+
+...
-- 
2.25.1

