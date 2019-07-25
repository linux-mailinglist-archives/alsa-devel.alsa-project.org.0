Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 382E874899
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 10:00:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4A7F1AB9;
	Thu, 25 Jul 2019 09:59:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4A7F1AB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564041643;
	bh=nrYjUCIV5OvCGUeYCtZscMqHMkemGlrJBGb/ZxhbhgE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kw7VxB2AteSkxPO3mrYQvykMXHa5qNOSK60zTVzEHlSgesVRCWBOtKnwfHrhzRuE9
	 jZDcyPAYhewaDQfwLmCrpOtUfu8vAO7Lst10MonyeQmPdgE0737G0oMWYlUkLBwbI8
	 ip4C6fzdAdrXSxSHbdTdK+XBroeqvhIalZ9aagFs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E494CF80392;
	Thu, 25 Jul 2019 09:58:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01911F80448; Thu, 25 Jul 2019 09:58:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_SOFTFAIL,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from conuserg-12.nifty.com (conuserg-12.nifty.com [210.131.2.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 073F4F80392
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 09:58:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 073F4F80392
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nifty.com header.i=@nifty.com
 header.b="GlymzVHY"
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-12.nifty.com with ESMTP id x6P7wYiA029514;
 Thu, 25 Jul 2019 16:58:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x6P7wYiA029514
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1564041516;
 bh=1v752PISwpeCj8Aze3ypEj8GmNP9DdapaFZfYxvN23U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GlymzVHYvuyGwQJuCUCEJrk+fjkK8HJCfV0vUWk2Wgn915j1qvTHsTI4VsuzdA/vP
 0Wm+rDvAnG3vKTrHlp8AmpGCIZK43dpof5CwlklRuTjfJhjUyuei7DoTGRY6kgWZ9K
 0WmImWu965GxnJaAtu2QENN7jAY0TADAa+9Rgf6Js4KCWjxOx1WA/ivpO6hNsHgsSt
 /j3o4VxyX2FaDmr94JXVoF/NIk/bcTsAVIwbksiwbMuDAfO6D14rATGu49QlS/q4jW
 2YFQShesNpMXgy1B+/nrVbBhBrtlSI+20z30aQc/AHb/iYi0NxvXPzRDvpw8unTZ2u
 ivunlwdIvtxMw==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-kernel@vger.kernel.org, linux-spdx@vger.kernel.org,
 Greg KH <gregkh@linuxfoundation.org>
Date: Thu, 25 Jul 2019 16:58:33 +0900
Message-Id: <20190725075833.3481-3-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190725075833.3481-1-yamada.masahiro@socionext.com>
References: <20190725075833.3481-1-yamada.masahiro@socionext.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Thomas Gleixner <tglx@linutronix.de>, alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH v2 3/3] iomap: fix Invalid License ID
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

Detected by:

  $ ./scripts/spdxcheck.py
  fs/iomap/Makefile: 1:27 Invalid License ID: GPL-2.0-or-newer

Fixes: 1c230208f53d ("iomap: start moving code to fs/iomap/")
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - New patch

 fs/iomap/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/iomap/Makefile b/fs/iomap/Makefile
index 2d165388d952..93cd11938bf5 100644
--- a/fs/iomap/Makefile
+++ b/fs/iomap/Makefile
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0-or-newer
+# SPDX-License-Identifier: GPL-2.0-or-later
 #
 # Copyright (c) 2019 Oracle.
 # All Rights Reserved.
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
