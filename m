Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A75EA1ABDFF
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Apr 2020 12:34:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 545D7167C;
	Thu, 16 Apr 2020 12:33:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 545D7167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587033285;
	bh=FSCrJVIHrHP1m+H2f5bWgdd26OKdJg2LRMbZ6X8EL5E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dn9aktMKwKyKa/kFNOdkMMyHH+xRr01j+HU69ZX+j2vyGgOfx76zUHcjL9r7aIYhO
	 eBVgROo2oknbUYRpUWBKGx30Fv6CjmhiARfLpD5AKh76lmCO6JF0KrNYEYn2fUE6PZ
	 jhSbhlTpYUHUaKxgPTMxZMsQYIH3QfWXafVxc/jE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BFCAF8028D;
	Thu, 16 Apr 2020 12:31:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 011F8F8027D; Thu, 16 Apr 2020 12:31:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1965F8014E
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 12:31:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1965F8014E
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:fd83:81bb:c1d7:433d])
 by baptiste.telenet-ops.be with bizsmtp
 id TNWz2200j4dKHqf01NWzN6; Thu, 16 Apr 2020 12:31:11 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jP1nP-0001cz-Q0; Thu, 16 Apr 2020 12:30:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jP1nP-0003zO-OP; Thu, 16 Apr 2020 12:30:59 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Stefan Popa <stefan.popa@analog.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jiri Kosina <trivial@kernel.org>
Subject: [PATCH trivial 6/6] ASoC: Fix misspellings of "Analog Devices"
Date: Thu, 16 Apr 2020 12:30:58 +0200
Message-Id: <20200416103058.15269-7-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200416103058.15269-1-geert+renesas@glider.be>
References: <20200416103058.15269-1-geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dmaengine@vger.kernel.org
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

According to https://www.analog.com/, the company name is spelled
"Analog Devices".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 sound/soc/codecs/ad1980.c  | 2 +-
 sound/soc/codecs/ad73311.c | 2 +-
 sound/soc/codecs/wm8782.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/ad1980.c b/sound/soc/codecs/ad1980.c
index c4414c725c1f945a..43b1337bac37f70f 100644
--- a/sound/soc/codecs/ad1980.c
+++ b/sound/soc/codecs/ad1980.c
@@ -2,7 +2,7 @@
 /*
  * ad1980.c  --  ALSA Soc AD1980 codec support
  *
- * Copyright:	Analog Device Inc.
+ * Copyright:	Analog Devices Inc.
  * Author:	Roy Huang <roy.huang@analog.com>
  * 		Cliff Cai <cliff.cai@analog.com>
  */
diff --git a/sound/soc/codecs/ad73311.c b/sound/soc/codecs/ad73311.c
index 10daf61f02940b46..b98bf19f594e097f 100644
--- a/sound/soc/codecs/ad73311.c
+++ b/sound/soc/codecs/ad73311.c
@@ -2,7 +2,7 @@
 /*
  * ad73311.c  --  ALSA Soc AD73311 codec support
  *
- * Copyright:	Analog Device Inc.
+ * Copyright:	Analog Devices Inc.
  * Author:	Cliff Cai <cliff.cai@analog.com>
  */
 
diff --git a/sound/soc/codecs/wm8782.c b/sound/soc/codecs/wm8782.c
index aa5577e364d01360..f89855c616ebe6e6 100644
--- a/sound/soc/codecs/wm8782.c
+++ b/sound/soc/codecs/wm8782.c
@@ -7,7 +7,7 @@
  * Author: Johannes Stezenbach <js@sig21.net>
  *
  * based on ad73311.c
- * Copyright:	Analog Device Inc.
+ * Copyright:	Analog Devices Inc.
  * Author:	Cliff Cai <cliff.cai@analog.com>
  */
 
-- 
2.17.1

