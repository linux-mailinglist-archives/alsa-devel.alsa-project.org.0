Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF0F36998D
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Apr 2021 20:26:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 472A61712;
	Fri, 23 Apr 2021 20:26:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 472A61712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619202419;
	bh=M9spaWVGZ5pdAW+2XjVGzRjxDWFVmKk8iC7WQ3ZnTSU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OcZuh5FdtDGFGtlwoAp57g1iLzVz25utaf/23g4rxqgNj4CC5eiF58Yn1VDbf7Ba8
	 71GbL/YmhdH2yebcQDMotl/5TgWMQtR2o5H8xkFFdJeYuxz6beBcpAogWHPt5/Nc8g
	 UkcHw2mC0mmLKyD8LuQdDRz+7Mfn7EiDNULM+Qc8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97C1BF804AD;
	Fri, 23 Apr 2021 20:24:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DD3CF8049C; Fri, 23 Apr 2021 20:24:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6D1DF80227
 for <alsa-devel@alsa-project.org>; Fri, 23 Apr 2021 20:24:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6D1DF80227
IronPort-SDR: 9ZAm5VtSUDomqkv+zD0jNY4LWYSi9MaKjSjkdCNbjTDIQ8yHWZM8Eltatbi4njiPSrQSYUMpJR
 dQseCvjbMRlQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9963"; a="281441749"
X-IronPort-AV: E=Sophos;i="5.82,246,1613462400"; d="scan'208";a="281441749"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2021 11:24:29 -0700
IronPort-SDR: Kw2kSwe5A3CIcIaWTXxE9t7TUlgTCX8H0nfuEK6Gxru+t3ir/qIQ96CnPanQiOIqqa/DYjMWY5
 yxI5GtwC0uEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,246,1613462400"; d="scan'208";a="385169376"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga003.jf.intel.com with ESMTP; 23 Apr 2021 11:24:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id DC14141; Fri, 23 Apr 2021 21:24:44 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH v2 01/14] spi: pxa2xx: Use one point of return when ->probe()
 fails
Date: Fri, 23 Apr 2021 21:24:28 +0300
Message-Id: <20210423182441.50272-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210423182441.50272-1-andriy.shevchenko@linux.intel.com>
References: <20210423182441.50272-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Mark Brown <broonie@kernel.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>
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

When we can't allocate SPI controller, jump to the error path rather than
return locally.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi-pxa2xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index 0cc767283674..0ef22045b006 100644
--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -1701,8 +1701,8 @@ static int pxa2xx_spi_probe(struct platform_device *pdev)
 
 	if (!controller) {
 		dev_err(&pdev->dev, "cannot alloc spi_controller\n");
-		pxa_ssp_free(ssp);
-		return -ENOMEM;
+		status = -ENOMEM;
+		goto out_error_controller_alloc;
 	}
 	drv_data = spi_controller_get_devdata(controller);
 	drv_data->controller = controller;
-- 
2.30.2

