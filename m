Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C2864058
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jul 2019 07:06:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5900E166A;
	Wed, 10 Jul 2019 07:05:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5900E166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562735192;
	bh=b3wIn/ksyicMaHIGX2RPhfMZTtJLb6wL3jx6W0ZJfOY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=taogGVB9N6eP7OonBxmw/JAbJCa0dxwGy9NOHCdQGqehxrWPf5tdUqkTVhYgft+uF
	 IIiztVilv6HaA8QdjM83kb+G7BW2xv2iLQiawRI2syOMkvrPQ8NYZF8zhvBKkj8LZn
	 tck5JFqwsiXF51Qm+NFcMMXNvsPw+84zgvbd6K0s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BEFFF802A1;
	Wed, 10 Jul 2019 07:04:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F00C9F802A1; Wed, 10 Jul 2019 07:04:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtprelay.hostedemail.com (smtprelay0229.hostedemail.com
 [216.40.44.229])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAFC1F800E2
 for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2019 07:04:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAFC1F800E2
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id 2D69B181D3403;
 Wed, 10 Jul 2019 05:04:33 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: help91_a3a1c1ec484c
X-Filterd-Recvd-Size: 2833
Received: from joe-laptop.perches.com (cpe-23-242-196-136.socal.res.rr.com
 [23.242.196.136]) (Authenticated sender: joe@perches.com)
 by omf06.hostedemail.com (Postfix) with ESMTPA;
 Wed, 10 Jul 2019 05:04:30 +0000 (UTC)
From: Joe Perches <joe@perches.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-wireless@vger.kernel.org,
 linux-media@vger.kernel.org
Date: Tue,  9 Jul 2019 22:04:13 -0700
Message-Id: <cover.1562734889.git.joe@perches.com>
X-Mailer: git-send-email 2.15.0
Cc: linux-iio@vger.kernel.org, devel@driverdev.osuosl.org,
 alsa-devel@alsa-project.org, linux-mmc@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [alsa-devel] [PATCH 00/12] treewide: Fix GENMASK misuses
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

These GENMASK uses are inverted argument order and the
actual masks produced are incorrect.  Fix them.

Add checkpatch tests to help avoid more misuses too.

Joe Perches (12):
  checkpatch: Add GENMASK tests
  clocksource/drivers/npcm: Fix misuse of GENMASK macro
  drm: aspeed_gfx: Fix misuse of GENMASK macro
  iio: adc: max9611: Fix misuse of GENMASK macro
  irqchip/gic-v3-its: Fix misuse of GENMASK macro
  mmc: meson-mx-sdio: Fix misuse of GENMASK macro
  net: ethernet: mediatek: Fix misuses of GENMASK macro
  net: stmmac: Fix misuses of GENMASK macro
  rtw88: Fix misuse of GENMASK macro
  phy: amlogic: G12A: Fix misuse of GENMASK macro
  staging: media: cedrus: Fix misuse of GENMASK macro
  ASoC: wcd9335: Fix misuse of GENMASK macro

 drivers/clocksource/timer-npcm7xx.c               |  2 +-
 drivers/gpu/drm/aspeed/aspeed_gfx.h               |  2 +-
 drivers/iio/adc/max9611.c                         |  2 +-
 drivers/irqchip/irq-gic-v3-its.c                  |  2 +-
 drivers/mmc/host/meson-mx-sdio.c                  |  2 +-
 drivers/net/ethernet/mediatek/mtk_eth_soc.h       |  2 +-
 drivers/net/ethernet/mediatek/mtk_sgmii.c         |  2 +-
 drivers/net/ethernet/stmicro/stmmac/descs.h       |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c |  4 ++--
 drivers/net/wireless/realtek/rtw88/rtw8822b.c     |  2 +-
 drivers/phy/amlogic/phy-meson-g12a-usb2.c         |  2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_regs.h  |  2 +-
 scripts/checkpatch.pl                             | 15 +++++++++++++++
 sound/soc/codecs/wcd-clsh-v2.c                    |  2 +-
 14 files changed, 29 insertions(+), 14 deletions(-)

-- 
2.15.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
