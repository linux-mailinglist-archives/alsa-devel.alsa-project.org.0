Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DD7506F03
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 15:53:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD1041B25;
	Tue, 19 Apr 2022 15:52:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD1041B25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650376419;
	bh=b8M7Htp8PC1M3UqN4COpkh3W696Svq9K1vaNWm/6ehg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=knXxV/GLrL06gPf9l9tL88X0ro94jD02lsJqwa1bCzZ2YFvIVrPiXpZsrCzt/0fhn
	 oF7RQ9O/ztpHykCWQU3YN/twiDgYozVx5E8n+8rCgLLAdt/IB4mpOdpEg34Qrrt1bm
	 A34tHXpgu7DvJPP5VSnIjYE9hp58w2OMBKI/LFF4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 387D8F805FC;
	Tue, 19 Apr 2022 15:43:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0699FF804A9; Tue, 19 Apr 2022 15:42:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FB1DF80121
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 15:42:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FB1DF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WO+hx1jv"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 85E94B8197F;
 Tue, 19 Apr 2022 13:42:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D256C385A5;
 Tue, 19 Apr 2022 13:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375722;
 bh=b8M7Htp8PC1M3UqN4COpkh3W696Svq9K1vaNWm/6ehg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WO+hx1jvcO8sNvVYXwtk9yzViyIi/AeD0vyEdyCzAJ0epFG3OGq2Fn7Q2EGQVFZtL
 lxuUOfpn5uHFQi9GsZUgd6pDtHMGP4raATiMUNW5ZDgt1Mx2Nw3Wma2I/LO2HpIx7E
 xUcwEuvzj7umr7FkY4CRlMIXjMQvfrB/eUY+gzYzcxeP8V0TSSePzn/s5Bzv+cR+NL
 E7plBnP5gpO17xOQMhGm9BvxgJ5ifb3qFbpNxGlNnaeWblY970wnie8dXu9AYsKFAH
 ZR4rCJZff8i/YehkU19EDTDNz/bmaatCQOWZ7ZUnBrKD8BeNNfnxpY761tWUDxDIY6
 FSC+791LABy0A==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 35/41] usb: host: ohci-omap: Make it CCF clk API compatible
Date: Tue, 19 Apr 2022 15:37:17 +0200
Message-Id: <20220419133723.1394715-36-arnd@kernel.org>
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

The driver, OMAP1 specific, now omits clk_prepare/unprepare() steps, not
supported by OMAP1 custom implementation of clock API.  However, non-CCF
stubs of those functions exist for use on such platforms until converted
to CCF.

Update the driver to be compatible with CCF implementation of clock API.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/usb/host/ohci-omap.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/ohci-omap.c b/drivers/usb/host/ohci-omap.c
index 069791d25abb..f5bc9c8bdc9a 100644
--- a/drivers/usb/host/ohci-omap.c
+++ b/drivers/usb/host/ohci-omap.c
@@ -259,6 +259,10 @@ static int ohci_hcd_omap_probe(struct platform_device *pdev)
 		goto err_put_hcd;
 	}
 
+	retval = clk_prepare(priv->usb_host_ck);
+	if (retval)
+		goto err_put_host_ck;
+
 	if (!cpu_is_omap15xx())
 		priv->usb_dc_ck = clk_get(&pdev->dev, "usb_dc_ck");
 	else
@@ -266,13 +270,17 @@ static int ohci_hcd_omap_probe(struct platform_device *pdev)
 
 	if (IS_ERR(priv->usb_dc_ck)) {
 		retval = PTR_ERR(priv->usb_dc_ck);
-		goto err_put_host_ck;
+		goto err_unprepare_host_ck;
 	}
 
+	retval = clk_prepare(priv->usb_dc_ck);
+	if (retval)
+		goto err_put_dc_ck;
+
 	if (!request_mem_region(hcd->rsrc_start, hcd->rsrc_len, hcd_name)) {
 		dev_dbg(&pdev->dev, "request_mem_region failed\n");
 		retval = -EBUSY;
-		goto err_put_dc_ck;
+		goto err_unprepare_dc_ck;
 	}
 
 	hcd->regs = ioremap(hcd->rsrc_start, hcd->rsrc_len);
@@ -297,8 +305,12 @@ static int ohci_hcd_omap_probe(struct platform_device *pdev)
 	iounmap(hcd->regs);
 err2:
 	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
+err_unprepare_dc_ck:
+	clk_unprepare(priv->usb_dc_ck);
 err_put_dc_ck:
 	clk_put(priv->usb_dc_ck);
+err_unprepare_host_ck:
+	clk_unprepare(priv->usb_host_ck);
 err_put_host_ck:
 	clk_put(priv->usb_host_ck);
 err_put_hcd:
@@ -333,7 +345,9 @@ static int ohci_hcd_omap_remove(struct platform_device *pdev)
 	}
 	iounmap(hcd->regs);
 	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
+	clk_unprepare(priv->usb_dc_ck);
 	clk_put(priv->usb_dc_ck);
+	clk_unprepare(priv->usb_host_ck);
 	clk_put(priv->usb_host_ck);
 	usb_put_hcd(hcd);
 	return 0;
-- 
2.29.2

