Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF5A506EE3
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 15:47:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72D741A9E;
	Tue, 19 Apr 2022 15:47:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72D741A9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650376074;
	bh=f9Y/96hrDNAN/+YDT6y/IETuuHURcMDkd3mR04iG5MY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UV8a/DSCHTJgj0zMKb2h/wj/OnUL52eMGSAqKIymiPo5f0d42tk3/fYTuMyQKjS/v
	 zC7GE4aLXTxNJob4ispYkPEtoptPCgN2m6nATDs3w5FtRouXwRSNfQnJEkqSAsivUB
	 aHuZyK75ibEgJUgEPV5nzc/KivsHqaMAFtOocKAk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F228FF80563;
	Tue, 19 Apr 2022 15:43:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7267EF8025D; Tue, 19 Apr 2022 15:39:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1ABF5F80116
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 15:39:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1ABF5F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ebr5utca"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9C180B81986;
 Tue, 19 Apr 2022 13:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A81EFC385AC;
 Tue, 19 Apr 2022 13:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375556;
 bh=f9Y/96hrDNAN/+YDT6y/IETuuHURcMDkd3mR04iG5MY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ebr5utca6XgjB3tSpUqlgAxa1J/VO+5Up3W225Ck2Y1KV0kHl25WxqiLaxQnTrrDP
 o4ZMRT5uiqJlbasFReJEEjIucMAj0DIkjrh7yNwei7KTqUAxhrCrbIU9vS1MWfztjT
 pnZZDXwYX8Bp58oIwWuMxVkm3t1lAwr40PquGM25WMYWoQU4zuhNhfylYnCyYIm7KS
 AxbhGnhgw8s8/7Sp0BNcsDkI0IMc9J8IbULGpS4rd/U42TIh6dRRUrDsawrsOWc7ZZ
 Lnc4CsAY2Xr00xDadJHWFy5+sqJIjPU+QvQwa5Q0tAKRS7Lo54LfD5qNiWFtBeJuUY
 ATdlp/KQHWVdA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 13/41] clocksource: ti-dmtimer: avoid using mach/hardware.h
Date: Tue, 19 Apr 2022 15:36:55 +0200
Message-Id: <20220419133723.1394715-14-arnd@kernel.org>
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
 Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
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

As a preparation for future omap1 multiplatform support, stop
using mach/hardware.h and instead include the omap1-io.h
for low-level register access to MOD_CONF_CTRL_1.

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clocksource/timer-ti-dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-ti-dm.c b/drivers/clocksource/timer-ti-dm.c
index 3e52c5226c4d..df4a73ea6651 100644
--- a/drivers/clocksource/timer-ti-dm.c
+++ b/drivers/clocksource/timer-ti-dm.c
@@ -433,7 +433,7 @@ int omap_dm_timer_get_irq(struct omap_dm_timer *timer)
 }
 
 #if defined(CONFIG_ARCH_OMAP1)
-#include <mach/hardware.h>
+#include <linux/soc/ti/omap1-io.h>
 
 static struct clk *omap_dm_timer_get_fclk(struct omap_dm_timer *timer)
 {
-- 
2.29.2

