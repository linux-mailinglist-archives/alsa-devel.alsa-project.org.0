Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5622459DCA
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 09:22:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44785166A;
	Tue, 23 Nov 2021 09:21:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44785166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637655764;
	bh=Nu3BwnZpHKLuUm9f/lelXfjVWJgrvHija2l5CQxQHOQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iIS6a68AY9+pbapE8JyHK7MjE1AJYNJ1CCcNvTVy1aXg2uDOeyx09mpRPTJ3En/vh
	 yGkNNYm2kHpQJ7VjQpt0+6QgPste8u2cZl4Vdq3TNMwg0sqGCKpBzwkwiPDCBBE5Ja
	 h4i9y13lJe+I5QTVKf13jzBhEiFAuWxk6hQp8vJE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89462F804F1;
	Tue, 23 Nov 2021 09:21:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C7A3F80245; Mon, 22 Nov 2021 16:55:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BBCEF80154
 for <alsa-devel@alsa-project.org>; Mon, 22 Nov 2021 16:55:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BBCEF80154
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:e4da:38c:79e9:48bf])
 by laurent.telenet-ops.be with bizsmtp
 id MTuK2600N4yPVd601TuKeF; Mon, 22 Nov 2021 16:55:02 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mpBe6-00EL3q-UU; Mon, 22 Nov 2021 16:54:18 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mpBe5-00HH2H-UD; Mon, 22 Nov 2021 16:54:17 +0100
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
Subject: [PATCH/RFC 16/17] ALSA: ice1724: Use bitfield helpers
Date: Mon, 22 Nov 2021 16:54:09 +0100
Message-Id: <45fa162856814176045ffbb49ee64cf0ea7e00bc.1637592133.git.geert+renesas@glider.be>
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
 sound/pci/ice1712/wm8766.c | 14 +++++++-------
 sound/pci/ice1712/wm8776.c | 14 +++++++-------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/pci/ice1712/wm8766.c b/sound/pci/ice1712/wm8766.c
index fe3e243b38549035..3e4d7f8f692785b0 100644
--- a/sound/pci/ice1712/wm8766.c
+++ b/sound/pci/ice1712/wm8766.c
@@ -7,6 +7,7 @@
  *	Copyright (c) 2012 Ondrej Zary <linux@rainbow-software.org>
  */
 
+#include <linux/bitfield.h>
 #include <linux/delay.h>
 #include <sound/core.h>
 #include <sound/control.h>
