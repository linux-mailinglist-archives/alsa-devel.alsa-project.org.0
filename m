Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C16459DD3
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 09:23:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6714829;
	Tue, 23 Nov 2021 09:22:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6714829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637655798;
	bh=VEUWD0CxZ46HtswBQJr7JZjqpwBszi5zhI6fF/ugNPo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hqCCURS1dcOVkEmOON0UVlps4KBM/hGtq4FpMjgwn92p8iB5O0OyKmFTUhwHmAsRW
	 dcnUNvbjLDwsvcicdHsGf1PHzr3BIle2rGf2ujnZsCPKAx5T6YZ+abyIMCgCEzfPd3
	 TJL+AXF9TWn87SDjad7RxH+MyXPX/0anzVUQyYbE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16122F804FD;
	Tue, 23 Nov 2021 09:21:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC969F804E3; Mon, 22 Nov 2021 16:55:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEFB6F80154
 for <alsa-devel@alsa-project.org>; Mon, 22 Nov 2021 16:55:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEFB6F80154
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:e4da:38c:79e9:48bf])
 by laurent.telenet-ops.be with bizsmtp
 id MTux2600K4yPVd601Tuxk9; Mon, 22 Nov 2021 16:55:38 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mpBe6-00EL3j-Vr; Mon, 22 Nov 2021 16:54:18 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mpBe5-00HGzT-Qs; Mon, 22 Nov 2021 16:54:17 +0100
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
Subject: [PATCH/RFC 13/17] pinctl: ti: iodelay: Use bitfield helpers
Date: Mon, 22 Nov 2021 16:54:06 +0100
Message-Id: <60257a3c5b567fb5b14d6f9adb770899bce88f7a.1637592133.git.geert+renesas@glider.be>
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

Use the field_{get,prep}() helpers, instead of defining a custom
function, or open-coding the same operations.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
Marked RFC, as this depends on [PATCH 01/17], but follows a different
path to upstream.
---
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c | 35 +++++++------------------
 1 file changed, 10 insertions(+), 25 deletions(-)

diff --git a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
index 4e2382778d38f557..b220dcd9215520db 100644
--- a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
+++ b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
@@ -9,6 +9,7 @@
  * warranty of any kind, whether express or implied.
  */
 
+#include <linux/bitfield.h>
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/io.h>
@@ -155,18 +156,6 @@ struct ti_iodelay_device {
 	struct ti_iodelay_reg_values reg_init_conf_values;
 };
 
-/**
- * ti_iodelay_extract() - extract bits for a field
- * @val: Register value
- * @mask: Mask
- *
- * Return: extracted value which is appropriately shifted
- */
-static inline u32 ti_iodelay_extract(u32 val, u32 mask)
-{
-	return (val & mask) >> __ffs(mask);
-}
-
 /**
  * ti_iodelay_compute_dpe() - Compute equation for delay parameter
  * @period: Period to use
@@ -233,10 +222,10 @@ static int ti_iodelay_pinconf_set(struct ti_iodelay_device *iod,
 	}
 
 	reg_mask = reg->signature_mask;
-	reg_val = reg->signature_value << __ffs(reg->signature_mask);
+	reg_val = field_prep(reg->signature_mask, reg->signature_value);
 
 	reg_mask |= reg->binary_data_coarse_mask;
-	tmp_val = c_elements << __ffs(reg->binary_data_coarse_mask);
+	tmp_val = field_prep(reg->binary_data_coarse_mask, c_elements);
 	if (tmp_val & ~reg->binary_data_coarse_mask) {
 		dev_err(dev, "Masking overflow of coarse elements %08x\n",
 			tmp_val);
@@ -245,7 +234,7 @@ static int ti_iodelay_pinconf_set(struct ti_iodelay_device *iod,
 	reg_val |= tmp_val;
 
 	reg_mask |= reg->binary_data_fine_mask;
-	tmp_val = f_elements << __ffs(reg->binary_data_fine_mask);
+	tmp_val = field_prep(reg->binary_data_fine_mask, f_elements);
 	if (tmp_val & ~reg->binary_data_fine_mask) {
 		dev_err(dev, "Masking overflow of fine elements %08x\n",
 			tmp_val);
@@ -260,7 +249,7 @@ static int ti_iodelay_pinconf_set(struct ti_iodelay_device *iod,
 	 * impacting iodelay configuration. Use with care!
 	 */
 	reg_mask |= reg->lock_mask;
-	reg_val |= reg->unlock_val << __ffs(reg->lock_mask);
+	reg_val |= field_prep(reg->lock_mask, reg->unlock_val);
 	r = regmap_update_bits(iod->regmap, cfg->offset, reg_mask, reg_val);
 
 	dev_dbg(dev, "Set reg 0x%x Delay(a: %d g: %d), Elements(C=%d F=%d)0x%x\n",
@@ -296,16 +285,14 @@ static int ti_iodelay_pinconf_init_dev(struct ti_iodelay_device *iod)
 	r = regmap_read(iod->regmap, reg->reg_refclk_offset, &val);
 	if (r)
 		return r;
-	ival->ref_clk_period = ti_iodelay_extract(val, reg->refclk_period_mask);
+	ival->ref_clk_period = field_get(reg->refclk_period_mask, val);
 	dev_dbg(dev, "refclk_period=0x%04x\n", ival->ref_clk_period);
 
 	r = regmap_read(iod->regmap, reg->reg_coarse_offset, &val);
 	if (r)
 		return r;
-	ival->coarse_ref_count =
-	    ti_iodelay_extract(val, reg->coarse_ref_count_mask);
-	ival->coarse_delay_count =
-	    ti_iodelay_extract(val, reg->coarse_delay_count_mask);
+	ival->coarse_ref_count = field_get(reg->coarse_ref_count_mask, val);
+	ival->coarse_delay_count = field_get(reg->coarse_delay_count_mask, val);
 	if (!ival->coarse_delay_count) {
 		dev_err(dev, "Invalid Coarse delay count (0) (reg=0x%08x)\n",
 			val);
@@ -326,10 +313,8 @@ static int ti_iodelay_pinconf_init_dev(struct ti_iodelay_device *iod)
 	r = regmap_read(iod->regmap, reg->reg_fine_offset, &val);
 	if (r)
 		return r;
-	ival->fine_ref_count =
-	    ti_iodelay_extract(val, reg->fine_ref_count_mask);
-	ival->fine_delay_count =
-	    ti_iodelay_extract(val, reg->fine_delay_count_mask);
+	ival->fine_ref_count = field_get(reg->fine_ref_count_mask, val);
+	ival->fine_delay_count = field_get(reg->fine_delay_count_mask, val);
 	if (!ival->fine_delay_count) {
 		dev_err(dev, "Invalid Fine delay count (0) (reg=0x%08x)\n",
 			val);
-- 
2.25.1

