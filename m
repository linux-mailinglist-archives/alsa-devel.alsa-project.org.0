Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B384E75C13E
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:19:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF6C2DF3;
	Fri, 21 Jul 2023 10:18:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF6C2DF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689927577;
	bh=8fCdzcn2VcvnUQp2D6Fuk/QxfB3MwobNYAHefW+j36I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tM/Lgqm2yjbNpAeuwRov/jJ0YtIx3tliTAdBNw5ENmDzIf4JYpOrcjqHs7PKSGPMV
	 D83uqljB4SQxs/E8DsRlAYhRD4nk0QYgqYo9BnLnSHcjiN1SwjQ3b5TiZrIT/QS8Ao
	 uZAErPVxcwbVM4QsckzcHxWq2lRiTXrHaF9PCHsE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79374F806FC; Fri, 21 Jul 2023 10:11:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8D47F80707;
	Fri, 21 Jul 2023 10:11:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 503B0F8032D; Thu, 20 Jul 2023 10:30:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ACF0DF80579
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 10:30:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACF0DF80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cCUiEtuE
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0A0F961C04;
	Thu, 20 Jul 2023 08:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 63CB8C56895;
	Thu, 20 Jul 2023 08:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689841798;
	bh=8fCdzcn2VcvnUQp2D6Fuk/QxfB3MwobNYAHefW+j36I=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=cCUiEtuEjAhC1gslP/2FJwjBOyBVMor9USDpBJDX0Ov7V4PYMHAt0ZEjuBVmxFOAX
	 vptZENz5foIh9iHUOEuxY4uYiN2deZSFtAblqcRStCy8Tq69pIkdvboorhOufpoBNj
	 RRiCVNyQj6XTJKwOCLUkGcbdZ0H2ZF14BTU6pnwAcKe/ZSiRX6vEwBvJZfkkCe+7OC
	 QwSodb5cvyQ6X0GIt/PJpt27MKAkj6QRdaXOFgJT1YAq6HjCk0jL24OXshkNnJqPyS
	 kEXBzm4iOTubYqp+yylTekLxmXK/HiHGtrbsXQGBz2vtNlDp9JTFD7v0ykv4QXQTgi
	 h6Q4ZUqsTxxjg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52FA9C25B5B;
	Thu, 20 Jul 2023 08:29:58 +0000 (UTC)
From: 
 Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Date: Thu, 20 Jul 2023 14:29:29 +0300
Subject: [PATCH v3 29/42] dt-bindings: rtc: Add ST M48T86
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230605-ep93xx-v3-29-3d63a5f1103e@maquefel.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689852591; l=1263;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=y7M/fGH6tMQwq76PE+jI5ZilaSmr5fjvvIAr9uMS3jI=; =?utf-8?q?b=3DpOrhItnahdeM?=
 =?utf-8?q?aLWqOwXnLm8LwSVShKictgleU6SoWB5mYdPYqvZhnJyD25dN0IUo0TMLoTXjT6Ws?=
 fVhlzy5oA2QpnJidkzSuAnetdTtQ+E7HUleSOUEDY0eDhCDNHmrv
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
Message-ID-Hash: 5ULFWYEKUGFPKXY2FBUR6B32WFYJ6ARN
X-Message-ID-Hash: 5ULFWYEKUGFPKXY2FBUR6B32WFYJ6ARN
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:11:50 +0000
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: nikita.shubin@maquefel.me
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5ULFWYEKUGFPKXY2FBUR6B32WFYJ6ARN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Nikita Shubin <nikita.shubin@maquefel.me>

Add YAML bindings for ST M48T86 / Dallas DS12887 RTC.

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 .../devicetree/bindings/rtc/st,m48t86.yaml         | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/st,m48t86.yaml b/Documentation/devicetree/bindings/rtc/st,m48t86.yaml
new file mode 100644
index 000000000000..e3e12fa23380
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/st,m48t86.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/st,m48t86.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ST M48T86 / Dallas DS12887 RTC with SRAM
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+allOf:
+  - $ref: rtc.yaml
+
+properties:
+  compatible:
+    enum:
+      - st,m48t86
+
+  reg:
+    items:
+      - description: index register
+      - description: data register
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    rtc@10800000 {
+      compatible = "st,m48t86";
+      reg = <0x10800000 0x1>, <0x11700000 0x1>;
+    };
+
+...

-- 
2.39.2

