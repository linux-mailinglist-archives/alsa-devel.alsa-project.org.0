Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBE178B7E5
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Aug 2023 21:11:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F277874C;
	Mon, 28 Aug 2023 21:10:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F277874C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693249907;
	bh=4c1kOoowkqjKg3uw9yYzJPGCjAud6Ny2lyErKbD/U+I=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=cgULFDSQJnLdIEWwF3ew4JOajNjkElY5gCkLDIb1RS0NQ0xRg0jwOFWV92bAptaLj
	 VgzbiFhmVpvSW16wdXrsZrHZAbzqyCTGXLqKHkVMTiLldQuV86GlAFyxrY0pQj6dxR
	 O/IyhnHpFQLXC5uEerksn5dC7SW1+0dZB5kWRf74=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09501F8025F; Mon, 28 Aug 2023 21:10:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B4B0F80155;
	Mon, 28 Aug 2023 21:10:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7B3FF8023B; Mon, 28 Aug 2023 21:10:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=AC_FROM_MANY_DOTS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D585F80074
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 21:10:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D585F80074
X-IronPort-AV: E=Sophos;i="6.02,208,1688396400";
   d="scan'208";a="174239889"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 29 Aug 2023 04:10:21 +0900
Received: from localhost.localdomain (unknown [10.226.92.234])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id BF1E94054C86;
	Tue, 29 Aug 2023 04:10:17 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <x1077012@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 0/2] Match data improvements for tlv320aic32x4 driver
Date: Mon, 28 Aug 2023 20:10:12 +0100
Message-Id: <20230828191014.138310-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LEMPTB6557EB3XV3EZLTPQG4AFM6RBEW
X-Message-ID-Hash: LEMPTB6557EB3XV3EZLTPQG4AFM6RBEW
X-MailFrom: biju.das.jz@bp.renesas.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LEMPTB6557EB3XV3EZLTPQG4AFM6RBEW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch series aims to add match data improvements for tlv320aic32x4
driver.

This patch series is only compile tested.

v1->v2:
 * Created patch#1 for adding enum aic32x4_type to aic32x4_probe() and
   drop using dev_set_drvdata() from tlv320aic32x4_{i2c,spi} drivers.
 * Return value of i2c_get_match_data() passed to type paramemter in
   aic32x4_probe().

Biju Das (2):
  ASoC: codec: tlv320aic32x4: Add enum aic32x4_type to aic32x4_probe()
  ASoC: tlv320aic32x4-i2c: Simplify probe()

 sound/soc/codecs/tlv320aic32x4-i2c.c | 19 +++----------------
 sound/soc/codecs/tlv320aic32x4-spi.c |  7 ++++---
 sound/soc/codecs/tlv320aic32x4.c     |  5 +++--
 sound/soc/codecs/tlv320aic32x4.h     |  3 ++-
 4 files changed, 12 insertions(+), 22 deletions(-)

-- 
2.25.1

