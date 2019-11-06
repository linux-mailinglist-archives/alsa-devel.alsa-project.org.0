Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D78A5F1738
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 14:36:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB30A16AB;
	Wed,  6 Nov 2019 14:35:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB30A16AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573047410;
	bh=QkfxvyfzQky16z8YgB1ISKHIOKy0SMTjYplWN+Jno08=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XDC5UeL9PBFCHO0Bn47XHvsrt4DYREGz/qUiJPgv86sb1p1ng92JDaLmtRVsy6ltv
	 44NNsEVMb6jAgYMllgRl6yHW2DYxUV2JFpwC19ksj5ZZrgn+OwHPYOzniv8yNiqi68
	 S4vH/w4ddpxflZMLIYwsmcZap+BQufg6JdMplcrc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 213B7F80321;
	Wed,  6 Nov 2019 14:35:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F621F803F4; Wed,  6 Nov 2019 09:54:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C538F800F3
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 09:54:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C538F800F3
Received: by mail-lj1-f194.google.com with SMTP id p18so1787146ljc.6
 for <alsa-devel@alsa-project.org>; Wed, 06 Nov 2019 00:54:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=B/HgTTi3tIOvXjYFfYsGWPtYDMO6+DtzJcOrJTLe3dU=;
 b=Q3AsN8I9UpgrhzYuSXJSlOg3zElrW+78W4idu0FQ1vprk6Am7F4zozyun2go1jg6/q
 Yb9d63tOdMkvqmd5pg0cY7aYvxxI2ZwRRxRn9Yog0/woSM94VevgzGMg4+24SFjzvVvh
 1kVCrH6xJewH/1VW2OCObxHVKewHBOsw/A/Y+sKzKSIxOIiNUDIKMM/lK/XLcW8pV7nJ
 NTMrOObYlmNE3mkTsvZ3XOtpli7WVSH4ZIPypdlhaoG7ebuoDeTd3osvycF3t1KDmUjx
 aYEsZQx1keXBx2tqHxi5qkg9gOPdEgQGG2FzVHe3xa5M+WBsNXwfau8xBL/AB2wE02Zp
 kWwA==
X-Gm-Message-State: APjAAAUX+Fqkp7Zd5KN/C9sylKNVIWKU+8Qo8LV41+yJNVeglu8k7csG
 wAsOByznFZWRxV8FXTqm+hA=
X-Google-Smtp-Source: APXvYqxmqNxhTaysyJ9X6y7gktlHWxVB+jMKH2WIo0W+Xfv1bDKLojo1+mpSD2s1WAbpq1dqkBoTcw==
X-Received: by 2002:a2e:9b4b:: with SMTP id o11mr1028310ljj.252.1573030460992; 
 Wed, 06 Nov 2019 00:54:20 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
 by smtp.gmail.com with ESMTPSA id b67sm21036227ljf.5.2019.11.06.00.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 00:54:20 -0800 (PST)
Date: Wed, 6 Nov 2019 10:54:12 +0200
From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To: matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Message-ID: <42f40109e2926bca197b30fd9624c609653b23e5.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Wed, 06 Nov 2019 14:35:01 +0100
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-aspeed@lists.ozlabs.org, David Daney <david.daney@cavium.com>,
 Linus Walleij <linus.walleij@linaro.org>, alsa-devel@alsa-project.org,
 Peter Tyser <ptyser@xes-inc.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, Marek Behun <marek.behun@nic.cz>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 bcm-kernel-feedback-list@broadcom.com, Joel Stanley <joel@jms.id.au>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Bamvor Jian Zhang <bamv2005@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-pwm@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-omap@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 William Breathitt Gray <vilhelm.gray@gmail.com>, linux-gpio@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-tegra@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Andrew Jeffery <andrew@aj.id.au>, "Enrico Weigelt,
 metux IT consult" <info@metux.net>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Thorsten Scherer <t.scherer@eckelmann.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, patches@opensource.cirrus.com,
 Shawn Guo <shawnguo@kernel.org>
Subject: [alsa-devel] [PATCH v2 2/2] gpio: Use new GPIO_LINE_DIRECTION
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

It's hard for occasional GPIO code reader/writer to know if values 0/1
equal to IN or OUT. Use defined GPIO_LINE_DIRECTION_IN and
GPIO_LINE_DIRECTION_OUT to help them out.

NOTE - for gpio-amd-fch and gpio-bd9571mwv:
This commit also changes the return value for direction get to equal 1
for direction INPUT. Prior this commit these drivers might have
returned some other positive value but 1 for INPUT.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Acked-by: Scott Branden <scott.branden@broadcom.com>
Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>
Reviewed-by: Michal Simek <michal.simek@xilinx.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

---

