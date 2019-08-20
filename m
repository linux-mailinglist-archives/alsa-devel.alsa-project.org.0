Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F9A967DF
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 19:43:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E94B1671;
	Tue, 20 Aug 2019 19:42:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E94B1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566323010;
	bh=c7BHn+53xRfJEungPLBerX/CH+wYpT0ClycaYEPoyuQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=TJit7QnPVNM0nWves6BuOEmYhxAdZA4dOkkaJfSRmD6XTBBhRTK2vfDmNexafMGw8
	 oHabT1YZ/7fLxIj83LAnUrSuSpvp7TuaYuHFsujCEdsU5d4tYvKQg6tWs1Z4XQYcMm
	 ELeCTUmFbvFXN+SnJH3elWu8lx9VNzpMVFbGeLx0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CCE8F80633;
	Tue, 20 Aug 2019 19:41:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38A55F805FB; Tue, 20 Aug 2019 19:41:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-f99.google.com (mail-ed1-f99.google.com
 [209.85.208.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61697F8036D
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 19:41:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61697F8036D
Received: by mail-ed1-f99.google.com with SMTP id m44so7272258edd.9
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 10:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=tZ1DiiOuBDIZzhX5DI1K9yRxUbP4c3jFKWVGax/+oTo=;
 b=DRU1zpGHqEtA/+OD8ZmaHPfzhzlMUT8j5La0VmflhWdwGO7tro1x7QUhN6zhxXDEeI
 Nl0xY9rfkRUF7ABt2wRhk11WqXlEwXg3MCN4pKKHRtk88g/qQSTYB4fb2qoOHv8b8WMc
 4pksT1qyWWc0ZPSs/aakuzfTh0HNZjracU29pCBcRmK4RJsH7IqqD15G3y9LP4zQAQ1E
 MKuaR1PdiKdSafzVwI3BuuefTjGe+Y/VAMblzPKD6ZCxyI4xyl4RyVc+emlfl+BCNjAu
 jF03QVvgC31PrLM3C/+/lcvsFiNVsqJZRHCrp6RZCGVhSEL1mxwOrtLtFBjQ0c+E0LdC
 wG4Q==
X-Gm-Message-State: APjAAAUewAYhuDyTySuhIwN/LZ/uWcpyZxRKb8q1u/a3Ey2uiZZqQHfk
 M+o2uB+/xCuW7V7M+zRlGTNpoYPABydChLyna5zlOGy87zdgSRMCQDslN28ii+Ir1A==
X-Google-Smtp-Source: APXvYqxVYvjEkq1/WSs8U8kEZNNOw7hDX+wh+QkVqHWzvLXv7WNIzxVWanjlBkaNjXmBxHv7sdku2GIhZpZV
X-Received: by 2002:a50:d0c2:: with SMTP id g2mr32456105edf.251.1566322864514; 
 Tue, 20 Aug 2019 10:41:04 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id c21sm343874edx.37.2019.08.20.10.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 10:41:04 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i0880-00032D-0B; Tue, 20 Aug 2019 17:41:04 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 5B7A3274314C; Tue, 20 Aug 2019 18:41:03 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
In-Reply-To: <20190820162411.24836-3-codrin.ciubotariu@microchip.com>
X-Patchwork-Hint: ignore
Message-Id: <20190820174103.5B7A3274314C@ypsilon.sirena.org.uk>
Date: Tue, 20 Aug 2019 18:41:03 +0100 (BST)
Cc: alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 ludovic.desroches@microchip.com, Mark Brown <broonie@kernel.org>,
 tiwai@suse.com, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: mchp-i2s-mcc: Wait for RX/TX RDY only
	if controller is running" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: mchp-i2s-mcc: Wait for RX/TX RDY only if controller is running

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 0f6fc97501b790c971b11b52a654009d21c45238 Mon Sep 17 00:00:00 2001
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Date: Tue, 20 Aug 2019 19:24:10 +0300
Subject: [PATCH] ASoC: mchp-i2s-mcc: Wait for RX/TX RDY only if controller is
 running

Since hw_free() can be called multiple times and not just after a stop
trigger command, we should check whether the RX or TX ready interrupt was
truly enabled previously. For this, we assure that the condition of the
wait event is always true, except when RX/TX interrupts are enabled.

Fixes: 7e0cdf545a55 ("ASoC: mchp-i2s-mcc: add driver for I2SC Multi-Channel Controller")
Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Link: https://lore.kernel.org/r/20190820162411.24836-3-codrin.ciubotariu@microchip.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/atmel/mchp-i2s-mcc.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/sound/soc/atmel/mchp-i2s-mcc.c b/sound/soc/atmel/mchp-i2s-mcc.c
index 319f975586f1..ab7d5f98e759 100644
--- a/sound/soc/atmel/mchp-i2s-mcc.c
+++ b/sound/soc/atmel/mchp-i2s-mcc.c
@@ -691,22 +691,24 @@ static int mchp_i2s_mcc_hw_free(struct snd_pcm_substream *substream,
 		err = wait_event_interruptible_timeout(dev->wq_txrdy,
 						       dev->tx_rdy,
 						       msecs_to_jiffies(500));
+		if (err == 0) {
+			dev_warn_once(dev->dev,
+				      "Timeout waiting for Tx ready\n");
+			regmap_write(dev->regmap, MCHP_I2SMCC_IDRA,
+				     MCHP_I2SMCC_INT_TXRDY_MASK(dev->channels));
+			dev->tx_rdy = 1;
+		}
 	} else {
 		err = wait_event_interruptible_timeout(dev->wq_rxrdy,
 						       dev->rx_rdy,
 						       msecs_to_jiffies(500));
-	}
-
-	if (err == 0) {
-		u32 idra;
-
-		dev_warn_once(dev->dev, "Timeout waiting for %s\n",
-			      is_playback ? "Tx ready" : "Rx ready");
-		if (is_playback)
-			idra = MCHP_I2SMCC_INT_TXRDY_MASK(dev->channels);
-		else
-			idra = MCHP_I2SMCC_INT_RXRDY_MASK(dev->channels);
-		regmap_write(dev->regmap, MCHP_I2SMCC_IDRA, idra);
+		if (err == 0) {
+			dev_warn_once(dev->dev,
+				      "Timeout waiting for Rx ready\n");
+			regmap_write(dev->regmap, MCHP_I2SMCC_IDRA,
+				     MCHP_I2SMCC_INT_RXRDY_MASK(dev->channels));
+			dev->rx_rdy = 1;
+		}
 	}
 
 	if (!mchp_i2s_mcc_is_running(dev)) {
@@ -818,6 +820,8 @@ static int mchp_i2s_mcc_dai_probe(struct snd_soc_dai *dai)
 
 	init_waitqueue_head(&dev->wq_txrdy);
 	init_waitqueue_head(&dev->wq_rxrdy);
+	dev->tx_rdy = 1;
+	dev->rx_rdy = 1;
 
 	snd_soc_dai_init_dma_data(dai, &dev->playback, &dev->capture);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
