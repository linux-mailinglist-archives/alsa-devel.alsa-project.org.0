Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB50735CFC
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jun 2023 19:21:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8FB9832;
	Mon, 19 Jun 2023 19:20:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8FB9832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687195290;
	bh=M8cpsIdLnXuuGWAJvDw9amJqINMPDXinMkvsofzWarg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tvt06BKIQhIcEoy+PVIl3/nZ73js95Um8+Y/Clej0FTBgEhq0i5bwtxuKReADvsNG
	 MYaaBTPc44QOwx3QlXzzQUBPMsNlxehLVwPvLYiasmvBIaOE3LwxYeM/+GxOwxECFT
	 Hja6gjLBxHlIoizM/0xMvOG/nOl6uOtPqzA5htcw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29618F80548; Mon, 19 Jun 2023 19:20:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D978F80448;
	Mon, 19 Jun 2023 19:20:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7AE1F8052D; Mon, 19 Jun 2023 19:20:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1AD2EF80132
	for <alsa-devel@alsa-project.org>; Mon, 19 Jun 2023 19:20:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AD2EF80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dwmbmTjG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687195225; x=1718731225;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=M8cpsIdLnXuuGWAJvDw9amJqINMPDXinMkvsofzWarg=;
  b=dwmbmTjGSMfMIgIDnXtXpyzZelxxiOnkwCqN3OLDqGUjYZwh6Z/s9lYU
   ex6sSC9zWiMNpZf+WzeUr4JppouLqeUkNxQEYoaBcPgJAZcngIAbtAZpW
   xbmbHvTsRU6ym22KPCSSSKO3IRvm2FH6QLZ4cNMD6mnmv08LT1PQSWf3O
   +MjYkJ+3dBy4AN5knyO0qZa7BsNBhnGcOW+D1NuRGlSqNJwkUzPOsuYK2
   TYspOlLL3FMOxAaQRYYWqxEBQ+NXTUAAyawemN124Qm1g8e2oHtrSPob8
   Yj6oukLEPrqxMeGRQtQ/QV/3KiLQSnCH+vfrVd8ytqgzJ4IoWyX527NDm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="363105836"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400";
   d="scan'208";a="363105836"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 10:20:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="960482500"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400";
   d="scan'208";a="960482500"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 19 Jun 2023 10:20:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 8B0323CC; Mon, 19 Jun 2023 20:20:23 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Mark Brown <broonie@kernel.org>,
	David Lin <CTLIN0@nuvoton.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Cc: Antti Palosaari <crope@iki.fi>,
	Sergey Kozlov <serjk@netup.ru>,
	Abylay Ospan <aospan@netup.ru>,
	Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>,
	Michael Krufky <mkrufky@linuxtv.org>,
	Matthias Schwarzott <zzam@gentoo.org>,
	Akihiro Tsukada <tskd08@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v1 0/4] ASoC: remove copy of intlog10()
Date: Mon, 19 Jun 2023 20:20:15 +0300
Message-Id: <20230619172019.21457-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KX57JCKACVIDVA3PAXLLMEJKMFG5QVVS
X-Message-ID-Hash: KX57JCKACVIDVA3PAXLLMEJKMFG5QVVS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KX57JCKACVIDVA3PAXLLMEJKMFG5QVVS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The first three patches moves intlog10() to be available in entire
kernel. The last one removes copy of it in one driver. Besides already
good Lines of Code (LoC) statistics the upcoming users, if any, can
utilize the exported functions.

The series can be routed either via ASoC tree or media tree.

Note, int_log.h is separated from math.h due to licensing.
I dunno if we can mix two in a single header file. In any
case we may do it later on.

Andy Shevchenko (4):
  lib/math: Move dvb_math.c into lib/math/int_log.c
  lib/math/int_log: Use ARRAY_SIZE(logtable) where makes sense
  lib/math/int_log: Replace LGPL-2.1-or-later boilerplate with SPDX
    identifier
  ASoC: nau8825: Replace copied'n'pasted intlog10()

 Documentation/driver-api/media/dtv-common.rst |  2 +-
 drivers/media/dvb-core/Makefile               |  2 +-
 drivers/media/dvb-frontends/af9013_priv.h     |  2 +-
 drivers/media/dvb-frontends/af9033_priv.h     |  2 +-
 drivers/media/dvb-frontends/cxd2820r_priv.h   |  2 +-
 drivers/media/dvb-frontends/cxd2841er.c       |  2 +-
 .../cxd2880/cxd2880_tnrdmd_dvbt2_mon.c        |  2 +-
 .../cxd2880/cxd2880_tnrdmd_dvbt_mon.c         |  2 +-
 .../media/dvb-frontends/cxd2880/cxd2880_top.c |  2 +-
 drivers/media/dvb-frontends/dib7000p.c        |  2 +-
 drivers/media/dvb-frontends/dib8000.c         |  2 +-
 drivers/media/dvb-frontends/dib9000.c         |  2 +-
 drivers/media/dvb-frontends/drxk_hard.c       |  2 +-
 drivers/media/dvb-frontends/lgdt3305.c        |  2 +-
 drivers/media/dvb-frontends/lgdt3306a.c       |  2 +-
 drivers/media/dvb-frontends/lgdt330x.c        |  2 +-
 drivers/media/dvb-frontends/m88ds3103_priv.h  |  2 +-
 drivers/media/dvb-frontends/mn88443x.c        |  2 +-
 drivers/media/dvb-frontends/mn88472_priv.h    |  2 +-
 drivers/media/dvb-frontends/mn88473_priv.h    |  2 +-
 drivers/media/dvb-frontends/or51132.c         |  2 +-
 drivers/media/dvb-frontends/or51211.c         |  2 +-
 drivers/media/dvb-frontends/rtl2830_priv.h    |  2 +-
 drivers/media/dvb-frontends/rtl2832_priv.h    |  2 +-
 drivers/media/dvb-frontends/si2165.c          |  2 +-
 drivers/media/dvb-frontends/stv0367.c         |  2 +-
 drivers/media/dvb-frontends/tc90522.c         |  2 +-
 drivers/media/dvb-frontends/tda10048.c        |  2 +-
 include/{media/dvb_math.h => linux/int_log.h} | 18 +---
 lib/math/Makefile                             |  2 +-
 .../dvb-core/dvb_math.c => lib/math/int_log.c | 26 ++----
 sound/soc/codecs/nau8825.c                    | 93 +------------------
 32 files changed, 45 insertions(+), 150 deletions(-)
 rename include/{media/dvb_math.h => linux/int_log.h} (63%)
 rename drivers/media/dvb-core/dvb_math.c => lib/math/int_log.c (84%)

-- 
2.40.0.1.gaa8946217a0b

