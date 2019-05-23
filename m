Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2890928DFF
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 01:43:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3182165F;
	Fri, 24 May 2019 01:42:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3182165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558655029;
	bh=b1LPHwcZbzS3A0I2dzKqy+PmeBa0i184Q4/eEBzgcU4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EK0UJws5GUaTYph4za0N50OsobXniPTZiC+waQnp6OVZDhEdi6UHidpy/o8EbHsci
	 a1isZ5Hln28Cjzc7K5gu9oFDrYORhA3e7thWDR4njb0QhL2n7sqiI3pmyf63qWkVp+
	 uIgGF/aioafZoybs9LCiUFo3n5XPfzLPBCokWziw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCFCAF8972C;
	Fri, 24 May 2019 01:40:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BC6BF89674; Fri, 24 May 2019 01:40:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E1F8F89674
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 01:40:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E1F8F89674
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 May 2019 16:40:34 -0700
X-ExtLoop1: 1
Received: from mgastonx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.128.35])
 by orsmga008.jf.intel.com with ESMTP; 23 May 2019 16:40:32 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 23 May 2019 18:39:47 -0500
Message-Id: <20190523233951.31122-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523233951.31122-1-pierre-louis.bossart@linux.intel.com>
References: <20190523233951.31122-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Daniel Drake <drake@endlessm.com>, Hui Wang <hui.wang@canonical.com>,
 Curtis Malainey <cujomalainey@google.com>, broonie@kernel.org
Subject: [alsa-devel] [RFC PATCH 2/6] ASoC: Intel: Skylake: move NHLT header
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
 sound/soc/intel/{skylake/skl-nhlt.h => common/intel-nhlt.h} | 0
 sound/soc/intel/skylake/skl-nhlt.c                          | 1 +
 sound/soc/intel/skylake/skl-ssp-clk.c                       | 1 +
 sound/soc/intel/skylake/skl-topology.c                      | 1 +
 sound/soc/intel/skylake/skl.h                               | 1 -
 5 files changed, 3 insertions(+), 1 deletion(-)
 rename sound/soc/intel/{skylake/skl-nhlt.h => common/intel-nhlt.h} (100%)

diff --git a/sound/soc/intel/skylake/skl-nhlt.h b/sound/soc/intel/common/intel-nhlt.h
similarity index 100%
rename from sound/soc/intel/skylake/skl-nhlt.h
rename to sound/soc/intel/common/intel-nhlt.h
diff --git a/sound/soc/intel/skylake/skl-nhlt.c b/sound/soc/intel/skylake/skl-nhlt.c
index 5d125a3df527..8c72b737c1fa 100644
--- a/sound/soc/intel/skylake/skl-nhlt.c
+++ b/sound/soc/intel/skylake/skl-nhlt.c
@@ -18,6 +18,7 @@
  *
  */
 #include <linux/pci.h>
+#include "../common/intel-nhlt.h"
 #include "skl.h"
 #include "skl-i2s.h"
 
diff --git a/sound/soc/intel/skylake/skl-ssp-clk.c b/sound/soc/intel/skylake/skl-ssp-clk.c
index cda1b5fa7436..55a066c22c81 100644
--- a/sound/soc/intel/skylake/skl-ssp-clk.c
+++ b/sound/soc/intel/skylake/skl-ssp-clk.c
@@ -14,6 +14,7 @@
 #include "skl.h"
 #include "skl-ssp-clk.h"
 #include "skl-topology.h"
+#include "../common/intel-nhlt.h"
 
 #define to_skl_clk(_hw)	container_of(_hw, struct skl_clk, hw)
 
diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index 389f1862bc43..a900c38328d5 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -30,6 +30,7 @@
 #include "skl.h"
 #include "../common/sst-dsp.h"
 #include "../common/sst-dsp-priv.h"
+#include "../common/intel-nhlt.h"
 
 #define SKL_CH_FIXUP_MASK		(1 << 0)
 #define SKL_RATE_FIXUP_MASK		(1 << 1)
diff --git a/sound/soc/intel/skylake/skl.h b/sound/soc/intel/skylake/skl.h
index 85f8bb6687dc..f0a15cb3d311 100644
--- a/sound/soc/intel/skylake/skl.h
+++ b/sound/soc/intel/skylake/skl.h
@@ -25,7 +25,6 @@
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
