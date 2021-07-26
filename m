Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FF03D7144
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jul 2021 10:32:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1483F1EE5;
	Tue, 27 Jul 2021 10:32:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1483F1EE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627374778;
	bh=Dwkvb3hxYY+j2Vnsw/BRT6IRTyTpLmQ7cqkqt7O78II=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UrNqq9mA/KLMeQZDIZwZ+okiNg99xQ16dOTSw2AeN2Ez/KpBPjoPfvblLvoL4L/HC
	 n6iRQWe28mY9IbDzV/4C2N16KCOmoaKx3mMHP6/pX+Xs3cq+lkoi3DXlqScCPeOURK
	 j2gZR6HYaSI8iQjV23TLUcclkNaxVLjfep3Drl6Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0D49F804F3;
	Tue, 27 Jul 2021 10:29:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B04BF8025A; Mon, 26 Jul 2021 16:01:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from forward106o.mail.yandex.net (forward106o.mail.yandex.net
 [IPv6:2a02:6b8:0:1a2d::609])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1F19F80132
 for <alsa-devel@alsa-project.org>; Mon, 26 Jul 2021 16:01:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1F19F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maquefel.me header.i=@maquefel.me
 header.b="G6jTHHuR"
Received: from myt6-d550f0f924f5.qloud-c.yandex.net
 (myt6-d550f0f924f5.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:2229:0:640:d550:f0f9])
 by forward106o.mail.yandex.net (Yandex) with ESMTP id B4EA95062EB5;
 Mon, 26 Jul 2021 17:01:19 +0300 (MSK)
Received: from myt3-07a4bd8655f2.qloud-c.yandex.net
 (myt3-07a4bd8655f2.qloud-c.yandex.net [2a02:6b8:c12:693:0:640:7a4:bd86])
 by myt6-d550f0f924f5.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 eWB6nHTdDt-1GIq8FDl; Mon, 26 Jul 2021 17:01:19 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
 t=1627308079; bh=LRSbGVRJ9emphCuBYDYrjTlOg7ii27hSBFD4d0sHKsU=;
 h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
 b=G6jTHHuRxls8ZjF1oSg3l5LSMPNSbVj+N80WHbaKZ4Gcr4dXQck9o36aj0VJj9+2a
 NgnRksCHJNIqxAMmazsy/0rj5kjwjzCmJySo349DRniV4+dmuvQwfyPQV34mTepLif
 PW7O/PEABbFwFvTiLgYkNL3ZbeFvI2Kja6BSqz04=
Authentication-Results: myt6-d550f0f924f5.qloud-c.yandex.net;
 dkim=pass header.i=@maquefel.me
Received: by myt3-07a4bd8655f2.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id olJ9yWy468-1E2ikl1L; Mon, 26 Jul 2021 17:01:15 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 0/8] arm: ep93xx: CCF conversion
Date: Mon, 26 Jul 2021 16:59:48 +0300
Message-Id: <20210726140001.24820-1-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210726115058.23729-1-nikita.shubin@maquefel.me>
References: <20210726115058.23729-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 27 Jul 2021 10:29:05 +0200
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>,
 "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Nikita Shubin <nikita.shubin@maquefel.me>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 YiFei Zhu <yifeifz2@illinois.edu>, Krzysztof Kozlowski <krzk@kernel.org>,
 "open list:INPUT KEYBOARD, MOUSE, JOYSTICK,
 TOUCHSCREEN..." <linux-input@vger.kernel.org>,
 "open list:PWM SUBSYSTEM" <linux-pwm@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Russell King <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
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

This series series of patches converts ep93xx to Common Clock Framework.

It consists of preparation patches to use clk_prepare_enable where it is 
needed, instead of clk_enable used in ep93xx drivers prior to CCF and
a patch converting mach-ep93xx/clock.c to CCF.

Link: https://lore.kernel.org/patchwork/cover/1445563/
Link: https://lore.kernel.org/patchwork/patch/1435884/

v1->v2:
- added SoB

Alexander Sverdlin (7):
  iio: ep93xx: Prepare clock before using it
  spi: spi-ep93xx: Prepare clock before using it
  Input: ep93xx_keypad: Prepare clock before using it
  video: ep93xx: Prepare clock before using it
  dmaengine: ep93xx: Prepare clock before using it
  ASoC: cirrus: i2s: Prepare clock before using it
  pwm: ep93xx: Prepare clock before using it

Nikita Shubin (1):
  ep93xx: clock: convert in-place to COMMON_CLK

 arch/arm/Kconfig                       |   2 +-
 arch/arm/mach-ep93xx/clock.c           | 975 ++++++++++++++-----------
 arch/arm/mach-ep93xx/core.c            |   2 +-
 arch/arm/mach-ep93xx/soc.h             |  42 +-
 drivers/dma/ep93xx_dma.c               |   6 +-
 drivers/iio/adc/ep93xx_adc.c           |   6 +-
 drivers/input/keyboard/ep93xx_keypad.c |   4 +-
 drivers/pwm/pwm-ep93xx.c               |  12 +-
 drivers/spi/spi-ep93xx.c               |   4 +-
 drivers/video/fbdev/ep93xx-fb.c        |   4 +-
 sound/soc/cirrus/ep93xx-i2s.c          |  12 +-
 11 files changed, 605 insertions(+), 464 deletions(-)


base-commit: 64376a981a0e2e57c46efa63197c2ebb7dab35df
-- 
2.26.2

