Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ADD5E9340
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Sep 2022 14:59:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D148825;
	Sun, 25 Sep 2022 14:58:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D148825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664110742;
	bh=F/5v/OG1tLhnUYdhMIV8Bh9t+QsWgXuh2ncjbgR2jck=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZsbQD7q5QeeYv15TLBGgCNJ+vu9rAYznHAM+A4dlOnH4i8V/yDwNVNXk1psdmvl9u
	 zJ0jXF/oKLto+WjIe/swc4aXCXWQeEVvLvwRcU947mf0MahVFemQr7taeuWA8z03t9
	 dgjb43oMP/vga0Qiqs5J+gcmtW5yRmfuelyMKaUg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60966F80212;
	Sun, 25 Sep 2022 14:58:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BAA0F8011C; Sun, 25 Sep 2022 14:58:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp04.smtpout.orange.fr
 [80.12.242.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C382F8011C
 for <alsa-devel@alsa-project.org>; Sun, 25 Sep 2022 14:57:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C382F8011C
Received: from pop-os.home ([86.243.100.34]) by smtp.orange.fr with ESMTPA
 id cRCkoBFiunj75cRCkozkIF; Sun, 25 Sep 2022 14:57:56 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 25 Sep 2022 14:57:56 +0200
X-ME-IP: 86.243.100.34
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Clemens Ladisch <clemens@ladisch.de>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] headers: Remove some left-over license text in sound/firewire
Date: Sun, 25 Sep 2022 14:57:51 +0200
Message-Id: <2bfe76c7eeb0f5205a1427e280bf8d9da0354a62.1664110649.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

There is alredy a SPDX-License-Identifier tag, so the corresponding license
text can be removed.

While at it, be more consistent and:
  - add a missing .c (ff-protocol-latter)
  - remove an empty line (motu-protocol-v1)

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/firewire/dice/dice-harman.c            | 2 --
 sound/firewire/dice/dice-presonus.c          | 2 --
 sound/firewire/fireface/ff-protocol-former.c | 2 --
 sound/firewire/fireface/ff-protocol-latter.c | 4 +---
 sound/firewire/motu/motu-protocol-v1.c       | 3 ---
 5 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/sound/firewire/dice/dice-harman.c b/sound/firewire/dice/dice-harman.c
index a8ca00c397e8..212ae77dfca2 100644
--- a/sound/firewire/dice/dice-harman.c
+++ b/sound/firewire/dice/dice-harman.c
@@ -2,8 +2,6 @@
 // dice-harman.c - a part of driver for DICE based devices
 //
 // Copyright (c) 2021 Takashi Sakamoto
-//
-// Licensed under the terms of the GNU General Public License, version 2.
 
 #include "dice.h"
 
diff --git a/sound/firewire/dice/dice-presonus.c b/sound/firewire/dice/dice-presonus.c
index 503f462a83f4..967cc3119a64 100644
--- a/sound/firewire/dice/dice-presonus.c
+++ b/sound/firewire/dice/dice-presonus.c
@@ -2,8 +2,6 @@
 // dice-presonus.c - a part of driver for DICE based devices
 //
 // Copyright (c) 2019 Takashi Sakamoto
-//
-// Licensed under the terms of the GNU General Public License, version 2.
 
 #include "dice.h"
 
diff --git a/sound/firewire/fireface/ff-protocol-former.c b/sound/firewire/fireface/ff-protocol-former.c
index bf44cad7985e..8900ffe517ed 100644
--- a/sound/firewire/fireface/ff-protocol-former.c
+++ b/sound/firewire/fireface/ff-protocol-former.c
@@ -2,8 +2,6 @@
 // ff-protocol-former.c - a part of driver for RME Fireface series
 //
 // Copyright (c) 2019 Takashi Sakamoto
-//
-// Licensed under the terms of the GNU General Public License, version 2.
 
 #include <linux/delay.h>
 
diff --git a/sound/firewire/fireface/ff-protocol-latter.c b/sound/firewire/fireface/ff-protocol-latter.c
index 7ddb7b97f02d..76c3eab36d4e 100644
--- a/sound/firewire/fireface/ff-protocol-latter.c
+++ b/sound/firewire/fireface/ff-protocol-latter.c
@@ -1,9 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
-// ff-protocol-latter - a part of driver for RME Fireface series
+// ff-protocol-latter.c - a part of driver for RME Fireface series
 //
 // Copyright (c) 2019 Takashi Sakamoto
-//
-// Licensed under the terms of the GNU General Public License, version 2.
 
 #include <linux/delay.h>
 
diff --git a/sound/firewire/motu/motu-protocol-v1.c b/sound/firewire/motu/motu-protocol-v1.c
index f1d6a326dc07..e811629f167b 100644
--- a/sound/firewire/motu/motu-protocol-v1.c
+++ b/sound/firewire/motu/motu-protocol-v1.c
@@ -1,10 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
-
 // motu-protocol-v1.c - a part of driver for MOTU FireWire series
 //
 // Copyright (c) 2021 Takashi Sakamoto <o-takashi@sakamocchi.jp>
-//
-// Licensed under the terms of the GNU General Public License, version 2.
 
 #include "motu.h"
 
-- 
2.34.1

