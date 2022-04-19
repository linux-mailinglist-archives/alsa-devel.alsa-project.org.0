Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF0D50B8F7
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:46:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52959844;
	Fri, 22 Apr 2022 15:45:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52959844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650635190;
	bh=qlaYFyobKEQjnzQZM9MNp5qNQqkRYezyfa1kDOn31O4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tyIWXUgKklCnhOXmQaiUQZazoxIbJntfjrbo3N4wUWg/LbEPVRmQkE3x0dSkmUkCK
	 dmSQUPyoCnVTrmiXOFfauoTDQkFXjMF1DHIFauen3BrVSHikmay5sbIa32qFB/DIP4
	 +ZOEk4k99jGoE3aDYM+3PpfTi2CbY0JWNN8aCpi4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F302F8067C;
	Fri, 22 Apr 2022 15:32:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B4AEF80237; Tue, 19 Apr 2022 18:44:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C0F3F80237
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 18:43:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C0F3F80237
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IfCx1sYs"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 951AA61877;
 Tue, 19 Apr 2022 16:43:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC2BC385A5;
 Tue, 19 Apr 2022 16:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386637;
 bh=qlaYFyobKEQjnzQZM9MNp5qNQqkRYezyfa1kDOn31O4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IfCx1sYsItrvvOhd62OVGq73m59nNboCQp/gH4IxEBVU5zCvpQPCNPA7TuLYFXC6C
 LwaFif0SpZk4iKNSuUv5XERVH3Itoh7apK3zIBcowiSB/8aMiJR+86E55VqZMRViGM
 vxBgMMnsawZno/joMpTCd+ep1ROboUpME3CMorprNKBdA5wmg9bbhuyypuFsCjLW8G
 yE/u4h18EsDdKvT5ABnu1pHVnRKTIiK1fqnwH6cD1Nj0kuQJNcwzeZUE12odIw17Nr
 I4FoURlNeI1+CxCMlSZX0Yt4E6U9SjEz7W8MiBWwtf7IWB7ooRCN+I7IGpKqWmgJa2
 GROrW1/+TSmQA==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 39/48] power: tosa: simplify probe function
Date: Tue, 19 Apr 2022 18:38:01 +0200
Message-Id: <20220419163810.2118169-40-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 22 Apr 2022 15:31:42 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 Philipp Zabel <philipp.zabel@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Sergey Lapin <slapin@ossfans.org>,
 linux-fbdev@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, Tomas Cech <sleep_walker@suse.com>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Marek Vasut <marek.vasut@gmail.com>, Paul Parsons <lost.distance@yahoo.com>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, linux-input@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-mips@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Sebastian Reichel <sre@kernel.org>, alsa-devel@alsa-project.org,
 Daniel Mack <daniel@zonque.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Arnd Bergmann <arnd@arndb.de>

We have three power supplies that need similar initialization.
As a preparation for the gpio lookup table conversion, split
out the initialization into a separate function.

Reviewed-by: Sebastian Reichel <sre@kernel.org>
Acked-by: Sebastian Reichel <sre@kernel.org>
Cc: linux-pm@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/power/supply/tosa_battery.c | 50 ++++++++++++++---------------
 1 file changed, 24 insertions(+), 26 deletions(-)

diff --git a/drivers/power/supply/tosa_battery.c b/drivers/power/supply/tosa_battery.c
index 32cc31cd4761..b26b0eca33e1 100644
--- a/drivers/power/supply/tosa_battery.c
+++ b/drivers/power/supply/tosa_battery.c
@@ -343,12 +343,24 @@ static int tosa_bat_resume(struct platform_device *dev)
 #define tosa_bat_resume NULL
 #endif
 
+static int tosa_power_supply_register(struct device *dev,
+			struct tosa_bat *bat,
+			const struct power_supply_desc *desc)
+{
+	struct power_supply_config cfg = {
+		.drv_data = bat,
+	};
+
+	mutex_init(&bat->work_lock);
+	bat->psy = power_supply_register(dev, desc, &cfg);
+
+	return PTR_ERR_OR_ZERO(bat->psy);
+}
+
+
 static int tosa_bat_probe(struct platform_device *dev)
 {
 	int ret;
-	struct power_supply_config main_psy_cfg = {},
-				   jacket_psy_cfg = {},
-				   bu_psy_cfg = {};
 
 	if (!machine_is_tosa())
 		return -ENODEV;
@@ -357,36 +369,22 @@ static int tosa_bat_probe(struct platform_device *dev)
 	if (ret)
 		return ret;
 
-	mutex_init(&tosa_bat_main.work_lock);
-	mutex_init(&tosa_bat_jacket.work_lock);
-
 	INIT_WORK(&bat_work, tosa_bat_work);
 
-	main_psy_cfg.drv_data = &tosa_bat_main;
-	tosa_bat_main.psy = power_supply_register(&dev->dev,
-						  &tosa_bat_main_desc,
-						  &main_psy_cfg);
-	if (IS_ERR(tosa_bat_main.psy)) {
-		ret = PTR_ERR(tosa_bat_main.psy);
+	ret = tosa_power_supply_register(&dev->dev, &tosa_bat_main,
+					 &tosa_bat_main_desc);
+	if (ret)
 		goto err_psy_reg_main;
-	}
 
-	jacket_psy_cfg.drv_data = &tosa_bat_jacket;
-	tosa_bat_jacket.psy = power_supply_register(&dev->dev,
-						    &tosa_bat_jacket_desc,
-						    &jacket_psy_cfg);
-	if (IS_ERR(tosa_bat_jacket.psy)) {
-		ret = PTR_ERR(tosa_bat_jacket.psy);
+	ret = tosa_power_supply_register(&dev->dev, &tosa_bat_jacket,
+					 &tosa_bat_jacket_desc);
+	if (ret)
 		goto err_psy_reg_jacket;
-	}
 
-	bu_psy_cfg.drv_data = &tosa_bat_bu;
-	tosa_bat_bu.psy = power_supply_register(&dev->dev, &tosa_bat_bu_desc,
-						&bu_psy_cfg);
-	if (IS_ERR(tosa_bat_bu.psy)) {
-		ret = PTR_ERR(tosa_bat_bu.psy);
+	ret = tosa_power_supply_register(&dev->dev, &tosa_bat_bu,
+					 &tosa_bat_bu_desc);
+	if (ret)
 		goto err_psy_reg_bu;
-	}
 
 	ret = request_irq(gpio_to_irq(TOSA_GPIO_BAT0_CRG),
 				tosa_bat_gpio_isr,
-- 
2.29.2

