Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEEE75C11B
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:16:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F171DF1;
	Fri, 21 Jul 2023 10:15:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F171DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689927407;
	bh=pQAR+pyrK4gN3o3XWt9qgN/Bx9cfFrie8nL4VUM8QyM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=asuGAFzDbBOc/bVpNYe+NSv7BAijNgx0S1Orsv9Sh7ghNwSZW2Bvp15INBh2h/fqK
	 qyElMqW3KZr2nsq6OaxZbqAhNikNYTkFgFSP+7xRjawh0iyGoaUXVTHewE3qFdwbst
	 v3IOrjF9B52LhvdUkcZEsAFj6gfz5Z5mGHefjSz8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C57F3F8068F; Fri, 21 Jul 2023 10:10:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 257BAF80557;
	Fri, 21 Jul 2023 10:10:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30C2FF804DA; Thu, 20 Jul 2023 10:30:45 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A9B7DF80558
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 10:30:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9B7DF80558
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jG9Hg0br
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8ADBC61B5D;
	Thu, 20 Jul 2023 08:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9D3FC43397;
	Thu, 20 Jul 2023 08:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689841797;
	bh=pQAR+pyrK4gN3o3XWt9qgN/Bx9cfFrie8nL4VUM8QyM=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=jG9Hg0br7owOibTHMo2pRybBxRELQ9pIuCkF9IlfhUOAzRMGJhmggvdFct/auapfv
	 WgjS25bKoO3Q8PTCpg8RokFYp6Hn9fJbOT2ZoDxy30EF8GE8sS/a3KJQHL2mKhbgbf
	 B/ahYJp2OvwaGF3BnXkKuMuI6hIGhaa9EfqcVZNFQ1fd90YYOmbL59dH3TqLpNh4cx
	 Va3K1Bui/+ktXBbBTDosY9gd/r8YuerhHfB5Z5I7JBpUd27RiBqf1wR9paTB+M76V5
	 rReX/I255BRrOJvA2w4VoG47km+rZaWAz12OSOf/YYmhiu1taZdIIwT9m4exutmFOK
	 VoWNW0muKJRtg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9553BC10F00;
	Thu, 20 Jul 2023 08:29:57 +0000 (UTC)
From: 
 Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Date: Thu, 20 Jul 2023 14:29:18 +0300
Subject: [PATCH v3 18/42] spi: ep93xx: add DT support for Cirrus EP93xx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230605-ep93xx-v3-18-3d63a5f1103e@maquefel.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689852591; l=2702;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=ZWn5JZLALLuK4G847aw+YC2k8LjRei15o646pYI1xGQ=; =?utf-8?q?b=3DoP2gssSO03Zn?=
 =?utf-8?q?arhhtGnE6//94HCpOZFh+Aeo3rlZZJA0clEjabXLBxXYXouw6WQ54InIctWc5Z0f?=
 sZfeTcBZDwbSQ0FeDL8QVnLI/DIV+fm/zdBwKiYA1DbI1e2iFVD9
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
Message-ID-Hash: AYFY5FBWCDWUAW32WDAM27E5L6BIZZYS
X-Message-ID-Hash: AYFY5FBWCDWUAW32WDAM27E5L6BIZZYS
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:10:08 +0000
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: nikita.shubin@maquefel.me
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AYFY5FBWCDWUAW32WDAM27E5L6BIZZYS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Nikita Shubin <nikita.shubin@maquefel.me>

- add OF ID match table

Instead of platform use_dma flag - check if DT dmas property is present to
decide to use dma ot not.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Acked-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 drivers/spi/spi-ep93xx.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-ep93xx.c b/drivers/spi/spi-ep93xx.c
index 1615fd22f9a2..f93cd506bf17 100644
--- a/drivers/spi/spi-ep93xx.c
+++ b/drivers/spi/spi-ep93xx.c
@@ -22,6 +22,7 @@
 #include <linux/bitops.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <linux/platform_device.h>
 #include <linux/sched.h>
 #include <linux/scatterlist.h>
@@ -644,6 +645,23 @@ static void ep93xx_spi_release_dma(struct ep93xx_spi *espi)
 		free_page((unsigned long)espi->zeropage);
 }
 
+#ifdef CONFIG_OF
+static struct ep93xx_spi_info dt_spi_info;
+
+static struct ep93xx_spi_info *ep93xx_spi_get_platdata(struct platform_device *pdev)
+{
+	if (device_property_present(&pdev->dev, "dmas"))
+		dt_spi_info.use_dma = 1;
+
+	return &dt_spi_info;
+}
+#else
+static struct ep93xx_spi_info *ep93xx_spi_get_platdata(struct platform_device *pdev)
+{
+	return dev_get_platdata(&pdev->dev);
+}
+#endif
+
 static int ep93xx_spi_probe(struct platform_device *pdev)
 {
 	struct spi_master *master;
@@ -653,7 +671,7 @@ static int ep93xx_spi_probe(struct platform_device *pdev)
 	int irq;
 	int error;
 
-	info = dev_get_platdata(&pdev->dev);
+	info = ep93xx_spi_get_platdata(pdev);
 	if (!info) {
 		dev_err(&pdev->dev, "missing platform data\n");
 		return -EINVAL;
@@ -726,6 +744,7 @@ static int ep93xx_spi_probe(struct platform_device *pdev)
 	/* make sure that the hardware is disabled */
 	writel(0, espi->mmio + SSPCR1);
 
+	device_set_node(&master->dev, dev_fwnode(&pdev->dev));
 	error = devm_spi_register_master(&pdev->dev, master);
 	if (error) {
 		dev_err(&pdev->dev, "failed to register SPI master\n");
@@ -753,9 +772,16 @@ static void ep93xx_spi_remove(struct platform_device *pdev)
 	ep93xx_spi_release_dma(espi);
 }
 
+static const struct of_device_id ep93xx_spi_of_ids[] = {
+	{ .compatible = "cirrus,ep9301-spi" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ep93xx_spi_of_ids);
+
 static struct platform_driver ep93xx_spi_driver = {
 	.driver		= {
 		.name	= "ep93xx-spi",
+		.of_match_table = ep93xx_spi_of_ids,
 	},
 	.probe		= ep93xx_spi_probe,
 	.remove_new	= ep93xx_spi_remove,

-- 
2.39.2

