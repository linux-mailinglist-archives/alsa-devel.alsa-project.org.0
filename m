Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7171378C61
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 14:42:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55E0916AD;
	Mon, 10 May 2021 14:42:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55E0916AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620650576;
	bh=RIROT/vZ8jpvcVsFKGXqEFzN79LIzr5JqHNaVIGkelA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SVlf0I27tvnZvfVzQ42leyNGYuqTTuYfVmXtfCqqGHhPrdMs3+1rl2+Qsg9av2074
	 mXSfnx5CpiI58bY4wD/5XUmtrcqou4CtZvykCWWNOMBc5vhiQ5mi+RhnKF9KingjWN
	 lwTWhUyoazuu3sIlebmcM8elJzmexF2xYhh4zrbA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B61C8F80425;
	Mon, 10 May 2021 14:41:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17141F80272; Mon, 10 May 2021 14:41:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B800F80240
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 14:41:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B800F80240
IronPort-SDR: wqTdQLJM6Ilqwd6lKuEty2yuM6J5ERpqDzIyK1yWi/YFQ7OIAX9+Ztd4w0WotGgE/6ZZcTe5FZ
 L4KFt6Hq6lFQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9979"; a="198860826"
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="198860826"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 05:41:19 -0700
IronPort-SDR: 5nN/+7mM/gojnHt//gtw2ISyE1hf0GSBEA0Igq5eujV0QPHMd1F9Pmq4FrvuZI5TRp33lU1ioh
 udxzIQuO6WXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="536401736"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga001.fm.intel.com with ESMTP; 10 May 2021 05:41:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 1917FD7; Mon, 10 May 2021 15:41:37 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH v3 00/14] spi: pxa2xx: Set of cleanups
Date: Mon, 10 May 2021 15:41:20 +0300
Message-Id: <20210510124134.24638-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailer: git-send-email 2.30.2
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

In v3:
- rebased on top of v5.13-rc1 and/or spi/for-5,14

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

