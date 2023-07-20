Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF5775C167
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:21:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D037DEB;
	Fri, 21 Jul 2023 10:20:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D037DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689927709;
	bh=Rn85mdJ/ubzChlkyTdaJIEQMNcdiS2eD3d6eKeixrwY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HwpzKvTrsyk/kbYxKIAyMs+CMR1brGzZTNoxgERWJiOsFTuzH8KCoGGV1tzgtH2e3
	 L9RWLoCZwN43Sp3hmZuY7SxJTwI985UeoylIRUkN4eSPao1JoK5D9JHiO5+ZvbsoWk
	 C5lN3D/802OsRuIXqsZhbHMyx9gxIgnmqT9MLv6A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A90CF805FF; Fri, 21 Jul 2023 10:12:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DEE8F805FF;
	Fri, 21 Jul 2023 10:12:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A82AFF80535; Thu, 20 Jul 2023 10:31:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D12F7F80588
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 10:30:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D12F7F80588
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WAM+gjNO
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5CFED61CBD;
	Thu, 20 Jul 2023 08:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22EFFC00936;
	Thu, 20 Jul 2023 08:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689841799;
	bh=Rn85mdJ/ubzChlkyTdaJIEQMNcdiS2eD3d6eKeixrwY=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=WAM+gjNO2TOxrg2bHfy4hQC6J5Yy1mao9ey4t60yy5Sd8paDf7taVO7PO+9scuBb6
	 y0d24CXTbV5g/MueOgTtMMAiMUNHgjJ2fvQQ3wwed4ngJYvMJX6/EgKHwSrZmHrKyS
	 2owDM0u3XWWjW5+o2TVMi/2zGAItja4mg2xK9dpD2jW20u61Jj3JKmiUCBKLwtKuYE
	 WXShzeIqez3ddEO/zxCzrwqpJ2OW1v6q13t4Xow8FT18bkDWe+aRdHEt6PPq/ScQ4N
	 E9WRGb/wmUQ1ngiWVoBfObdg3Uln4OuNCYvX+s548U8Fd57mRM34Oz4H5qsRSHhHgy
	 52OTAGmeGJ3JQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 079D1C3DA4A;
	Thu, 20 Jul 2023 08:29:59 +0000 (UTC)
From: 
 Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Date: Thu, 20 Jul 2023 14:29:40 +0300
Subject: [PATCH v3 40/42] ARM: ep93xx: soc: drop defines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230605-ep93xx-v3-40-3d63a5f1103e@maquefel.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689852591; l=3461;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=/0hu0wNyYry9eR46z/4lIsm3+iKNRxnRunuFsPli+8o=; =?utf-8?q?b=3Dt8Gn2nV56UbD?=
 =?utf-8?q?luRJPQc3FRT4VxEEMl7OaEwz+VnOlVqplWzIXprCGjvnSxKqTmm6TVGiAxU3uE3Z?=
 hOjGjomdBuHASZBWo5WDu100TssjQmqkye26+BwegESTc7k8aeLG
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
Message-ID-Hash: SZE7XKCLW2FLXAGKTHRGFDRFO5I7MRHQ
X-Message-ID-Hash: SZE7XKCLW2FLXAGKTHRGFDRFO5I7MRHQ
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:11:53 +0000
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: nikita.shubin@maquefel.me
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Nikita Shubin <nikita.shubin@maquefel.me>

Remove unnecessary defines, as we dropped board files.

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 include/linux/platform_data/eth-ep93xx.h    | 10 ---------
 include/linux/platform_data/keypad-ep93xx.h | 32 -----------------------------
 include/linux/soc/cirrus/ep93xx.h           | 13 ------------
 3 files changed, 55 deletions(-)