This patch contains same changes as v1 patches 2-61 did. v1 was splitted
into small patches in order to help reviewing but squashing was
requested by Linus Walleij. I maintained all acks/reviewed-by tags from
v1 series - so acks/review-by tags in this patch mean that specific
portion of changes have been acked/reviewed by tagger. Eg, whole patch
has not been reviewed/acked by persons mentioned. Please let me know if
this is not Ok to you.

 drivers/gpio/gpio-104-dio-48e.c     |  5 ++++-
 drivers/gpio/gpio-104-idi-48.c      |  2 +-
 drivers/gpio/gpio-104-idio-16.c     |  4 ++--
 drivers/gpio/gpio-74xx-mmio.c       |  5 ++++-
 drivers/gpio/gpio-amd-fch.c         |  2 +-
 drivers/gpio/gpio-aspeed.c          |  7 +++----
 drivers/gpio/gpio-bcm-kona.c        |  6 +++---
 drivers/gpio/gpio-bd70528.c         |  8 +++++---
 drivers/gpio/gpio-bd9571mwv.c       |  4 +++-
 drivers/gpio/gpio-dln2.c            |  6 +++---
 drivers/gpio/gpio-exar.c            |  5 ++++-
 drivers/gpio/gpio-f7188x.c          |  5 ++++-
 drivers/gpio/gpio-gpio-mm.c         |  5 ++++-
 drivers/gpio/gpio-htc-egpio.c       |  5 ++++-
 drivers/gpio/gpio-ich.c             |  5 ++++-
 drivers/gpio/gpio-kempld.c          |  5 ++++-
 drivers/gpio/gpio-lp873x.c          |  2 +-
 drivers/gpio/gpio-lp87565.c         |  5 ++++-
 drivers/gpio/gpio-madera.c          |  5 ++++-
 drivers/gpio/gpio-max3191x.c        |  2 +-
 drivers/gpio/gpio-merrifield.c      |  5 ++++-
 drivers/gpio/gpio-mmio.c            | 21 +++++++++++++++------
 drivers/gpio/gpio-mockup.c          | 11 +++--------
 drivers/gpio/gpio-moxtet.c          |  4 ++--
 drivers/gpio/gpio-mvebu.c           |  5 ++++-
 drivers/gpio/gpio-mxs.c             |  5 ++++-
 drivers/gpio/gpio-omap.c            |  6 ++++--
 drivers/gpio/gpio-pca953x.c         |  5 ++++-
 drivers/gpio/gpio-pci-idio-16.c     |  4 ++--
 drivers/gpio/gpio-pcie-idio-24.c    |  9 ++++++---
 drivers/gpio/gpio-pisosr.c          |  2 +-
 drivers/gpio/gpio-pl061.c           |  5 ++++-
 drivers/gpio/gpio-raspberrypi-exp.c |  5 ++++-
 drivers/gpio/gpio-rcar.c            |  5 ++++-
 drivers/gpio/gpio-reg.c             |  3 ++-
 drivers/gpio/gpio-sa1100.c          |  5 ++++-
 drivers/gpio/gpio-sama5d2-piobu.c   |  7 ++++---
 drivers/gpio/gpio-sch.c             |  5 ++++-
 drivers/gpio/gpio-sch311x.c         |  5 ++++-
 drivers/gpio/gpio-siox.c            |  4 ++--
 drivers/gpio/gpio-stmpe.c           |  5 ++++-
 drivers/gpio/gpio-tc3589x.c         |  5 ++++-
 drivers/gpio/gpio-tegra.c           |  5 ++++-
 drivers/gpio/gpio-tegra186.c        |  4 ++--
 drivers/gpio/gpio-thunderx.c        |  5 ++++-
 drivers/gpio/gpio-tpic2810.c        |  2 +-
 drivers/gpio/gpio-tps65086.c        |  2 +-
 drivers/gpio/gpio-tps65912.c        |  4 ++--
 drivers/gpio/gpio-tps68470.c        |  6 +++---
 drivers/gpio/gpio-tqmx86.c          |  5 ++++-
 drivers/gpio/gpio-ts4900.c          |  5 ++++-
 drivers/gpio/gpio-twl4030.c         | 10 +++++-----
 drivers/gpio/gpio-twl6040.c         |  3 +--
 drivers/gpio/gpio-uniphier.c        |  5 ++++-
 drivers/gpio/gpio-wcove.c           |  7 +++++--
 drivers/gpio/gpio-ws16c48.c         |  5 ++++-
 drivers/gpio/gpio-xgene.c           |  5 ++++-
 drivers/gpio/gpio-xra1403.c         |  5 ++++-
 drivers/gpio/gpio-xtensa.c          |  4 ++--
 drivers/gpio/gpio-zynq.c            |  7 +++++--
 60 files changed, 211 insertions(+), 102 deletions(-)

diff --git a/drivers/gpio/gpio-104-dio-48e.c b/drivers/gpio/gpio-104-dio-48e.c
index a44fa8af5b0d..400c09b905f8 100644
--- a/drivers/gpio/gpio-104-dio-48e.c
+++ b/drivers/gpio/gpio-104-dio-48e.c
@@ -59,7 +59,10 @@ static int dio48e_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 	const unsigned port = offset / 8;
 	const unsigned mask = BIT(offset % 8);
 
