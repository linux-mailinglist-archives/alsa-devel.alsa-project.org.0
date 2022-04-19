Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 023DE506F4C
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 15:54:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 740041B52;
	Tue, 19 Apr 2022 15:53:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 740041B52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650376483;
	bh=W3qNGAAX2ECL+9vJh3xisWUOh4fEYqZMZtajKR6sclM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SAlrNHmLnOdIzfLAzsb8LX3+NojTmspW5BZE9XMLg8xx5U5F5OlazUcPO2xHsy19V
	 3cRkPVFj0IeT/mF1R5jvKCubL/n0b2pq1IRrcIIk3x0qx9ZIiqmRUYl4gHMzn5FnOM
	 w6JL45qYKaPLOkkou5i5MplYcUD+nlWYqB8etdJM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4815F8060F;
	Tue, 19 Apr 2022 15:43:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15CFCF8025D; Tue, 19 Apr 2022 15:42:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74FE0F80116
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 15:42:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74FE0F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SKr7WyMG"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9B38B61710;
 Tue, 19 Apr 2022 13:42:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C17C385B1;
 Tue, 19 Apr 2022 13:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375744;
 bh=W3qNGAAX2ECL+9vJh3xisWUOh4fEYqZMZtajKR6sclM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SKr7WyMGRCWl7v/bvtIsgn5/V3JSlMflq4Q/DrYtsnDWWlhOP2f/QZz/mAStrQbfv
 OSwRVbecQTirW0bkg8ct8ZX3ZvidG0fdpIIrdb2ikG6e1iNCk3oIpODN2KEsBn4jaL
 iL1TEBzQNkc83ablhzvNcTWLRxSQzhIsMUM2UfvRw82yolwxFIjf4Y+jmK8MZi28dA
 ifEP8JGP4wd2T+YWPd4y4nvn8O71HicpNzx1mj7AHN8SDPpjQNwTaZ+3S7klD2C0Uk
 BJ3IJCwHBlprKwQ/njIgRCNqvECW/GFDYnEeMMMA/9HeNtfHcZKV7YKlqEhQpUs3u3
 p4wr3YRVJnM7w==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 38/41] [MERGED] mmc: omap: Make it CCF clk API compatible
Date: Tue, 19 Apr 2022 15:37:20 +0200
Message-Id: <20220419133723.1394715-39-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419133723.1394715-1-arnd@kernel.org>
References: <20220419133723.1394715-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 19 Apr 2022 15:43:17 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Kevin Hilman <khilman@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alan Stern <stern@rowland.harvard.edu>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Felipe Balbi <balbi@kernel.org>, Paul Walmsley <paul@pwsan.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
 alsa-devel@alsa-project.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Janusz Krzysztofik <jmkrzyszt@gmail.com>

The driver, OMAP specific, now omits clk_prepare/unprepare() steps, not
supported by OMAP custom implementation of clock API.  However, non-CCF
stubs of those functions exist for use on such platforms until converted
to CCF.

Update the driver to be compatible with CCF implementation of clock API.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mmc/host/omap.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/mmc/host/omap.c b/drivers/mmc/host/omap.c
index 5e5af34090f1..57d39283924d 100644
--- a/drivers/mmc/host/omap.c
+++ b/drivers/mmc/host/omap.c
@@ -1374,7 +1374,7 @@ static int mmc_omap_probe(struct platform_device *pdev)
 	host->iclk = clk_get(&pdev->dev, "ick");
 	if (IS_ERR(host->iclk))
 		return PTR_ERR(host->iclk);
-	clk_enable(host->iclk);
+	clk_prepare_enable(host->iclk);
 
 	host->fclk = clk_get(&pdev->dev, "fck");
 	if (IS_ERR(host->fclk)) {
@@ -1382,16 +1382,18 @@ static int mmc_omap_probe(struct platform_device *pdev)
 		goto err_free_iclk;
 	}
 
+	ret = clk_prepare(host->fclk);
+	if (ret)
+		goto err_put_fclk;
+
 	host->dma_tx_burst = -1;
 	host->dma_rx_burst = -1;
 
 	host->dma_tx = dma_request_chan(&pdev->dev, "tx");
 	if (IS_ERR(host->dma_tx)) {
 		ret = PTR_ERR(host->dma_tx);
-		if (ret == -EPROBE_DEFER) {
-			clk_put(host->fclk);
-			goto err_free_iclk;
-		}
+		if (ret == -EPROBE_DEFER)
+			goto err_free_fclk;
 
 		host->dma_tx = NULL;
 		dev_warn(host->dev, "TX DMA channel request failed\n");
@@ -1403,8 +1405,7 @@ static int mmc_omap_probe(struct platform_device *pdev)
 		if (ret == -EPROBE_DEFER) {
 			if (host->dma_tx)
 				dma_release_channel(host->dma_tx);
-			clk_put(host->fclk);
-			goto err_free_iclk;
+			goto err_free_fclk;
 		}
 
 		host->dma_rx = NULL;
@@ -1454,9 +1455,12 @@ static int mmc_omap_probe(struct platform_device *pdev)
 		dma_release_channel(host->dma_tx);
 	if (host->dma_rx)
 		dma_release_channel(host->dma_rx);
+err_free_fclk:
+	clk_unprepare(host->fclk);
+err_put_fclk:
 	clk_put(host->fclk);
 err_free_iclk:
-	clk_disable(host->iclk);
+	clk_disable_unprepare(host->iclk);
 	clk_put(host->iclk);
 	return ret;
 }
@@ -1476,8 +1480,9 @@ static int mmc_omap_remove(struct platform_device *pdev)
 
 	mmc_omap_fclk_enable(host, 0);
 	free_irq(host->irq, host);
+	clk_unprepare(host->fclk);
 	clk_put(host->fclk);
-	clk_disable(host->iclk);
+	clk_disable_unprepare(host->iclk);
 	clk_put(host->iclk);
 
 	if (host->dma_tx)
-- 
2.29.2

