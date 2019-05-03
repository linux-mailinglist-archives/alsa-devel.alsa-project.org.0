Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C25C913602
	for <lists+alsa-devel@lfdr.de>; Sat,  4 May 2019 01:11:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46F2B1852;
	Sat,  4 May 2019 01:10:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46F2B1852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556925097;
	bh=YGOJs2CNXcjCFjqJry6SOA4i/HrrupQb5CMzCmUXm/E=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LWf8ai3ebizQN/Sm5zmIP8Sw6tKSxOmrYTKD04Qt42n6vPuOCNvkq8gti7CFBO8hQ
	 JPcYHJQ25i+NvsBSY+iS41ZPbe/wxOdoxx2inTwNlaefKhBjmzLrKXggQfoSOLqDRt
	 rj+bGHS+nuY4mnE9jT1VC1DWuI0tByU4lXd+SOZg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0818CF89726;
	Sat,  4 May 2019 01:09:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC15AF89724; Sat,  4 May 2019 01:08:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-it1-x144.google.com (mail-it1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39C16F89700
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 01:08:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39C16F89700
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="lVNL4Rmf"
Received: by mail-it1-x144.google.com with SMTP id q65so10396876itg.2
 for <alsa-devel@alsa-project.org>; Fri, 03 May 2019 16:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QeqabEEfnsVRAyqmyFyxoztJysc7TPg8bfbEZ78oTxA=;
 b=lVNL4RmfJZKLi0sXHoWB0HDeIU36Hun92ZTm1gaIv3a/hn8yUHNeb1anjJRs2WzX61
 RI8ZHB4Xj7/RWdy1KbtUgUl+cVa34QX19rvLdzwwp/B5YZ6yreXDo9o0JPlXHuuNGWSR
 CvrdLxy/ihclyFNmgP8Wno5zTDStKOFS5En78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QeqabEEfnsVRAyqmyFyxoztJysc7TPg8bfbEZ78oTxA=;
 b=FA+o0NTCsk4ceMQMbpty2H+FHw0rJcOzMe8Tg9jBDZr+s09noFSqi20NEIiOS2OHDt
 zMZ7sf8+hm4M5J2s2ioQ+6beZJe4Dh7VJ2gc011nDGT4FRIt7d+zvgireAch/VDT1SoB
 2U9oOqxcBGPUK2oagyqYHGoRQ/8TQVEeL5UZZSbisYY/And+h8UGqcjrThg5fHvKCJnl
 aD0gI7FaWmObqFL3JV1Y5xoj2uEjhOEliIYH6ZjCofDQQ1Z3/MTjJLRq+csGwiVUZ54j
 A/jhHAwTSV/z4uzbLy9UXiunaFoXrG8M2kP0I07OqZTBtiJU6h2kjakQYJPpNWSdyf3D
 TWDA==
X-Gm-Message-State: APjAAAWAa5UnsdKQ5ACUiaV2TSKtEgdL+2vkeu7DrvodZHMLCIWUfwae
 d2aXM6SZ4DOxYASNQdvn76mc7w==
X-Google-Smtp-Source: APXvYqzfUS+c1Bpwi5YFNFDWGqQkReh77+gkt/bSuMVLyQGdKgtMKk04HAKFwT5TF/+CRrfY+QG9jA==
X-Received: by 2002:a02:c4c6:: with SMTP id h6mr9366013jaj.33.1556924936011;
 Fri, 03 May 2019 16:08:56 -0700 (PDT)
Received: from localhost ([2620:15c:183:200:33ce:f5cf:f863:d3a6])
 by smtp.gmail.com with ESMTPSA id z4sm494975iop.8.2019.05.03.16.08.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 16:08:55 -0700 (PDT)
From: Fletcher Woodruff <fletcherw@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Fri,  3 May 2019 17:07:50 -0600
Message-Id: <20190503230751.168403-3-fletcherw@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190503230751.168403-1-fletcherw@chromium.org>
References: <20190503230751.168403-1-fletcherw@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ben Zhang <benzh@chromium.org>, Mark Brown <broonie@kernel.org>,
 Fletcher Woodruff <fletcherw@chromium.org>
Subject: [alsa-devel] [PATCH v4 2/3] ASoC: rt5677: handle concurrent
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
 sound/soc/codecs/rt5677.c | 84 +++++++++++++++++++++++----------------
 1 file changed, 50 insertions(+), 34 deletions(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 899e07e30228a1..da27cbfaec2b74 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -5069,47 +5069,63 @@ static const struct rt5677_irq_desc rt5677_irq_descs[] = {
 static irqreturn_t rt5677_irq(int unused, void *data)
 {
 	struct rt5677_priv *rt5677 = data;
-	int ret = 0, i, reg_irq, virq;
+	int ret = 0, loop, i, reg_irq, virq;
 	bool irq_fired;
 
 	mutex_lock(&rt5677->irq_lock);
-	/* Read interrupt status */
-	ret = regmap_read(rt5677->regmap, RT5677_IRQ_CTRL1, &reg_irq);
-	if (ret) {
-		dev_err(rt5677->component->dev,
-			"Failed to read IRQ status: %d\n",
-			ret);
-		goto exit;
-	}
 	/*
-	 * Clear the interrupt by flipping the polarity of the
-	 * interrupt source lines that just fired
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
 	 */
-	irq_fired = false;
-	for (i = 0; i < RT5677_IRQ_NUM; i++) {
-		if (reg_irq & rt5677_irq_descs[i].status_mask) {
-			reg_irq ^= rt5677_irq_descs[i].polarity_mask;
-			irq_fired = true;
+	for (loop = 0; loop < 20; loop++) {
+		/* Read interrupt status */
+		ret = regmap_read(rt5677->regmap, RT5677_IRQ_CTRL1, &reg_irq);
+		if (ret) {
+			dev_err(rt5677->component->dev,
+				"Failed to read IRQ status: %d\n",
+				ret);
+			goto exit;
+		}
+		/*
+		 * Clear the interrupt by flipping the polarity of the
+		 * interrupt source lines that just fired
+		 */
+		irq_fired = false;
+		for (i = 0; i < RT5677_IRQ_NUM; i++) {
+			if (reg_irq & rt5677_irq_descs[i].status_mask) {
+				reg_irq ^= rt5677_irq_descs[i].polarity_mask;
+				irq_fired = true;
+			}
+		}
+		if (!irq_fired)
+			goto exit;
+
+		ret = regmap_write(rt5677->regmap, RT5677_IRQ_CTRL1, reg_irq);
+		if (ret) {
+			dev_err(rt5677->component->dev,
+				"Failed to update IRQ status: %d\n",
+				ret);
+			goto exit;
 		}
-	}
-	if (!irq_fired)
-		goto exit;
-
-	ret = regmap_write(rt5677->regmap, RT5677_IRQ_CTRL1, reg_irq);
-	if (ret) {
-		dev_err(rt5677->component->dev,
-			"Failed to update IRQ status: %d\n",
-			ret);
-		goto exit;
-	}
 
-	/* Process interrupts */
-	for (i = 0; i < RT5677_IRQ_NUM; i++) {
-		if ((reg_irq & rt5677_irq_descs[i].enable_mask) &&
-		    (reg_irq & rt5677_irq_descs[i].status_mask)) {
-			virq = irq_find_mapping(rt5677->domain, i);
-			if (virq)
-				handle_nested_irq(virq);
+		/* Process interrupts */
+		for (i = 0; i < RT5677_IRQ_NUM; i++) {
+			if ((reg_irq & rt5677_irq_descs[i].enable_mask) &&
+			    (reg_irq & rt5677_irq_descs[i].status_mask)) {
+				virq = irq_find_mapping(rt5677->domain, i);
+				if (virq)
+					handle_nested_irq(virq);
+			}
 		}
 	}
 exit:
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
