Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAB7715CE
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 12:14:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE8121869;
	Tue, 23 Jul 2019 12:14:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE8121869
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563876891;
	bh=ZuMrUvTmoyVCxQ1DXJ2BqSxU1q0EecOuRm0VcQQMJs0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IpBVT/i1co6CW/ugsrws6RKsuagtq3/3GijPpq/U4xyMfaO2MgIu9mjMdFAI32+no
	 FYrxSGn4JDXCfkdBBlBWIpz67XQo4fGuOnUusouzDCazafSkQHaSuOHyWDDVFHsQ4l
	 3y4b/9JqQIw4VDULAEvWf6gTRZsa0+I5oDjo5fJQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39B86F80448;
	Tue, 23 Jul 2019 12:13:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E238F80227; Tue, 23 Jul 2019 12:13:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F260F80227
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 12:12:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F260F80227
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x6NACrwM013533,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCASV01.realtek.com.tw[172.21.6.18])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x6NACrwM013533
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 23 Jul 2019 18:12:53 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTITCASV01.realtek.com.tw (172.21.6.18) with Microsoft SMTP Server id
 14.3.439.0; Tue, 23 Jul 2019 18:12:52 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Tue, 23 Jul 2019 18:12:47 +0800
Message-ID: <20190723101247.19741-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Originating-IP: [172.22.102.1]
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, derek.fang@realtek.com, Shuming Fan <shumingf@realtek.com>,
 flove@realtek.com
Subject: [alsa-devel] [PATCH v2] ASoC: rt1308: Convert headers to SPDX
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Shuming Fan <shumingf@realtek.com>

Convert include and source files to SPDX.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1308.c | 17 +++++++----------
 sound/soc/codecs/rt1308.h |  6 ++----
 2 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/rt1308.c b/sound/soc/codecs/rt1308.c
index cf3d72f99705..6f2ee6809dbb 100644
--- a/sound/soc/codecs/rt1308.c
+++ b/sound/soc/codecs/rt1308.c
@@ -1,13 +1,10 @@
-/*
- * rt1308.c  --  RT1308 ALSA SoC amplifier component driver
- *
- * Copyright 2019 Realtek Semiconductor Corp.
- * Author: Derek Fang <derek.fang@realtek.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- */
+// SPDX-License-Identifier: GPL-2.0
+//
+// rt1308.c  --  RT1308 ALSA SoC amplifier component driver
+//
+// Copyright 2019 Realtek Semiconductor Corp.
+// Author: Derek Fang <derek.fang@realtek.com>
+//
 
 #include <linux/module.h>
 #include <linux/moduleparam.h>
diff --git a/sound/soc/codecs/rt1308.h b/sound/soc/codecs/rt1308.h
index c330aae1d527..ff7c423e879e 100644
--- a/sound/soc/codecs/rt1308.h
+++ b/sound/soc/codecs/rt1308.h
@@ -1,12 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
- * RT1308.h  --  RT1308 ALSA SoC amplifier component driver
+ * rt1308.h  --  RT1308 ALSA SoC amplifier component driver
  *
  * Copyright 2019 Realtek Semiconductor Corp.
  * Author: Derek Fang <derek.fang@realtek.com>
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #ifndef _RT1308_H_
-- 
2.22.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
