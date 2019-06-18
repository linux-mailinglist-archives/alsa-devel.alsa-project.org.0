Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 232844AEDB
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 01:49:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5A7316A9;
	Wed, 19 Jun 2019 01:48:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5A7316A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560901769;
	bh=dYZT3WEo/I2a4eUuoYSnNmgBHvLgm0L78iKP4pt8R48=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XIk3ZIeKxgYYndiciznUYLVZvjWloVMp/HPSHRzo7C7v9Qhr0AWwqdUqf9u3h6xHX
	 qrY5ShM2XUCArUbafkFLOkAyMn6yRMrV/HY8sX//mQgKig1X3Vs+UGA7vvz1s0WS7F
	 j4duEUaSZ282goK0OXdFS39PiwHhdpq4DsEMDJtg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAC3CF89726;
	Wed, 19 Jun 2019 01:46:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 678DCF89731; Wed, 19 Jun 2019 01:46:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 956FEF89726
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 01:46:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 956FEF89726
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="f4vvo+qD"
Received: by mail-io1-xd43.google.com with SMTP id u19so33871859ior.9
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 16:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XKEwL46yWPL513Bk6jjrSqur9SqEusEP9oaTL7362No=;
 b=f4vvo+qD8x2fS17YJXotuuQ0yNTjhcMiOueIOJlRYlw9HiFm8vCalF8qWjIgF2lNUG
 UhESAqKI6Pj6stOt+JtZBAH96G1I5lNF5SUl031KNK4CEoJWb0Z5MUWMnNSQQGMES91v
 z7IRyyr4MVfZJAOoyKDFyHlp/E5VNmZ5on+zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XKEwL46yWPL513Bk6jjrSqur9SqEusEP9oaTL7362No=;
 b=FRmth8WnLey6wWDchkUjAaTXL+lPTFKhKtqIWITOh3EOJd+O5Zf8a0wUT0QFanw2aY
 keZ1DkffurERHXc4StWFyRhoy5QeHebxExCKSdVd/5WVt1cXsnEez706cMkTzFzL5/NA
 lTK+gmrRPYUiqyh0DsohUceJHMwBSy3S/fUJ6J3nE6fa0VAkZyj9//VOph+XrDN/kbwy
 +P2POi33cY1n4BKmc384h2O6LBBKhkdM1Z+IBfKfcjw8/Z1Emu23oB4wm3/yFBRuqa92
 Ekol0q3GBWvT+af4rEiAOygVBqmk5i7txAW5B6R2fknKARtwB/Vr7jm7KwlruNeqm/t5
 lPcg==
X-Gm-Message-State: APjAAAWPTegJ9J2bGdw6EYS5yzaK+VKFk0yp1fQPkypvMHwqVNa3VQhE
 Sf/c5lOp1wyWTgKT+h9tMzKLaA==
X-Google-Smtp-Source: APXvYqx13C9/hn7Fy5h31GkaUYoCBYYER9eMuX2NvDi4V9J3XhxW+7gEdEMM35Z68BongnROuN5Ohw==
X-Received: by 2002:a02:16c5:: with SMTP id a188mr93076208jaa.86.1560901577294; 
 Tue, 18 Jun 2019 16:46:17 -0700 (PDT)
Received: from localhost ([2620:15c:183:200:33ce:f5cf:f863:d3a6])
 by smtp.gmail.com with ESMTPSA id p63sm19696117iof.45.2019.06.18.16.46.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Jun 2019 16:46:16 -0700 (PDT)
From: Fletcher Woodruff <fletcherw@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Tue, 18 Jun 2019 17:45:55 -0600
Message-Id: <20190618234555.188955-3-fletcherw@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190618234555.188955-1-fletcherw@chromium.org>
References: <20190618234555.188955-1-fletcherw@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ben Zhang <benzh@chromium.org>, Mark Brown <broonie@kernel.org>,
 Ross Zwisler <zwisler@chromium.org>,
 Fletcher Woodruff <fletcherw@chromium.org>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH v8 2/2] ASoC: rt5677: handle concurrent
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
 sound/soc/codecs/rt5677.c | 71 +++++++++++++++++++++++++--------------
 1 file changed, 45 insertions(+), 26 deletions(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index b5ae61ff87af13..202af7135f07a4 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -5072,38 +5072,57 @@ static const struct rt5677_irq_desc rt5677_irq_descs[] = {
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
-		dev_err(rt5677->dev, "failed reading IRQ status: %d\n", ret);
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
+			dev_err(rt5677->dev, "failed reading IRQ status: %d\n",
+				ret);
+			goto exit;
 		}
-	}
 
-	if (!irq_fired)
-		goto exit;
-
-	ret = regmap_write(rt5677->regmap, RT5677_IRQ_CTRL1, reg_irq);
-	if (ret) {
-		dev_err(rt5677->dev, "failed updating IRQ status: %d\n", ret);
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
+
+		ret = regmap_write(rt5677->regmap, RT5677_IRQ_CTRL1, reg_irq);
+		if (ret) {
+			dev_err(rt5677->dev, "failed updating IRQ status: %d\n",
+				ret);
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
