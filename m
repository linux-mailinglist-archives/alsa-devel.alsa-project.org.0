Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF04A735CFE
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jun 2023 19:23:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D9AA82B;
	Mon, 19 Jun 2023 19:22:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D9AA82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687195412;
	bh=pnBvaAXYA1YK+iYr+QnoTRToNMTLkN2QhhkWEfWRPa0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IGJfH5fhe55fGN8aazY0xSCPSr9zxAZHNWDzak9pyu96VsOrVEg+LZHHsHkfiEqEG
	 bqK7zJkzZPQxLmuOct1BCVu83famvFSEh+UGAYWewkKj8Y8GjN9NUPHzIWS9o2pfVj
	 C9GURZLAZd+cxunwGTWCykwOy79S4Dt9M8WJDZwE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 968C8F80544; Mon, 19 Jun 2023 19:22:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C47BFF80217;
	Mon, 19 Jun 2023 19:22:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3525CF8052D; Mon, 19 Jun 2023 19:22:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 12480F80217
	for <alsa-devel@alsa-project.org>; Mon, 19 Jun 2023 19:20:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12480F80217
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=atAXcDQU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687195227; x=1718731227;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pnBvaAXYA1YK+iYr+QnoTRToNMTLkN2QhhkWEfWRPa0=;
  b=atAXcDQU065G8eBf2+AB2yLqbhHzPrHbiD8O6phPoJOSb2u10nITlGfN
   xSk+cMsHSWHiOD+kExgLW/2REY8WZWPWM7HCzTkWgjiDTqdDXBjolmgcQ
   SLUpHlj05MKj9q45uMoiL3Altn8gRW8++/MMPAespm0bKuCqYO/CNZjBS
   G6lf8VUyaoDZnIHG2pFY/PpQuOntSFqFRakti8iAgy7FsaajDCRijzJ29
   e14kM0IX2vgxSjSZghh3BtH3wFS+fToddurw7+kvEN5NNiibK75BY3vMi
   g2DDkSw/a0LwOiNmDdEmErBdtEoLztrfakaAPUtTRMygiGi+0mmYVM+yi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="423342556"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400";
   d="scan'208";a="423342556"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 10:20:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="691150804"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400";
   d="scan'208";a="691150804"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 19 Jun 2023 10:20:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B84D4690; Mon, 19 Jun 2023 20:20:23 +0300 (EEST)
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
Subject: [PATCH v1 3/4] lib/math/int_log: Replace LGPL-2.1-or-later
 boilerplate with SPDX identifier
Date: Mon, 19 Jun 2023 20:20:18 +0300
Message-Id: <20230619172019.21457-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230619172019.21457-1-andriy.shevchenko@linux.intel.com>
References: <20230619172019.21457-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: R6UJOYSHCIT6MFFOKKS477NHS36XYKQ7
X-Message-ID-Hash: R6UJOYSHCIT6MFFOKKS477NHS36XYKQ7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R6UJOYSHCIT6MFFOKKS477NHS36XYKQ7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Replace license boilerplate in udftime.c with SPDX identifier for
LGPL-2.1-or-later.

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

