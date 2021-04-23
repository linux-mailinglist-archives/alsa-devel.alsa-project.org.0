Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB55736972C
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Apr 2021 18:36:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9124216C6;
	Fri, 23 Apr 2021 18:35:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9124216C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619195797;
	bh=M9spaWVGZ5pdAW+2XjVGzRjxDWFVmKk8iC7WQ3ZnTSU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=k2Q/tLfbsVEvEeBadjcVajOeo7v1sxfM3ckt29ZvDO95EUGupOq4aLyPTNtorwkBI
	 D4LJQWSDrqQ8fDo+iLqgIWs800/h9Z6NbCRDtfPtRsNt3RPsy6aeQoINb+O8cVJTiJ
	 CmVeA11uopQzQugsxVCXcXe5cIYqinJhuktUau8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11B5CF8025A;
	Fri, 23 Apr 2021 18:34:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A2B9F80430; Fri, 23 Apr 2021 18:34:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBFE5F80117
 for <alsa-devel@alsa-project.org>; Fri, 23 Apr 2021 18:34:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBFE5F80117
IronPort-SDR: pKpuvk9+7CDtPtyb1cTLZMHU90HWlDU+dtdUrePk82iohXhybPTgtEmx8px6hHk8jA8wMXCnyv
 IRJhSrptIcQQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9963"; a="193979321"
X-IronPort-AV: E=Sophos;i="5.82,246,1613462400"; d="scan'208";a="193979321"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2021 09:34:42 -0700
IronPort-SDR: A/GALelAqh8nmKhWf/4sYqd6s38qWEG8d4+DpCxmpFYcWce04Ax8rQd23x0+KRiW80i0WAjElK
 gZ4Q8dIDcA3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,246,1613462400"; d="scan'208";a="535590595"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga004.jf.intel.com with ESMTP; 23 Apr 2021 09:34:34 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id B304611E; Fri, 23 Apr 2021 19:34:51 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH v1 01/14] spi: pxa2xx: Use one point of return when ->probe()
 fails
Date: Fri, 23 Apr 2021 19:34:24 +0300
Message-Id: <20210423163437.89306-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
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

