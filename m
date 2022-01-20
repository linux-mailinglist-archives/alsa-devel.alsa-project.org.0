Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D554956A7
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jan 2022 00:18:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B64EF2DC6;
	Fri, 21 Jan 2022 00:17:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B64EF2DC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642720714;
	bh=jNTI7yW/IOUJdfB/x5+ZHcVKS8ZlYU/O+Ad0ItpeWYk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PuvXHFximIca+hPt4S1cO5MuW6rkh7k1ibHxjbK59t/D5bCv4Axbv7Nb2vmqt6p69
	 NXBWqqQyi7t0rzMtInw53AafpWG3JHqyLSHRVcyl1ADaMkHU13Kuj8/FXh1SAJs7aB
	 GwN3WFy5r6gjZAi+GqIfINIMu2ceFvh946IPE6g8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA128F8051E;
	Fri, 21 Jan 2022 00:16:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B0BFF80248; Fri, 21 Jan 2022 00:16:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97EA4F804BB
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 00:15:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97EA4F804BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="TvLsaQlr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642720553; x=1674256553;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jNTI7yW/IOUJdfB/x5+ZHcVKS8ZlYU/O+Ad0ItpeWYk=;
 b=TvLsaQlrWw6vO2eBpXEuudDkTJPgT3ShBWdIJgoh3KjDmktok0ytV0wR
 XWbqI3ZrLvTiuGkN1UwQLEnFcA1jnxBpa7ydLHdLEQDtoGsB1qMJ88vPR
 DHSv5G5+P8B/5MY91++IGCE9QY6jpUZbhSnZ11eHhehYbjWaNnBlUaEd8
 M89mb7gDA9NX1V2UNv5T61aJfgjAefvkS23ZT8zSfPl3yTMAEyY5mgmrj
 2W12L+x9DdmulB0dIRMhygmUcj/92//DzIQYHDM6BE8UsuW0dyZYhDcbX
 FXINUHDhVbFTR1p2XrPX8hnoVq2ToE1+TGlyZK+Z6YG+f//UB2GtMp4p+ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245721379"
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="245721379"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 15:15:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="672741402"
Received: from sthambit-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.64.44])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 15:15:43 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/5] ASoC: SOF: add flag to disable IMR restore to sof_debug
Date: Thu, 20 Jan 2022 17:15:32 -0600
Message-Id: <20220120231532.196926-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120231532.196926-1-pierre-louis.bossart@linux.intel.com>
References: <20220120231532.196926-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Keyon Jie <yang.jie@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

From: Keyon Jie <yang.jie@linux.intel.com>

Add flag _IGNORE_D3_PERSISTENT to disable IMR restore feature to
the sof_debug module parameter.

The IMR restore feature will be enabled for all Intel cAVS platforms by
default, but setting the flag _IGNORE_D3_PERSISTENT can help to disable
the feature for debug purpose, to rule out any possible regression
introduced by the change of not re-downloading firmware to the DSP at
resuming from suspended state.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 2 ++
 sound/soc/sof/sof-priv.h         | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index baf2ff146f50..6af3325b7e40 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -21,6 +21,7 @@
 #include <sound/sof.h>
 #include "ext_manifest.h"
 #include "../ops.h"
+#include "../sof-priv.h"
 #include "hda.h"
 
 #define HDA_CL_STREAM_FORMAT 0x40
@@ -396,6 +397,7 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 	int ret, ret1, i;
 
 	if ((sdev->fw_ready.flags & SOF_IPC_INFO_D3_PERSISTENT) &&
+	    !(sof_debug_check_flag(SOF_DBG_IGNORE_D3_PERSISTENT)) &&
 	    !sdev->first_boot) {
 		dev_dbg(sdev->dev, "IMR restore supported, booting from IMR directly\n");
 		return hda_dsp_boot_imr(sdev);
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 087935192ce8..29bb56b7267a 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -34,6 +34,9 @@
 							* on primary core
 							*/
 #define SOF_DBG_PRINT_ALL_DUMPS		BIT(6) /* Print all ipc and dsp dumps */
+#define SOF_DBG_IGNORE_D3_PERSISTENT		BIT(7) /* ignore the DSP D3 persistent capability
+							* and always download firmware upon D3 exit
+							*/
 
 /* Flag definitions used for controlling the DSP dump behavior */
 #define SOF_DBG_DUMP_REGS		BIT(0)
-- 
2.25.1

