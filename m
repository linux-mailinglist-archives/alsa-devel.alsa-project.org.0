Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4C4506ED3
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 15:44:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0433F1918;
	Tue, 19 Apr 2022 15:43:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0433F1918
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650375887;
	bh=uk85dachbI2QOyzEdf35KpbxClyHjIWRAqDWzdDgdhI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YYt2k2n1LchYvOxyrgqbrgp5/Av0UlJwPQmoCQMtyS3jzCLYm2tx9A8s0MbqRQtvA
	 pfojg6LNPkllWIc6eizF0FO3W4314x1jZXkN1t//dzIEhk4PkIAHFCv42bHCiBSBuQ
	 PJUrppQIB41E3aENfL1QnTYFQSYX3BlHprFE1kiA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD2D7F804F1;
	Tue, 19 Apr 2022 15:43:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A531F8025D; Tue, 19 Apr 2022 15:37:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 666C6F80121
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 15:37:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 666C6F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mruYOH8M"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F3F53B81923;
 Tue, 19 Apr 2022 13:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D00DC385AF;
 Tue, 19 Apr 2022 13:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375466;
 bh=uk85dachbI2QOyzEdf35KpbxClyHjIWRAqDWzdDgdhI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mruYOH8ME/Vh1wQ1pMChS4oLgW9pQabgidhmksrUD2v1VpjqEkYSVaL8F5/Jx1fJt
 iWfATQhXYZ2HF/JTCtVwo5XrFWHmaEHiE6zg5UuUIOuzgkBcy0V016jiFYV+rfjvg4
 nbWIXvEBktWlCb8U/NzpxCV5jRa0vQe1kx5vmEE+PwnJ8xlKsar1yUF2Ek65ppTRI1
 gNA1cS2olATNCQ5F6ThWgt7qsMKQf7IGjg6mb0lxFK6DB8LW3fweuNrfnHKFsjWXSP
 2dckRazl0o0Sf/B+mK1VM7FPMYVZMNP94kAS5WiC3zL0qcWam2pXKjNXDyEDSaifQB
 FGhlzS9XXadRA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 01/41] video: fbdev: omapfb: lcd_ams_delta: fix unused
 variable warning
Date: Tue, 19 Apr 2022 15:36:43 +0200
Message-Id: <20220419133723.1394715-2-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419133723.1394715-1-arnd@kernel.org>
References: <20220419133723.1394715-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 19 Apr 2022 15:43:16 +0200
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

From: Arnd Bergmann <arnd@arndb.de>

A recent cleanup patch removed the only reference to a local variable
in some configurations.

Move the variable into the one block it is still used in, inside
of an #ifdef, to avoid this warning.

Fixes: 9d773f103b89 ("video: fbdev: omapfb: lcd_ams_delta: Make use of the helper function dev_err_probe()")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/video/fbdev/omap/lcd_ams_delta.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/omap/lcd_ams_delta.c b/drivers/video/fbdev/omap/lcd_ams_delta.c
index bbf871f9d862..01944ce46aa1 100644
--- a/drivers/video/fbdev/omap/lcd_ams_delta.c
+++ b/drivers/video/fbdev/omap/lcd_ams_delta.c
@@ -128,7 +128,6 @@ static struct lcd_panel ams_delta_panel = {
 static int ams_delta_panel_probe(struct platform_device *pdev)
 {
 	struct lcd_device *lcd_device = NULL;
-	int ret;
 
 	gpiod_vblen = devm_gpiod_get(&pdev->dev, "vblen", GPIOD_OUT_LOW);
 	if (IS_ERR(gpiod_vblen))
@@ -145,7 +144,7 @@ static int ams_delta_panel_probe(struct platform_device *pdev)
 						&ams_delta_lcd_ops);
 
 	if (IS_ERR(lcd_device)) {
-		ret = PTR_ERR(lcd_device);
+		int ret = PTR_ERR(lcd_device);
 		dev_err(&pdev->dev, "failed to register device\n");
 		return ret;
 	}
-- 
2.29.2

