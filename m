Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B067DC9C0
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 17:51:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27323168C;
	Fri, 18 Oct 2019 17:50:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27323168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571413906;
	bh=N2UPyLvD0Kg/4aHQQGxogY4UmjPuiP32WOyJl1h0BeQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dxI1D5rgOk7aw2RpSZiEG3FosxQxP+5USMfgJHXBl2tYo/bfxLI0e4quQsxuE+YDc
	 I1W/4qX9QQaQo8v4i8zFpC41Ttw0pYmm0XJvSm9vSfCQZVTXkX5Q0NjqU2aiW5cVxe
	 AATqlLt0MNUTFR+IxeVlMGZmhtbTSPsC7MpIC8eo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56F6DF80714;
	Fri, 18 Oct 2019 17:42:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1838EF80649; Fri, 18 Oct 2019 17:42:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1CCCF805F5
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 17:42:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1CCCF805F5
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1N7zNt-1hzZtF1lsh-0152Bq; Fri, 18 Oct 2019 17:42:30 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>
Date: Fri, 18 Oct 2019 17:41:46 +0200
Message-Id: <20191018154201.1276638-31-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191018154052.1276506-1-arnd@arndb.de>
References: <20191018154052.1276506-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:UWLWOGEuqL7HoJ6Xr4OkSbd6/oCXDeIRUvbhxuAUI6TKv/cR343
 kxPMVrhEqWKjW+b03BYhpJwCiuvG1b73kPw7U8NlkENj5cq4AtEBYDg18CK2nkz3KcOg/QT
 4jGqZIsm/H2YUnFDGKKj/JQIktr+WxfVciYPn5Ah8kDcAcgFYPY+cH4swB7emHhiGiVQdU1
 qgOm8fI04aTxRNsKuql1A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Cn5+2253T9c=:jaJ01TUUjf6HXLRk4DPbiE
 LE9ow541d/sCygNgpAMqh2O7Eu6ewQ5apyNMV5sBqL3/ddIV0xgt3FDdxkHeiuWUgHup+9luf
 ixoT14E4FnCRlYI3em+2lDpCZMN5qPnAmq1+/eWdkrSjcxhfCNu6JJZlXkSSeU/dQ16wc3v/b
 xlwmVH/wRNJvzqCjfw9/8RM1SsDd3ry7m3AAqIOUZUfROfXlw6d42COWZLlHpsCpDxgNZUIas
 8pIoE+jI4aVMTu5gGExZ7jZVX9/U+225xJjlpSoJcZjpwKfjFZWw70qc9FsT6VxqI15NBgdYO
 uk3e2MHo7vxTGxOAe1ik+lowu0ZRhkpPmuwEI1wEVNLtPiXjeqkIb0Z4H2Ml+NGA8JRb71LGY
 YtTruJBsCw0K3waFkZOgGHUKX4l9UmApxhxUJLWF1shbaTscZEXufhEemToKVedWr4PdNnCt7
 4ss8Hg9s3+OP+xHONTdIw8loA7da4oe2Q2JH0IOwcN/2+GJkQMVOwH4nwmzJpqqIuNkMQRwv+
 cq7HaSXocrETfbOzEY5jvLlKMKCv0K5j61y+BQeEfTW7+FQf1hN7dMOty5AICym4sbUL5tyFa
 vQV5CubI07uou4EjhGTmeHJdCGaKdlXkcEfETqAQ+tT3Fs+RxyVe71UrtyGMEExtvlKIHUlSO
 7uDwbKhWK1hyR6Ae13BAIupqox/3yCRsnrb2lKHagiLiyOtk6AxE/17f1/Rky8eilXUBo5U4T
 2EfBlRX1lRXPTAAxnJPd3s/I+ljbVd4N4pVp4qLbIBQWWiDhhnJ+BCAy6ajRhiJWCg9pfxTyr
 EmH9EkWnLgdMUERRdfMi9wqWeTFz75wDNtHTzYRoGOp5u7fyMnPw94GinqSRAmfZBdyjS/w2E
 lh+X/3/FTI6iz1acpgvw==
Cc: Linus Walleij <linus.walleij@linaro.org>, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH 31/46] ASoC: pxa: ac97: use normal MMIO
	accessors
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

