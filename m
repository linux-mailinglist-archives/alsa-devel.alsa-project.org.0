Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5893736776
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 00:29:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E503A165D;
	Thu,  6 Jun 2019 00:28:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E503A165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559773747;
	bh=clYNjGyaWUM4PP1OvYNB3m0h6ObqYRcqNJ5YCsVBd0g=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gcbyt0VEdOtociZOxbm+MtgZYoGdMj8Zj2ZqWYLg4qr2KeK9llqucJylhWzRqisfC
	 uJLWMmFcptZcKl/+SX1PRnUFf9P2cVxCVNc57ZX4WvNFdeID8N1SJP5uKxWZCnfBUP
	 lJhy2IrUGaydgskqWOPA2HmjOQVzGxAO1aVWNN7I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71457F89743;
	Thu,  6 Jun 2019 00:25:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2D48F8973B; Thu,  6 Jun 2019 00:25:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A337F8971C
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 00:24:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A337F8971C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="PH7N9pU/"
Received: by mail-io1-xd44.google.com with SMTP id k13so267901iop.5
 for <alsa-devel@alsa-project.org>; Wed, 05 Jun 2019 15:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ENEfQXnBKgsiB2d36L6+P4CJJ9i3migBmA1QXIq3dJc=;
 b=PH7N9pU/PcBPixEKjGT9dOemu7GSJnSM5tyYxvbdDhRJejXacgwteNTBAACtytrbZP
 weVzwsXbz/aCam4SwCAzGMilMDQnThHw0SaOYdk8yU11bL11E1rJPMz91S58rggIkF5j
 oaoYF+qjcdjYhWtebt8cZhNeV4F7XrOYpnaNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ENEfQXnBKgsiB2d36L6+P4CJJ9i3migBmA1QXIq3dJc=;
 b=psBzQWvQr42ZbAwrB2cocHzjYkf2IAZs6UdOxDr85lzGavzXAzueUbKGKt/J55ZrAi
 vnrZRIgR0NBa3UgBSTsUKh+AAh+H3YHW8aUFq7KVUGKeY0/uVx5wdTYcvbfL6fOaXAgy
 AInU/PHplPIKXbXsLNyxssgw2f1GpBvOaLGIde3lsx0Z6UZiPCEaP1TBTyL75CdwVIeO
 drUZOhkJ3kO+els5+PbOcCONo1FrJhQQc14T6dvr0Nl+N3MILao1dSkKYujk7kozWvDd
 8L+pNYb0aoaYlU/tZPYKDa/gnKdwWVYsPO/MZzM/BinjScQwV/sOFFKJwGmxTZaM9cgk
 JqEw==
X-Gm-Message-State: APjAAAUA2ltifNCAr5/flkHGOrPv0sFxkjH4syULpnFR5QhUOcam7P1P
 EMe3TV9wPJtVaWB8B0YBx8G5+g==
X-Google-Smtp-Source: APXvYqwRcLhms5KzGFYcR9J+QtVNHLs9QmL3/RVh5ejTxlCMOAxyTHOOr/FR6F0PlBk41XT1AnPjsg==
X-Received: by 2002:a6b:b602:: with SMTP id g2mr12815416iof.54.1559773496152; 
 Wed, 05 Jun 2019 15:24:56 -0700 (PDT)
Received: from localhost ([2620:15c:183:200:33ce:f5cf:f863:d3a6])
 by smtp.gmail.com with ESMTPSA id e3sm81783ith.18.2019.06.05.15.24.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Jun 2019 15:24:55 -0700 (PDT)
From: Fletcher Woodruff <fletcherw@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Wed,  5 Jun 2019 16:24:19 -0600
Message-Id: <20190605222419.54479-5-fletcherw@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
In-Reply-To: <20190605222419.54479-1-fletcherw@chromium.org>
References: <20190507220115.90395-1-fletcherw@chromium.org>
 <20190605222419.54479-1-fletcherw@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ben Zhang <benzh@chromium.org>, Mark Brown <broonie@kernel.org>,
 Ross Zwisler <zwisler@chromium.org>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Fletcher Woodruff <fletcherw@chromium.org>
Subject: [alsa-devel] [PATCH v6 4/4] ASoC: rt5677: handle concurrent
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
index 86555d7ec9ea8d..7f7e60aceb49d3 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -5071,38 +5071,55 @@ static const struct rt5677_irq_desc rt5677_irq_descs[] = {
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
2.22.0.rc1.311.g5d7573a151-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
