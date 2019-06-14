Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7877D467D7
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2019 20:48:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3A1918A0;
	Fri, 14 Jun 2019 20:47:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3A1918A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560538088;
	bh=VMukmRdgU6+x0wfeTdEhip5Mq32Q+K7tgeoD7S6eVGw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MR1RF1/tE5RwI8O+SX3d6wSbWenZADayot6VcADJuUVHfAGXvktktv13L0kVujZ2A
	 0Q3rPl+RMhnl6CE/HyrmRPouH+3ZnljciYLbA7SEqol9oJKOwKp4tXxXMFSVzcSx9t
	 LB81qKnW18ITcGk3HYLc8aT5xptRL8XLk/eT2iNk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8072F89749;
	Fri, 14 Jun 2019 20:44:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9762CF89736; Fri, 14 Jun 2019 20:43:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0153F896E3
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 20:43:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0153F896E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="UGaMm1iU"
Received: by mail-io1-xd44.google.com with SMTP id k20so7867365ios.10
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 11:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NcPWD2owkf1HweY/dIY4noKl+ZyW2mZPzhEBgvasKUc=;
 b=UGaMm1iUAB4mUuqs1e4dbPz6CJBwDUR4zGk0Trc7KQuRwM5qfZf+hbNVUaRLDcpAhD
 YU46h9lS/Cmp89w5WWliKp4LIbcMUkfPu8NPVQ1F5F3EYefUwpXXw7UNI6ZKwvx3R7qe
 +7nIBfSREak7YtyyZMhXZMY6VamTElAjZYUuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NcPWD2owkf1HweY/dIY4noKl+ZyW2mZPzhEBgvasKUc=;
 b=dvvdroieB6sD7ksXqqACkhfdRt3olvbO+lerJ5p9/tjs9Z7nWimkoO0Ynh/0UqtC86
 1pKwz0UVc8i+RsY0eJzEDyoqlzUpHlHSBMZ993LWxmEvJVAkIx+Uz1GWTlUNpIcaKEKe
 DKEHQcld1ntquOxFoUVww30U/JuaTMXdQA1gcaXihuCC/KvXM3mHcx4IY441kxy2992f
 Fzl2r6+qGxLYJmxbWdIckL7OLLSTjDpddYWTtnrhrFOu+IJiJz2ZglE+eP5xVjajiBU5
 rYLgYVyCDS7repMP3XJURloA9B7NBWw7+EGRdyLyU131jfQ7ilsDr0Ooz1Nzs+ziVygK
 FJsw==
X-Gm-Message-State: APjAAAXpZbQ3qLeJn0d1WyhAPwGwhCKVgLkygr20vfjYl7NmAkGCjWSW
 OXBdUfmHRQxX/n3l5Ab0p2JQpg==
X-Google-Smtp-Source: APXvYqw4wZRxVZfzLkQbgyI4z/eUWgC5CfHW5OZWk8351Qq9bwf6z8TFzFTJy5ngkjU/X1i9tWCmKg==
X-Received: by 2002:a02:bb05:: with SMTP id y5mr65333545jan.93.1560537826328; 
 Fri, 14 Jun 2019 11:43:46 -0700 (PDT)
Received: from localhost ([2620:15c:183:200:33ce:f5cf:f863:d3a6])
 by smtp.gmail.com with ESMTPSA id c2sm2446577iok.53.2019.06.14.11.43.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 11:43:45 -0700 (PDT)
From: Fletcher Woodruff <fletcherw@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Fri, 14 Jun 2019 12:43:15 -0600
Message-Id: <20190614184315.252945-5-fletcherw@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190614184315.252945-1-fletcherw@chromium.org>
References: <20190614184315.252945-1-fletcherw@chromium.org>
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
index a136ed0d82e36b..44d51b350b8860 100644
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
2.22.0.410.gd8fdbe21b5-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
