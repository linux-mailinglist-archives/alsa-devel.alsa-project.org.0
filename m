Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D774C5B36A3
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 13:46:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BFD91674;
	Fri,  9 Sep 2022 13:46:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BFD91674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662724017;
	bh=/WqeoEyrUico1PVGAwTs4Q0csUk/dJYN6UBiVH4MaLc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ktGWwQq/rqNgv1zTtoN4vPXTEdJNhpnnv5VGaRz9htdGo0LRycmunpBveU09RN54O
	 8jA+bKX73rzu9iIO7i607/CkZfsQbox5knZ+JTwyZn+VSHwmCgmvjQtfiirupICEd2
	 wFbjRQLxDbb7QuzDIQyy6LMztyayVnHKrgjn9ckA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AA77F80578;
	Fri,  9 Sep 2022 13:43:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BADEF80533; Fri,  9 Sep 2022 13:43:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A43A6F80533
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 13:43:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A43A6F80533
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IAyZVK8X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662723827; x=1694259827;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/WqeoEyrUico1PVGAwTs4Q0csUk/dJYN6UBiVH4MaLc=;
 b=IAyZVK8XaauuNR+E++tXKalLDsoyRRvEkjAaQiJcq25Ga9QNpXiSgQCr
 Jd9vGm0f9g9UKSaR+oxina/G/iSs43nSy20Sbk5UIB/IJh61cKEvGVi93
 FIQ9/xdfExqGrPIwpgvaisWFKEORuYPiJ//nSUxcVcGY9Gso+bDumc3rJ
 gvYw5n5NNHfHA1kpsbrH17y5haosXB9CHa1TP9MhIcxLpELNUVkm9xKuF
 sYVxo3rBRIS/H2Oxkhask6UdMbPIDDJCOodSFG0VA2Sk6ibuWC1M10pO1
 j5DLfWzkDKg3X8Bwt052LCBz2JFIHWyrQevuiDVAvDerGWQXO8NulOoEY Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="359180118"
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="359180118"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 04:43:45 -0700
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="683613888"
Received: from desharpe-mobl1.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.0.89])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 04:43:43 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 6/7] ASoC: SOF: Intel: icl: Set IPC4-specific DSP ops
Date: Fri,  9 Sep 2022 14:43:31 +0300
Message-Id: <20220909114332.31393-7-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220909114332.31393-1-peter.ujfalusi@linux.intel.com>
References: <20220909114332.31393-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, rander.wang@intel.com
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

Add implementation of low level, platform dependent IPC4 message handling
and set the DSP ops for IPC4 for ICL platform.

Suggested-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/icl.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
index 4e37b7fe0627..6a8af2d3b580 100644
--- a/sound/soc/sof/intel/icl.c
+++ b/sound/soc/sof/intel/icl.c
@@ -13,6 +13,7 @@
 #include <linux/kconfig.h>
 #include <linux/export.h>
 #include <linux/bits.h>
+#include "../ipc4-priv.h"
 #include "../ops.h"
 #include "hda.h"
 #include "hda-ipc.h"
@@ -106,11 +107,30 @@ int sof_icl_ops_init(struct snd_sof_dev *sdev)
 	/* probe/remove/shutdown */
 	sof_icl_ops.shutdown	= hda_dsp_shutdown;
 
-	/* doorbell */
-	sof_icl_ops.irq_thread	= cnl_ipc_irq_thread;
+	if (sdev->pdata->ipc_type == SOF_IPC) {
+		/* doorbell */
+		sof_icl_ops.irq_thread	= cnl_ipc_irq_thread;
 
-	/* ipc */
-	sof_icl_ops.send_msg	= cnl_ipc_send_msg;
+		/* ipc */
+		sof_icl_ops.send_msg	= cnl_ipc_send_msg;
+	}
+
+	if (sdev->pdata->ipc_type == SOF_INTEL_IPC4) {
+		struct sof_ipc4_fw_data *ipc4_data;
+
+		sdev->private = devm_kzalloc(sdev->dev, sizeof(*ipc4_data), GFP_KERNEL);
+		if (!sdev->private)
+			return -ENOMEM;
+
+		ipc4_data = sdev->private;
+		ipc4_data->manifest_fw_hdr_offset = SOF_MAN4_FW_HDR_OFFSET;
+
+		/* doorbell */
+		sof_icl_ops.irq_thread	= cnl_ipc4_irq_thread;
+
+		/* ipc */
+		sof_icl_ops.send_msg	= cnl_ipc4_send_msg;
+	}
 
 	/* debug */
 	sof_icl_ops.debug_map	= icl_dsp_debugfs;
-- 
2.37.3

