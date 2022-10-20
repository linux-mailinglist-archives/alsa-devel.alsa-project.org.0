Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FFB605FE5
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 14:15:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C98EBB949;
	Thu, 20 Oct 2022 14:14:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C98EBB949
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666268126;
	bh=F0yyxL9IIrWO5mwvaxyN/JunjJhm+cv1o2vqf06c5ig=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GplZS2rAkIuiUmiijSYEoEzIIgH0UfrTtcvY+HOlBhD6aWj2f+18Gzq2HXvi88sfu
	 dLThlIgbSGJ20Qm4is+4ypxyk6Y4vkz0+Ep58BuhR2FymCnnS+5ORB4fWzOuauHy8U
	 F2qPGGgARkEgANr3s6+wyC/02TZfh6wUKJDOxC4o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEC9AF8057C;
	Thu, 20 Oct 2022 14:12:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C156F8056F; Thu, 20 Oct 2022 14:12:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF02BF8055B
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 14:12:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF02BF8055B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="KnFjyhI2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666267957; x=1697803957;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F0yyxL9IIrWO5mwvaxyN/JunjJhm+cv1o2vqf06c5ig=;
 b=KnFjyhI2nhYQSbVeypUuaSl9djjTxmfO9zMJbUyDfdDbGMmlCOB8/vPp
 ejcGGJXLkBiV7adPLTbsRcO+rWHO2aHCbVYffT5OtpA7STktYvJSn1w8U
 H6zsi2YyJyvTbF4Qc480qRlDLuSG+DQkyasyO0qLDesaiNh92/Y7Pteap
 C01Lq89DrkHq8I2znbIc//rlEkVrxPsBjRdoSEPIpy+Vqu7A+rE/LYdrC
 8vraIOhDr9gFRXag5/DlkxdP67H35RmChD77kPw8lYHKByxdSrKZt5hmq
 6eflwZ3EdLdYx5ktc+qUBAi6/ASTrRc40vsjBKecQ2pCpTujHQaaK5WB0 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="333256339"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="333256339"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 05:12:34 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="663009939"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="663009939"
Received: from awrynn-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.12.86])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 05:12:31 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 06/19] ASoC: SOF: Drop the firmware and fw_offset from
 snd_sof_pdata
Date: Thu, 20 Oct 2022 15:12:25 +0300
Message-Id: <20221020121238.18339-7-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221020121238.18339-1-peter.ujfalusi@linux.intel.com>
References: <20221020121238.18339-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 chao.song@intel.com
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
2.38.1