@@ -212,11 +213,10 @@ static int snd_wm8766_ctl_get(struct snd_kcontrol *kcontrol,
 	if (wm->ctl[n].get)
 		wm->ctl[n].get(wm, &val1, &val2);
 	else {
-		val1 = wm->regs[wm->ctl[n].reg1] & wm->ctl[n].mask1;
-		val1 >>= __ffs(wm->ctl[n].mask1);
+		val1 = field_get(wm->ctl[n].mask1, wm->regs[wm->ctl[n].reg1]);
 		if (wm->ctl[n].flags & WM8766_FLAG_STEREO) {
-			val2 = wm->regs[wm->ctl[n].reg2] & wm->ctl[n].mask2;
-			val2 >>= __ffs(wm->ctl[n].mask2);
+			val2 = field_get(wm->ctl[n].mask2,
+					 wm->regs[wm->ctl[n].reg2]);
 			if (wm->ctl[n].flags & WM8766_FLAG_VOL_UPDATE)
 				val2 &= ~WM8766_VOL_UPDATE;
 		}
@@ -251,19 +251,19 @@ static int snd_wm8766_ctl_put(struct snd_kcontrol *kcontrol,
 		wm->ctl[n].set(wm, regval1, regval2);
 	else {
 		val = wm->regs[wm->ctl[n].reg1] & ~wm->ctl[n].mask1;
-		val |= regval1 << __ffs(wm->ctl[n].mask1);
+		val |= field_prep(wm->ctl[n].mask1, regval1);
 		/* both stereo controls in one register */
 		if (wm->ctl[n].flags & WM8766_FLAG_STEREO &&
 				wm->ctl[n].reg1 == wm->ctl[n].reg2) {
 			val &= ~wm->ctl[n].mask2;
-			val |= regval2 << __ffs(wm->ctl[n].mask2);
+			val |= field_prep(wm->ctl[n].mask2, regval2);
 		}
 		snd_wm8766_write(wm, wm->ctl[n].reg1, val);
 		/* stereo controls in different registers */
 		if (wm->ctl[n].flags & WM8766_FLAG_STEREO &&
 				wm->ctl[n].reg1 != wm->ctl[n].reg2) {
 			val = wm->regs[wm->ctl[n].reg2] & ~wm->ctl[n].mask2;
-			val |= regval2 << __ffs(wm->ctl[n].mask2);
+			val |= field_prep(wm->ctl[n].mask2, regval2);
 			if (wm->ctl[n].flags & WM8766_FLAG_VOL_UPDATE)
 				val |= WM8766_VOL_UPDATE;
 			snd_wm8766_write(wm, wm->ctl[n].reg2, val);
diff --git a/sound/pci/ice1712/wm8776.c b/sound/pci/ice1712/wm8776.c
index 6eda86119dff60b3..b4edf8a03c342351 100644
--- a/sound/pci/ice1712/wm8776.c
+++ b/sound/pci/ice1712/wm8776.c
@@ -7,6 +7,7 @@
  *	Copyright (c) 2012 Ondrej Zary <linux@rainbow-software.org>
  */
 
+#include <linux/bitfield.h>
 #include <linux/delay.h>
 #include <sound/core.h>
 #include <sound/control.h>
@@ -486,11 +487,10 @@ static int snd_wm8776_ctl_get(struct snd_kcontrol *kcontrol,
 	if (wm->ctl[n].get)
 		wm->ctl[n].get(wm, &val1, &val2);
 	else {
-		val1 = wm->regs[wm->ctl[n].reg1] & wm->ctl[n].mask1;
-		val1 >>= __ffs(wm->ctl[n].mask1);
+		val1 = field_get(wm->ctl[n].mask1, wm->regs[wm->ctl[n].reg1]);
 		if (wm->ctl[n].flags & WM8776_FLAG_STEREO) {
-			val2 = wm->regs[wm->ctl[n].reg2] & wm->ctl[n].mask2;
-			val2 >>= __ffs(wm->ctl[n].mask2);
+			val2 = field_get(wm->ctl[n].mask2,
+					 wm->regs[wm->ctl[n].reg2]);
 			if (wm->ctl[n].flags & WM8776_FLAG_VOL_UPDATE)
 				val2 &= ~WM8776_VOL_UPDATE;
 		}
@@ -525,19 +525,19 @@ static int snd_wm8776_ctl_put(struct snd_kcontrol *kcontrol,
 		wm->ctl[n].set(wm, regval1, regval2);
 	else {
 		val = wm->regs[wm->ctl[n].reg1] & ~wm->ctl[n].mask1;
-		val |= regval1 << __ffs(wm->ctl[n].mask1);
+		val |= field_prep(wm->ctl[n].mask1, regval1);
 		/* both stereo controls in one register */
 		if (wm->ctl[n].flags & WM8776_FLAG_STEREO &&
 				wm->ctl[n].reg1 == wm->ctl[n].reg2) {
 			val &= ~wm->ctl[n].mask2;
-			val |= regval2 << __ffs(wm->ctl[n].mask2);
+			val |= field_prep(wm->ctl[n].mask2, regval2);
 		}
 		snd_wm8776_write(wm, wm->ctl[n].reg1, val);
 		/* stereo controls in different registers */
 		if (wm->ctl[n].flags & WM8776_FLAG_STEREO &&
 				wm->ctl[n].reg1 != wm->ctl[n].reg2) {
 			val = wm->regs[wm->ctl[n].reg2] & ~wm->ctl[n].mask2;
-			val |= regval2 << __ffs(wm->ctl[n].mask2);
+			val |= field_prep(wm->ctl[n].mask2, regval2);
 			if (wm->ctl[n].flags & WM8776_FLAG_VOL_UPDATE)
 				val |= WM8776_VOL_UPDATE;
 			snd_wm8776_write(wm, wm->ctl[n].reg2, val);
-- 
2.25.1

