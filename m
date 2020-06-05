Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A821EF0DD
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jun 2020 07:27:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2A071671;
	Fri,  5 Jun 2020 07:26:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2A071671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591334862;
	bh=Ka+X4XHpYnnlaPe3yIR4CZc0kjxe6zv0zHKMN4fYeYw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AfH2X6rl0MCmnSYglJ4/+VAavyFaJv1bthmgUHbPFJdwVE50rC+t0pbODpxwvs+Dx
	 txq0m7r8P9nOKqZPPMDr8hq/eS1jOAfmJjEpdH5xpvRZUiyZ2M6q9HWBMdej1PLNQT
	 GdnH3Y3CkoMIHCaf3jfnjT6aWVfGRNeGcye+EOYc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A209F801F5;
	Fri,  5 Jun 2020 07:26:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50CB9F80279; Fri,  5 Jun 2020 07:23:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=AC_FROM_MANY_DOTS,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB2DCF80140
 for <alsa-devel@alsa-project.org>; Fri,  5 Jun 2020 07:22:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB2DCF80140
IronPort-SDR: /DA0sgTRvHsFvjDopngiUxD6ccezK2WzuxqNw5WrO2aRU3d3AzEFJNEb8cB3QGxpej1W3R14jw
 uHmPUPfMoi/Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2020 22:22:06 -0700
IronPort-SDR: B5QqP5qmVw74d9jdE0JG+Y8HEn5QQ5cNbZx5hIrDkq/2OzuEveyB5dI2xJ/l8DAITSweIi5QUo
 oOhbQV+KOOsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,475,1583222400"; d="scan'208";a="259091128"
Received: from unknown (HELO jsia-HP-Z620-Workstation.png.intel.com)
 ([10.221.118.135])
 by fmsmga008.fm.intel.com with ESMTP; 04 Jun 2020 22:22:05 -0700
From: Sia Jee Heng <jee.heng.sia@intel.com>
To: <alsa-devel@alsa-project.org>
Subject: [PATCH v4 0/3] ASoC: Intel: Add KeemBay ASoC platform driver
Date: Fri,  5 Jun 2020 13:08:54 +0800
Message-Id: <1591333737-3231-1-git-send-email-jee.heng.sia@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: cezary.rojewski@intel.com, andriy.shevchenko@intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org
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

The below series of patches support the KeemBay ASoC platform driver.
The platform driver initialize the i2s to capture and playback the
pcm data on the ARM. The i2s is running in polling mode.

There is no DSP in the KeemBay SoC. Users are rely on the Gstreamer plugin
to perform Audio preprocessing.

Audio graph card is used to connect the platform driver with the
tlv320aic3204 codec.

Change History:
v4:
- Reduce if-otology at the tx/rx function.
- Fix indentation.
- specify .rate directly
 
v3:
- Adjusted header format.
- Use Audio graph card instead of custom sound card.
- Use if-else instead of conditional operator.
- Enabled .set_fmt to configure master clock.

v2:
- Corrected I2S naming for DT binding.

v1:
- Initial version.

Sia Jee Heng (3):
  ASoC: Intel: Add KeemBay platform driver
  ASoC: Intel: Add makefiles and kconfig changes for KeemBay
  dt-bindings: sound: Add documentation for KeemBay i2s

 .../bindings/sound/intel,keembay-i2s.yaml          |  68 +++
 sound/soc/intel/Kconfig                            |   7 +
 sound/soc/intel/Makefile                           |   1 +
 sound/soc/intel/keembay/Makefile                   |   4 +
 sound/soc/intel/keembay/kmb_platform.c             | 654 +++++++++++++++++++++
 sound/soc/intel/keembay/kmb_platform.h             | 145 +++++
 6 files changed, 879 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
 create mode 100644 sound/soc/intel/keembay/Makefile
 create mode 100644 sound/soc/intel/keembay/kmb_platform.c
 create mode 100644 sound/soc/intel/keembay/kmb_platform.h

-- 
1.9.1

