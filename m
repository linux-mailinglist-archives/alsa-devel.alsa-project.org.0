Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1CF75C114
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:15:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C6DF886;
	Fri, 21 Jul 2023 10:14:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C6DF886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689927346;
	bh=pzp1JaA+JPNXTCJp/c49jH01vb1JR//f6+n/E4SzSXw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ivieYlDze/z+zoqX5jDAI2D84hXaF6bP0FcpdWAaElThh+o4aGflM/BFzfaHF9xHP
	 wUuZ9PWpPGYtw3tR/WWmn5+4eC2/N5dBSsPSQtXy5jEFOdi6lpeLcSyzmV6iqop9xb
	 ON4U4VLy8jTJ+uzod+5+Y68Bt1OBJdFMUNEoY4GU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 856D8F8067E; Fri, 21 Jul 2023 10:09:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C03C5F80677;
	Fri, 21 Jul 2023 10:09:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F118F80520; Thu, 20 Jul 2023 10:30:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A6B3F8055A
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 10:30:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A6B3F8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=J2p763lZ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 47679619D6;
	Thu, 20 Jul 2023 08:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9AF4BC4E77F;
	Thu, 20 Jul 2023 08:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689841797;
	bh=pzp1JaA+JPNXTCJp/c49jH01vb1JR//f6+n/E4SzSXw=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=J2p763lZbYHJiviGN+wFS6ixuD/U76cJTgKE8T5Se1ws8AyiPa8EK6uK/PkgxFH7q
	 7o98qmHYr5RhxJ7cyvjSpv1waO8kwp+loYlIpcpNc85UqpkAZHZXNp00XRSLAppXk5
	 UY2ugfMRbhQ3cLcjUm5gpMgbcnwCmMyBtW09XcSZiMRAEuoPmRHBTHGHzYCsSjUNJN
	 6fKhihsHE56QToU0BhooyxNVTNneRZTKDG3kQUNjbDoZUkIUz05g6PVfLuJRI/vbBA
	 4bhgx5OFVucXdAuWt6AD7icU+6brF48Muf3y5JSTn4mLrqQ+kyDS0PPJG/FgqCohbB
	 CYtmos2yvA6uw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 848F8C05053;
	Thu, 20 Jul 2023 08:29:57 +0000 (UTC)
From: 
 Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Date: Thu, 20 Jul 2023 14:29:17 +0300
Subject: [PATCH v3 17/42] dt-bindings: spi: Add Cirrus EP93xx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230605-ep93xx-v3-17-3d63a5f1103e@maquefel.me>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
In-Reply-To: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
To: Hartley Sweeten <hsweeten@visionengravers.com>,
 Lennert Buytenhek <kernel@wantstofly.org>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Lukasz Majewski <lukma@denx.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Nikita Shubin <nikita.shubin@maquefel.me>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Sebastian Reichel <sre@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Mark Brown <broonie@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Damien Le Moal <dlemoal@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Andy Shevchenko <andy@kernel.org>,
 Michael Peters <mpeters@embeddedTS.com>, Kris Bahnsen <kris@embeddedTS.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org,
 linux-input@vger.kernel.org, alsa-devel@alsa-project.org
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689852591; l=1959;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=AxoHizM2xVTYfO7T/F4P3sFVaejiyQGM/I+PCfvzNT0=; =?utf-8?q?b=3D7rE4S5nRbIfr?=
 =?utf-8?q?qHTGq+ylrJfaaRilaMQDNu/rrGgO3wN1Y9dpKrS+8CH0UPo6kZHUESBBiROpQGA3?=
 Hs42xmvOBD6RSxWG8faenVTwimXi4r92e5BQMB2W8ai7MR6rF2j6
X-Developer-Key: i=nikita.shubin@maquefel.me; a=ed25519;
 pk=vqf5YIUJ7BJv3EJFaNNxWZgGuMgDH6rwufTLflwU9ac=
X-Endpoint-Received: 
 by B4 Relay for nikita.shubin@maquefel.me/20230718 with auth_id=65
X-Original-From: Nikita Shubin <nikita.shubin@maquefel.me>
X-MailFrom: devnull+nikita.shubin.maquefel.me@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ELQQKWLFHIRUYIVX3T4X5OVBNKSSYCRT
X-Message-ID-Hash: ELQQKWLFHIRUYIVX3T4X5OVBNKSSYCRT
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:09:34 +0000
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: nikita.shubin@maquefel.me
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ELQQKWLFHIRUYIVX3T4X5OVBNKSSYCRT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Nikita Shubin <nikita.shubin@maquefel.me>

Add YAML bindings for ep93xx SoC SPI.

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 .../devicetree/bindings/spi/cirrus,ep9301-spi.yaml | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/cirrus,ep9301-spi.yaml b/Documentation/devicetree/bindings/spi/cirrus,ep9301-spi.yaml
new file mode 100644
index 000000000000..72b8f59d01cb
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/cirrus,ep9301-spi.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/cirrus,ep9301-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: EP93xx SoC SPI controller
+
+maintainers:
+  - Alexander Sverdlin <alexander.sverdlin@gmail.com>
+  - Nikita Shubin <nikita.shubin@maquefel.me>
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: cirrus,ep9301-spi
+      - items:
+          - enum:
+              - cirrus,ep9302-spi
+              - cirrus,ep9307-spi
+              - cirrus,ep9312-spi
+              - cirrus,ep9315-spi
+          - const: cirrus,ep9301-spi
+
+  reg:
+    items:
+      - description: SPI registers region
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: SPI Controller reference clock source
+
+  dmas:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/clock/cirrus,ep93xx-clock.h>
+    spi@808a0000 {
+      compatible = "cirrus,ep9301-spi";
+      reg = <0x808a0000 0x18>;
+      interrupt-parent = <&vic1>;
+      interrupts = <21>;
+      clocks = <&syscon EP93XX_CLK_SPI>;
+      cs-gpios = <&gpio5 2 GPIO_ACTIVE_HIGH>;
+    };
+
+...

-- 
2.39.2

