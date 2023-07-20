Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC0575C124
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:17:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9C18843;
	Fri, 21 Jul 2023 10:16:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9C18843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689927433;
	bh=BDkNWhK4mwTKXzVKcu/Yt9kaeuypY8r7OS8gXSQJXh8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tZXYwLz/aL8LJ92O5kHRYuGql9ONuvMvDkcHJdd2xMFwEm+zu/SLqtS+k23jWOpGo
	 shA3euRaphf5GE+zMNnjTQhnLMf36Vh35PM3DiUMmJYTm8OpQ596tXftQ7DB3ujLkd
	 rIDUhT7Lft8yoaZ11slUgkrZIZGqjBfgW3vtxURs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E3F5F80570; Fri, 21 Jul 2023 10:10:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35E13F80695;
	Fri, 21 Jul 2023 10:10:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 373CAF80520; Thu, 20 Jul 2023 10:30:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CDA3CF8055B
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 10:30:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDA3CF8055B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cQjySL1c
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8F28F619D9;
	Thu, 20 Jul 2023 08:30:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05923C32774;
	Thu, 20 Jul 2023 08:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689841798;
	bh=BDkNWhK4mwTKXzVKcu/Yt9kaeuypY8r7OS8gXSQJXh8=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=cQjySL1c9uqFTO2Ma3XeyvCY9d9aLhvbXMwlz45R/Ye8KWosPYHg0HdGRsO6DZAxw
	 2HrmGAxpWgtbgpaAkwjjWRTgpLBsEUWYIakpjEVGpORm1Ix+vo2aQZJ/fDE+n7DB6E
	 XMUBY4HytJL/kyyvCPQR7wDV2zCUSzran/9ZKGLMSDIW1SqEGIr01oZIrO32CdZgFq
	 gzIdMIJGKi1BoZu8eEf3t2Jbr/5FfH8MaEDAGErDcrITggEqRnvkosFnjiFUGwICRu
	 BOjXsiHrUiq3/vf+yEaCGMZTmbQdaXEnXtstKjLvH7+oG+wxkjiyWpTtdXVmeLSrrx
	 FtbgHpxv4yfnw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4560C10F19;
	Thu, 20 Jul 2023 08:29:57 +0000 (UTC)
From: 
 Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Date: Thu, 20 Jul 2023 14:29:23 +0300
Subject: [PATCH v3 23/42] dt-bindings: mtd: Add ts7200 nand-controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230605-ep93xx-v3-23-3d63a5f1103e@maquefel.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689852591; l=1560;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=Rm79APKpgWqTWIHqZoCMutcu3LlqwL0Vim6h4nBUkgQ=; =?utf-8?q?b=3DA8SrRvEXg4c7?=
 =?utf-8?q?hSSu7nXdInw5iFf+YwFsJ9sdOILd6aVNjVFmUjR0dDg74XBuHdcNJp+ZVJ0EiqtI?=
 EmGgqkQYDS7yDl40oetxlAGOVaPesl61jDiTKgEHx2NoBydIlyMH
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
Message-ID-Hash: 5VQKFYS2HWFEUMQURK52TQTJOZFRZZAG
X-Message-ID-Hash: 5VQKFYS2HWFEUMQURK52TQTJOZFRZZAG
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:10:32 +0000
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: nikita.shubin@maquefel.me
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5VQKFYS2HWFEUMQURK52TQTJOZFRZZAG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Nikita Shubin <nikita.shubin@maquefel.me>

Add YAML bindings for ts7200 NAND Controller.

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 .../devicetree/bindings/mtd/technologic,nand.yaml  | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/technologic,nand.yaml b/Documentation/devicetree/bindings/mtd/technologic,nand.yaml
new file mode 100644
index 000000000000..b64f15a38428
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/technologic,nand.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/technologic,nand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Technologic Systems NAND controller
+
+maintainers:
+  - Nikita Shubin <nikita.shubin@maquefel.me>
+
+allOf:
+  - $ref: nand-controller.yaml
+
+properties:
+  compatible:
+    oneOf:
+      - const: technologic,ts7200-nand
+      - items:
+          - enum:
+              - technologic,ts7300-nand
+              - technologic,ts7260-nand
+              - technologic,ts7250-nand
+          - const: technologic,ts7200-nand
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    nand-controller@60000000 {
+      compatible = "technologic,ts7200-nand";
+      reg = <0x60000000 0x8000000>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+      nand@0 {
+        reg = <0>;
+      };
+    };
+
+...

-- 
2.39.2

