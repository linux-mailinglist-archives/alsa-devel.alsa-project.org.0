Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33519523B5B
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 19:19:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB7F31A29;
	Wed, 11 May 2022 19:18:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB7F31A29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652289569;
	bh=qhsECxJCvVMPp5goI5j67BtgEHQ/iDt/oCoegMgp/QQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T1uC5T+nyDmnnNP/5IlN5DA8/+8FWt0WCdwTauVzB8cGlu1pGT4VbmpqMmhl7AtI6
	 HrQA/iB2KgU6AUDDJlDTEC7GkbwB8+YnVhqKDMFkoOhM5fnFqtVgRcPcdTOyVZ+8Rl
	 U+yj61lR1kI6eTL+6q25VVfj5T1uwFSMvYNGaq2o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC564F8052F;
	Wed, 11 May 2022 19:17:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15FEEF80528; Wed, 11 May 2022 19:17:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 547DCF804D8
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 19:17:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 547DCF804D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="jdZt1vgn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652289429; x=1683825429;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qhsECxJCvVMPp5goI5j67BtgEHQ/iDt/oCoegMgp/QQ=;
 b=jdZt1vgnd1EZmlW0OYN6MvPNl7dHunbQrkV+u3nbbxsgOw2xv/VFdJ1G
 fXlNlk2XkswAHSIic8bLprkreROm+A9S2LkbSBM0gmVSQ3Tl5AZNQ7Ale
 Sex8cF5drRDLSBbfLAnRTU6Li9kAmD08D5MCtDaIcA5k2IbTdQ1Z5AJGv
 ZrD+BqAzoYZ5HgIelYZqg2o24+qTabDPxogyeI+pA1YGV+D5g1HNvmmz4
 sgn4QhBteWjMLt9TZCn6WHE1YxpR3J4I5hTrTajW7mUtzxD6WmOFxG2Ga
 6GUHwxDg643VGW4ghhVGdM6c3kDY3ewApo7io/b0owUIBMwzixf/x3UY4 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="269431644"
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="269431644"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 10:16:56 -0700
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="697663185"
Received: from sjbrune-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.32.42])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 10:16:55 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/5] ASoC: SOF: Intel: HDA: Set up sof_ipc4_fw_data for IPC4
Date: Wed, 11 May 2022 10:16:48 -0700
Message-Id: <20220511171648.1622993-6-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511171648.1622993-1-ranjani.sridharan@linux.intel.com>
References: <20220511171648.1622993-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.com, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Allocate the sof_ipc4_fw_data struct for IPC4 and set the fw header offset
for the platforms which will be used by the core when loading the firmware
image.

The core expects that the "private" field in struct snd_sof_dev (which is
unused today with IPC3) is used to save this data.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/apl.c | 12 ++++++++++++
 sound/soc/sof/intel/cnl.c | 12 ++++++++++++
 sound/soc/sof/intel/tgl.c | 11 +++++++++++
 3 files changed, 35 insertions(+)

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index 4c67110a073e..0cea280a6d2d 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -15,6 +15,8 @@
  * Hardware interface for audio DSP on Apollolake and GeminiLake
  */
 
+#include <sound/sof/ext_manifest4.h>
+#include "../ipc4-priv.h"
 #include "../sof-priv.h"
 #include "hda.h"
 #include "../sof-audio.h"
@@ -46,6 +48,16 @@ int sof_apl_ops_init(struct snd_sof_dev *sdev)
 	}
 
 	if (sdev->pdata->ipc_type == SOF_INTEL_IPC4) {
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
 		sof_apl_ops.irq_thread	= hda_dsp_ipc4_irq_thread;
 
 		/* ipc */
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 7a22d7e4a46c..cd6e5f8a5eb4 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -15,7 +15,9 @@
  * Hardware interface for audio DSP on Cannonlake.
  */
 
+#include <sound/sof/ext_manifest4.h>
 #include <sound/sof/ipc4/header.h>
+#include "../ipc4-priv.h"
 #include "../ops.h"
 #include "hda.h"
 #include "hda-ipc.h"
@@ -344,6 +346,16 @@ int sof_cnl_ops_init(struct snd_sof_dev *sdev)
 	}
 
 	if (sdev->pdata->ipc_type == SOF_INTEL_IPC4) {
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
 		sof_cnl_ops.irq_thread	= cnl_ipc4_irq_thread;
 
 		/* ipc */
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index c93526591a91..1ddc492f1b13 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -9,6 +9,8 @@
  * Hardware interface for audio DSP on Tigerlake.
  */
 
+#include <sound/sof/ext_manifest4.h>
+#include "../ipc4-priv.h"
 #include "../ops.h"
 #include "hda.h"
 #include "hda-ipc.h"
@@ -79,6 +81,15 @@ int sof_tgl_ops_init(struct snd_sof_dev *sdev)
 	}
 
 	if (sdev->pdata->ipc_type == SOF_INTEL_IPC4) {
+		struct sof_ipc4_fw_data *ipc4_data;
+
+		sdev->private = devm_kzalloc(sdev->dev, sizeof(*ipc4_data), GFP_KERNEL);
+		if (!sdev->private)
+			return -ENOMEM;
+
+		ipc4_data = sdev->private;
+		ipc4_data->manifest_fw_hdr_offset = SOF_MAN4_FW_HDR_OFFSET;
+
 		/* doorbell */
 		sof_tgl_ops.irq_thread	= cnl_ipc4_irq_thread;
 
-- 
2.25.1

