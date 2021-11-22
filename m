Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BDB459DCC
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 09:22:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00F0B1671;
	Tue, 23 Nov 2021 09:22:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00F0B1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637655772;
	bh=uCJjVu9F+fHUSfn+6MrRuYhRGtKMYPrSQX0PYB661AM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rMLHbsrDIXZW/ZwlztxGSvA8hRcBN0V/e2HwM5JSfmlFo8jAWGMCKT7Ac9nGvpopi
	 rvnBXHFNyn8Itw9P9IGTPRGxV8Bj+bQOApnXzherXJV80WwLwRSAqDKnoxqU0gErvX
	 Vxbz0fIwX7R6lTuEt3jppq5utyJJpCU43EAHppp8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25740F804F3;
	Tue, 23 Nov 2021 09:21:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D63DDF80154; Mon, 22 Nov 2021 16:55:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0E9AF801F7
 for <alsa-devel@alsa-project.org>; Mon, 22 Nov 2021 16:55:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0E9AF801F7
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:e4da:38c:79e9:48bf])
 by michel.telenet-ops.be with bizsmtp
 id MTuK2600Z4yPVd606TuK7s; Mon, 22 Nov 2021 16:55:06 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mpBe6-00EL3u-UU; Mon, 22 Nov 2021 16:54:18 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mpBe5-00HH2O-V9; Mon, 22 Nov 2021 16:54:17 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
 Rajendra Nayak <rnayak@codeaurora.org>, Paul Walmsley <paul@pwsan.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Tero Kristo <kristo@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Benoit Parrot <bparrot@ti.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Ulf Hansson <ulf.hansson@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@codeaurora.org>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH/RFC 17/17] rtw89: Use bitfield helpers
Date: Mon, 22 Nov 2021 16:54:10 +0100
Message-Id: <f7b81122f7596fa004188bfae68f25a68c2d2392.1637592133.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1637592133.git.geert+renesas@glider.be>
References: <cover.1637592133.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 23 Nov 2021 09:20:57 +0100
Cc: alsa-devel@alsa-project.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-aspeed@lists.ozlabs.org, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-wireless@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, netdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
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

Use the field_{get,prep}() helpers, instead of open-coding the same
operations.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
Marked RFC, as this depends on [PATCH 01/17], but follows a different
path to upstream.
---
 drivers/net/wireless/realtek/rtw89/core.h | 38 ++++-------------------
 1 file changed, 6 insertions(+), 32 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/core.h b/drivers/net/wireless/realtek/rtw89/core.h
index c2885e4dd882f045..f9c0300ec373aaf2 100644
--- a/drivers/net/wireless/realtek/rtw89/core.h
+++ b/drivers/net/wireless/realtek/rtw89/core.h
@@ -2994,81 +2994,55 @@ rtw89_write32_clr(struct rtw89_dev *rtwdev, u32 addr, u32 bit)
 static inline u32
 rtw89_read32_mask(struct rtw89_dev *rtwdev, u32 addr, u32 mask)
 {
-	u32 shift = __ffs(mask);
-	u32 orig;
-	u32 ret;
-
-	orig = rtw89_read32(rtwdev, addr);
-	ret = (orig & mask) >> shift;
-
-	return ret;
+	return field_get(mask, rtw89_read32(rtwdev, addr));
 }
 
 static inline u16
 rtw89_read16_mask(struct rtw89_dev *rtwdev, u32 addr, u32 mask)
 {
-	u32 shift = __ffs(mask);
-	u32 orig;
-	u32 ret;
-
-	orig = rtw89_read16(rtwdev, addr);
-	ret = (orig & mask) >> shift;
-
-	return ret;
+	return field_get(mask, rtw89_read16(rtwdev, addr));
 }
 
 static inline u8
 rtw89_read8_mask(struct rtw89_dev *rtwdev, u32 addr, u32 mask)
 {
-	u32 shift = __ffs(mask);
-	u32 orig;
-	u32 ret;
-
-	orig = rtw89_read8(rtwdev, addr);
-	ret = (orig & mask) >> shift;
-
-	return ret;
+	return field_get(mask, rtw89_read8(rtwdev, addr));
 }
 
 static inline void
 rtw89_write32_mask(struct rtw89_dev *rtwdev, u32 addr, u32 mask, u32 data)
 {
-	u32 shift = __ffs(mask);
 	u32 orig;
 	u32 set;
 
 	WARN(addr & 0x3, "should be 4-byte aligned, addr = 0x%08x\n", addr);
 
 	orig = rtw89_read32(rtwdev, addr);
-	set = (orig & ~mask) | ((data << shift) & mask);
+	set = (orig & ~mask) | field_prep(mask, data);
 	rtw89_write32(rtwdev, addr, set);
 }
 
 static inline void
 rtw89_write16_mask(struct rtw89_dev *rtwdev, u32 addr, u32 mask, u16 data)
 {
-	u32 shift;
 	u16 orig, set;
 
 	mask &= 0xffff;
-	shift = __ffs(mask);
 
 	orig = rtw89_read16(rtwdev, addr);
-	set = (orig & ~mask) | ((data << shift) & mask);
+	set = (orig & ~mask) | field_prep(mask, data);
 	rtw89_write16(rtwdev, addr, set);
 }
 
 static inline void
 rtw89_write8_mask(struct rtw89_dev *rtwdev, u32 addr, u32 mask, u8 data)
 {
-	u32 shift;
 	u8 orig, set;
 
 	mask &= 0xff;
-	shift = __ffs(mask);
 
 	orig = rtw89_read8(rtwdev, addr);
-	set = (orig & ~mask) | ((data << shift) & mask);
+	set = (orig & ~mask) | field_prep(mask, data);
 	rtw89_write8(rtwdev, addr, set);
 }
 
-- 
2.25.1

