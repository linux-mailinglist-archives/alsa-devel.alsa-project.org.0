Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4581A75C12B
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:18:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90A45E97;
	Fri, 21 Jul 2023 10:17:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90A45E97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689927484;
	bh=zgjoCziI93ylFrk85C0R99RGg75O4VmK6LQcYMqhmCk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Rf4BwGMjzn1UkrDfhU3yCcdl9VC9Qa/Wex6syUOu02ER3aPiSrIIiEhmuBm3ivwpi
	 8GUgSiMT6cA9M3oWFEf6p8s5i73gJqC7nypHEiMjhVTaYcKaISOyn5h+zj8olI3ChU
	 9njPBIr/R4Jhmd8xkSeTowFNJ2agqMjuYwkClIJM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FE6BF806AB; Fri, 21 Jul 2023 10:10:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5848FF806A7;
	Fri, 21 Jul 2023 10:10:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A737F8047D; Thu, 20 Jul 2023 10:30:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 045B1F8056F
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 10:30:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 045B1F8056F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VH5x48KX
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 89DF261BDC;
	Thu, 20 Jul 2023 08:30:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3AA0EC3279E;
	Thu, 20 Jul 2023 08:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689841798;
	bh=zgjoCziI93ylFrk85C0R99RGg75O4VmK6LQcYMqhmCk=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=VH5x48KXIDOUCCq5btTiyFeTJnFXQRkbv3WIc7RvWixlETL0JTtWD7GYen9QOLWnm
	 6c/FpWnx76nKCfhKCW4pv8BTZLhUrfZhAohlswuDLTzZGyhiLsH6PZ46fyizabATIo
	 +OOu6c3a3jFi9nOi6oaj9IkWeFc1Sj5LLYiZGXrUrjYRhPvJHc4LnmCuV1vq1AYLIw
	 25aAiOl+9haBrpj/psKdu3aZJxtMciwQ+vfmdmZfLKy5RiPH3TSxX0LD3X2GlQ9bzZ
	 NlaaCUzQlse7WRdT4xgJuGvDzG7t54qC/sYCtn8xhAycFhxICPXwk4s6mz7g6rSWZV
	 YqGlhs//LDgdg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E184C3DA43;
	Thu, 20 Jul 2023 08:29:58 +0000 (UTC)
From: 
 Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Date: Thu, 20 Jul 2023 14:29:26 +0300
Subject: [PATCH v3 26/42] ata: pata_ep93xx: add device tree support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230605-ep93xx-v3-26-3d63a5f1103e@maquefel.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689852591; l=2575;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=k/Fzw6JdkE/3suqIiyO5Zhyi7BJas3Z1DAR17iWACYM=; =?utf-8?q?b=3Dk+ORk4S+LFBc?=
 =?utf-8?q?P5CmCkp0oZYl98QLD0d1fLzPkLcanD+VxyScBfMYMDLH2SX/gub+L0/xrW3NXAvd?=
 oDttOcshA50/3i3jd3h3wByJH3KV5lorfsUjlKEZR9ua8Z6c8eLB
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
Message-ID-Hash: 6UB5UXZANMX4NB754SSUJLTEUR6P723C
X-Message-ID-Hash: 6UB5UXZANMX4NB754SSUJLTEUR6P723C
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:10:32 +0000
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: nikita.shubin@maquefel.me
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6UB5UXZANMX4NB754SSUJLTEUR6P723C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Nikita Shubin <nikita.shubin@maquefel.me>

- Add OF ID match table
- Drop ep93xx_chip_revision and use soc_device_match instead

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 drivers/ata/pata_ep93xx.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/ata/pata_ep93xx.c b/drivers/ata/pata_ep93xx.c
index c6e043e05d43..a88824dfc5fa 100644
--- a/drivers/ata/pata_ep93xx.c
+++ b/drivers/ata/pata_ep93xx.c
@@ -40,9 +40,11 @@
 #include <linux/ata.h>
 #include <linux/libata.h>
 #include <linux/platform_device.h>
+#include <linux/sys_soc.h>
 #include <linux/delay.h>
 #include <linux/dmaengine.h>
 #include <linux/ktime.h>
+#include <linux/mod_devicetable.h>
 
 #include <linux/platform_data/dma-ep93xx.h>
 #include <linux/soc/cirrus/ep93xx.h>
@@ -910,6 +912,12 @@ static struct ata_port_operations ep93xx_pata_port_ops = {
 	.port_start		= ep93xx_pata_port_start,
 };
 
+static const struct soc_device_attribute ep93xx_soc_table[] = {
+	{ .revision = "E1", .data = (void *)ATA_UDMA3 },
+	{ .revision = "E2", .data = (void *)ATA_UDMA4 },
+	{ /* sentinel */ }
+};
+
 static int ep93xx_pata_probe(struct platform_device *pdev)
 {
 	struct ep93xx_pata_data *drv_data;
@@ -939,7 +947,7 @@ static int ep93xx_pata_probe(struct platform_device *pdev)
 
 	drv_data = devm_kzalloc(&pdev->dev, sizeof(*drv_data), GFP_KERNEL);
 	if (!drv_data) {
-		err = -ENXIO;
+		err = -ENOMEM;
 		goto err_rel_gpio;
 	}
 
@@ -976,12 +984,11 @@ static int ep93xx_pata_probe(struct platform_device *pdev)
 	 * so this driver supports only UDMA modes.
 	 */
 	if (drv_data->dma_rx_channel && drv_data->dma_tx_channel) {
-		int chip_rev = ep93xx_chip_revision();
+		const struct soc_device_attribute *match;
 
-		if (chip_rev == EP93XX_CHIP_REV_E1)
-			ap->udma_mask = ATA_UDMA3;
-		else if (chip_rev == EP93XX_CHIP_REV_E2)
-			ap->udma_mask = ATA_UDMA4;
+		match = soc_device_match(ep93xx_soc_table);
+		if (match)
+			ap->udma_mask = (unsigned int) match->data;
 		else
 			ap->udma_mask = ATA_UDMA2;
 	}
@@ -1016,9 +1023,16 @@ static int ep93xx_pata_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id ep93xx_pata_of_ids[] = {
+	{ .compatible = "cirrus,ep9312-pata" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ep93xx_pata_of_ids);
+
 static struct platform_driver ep93xx_pata_platform_driver = {
 	.driver = {
 		.name = DRV_NAME,
+		.of_match_table = ep93xx_pata_of_ids,
 	},
 	.probe = ep93xx_pata_probe,
 	.remove = ep93xx_pata_remove,

-- 
2.39.2

