Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF42954EAEA
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 22:20:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F1F91B00;
	Thu, 16 Jun 2022 22:20:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F1F91B00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655410853;
	bh=6WklOQ25jZMyFPZkPKq+nnZlQlQPdWmVSz0tllK2VRY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I/srNF37GMnFlzJNllixD3JzmyMB8rx1QKoeuyGuth+u3vhltd7n33NsGd6SPvIs9
	 c7N5JPQEhcJIRqvalrR/zylaTJyoNfwI2IifeLnn7SxVldMkmCjZoZ5fSijglcihmi
	 47nOCPCHPrVPJmXylBCm2A/ytstO6WwqmlWEolC0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9BBFF80537;
	Thu, 16 Jun 2022 22:18:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBA99F8052E; Thu, 16 Jun 2022 22:18:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39337F800F0
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 22:18:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39337F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="OpF9Glkq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655410731; x=1686946731;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6WklOQ25jZMyFPZkPKq+nnZlQlQPdWmVSz0tllK2VRY=;
 b=OpF9GlkqllK1jBNEC3qdAFkHKRVAEa0idaiIgucxnMCfFm1VdB5GEbnx
 Djm6BmOGXwX+KK4HVzB4n5z2bbfB3BWlvoxLX8jutoJxU4lejW0PpFsZ1
 37iiPhuiv+1hHSWWtoO6SUdrVPtp/bmI2U8VuD0mzZrGT7cxI9xInQP4/
 htb7dycRIWCnGZFb1sQibnsPB3Y+ghWBIoT5H+pxqxoLSs0rOmIPhDGVG
 puvJKX/RRj6rw1TfUsEakoD4M+mfTnZ3bMUkfmVMZ3m+uFriNrpIYi0ta
 A3i/ZExFgP3NYrSM9MXELSWy6dFXAjgb+rSPpiUrTBgjYXvY7aoqVBxyp g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="259803611"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="259803611"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 13:18:40 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="583771739"
Received: from buckkenx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.52.70])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 13:18:40 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ASoC: SOF: Intel: disable IMR boot when resuming from
 ACPI S4 and S5 states
Date: Thu, 16 Jun 2022 15:18:18 -0500
Message-Id: <20220616201818.130802-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616201818.130802-1-pierre-louis.bossart@linux.intel.com>
References: <20220616201818.130802-1-pierre-louis.bossart@linux.intel.com>
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

The IMR was assumed to be preserved when suspending to S4 and S5
states, but community reports invalidate that assumption, the hardware
seems to be powered off and the IMR memory content cleared.

Make sure regular boot with firmware download is used for S4 and S5.

BugLink: https://github.com/thesofproject/sof/issues/5892
Fixes: 5fb5f51185126 ("ASoC: SOF: Intel: hda-loader: add IMR restore support")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index bca9dc5917f42..819b3b08c6557 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -395,7 +395,8 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 	struct snd_dma_buffer dmab;
 	int ret, ret1, i;
 
-	if (hda->imrboot_supported && !sdev->first_boot) {
+	if (sdev->system_suspend_target < SOF_SUSPEND_S4 &&
+	    hda->imrboot_supported && !sdev->first_boot) {
 		dev_dbg(sdev->dev, "IMR restore supported, booting from IMR directly\n");
 		hda->boot_iteration = 0;
 		ret = hda_dsp_boot_imr(sdev);
-- 
2.34.1

