Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 590AD602B5B
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 14:11:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55DA29CD8;
	Tue, 18 Oct 2022 14:10:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55DA29CD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666095101;
	bh=5P62DW9xf2k+KmuQ0uQsQJVSWP+D+MMwtwWeRv1h9xg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FyuIzsneW1xAVaCkEqxUE7zvAor/JD5dS284P6c8k/CLiPvxH1IEa3va/5L6dx8Zv
	 4n5WtjFwGqDeMc8HzEkpqdlARbH95hmsqBsZgkJ2aE1/J2kV6cP38mt74Rp+1SFxp1
	 s9ciiSewohAICFfLPA8u0riz6B0OSGoy6Q94G0n0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0344F80564;
	Tue, 18 Oct 2022 14:09:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89D70F80567; Tue, 18 Oct 2022 14:09:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A8C4F80567
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 14:09:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A8C4F80567
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mTq2YPvo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666094964; x=1697630964;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5P62DW9xf2k+KmuQ0uQsQJVSWP+D+MMwtwWeRv1h9xg=;
 b=mTq2YPvoTC+vT3kSBadw19UxR/UO28/M6g7wwhjvtPRB9zeE3VewdFJ+
 JiGMilvxDG0JBH3pYdVDacEO5p0XsVfNUnl1i/Txt0pGC2O3C2gn7HWNL
 cXpqRgqfRfAG7VI2idPpMxL5Ij4PNBF+Mnbde6GoR9YvVaH6PzRmpYA7p
 F2usPit6Tvv4Hv5KdFM8oiri+pwxK+Y2Pe3FCzR1YlLS2s3nVSSUofqls
 kyGIBWDHhG52FyO6mHWO6a4nRYrHnAB3NUdNLlhRuLOJvWc872YnwQ7NN
 KVDCBkF8N3UmtLdpKiOcrZHazBK3g4thohq/kr/jL92jQTispTUnKqkQu w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="293452944"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="293452944"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:09:19 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="579757884"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="579757884"
Received: from mariaca1-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.27.127])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:09:07 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 06/19] ASoC: SOF: Drop the firmware and fw_offset from
 snd_sof_pdata
Date: Tue, 18 Oct 2022 15:09:03 +0300
Message-Id: <20221018120916.19820-7-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221018120916.19820-1-peter.ujfalusi@linux.intel.com>
References: <20221018120916.19820-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: chao.song@intel.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

The SOF stack now uses the sdev->basefw to work with the SOF firmware, the
information from plat_data can be dropped.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/sof.h    | 4 ----
 sound/soc/sof/loader.c | 9 ---------
 2 files changed, 13 deletions(-)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index 341fef19e612..e1f2f02666a7 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -59,15 +59,11 @@ enum sof_ipc_type {
  * SOF Platform data.
  */
 struct snd_sof_pdata {
-	const struct firmware *fw;
 	const char *name;
 	const char *platform;
 
 	struct device *dev;
 
-	/* indicate how many first bytes shouldn't be loaded into DSP memory. */
-	size_t fw_offset;
-
 	/*
 	 * notification callback used if the hardware initialization
 	 * can take time or is handled in a workqueue. This callback
diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 1e31b7c296e7..723bd8267a3d 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -58,12 +58,6 @@ int snd_sof_load_firmware_raw(struct snd_sof_dev *sdev)
 			fw_filename, ret);
 	}
 
-	/*
-	 * Until the platform code is switched to use the new container the fw
-	 * and payload offset must be set in plat_data
-	 */
-	plat_data->fw = sdev->basefw.fw;
-	plat_data->fw_offset = sdev->basefw.payload_offset;
 err:
 	kfree(fw_filename);
 
@@ -73,7 +67,6 @@ EXPORT_SYMBOL(snd_sof_load_firmware_raw);
 
 int snd_sof_load_firmware_memcpy(struct snd_sof_dev *sdev)
 {
-	struct snd_sof_pdata *plat_data = sdev->pdata;
 	int ret;
 
 	ret = snd_sof_load_firmware_raw(sdev);
@@ -108,7 +101,6 @@ int snd_sof_load_firmware_memcpy(struct snd_sof_dev *sdev)
 error:
 	release_firmware(sdev->basefw.fw);
 	sdev->basefw.fw = NULL;
-	plat_data->fw = NULL;
 	return ret;
 
 }
@@ -194,6 +186,5 @@ void snd_sof_fw_unload(struct snd_sof_dev *sdev)
 	/* TODO: support module unloading at runtime */
 	release_firmware(sdev->basefw.fw);
 	sdev->basefw.fw = NULL;
-	sdev->pdata->fw = NULL;
 }
 EXPORT_SYMBOL(snd_sof_fw_unload);
-- 
2.38.0

