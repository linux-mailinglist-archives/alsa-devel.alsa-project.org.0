Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B975391DF6D
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:36:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40C5F2367;
	Mon,  1 Jul 2024 14:35:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40C5F2367
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719837363;
	bh=EVdDvyzNX81crbjdLKs6Wo3nyF9HNCLTnL9r0uF0UR0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=cnthr8tU/CBuhmZdDXid7mteXwbB4LjphBS30NPXm0KM15wBfK7sX1pNHKgho5bQA
	 1Jao4NFyTuniXQb1yJychWtCrfDhDgAo0Op0CWHZJKAqDYzl3j5NWggF0XzG6jpS5I
	 ni9PHh0hJoo2phXWY6g2v8PdfIIyYJemmnF6URBc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51DF2F89A74; Mon,  1 Jul 2024 14:23:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E640AF89A5F;
	Mon,  1 Jul 2024 14:23:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC5A2F80423; Thu, 27 Jun 2024 17:05:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA84EF8013D
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 17:05:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA84EF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=timesys-com.20230601.gappssmtp.com
 header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Svq5js4v
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a724440f597so695976766b.0
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 08:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1719500720;
 x=1720105520; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c0en4a04xGUdMe3CHuzskBvRxKjfQMua42qeg+gKOfI=;
        b=Svq5js4vbKpJ6Sw0RKC8tKZpmf9So0NPM90sDC+qX98M0OpHq9iPVe5OpBSM4q840r
         cEVxvM724/XQsYcMv7AdElTzRPEWrEE+2SvC+79+nulbt5JGDmKOMT9c/qqNX9ym+cwq
         f2wJnEBJvly2cDBEd7lRgN0LbHY083JpS3Ltrd/vcFm0WcwwtbdmQGiy87NJXNS28/4c
         vFc9KJsLHFmlmh71Px9uAFiOoL+NXsfQzsuw2gJUSZr7olLhU6D5KEMW2R5wMGtAkm8q
         NrO3lKpydZT1284IkguHqLMxmLU75ByMkIj6798NVEUexdreSI5hH5uXjqjBi7QbURoU
         f1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719500720; x=1720105520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0en4a04xGUdMe3CHuzskBvRxKjfQMua42qeg+gKOfI=;
        b=JCRD5Sf0phUl8frmG31rYvU2Q6H1L7NbAJ3OGab6SGgKzBAwphxvNBOwkRxsj12tNn
         +/ToU/btKLnx0iR/byMpxQU1uMiR9iTBFriEs/pxamaycrNvDNU8GsbkWFHSw2jWKNAT
         r5o1ftsQxJxwbS3Csk4KeR06ID/h2mGmmZPLk31e5902XQMF9TR1yz5DW37h3AE1j525
         az9DgPX9GC3a/KcgjYaHl22mSnHBx48PHd6/4kMNNT94mNvX653r+0Lays8rI3oj/Zbr
         y6SmaFEObPwtsGrhNI08ZGlyNZNJc74xJO7L+fdooQ3YLDTSPswOSzgYCndz/AqJTauj
         bYhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlXcBuiL75xmYgcJl1hHIAyNg2FBIyF/YCBqm8FMKyRKawJmJBpM0VY3w0BHXxXi4XnxIa8IvMGzOtQx2aNsa9an242Y7TSWo+K4o=
X-Gm-Message-State: AOJu0YxotcTvz73FKS4qGWuyqsIj+L3hGpq2PdYS6UcfgEj8mHFPmO++
	vO27/+2FFCrjIX7SWuN4+nBEi9LMWFzHtTI9fF/6LgElI7yVXksinf1+jbw3K8A=
X-Google-Smtp-Source: 
 AGHT+IFWt98+h6PiAC5RUj8DxZquK6YDjOivxXx0avHukTQoTFEMXOT45G3SobQ5Q+1zYPM7YJ42Nw==
X-Received: by 2002:a17:907:3ad4:b0:a6f:4de6:79f with SMTP id
 a640c23a62f3a-a7245bad98emr764943466b.40.1719500720489;
        Thu, 27 Jun 2024 08:05:20 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a729d7ca289sm67189066b.222.2024.06.27.08.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:05:19 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yangtao Li <frank.li@vivo.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Li Zetao <lizetao1@huawei.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Corentin Labbe <clabbe@baylibre.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [Patch v5 12/12] i2x: pnx: Fix potential deadlock warning from
 del_timer_sync() call in isr
