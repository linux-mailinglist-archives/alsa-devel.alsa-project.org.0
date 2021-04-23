Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BAF369988
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Apr 2021 20:26:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFF4516FC;
	Fri, 23 Apr 2021 20:25:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFF4516FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619202368;
	bh=QLl4dhurAuACSpG9cgj8fseKYhFHrstt4aQWublLjfU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XtLSefKiM9t2rB7w34yVsg4VBblzQbwGTvKJwCKvi3FXoL3EL0/elx8k5JNrYV7d3
	 EJR4GtlymbtsCf8dJ0S2cRf0hJxhGyn8/JCmSUib/OOJf8n5sQAovo6eLBsrnE8bT1
	 6idRZinH6fzgHUqZqxC4j5DB3zdOfD1C9/USpjBo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E80BEF80423;
	Fri, 23 Apr 2021 20:24:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D4CBF8028B; Fri, 23 Apr 2021 20:24:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB4BCF800AE
 for <alsa-devel@alsa-project.org>; Fri, 23 Apr 2021 20:24:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB4BCF800AE
IronPort-SDR: 9XdEzBKQhLjbygoZmOJzd3iZbjllFngJ3VhV7o8DzsbhQyKVc15ZTVsORSm5BXSoQ2q/oUDhPE
 qM/wQbcGauTg==
X-IronPort-AV: E=McAfee;i="6200,9189,9963"; a="257419341"
X-IronPort-AV: E=Sophos;i="5.82,246,1613462400"; d="scan'208";a="257419341"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2021 11:24:29 -0700
IronPort-SDR: /2YeD8bvSJ83Lc78E/vTHcFFeQjHt0sSD6U1jTeXnsZytf2DTGs3SfNHLhkP0Jdcl85iv1NlpY
 Nx1gsNPC69ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,246,1613462400"; d="scan'208";a="614792175"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga006.fm.intel.com with ESMTP; 23 Apr 2021 11:24:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id D222411E; Fri, 23 Apr 2021 21:24:44 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH v2 00/14] spi: pxa2xx: Set of cleanups
Date: Fri, 23 Apr 2021 21:24:27 +0300
Message-Id: <20210423182441.50272-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
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

Set of cleanups here and there related to the SPI PXA2xx driver.
On top of them, adding the special type for Intel Merrifield.

In v2:
- cover letter (Mark)
- drop moving the header in patch 5 (Mark)

Andy Shevchenko (14):
  spi: pxa2xx: Use one point of return when ->probe() fails
  spi: pxa2xx: Utilize MMIO and physical base from struct ssp_device
  spi: pxa2xx: Utilize struct device from struct ssp_device
  spi: pxa2xx: Replace header inclusions by forward declarations
  spi: pxa2xx: Unify ifdeffery used in the headers
  spi: pxa2xx: Group Intel Quark specific definitions
  spi: pxa2xx: Introduce int_stop_and_reset() helper
  spi: pxa2xx: Reuse int_error_stop() in pxa2xx_spi_slave_abort()
  spi: pxa2xx: Use pxa_ssp_enable()/pxa_ssp_disable() in the driver
  spi: pxa2xx: Extract pxa2xx_spi_update() helper
  spi: pxa2xx: Extract clear_SSCR1_bits() helper
  spi: pxa2xx: Extract read_SSSR_bits() helper
  spi: pxa2xx: Constify struct driver_data parameter
  spi: pxa2xx: Introduce special type for Merrifield SPIs

 drivers/spi/spi-pxa2xx-dma.c   |  37 +++----
 drivers/spi/spi-pxa2xx-pci.c   |   4 +-
 drivers/spi/spi-pxa2xx.c       | 190 +++++++++++++++++----------------
 drivers/spi/spi-pxa2xx.h       |  52 ++++-----
 include/linux/pxa2xx_ssp.h     |  42 +++++++-
 include/linux/spi/pxa2xx_spi.h |   9 +-
 sound/soc/pxa/pxa-ssp.c        |  16 ---
 7 files changed, 185 insertions(+), 165 deletions(-)

-- 
2.30.2

