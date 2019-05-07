Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D0C16D62
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 00:04:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 389C2180B;
	Wed,  8 May 2019 00:03:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 389C2180B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557266674;
	bh=ntGMQMSeUp7T7tSbSiwmqJVF8EzJI9rxPVSXbAqzJxo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TV/sSgSFhZWs2CL9Qo0Yq1kyVUOR0MKYopjvXyuA3qLYrDIz/u8kgHmHq0dEZkCxZ
	 Jqn+pgWg3/Qj9WvuzJWsNwt+SBrPL9DKEXng09QiGypGUKN/ybZ76THT98Wcj+SL2U
	 kIGMmDznNaAn5KZaBuOR7HyW8oDT0ATXODllg9mg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A253BF89725;
	Wed,  8 May 2019 00:01:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0488F89726; Wed,  8 May 2019 00:01:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-it1-x142.google.com (mail-it1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4EB22F89671
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 00:01:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EB22F89671
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Ur0+n8U1"
Received: by mail-it1-x142.google.com with SMTP id p18so638150itm.1
 for <alsa-devel@alsa-project.org>; Tue, 07 May 2019 15:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0y6QmCNGHLhzoejt/pdxavffrkeNyFEyZD1nqAARdlY=;
 b=Ur0+n8U1zxyYcca0cp4iDatcc90uGmWj59N95mD1hHvZ5jqmdm/qfp4xIoe1UoopXk
 4cWDRkSBJaIL9LjeknZH+MhNhyJZMFXn4224ptWmtxOuArRmVXh6G/UcuS0N16G392rN
 44aSS3bHuVQk+VB5Yh2qgQenoJg//hOd3Ce3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0y6QmCNGHLhzoejt/pdxavffrkeNyFEyZD1nqAARdlY=;
 b=QiafIWtjyHg3HWQkwYTd+B2yW5hNhzI7TUwMOgJcYVvJhudQfMuHZl6U3MR4r/jZW2
 nYI2aSjkdSPKZwzdZNBsRZpwsU7JNWjyw8qetj+Rbf7LWZvD5Jl1Gqb5XS8hySBvP1iO
 LIRA3afO4YEBEI8wV7iOu9wPFhBO1SpXopsc/LyOLDSsvxssr53HSWC8EGI5h9kllUBx
 B8n/521JPKVguY74NSJ1rKXjvrk541NxUHTvka083lvuXHHo2JZtD+6aPMnNYhl9zbrH
 Qd8A9XZfH38CnmoBR5CvaD8Aapy5fkdsOq3rKiLKHRfG0klghG1LGdpZ8jherkYRcmni
 RvQQ==
X-Gm-Message-State: APjAAAUxvM02DztOBt8MIUiZ6vuW8zYDwmQAHAsasaMf/S2oW0Q3NIvO
 iSkFs0/FeuocExecP+1Y5rQNZg==
X-Google-Smtp-Source: APXvYqy0KcRoECeXNNuHv8xBdEoqlb0zpbHlHRTAogQJywYQ9/nSwf9tNTgkk7eWz2m8DsPHWacLSQ==
X-Received: by 2002:a24:a946:: with SMTP id x6mr623969iti.136.1557266498735;
 Tue, 07 May 2019 15:01:38 -0700 (PDT)
Received: from localhost ([2620:15c:183:200:33ce:f5cf:f863:d3a6])
 by smtp.gmail.com with ESMTPSA id f129sm170255itf.4.2019.05.07.15.01.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 May 2019 15:01:38 -0700 (PDT)
From: Fletcher Woodruff <fletcherw@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Tue,  7 May 2019 16:01:14 -0600
Message-Id: <20190507220115.90395-3-fletcherw@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190507220115.90395-1-fletcherw@chromium.org>
References: <20190507220115.90395-1-fletcherw@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ben Zhang <benzh@chromium.org>, Mark Brown <broonie@kernel.org>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Fletcher Woodruff <fletcherw@chromium.org>
Subject: [alsa-devel] [PATCH v5 2/3] ASoC: rt5677: handle concurrent
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
 sound/soc/codecs/rt5677.c | 84 +++++++++++++++++++++++----------------
 1 file changed, 50 insertions(+), 34 deletions(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 7d2039f3f67e75..091ef3e78fe3d2 100644
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