To avoid dereferencing hardwired constant pointers from a global header
file, change the driver to use devm_platform_ioremap_resource for getting
an __iomem pointer, and then using readl/writel on that.

Each pointer dereference gets changed by a search&replace, which leads
to a few overlong lines, but seems less risky than trying to clean up
the code at the same time.

Cc: alsa-devel@alsa-project.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/arm/pxa2xx-ac97-lib.c                   | 124 ++++++++++--------
 .../arm/pxa2xx-ac97-regs.h                    |  42 +++---
 sound/arm/pxa2xx-ac97.c                       |   1 -
 3 files changed, 92 insertions(+), 75 deletions(-)
 rename arch/arm/mach-pxa/include/mach/regs-ac97.h => sound/arm/pxa2xx-ac97-regs.h (71%)

diff --git a/sound/arm/pxa2xx-ac97-lib.c b/sound/arm/pxa2xx-ac97-lib.c
index 572b73d73762..e55c0421718b 100644
--- a/sound/arm/pxa2xx-ac97-lib.c
+++ b/sound/arm/pxa2xx-ac97-lib.c
@@ -21,15 +21,17 @@
 
 #include <sound/pxa2xx-lib.h>
 
-#include <mach/regs-ac97.h>
 #include <linux/platform_data/asoc-pxa.h>
 
+#include "pxa2xx-ac97-regs.h"
+
 static DEFINE_MUTEX(car_mutex);
 static DECLARE_WAIT_QUEUE_HEAD(gsr_wq);
 static volatile long gsr_bits;
 static struct clk *ac97_clk;
 static struct clk *ac97conf_clk;
 static int reset_gpio;
+static void __iomem *ac97_reg_base;
 
 extern void pxa27x_configure_ac97reset(int reset_gpio, bool to_gpio);
 
