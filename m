Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A46D4FC5B4
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Apr 2022 22:22:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18CA21799;
	Mon, 11 Apr 2022 22:21:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18CA21799
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649708533;
	bh=iO/oV/XAQw/WOIOFY2DdfwfKnxTAu0Lc+seRw6IAvIU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=asBve7q05zpasV6pcWVl2rQa+MjD8bmbbwuiSjo1MnbjqrDARiUhik3t9Ja5BfP9W
	 +VD+tZlHpYtuzTuaN58+EhYvql4VBAcWFomvl8Xu18yVbIg5o3di3xrDjANjIeqg9X
	 7pGNYDfAj7KptgjQorbB6X3g+wL6r1bRrXcm55eQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDA9EF80564;
	Mon, 11 Apr 2022 22:18:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9BEBF8053E; Mon, 11 Apr 2022 22:18:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7FC7F8032D
 for <alsa-devel@alsa-project.org>; Mon, 11 Apr 2022 22:18:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7FC7F8032D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="KH6/CkIw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649708283; x=1681244283;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iO/oV/XAQw/WOIOFY2DdfwfKnxTAu0Lc+seRw6IAvIU=;
 b=KH6/CkIwUrGGQTHHEdisV8fL93DL3ABAgpAlEFQEWAw0kpmGeuufrpGx
 ZOp4XzeflIXYNTNiTAPlemr4uJ70XQwpBMB/kTCcQaXJBgvOX1dpmFqmF
 XzNLDZXf7PNRFoMi+jDToHo7hSkftbYXjk6FLy4p0U+VYt2IQKWKtgH7D
 4uVYoeSfyl3O6h+QmqqB3ucpV9+Ys7pOcl43yfi0gj19oEMo+LREJXds5
 iFOmFKS55FnXN8ZGM5UAn1AMcMMeDjVEdBmGPWmYRYAgw6SApoF+5pk7H
 YZle6fxQ13X07jDgcQbLqBt8uoMIx/YeYVy3jJq0lAWfB+SFo3P0rFhUr w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="244090841"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="244090841"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 13:17:57 -0700
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="526135688"
Received: from prposam-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.162.151])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 13:17:56 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/16] ASoC: SOF: Intel: hda: use BIT() macros for consistency
Date: Mon, 11 Apr 2022 15:17:22 -0500
Message-Id: <20220411201727.77971-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220411201727.77971-1-pierre-louis.bossart@linux.intel.com>
References: <20220411201727.77971-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

BIT() macros should be used for all ADSPIC/IS registers.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index cc55439ab187..f7a93012b811 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -223,8 +223,8 @@
 #define HDA_DSP_REG_POLL_INTERVAL_US		500	/* 0.5 msec */
 #define HDA_DSP_REG_POLL_RETRY_COUNT		50
 
-#define HDA_DSP_ADSPIC_IPC			1
-#define HDA_DSP_ADSPIS_IPC			1
+#define HDA_DSP_ADSPIC_IPC			BIT(0)
+#define HDA_DSP_ADSPIS_IPC			BIT(0)
 
 /* Intel HD Audio General DSP Registers */
 #define HDA_DSP_GEN_BASE		0x0
@@ -268,8 +268,8 @@
 /* HIPCTE */
 #define HDA_DSP_REG_HIPCTE_MSG_MASK	0x3FFFFFFF
 
-#define HDA_DSP_ADSPIC_CL_DMA		0x2
-#define HDA_DSP_ADSPIS_CL_DMA		0x2
+#define HDA_DSP_ADSPIC_CL_DMA		BIT(1)
+#define HDA_DSP_ADSPIS_CL_DMA		BIT(1)
 
 /* Delay before scheduling D0i3 entry */
 #define BXT_D0I3_DELAY 5000
-- 
2.30.2

