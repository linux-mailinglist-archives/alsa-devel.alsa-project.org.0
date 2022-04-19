Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80019506F1B
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 15:54:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 117001B4E;
	Tue, 19 Apr 2022 15:53:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 117001B4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650376467;
	bh=ICLjpcLGmyRuFirMful6PPWmOkZPtiGZzfFqAVH/t+Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nRNGZdXQxaZtA5r/mdURhwz5ZrfSK/KWP3gwuKp82q1D0GmOy2nyDMUu11JX0smEn
	 cUxUUhv9LVUL3mtcz6iR2T6UWal8RsOPHuj4cr5mE7JyL13Tz/MmnitSIu3yI31sjS
	 HzCoR14PZdQkgXkFIrmO9Ha1m1y0KhNrwsjbEnjA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B464F8060B;
	Tue, 19 Apr 2022 15:43:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A488F80269; Tue, 19 Apr 2022 15:42:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97B08F80116
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 15:42:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97B08F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hvhVwA0N"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6D7E261708;
 Tue, 19 Apr 2022 13:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E3AC385B2;
 Tue, 19 Apr 2022 13:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375736;
 bh=ICLjpcLGmyRuFirMful6PPWmOkZPtiGZzfFqAVH/t+Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hvhVwA0NzLazBIGSe0oT0p3Um3CHpAVWQS3Ak93wRIZbI7fSuj4m8N5nOBDcUeqPR
 gg6oecruNrCF+lKyJ22gDsDgeD4f58TkcrVcOJhpEfQKq0l9fXJUZDysrlPaAYrYdy
 HM2+bS3l9baDro+/uv1y7gBVl8ayYnO98JhJ4qhRzGc7g0eh0bUu4K1jPLqmuVD72I
 Tta1ve3oS40cpTyjsSDol1Hce510U2JEw+ghqj9X7GZYYmv/pk7FjMOMYyKc88H2iq
 raBSAsmMH65yZss3CrvJXSegF1I1GYazdtvupzXRVR7szoVBxpQBB73wWmN7W1YYGv
 JDzzUYpxD+HAw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 37/41] [MERGED] video: fbdev: omap: Make it CCF clk API
 compatible
Date: Tue, 19 Apr 2022 15:37:19 +0200
Message-Id: <20220419133723.1394715-38-arnd@kernel.org>
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

OMAP1 LCDC drivers now omit clk_prepare/unprepare() steps, not supported
by OMAP1 custom implementation of clock API.  However, non-CCF stubs of
those functions exist for use on such platforms until converted to CCF.

Update the drivers to be compatible with CCF implementation of clock API.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/video/fbdev/omap/hwa742.c | 6 +++---
 drivers/video/fbdev/omap/lcdc.c   | 6 +++---
 drivers/video/fbdev/omap/sossi.c  | 5 +++--
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/video/fbdev/omap/hwa742.c b/drivers/video/fbdev/omap/hwa742.c
index b191bef22d98..9d9fe5c3a7a1 100644
--- a/drivers/video/fbdev/omap/hwa742.c
+++ b/drivers/video/fbdev/omap/hwa742.c
@@ -964,7 +964,7 @@ static int hwa742_init(struct omapfb_device *fbdev, int ext_mode,
 	if ((r = calc_extif_timings(ext_clk, &extif_mem_div)) < 0)
 		goto err3;
 	hwa742.extif->set_timings(&hwa742.reg_timings);
-	clk_enable(hwa742.sys_ck);
+	clk_prepare_enable(hwa742.sys_ck);
 
 	calc_hwa742_clk_rates(ext_clk, &sys_clk, &pix_clk);
 	if ((r = calc_extif_timings(sys_clk, &extif_mem_div)) < 0)
@@ -1023,7 +1023,7 @@ static int hwa742_init(struct omapfb_device *fbdev, int ext_mode,
 
 	return 0;
 err4:
-	clk_disable(hwa742.sys_ck);
+	clk_disable_unprepare(hwa742.sys_ck);
 err3:
 	hwa742.extif->cleanup();
 err2:
@@ -1037,7 +1037,7 @@ static void hwa742_cleanup(void)
 	hwa742_set_update_mode(OMAPFB_UPDATE_DISABLED);
 	hwa742.extif->cleanup();
 	hwa742.int_ctrl->cleanup();
-	clk_disable(hwa742.sys_ck);
+	clk_disable_unprepare(hwa742.sys_ck);
 }
 
 struct lcd_ctrl hwa742_ctrl = {
diff --git a/drivers/video/fbdev/omap/lcdc.c b/drivers/video/fbdev/omap/lcdc.c
index 4c9091bd936d..e7ce783e5215 100644
--- a/drivers/video/fbdev/omap/lcdc.c
+++ b/drivers/video/fbdev/omap/lcdc.c
@@ -713,7 +713,7 @@ static int omap_lcdc_init(struct omapfb_device *fbdev, int ext_mode,
 		dev_err(fbdev->dev, "failed to adjust LCD rate\n");
 		goto fail1;
 	}
-	clk_enable(lcdc.lcd_ck);
+	clk_prepare_enable(lcdc.lcd_ck);
 
 	r = request_irq(fbdev->int_irq, lcdc_irq_handler, 0, MODULE_NAME, fbdev);
 	if (r) {
@@ -748,7 +748,7 @@ static int omap_lcdc_init(struct omapfb_device *fbdev, int ext_mode,
 fail3:
 	free_irq(fbdev->int_irq, lcdc.fbdev);
 fail2:
-	clk_disable(lcdc.lcd_ck);
+	clk_disable_unprepare(lcdc.lcd_ck);
 fail1:
 	clk_put(lcdc.lcd_ck);
 fail0:
@@ -762,7 +762,7 @@ static void omap_lcdc_cleanup(void)
 	free_fbmem();
 	omap_free_lcd_dma();
 	free_irq(lcdc.fbdev->int_irq, lcdc.fbdev);
-	clk_disable(lcdc.lcd_ck);
+	clk_disable_unprepare(lcdc.lcd_ck);
 	clk_put(lcdc.lcd_ck);
 }
 
diff --git a/drivers/video/fbdev/omap/sossi.c b/drivers/video/fbdev/omap/sossi.c
index 6b99d89fbe6e..c90eb8ca58af 100644
--- a/drivers/video/fbdev/omap/sossi.c
+++ b/drivers/video/fbdev/omap/sossi.c
@@ -600,7 +600,7 @@ static int sossi_init(struct omapfb_device *fbdev)
 	l &= ~CONF_SOSSI_RESET_R;
 	omap_writel(l, MOD_CONF_CTRL_1);
 
-	clk_enable(sossi.fck);
+	clk_prepare_enable(sossi.fck);
 	l = omap_readl(ARM_IDLECT2);
 	l &= ~(1 << 8);			/* DMACK_REQ */
 	omap_writel(l, ARM_IDLECT2);
@@ -651,7 +651,7 @@ static int sossi_init(struct omapfb_device *fbdev)
 	return 0;
 
 err:
-	clk_disable(sossi.fck);
+	clk_disable_unprepare(sossi.fck);
 	clk_put(sossi.fck);
 	return r;
 }
@@ -659,6 +659,7 @@ static int sossi_init(struct omapfb_device *fbdev)
 static void sossi_cleanup(void)
 {
 	omap_lcdc_free_dma_callback();
+	clk_unprepare(sossi.fck);
 	clk_put(sossi.fck);
 	iounmap(sossi.base);
 }
-- 
2.29.2

