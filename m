Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A26F6506ED8
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 15:45:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 377961A28;
	Tue, 19 Apr 2022 15:45:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 377961A28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650375959;
	bh=MZYlA7Z/cfhwWB+m0aX3wfxPDdGSvAoxapWbog01ZUk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WhH3WQjHyB1aW2fq7tSp6lIazhcfbzKTPB6+hWzWT6rC1oFZ+gqIJs/d51L79IVH/
	 JLXcxPcMalMzuCokrACBa22Qtt6jwQ3H1lTbGkBURUmX8jCjMAg6BCqNgeoubhlqRs
	 y9kAzhL/f6SsDMfE9QEScUaH9qSoVRiA+AcuIjeE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C92BDF8052F;
	Tue, 19 Apr 2022 15:43:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8986EF8025D; Tue, 19 Apr 2022 15:38:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3A76F80116
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 15:38:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3A76F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MdZyrL2K"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9631F616A1;
 Tue, 19 Apr 2022 13:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90F89C385A5;
 Tue, 19 Apr 2022 13:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375488;
 bh=MZYlA7Z/cfhwWB+m0aX3wfxPDdGSvAoxapWbog01ZUk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MdZyrL2KRzGofp4P5QTIbBmZ0XyiPDEb8w8y28sLj+tarhQKLn07vB63wnc/YADun
 PU7PvbaS3DDxQTwk4r5YG2+bHNT4S4FLmZ/oPTK7Gd5u14hl/54byIoriPsb1/0/j9
 B7tlavvL9imuJwBR+QRCpa1TkY5grKm440xc2QgNCXswxLctzeCsUmzlGTTgKIm64y
 deeYlDPZvYme04F6wXyybloglv6pE3/opuw9/Y/kzutWgv3lWUPl2TFn1k/LeqS+T+
 pc0fhu1DxU6BEdl20vjgvKKR5517wr05DaOEJuhu+i3bk7HLcp24nnQYomoQZOSYSL
 c+2Hz7W+Q/R+g==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 04/41] ARM: omap1: declare a dummy omap_set_dma_priority
Date: Tue, 19 Apr 2022 15:36:46 +0200
Message-Id: <20220419133723.1394715-5-arnd@kernel.org>
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
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, Felipe Balbi <balbi@kernel.org>,
 Paul Walmsley <paul@pwsan.com>, Jingoo Han <jingoohan1@gmail.com>,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org, alsa-devel@alsa-project.org
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

omapfb calls directly into the omap_set_dma_priority() function in
the DMA driver. This prevents compile-testing omapfb on other
architectures. Add an inline function next to the other ones
for non-omap configurations.

Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/omap-dma.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/omap-dma.h b/include/linux/omap-dma.h
index 441f5f0919c6..5e228428fda1 100644
--- a/include/linux/omap-dma.h
+++ b/include/linux/omap-dma.h
@@ -338,6 +338,9 @@ static inline int omap_lcd_dma_running(void)
 #endif
 
 #else /* CONFIG_ARCH_OMAP */
+static inline void omap_set_dma_priority(int lch, int dst_port, int priority)
+{
+}
 
 static inline struct omap_system_dma_plat_info *omap_get_plat_info(void)
 {
-- 
2.29.2