-	return !!(dio48egpio->io_state[port] & mask);
+	if (dio48egpio->io_state[port] & mask)
+		return  GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int dio48e_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
diff --git a/drivers/gpio/gpio-104-idi-48.c b/drivers/gpio/gpio-104-idi-48.c
index 79dead61e776..c50329ab493a 100644
--- a/drivers/gpio/gpio-104-idi-48.c
+++ b/drivers/gpio/gpio-104-idi-48.c
@@ -53,7 +53,7 @@ struct idi_48_gpio {
 
 static int idi_48_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 {
-	return 1;
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int idi_48_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
diff --git a/drivers/gpio/gpio-104-idio-16.c b/drivers/gpio/gpio-104-idio-16.c
index 8d2f51cd9d91..5752d9dab148 100644
--- a/drivers/gpio/gpio-104-idio-16.c
+++ b/drivers/gpio/gpio-104-idio-16.c
@@ -51,9 +51,9 @@ struct idio_16_gpio {
 static int idio_16_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 {
 	if (offset > 15)
-		return 1;
+		return GPIO_LINE_DIRECTION_IN;
 
-	return 0;
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int idio_16_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
diff --git a/drivers/gpio/gpio-74xx-mmio.c b/drivers/gpio/gpio-74xx-mmio.c
index 83a2286d93f6..173e06758e6c 100644
--- a/drivers/gpio/gpio-74xx-mmio.c
+++ b/drivers/gpio/gpio-74xx-mmio.c
@@ -77,7 +77,10 @@ static int mmio_74xx_get_direction(struct gpio_chip *gc, unsigned offset)
 {
 	struct mmio_74xx_gpio_priv *priv = gpiochip_get_data(gc);
 
-	return !(priv->flags & MMIO_74XX_DIR_OUT);
+	if (priv->flags & MMIO_74XX_DIR_OUT)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return  GPIO_LINE_DIRECTION_IN;
 }
 
 static int mmio_74xx_dir_in(struct gpio_chip *gc, unsigned int gpio)
diff --git a/drivers/gpio/gpio-amd-fch.c b/drivers/gpio/gpio-amd-fch.c
index 181df1581df5..4e44ba4d7423 100644
--- a/drivers/gpio/gpio-amd-fch.c
+++ b/drivers/gpio/gpio-amd-fch.c
@@ -92,7 +92,7 @@ static int amd_fch_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
 	ret = (readl_relaxed(ptr) & AMD_FCH_GPIO_FLAG_DIRECTION);
 	spin_unlock_irqrestore(&priv->lock, flags);
 
-	return ret;
+	return ret ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
 }
 
 static void amd_fch_gpio_set(struct gpio_chip *gc,
diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 09e53c5f3b0a..f1037b61f763 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -487,10 +487,10 @@ static int aspeed_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 	u32 val;
 
 	if (!have_input(gpio, offset))
-		return 0;
+		return GPIO_LINE_DIRECTION_OUT;
 
 	if (!have_output(gpio, offset))
-		return 1;
+		return GPIO_LINE_DIRECTION_IN;
 
 	spin_lock_irqsave(&gpio->lock, flags);
 
@@ -498,8 +498,7 @@ static int aspeed_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 
 	spin_unlock_irqrestore(&gpio->lock, flags);
 
-	return !val;
-
+	return val ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
 }
 
 static inline int irqd_to_aspeed_gpio_data(struct irq_data *d,
diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index 9fa6d3a967d2..4122683eb1f9 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -127,7 +127,7 @@ static int bcm_kona_gpio_get_dir(struct gpio_chip *chip, unsigned gpio)
 	u32 val;
 
 	val = readl(reg_base + GPIO_CONTROL(gpio)) & GPIO_GPCTR0_IOTR_MASK;
-	return !!val;
+	return val ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
 }
 
 static void bcm_kona_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
@@ -144,7 +144,7 @@ static void bcm_kona_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
 	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
 
 	/* this function only applies to output pin */
-	if (bcm_kona_gpio_get_dir(chip, gpio) == 1)
+	if (bcm_kona_gpio_get_dir(chip, gpio) == GPIO_LINE_DIRECTION_IN)
 		goto out;
 
 	reg_offset = value ? GPIO_OUT_SET(bank_id) : GPIO_OUT_CLEAR(bank_id);
@@ -170,7 +170,7 @@ static int bcm_kona_gpio_get(struct gpio_chip *chip, unsigned gpio)
 	reg_base = kona_gpio->reg_base;
 	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
 
-	if (bcm_kona_gpio_get_dir(chip, gpio) == 1)
+	if (bcm_kona_gpio_get_dir(chip, gpio) == GPIO_LINE_DIRECTION_IN)
 		reg_offset = GPIO_IN_STATUS(bank_id);
 	else
 		reg_offset = GPIO_OUT_STATUS(bank_id);
diff --git a/drivers/gpio/gpio-bd70528.c b/drivers/gpio/gpio-bd70528.c
index 0c1ead12d883..734be6b752d0 100644
--- a/drivers/gpio/gpio-bd70528.c
+++ b/drivers/gpio/gpio-bd70528.c
@@ -54,8 +54,10 @@ static int bd70528_get_direction(struct gpio_chip *chip, unsigned int offset)
 		dev_err(bdgpio->chip.dev, "Could not read gpio direction\n");
 		return ret;
 	}
+	if (val & BD70528_GPIO_OUT_EN_MASK)
+		return GPIO_LINE_DIRECTION_OUT;
 
-	return !(val & BD70528_GPIO_OUT_EN_MASK);
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int bd70528_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
@@ -166,9 +168,9 @@ static int bd70528_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	 * locking would make no sense.
 	 */
 	ret = bd70528_get_direction(chip, offset);
-	if (ret == 0)
+	if (ret == GPIO_LINE_DIRECTION_OUT)
 		ret = bd70528_gpio_get_o(bdgpio, offset);
-	else if (ret == 1)
+	else if (ret == GPIO_LINE_DIRECTION_IN)
 		ret = bd70528_gpio_get_i(bdgpio, offset);
 	else
 		dev_err(bdgpio->chip.dev, "failed to read GPIO direction\n");
diff --git a/drivers/gpio/gpio-bd9571mwv.c b/drivers/gpio/gpio-bd9571mwv.c
index 5224a946e8ab..c0abc9c6851b 100644
--- a/drivers/gpio/gpio-bd9571mwv.c
+++ b/drivers/gpio/gpio-bd9571mwv.c
@@ -37,8 +37,10 @@ static int bd9571mwv_gpio_get_direction(struct gpio_chip *chip,
 	ret = regmap_read(gpio->bd->regmap, BD9571MWV_GPIO_DIR, &val);
 	if (ret < 0)
 		return ret;
+	if (val & BIT(offset))
+		return GPIO_LINE_DIRECTION_IN;
 
-	return val & BIT(offset);
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int bd9571mwv_gpio_direction_input(struct gpio_chip *chip,
diff --git a/drivers/gpio/gpio-dln2.c b/drivers/gpio/gpio-dln2.c
index 8a33c2fc174d..26b40c8b8a12 100644
--- a/drivers/gpio/gpio-dln2.c
+++ b/drivers/gpio/gpio-dln2.c
@@ -200,9 +200,9 @@ static int dln2_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 	struct dln2_gpio *dln2 = gpiochip_get_data(chip);
 
 	if (test_bit(offset, dln2->output_enabled))
-		return 0;
+		return GPIO_LINE_DIRECTION_OUT;
 
-	return 1;
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int dln2_gpio_get(struct gpio_chip *chip, unsigned int offset)
@@ -214,7 +214,7 @@ static int dln2_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	if (dir < 0)
 		return dir;
 
-	if (dir == 1)
+	if (dir == GPIO_LINE_DIRECTION_IN)
 		return dln2_gpio_pin_get_in_val(dln2, offset);
 
 	return dln2_gpio_pin_get_out_val(dln2, offset);
diff --git a/drivers/gpio/gpio-exar.c b/drivers/gpio/gpio-exar.c
index fae327d5b06e..da1ef0b1c291 100644
--- a/drivers/gpio/gpio-exar.c
+++ b/drivers/gpio/gpio-exar.c
@@ -77,7 +77,10 @@ static int exar_get_direction(struct gpio_chip *chip, unsigned int offset)
 		EXAR_OFFSET_MPIOSEL_HI : EXAR_OFFSET_MPIOSEL_LO;
 	unsigned int bit  = (offset + exar_gpio->first_pin) % 8;
 
-	return !!(exar_get(chip, addr) & BIT(bit));
+	if (exar_get(chip, addr) & BIT(bit))
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int exar_get_value(struct gpio_chip *chip, unsigned int offset)
diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
index fdc639f856f1..cadd02993539 100644
--- a/drivers/gpio/gpio-f7188x.c
+++ b/drivers/gpio/gpio-f7188x.c
@@ -250,7 +250,10 @@ static int f7188x_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 
 	superio_exit(sio->addr);
 
-	return !(dir & 1 << offset);
+	if (dir & 1 << offset)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int f7188x_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
diff --git a/drivers/gpio/gpio-gpio-mm.c b/drivers/gpio/gpio-gpio-mm.c
index 78a1db24e931..c22d6f94129c 100644
--- a/drivers/gpio/gpio-gpio-mm.c
+++ b/drivers/gpio/gpio-gpio-mm.c
@@ -52,7 +52,10 @@ static int gpiomm_gpio_get_direction(struct gpio_chip *chip,
 	const unsigned int port = offset / 8;
 	const unsigned int mask = BIT(offset % 8);
 
-	return !!(gpiommgpio->io_state[port] & mask);
+	if (gpiommgpio->io_state[port] & mask)
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int gpiomm_gpio_direction_input(struct gpio_chip *chip,
diff --git a/drivers/gpio/gpio-htc-egpio.c b/drivers/gpio/gpio-htc-egpio.c
index 8aa23d70b1e6..a40bd56673fe 100644
--- a/drivers/gpio/gpio-htc-egpio.c
+++ b/drivers/gpio/gpio-htc-egpio.c
@@ -220,7 +220,10 @@ static int egpio_get_direction(struct gpio_chip *chip, unsigned offset)
 
 	egpio = gpiochip_get_data(chip);
 
-	return !test_bit(offset, &egpio->is_out);
+	if (test_bit(offset, &egpio->is_out))
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static void egpio_write_cache(struct egpio_info *ei)
diff --git a/drivers/gpio/gpio-ich.c b/drivers/gpio/gpio-ich.c
index 90bf7742f9b0..2f086d0aa1f4 100644
--- a/drivers/gpio/gpio-ich.c
+++ b/drivers/gpio/gpio-ich.c
@@ -159,7 +159,10 @@ static bool ichx_gpio_check_available(struct gpio_chip *gpio, unsigned nr)
 
 static int ichx_gpio_get_direction(struct gpio_chip *gpio, unsigned nr)
 {
-	return ichx_read_bit(GPIO_IO_SEL, nr);
+	if (ichx_read_bit(GPIO_IO_SEL, nr))
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int ichx_gpio_direction_input(struct gpio_chip *gpio, unsigned nr)
diff --git a/drivers/gpio/gpio-kempld.c b/drivers/gpio/gpio-kempld.c
index ef51638f3f75..4ea15f08e0f4 100644
--- a/drivers/gpio/gpio-kempld.c
+++ b/drivers/gpio/gpio-kempld.c
@@ -104,7 +104,10 @@ static int kempld_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 	struct kempld_gpio_data *gpio = gpiochip_get_data(chip);
 	struct kempld_device_data *pld = gpio->pld;
 
-	return !kempld_gpio_get_bit(pld, KEMPLD_GPIO_DIR_NUM(offset), offset);
+	if (kempld_gpio_get_bit(pld, KEMPLD_GPIO_DIR_NUM(offset), offset))
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int kempld_gpio_pincount(struct kempld_device_data *pld)
diff --git a/drivers/gpio/gpio-lp873x.c b/drivers/gpio/gpio-lp873x.c
index 801995dd9b26..70fad87ff2db 100644
--- a/drivers/gpio/gpio-lp873x.c
+++ b/drivers/gpio/gpio-lp873x.c
@@ -33,7 +33,7 @@ static int lp873x_gpio_get_direction(struct gpio_chip *chip,
 				     unsigned int offset)
 {
 	/* This device is output only */
-	return 0;
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int lp873x_gpio_direction_input(struct gpio_chip *chip,
diff --git a/drivers/gpio/gpio-lp87565.c b/drivers/gpio/gpio-lp87565.c
index a121c8f10610..e1244520cf7d 100644
--- a/drivers/gpio/gpio-lp87565.c
+++ b/drivers/gpio/gpio-lp87565.c
@@ -57,7 +57,10 @@ static int lp87565_gpio_get_direction(struct gpio_chip *chip,
 	if (ret < 0)
 		return ret;
 
-	return !(val & BIT(offset));
+	if (val & BIT(offset))
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int lp87565_gpio_direction_input(struct gpio_chip *chip,
diff --git a/drivers/gpio/gpio-madera.c b/drivers/gpio/gpio-madera.c
index 7086f8b5388f..8f38303fcbc4 100644
--- a/drivers/gpio/gpio-madera.c
+++ b/drivers/gpio/gpio-madera.c
@@ -34,7 +34,10 @@ static int madera_gpio_get_direction(struct gpio_chip *chip,
 	if (ret < 0)
 		return ret;
 
-	return !!(val & MADERA_GP1_DIR_MASK);
+	if (val & MADERA_GP1_DIR_MASK)
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int madera_gpio_direction_in(struct gpio_chip *chip, unsigned int offset)
diff --git a/drivers/gpio/gpio-max3191x.c b/drivers/gpio/gpio-max3191x.c
index 4b4b2ceb82fc..0696d5a21431 100644
--- a/drivers/gpio/gpio-max3191x.c
+++ b/drivers/gpio/gpio-max3191x.c
@@ -94,7 +94,7 @@ DECLARE_CRC8_TABLE(max3191x_crc8);
 
 static int max3191x_get_direction(struct gpio_chip *gpio, unsigned int offset)
 {
-	return 1; /* always in */
+	return GPIO_LINE_DIRECTION_IN; /* always in */
 }
 
 static int max3191x_direction_input(struct gpio_chip *gpio, unsigned int offset)
diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
index 2f1e9da81c1e..d4fa6e9560f3 100644
--- a/drivers/gpio/gpio-merrifield.c
+++ b/drivers/gpio/gpio-merrifield.c
@@ -162,7 +162,10 @@ static int mrfld_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	void __iomem *gpdr = gpio_reg(chip, offset, GPDR);
 
-	return !(readl(gpdr) & BIT(offset % 32));
+	if (readl(gpdr) & BIT(offset % 32))
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int mrfld_gpio_set_debounce(struct gpio_chip *chip, unsigned int offset,
diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 6f904c874678..cd07c948649f 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -370,15 +370,24 @@ static int bgpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 static int bgpio_get_dir(struct gpio_chip *gc, unsigned int gpio)
 {
 	/* Return 0 if output, 1 if input */
-	if (gc->bgpio_dir_unreadable)
-		return !(gc->bgpio_dir & bgpio_line2mask(gc, gpio));
-	if (gc->reg_dir_out)
-		return !(gc->read_reg(gc->reg_dir_out) & bgpio_line2mask(gc, gpio));
+	if (gc->bgpio_dir_unreadable) {
+		if (gc->bgpio_dir & bgpio_line2mask(gc, gpio))
+			return GPIO_LINE_DIRECTION_OUT;
+		return GPIO_LINE_DIRECTION_IN;
+	}
+
+	if (gc->reg_dir_out) {
+		if (gc->read_reg(gc->reg_dir_out) & bgpio_line2mask(gc, gpio))
+			return GPIO_LINE_DIRECTION_OUT;
+		return GPIO_LINE_DIRECTION_IN;
+	}
+
 	if (gc->reg_dir_in)
-		return !!(gc->read_reg(gc->reg_dir_in) & bgpio_line2mask(gc, gpio));
+		if (!(gc->read_reg(gc->reg_dir_in) & bgpio_line2mask(gc, gpio)))
+			return GPIO_LINE_DIRECTION_OUT;
 
 	/* This should not happen */
-	return 1;
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int bgpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 213aedc97dc2..47c172b2f5ad 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -34,14 +34,9 @@
 
 #define gpio_mockup_err(...)	pr_err(GPIO_MOCKUP_NAME ": " __VA_ARGS__)
 
-enum {
-	GPIO_MOCKUP_DIR_IN = 0,
-	GPIO_MOCKUP_DIR_OUT = 1,
-};
-
 /*
  * struct gpio_pin_status - structure describing a GPIO status
- * @dir:       Configures direction of gpio as "in" or "out", 0=in, 1=out
+ * @dir:       Configures direction of gpio as "in" or "out"
  * @value:     Configures status of the gpio as 0(low) or 1(high)
  */
 struct gpio_mockup_line_status {
@@ -152,7 +147,7 @@ static int gpio_mockup_dirout(struct gpio_chip *gc,
 	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
 
 	mutex_lock(&chip->lock);
-	chip->lines[offset].dir = GPIO_MOCKUP_DIR_OUT;
+	chip->lines[offset].dir = GPIO_LINE_DIRECTION_OUT;
 	__gpio_mockup_set(chip, offset, value);
 	mutex_unlock(&chip->lock);
 
@@ -164,7 +159,7 @@ static int gpio_mockup_dirin(struct gpio_chip *gc, unsigned int offset)
 	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
 
 	mutex_lock(&chip->lock);
-	chip->lines[offset].dir = GPIO_MOCKUP_DIR_IN;
+	chip->lines[offset].dir = GPIO_LINE_DIRECTION_IN;
 	mutex_unlock(&chip->lock);
 
 	return 0;
diff --git a/drivers/gpio/gpio-moxtet.c b/drivers/gpio/gpio-moxtet.c
index 3fd729994a38..8299909318f4 100644
--- a/drivers/gpio/gpio-moxtet.c
+++ b/drivers/gpio/gpio-moxtet.c
@@ -78,9 +78,9 @@ static int moxtet_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 
 	/* All lines are hard wired to be either input or output, not both. */
 	if (chip->desc->in_mask & BIT(offset))
-		return 1;
+		return GPIO_LINE_DIRECTION_IN;
 	else if (chip->desc->out_mask & BIT(offset))
-		return 0;
+		return GPIO_LINE_DIRECTION_OUT;
 	else
 		return -EINVAL;
 }
diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 6c0687694341..9b2adf0ef880 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -384,7 +384,10 @@ static int mvebu_gpio_get_direction(struct gpio_chip *chip, unsigned int pin)
 
 	regmap_read(mvchip->regs, GPIO_IO_CONF_OFF + mvchip->offset, &u);
 
-	return !!(u & BIT(pin));
+	if (u & BIT(pin))
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int mvebu_gpio_to_irq(struct gpio_chip *chip, unsigned int pin)
diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
index 5e5437a2c607..c4a314c68555 100644
--- a/drivers/gpio/gpio-mxs.c
+++ b/drivers/gpio/gpio-mxs.c
@@ -248,7 +248,10 @@ static int mxs_gpio_get_direction(struct gpio_chip *gc, unsigned offset)
 	u32 dir;
 
 	dir = readl(port->base + PINCTRL_DOE(port));
-	return !(dir & mask);
+	if (dir & mask)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static const struct platform_device_id mxs_gpio_ids[] = {
diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index d0f27084a942..3bd8adaeed9e 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -805,8 +805,10 @@ static int omap_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 {
 	struct gpio_bank *bank = gpiochip_get_data(chip);
 
-	return !!(readl_relaxed(bank->base + bank->regs->direction) &
-		  BIT(offset));
+	if (readl_relaxed(bank->base + bank->regs->direction) & BIT(offset))
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int omap_gpio_input(struct gpio_chip *chip, unsigned offset)
diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index de5d1383f28d..82122c3c688a 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -449,7 +449,10 @@ static int pca953x_gpio_get_direction(struct gpio_chip *gc, unsigned off)
 	if (ret < 0)
 		return ret;
 
-	return !!(reg_val & bit);
+	if (reg_val & bit)
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
diff --git a/drivers/gpio/gpio-pci-idio-16.c b/drivers/gpio/gpio-pci-idio-16.c
index 5aa136a6a3e0..df51dd08bdfe 100644
--- a/drivers/gpio/gpio-pci-idio-16.c
+++ b/drivers/gpio/gpio-pci-idio-16.c
@@ -61,9 +61,9 @@ static int idio_16_gpio_get_direction(struct gpio_chip *chip,
 	unsigned int offset)
 {
 	if (offset > 15)
-		return 1;
+		return GPIO_LINE_DIRECTION_IN;
 
-	return 0;
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int idio_16_gpio_direction_input(struct gpio_chip *chip,
diff --git a/drivers/gpio/gpio-pcie-idio-24.c b/drivers/gpio/gpio-pcie-idio-24.c
index 52f1647a46fd..44c1e4fc489f 100644
--- a/drivers/gpio/gpio-pcie-idio-24.c
+++ b/drivers/gpio/gpio-pcie-idio-24.c
@@ -104,15 +104,18 @@ static int idio_24_gpio_get_direction(struct gpio_chip *chip,
 
 	/* FET Outputs */
 	if (offset < 24)
-		return 0;
+		return GPIO_LINE_DIRECTION_OUT;
 
 	/* Isolated Inputs */
 	if (offset < 48)
-		return 1;
+		return GPIO_LINE_DIRECTION_IN;
 
 	/* TTL/CMOS I/O */
 	/* OUT MODE = 1 when TTL/CMOS Output Mode is set */
-	return !(ioread8(&idio24gpio->reg->ctl) & out_mode_mask);
+	if (ioread8(&idio24gpio->reg->ctl) & out_mode_mask)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int idio_24_gpio_direction_input(struct gpio_chip *chip,
diff --git a/drivers/gpio/gpio-pisosr.c b/drivers/gpio/gpio-pisosr.c
index f809a5a8e9eb..1331b2a94679 100644
--- a/drivers/gpio/gpio-pisosr.c
+++ b/drivers/gpio/gpio-pisosr.c
@@ -65,7 +65,7 @@ static int pisosr_gpio_get_direction(struct gpio_chip *chip,
 				     unsigned offset)
 {
 	/* This device always input */
-	return 1;
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int pisosr_gpio_direction_input(struct gpio_chip *chip,
diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 722ce5cf861e..5df7782e348f 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -63,7 +63,10 @@ static int pl061_get_direction(struct gpio_chip *gc, unsigned offset)
 {
 	struct pl061 *pl061 = gpiochip_get_data(gc);
 
-	return !(readb(pl061->base + GPIODIR) & BIT(offset));
+	if (readb(pl061->base + GPIODIR) & BIT(offset))
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int pl061_direction_input(struct gpio_chip *gc, unsigned offset)
diff --git a/drivers/gpio/gpio-raspberrypi-exp.c b/drivers/gpio/gpio-raspberrypi-exp.c
index b77ea16ffa03..bb100e0124e6 100644
--- a/drivers/gpio/gpio-raspberrypi-exp.c
+++ b/drivers/gpio/gpio-raspberrypi-exp.c
@@ -147,7 +147,10 @@ static int rpi_exp_gpio_get_direction(struct gpio_chip *gc, unsigned int off)
 			get.gpio);
 		return ret ? ret : -EIO;
 	}
-	return !get.direction;
+	if (get.direction)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int rpi_exp_gpio_get(struct gpio_chip *gc, unsigned int off)
diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 187984d26f47..d7e6e68c25af 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -279,7 +279,10 @@ static int gpio_rcar_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpio_rcar_priv *p = gpiochip_get_data(chip);
 
-	return !(gpio_rcar_read(p, INOUTSEL) & BIT(offset));
+	if (gpio_rcar_read(p, INOUTSEL) & BIT(offset))
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int gpio_rcar_direction_input(struct gpio_chip *chip, unsigned offset)
diff --git a/drivers/gpio/gpio-reg.c b/drivers/gpio/gpio-reg.c
index fdc7a9d5b382..d35169bde25a 100644
--- a/drivers/gpio/gpio-reg.c
+++ b/drivers/gpio/gpio-reg.c
@@ -26,7 +26,8 @@ static int gpio_reg_get_direction(struct gpio_chip *gc, unsigned offset)
 {
 	struct gpio_reg *r = to_gpio_reg(gc);
 
-	return r->direction & BIT(offset) ? 1 : 0;
+	return r->direction & BIT(offset) ? GPIO_LINE_DIRECTION_IN :
+					    GPIO_LINE_DIRECTION_OUT;
 }
 
 static int gpio_reg_direction_output(struct gpio_chip *gc, unsigned offset,
diff --git a/drivers/gpio/gpio-sa1100.c b/drivers/gpio/gpio-sa1100.c
index 46b7cf23fb0f..edff5e81489f 100644
--- a/drivers/gpio/gpio-sa1100.c
+++ b/drivers/gpio/gpio-sa1100.c
@@ -53,7 +53,10 @@ static int sa1100_get_direction(struct gpio_chip *chip, unsigned offset)
 {
 	void __iomem *gpdr = sa1100_gpio_chip(chip)->membase + R_GPDR;
 
-	return !(readl_relaxed(gpdr) & BIT(offset));
+	if (readl_relaxed(gpdr) & BIT(offset))
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int sa1100_direction_input(struct gpio_chip *chip, unsigned offset)
diff --git a/drivers/gpio/gpio-sama5d2-piobu.c b/drivers/gpio/gpio-sama5d2-piobu.c
index 7d718557092e..b04c561f3280 100644
--- a/drivers/gpio/gpio-sama5d2-piobu.c
+++ b/drivers/gpio/gpio-sama5d2-piobu.c
@@ -119,7 +119,8 @@ static int sama5d2_piobu_get_direction(struct gpio_chip *chip,
 	if (ret < 0)
 		return ret;
 
-	return (ret == PIOBU_IN) ? 1 : 0;
+	return (ret == PIOBU_IN) ? GPIO_LINE_DIRECTION_IN :
+				   GPIO_LINE_DIRECTION_OUT;
 }
 
 /**
@@ -154,9 +155,9 @@ static int sama5d2_piobu_get(struct gpio_chip *chip, unsigned int pin)
 	/* if pin is input, read value from PDS else read from SOD */
 	int ret = sama5d2_piobu_get_direction(chip, pin);
 
-	if (ret == 1)
+	if (ret == GPIO_LINE_DIRECTION_IN)
 		ret = sama5d2_piobu_read_value(chip, pin, PIOBU_PDS);
-	else if (!ret)
+	else if (ret == GPIO_LINE_DIRECTION_OUT)
 		ret = sama5d2_piobu_read_value(chip, pin, PIOBU_SOD);
 
 	if (ret < 0)
diff --git a/drivers/gpio/gpio-sch.c b/drivers/gpio/gpio-sch.c
index fb143f28c386..c65f35b68202 100644
--- a/drivers/gpio/gpio-sch.c
+++ b/drivers/gpio/gpio-sch.c
@@ -127,7 +127,10 @@ static int sch_gpio_get_direction(struct gpio_chip *gc, unsigned gpio_num)
 {
 	struct sch_gpio *sch = gpiochip_get_data(gc);
 
-	return sch_gpio_reg_get(sch, gpio_num, GIO);
+	if (sch_gpio_reg_get(sch, gpio_num, GIO))
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static const struct gpio_chip sch_gpio_chip = {
diff --git a/drivers/gpio/gpio-sch311x.c b/drivers/gpio/gpio-sch311x.c
index 8ecf336c9af4..da01e1cad7cb 100644
--- a/drivers/gpio/gpio-sch311x.c
+++ b/drivers/gpio/gpio-sch311x.c
@@ -228,7 +228,10 @@ static int sch311x_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 	data = inb(block->runtime_reg + block->config_regs[offset]);
 	spin_unlock(&block->lock);
 
-	return !!(data & SCH311X_GPIO_CONF_DIR);
+	if (data & SCH311X_GPIO_CONF_DIR)
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int sch311x_gpio_set_config(struct gpio_chip *chip, unsigned offset,
diff --git a/drivers/gpio/gpio-siox.c b/drivers/gpio/gpio-siox.c
index 006a7e6a75f2..311f66757b92 100644
--- a/drivers/gpio/gpio-siox.c
+++ b/drivers/gpio/gpio-siox.c
@@ -203,9 +203,9 @@ static int gpio_siox_direction_output(struct gpio_chip *chip,
 static int gpio_siox_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	if (offset < 12)
-		return 1; /* input */
+		return GPIO_LINE_DIRECTION_IN;
 	else
-		return 0; /* output */
+		return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int gpio_siox_probe(struct siox_device *sdevice)
diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 994d542daf53..542706a852e6 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -84,7 +84,10 @@ static int stmpe_gpio_get_direction(struct gpio_chip *chip,
 	if (ret < 0)
 		return ret;
 
-	return !(ret & mask);
+	if (ret & mask)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int stmpe_gpio_direction_output(struct gpio_chip *chip,
diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
index 75b1135b383a..6be0684cfa49 100644
--- a/drivers/gpio/gpio-tc3589x.c
+++ b/drivers/gpio/gpio-tc3589x.c
@@ -97,7 +97,10 @@ static int tc3589x_gpio_get_direction(struct gpio_chip *chip,
 	if (ret < 0)
 		return ret;
 
-	return !(ret & BIT(pos));
+	if (ret & BIT(pos))
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int tc3589x_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 8a01d3694b28..6fdfe4c5303e 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -215,7 +215,10 @@ static int tegra_gpio_get_direction(struct gpio_chip *chip,
 
 	oe = tegra_gpio_readl(tgi, GPIO_OE(tgi, offset));
 
-	return !(oe & pin_mask);
+	if (oe & pin_mask)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int tegra_gpio_set_debounce(struct gpio_chip *chip, unsigned int offset,
diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 8a2a69178925..57185b96c110 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -111,9 +111,9 @@ static int tegra186_gpio_get_direction(struct gpio_chip *chip,
 
 	value = readl(base + TEGRA186_GPIO_ENABLE_CONFIG);
 	if (value & TEGRA186_GPIO_ENABLE_CONFIG_OUT)
-		return 0;
+		return GPIO_LINE_DIRECTION_OUT;
 
-	return 1;
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int tegra186_gpio_direction_input(struct gpio_chip *chip,
diff --git a/drivers/gpio/gpio-thunderx.c b/drivers/gpio/gpio-thunderx.c
index ddad5c7ea617..d08d86a22b1f 100644
--- a/drivers/gpio/gpio-thunderx.c
+++ b/drivers/gpio/gpio-thunderx.c
@@ -169,7 +169,10 @@ static int thunderx_gpio_get_direction(struct gpio_chip *chip, unsigned int line
 
 	bit_cfg = readq(txgpio->register_base + bit_cfg_reg(line));
 
-	return !(bit_cfg & GPIO_BIT_CFG_TX_OE);
+	if (bit_cfg & GPIO_BIT_CFG_TX_OE)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int thunderx_gpio_set_config(struct gpio_chip *chip,
diff --git a/drivers/gpio/gpio-tpic2810.c b/drivers/gpio/gpio-tpic2810.c
index c8b34d787eed..99d5a84a9129 100644
--- a/drivers/gpio/gpio-tpic2810.c
+++ b/drivers/gpio/gpio-tpic2810.c
@@ -39,7 +39,7 @@ static int tpic2810_get_direction(struct gpio_chip *chip,
 				  unsigned offset)
 {
 	/* This device always output */
-	return 0;
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int tpic2810_direction_input(struct gpio_chip *chip,
diff --git a/drivers/gpio/gpio-tps65086.c b/drivers/gpio/gpio-tps65086.c
index 2eea98ff4ea3..1e9d8262d0ff 100644
--- a/drivers/gpio/gpio-tps65086.c
+++ b/drivers/gpio/gpio-tps65086.c
@@ -21,7 +21,7 @@ static int tps65086_gpio_get_direction(struct gpio_chip *chip,
 				       unsigned offset)
 {
 	/* This device is output only */
-	return 0;
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int tps65086_gpio_direction_input(struct gpio_chip *chip,
diff --git a/drivers/gpio/gpio-tps65912.c b/drivers/gpio/gpio-tps65912.c
index 3ad68bd78282..510d9ed9fd2a 100644
--- a/drivers/gpio/gpio-tps65912.c
+++ b/drivers/gpio/gpio-tps65912.c
@@ -32,9 +32,9 @@ static int tps65912_gpio_get_direction(struct gpio_chip *gc,
 		return ret;
 
 	if (val & GPIO_CFG_MASK)
-		return 0;
+		return GPIO_LINE_DIRECTION_OUT;
 	else
-		return 1;
+		return GPIO_LINE_DIRECTION_IN;
 }
 
 static int tps65912_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
diff --git a/drivers/gpio/gpio-tps68470.c b/drivers/gpio/gpio-tps68470.c
index aff6e504c666..f7f5f770e0fb 100644
--- a/drivers/gpio/gpio-tps68470.c
+++ b/drivers/gpio/gpio-tps68470.c
@@ -47,7 +47,6 @@ static int tps68470_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	return !!(val & BIT(offset));
 }
 
-/* Return 0 if output, 1 if input */
 static int tps68470_gpio_get_direction(struct gpio_chip *gc,
 				       unsigned int offset)
 {
@@ -57,7 +56,7 @@ static int tps68470_gpio_get_direction(struct gpio_chip *gc,
 
 	/* rest are always outputs */
 	if (offset >= TPS68470_N_REGULAR_GPIO)
-		return 0;
+		return GPIO_LINE_DIRECTION_OUT;
 
 	ret = regmap_read(regmap, TPS68470_GPIO_CTL_REG_A(offset), &val);
 	if (ret) {
@@ -67,7 +66,8 @@ static int tps68470_gpio_get_direction(struct gpio_chip *gc,
 	}
 
 	val &= TPS68470_GPIO_MODE_MASK;
-	return val >= TPS68470_GPIO_MODE_OUT_CMOS ? 0 : 1;
+	return val >= TPS68470_GPIO_MODE_OUT_CMOS ? GPIO_LINE_DIRECTION_OUT :
+						    GPIO_LINE_DIRECTION_IN;
 }
 
 static void tps68470_gpio_set(struct gpio_chip *gc, unsigned int offset,
diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
index a3109bcaa0ac..5022e0ad0fae 100644
--- a/drivers/gpio/gpio-tqmx86.c
+++ b/drivers/gpio/gpio-tqmx86.c
@@ -101,7 +101,10 @@ static int tqmx86_gpio_direction_output(struct gpio_chip *chip,
 static int tqmx86_gpio_get_direction(struct gpio_chip *chip,
 				     unsigned int offset)
 {
-	return !!(TQMX86_DIR_INPUT_MASK & BIT(offset));
+	if (TQMX86_DIR_INPUT_MASK & BIT(offset))
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static void tqmx86_gpio_irq_mask(struct irq_data *data)
diff --git a/drivers/gpio/gpio-ts4900.c b/drivers/gpio/gpio-ts4900.c
index 1da8d0586329..d885032cf814 100644
--- a/drivers/gpio/gpio-ts4900.c
+++ b/drivers/gpio/gpio-ts4900.c
@@ -44,7 +44,10 @@ static int ts4900_gpio_get_direction(struct gpio_chip *chip,
 
 	regmap_read(priv->regmap, offset, &reg);
 
-	return !(reg & TS4900_GPIO_OE);
+	if (reg & TS4900_GPIO_OE)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int ts4900_gpio_direction_input(struct gpio_chip *chip,
diff --git a/drivers/gpio/gpio-twl4030.c b/drivers/gpio/gpio-twl4030.c
index fbfb648d3502..de249726230e 100644
--- a/drivers/gpio/gpio-twl4030.c
+++ b/drivers/gpio/gpio-twl4030.c
@@ -165,10 +165,10 @@ static int twl4030_get_gpio_direction(int gpio)
 	if (ret < 0)
 		return ret;
 
-	/* 1 = output, but gpiolib semantics are inverse so invert */
-	ret = !(ret & d_msk);
+	if (ret & d_msk)
+		return GPIO_LINE_DIRECTION_OUT;
 
-	return ret;
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int twl4030_set_gpio_dataout(int gpio, int enable)
@@ -380,10 +380,10 @@ static int twl_get_direction(struct gpio_chip *chip, unsigned offset)
 {
 	struct gpio_twl4030_priv *priv = gpiochip_get_data(chip);
 	/*
-	 * Default 0 = output
+	 * Default GPIO_LINE_DIRECTION_OUT
 	 * LED GPIOs >= TWL4030_GPIO_MAX are always output
 	 */
-	int ret = 0;
+	int ret = GPIO_LINE_DIRECTION_OUT;
 
 	mutex_lock(&priv->mutex);
 	if (offset < TWL4030_GPIO_MAX) {
diff --git a/drivers/gpio/gpio-twl6040.c b/drivers/gpio/gpio-twl6040.c
index c845b2ff1f43..648fb418d775 100644
--- a/drivers/gpio/gpio-twl6040.c
+++ b/drivers/gpio/gpio-twl6040.c
@@ -34,8 +34,7 @@ static int twl6040gpo_get(struct gpio_chip *chip, unsigned offset)
 
 static int twl6040gpo_get_direction(struct gpio_chip *chip, unsigned offset)
 {
-	/* This means "out" */
-	return 0;
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int twl6040gpo_direction_out(struct gpio_chip *chip, unsigned offset,
diff --git a/drivers/gpio/gpio-uniphier.c b/drivers/gpio/gpio-uniphier.c
index 93cdcc41e9fb..bd203e8fa58e 100644
--- a/drivers/gpio/gpio-uniphier.c
+++ b/drivers/gpio/gpio-uniphier.c
@@ -113,7 +113,10 @@ static int uniphier_gpio_offset_read(struct gpio_chip *chip,
 static int uniphier_gpio_get_direction(struct gpio_chip *chip,
 				       unsigned int offset)
 {
-	return uniphier_gpio_offset_read(chip, offset, UNIPHIER_GPIO_PORT_DIR);
+	if (uniphier_gpio_offset_read(chip, offset, UNIPHIER_GPIO_PORT_DIR))
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int uniphier_gpio_direction_input(struct gpio_chip *chip,
diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
index 444fe9e7f04a..8b481b3c1ebe 100644
--- a/drivers/gpio/gpio-wcove.c
+++ b/drivers/gpio/gpio-wcove.c
@@ -170,13 +170,16 @@ static int wcove_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
 	int ret, reg = to_reg(gpio, CTRL_OUT);
 
 	if (reg < 0)
-		return 0;
+		return GPIO_LINE_DIRECTION_OUT;
 
 	ret = regmap_read(wg->regmap, reg, &val);
 	if (ret)
 		return ret;
 
-	return !(val & CTLO_DIR_OUT);
+	if (val & CTLO_DIR_OUT)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int wcove_gpio_get(struct gpio_chip *chip, unsigned int gpio)
diff --git a/drivers/gpio/gpio-ws16c48.c b/drivers/gpio/gpio-ws16c48.c
index e0ef66b6a237..fe456bea81f6 100644
--- a/drivers/gpio/gpio-ws16c48.c
+++ b/drivers/gpio/gpio-ws16c48.c
@@ -56,7 +56,10 @@ static int ws16c48_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 	const unsigned port = offset / 8;
 	const unsigned mask = BIT(offset % 8);
 
-	return !!(ws16c48gpio->io_state[port] & mask);
+	if (ws16c48gpio->io_state[port] & mask)
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int ws16c48_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index a6e66ac18e1f..532b0df8a1f2 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -80,7 +80,10 @@ static int xgene_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 	bank_offset = GPIO_SET_DR_OFFSET + GPIO_BANK_OFFSET(offset);
 	bit_offset = GPIO_BIT_OFFSET(offset);
 
-	return !!(ioread32(chip->base + bank_offset) & BIT(bit_offset));
+	if (ioread32(chip->base + bank_offset) & BIT(bit_offset))
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int xgene_gpio_dir_in(struct gpio_chip *gc, unsigned int offset)
diff --git a/drivers/gpio/gpio-xra1403.c b/drivers/gpio/gpio-xra1403.c
index 05f1998c11a4..31b5072b2df0 100644
--- a/drivers/gpio/gpio-xra1403.c
+++ b/drivers/gpio/gpio-xra1403.c
@@ -83,7 +83,10 @@ static int xra1403_get_direction(struct gpio_chip *chip, unsigned int offset)
 	if (ret)
 		return ret;
 
-	return !!(val & BIT(offset % 8));
+	if (val & BIT(offset % 8))
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int xra1403_get(struct gpio_chip *chip, unsigned int offset)
diff --git a/drivers/gpio/gpio-xtensa.c b/drivers/gpio/gpio-xtensa.c
index 43d3fa5f511a..08d7c3b32038 100644
--- a/drivers/gpio/gpio-xtensa.c
+++ b/drivers/gpio/gpio-xtensa.c
@@ -72,7 +72,7 @@ static inline void disable_cp(unsigned long flags, unsigned long cpenable)
 
 static int xtensa_impwire_get_direction(struct gpio_chip *gc, unsigned offset)
 {
-	return 1; /* input only */
+	return GPIO_LINE_DIRECTION_IN; /* input only */
 }
 
 static int xtensa_impwire_get_value(struct gpio_chip *gc, unsigned offset)
@@ -95,7 +95,7 @@ static void xtensa_impwire_set_value(struct gpio_chip *gc, unsigned offset,
 
 static int xtensa_expstate_get_direction(struct gpio_chip *gc, unsigned offset)
 {
-	return 0; /* output only */
+	return GPIO_LINE_DIRECTION_OUT; /* output only */
 }
 
 static int xtensa_expstate_get_value(struct gpio_chip *gc, unsigned offset)
diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index cd475ff4bcad..4c3f6370eab4 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -360,7 +360,7 @@ static int zynq_gpio_dir_out(struct gpio_chip *chip, unsigned int pin,
  *
  * This function returns the direction of the specified GPIO.
  *
- * Return: 0 for output, 1 for input
+ * Return: GPIO_LINE_DIRECTION_OUT or GPIO_LINE_DIRECTION_IN
  */
 static int zynq_gpio_get_direction(struct gpio_chip *chip, unsigned int pin)
 {
@@ -372,7 +372,10 @@ static int zynq_gpio_get_direction(struct gpio_chip *chip, unsigned int pin)
 
 	reg = readl_relaxed(gpio->base_addr + ZYNQ_GPIO_DIRM_OFFSET(bank_num));
 
-	return !(reg & BIT(bank_pin_num));
+	if (reg & BIT(bank_pin_num))
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 /**
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
