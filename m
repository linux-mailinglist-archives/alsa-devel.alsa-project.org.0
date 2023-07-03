Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDEA745DF2
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 15:54:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B315844;
	Mon,  3 Jul 2023 15:53:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B315844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688392466;
	bh=MvhTxjRQxN86NZW9US2cS3jRAx1NtAYDGutfkvlmQXc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LXfhtxWzQkLR/6KgBvdaZNf/uWnvoCRuXG3ZcTHQs/WsWo+OvmPGF1y9CrXBo6dpE
	 03W8SPrzKBCB9udKl/kmeDboTIenIm77XuWMQL1cyi8hDrLyaR4LT0opTy89MZiH8X
	 vizexiFysmXCxKCDgUVVStN0qrJJA1VSmCOUB3WM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BF5CF80568; Mon,  3 Jul 2023 15:52:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7564DF80548;
	Mon,  3 Jul 2023 15:52:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB480F80153; Mon,  3 Jul 2023 15:52:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B764BF80104
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 15:52:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B764BF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=m6N/DS6e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688392357; x=1719928357;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MvhTxjRQxN86NZW9US2cS3jRAx1NtAYDGutfkvlmQXc=;
  b=m6N/DS6eiWMlicHcq6jJv2dCahQjjgUw1Ga32uvH/DzkX9AWmULL2ySE
   hr1402HvdZWffJ2ZJHKtPWJYKsW+/Ht4uowAOfD5QK9kPfsoRrVLjLSy0
   +p/j1/uv7Ha/HOhO+6XRckZ1lNv1O20QouVdY3+A2uek+OiKStK+Btptg
   IaP4qNGTsl8YLhnnrMC7fY34VmhZ8AINpidUkaE3MrRjWJK90SigBH2C2
   mLlVI//cDJ2EHwEIMSXi04oa2D0S5HHnR9UW6uoGbUf3i+baNTX5QnzKN
   ubAHYoy+Mmtw3eUcRL3bLD/vJwJJMuogGzd1UymJKjpNxaOJfzT47+Ye1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="361744802"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200";
   d="scan'208";a="361744802"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2023 06:52:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="831839500"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200";
   d="scan'208";a="831839500"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 03 Jul 2023 06:52:27 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 02CF1178; Mon,  3 Jul 2023 16:52:30 +0300 (EEST)
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
Subject: [PATCH v2 3/4] lib/math/int_log: Replace LGPL-2.1-or-later
 boilerplate with SPDX identifier
Date: Mon,  3 Jul 2023 16:52:10 +0300
Message-Id: <20230703135211.87416-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230703135211.87416-1-andriy.shevchenko@linux.intel.com>
References: <20230703135211.87416-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZPJJ4426T46XXDWCZXTOUNVDXI5RI3GC
X-Message-ID-Hash: ZPJJ4426T46XXDWCZXTOUNVDXI5RI3GC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZPJJ4426T46XXDWCZXTOUNVDXI5RI3GC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Replace license boilerplate in udftime.c with SPDX identifier for
LGPL-2.1-or-later.

Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Link: https://lore.kernel.org/r/20230619172019.21457-4-andriy.shevchenko@linux.intel.com
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/int_log.h | 11 +----------
 lib/math/int_log.c      | 11 +----------
 2 files changed, 2 insertions(+), 20 deletions(-)

diff --git a/include/linux/int_log.h b/include/linux/int_log.h
index 332306202464..0a6f58c38b61 100644
--- a/include/linux/int_log.h
+++ b/include/linux/int_log.h
@@ -1,17 +1,8 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
 /*
  * Provides fixed-point logarithm operations.
  *
  * Copyright (C) 2006 Christoph Pfister (christophpfister@gmail.com)
- *
- * This library is free software; you can redistribute it and/or modify
- * it under the terms of the GNU Lesser General Public License as
- * published by the Free Software Foundation; either version 2.1 of
- * the License, or (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
- * GNU Lesser General Public License for more details.
  */
 
 #ifndef __LINUX_INT_LOG_H
diff --git a/lib/math/int_log.c b/lib/math/int_log.c
index ea98fc0b3fe2..8f9da3a2ad39 100644
--- a/lib/math/int_log.c
+++ b/lib/math/int_log.c
@@ -1,17 +1,8 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
 /*
  * Provides fixed-point logarithm operations.
  *
  * Copyright (C) 2006 Christoph Pfister (christophpfister@gmail.com)
- *
- * This library is free software; you can redistribute it and/or modify
- * it under the terms of the GNU Lesser General Public License as
- * published by the Free Software Foundation; either version 2.1 of
- * the License, or (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
- * GNU Lesser General Public License for more details.
  */
 
 #include <linux/bitops.h>
-- 
2.40.0.1.gaa8946217a0b