@@ -46,7 +48,7 @@ extern void pxa27x_configure_ac97reset(int reset_gpio, bool to_gpio);
 int pxa2xx_ac97_read(int slot, unsigned short reg)
 {
 	int val = -ENODEV;
-	volatile u32 *reg_addr;
+	u32 __iomem *reg_addr;
 
 	if (slot > 0)
 		return -ENODEV;
@@ -55,31 +57,33 @@ int pxa2xx_ac97_read(int slot, unsigned short reg)
 
 	/* set up primary or secondary codec space */
 	if (cpu_is_pxa25x() && reg == AC97_GPIO_STATUS)
-		reg_addr = slot ? &SMC_REG_BASE : &PMC_REG_BASE;
+		reg_addr = ac97_reg_base +
+			   (slot ? SMC_REG_BASE : PMC_REG_BASE);
 	else
-		reg_addr = slot ? &SAC_REG_BASE : &PAC_REG_BASE;
+		reg_addr = ac97_reg_base +
+			   (slot ? SAC_REG_BASE : PAC_REG_BASE);
 	reg_addr += (reg >> 1);
 
 	/* start read access across the ac97 link */
-	GSR = GSR_CDONE | GSR_SDONE;
+	writel(GSR_CDONE | GSR_SDONE, ac97_reg_base + GSR);
 	gsr_bits = 0;
-	val = (*reg_addr & 0xffff);
+	val = (readl(reg_addr) & 0xffff);
 	if (reg == AC97_GPIO_STATUS)
 		goto out;
-	if (wait_event_timeout(gsr_wq, (GSR | gsr_bits) & GSR_SDONE, 1) <= 0 &&
-	    !((GSR | gsr_bits) & GSR_SDONE)) {
+	if (wait_event_timeout(gsr_wq, (readl(ac97_reg_base + GSR) | gsr_bits) & GSR_SDONE, 1) <= 0 &&
+	    !((readl(ac97_reg_base + GSR) | gsr_bits) & GSR_SDONE)) {
 		printk(KERN_ERR "%s: read error (ac97_reg=%d GSR=%#lx)\n",
-				__func__, reg, GSR | gsr_bits);
+				__func__, reg, readl(ac97_reg_base + GSR) | gsr_bits);
 		val = -ETIMEDOUT;
 		goto out;
 	}
 
 	/* valid data now */
-	GSR = GSR_CDONE | GSR_SDONE;
+	writel(GSR_CDONE | GSR_SDONE, ac97_reg_base + GSR);
 	gsr_bits = 0;
-	val = (*reg_addr & 0xffff);
+	val = (readl(reg_addr) & 0xffff);
 	/* but we've just started another cycle... */
-	wait_event_timeout(gsr_wq, (GSR | gsr_bits) & GSR_SDONE, 1);
+	wait_event_timeout(gsr_wq, (readl(ac97_reg_base + GSR) | gsr_bits) & GSR_SDONE, 1);
 
 out:	mutex_unlock(&car_mutex);
 	return val;
@@ -88,25 +92,27 @@ EXPORT_SYMBOL_GPL(pxa2xx_ac97_read);
 
 int pxa2xx_ac97_write(int slot, unsigned short reg, unsigned short val)
 {
-	volatile u32 *reg_addr;
+	u32 __iomem *reg_addr;
 	int ret = 0;
 
 	mutex_lock(&car_mutex);
 
 	/* set up primary or secondary codec space */
 	if (cpu_is_pxa25x() && reg == AC97_GPIO_STATUS)
-		reg_addr = slot ? &SMC_REG_BASE : &PMC_REG_BASE;
+		reg_addr = ac97_reg_base +
+			   (slot ? SMC_REG_BASE : PMC_REG_BASE);
 	else
-		reg_addr = slot ? &SAC_REG_BASE : &PAC_REG_BASE;
+		reg_addr = ac97_reg_base +
+			   (slot ? SAC_REG_BASE : PAC_REG_BASE);
 	reg_addr += (reg >> 1);
 
-	GSR = GSR_CDONE | GSR_SDONE;
+	writel(GSR_CDONE | GSR_SDONE, ac97_reg_base + GSR);
 	gsr_bits = 0;
-	*reg_addr = val;
-	if (wait_event_timeout(gsr_wq, (GSR | gsr_bits) & GSR_CDONE, 1) <= 0 &&
-	    !((GSR | gsr_bits) & GSR_CDONE)) {
+	writel(val, reg_addr);
+	if (wait_event_timeout(gsr_wq, (readl(ac97_reg_base + GSR) | gsr_bits) & GSR_CDONE, 1) <= 0 &&
+	    !((readl(ac97_reg_base + GSR) | gsr_bits) & GSR_CDONE)) {
 		printk(KERN_ERR "%s: write error (ac97_reg=%d GSR=%#lx)\n",
-				__func__, reg, GSR | gsr_bits);
+				__func__, reg, readl(ac97_reg_base + GSR) | gsr_bits);
 		ret = -EIO;
 	}
 
@@ -120,17 +126,17 @@ static inline void pxa_ac97_warm_pxa25x(void)
 {
 	gsr_bits = 0;
 
-	GCR |= GCR_WARM_RST;
+	writel(readl(ac97_reg_base + GCR) | (GCR_WARM_RST), ac97_reg_base + GCR);
 }
 
 static inline void pxa_ac97_cold_pxa25x(void)
 {
-	GCR &=  GCR_COLD_RST;  /* clear everything but nCRST */
-	GCR &= ~GCR_COLD_RST;  /* then assert nCRST */
+	writel(readl(ac97_reg_base + GCR) & ( GCR_COLD_RST), ac97_reg_base + GCR);  /* clear everything but nCRST */
+	writel(readl(ac97_reg_base + GCR) & (~GCR_COLD_RST), ac97_reg_base + GCR);  /* then assert nCRST */
 
 	gsr_bits = 0;
 
-	GCR = GCR_COLD_RST;
+	writel(GCR_COLD_RST, ac97_reg_base + GCR);
 }
 #endif
 
@@ -142,15 +148,15 @@ static inline void pxa_ac97_warm_pxa27x(void)
 	/* warm reset broken on Bulverde, so manually keep AC97 reset high */
 	pxa27x_configure_ac97reset(reset_gpio, true);
 	udelay(10);
-	GCR |= GCR_WARM_RST;
+	writel(readl(ac97_reg_base + GCR) | (GCR_WARM_RST), ac97_reg_base + GCR);
 	pxa27x_configure_ac97reset(reset_gpio, false);
 	udelay(500);
 }
 
 static inline void pxa_ac97_cold_pxa27x(void)
 {
-	GCR &=  GCR_COLD_RST;  /* clear everything but nCRST */
-	GCR &= ~GCR_COLD_RST;  /* then assert nCRST */
+	writel(readl(ac97_reg_base + GCR) & ( GCR_COLD_RST), ac97_reg_base + GCR);  /* clear everything but nCRST */
+	writel(readl(ac97_reg_base + GCR) & (~GCR_COLD_RST), ac97_reg_base + GCR);  /* then assert nCRST */
 
 	gsr_bits = 0;
 
@@ -158,7 +164,7 @@ static inline void pxa_ac97_cold_pxa27x(void)
 	clk_prepare_enable(ac97conf_clk);
 	udelay(5);
 	clk_disable_unprepare(ac97conf_clk);
-	GCR = GCR_COLD_RST | GCR_WARM_RST;
+	writel(GCR_COLD_RST | GCR_WARM_RST, ac97_reg_base + GCR);
 }
 #endif
 
@@ -168,26 +174,26 @@ static inline void pxa_ac97_warm_pxa3xx(void)
 	gsr_bits = 0;
 
 	/* Can't use interrupts */
-	GCR |= GCR_WARM_RST;
+	writel(readl(ac97_reg_base + GCR) | (GCR_WARM_RST), ac97_reg_base + GCR);
 }
 
 static inline void pxa_ac97_cold_pxa3xx(void)
 {
 	/* Hold CLKBPB for 100us */
-	GCR = 0;
-	GCR = GCR_CLKBPB;
+	writel(0, ac97_reg_base + GCR);
+	writel(GCR_CLKBPB, ac97_reg_base + GCR);
 	udelay(100);
-	GCR = 0;
+	writel(0, ac97_reg_base + GCR);
 
-	GCR &=  GCR_COLD_RST;  /* clear everything but nCRST */
-	GCR &= ~GCR_COLD_RST;  /* then assert nCRST */
+	writel(readl(ac97_reg_base + GCR) & ( GCR_COLD_RST), ac97_reg_base + GCR);  /* clear everything but nCRST */
+	writel(readl(ac97_reg_base + GCR) & (~GCR_COLD_RST), ac97_reg_base + GCR);  /* then assert nCRST */
 
 	gsr_bits = 0;
 
 	/* Can't use interrupts on PXA3xx */
-	GCR &= ~(GCR_PRIRDY_IEN|GCR_SECRDY_IEN);
+	writel(readl(ac97_reg_base + GCR) & (~(GCR_PRIRDY_IEN|GCR_SECRDY_IEN)), ac97_reg_base + GCR);
 
-	GCR = GCR_WARM_RST | GCR_COLD_RST;
+	writel(GCR_WARM_RST | GCR_COLD_RST, ac97_reg_base + GCR);
 }
 #endif
 