Date: Thu, 27 Jun 2024 17:00:30 +0200
Message-Id: <20240627150046.258795-13-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
References: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: piotr.wojtaszczyk@timesys.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4EYQ4WDHNURANLDQ5A4HB4J5MNTBLIQR
X-Message-ID-Hash: 4EYQ4WDHNURANLDQ5A4HB4J5MNTBLIQR
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:23:17 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4EYQ4WDHNURANLDQ5A4HB4J5MNTBLIQR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When del_timer_sync() is called in an interrupt context it throws a warning
because of potential deadlock. The timer is used only to exit from
wait_for_completion() after a timeout so replacing the call with
wait_for_completion_timeout() allows to remove the problematic timer and
its related functions altogether.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v5:
- Replaced wait_for_completion() with wait_for_completion_timeout().
- Removed unneded "alg_data->mif.timer" and its functions
- Request irq with devm_request_irq() as before the patch
- Renamed the patch and reword description for the new way to fix
  the warning

Changes for v4:
- Request irq with devm_request_threaded_irq() to prevent the warning

 drivers/i2c/busses/i2c-pnx.c | 48 ++++++++----------------------------
 1 file changed, 10 insertions(+), 38 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pnx.c b/drivers/i2c/busses/i2c-pnx.c
index a12525b3186b..f448505d5468 100644
--- a/drivers/i2c/busses/i2c-pnx.c
+++ b/drivers/i2c/busses/i2c-pnx.c
@@ -15,7 +15,6 @@
 #include <linux/ioport.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
-#include <linux/timer.h>
 #include <linux/completion.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
@@ -32,7 +31,6 @@ struct i2c_pnx_mif {
 	int			ret;		/* Return value */
 	int			mode;		/* Interface mode */
 	struct completion	complete;	/* I/O completion */
-	struct timer_list	timer;		/* Timeout */
 	u8 *			buf;		/* Data buffer */
 	int			len;		/* Length of data buffer */
 	int			order;		/* RX Bytes to order via TX */
@@ -117,24 +115,6 @@ static inline int wait_reset(struct i2c_pnx_algo_data *data)
 	return (timeout <= 0);
 }
 
-static inline void i2c_pnx_arm_timer(struct i2c_pnx_algo_data *alg_data)
-{
-	struct timer_list *timer = &alg_data->mif.timer;
-	unsigned long expires = msecs_to_jiffies(alg_data->timeout);
-
-	if (expires <= 1)
-		expires = 2;
-
-	del_timer_sync(timer);
-
-	dev_dbg(&alg_data->adapter.dev, "Timer armed at %lu plus %lu jiffies.\n",
-		jiffies, expires);
-
-	timer->expires = jiffies + expires;
-
-	add_timer(timer);
-}
-
 /**
  * i2c_pnx_start - start a device
  * @slave_addr:		slave address
@@ -259,8 +239,6 @@ static int i2c_pnx_master_xmit(struct i2c_pnx_algo_data *alg_data)
 				~(mcntrl_afie | mcntrl_naie | mcntrl_drmie),
 				  I2C_REG_CTL(alg_data));
 
-			del_timer_sync(&alg_data->mif.timer);
-
 			dev_dbg(&alg_data->adapter.dev,
 				"%s(): Waking up xfer routine.\n",
 				__func__);
@@ -276,8 +254,6 @@ static int i2c_pnx_master_xmit(struct i2c_pnx_algo_data *alg_data)
 			~(mcntrl_afie | mcntrl_naie | mcntrl_drmie),
 			  I2C_REG_CTL(alg_data));
 
-		/* Stop timer. */
-		del_timer_sync(&alg_data->mif.timer);
 		dev_dbg(&alg_data->adapter.dev,
 			"%s(): Waking up xfer routine after zero-xfer.\n",
 			__func__);
@@ -364,8 +340,6 @@ static int i2c_pnx_master_rcv(struct i2c_pnx_algo_data *alg_data)
 				 mcntrl_drmie | mcntrl_daie);
 			iowrite32(ctl, I2C_REG_CTL(alg_data));
 
