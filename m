Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 257821A3B11
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Apr 2020 22:05:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE99C169D;
	Thu,  9 Apr 2020 22:04:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE99C169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586462732;
	bh=Ds3Q74m08WSe2QoMymJoGTAvCoss3uhcSxJSGB6MegY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GgR7hAY8xUiY8UaUDw9g1jsVll7CaDbooyAN4kx8cg/J4NLMQYV0Lb1on8mrh3w8q
	 alp0OdsTJp4leOQtZpfe0lgyrmdT7KSA8xikzuEVG71FlDGLrDsT1V4JDsWkchtd5s
	 25EsG0AZ37b6WZ8WwGwMutg+ttbFY3DDQC4bAVLs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D281F802E2;
	Thu,  9 Apr 2020 21:59:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99B31F802E1; Thu,  9 Apr 2020 21:59:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D31EEF80291
 for <alsa-devel@alsa-project.org>; Thu,  9 Apr 2020 21:59:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D31EEF80291
IronPort-SDR: uK5/whRekm08ZjQM0bIZhCvoTD3obqjQTdRBmEXwXvrUAbOPw3ANSU2Isd7I2FNINh1y1L+O4e
 wtKkX6B5Tztw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2020 12:59:15 -0700
IronPort-SDR: XrnvCafH4QA2xjoimj7XtbVNmucH9aRBHPtPgoAPz3tP2HKRr1+QyCLoWJHp5s1A0zeGV3I/GP
 S6+RQTDi0Alg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; d="scan'208";a="242745340"
Received: from davidadu-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.151.218])
 by fmsmga007.fm.intel.com with ESMTP; 09 Apr 2020 12:59:13 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 08/16] clk: hifiberry-dacpro: update SDPX/copyright
Date: Thu,  9 Apr 2020 14:58:33 -0500
Message-Id: <20200409195841.18901-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, tiwai@suse.de,
 Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Daniel Matuschek <daniel@hifiberry.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, Matthias Reichl <hias@horus.com>,
 broonie@kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
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

Reformat license information and add Intel copyright

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/clk/clk-hifiberry-dacpro.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/clk-hifiberry-dacpro.c b/drivers/clk/clk-hifiberry-dacpro.c
index 9e2634465823..eb67a8c47c49 100644
--- a/drivers/clk/clk-hifiberry-dacpro.c
+++ b/drivers/clk/clk-hifiberry-dacpro.c
@@ -1,17 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
- * Clock Driver for HiFiBerry DAC Pro
- *
- * Author: Stuart MacLean
- *         Copyright 2015
+ * Copyright (c) 2015 Stuart MacLean
+ * Copyright (c) 2020 Intel Corporation
  *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
+ * Clock Driver for HiFiBerry DAC Pro
  *
- * This program is distributed in the hope that it will be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * General Public License for more details.
  */
 
 #include <linux/clk-provider.h>
-- 
2.20.1

