Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA266EBAF
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2019 22:41:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A08416E4;
	Fri, 19 Jul 2019 22:40:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A08416E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563568878;
	bh=WRDP+EWZEJB4zWaV7SbImKC8nNx7qMKtUn0K4gDaakM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yus8agkgvOjKMYs27Iw/sX8/C2t/RCwbU5/DlXmWOf2HHxagTixFmZM5ZcMSGDq6c
	 WxzKC+/tNoWPJSOA8OZ9NWYn3vO9rMBYIloyO+g0DNVAgyOr/0BgQBH3uY10URi2gj
	 6m7oOLtHzYaj/5+jF48O/06dKGQv/IAFKsJoUVAw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F104F803F4;
	Fri, 19 Jul 2019 22:38:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91002F80228; Fri, 19 Jul 2019 22:38:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23D55F80228
 for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2019 22:37:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23D55F80228
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jul 2019 13:37:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,283,1559545200"; d="scan'208";a="176389786"
Received: from hesheppa-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.255.92.1])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Jul 2019 13:37:54 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 19 Jul 2019 15:37:48 -0500
Message-Id: <20190719203752.11151-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719203752.11151-1-pierre-louis.bossart@linux.intel.com>
References: <20190719203752.11151-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Daniel Drake <drake@endlessm.com>, Hui Wang <hui.wang@canonical.com>,
 Curtis Malainey <cujomalainey@google.com>, broonie@kernel.org
Subject: [alsa-devel] [PATCH v2 1/5] ASoC: Intel: Skylake: move NHLT header
	to common directory
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Prepare move from NHLT code to common directory, starting with header.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/skylake/skl-nhlt.h => include/sound/intel-nhlt.h | 0
 sound/soc/intel/skylake/skl-nhlt.c                               | 1 +
 sound/soc/intel/skylake/skl-ssp-clk.c                            | 1 +
 sound/soc/intel/skylake/skl-topology.c                           | 1 +
 sound/soc/intel/skylake/skl.h                                    | 1 -
 5 files changed, 3 insertions(+), 1 deletion(-)
 rename sound/soc/intel/skylake/skl-nhlt.h => include/sound/intel-nhlt.h (100%)

diff --git a/sound/soc/intel/skylake/skl-nhlt.h b/include/sound/intel-nhlt.h
similarity index 100%
rename from sound/soc/intel/skylake/skl-nhlt.h
rename to include/sound/intel-nhlt.h
diff --git a/sound/soc/intel/skylake/skl-nhlt.c b/sound/soc/intel/skylake/skl-nhlt.c
index 1132109cb992..aabc5d71650e 100644
--- a/sound/soc/intel/skylake/skl-nhlt.c
+++ b/sound/soc/intel/skylake/skl-nhlt.c
@@ -9,6 +9,7 @@
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
 #include <linux/pci.h>
+#include <sound/intel-nhlt.h>
 #include "skl.h"
 #include "skl-i2s.h"
 
diff --git a/sound/soc/intel/skylake/skl-ssp-clk.c b/sound/soc/intel/skylake/skl-ssp-clk.c
index 5bb6e40d4d3e..5bfcd46452f9 100644
--- a/sound/soc/intel/skylake/skl-ssp-clk.c
+++ b/sound/soc/intel/skylake/skl-ssp-clk.c
@@ -11,6 +11,7 @@
 #include <linux/platform_device.h>
 #include <linux/clk-provider.h>
 #include <linux/clkdev.h>
+#include <sound/intel-nhlt.h>
 #include "skl.h"
 #include "skl-ssp-clk.h"
 #include "skl-topology.h"
diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index 6241e35213af..f8a501cf5fbd 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -12,6 +12,7 @@
 #include <linux/types.h>
 #include <linux/firmware.h>
 #include <linux/uuid.h>
+#include <sound/intel-nhlt.h>
 #include <sound/soc.h>
 #include <sound/soc-topology.h>
 #include <uapi/sound/snd_sst_tokens.h>
diff --git a/sound/soc/intel/skylake/skl.h b/sound/soc/intel/skylake/skl.h
index 6070666a6392..928e8115a1a7 100644
--- a/sound/soc/intel/skylake/skl.h
+++ b/sound/soc/intel/skylake/skl.h
@@ -16,7 +16,6 @@
 #include <sound/hdaudio_ext.h>
 #include <sound/hda_codec.h>
 #include <sound/soc.h>
-#include "skl-nhlt.h"
 #include "skl-ssp-clk.h"
 
 #define SKL_SUSPEND_DELAY 2000
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