-			/* Kill timer. */
-			del_timer_sync(&alg_data->mif.timer);
 			complete(&alg_data->mif.complete);
 		}
 	}
@@ -400,8 +374,6 @@ static irqreturn_t i2c_pnx_interrupt(int irq, void *dev_id)
 			 mcntrl_drmie);
 		iowrite32(ctl, I2C_REG_CTL(alg_data));
 
-		/* Stop timer, to prevent timeout. */
-		del_timer_sync(&alg_data->mif.timer);
 		complete(&alg_data->mif.complete);
 	} else if (stat & mstatus_nai) {
 		/* Slave did not acknowledge, generate a STOP */
@@ -419,8 +391,6 @@ static irqreturn_t i2c_pnx_interrupt(int irq, void *dev_id)
 		/* Our return value. */
 		alg_data->mif.ret = -EIO;
 
-		/* Stop timer, to prevent timeout. */
-		del_timer_sync(&alg_data->mif.timer);
 		complete(&alg_data->mif.complete);
 	} else {
 		/*
@@ -453,9 +423,8 @@ static irqreturn_t i2c_pnx_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static void i2c_pnx_timeout(struct timer_list *t)
+static void i2c_pnx_timeout(struct i2c_pnx_algo_data *alg_data)
 {
-	struct i2c_pnx_algo_data *alg_data = from_timer(alg_data, t, mif.timer);
 	u32 ctl;
 
 	dev_err(&alg_data->adapter.dev,
@@ -472,7 +441,6 @@ static void i2c_pnx_timeout(struct timer_list *t)
 	iowrite32(ctl, I2C_REG_CTL(alg_data));
 	wait_reset(alg_data);
 	alg_data->mif.ret = -EIO;
-	complete(&alg_data->mif.complete);
 }
 
 static inline void bus_reset_if_active(struct i2c_pnx_algo_data *alg_data)
@@ -514,6 +482,7 @@ i2c_pnx_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 	struct i2c_msg *pmsg;
 	int rc = 0, completed = 0, i;
 	struct i2c_pnx_algo_data *alg_data = adap->algo_data;
+	unsigned long time_left;
 	u32 stat;
 
 	dev_dbg(&alg_data->adapter.dev,
@@ -548,7 +517,6 @@ i2c_pnx_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 		dev_dbg(&alg_data->adapter.dev, "%s(): mode %d, %d bytes\n",
 			__func__, alg_data->mif.mode, alg_data->mif.len);
 
-		i2c_pnx_arm_timer(alg_data);
 
 		/* initialize the completion var */
 		init_completion(&alg_data->mif.complete);
@@ -564,7 +532,10 @@ i2c_pnx_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 			break;
 
 		/* Wait for completion */
-		wait_for_completion(&alg_data->mif.complete);
+		time_left = wait_for_completion_timeout(&alg_data->mif.complete,
+							alg_data->timeout);
+		if (time_left == 0)
+			i2c_pnx_timeout(alg_data);
 
 		if (!(rc = alg_data->mif.ret))
 			completed++;
@@ -653,7 +624,10 @@ static int i2c_pnx_probe(struct platform_device *pdev)
 	alg_data->adapter.algo_data = alg_data;
 	alg_data->adapter.nr = pdev->id;
 
-	alg_data->timeout = I2C_PNX_TIMEOUT_DEFAULT;
+	alg_data->timeout = msecs_to_jiffies(I2C_PNX_TIMEOUT_DEFAULT);
+	if (alg_data->timeout <= 1)
+		alg_data->timeout = 2;
+
 #ifdef CONFIG_OF
 	alg_data->adapter.dev.of_node = of_node_get(pdev->dev.of_node);
 	if (pdev->dev.of_node) {
@@ -673,8 +647,6 @@ static int i2c_pnx_probe(struct platform_device *pdev)
 	if (IS_ERR(alg_data->clk))
 		return PTR_ERR(alg_data->clk);
 
-	timer_setup(&alg_data->mif.timer, i2c_pnx_timeout, 0);
-
 	snprintf(alg_data->adapter.name, sizeof(alg_data->adapter.name),
 		 "%s", pdev->name);
 
-- 
2.25.1

