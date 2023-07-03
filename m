Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CDE745DDC
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 15:53:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BD851DD;
	Mon,  3 Jul 2023 15:52:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BD851DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688392415;
	bh=d7GySrGTjr8ZNAoiest4xrB1TTCUEMZaaC1CRETXOOo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FmUeabJSZ65KEKB/+5UaIENP+nfJqWYxTpQXZw5i2JzxjVEzZOxC6wagg4UZYErcO
	 0TZCkw/m+y9FQJpWqWg9E5EL9OVCa45yx3Oxg3W2Fn/k4zf1vRX5NBSfoWfq+56dXR
	 fHRatK2CLEFZ1x9fLKlOWHnJUd3T8EUP1imznBR4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67F92F80124; Mon,  3 Jul 2023 15:52:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD053F80132;
	Mon,  3 Jul 2023 15:52:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54A48F80153; Mon,  3 Jul 2023 15:52:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 24817F80093
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 15:52:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24817F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bX8VxuV8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688392350; x=1719928350;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=d7GySrGTjr8ZNAoiest4xrB1TTCUEMZaaC1CRETXOOo=;
  b=bX8VxuV8tZlyT6NYve3860Cp6bp5UuXNj8WlJcKNXSIUDGbyyfSmtV0B
   DO2tstMrnSQhLTAA6BBZ6iyrKZeOjyaneOjmpnMz0tM+Vlvz0kM5urVKf
   OuIeDZdj9FyD8aCg/3P0HGyvsGbmmrJ8jzI346w/JsFn4LHHnGwRg9tcG
   PM91KhtiVfTr8jH6/i/5xCqR2FnXFElAo3fcSUEQP8v1N4T0i4hO2vTk8
   Z7dFZldtW35ByDjVm1YIovQci8+877jmesYecUOPcg5u85VUz2sR0Uhjf
   v5Ov0wKwqplYKG5f/Txx+JXY3rNxmLQzEAgpHW/IgBtIWVerKrUWrBzgv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="365457297"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200";
   d="scan'208";a="365457297"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2023 06:52:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="721773868"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200";
   d="scan'208";a="721773868"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 03 Jul 2023 06:52:19 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id ADCC9170; Mon,  3 Jul 2023 16:52:22 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Mark Brown <broonie@kernel.org>,
	David Lin <CTLIN0@nuvoton.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	alsa-devel@alsa-project.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Antti Palosaari <crope@iki.fi>,
	Sergey Kozlov <serjk@netup.ru>,
	Abylay Ospan <aospan@netup.ru>,
	Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>,
	Michael Krufky <mkrufky@linuxtv.org>,
	Matthias Schwarzott <zzam@gentoo.org>,
	Akihiro Tsukada <tskd08@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 0/4] ASoC: remove copy of intlog10()
Date: Mon,  3 Jul 2023 16:52:07 +0300
Message-Id: <20230703135211.87416-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZK4A6VOBSXFPI366WHNNLUQYHQLMT2UB
X-Message-ID-Hash: ZK4A6VOBSXFPI366WHNNLUQYHQLMT2UB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZK4A6VOBSXFPI366WHNNLUQYHQLMT2UB/>
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

The series can be routed via ASoC tree (as Mauro suggested).

Note, int_log.h is separated from math.h due to licensing.
I dunno if we can mix two in a single header file. In any
case we may do it later on.

Changelog v2:
- moved kernel doc inclusion to the generic place (Mauro)
- added tags (Mauro, Mark)

Andy Shevchenko (4):
  lib/math: Move dvb_math.c into lib/math/int_log.c
  lib/math/int_log: Use ARRAY_SIZE(logtable) where makes sense
  lib/math/int_log: Replace LGPL-2.1-or-later boilerplate with SPDX
    identifier
  ASoC: nau8825: Replace copied'n'pasted intlog10()

 Documentation/core-api/kernel-api.rst         |  7 +-
 Documentation/driver-api/media/dtv-common.rst |  9 --
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
 33 files changed, 49 insertions(+), 160 deletions(-)
 rename include/{media/dvb_math.h => linux/int_log.h} (63%)
 rename drivers/media/dvb-core/dvb_math.c => lib/math/int_log.c (84%)

-- 
2.40.0.1.gaa8946217a0b

