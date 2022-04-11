Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F3D4FC5B5
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Apr 2022 22:22:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1990417A0;
	Mon, 11 Apr 2022 22:21:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1990417A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649708547;
	bh=pkDFQnRzO9fgCTtOmq6hYf8ZlS+WZ987021bDWO1fts=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uUkiiBheZCJUlY10jl/rEvz61R9hdA9eP7kxn5X3h+BzGE9SbA6ir/p+K/iOy1sfh
	 fpclpjnOB6UIssbxH0CooAfID4/1Ho9MF+KP6H1UawbktGnVU4D8ZNreloyRoP7Pj+
	 mwRrZFK2jyB/wfJSXWHTlzMGO3D5pUdncWHzQMlI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B7A4F80578;
	Mon, 11 Apr 2022 22:18:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27F8BF80543; Mon, 11 Apr 2022 22:18:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86447F80506
 for <alsa-devel@alsa-project.org>; Mon, 11 Apr 2022 22:18:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86447F80506
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="g2nVGZO/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649708283; x=1681244283;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pkDFQnRzO9fgCTtOmq6hYf8ZlS+WZ987021bDWO1fts=;
 b=g2nVGZO/6xCXzVpezJNCfndFMUmstSMsqY2FKKKqvGj9glbZAe/CYMoN
 uPSZjzc5eBhf4rRHjgoLsS2dVaEV3V8MlLyicYIZFamr/+V3Y+UqUzTGB
 Y47ZG9PrSlgomC6iFR7YWOmhRCRWXSVXrrhtRxp+V3RuLqEu0lc2ngB+4
 6urwKQExykLelZH86/5GiXzUAjQITNendXpOrT55HBuY7EXbhdOFk5Pge
 qTk0lrn4z4LUzUrDvdQVkQ196ViVzieY/QKzDhqy+bfFISsUC50CnZAX9
 LsJzmc2b7a9+OdrQe5l/sCa49RhjOwZI4Lu5lrci3/3yrataH2T+opqC8 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="244090840"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="244090840"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 13:17:56 -0700
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="526135683"
Received: from prposam-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.162.151])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 13:17:56 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/16] ASoC: SOF: Intel: move HDA_CL_STREAM_FORMAT definition
 to header
Date: Mon, 11 Apr 2022 15:17:21 -0500
Message-Id: <20220411201727.77971-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220411201727.77971-1-pierre-louis.bossart@linux.intel.com>
References: <20220411201727.77971-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Use the definition of the HDA_CL_STREAM_FORMAT macro from the header
file.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 2 --
 sound/soc/sof/intel/hda.h        | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 697d18a41a6e..625bc1e67f1e 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -24,8 +24,6 @@
 #include "../sof-priv.h"
 #include "hda.h"
 
-#define HDA_CL_STREAM_FORMAT 0x40
-
 static void hda_ssp_set_cbp_cfp(struct snd_sof_dev *sdev)
 {
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 5d083ebbb886..cc55439ab187 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -588,6 +588,7 @@ int hda_dsp_ipc_cmd_done(struct snd_sof_dev *sdev, int dir);
  */
 int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev);
 int hda_dsp_cl_boot_firmware_iccmax(struct snd_sof_dev *sdev);
+#define HDA_CL_STREAM_FORMAT 0x40
 
 /* pre and post fw run ops */
 int hda_dsp_pre_fw_run(struct snd_sof_dev *sdev);
-- 
2.30.2

