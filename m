Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62ECE1A3B03
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Apr 2020 22:00:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3B8A16A3;
	Thu,  9 Apr 2020 22:00:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3B8A16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586462454;
	bh=czXu2bbORar3UGRjwBZfw4ENhKIjXB3g0KT2su3+v04=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J3/uoQ9Rb2GGyFS0ZtUwv+w2TL9NHlZrZWrjjx+t2IacI23KAL5X6ufmM91i7otAr
	 ElOgkkAJ3TrLQ8FfkwM8zlD8WRFAI5OFvlN4XAPQp31d81AA5mQeQQ+rH7XqfFwxCP
	 10P8XquXHw31KtxuJaHvE86Nx1Hse6yhSnzHTslc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDF40F80216;
	Thu,  9 Apr 2020 21:59:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84514F8025E; Thu,  9 Apr 2020 21:59:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68EDBF80107
 for <alsa-devel@alsa-project.org>; Thu,  9 Apr 2020 21:59:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68EDBF80107
IronPort-SDR: Whrt8gckmGuGTtqiR2kNifdss1Ha9JZfgmvdp4m6FtdOxRBlPjv4JxqhPD0ZLaBCUO1WJvI/qy
 nbPy3apVu9ZQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2020 12:58:59 -0700
IronPort-SDR: 5ugSmUDX84qekkZihqgqKgPZHq4JNVNb3vsJWkZtPUTvlhAYGaTaqD8CAnpZGibxC3K+ZIvWIx
 inHUo4KIxJeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; d="scan'208";a="242745271"
Received: from davidadu-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.151.218])
 by fmsmga007.fm.intel.com with ESMTP; 09 Apr 2020 12:58:57 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 00/16] ASoC/SOF/clk/gpio/dt: add Hifiberry DAC+ PRO support
Date: Thu,  9 Apr 2020 14:58:25 -0500
Message-Id: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
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

The Hifiberry DAC+ / DAC+ PRO is supported in the Raspberry PI tree
but until now not in the mainline and not for ACPI platforms.

This patchset implements the recommendations suggested by Mark Brown
back in 2018: first add a gpiochip in the PCM512x codec driver, then
use these gpios from a clock driver and the machine driver.

Since this patchset relies on different subsystems, sending as RFC for
now. I chose to import the original code from the Raspberry PI tree as
is, and add my changes on top. If there is a preference to squash the
changes that'd be fine. I also don't know if I should split this
series in two, one for ASoC and one for clk changes?

This patchset does not add changes to the sound/soc/bcm machine
drivers, but that should be trivial once all the gpio/clock is
available.

Thanks to Andy Shevchenko for his help navigating the gpio subsystem
and flagging mistakes in the use of lookup tables, and to Rob Herring
for pointers on the DT bindings verification tools.

Daniel Matuschek (1):
  clk: hifiberry-dacpro: initial import

Pierre-Louis Bossart (15):
  ASoC: pcm512x: expose 6 GPIOs
  ASoC: pcm512x: use "sclk" string to retrieve clock
  ASoC: Intel: sof-pcm512x: use gpiod for LED
  ASoC: Intel: sof-pcm512x: detect Hifiberry DAC+ PRO
  ASoC: Intel: sof-pcm512x: reconfigure sclk in hw_params if needed
  ASoC: Intel: sof-pcm512x: select HIFIBERRY_DACPRO clk
  clk: hifiberry-dacpro: update SDPX/copyright
  clk: hifiberry-dacpro: style cleanups, use devm_
  clk: hifiberry-dacpro: add OF dependency
  clk: hifiberry-dacpro: transition to _hw functions
  clk: hifiberry-dacpro: add ACPI support
  clk: hifiberry-dacpro: add "sclk" lookup
  clk: hifiberry-dacpro: toggle GPIOs on prepare/unprepare
  clk: hifiberry-dacpro: add delay on clock prepare/deprepare
  ASoC: dt-bindings: add document for Hifiberry DAC+ PRO clock

 .../bindings/sound/hifiberry-dacpro.yaml      |  38 +++
 drivers/clk/Kconfig                           |   4 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-hifiberry-dacpro.c            | 284 ++++++++++++++++++
 sound/soc/codecs/pcm512x.c                    | 134 ++++++++-
 sound/soc/intel/boards/Kconfig                |   2 +
 sound/soc/intel/boards/sof_pcm512x.c          | 190 +++++++++++-
 7 files changed, 635 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/hifiberry-dacpro.yaml
 create mode 100644 drivers/clk/clk-hifiberry-dacpro.c


base-commit: dd8e871d4e560eeb8d22af82dde91457ad835a63
-- 
2.20.1

