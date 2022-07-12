Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0FE571979
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 14:10:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B759F1674;
	Tue, 12 Jul 2022 14:09:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B759F1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657627841;
	bh=QrH8W3YO9mjc+w9ngkiiuwL2WaFv+G7Gh49u15pZchg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UVzZcSFhsWhiYN4yrCPPbxjyQnbL965isy9v6uQYTgP3OFTmVQwCBLgjQKBLg2C2B
	 B24F1SDfmUU7gkIIXktreqCFaxhAVweYRtMcULL88sX9C4JK0I/KYfQbXcW0BVkJw1
	 XnEcAX0M0luuqq7M91jVJj0NXWA2tG1COWydIc5A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0078FF80543;
	Tue, 12 Jul 2022 14:09:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B771F8012B; Tue, 12 Jul 2022 14:09:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D429F80246
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 14:08:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D429F80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="J+yO4tw+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657627738; x=1689163738;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QrH8W3YO9mjc+w9ngkiiuwL2WaFv+G7Gh49u15pZchg=;
 b=J+yO4tw+AhAxXiSuqcJR0zy9MnYAR/eaO3CyhUt/fkFrRcGVzXnzyrGN
 E3puO3eAYtCCpZm9lut3Fe6fNmGgSJDZ+VSZvKnNh9YoOQ853g2+Rdn6+
 W9OtVcId/fu/QT1yHQvW8ZziS3OzwIQqTSZbi+6K2+QbDoi1GcHS5hQ1U
 guFHwUjKUDN54HRIVIXFZScrYmtFP1nPQujxH69WkdwbZ02kSggvDzcmw
 PTOGEgtXFED9joIsE/4cWsA9WxvFk5i2e56iU1qdc62aGayjCFChhWGRM
 XmBBFPkv3SbGLv+1+mHGL/0pxm3amYjeHRmOQPpecG+89KB6lpY/hp6wv A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="371225554"
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="371225554"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 05:08:55 -0700
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="545403354"
Received: from ahedstro-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.254.175])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 05:08:53 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 2/2] ASoC: SOF: Intel: hda: Skip IMR boot after a firmware
 crash or boot failure
Date: Tue, 12 Jul 2022 15:09:36 +0300
Message-Id: <20220712120936.28072-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220712120936.28072-1-peter.ujfalusi@linux.intel.com>
References: <20220712120936.28072-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

To make sure that we start from a clean state next time when the DSP is
powered up after a firmware crash or boot failure we must skip the IMR
booting attempt.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index eddfd77ad90f..671c3e02d7df 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -620,8 +620,13 @@ static int hda_suspend(struct snd_sof_dev *sdev, bool runtime_suspend)
 	/*
 	 * The memory used for IMR boot loses its content in deeper than S3 state
 	 * We must not try IMR boot on next power up (as it will fail).
+	 *
+	 * In case of firmware crash or boot failure set the skip_imr_boot to true
+	 * as well in order to try to re-load the firmware to do a 'cold' boot.
 	 */
-	if (sdev->system_suspend_target > SOF_SUSPEND_S3)
+	if (sdev->system_suspend_target > SOF_SUSPEND_S3 ||
+	    sdev->fw_state == SOF_FW_CRASHED ||
+	    sdev->fw_state == SOF_FW_BOOT_FAILED)
 		hda->skip_imr_boot = true;
 
 	hda_sdw_int_enable(sdev, false);
-- 
2.37.0

