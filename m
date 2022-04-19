Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA2C50B8DB
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:43:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2A781676;
	Fri, 22 Apr 2022 15:42:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2A781676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650634983;
	bh=+H1+foy7TUNvzKw9IPZ9qQkuYfuC23E40xmiZHmyw8Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gV/oqWrmgclgXd3BjQZUtd/0dUU5Iw972MwQhZ4WEvF9LfzPyPDl2sjrQf7CCJpVd
	 agPpfoqDPKOLiYe7/T36MSU5UfM+O+MC7kaF+XCMh1qGNl7cA8s9n5ceO6+djErc7R
	 o/nTm0KKW4o20BBa2Qwk0kkm2mq2McNriJC+cMV8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBEB1F80619;
	Fri, 22 Apr 2022 15:32:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B363AF80269; Tue, 19 Apr 2022 18:42:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79C4DF80121
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 18:42:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79C4DF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bgydP6yE"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 21AC3B81AC8;
 Tue, 19 Apr 2022 16:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C2B5C385AB;
 Tue, 19 Apr 2022 16:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386535;
 bh=+H1+foy7TUNvzKw9IPZ9qQkuYfuC23E40xmiZHmyw8Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bgydP6yEicIIy/M8QwJCJbhglFA8foOzULMKyltFmXik239VsGUTgzFUAL5wLF9vR
 yMxOF9N17d8Gm13CkVHGOLvN9CkP3A9XaFnJ0xREaPP+arGnEFt4ixw3igMl35EqXV
 yxBPns0uK7j+Cic3VAPSr0NWnY/Kss2HLt0dOUCUdopKPuayIfSMRO8b8Yj/pflE6d
 OgZPFC3CPPvEmh9bxKnVBRiwj34m6rBrBxkiq/Ht4gtHbcdwAztw59OZASONXWI66Q
 OniZDp9F3QNfXA1+UztViTDb9rtV9YEMtE7mjC9f5RB2LhtOcy2aBCYHme+bCs4eAF
 KcmwBn+/vfrjA==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 26/48] input: touchscreen: mainstone: fix pxa2xx+pxa3xx
 configuration
Date: Tue, 19 Apr 2022 18:37:48 +0200
Message-Id: <20220419163810.2118169-27-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 22 Apr 2022 15:31:41 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 Philipp Zabel <philipp.zabel@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Sergey Lapin <slapin@ossfans.org>,
 linux-fbdev@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, Tomas Cech <sleep_walker@suse.com>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Marek Vasut <marek.vasut@gmail.com>, Paul Parsons <lost.distance@yahoo.com>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, linux-input@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-mips@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 alsa-devel@alsa-project.org, Daniel Mack <daniel@zonque.org>
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

There are two different ways of flushing the ac97 queue
in this driver, selected by a compile time option.

Change this to a runtime selection to make it work when both
are enabled.

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linux-input@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/input/touchscreen/mainstone-wm97xx.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/input/touchscreen/mainstone-wm97xx.c b/drivers/input/touchscreen/mainstone-wm97xx.c
index 87655105ef3a..618c80847d9f 100644
--- a/drivers/input/touchscreen/mainstone-wm97xx.c
+++ b/drivers/input/touchscreen/mainstone-wm97xx.c
@@ -98,25 +98,20 @@ MODULE_PARM_DESC(ac97_touch_slot, "Touch screen data slot AC97 number");
 
 
 /* flush AC97 slot 5 FIFO on pxa machines */
-#ifdef CONFIG_PXA27x
-static void wm97xx_acc_pen_up(struct wm97xx *wm)
-{
-	schedule_timeout_uninterruptible(1);
-
-	while (MISR & (1 << 2))
-		MODR;
-}
-#else
 static void wm97xx_acc_pen_up(struct wm97xx *wm)
 {
 	unsigned int count;
 
 	schedule_timeout_uninterruptible(1);
 
-	for (count = 0; count < 16; count++)
-		MODR;
+	if (cpu_is_pxa27x()) {
+		while (MISR & (1 << 2))
+			MODR;
+	} else if (cpu_is_pxa3xx()) {
+		for (count = 0; count < 16; count++)
+			MODR;
+	}
 }
-#endif
 
 static int wm97xx_acc_pen_down(struct wm97xx *wm)
 {
-- 
2.29.2

