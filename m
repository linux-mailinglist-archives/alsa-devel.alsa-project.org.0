Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D91378C66
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 14:43:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A88F16BD;
	Mon, 10 May 2021 14:42:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A88F16BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620650627;
	bh=dZsQ1GlPnVjJMUz7kF8jTKOiRPJtbRgd7s0wqVb83Z0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PSsdJMcCty07nDzlschgnmtEMcrE0zQRLB9kPPi4aj/FFuRvukJJtZFQBIiST4JhN
	 ANcorFBZe3j9b8mhXL7ajDgUrWCziR74E+qnYYCHUZHaRN7d1+oCNDEQiahPjYz+aD
	 ulthVhUNxQSTWEfpu8kqQ2nzBSN8ycAj0r/fxbPs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4960F8049C;
	Mon, 10 May 2021 14:41:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F001F804A9; Mon, 10 May 2021 14:41:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F7BEF800B4
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 14:41:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F7BEF800B4
IronPort-SDR: ysCROry298oVdQq191rhwr4q9MXylR83/Nl3Lk775HnPV77gKkSc+qa+FS5RqCWsXzYWgnwkmu
 V06WGq50IgSg==
X-IronPort-AV: E=McAfee;i="6200,9189,9979"; a="260448256"
X-IronPort-AV: E=Sophos;i="5.82,286,1613462400"; d="scan'208";a="260448256"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 05:41:19 -0700
IronPort-SDR: h95c03LnyjhF35XWAmszvclXci7XINUy4g0BVV+RzhYcbtawsg/8m8rESXvy5xDMt7ZdJ3lMyy
 3dGlZCsDRRxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="429898265"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga007.jf.intel.com with ESMTP; 10 May 2021 05:41:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 4161EBA; Mon, 10 May 2021 15:41:37 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH v3 01/14] spi: pxa2xx: Use one point of return when ->probe()
 fails
Date: Mon, 10 May 2021 15:41:21 +0300
Message-Id: <20210510124134.24638-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210510124134.24638-1-andriy.shevchenko@linux.intel.com>
References: <20210510124134.24638-1-andriy.shevchenko@linux.intel.com>
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
index 5e59ba075bc7..2f5618883ac3 100644
--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -1705,8 +1705,8 @@ static int pxa2xx_spi_probe(struct platform_device *pdev)
 
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

