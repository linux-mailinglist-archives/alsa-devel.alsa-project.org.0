Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8E28BEE75
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2024 22:57:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 057F4B76;
	Tue,  7 May 2024 22:57:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 057F4B76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715115475;
	bh=l9R6ZctW1GwYtMEchDn8Z2hexXc1AAVmZaGYJc7SQHA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=EOnbNRqka4BBW6XvQ9aruNKTeIVbZ+QVkhuoH0yy6FgKHjrYuzAtGB575nU5M6Uug
	 11Q7W8gAKTzIEa9sjAj6RHKVgl698IzS7ALoeJF0rdPsHkRBNN1Sz8iKEe04mEXYQx
	 GGegmtXIFsn/Kl6FiVVPZrQo7OjDT3DxqAb22Pso=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14316F804FB; Tue,  7 May 2024 22:57:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 312B6F80564;
	Tue,  7 May 2024 22:57:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F25C6F8049C; Tue,  7 May 2024 22:57:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 184ABF8024C
	for <alsa-devel@alsa-project.org>; Tue,  7 May 2024 22:57:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 184ABF8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LZaoyzs5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715115432; x=1746651432;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=l9R6ZctW1GwYtMEchDn8Z2hexXc1AAVmZaGYJc7SQHA=;
  b=LZaoyzs5PILUbkZnzPl0WrurB2qrEumyhF+MAZ8FfLYbj35BFPy+lhXo
   ETI74h78SLyclrY5qUHhggHWbeC0gJ60RBkp0Anr4y9vt81D6W7iJ97wO
   1ABtwfDzcKM0zedBsC36AMPmF1HRY9d1Q8JG6UB5sYRHmYbmqOEFDuQpB
   UVUwAtMmzq1fn89DjICyGRoWNukzYXf1lIknwGbNT+4oqFjgHhp+YIpSA
   dbx5y7F0jSEVkFmKWbYrnvX7oZe2jRIOyyb2K2D3rDp/rCe0Z/fRx4FdC
   0VyauaJfEBybPo0Ps30seFWozFxD86W4vxGz0Qs9jbQ2kugvb1YTb4PJ/
   Q==;
X-CSE-ConnectionGUID: jrn9ekIUT4O95XFHNe0SKA==
X-CSE-MsgGUID: pO23xkK3Tuaa7bzFMGuGlA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="10810410"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000";
   d="scan'208";a="10810410"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 13:57:07 -0700
X-CSE-ConnectionGUID: vpB2YEaKQAGcaiAM27ZIHQ==
X-CSE-MsgGUID: L3kkAFj9RkCNx6BaeGvQCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000";
   d="scan'208";a="28636016"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 07 May 2024 13:57:04 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3D4FD12A; Tue, 07 May 2024 23:57:02 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] ASoC: atmel: tse850-pcm5142: Remove unused of_gpio.h
Date: Tue,  7 May 2024 23:56:59 +0300
Message-ID: <20240507205659.690270-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6LFMMIJ4QLLZF24JBP36YDRKNSWUAH25
X-Message-ID-Hash: 6LFMMIJ4QLLZF24JBP36YDRKNSWUAH25
X-MailFrom: andriy.shevchenko@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6LFMMIJ4QLLZF24JBP36YDRKNSWUAH25/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

of_gpio.h is deprecated and subject to remove.
The driver doesn't use it, simply remove the unused header.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/atmel/tse850-pcm5142.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/atmel/tse850-pcm5142.c b/sound/soc/atmel/tse850-pcm5142.c
index 611da23325d3..5d208e0b4b90 100644
--- a/sound/soc/atmel/tse850-pcm5142.c
+++ b/sound/soc/atmel/tse850-pcm5142.c
@@ -35,10 +35,9 @@
 // of the (filtered) output from the PCM5142 codec.
 
 #include <linux/clk.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/regulator/consumer.h>
 
 #include <sound/soc.h>
-- 
2.43.0.rc1.1336.g36b5255a03ac

