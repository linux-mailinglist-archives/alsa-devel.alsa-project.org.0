Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD05C31945
	for <lists+alsa-devel@lfdr.de>; Sat,  1 Jun 2019 05:25:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36D4E1688;
	Sat,  1 Jun 2019 05:24:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36D4E1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559359508;
	bh=opNX0Tp5lcSoHmyIe8WlsBKaaBIbJIfHLFFcX6juXAw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VPdzEss46CO36M+AIraq3zGy0CKYaBdK5le5x5zoxO1QE5TZmjUn2lJBOAngDFP4Z
	 D+cer0bo2Qfluq/sgxZZ8/YiXjrrigHtyt6gIpPXJD8pzEF7DAxUSWeD0eBpBUJ2hH
	 qTyGWYVVHaIITw4mzn2LfECfsB1W0AtOvh44Bi9c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79C06F89723;
	Sat,  1 Jun 2019 05:23:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD4E2F89708; Sat,  1 Jun 2019 05:23:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_SOFTFAIL,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from conuserg-12.nifty.com (conuserg-12.nifty.com [210.131.2.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BB21F8072E
 for <alsa-devel@alsa-project.org>; Sat,  1 Jun 2019 05:23:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BB21F8072E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nifty.com header.i=@nifty.com
 header.b="xw0YwrrA"
Received: from grover.flets-west.jp (softbank126125154139.bbtec.net
 [126.125.154.139]) (authenticated)
 by conuserg-12.nifty.com with ESMTP id x513MrHC023003;
 Sat, 1 Jun 2019 12:22:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x513MrHC023003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1559359374;
 bh=r3qAVs3xM8MaSXiqlFioeBt+ecKWRRFeKPnE+XTAM3A=;
 h=From:To:Cc:Subject:Date:From;
 b=xw0YwrrAPeAY0OlcTa3SqAJKQnezXQoI2+/7rrH2CfETfalYjs1oPY4aVPA7tr9gd
 PRENg4z1TGu6XcME/fQNuRRNr/MWUyJDUA9g6NOMDBnSEuZOGzvFEhQ27AUfnIO3sa
 i1YAFJSzyn2RPF7OIZdKRk5sifWn4Jnc1sOFY9daWmqQyNbN9Bv7WwR1Z0r2TcU1q8
 wYJjAACezYFAKTQmvSn0Nxg8GYX4RN/YnoLhUfVK+VO0x+7E0OfO0bRe/S3bJLJByI
 R2uRHaeHgFubi/04LIXnk9kFNomJCl9TkcTXqn7fOzIIxpVKdpGhv5s4zM4BOfsM7g
 mqkobRgO/jTHA==
X-Nifty-SrcIP: [126.125.154.139]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Sat,  1 Jun 2019 12:22:42 +0900
Message-Id: <20190601032242.10405-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, Kees Cook <keescook@chromium.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Liam Girdwood <lgirdwood@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joe Perches <joe@perches.com>, linux-spdx@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@st.com>
Subject: [alsa-devel] [PATCH] treewide: fix typos of SPDX-License-Identifier
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Prior to the adoption of SPDX, it was difficult for tools to determine
the correct license due to incomplete or badly formatted license text.
The SPDX solves this issue, assuming people can correctly spell
"SPDX-License-Identifier" although this assumption is broken in some
places.

Since scripts/spdxcheck.py parses only lines that exactly matches to
the correct tag, it cannot (should not) detect this kind of error.

If the correct tag is missing, scripts/checkpatch.pl warns like this:

 WARNING: Missing or malformed SPDX-License-Identifier tag in line *

So, people should notice it before the patch submission, but in reality
broken tags sometimes slip in. The checkpatch warning is not useful for
checking the committed files globally since large number of files still
have no SPDX tag.

Also, I am not sure about the legal effect when the SPDX tag is broken.

Anyway, these typos are absolutely worth fixing. It is pretty easy to
find suspicious lines by grep.

  $ git grep --not -e SPDX-License-Identifier --and -e SPDX- -- \
    :^LICENSES :^scripts/spdxcheck.py :^*/license-rules.rst
  arch/arm/kernel/bugs.c:// SPDX-Identifier: GPL-2.0
  drivers/phy/st/phy-stm32-usbphyc.c:// SPDX-Licence-Identifier: GPL-2.0
  drivers/pinctrl/sh-pfc/pfc-r8a77980.c:// SPDX-Lincense-Identifier: GPL 2.0
  lib/test_stackinit.c:// SPDX-Licenses: GPLv2
  sound/soc/codecs/max9759.c:// SPDX-Licence-Identifier: GPL-2.0

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm/kernel/bugs.c                | 2 +-
 drivers/phy/st/phy-stm32-usbphyc.c    | 2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77980.c | 2 +-
 lib/test_stackinit.c                  | 2 +-
 sound/soc/codecs/max9759.c            | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/kernel/bugs.c b/arch/arm/kernel/bugs.c
index d41d3598e5e5..14c8dbbb7d2d 100644
--- a/arch/arm/kernel/bugs.c
+++ b/arch/arm/kernel/bugs.c
@@ -1,4 +1,4 @@
-// SPDX-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0
 #include <linux/init.h>
 #include <asm/bugs.h>
 #include <asm/proc-fns.h>
diff --git a/drivers/phy/st/phy-stm32-usbphyc.c b/drivers/phy/st/phy-stm32-usbphyc.c
index 1255cd1d9a60..56bdea4b0bd9 100644
--- a/drivers/phy/st/phy-stm32-usbphyc.c
+++ b/drivers/phy/st/phy-stm32-usbphyc.c
@@ -1,4 +1,4 @@
-// SPDX-Licence-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0
 /*
  * STMicroelectronics STM32 USB PHY Controller driver
  *
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77980.c b/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
index 473da65890a7..9ed4ead2dafb 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
@@ -1,4 +1,4 @@
-// SPDX-Lincense-Identifier: GPL 2.0
+// SPDX-License-Identifier: GPL-2.0
 /*
  * R8A77980 processor support - PFC hardware block.
  *
diff --git a/lib/test_stackinit.c b/lib/test_stackinit.c
index 13115b6f2b88..e97dc54b4fdf 100644
--- a/lib/test_stackinit.c
+++ b/lib/test_stackinit.c
@@ -1,4 +1,4 @@
-// SPDX-Licenses: GPLv2
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Test cases for compiler-based stack variable zeroing via future
  * compiler flags or CONFIG_GCC_PLUGIN_STRUCTLEAK*.
diff --git a/sound/soc/codecs/max9759.c b/sound/soc/codecs/max9759.c
index ecfb4a80424b..00e9d4fd1651 100644
--- a/sound/soc/codecs/max9759.c
+++ b/sound/soc/codecs/max9759.c
@@ -1,4 +1,4 @@
-// SPDX-Licence-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0
 /*
  * MAX9759 Amplifier Driver
  *
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
