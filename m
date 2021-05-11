Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 496D337A903
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 16:21:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF00F17F5;
	Tue, 11 May 2021 16:21:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF00F17F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620742910;
	bh=B+VS/tthxUPWerf/yukmH/hBsFmJ8BSsYSPxXWfLZIU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LFAIHTnz08vgj4sUHu5XOtXHdpqnSmz9nAvJUFrv+olTRe6UBOFsP24x5i4dpGEGp
	 4VjOWacJoMcMOx6psB0fjQTdKhg8Gpsg7y0LgNUkFY3gAlCegj4IDyLqlM6uoWWwYy
	 mFM52rEXZ9jbrfGgs9Nj68r6aNQJc+4l70ZHMbbE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37745F804ED;
	Tue, 11 May 2021 16:18:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5884BF804EC; Tue, 11 May 2021 16:18:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BD58F804E3
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 16:17:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BD58F804E3
IronPort-SDR: oaEcsXQVs2X4khHIb54g4Q3HaDO+M3Mkhw+lyP0oe7jSrwxSk2j72t8rFg4t+CrJFEzEqogqFs
 2qBw8rEqUU2w==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="179045747"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="179045747"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 07:17:10 -0700
IronPort-SDR: kEyNBkIFqeMJtec6hWX8jf1qFI1k0McLtuBKIm6ufMJrwmXAZZoBeZtrSRtJYyznwMutc6EVwg
 L0Ix+Bme+KXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="455031948"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga004.fm.intel.com with ESMTP; 11 May 2021 07:17:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 5071514B; Tue, 11 May 2021 17:17:27 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: [PATCH v3 0/8] spi: pxa2xx: Set of cleanups
Date: Tue, 11 May 2021 17:17:17 +0300
Message-Id: <20210511141725.32097-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
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

In v4:
- dropped applied patches

In v3:
- rebased on top of v5.13-rc1 and/or spi/for-5,14

In v2:
- cover letter (Mark)
- drop moving the header in patch 5 (Mark)


Andy Shevchenko (8):
  spi: pxa2xx: Reuse int_error_stop() in pxa2xx_spi_slave_abort()
  spi: pxa2xx: Use pxa_ssp_enable()/pxa_ssp_disable() in the driver
  spi: pxa2xx: Extract pxa2xx_spi_update() helper
  spi: pxa2xx: Extract clear_SSCR1_bits() helper
  spi: pxa2xx: Extract read_SSSR_bits() helper
  spi: pxa2xx: Constify struct driver_data parameter
  spi: pxa2xx: Introduce special type for Merrifield SPIs
  spi: Convert to use predefined time multipliers

 drivers/spi/spi-pxa2xx-dma.c |  17 ++--
 drivers/spi/spi-pxa2xx-pci.c |   2 +-
 drivers/spi/spi-pxa2xx.c     | 147 ++++++++++++++++++-----------------
 drivers/spi/spi-pxa2xx.h     |  16 +++-
 drivers/spi/spi.c            |  41 ++++++----
 include/linux/pxa2xx_ssp.h   |  32 ++++++++
 sound/soc/pxa/pxa-ssp.c      |  16 ----
 7 files changed, 156 insertions(+), 115 deletions(-)

-- 
2.30.2

