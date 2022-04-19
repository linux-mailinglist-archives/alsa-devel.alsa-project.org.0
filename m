Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC55F506EE7
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 15:48:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3602C1A96;
	Tue, 19 Apr 2022 15:47:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3602C1A96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650376120;
	bh=B7GGzQK0KIjiwCxoEg1dXjX6/oLgtetrXN0VV1GNBGs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BMEb0263eglkeEHhsCCqA1+7dlA4r6f45FEW075KORn0gn4+KTatsiKW0rMGiHHCG
	 5p5qQWrOQ+BlK7snRteaBErUfK/d6BQpsLsz48O0pjlY2Hbca/m3WKerj579fv1c7B
	 MNI8SCZMLB3xE6sNyxfJHq2eTuLNLUDqpGrnT79U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9CD2F8057C;
	Tue, 19 Apr 2022 15:43:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AA80F80269; Tue, 19 Apr 2022 15:40:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE516F80121
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 15:40:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE516F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TOpp36+r"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 96373616C6;
 Tue, 19 Apr 2022 13:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6057C385A7;
 Tue, 19 Apr 2022 13:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375570;
 bh=B7GGzQK0KIjiwCxoEg1dXjX6/oLgtetrXN0VV1GNBGs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TOpp36+rC0pDLis7adjFpLtRxKwHifzqT8ATqBoHM3otXvUperBtVcs1FifHc5yyB
 rqLPC7rYbjq0Cf9Ys1ZbJ2P/GGpYZjaZv29gcfAMIMSQP3xSrwfLAML/qNNhmU/GVd
 gH/ywtlMj8E5lIgxWXQ0d1WKgZnNBdasQLQRmukrsvNWTS1WfVWbNuYArE2MVzLjOQ
 7HngWtMC/2cYvIPEoUHdURPi61wEmycHnijfRFxP36EiMPOyusZ0YufgRWJ+JHp9ci
 tnu1W78uOh80vxB8EvHIbeFZxxM2wIE9VFANNL583gMp6zk/BtWTAHQhAPI0pKoXd2
 RNXWpAmIMsrlg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 15/41] input: omap: void using mach/*.h headers
Date: Tue, 19 Apr 2022 15:36:57 +0200
Message-Id: <20220419133723.1394715-16-arnd@kernel.org>
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

The omap-keypad driver currently relies on including mach/memory.h
implicitly, but that won't happen once omap1 is converted to
CONFIG_ARCH_MULTIPLATFORM. Include the required header
explicitly.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/input/keyboard/omap-keypad.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/keyboard/omap-keypad.c b/drivers/input/keyboard/omap-keypad.c
index eb3a687796e7..57447d6c9007 100644
--- a/drivers/input/keyboard/omap-keypad.c
+++ b/drivers/input/keyboard/omap-keypad.c
@@ -24,6 +24,7 @@
 #include <linux/gpio.h>
 #include <linux/platform_data/gpio-omap.h>
 #include <linux/platform_data/keypad-omap.h>
+#include <linux/soc/ti/omap1-io.h>
 
 #undef NEW_BOARD_LEARNING_MODE
 
-- 
2.29.2