@@ -213,10 +219,10 @@ bool pxa2xx_ac97_try_warm_reset(void)
 #endif
 		snd_BUG();
 
-	while (!((GSR | gsr_bits) & (GSR_PCR | GSR_SCR)) && timeout--)
+	while (!((readl(ac97_reg_base + GSR) | gsr_bits) & (GSR_PCR | GSR_SCR)) && timeout--)
 		mdelay(1);
 
-	gsr = GSR | gsr_bits;
+	gsr = readl(ac97_reg_base + GSR) | gsr_bits;
 	if (!(gsr & (GSR_PCR | GSR_SCR))) {
 		printk(KERN_INFO "%s: warm reset timeout (GSR=%#lx)\n",
 				 __func__, gsr);
@@ -250,10 +256,10 @@ bool pxa2xx_ac97_try_cold_reset(void)
 #endif
 		snd_BUG();
 
-	while (!((GSR | gsr_bits) & (GSR_PCR | GSR_SCR)) && timeout--)
+	while (!((readl(ac97_reg_base + GSR) | gsr_bits) & (GSR_PCR | GSR_SCR)) && timeout--)
 		mdelay(1);
 
-	gsr = GSR | gsr_bits;
+	gsr = readl(ac97_reg_base + GSR) | gsr_bits;
 	if (!(gsr & (GSR_PCR | GSR_SCR))) {
 		printk(KERN_INFO "%s: cold reset timeout (GSR=%#lx)\n",
 				 __func__, gsr);
@@ -268,8 +274,10 @@ EXPORT_SYMBOL_GPL(pxa2xx_ac97_try_cold_reset);
 
 void pxa2xx_ac97_finish_reset(void)
 {
-	GCR &= ~(GCR_PRIRDY_IEN|GCR_SECRDY_IEN);
-	GCR |= GCR_SDONE_IE|GCR_CDONE_IE;
+	u32 gcr = readl(ac97_reg_base + GCR);
+	gcr &= ~(GCR_PRIRDY_IEN|GCR_SECRDY_IEN);
+	gcr |= GCR_SDONE_IE|GCR_CDONE_IE;
+	writel(gcr, ac97_reg_base + GCR);
 }
 EXPORT_SYMBOL_GPL(pxa2xx_ac97_finish_reset);
 
@@ -277,9 +285,9 @@ static irqreturn_t pxa2xx_ac97_irq(int irq, void *dev_id)
 {
 	long status;
 
-	status = GSR;
+	status = readl(ac97_reg_base + GSR);
 	if (status) {
-		GSR = status;
+		writel(status, ac97_reg_base + GSR);
 		gsr_bits |= status;
 		wake_up(&gsr_wq);
 
@@ -287,9 +295,9 @@ static irqreturn_t pxa2xx_ac97_irq(int irq, void *dev_id)
 		   since they tend to spuriously trigger when MMC is used
 		   (hardware bug? go figure)... */
 		if (cpu_is_pxa27x()) {
-			MISR = MISR_EOC;
-			PISR = PISR_EOC;
-			MCSR = MCSR_EOC;
+			writel(MISR_EOC, ac97_reg_base + MISR);
+			writel(PISR_EOC, ac97_reg_base + PISR);
+			writel(MCSR_EOC, ac97_reg_base + MCSR);
 		}
 
 		return IRQ_HANDLED;
@@ -301,7 +309,7 @@ static irqreturn_t pxa2xx_ac97_irq(int irq, void *dev_id)
 #ifdef CONFIG_PM
 int pxa2xx_ac97_hw_suspend(void)
 {
-	GCR |= GCR_ACLINK_OFF;
+	writel(readl(ac97_reg_base + GCR) | (GCR_ACLINK_OFF), ac97_reg_base + GCR);
 	clk_disable_unprepare(ac97_clk);
 	return 0;
 }
@@ -321,6 +329,12 @@ int pxa2xx_ac97_hw_probe(struct platform_device *dev)
 	int irq;
 	pxa2xx_audio_ops_t *pdata = dev->dev.platform_data;
 
+	ac97_reg_base = devm_platform_ioremap_resource(dev, 0);
+	if (IS_ERR(ac97_reg_base)) {
+		dev_err(&dev->dev, "Missing MMIO resource\n");
+		return PTR_ERR(ac97_reg_base);
+	}
+
 	if (pdata) {
 		switch (pdata->reset_gpio) {
 		case 95:
@@ -398,7 +412,7 @@ int pxa2xx_ac97_hw_probe(struct platform_device *dev)
 	return 0;
 
 err_irq:
-	GCR |= GCR_ACLINK_OFF;
+	writel(readl(ac97_reg_base + GCR) | (GCR_ACLINK_OFF), ac97_reg_base + GCR);
 err_clk2:
 	clk_put(ac97_clk);
 	ac97_clk = NULL;
@@ -416,7 +430,7 @@ void pxa2xx_ac97_hw_remove(struct platform_device *dev)
 {
 	if (cpu_is_pxa27x())
 		gpio_free(reset_gpio);
-	GCR |= GCR_ACLINK_OFF;
+	writel(readl(ac97_reg_base + GCR) | (GCR_ACLINK_OFF), ac97_reg_base + GCR);
 	free_irq(platform_get_irq(dev, 0), NULL);
 	if (ac97conf_clk) {
 		clk_put(ac97conf_clk);
@@ -430,13 +444,19 @@ EXPORT_SYMBOL_GPL(pxa2xx_ac97_hw_remove);
 
 u32 pxa2xx_ac97_read_modr(void)
 {
-	return MODR;
+	if (!ac97_reg_base)
+		return 0;
+
+	return readl(ac97_reg_base + MODR);
 }
 EXPORT_SYMBOL_GPL(pxa2xx_ac97_read_modr);
 
 u32 pxa2xx_ac97_read_misr(void)
 {
-	return MISR;
+	if (!ac97_reg_base)
+		return 0;
+
+	return readl(ac97_reg_base + MISR);
 }
 EXPORT_SYMBOL_GPL(pxa2xx_ac97_read_misr);
 
diff --git a/arch/arm/mach-pxa/include/mach/regs-ac97.h b/sound/arm/pxa2xx-ac97-regs.h
similarity index 71%
rename from arch/arm/mach-pxa/include/mach/regs-ac97.h
rename to sound/arm/pxa2xx-ac97-regs.h
index ec09b9635e25..ae638a1b919b 100644
--- a/arch/arm/mach-pxa/include/mach/regs-ac97.h
+++ b/sound/arm/pxa2xx-ac97-regs.h
@@ -2,25 +2,23 @@
 #ifndef __ASM_ARCH_REGS_AC97_H
 #define __ASM_ARCH_REGS_AC97_H
 
-#include "pxa-regs.h"
-
 /*
  * AC97 Controller registers
  */
 
-#define POCR		__REG(0x40500000)  /* PCM Out Control Register */
+#define POCR		(0x0000)  	/* PCM Out Control Register */
 #define POCR_FEIE	(1 << 3)	/* FIFO Error Interrupt Enable */
 #define POCR_FSRIE	(1 << 1)	/* FIFO Service Request Interrupt Enable */
 
-#define PICR		__REG(0x40500004)  /* PCM In Control Register */
+#define PICR		(0x0004) 	/* PCM In Control Register */
 #define PICR_FEIE	(1 << 3)	/* FIFO Error Interrupt Enable */
 #define PICR_FSRIE	(1 << 1)	/* FIFO Service Request Interrupt Enable */
 
-#define MCCR		__REG(0x40500008)  /* Mic In Control Register */
+#define MCCR		(0x0008)  	/* Mic In Control Register */
 #define MCCR_FEIE	(1 << 3)	/* FIFO Error Interrupt Enable */
 #define MCCR_FSRIE	(1 << 1)	/* FIFO Service Request Interrupt Enable */
 
-#define GCR		__REG(0x4050000C)  /* Global Control Register */
+#define GCR		(0x000C) 	 /* Global Control Register */
 #ifdef CONFIG_PXA3xx
 #define GCR_CLKBPB	(1 << 31)	/* Internal clock enable */
 #endif
@@ -36,21 +34,21 @@
 #define GCR_COLD_RST	(1 << 1)	/* AC'97 Cold Reset (0 = active) */
 #define GCR_GIE		(1 << 0)	/* Codec GPI Interrupt Enable */
 
-#define POSR		__REG(0x40500010)  /* PCM Out Status Register */
+#define POSR		(0x0010)  	/* PCM Out Status Register */
 #define POSR_FIFOE	(1 << 4)	/* FIFO error */
 #define POSR_FSR	(1 << 2)	/* FIFO Service Request */
 
-#define PISR		__REG(0x40500014)  /* PCM In Status Register */
+#define PISR		(0x0014)  	/* PCM In Status Register */
 #define PISR_FIFOE	(1 << 4)	/* FIFO error */
 #define PISR_EOC	(1 << 3)	/* DMA End-of-Chain (exclusive clear) */
 #define PISR_FSR	(1 << 2)	/* FIFO Service Request */
 
-#define MCSR		__REG(0x40500018)  /* Mic In Status Register */
+#define MCSR		(0x0018)  	/* Mic In Status Register */
 #define MCSR_FIFOE	(1 << 4)	/* FIFO error */
 #define MCSR_EOC	(1 << 3)	/* DMA End-of-Chain (exclusive clear) */
 #define MCSR_FSR	(1 << 2)	/* FIFO Service Request */
 
-#define GSR		__REG(0x4050001C)  /* Global Status Register */
+#define GSR		(0x001C)  	/* Global Status Register */
 #define GSR_CDONE	(1 << 19)	/* Command Done */
 #define GSR_SDONE	(1 << 18)	/* Status Done */
 #define GSR_RDCS	(1 << 15)	/* Read Completion Status */
@@ -69,34 +67,34 @@
 #define GSR_MIINT	(1 << 1)	/* Modem In Interrupt */
 #define GSR_GSCI	(1 << 0)	/* Codec GPI Status Change Interrupt */
 
-#define CAR		__REG(0x40500020)  /* CODEC Access Register */
+#define CAR		(0x0020)  	/* CODEC Access Register */
 #define CAR_CAIP	(1 << 0)	/* Codec Access In Progress */
 
-#define PCDR		__REG(0x40500040)  /* PCM FIFO Data Register */
-#define MCDR		__REG(0x40500060)  /* Mic-in FIFO Data Register */
+#define PCDR		(0x0040)  	/* PCM FIFO Data Register */
+#define MCDR		(0x0060)  	/* Mic-in FIFO Data Register */
 
-#define MOCR		__REG(0x40500100)  /* Modem Out Control Register */
+#define MOCR		(0x0100)  	/* Modem Out Control Register */
 #define MOCR_FEIE	(1 << 3)	/* FIFO Error */
 #define MOCR_FSRIE	(1 << 1)	/* FIFO Service Request Interrupt Enable */
 
-#define MICR		__REG(0x40500108)  /* Modem In Control Register */
+#define MICR		(0x0108)  	/* Modem In Control Register */
 #define MICR_FEIE	(1 << 3)	/* FIFO Error */
 #define MICR_FSRIE	(1 << 1)	/* FIFO Service Request Interrupt Enable */
 
-#define MOSR		__REG(0x40500110)  /* Modem Out Status Register */
+#define MOSR		(0x0110)  	/* Modem Out Status Register */
 #define MOSR_FIFOE	(1 << 4)	/* FIFO error */
 #define MOSR_FSR	(1 << 2)	/* FIFO Service Request */
 
-#define MISR		__REG(0x40500118)  /* Modem In Status Register */
+#define MISR		(0x0118)  	/* Modem In Status Register */
 #define MISR_FIFOE	(1 << 4)	/* FIFO error */
 #define MISR_EOC	(1 << 3)	/* DMA End-of-Chain (exclusive clear) */
 #define MISR_FSR	(1 << 2)	/* FIFO Service Request */
 
-#define MODR		__REG(0x40500140)  /* Modem FIFO Data Register */
+#define MODR		(0x0140)  	/* Modem FIFO Data Register */
 
-#define PAC_REG_BASE	__REG(0x40500200)  /* Primary Audio Codec */
-#define SAC_REG_BASE	__REG(0x40500300)  /* Secondary Audio Codec */
-#define PMC_REG_BASE	__REG(0x40500400)  /* Primary Modem Codec */
-#define SMC_REG_BASE	__REG(0x40500500)  /* Secondary Modem Codec */
+#define PAC_REG_BASE	(0x0200)  	/* Primary Audio Codec */
+#define SAC_REG_BASE	(0x0300)  	/* Secondary Audio Codec */
+#define PMC_REG_BASE	(0x0400)  	/* Primary Modem Codec */
+#define SMC_REG_BASE	(0x0500)  	/* Secondary Modem Codec */
 
 #endif /* __ASM_ARCH_REGS_AC97_H */
diff --git a/sound/arm/pxa2xx-ac97.c b/sound/arm/pxa2xx-ac97.c
index 2e99232028ac..c3d682de1289 100644
--- a/sound/arm/pxa2xx-ac97.c
+++ b/sound/arm/pxa2xx-ac97.c
@@ -21,7 +21,6 @@
 #include <sound/pxa2xx-lib.h>
 #include <sound/dmaengine_pcm.h>
 
-#include <mach/regs-ac97.h>
 #include <linux/platform_data/asoc-pxa.h>
 
 static void pxa2xx_ac97_legacy_reset(struct snd_ac97 *ac97)
-- 
2.20.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
