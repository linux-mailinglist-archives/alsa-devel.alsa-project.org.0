Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EE98BAE71
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2024 16:06:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 127D2820;
	Fri,  3 May 2024 16:06:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 127D2820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714745186;
	bh=qMWnTN+SructwynBCFegp/6wrzsKpLa8rhUnYzjvDEI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PgPrNKTFb7edq0y8/RhjJ0/LvfN7GZrj6XS1toLnXGUKd+EfZEA103fBa4ywT0fUA
	 ZHHhyqmovuDFc7tQLkdKJC1i4byv00fV6nh+Hq0m7G+PupXDf9FpQiK1qW4nbr605+
	 T/2cZxIq86ad7B/1IBsMAue1r/O1c6utWMQnHvVI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9461BF80570; Fri,  3 May 2024 16:04:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99228F80652;
	Fri,  3 May 2024 16:04:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53365F8060D; Fri,  3 May 2024 16:04:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C039AF8028D
	for <alsa-devel@alsa-project.org>; Fri,  3 May 2024 16:04:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C039AF8028D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Tt8IRvJL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714745072; x=1746281072;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qMWnTN+SructwynBCFegp/6wrzsKpLa8rhUnYzjvDEI=;
  b=Tt8IRvJLFhNXWPnVA665TNytpPG598bI/hd1co4O3IEbXmzaU+6BmM16
   TAED2oafZlKHntQjy16g0r+4Cbse+y6n0nKSCpXCeASY7NttmUxMW/P42
   T3dPaPNrGjNqhUYm4plbqDx7ihg1OVvXJN8b+e7d8jSAUgzj3GrHDBykf
   8aCrvBEkkjIQrwgK4JBDvJHB6D7BU6K1a4P+6tUXN4HSWvPS9GAfkwZqW
   rwXfmM9N6BUXToUDa17nX7O35X9FhQ9xYofUGaUM2ZJBwZxzGx7igDRkN
   dGReVdB3ONur5Ij1axdIvvi8J9Jv+3ZfYyAHsrkoZd0MRmE8tZMV7rve/
   w==;
X-CSE-ConnectionGUID: lFlTGAQaT+6VCHIH2vzTeQ==
X-CSE-MsgGUID: YFUD+kddR6SSrnVxarYbng==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="14369522"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="14369522"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 07:04:20 -0700
X-CSE-ConnectionGUID: a5AG6LEJScKWilLTCmy/wQ==
X-CSE-MsgGUID: C5pOhJxtRpqoc1FnLYHSMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="64908098"
Received: from sjslinke-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.113.3])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 07:04:20 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 4/9] ASoC: codecs: Intel: clarify Copyright information
Date: Fri,  3 May 2024 09:03:54 -0500
Message-Id: <20240503140359.259762-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240503140359.259762-1-pierre-louis.bossart@linux.intel.com>
References: <20240503140359.259762-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GFGOIQJUM7R4O4LIKPZO426RSRXDRAXX
X-Message-ID-Hash: GFGOIQJUM7R4O4LIKPZO426RSRXDRAXX
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GFGOIQJUM7R4O4LIKPZO426RSRXDRAXX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For some reason a number of files included the "All rights reserved"
statement. Good old copy-paste made sure this mistake proliferated.

Remove the "All rights reserved" in all Intel-copyright to align with
internal guidance.

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/codecs/hda-dai.c | 2 +-
 sound/soc/codecs/hda.c     | 2 +-
 sound/soc/codecs/hda.h     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/hda-dai.c b/sound/soc/codecs/hda-dai.c
index 7bd7ddcd810f..b9caae7e4817 100644
--- a/sound/soc/codecs/hda-dai.c
+++ b/sound/soc/codecs/hda-dai.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 //
-// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2021-2022 Intel Corporation
 //
 // Author: Cezary Rojewski <cezary.rojewski@intel.com>
 //
diff --git a/sound/soc/codecs/hda.c b/sound/soc/codecs/hda.c
index 5a58723dc0e9..ddc00927313c 100644
--- a/sound/soc/codecs/hda.c
+++ b/sound/soc/codecs/hda.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 //
-// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2021-2022 Intel Corporation
 //
 // Author: Cezary Rojewski <cezary.rojewski@intel.com>
 //
diff --git a/sound/soc/codecs/hda.h b/sound/soc/codecs/hda.h
index 78a2be4945b1..59308cc6afef 100644
--- a/sound/soc/codecs/hda.h
+++ b/sound/soc/codecs/hda.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+ * Copyright(c) 2021-2022 Intel Corporation
  *
  * Author: Cezary Rojewski <cezary.rojewski@intel.com>
  */
-- 
2.40.1

