Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFD474D379
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jul 2023 12:29:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76028847;
	Mon, 10 Jul 2023 12:29:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76028847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688984997;
	bh=v/jR6yG2S/os1yevMEAtUPc5WvkJ6D/EUS+UHJf/Log=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=chfmGN2xEnEmiR6vss9twtLygXqhqX5aPk/YKlXSxGGlRp3iKJ13ZQds6LZlzINV+
	 4DRKVyezQ64jihZ7N7vyq2Ow66d9Rjqo7SRzbSWzNj+gyu9sxEkv0RkZiurl/Pg52Q
	 sbIG7byMy2RYxI3n+SzrWOnmV/ClKYGtsf832eOU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C2B2F80578; Mon, 10 Jul 2023 12:28:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6986F80570;
	Mon, 10 Jul 2023 12:28:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 800E6F8053B; Mon, 10 Jul 2023 12:28:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 72EB5F800D2
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 12:27:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72EB5F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=l42A+l2U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688984881; x=1720520881;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=v/jR6yG2S/os1yevMEAtUPc5WvkJ6D/EUS+UHJf/Log=;
  b=l42A+l2UhIeubcxDnkGI8/Rt7wNiVlNX5SCZWOoTJUu7WDTTCaKojmRJ
   /xhkbTc4dUr7t9ymc9z9SkrpdYlfkS+PvMSDH954U5z8IQAJW7rQl24Ag
   /d6a6qjfEf1kBGWxYbZnYxWjJlHrgZu4BMlb7SwZjQ265pISILi1XQxk9
   /CgbvS3KRuGTv2bHkn9oGZuISgQQier15UzgYxb87IzschWVHCbyDWVIe
   vRdHn7emCjI/qC09xRBpUA8ipQYq4MuntyfGEnFTpJa008gNaNTj5VL/k
   XZmImJZ3ptmUMBV+y8AB8Y+1CRy8zDNZPDI9hMKWp3b4r8mSBnLGJOVpv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="364345409"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200";
   d="scan'208";a="364345409"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 03:27:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="865297521"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200";
   d="scan'208";a="865297521"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 10 Jul 2023 03:27:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id DD3A91FC; Mon, 10 Jul 2023 13:27:52 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	Kris Bahnsen <kris@embeddedTS.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org
Cc: Radu Pirea <radu_nicolae.pirea@upb.ro>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Subject: [PATCH v1 0/8] spi: Header and core clean up and refactoring
Date: Mon, 10 Jul 2023 13:27:43 +0300
Message-Id: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: W7CJKIYUQD53TV3PN7Z2SDAA4O4POK6F
X-Message-ID-Hash: W7CJKIYUQD53TV3PN7Z2SDAA4O4POK6F
X-MailFrom: andriy.shevchenko@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W7CJKIYUQD53TV3PN7Z2SDAA4O4POK6F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Various cleanups and refactorings of the SPI header and core parts
united in a single series.

Patches 1 & 2, 5 & 6 & 8 are dependent inside each group.

No functional change intended.

Andy Shevchenko (8):
  spi: Remove unneeded OF node NULL checks
  spi: Drop duplicate IDR allocation code in spi_register_controller()
  spi: Use sysfs_emit() to instead of s*printf()
  spi: Get rid of old SPI_MASTER_NO_.X and SPI_MASTER_MUST_.X
  spi: Sort headers alphabetically
  spi: Clean up headers
  spi: Fix spelling typos and acronyms capitalization
  spi: Use struct_size() helper

 drivers/spi/spi-at91-usart.c    |   2 +-
 drivers/spi/spi-atmel.c         |   2 +-
 drivers/spi/spi-bitbang-txrx.h  |  16 +--
 drivers/spi/spi-bitbang.c       |   2 +-
 drivers/spi/spi-davinci.c       |   2 +-
 drivers/spi/spi-fsl-lpspi.c     |   2 +-
 drivers/spi/spi-gpio.c          |   8 +-
 drivers/spi/spi-lp8841-rtc.c    |   8 +-
 drivers/spi/spi-meson-spicc.c   |   2 +-
 drivers/spi/spi-mt65xx.c        |   2 +-
 drivers/spi/spi-pci1xxxx.c      |   2 +-
 drivers/spi/spi-pic32.c         |   2 +-
 drivers/spi/spi-rb4xx.c         |   2 +-
 drivers/spi/spi-slave-mt27xx.c  |   2 +-
 drivers/spi/spi-stm32.c         |   2 +-
 drivers/spi/spi-xtensa-xtfpga.c |   2 +-
 drivers/spi/spi.c               | 102 ++++++++---------
 include/linux/spi/spi.h         | 188 ++++++++++++++++++--------------
 18 files changed, 183 insertions(+), 165 deletions(-)

-- 
2.40.0.1.gaa8946217a0b

