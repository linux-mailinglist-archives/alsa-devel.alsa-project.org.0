Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC2F4685D
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2019 21:53:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBD0D189C;
	Fri, 14 Jun 2019 21:52:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBD0D189C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560542004;
	bh=H6LwavlMRV6x+ZeGA1GigjRGAiXDiJEe0frWhBx+C50=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xtg5RgXbanVrofv5Tn7asofaSAW16k8YY3LPZzJlt9jcV4gqCM9Jk+cu6m5gB62E3
	 UiNGwRKznwHCaM+2+HYWnc7Wcxbv12fIg0hPYr7RhM5atSpjkfvEKJ7RVTsC59FDG+
	 5zU6tQoo1jBFUP7GIEiquqxCDGM1Xl1RWb4Up9tg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30E19F89739;
	Fri, 14 Jun 2019 21:49:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CA3DF89717; Fri, 14 Jun 2019 21:49:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF685F896EA
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 21:49:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF685F896EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="IcGT9d46"
Received: by mail-io1-xd42.google.com with SMTP id m24so8412748ioo.2
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 12:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XggeDQFBfdb+3YPzkLYpmWXYVa5T1jw4aJqqW4WiNOA=;
 b=IcGT9d468pa+P0C/mZsnm+76M4esye5WR1AG3Fs9hpOA1WazPNvMyCaPZ3GV5rPiya
 2KtHsM/4gjym/ah4xhtbpliypu1e+PnUiCZaokJrszASKUXSrgbr/PvxzanFGEsmifBY
 s5ANW07qb8ca6ORspZf9tviVpZiVXhdNV5GMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XggeDQFBfdb+3YPzkLYpmWXYVa5T1jw4aJqqW4WiNOA=;
 b=YjFrU15fduJFiDgShHlP6x4WeXi1Zbjv1PPGf0uuKA1KLHOz6Oh/aHpvcNFLowATrB
 BaJ8rP8ygcPw+vsK+xhEZwUoqj4doA4CY7micPSPhCNDMhlT5XMkET09tTUKjg4ib3im
 FMbS0W9n2Cw+A2bDrzGqNynbhIBju3jR65/3l3DLChMd0vfRS/CjdyKboqHHVD9QnU6x
 XyGRPGTG8DD1Gdy4HjACacEvH/RpfTyihcZ4RABM8uB/bWUMmACxPZYO/njLZfdMvraE
 nrbXY+8SCrfMyz+hCSU2DGDTT9x5lXW572vRN8gPwNDpWZ0rY1EHm8nGJZebN7Y67F2E
 md1A==
X-Gm-Message-State: APjAAAW9Xx1F8qeGmiXqNWzq/DpEA/917xv/+MXm1GE0lOEbMHAkCun6
 CGo6skKBLSHjyuquKX6S1DxLXQ==
X-Google-Smtp-Source: APXvYqyE7eru/RE1iSZF7KO0qV8mLZ2lVU1qwdUdCbJMgemExUEXY/hklfZPRXfgsLUdwHut7+rSFw==
X-Received: by 2002:a02:a90a:: with SMTP id n10mr54237065jam.61.1560541748599; 
 Fri, 14 Jun 2019 12:49:08 -0700 (PDT)
Received: from localhost ([2620:15c:183:200:33ce:f5cf:f863:d3a6])
 by smtp.gmail.com with ESMTPSA id n17sm3128185iog.63.2019.06.14.12.49.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 12:49:08 -0700 (PDT)
From: Fletcher Woodruff <fletcherw@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Fri, 14 Jun 2019 13:48:54 -0600
Message-Id: <20190614194854.208436-5-fletcherw@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190614194854.208436-1-fletcherw@chromium.org>
References: <20190614194854.208436-1-fletcherw@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ben Zhang <benzh@chromium.org>, Mark Brown <broonie@kernel.org>,
 Ross Zwisler <zwisler@chromium.org>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Fletcher Woodruff <fletcherw@chromium.org>
Subject: [alsa-devel] [PATCH v7 4/4] ASoC: rt5677: handle concurrent
	interrupts
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

From: Ben Zhang <benzh@chromium.org>

