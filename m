Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1ABA8723AC
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Mar 2024 17:08:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DAD8846;
	Tue,  5 Mar 2024 17:08:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DAD8846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709654897;
	bh=9u4MuvGx1V+56K9txq9pYyx3UFHJtGTgw8yFnAwt+r8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tFrW6PZreidDRldCZe63mXp1RfOhvhv7ICSIiWf3pVSkKnirdVyi0Za2XL4W2R4nE
	 ou0UTByCOAnbdRFMdjN0GIecaAuse2UFrLEQa/G5A/KLaoqur1zxOQEbNJ0EZu7q19
	 xOfda8MQrwp01NXr/ffkB0lwAMAZOSR4ocNllHos=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0868F8059F; Tue,  5 Mar 2024 17:07:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2C34F8057D;
	Tue,  5 Mar 2024 17:07:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 576A0F8024E; Tue,  5 Mar 2024 17:07:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96DD5F801F5
	for <alsa-devel@alsa-project.org>; Tue,  5 Mar 2024 17:07:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96DD5F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UMAjwJnx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709654853; x=1741190853;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9u4MuvGx1V+56K9txq9pYyx3UFHJtGTgw8yFnAwt+r8=;
  b=UMAjwJnxAGUQBfS4TIDNwogOEplaVuaIeram6yAKR14pG9SsdBE9CAn0
   BhX5S4QILcXmwFYHSXwbpVcMF9l598z8SEi5n3g1oQcDSGFcxB88V8hPq
   oH4nceivO5CixThw8rochWiV38MkHFCbfZT4cuF+VIuBUFBAlPLdmTfdb
   /A911yfGMs4Hbf7DEwdnR6DjrgYAbJoH92D9XRsWNlogn/gJCHGh+48r7
   CeT3xoRJv9eXkKjWTvjwRv1Uk4dzAN9pGk9goCY+E6+E+JUGq/7sY3lK2
   nLOQS43aIkJpHnO/rI3sONH4o6BYVico0Cglq9WgzUK4/oJb5MmHVNTsZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="14870238"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000";
   d="scan'208";a="14870238"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 08:07:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="937042660"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000";
   d="scan'208";a="937042660"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 05 Mar 2024 08:07:26 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E3D3B1A6; Tue,  5 Mar 2024 18:07:24 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v1 1/1] ASoC: Intel: atom: sst_ipc: Remove unused intel-mid.h
Date: Tue,  5 Mar 2024 18:07:22 +0200
Message-ID: <20240305160723.1363534-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: W4HULSBWOKU3JSI7YODGCQOA75WYMRUS
X-Message-ID-Hash: W4HULSBWOKU3JSI7YODGCQOA75WYMRUS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W4HULSBWOKU3JSI7YODGCQOA75WYMRUS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

intel-mid.h is providing some core parts of the South Complex PM,
which are usually are not used by individual drivers. In particular,
this driver doesn't use it, so simply remove the unused header.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/intel/atom/sst/sst_ipc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/atom/sst/sst_ipc.c b/sound/soc/intel/atom/sst/sst_ipc.c
index 3fc2c9a6c44d..0630e58b9d6b 100644
--- a/sound/soc/intel/atom/sst/sst_ipc.c
+++ b/sound/soc/intel/atom/sst/sst_ipc.c
@@ -19,8 +19,9 @@
 #include <sound/pcm.h>
 #include <sound/soc.h>
 #include <sound/compress_driver.h>
-#include <asm/intel-mid.h>
+
 #include <asm/platform_sst_audio.h>
+
 #include "../sst-mfld-platform.h"
 #include "sst.h"
 
-- 
2.43.0.rc1.1.gbec44491f096

