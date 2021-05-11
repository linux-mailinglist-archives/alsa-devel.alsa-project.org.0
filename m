Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A94137A94A
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 16:29:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1638182F;
	Tue, 11 May 2021 16:28:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1638182F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620743379;
	bh=IYunWXPueNNoel7PoSMV+42xsX6et9I6k9HBhwXeygg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ot9O8TjGhhPhvwkvRyVtgNP83H2bIfAeWSjLoOCcyq4MjrMTw+cIM5SwmjmnD1SJK
	 iAbXAyAdLDgZmzaXPfEFK7uTTaEP6M8H3O3h8HJL7CiuDy5tmgMyKOrT7GA8+WPVMY
	 at91hZ+5LjBK6Vv8/sXiVJbfFhktDB/EXFUZJKEg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BA6AF804A9;
	Tue, 11 May 2021 16:27:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22FF2F80482; Tue, 11 May 2021 16:27:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8165FF80424
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 16:27:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8165FF80424
IronPort-SDR: Tdo7wYrqTO+AjjYx430ihGkIbi5E0vHFNaZOj5rjT6w+x1HWJvBNQ+InScyd7QQHPVQtk+p/PW
 /TncXuz38+Hg==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="186589111"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="186589111"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 07:26:57 -0700
IronPort-SDR: XW+NcED4qTFOB/IBnZCqXZFhli+dJOuN8su+/RFqCtkejCR5hm1hClhEoUgdqAxlwDoc7zo1pL
 fYu4uDAa/8tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="392319995"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga006.jf.intel.com with ESMTP; 11 May 2021 07:26:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id D3A06249; Tue, 11 May 2021 17:27:12 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: [PATCH v4 0/8] spi: pxa2xx: Set of cleanups (part 1+)
Date: Tue, 11 May 2021 17:27:03 +0300
Message-Id: <20210511142711.23244-1-andriy.shevchenko@linux.intel.com>
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
  spi: pxa2xx: Introduce int_stop_and_reset() helper
  spi: pxa2xx: Reuse int_error_stop() in pxa2xx_spi_slave_abort()
  spi: pxa2xx: Use pxa_ssp_enable()/pxa_ssp_disable() in the driver
  spi: pxa2xx: Extract pxa2xx_spi_update() helper
  spi: pxa2xx: Extract clear_SSCR1_bits() helper
  spi: pxa2xx: Extract read_SSSR_bits() helper
  spi: pxa2xx: Constify struct driver_data parameter
  spi: pxa2xx: Introduce special type for Merrifield SPIs

 drivers/spi/spi-pxa2xx-dma.c |  17 +---
 drivers/spi/spi-pxa2xx-pci.c |   2 +-
 drivers/spi/spi-pxa2xx.c     | 171 ++++++++++++++++++-----------------
 drivers/spi/spi-pxa2xx.h     |  16 +++-
 include/linux/pxa2xx_ssp.h   |  32 +++++++
 sound/soc/pxa/pxa-ssp.c      |  16 ----
 6 files changed, 140 insertions(+), 114 deletions(-)

-- 
2.30.2