The rt5677 driver writes to the IRQ control register within the IRQ
handler in order to flip the polarity of the interrupts that have been
signalled.  If an interrupt fires in the interval between the
regmap_read and the regmap_write, it will not trigger a new call to
rt5677_irq.

Add a bounded loop to rt5677_irq that keeps checking interrupts until
none are seen, so that any interrupts that are signalled in that
interval are correctly handled.

Signed-off-by: Ben Zhang <benzh@chromium.org>
Signed-off-by: Fletcher Woodruff <fletcherw@chromium.org>
---
 sound/soc/codecs/rt5677.c | 67 ++++++++++++++++++++++++---------------
 1 file changed, 42 insertions(+), 25 deletions(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 87466ee222ee59..e88766e34ddb1d 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -5072,38 +5072,55 @@ static const struct rt5677_irq_desc rt5677_irq_descs[] = {
 static irqreturn_t rt5677_irq(int unused, void *data)
 {
 	struct rt5677_priv *rt5677 = data;
-	int ret = 0, i, reg_irq, virq;
+	int ret = 0, loop, i, reg_irq, virq;
 	bool irq_fired = false;
 
 	mutex_lock(&rt5677->irq_lock);
-	/* Read interrupt status */
-	ret = regmap_read(rt5677->regmap, RT5677_IRQ_CTRL1, &reg_irq);
-	if (ret) {
-		pr_err("rt5677: failed reading IRQ status: %d\n", ret);
-		goto exit;
-	}
 
-	for (i = 0; i < RT5677_IRQ_NUM; i++) {
-		if (reg_irq & rt5677_irq_descs[i].status_mask) {
-			irq_fired = true;
-			virq = irq_find_mapping(rt5677->domain, i);
-			if (virq)
-				handle_nested_irq(virq);
-
-			/* Clear the interrupt by flipping the polarity of the
-			 * interrupt source line that fired
-			 */
-			reg_irq ^= rt5677_irq_descs[i].polarity_mask;
+	/*
+	 * Loop to handle interrupts until the last i2c read shows no pending
+	 * irqs. The interrupt line is shared by multiple interrupt sources.
+	 * After the regmap_read() below, a new interrupt source line may
+	 * become high before the regmap_write() finishes, so there isn't a
+	 * rising edge on the shared interrupt line for the new interrupt. Thus,
+	 * the loop is needed to avoid missing irqs.
+	 *
+	 * A safeguard of 20 loops is used to avoid hanging in the irq handler
+	 * if there is something wrong with the interrupt status update. The
+	 * interrupt sources here are audio jack plug/unplug events which
+	 * shouldn't happen at a high frequency for a long period of time.
+	 * Empirically, more than 3 loops have never been seen.
+	 */
+	for (loop = 0; loop < 20; loop++) {
+		/* Read interrupt status */
+		ret = regmap_read(rt5677->regmap, RT5677_IRQ_CTRL1, &reg_irq);
+		if (ret) {
+			pr_err("rt5677: failed reading IRQ status: %d\n", ret);
+			goto exit;
 		}
-	}
 
-	if (!irq_fired)
-		goto exit;
+		irq_fired = false;
+		for (i = 0; i < RT5677_IRQ_NUM; i++) {
+			if (reg_irq & rt5677_irq_descs[i].status_mask) {
+				irq_fired = true;
+				virq = irq_find_mapping(rt5677->domain, i);
+				if (virq)
+					handle_nested_irq(virq);
+
+				/* Clear the interrupt by flipping the polarity
+				 * of the interrupt source line that fired
+				 */
+				reg_irq ^= rt5677_irq_descs[i].polarity_mask;
+			}
+		}
+		if (!irq_fired)
+			goto exit;
 
-	ret = regmap_write(rt5677->regmap, RT5677_IRQ_CTRL1, reg_irq);
-	if (ret) {
-		pr_err("rt5677: failed updating IRQ status: %d\n", ret);
-		goto exit;
+		ret = regmap_write(rt5677->regmap, RT5677_IRQ_CTRL1, reg_irq);
+		if (ret) {
+			pr_err("rt5677: failed updating IRQ status: %d\n", ret);
+			goto exit;
+		}
 	}
 exit:
 	mutex_unlock(&rt5677->irq_lock);
-- 
2.22.0.410.gd8fdbe21b5-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
