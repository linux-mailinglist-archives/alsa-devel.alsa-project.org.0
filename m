Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC01459E16
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 09:32:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C0E516EC;
	Tue, 23 Nov 2021 09:31:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C0E516EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637656342;
	bh=MlucnWA591AMyZeeTeyE/9PORMb1PoJ4pELrZC2QG1I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U+EmJmQp09dO9QjfZpV3lZzVa28VMqQ8pf0llWNom0QVvRZrpmKzXALTx9Mt6hv6U
	 iosi/nrgFl7J9hotJ4iHpqyDEQPFAFRSw+rnjANDMtzPtDUb9egD2ZrJpqU7t5lGsr
	 plRwTyPbvrGlIwrzyWTfLwM/+0Iu8kxl/asUkLB0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDFE8F805E9;
	Tue, 23 Nov 2021 09:22:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 224A0F80212; Mon, 22 Nov 2021 16:56:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODYSUB_1, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 066CFF801F7
 for <alsa-devel@alsa-project.org>; Mon, 22 Nov 2021 16:56:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 066CFF801F7
Received: from ramsan.of.borg ([84.195.186.194])
 by laurent.telenet-ops.be with bizsmtp
 id MTvi2600Z4C55Sk01TviwZ; Mon, 22 Nov 2021 16:56:23 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mpBe6-00EL3i-LK; Mon, 22 Nov 2021 16:54:18 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mpBe5-00HGzM-PZ; Mon, 22 Nov 2021 16:54:17 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
 Rajendra Nayak <rnayak@codeaurora.org>, Paul Walmsley <paul@pwsan.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Tero Kristo <kristo@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Benoit Parrot <bparrot@ti.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Ulf Hansson <ulf.hansson@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@codeaurora.org>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH/RFC 12/17] pinctrl: aspeed: Use bitfield helpers
Date: Mon, 22 Nov 2021 16:54:05 +0100
Message-Id: <15158715ad2278191e310ac5a8d3dba7cc4fb9cc.1637592133.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1637592133.git.geert+renesas@glider.be>
References: <cover.1637592133.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 23 Nov 2021 09:20:57 +0100
Cc: alsa-devel@alsa-project.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-aspeed@lists.ozlabs.org, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-wireless@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, netdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
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

Use the field_{get,prep}() helpers, instead of open-coding the same
operations.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
Marked RFC, as this depends on [PATCH 01/17], but follows a different
path to upstream.
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 3 ++-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 3 ++-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 3 ++-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c    | 5 +++--
 drivers/pinctrl/aspeed/pinmux-aspeed.c     | 6 ++++--
 5 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
index bfed0e2746437b4a..bfb2a7b229915a68 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (C) 2016 IBM Corp.
  */
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/init.h>
 #include <linux/io.h>
@@ -2551,7 +2552,7 @@ static int aspeed_g4_sig_expr_set(struct aspeed_pinmux_data *ctx,
 	for (i = 0; i < expr->ndescs; i++) {
 		const struct aspeed_sig_desc *desc = &expr->descs[i];
 		u32 pattern = enable ? desc->enable : desc->disable;
-		u32 val = (pattern << __ffs(desc->mask));
+		u32 val = field_prep(desc->mask, pattern);
 
 		if (!ctx->maps[desc->ip])
 			return -ENODEV;
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 4c0d26606b6cc7d6..8cc6d9c1f1c78296 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (C) 2016 IBM Corp.
  */
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/init.h>
 #include <linux/io.h>
@@ -2724,7 +2725,7 @@ static int aspeed_g5_sig_expr_set(struct aspeed_pinmux_data *ctx,
 	for (i = 0; i < expr->ndescs; i++) {
 		const struct aspeed_sig_desc *desc = &expr->descs[i];
 		u32 pattern = enable ? desc->enable : desc->disable;
-		u32 val = (pattern << __ffs(desc->mask));
+		u32 val = field_prep(desc->mask, pattern);
 		struct regmap *map;
 
 		map = aspeed_g5_acquire_regmap(ctx, desc->ip);
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index a3fa03bcd9a30577..00f7b69a74e9e743 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /* Copyright (C) 2019 IBM Corp. */
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/init.h>
 #include <linux/io.h>
@@ -2649,7 +2650,7 @@ static int aspeed_g6_sig_expr_set(struct aspeed_pinmux_data *ctx,
 	for (i = 0; i < expr->ndescs; i++) {
 		const struct aspeed_sig_desc *desc = &expr->descs[i];
 		u32 pattern = enable ? desc->enable : desc->disable;
-		u32 val = (pattern << __ffs(desc->mask));
+		u32 val = field_prep(desc->mask, pattern);
 		bool is_strap;
 
 		if (!ctx->maps[desc->ip])
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index c94e24aadf922d2a..839ac48f75836352 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2016 IBM Corp.
  */
 
+#include <linux/bitfield.h>
 #include <linux/mfd/syscon.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -547,7 +548,7 @@ int aspeed_pin_config_get(struct pinctrl_dev *pctldev, unsigned int offset,
 		return rc;
 
 	pmap = find_pinconf_map(pdata, param, MAP_TYPE_VAL,
-			(val & pconf->mask) >> __ffs(pconf->mask));
+				field_get(pconf->mask, val));
 
 	if (!pmap)
 		return -EINVAL;
@@ -595,7 +596,7 @@ int aspeed_pin_config_set(struct pinctrl_dev *pctldev, unsigned int offset,
 		if (WARN_ON(!pmap))
 			return -EINVAL;
 
-		val = pmap->val << __ffs(pconf->mask);
+		val = field_prep(pconf->mask, pmap->val);
 
 		rc = regmap_update_bits(pdata->scu, pconf->reg,
 					pconf->mask, val);
diff --git a/drivers/pinctrl/aspeed/pinmux-aspeed.c b/drivers/pinctrl/aspeed/pinmux-aspeed.c
index 4aa46383c2c533f0..61ddd550439325ee 100644
--- a/drivers/pinctrl/aspeed/pinmux-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinmux-aspeed.c
@@ -3,6 +3,8 @@
 
 /* Pieces to enable drivers to implement the .set callback */
 
+#include <linux/bitfield.h>
+
 #include "pinmux-aspeed.h"
 
 static const char *const aspeed_pinmux_ips[] = {
@@ -17,7 +19,7 @@ static inline void aspeed_sig_desc_print_val(
 	pr_debug("Want %s%X[0x%08X]=0x%X, got 0x%X from 0x%08X\n",
 			aspeed_pinmux_ips[desc->ip], desc->reg,
 			desc->mask, enable ? desc->enable : desc->disable,
-			(rv & desc->mask) >> __ffs(desc->mask), rv);
+			field_get(desc->mask, rv), rv);
 }
 
 /**
@@ -55,7 +57,7 @@ int aspeed_sig_desc_eval(const struct aspeed_sig_desc *desc,
 	aspeed_sig_desc_print_val(desc, enabled, raw);
 	want = enabled ? desc->enable : desc->disable;
 
-	return ((raw & desc->mask) >> __ffs(desc->mask)) == want;
+	return field_get(desc->mask, raw) == want;
 }
 
 /**
-- 
2.25.1