diff --git a/include/linux/platform_data/eth-ep93xx.h b/include/linux/platform_data/eth-ep93xx.h
deleted file mode 100644
index 8eef637a804d..000000000000
--- a/include/linux/platform_data/eth-ep93xx.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _LINUX_PLATFORM_DATA_ETH_EP93XX
-#define _LINUX_PLATFORM_DATA_ETH_EP93XX
-
-struct ep93xx_eth_data {
-	unsigned char	dev_addr[6];
-	unsigned char	phy_id;
-};
-
-#endif
diff --git a/include/linux/platform_data/keypad-ep93xx.h b/include/linux/platform_data/keypad-ep93xx.h
deleted file mode 100644
index 3054fced8509..000000000000
--- a/include/linux/platform_data/keypad-ep93xx.h
+++ /dev/null
@@ -1,32 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __KEYPAD_EP93XX_H
-#define __KEYPAD_EP93XX_H
-
-struct matrix_keymap_data;
-
-/* flags for the ep93xx_keypad driver */
-#define EP93XX_KEYPAD_DISABLE_3_KEY	(1<<0)	/* disable 3-key reset */
-#define EP93XX_KEYPAD_DIAG_MODE		(1<<1)	/* diagnostic mode */
-#define EP93XX_KEYPAD_BACK_DRIVE	(1<<2)	/* back driving mode */
-#define EP93XX_KEYPAD_TEST_MODE		(1<<3)	/* scan only column 0 */
-#define EP93XX_KEYPAD_AUTOREPEAT	(1<<4)	/* enable key autorepeat */
-
-/**
- * struct ep93xx_keypad_platform_data - platform specific device structure
- * @keymap_data:	pointer to &matrix_keymap_data
- * @debounce:		debounce start count; terminal count is 0xff
- * @prescale:		row/column counter pre-scaler load value
- * @flags:		see above
- */
-struct ep93xx_keypad_platform_data {
-	struct matrix_keymap_data *keymap_data;
-	unsigned int	debounce;
-	unsigned int	prescale;
-	unsigned int	flags;
-	unsigned int	clk_rate;
-};
-
-#define EP93XX_MATRIX_ROWS		(8)
-#define EP93XX_MATRIX_COLS		(8)
-
-#endif	/* __KEYPAD_EP93XX_H */
diff --git a/include/linux/soc/cirrus/ep93xx.h b/include/linux/soc/cirrus/ep93xx.h
index 77490fe466c6..89ce4867df3a 100644
--- a/include/linux/soc/cirrus/ep93xx.h
+++ b/include/linux/soc/cirrus/ep93xx.h
@@ -2,7 +2,6 @@
 #ifndef _SOC_EP93XX_H
 #define _SOC_EP93XX_H
 
-struct platform_device;
 struct regmap;
 
 #define EP93XX_CHIP_REV_D0	3
@@ -11,15 +10,6 @@ struct regmap;
 #define EP93XX_CHIP_REV_E1	6
 #define EP93XX_CHIP_REV_E2	7
 
-#if defined(CONFIG_EP93XX_SOC_COMMON)
-int ep93xx_i2s_acquire(void);
-void ep93xx_i2s_release(void);
-unsigned int ep93xx_chip_revision(void);
-
-#else
-static inline int ep93xx_i2s_acquire(void) { return 0; }
-static inline void ep93xx_i2s_release(void) {}
-
 #if defined(CONFIG_EP93XX_SOC)
 void ep93xx_syscon_swlocked_write(struct regmap *map, unsigned int reg, unsigned int val);
 void ep93xx_devcfg_set_clear(struct regmap *map, unsigned int set_bits, unsigned int clear_bits);
@@ -33,9 +23,6 @@ static inline void ep93xx_devcfg_set_clear(struct regmap *map, unsigned int set_
 
 void ep93xx_swlocked_update_bits(struct regmap *map, unsigned int reg,
 				unsigned int mask, unsigned int val) { }
-static inline unsigned int ep93xx_chip_revision(void) { return 0; }
-#endif
-
 #endif
 
 #endif

-- 
2.39.2

