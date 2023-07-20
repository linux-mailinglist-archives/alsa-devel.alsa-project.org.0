Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D492675C119
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:16:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24568DFA;
	Fri, 21 Jul 2023 10:15:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24568DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689927395;
	bh=DXeC4pUBzc0kZw4JnSIeVRjn05XSer4ygTLBGUi+dI8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jSESncShnL4v+qej3uIOZbu9sgtpCD3gNh287YSQO4q0whAOig+iZp+9ox2yiwhLx
	 VZ+WfbyMCyOw0s6Mh9SeKwcnz+uvt2Do4pXkkcRcHon4VDIGcY5i2whNUkWQf5emMi
	 ExZub9TVkDTePWnRileu/bjOk50sRyODYaTFKxS4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9167CF80688; Fri, 21 Jul 2023 10:10:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11774F80558;
	Fri, 21 Jul 2023 10:10:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09AA1F80520; Thu, 20 Jul 2023 10:30:43 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D4B8FF8055C
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 10:30:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4B8FF8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iQMG0D8O
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CD84761B76;
	Thu, 20 Jul 2023 08:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BA4D3C116AE;
	Thu, 20 Jul 2023 08:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689841797;
	bh=DXeC4pUBzc0kZw4JnSIeVRjn05XSer4ygTLBGUi+dI8=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=iQMG0D8OfxN36JYBonsJ+AVWefoL/J6/QhhL46siRmLsYSEIMsZqxzt0aFU9japdq
	 aFB9mItw1XVxniACRGkJYyk3MobgvIoRb411oa1Z8Jbg7y2HHoUO8uSU1QlxCsmsXe
	 rLA0I7sQWvVfMGLlncIUnEaH09UFSB/awqFhPeTZvEvgeZ7ovzkgfCJSGWfIbv2YlS
	 /dBQOpUezi0UPg3hRDJLBcRdiflHhm3nwMbz3DfaE843ToDzPLpSuGjeonL8xYSCuD
	 6vnH2/HrKPR0nIjLdH4Br4YJGb1QfhvSRJjTc/YjJL/Anbhi/onQ1EhYSmJNCtEu+Z
	 jb/dKkLcy2odw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5050C10F19;
	Thu, 20 Jul 2023 08:29:57 +0000 (UTC)
From: 
 Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Date: Thu, 20 Jul 2023 14:29:19 +0300
Subject: [PATCH v3 19/42] dt-bindings: net: Add Cirrus EP93xx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230605-ep93xx-v3-19-3d63a5f1103e@maquefel.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689852591; l=1962;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=4DfEZMiYnVTNguSCsuE2v4bI4SDI7wkew0CPvBBakt0=; =?utf-8?q?b=3Dngo6yqhI8Svx?=
 =?utf-8?q?v5e4TxWehZCyIUiAIQRwIPATKhlqmOlMFefgFljZIyDJVZOCj7ZRgyWUdiOFJDsi?=
 FO8ZxRhkAt7rHcHfm1tkWQzwYCM1aSiS2nOB1zoBNtgxPVZcY961
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
Message-ID-Hash: TAFBJAIYGWHIXBUARBVT332TTIFZLGN4
X-Message-ID-Hash: TAFBJAIYGWHIXBUARBVT332TTIFZLGN4
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:10:08 +0000
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: nikita.shubin@maquefel.me
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TAFBJAIYGWHIXBUARBVT332TTIFZLGN4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Nikita Shubin <nikita.shubin@maquefel.me>

Add YAML bindings for ep93xx SoC Ethernet Controller.

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 .../devicetree/bindings/net/cirrus,ep9301-eth.yaml | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/cirrus,ep9301-eth.yaml b/Documentation/devicetree/bindings/net/cirrus,ep9301-eth.yaml
new file mode 100644
index 000000000000..580316f33187
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/cirrus,ep9301-eth.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/cirrus,ep9301-eth.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: EP93xx SoC Ethernet Controller
+
+maintainers:
+  - Alexander Sverdlin <alexander.sverdlin@gmail.com>
+  - Nikita Shubin <nikita.shubin@maquefel.me>
+
+allOf:
+  - $ref: ethernet-controller.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: cirrus,ep9301-eth
+      - items:
+          - enum:
+              - cirrus,ep9302-eth
+              - cirrus,ep9307-eth
+              - cirrus,ep9312-eth
+              - cirrus,ep9315-eth
+          - const: cirrus,ep9301-eth
+
+  reg:
+    items:
+      - description: The physical base address and size of IO range
+
+  interrupts:
+    items:
+      - description: Combined signal for various interrupt events
+
+  phy-handle: true
+
+  mdio:
+    $ref: mdio.yaml#
+    unevaluatedProperties: false
+    description: optional node for embedded MDIO controller
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - phy-handle
+
+additionalProperties: false
+
+examples:
+  - |
+    ethernet@80010000 {
+      compatible = "cirrus,ep9301-eth";
+      reg = <0x80010000 0x10000>;
+      interrupt-parent = <&vic1>;
+      interrupts = <7>;
+      phy-handle = <&phy0>;
+    };
+
+...

-- 
2.39.2

