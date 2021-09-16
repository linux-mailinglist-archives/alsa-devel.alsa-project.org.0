Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EA740D511
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 10:51:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0B8717AA;
	Thu, 16 Sep 2021 10:50:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0B8717AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631782299;
	bh=pcxPujUf3ajGuTpzf24mbS6pfHMpnv1XKCRjOCFIPz8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XcWqDyzAW/w2qvlLo7oBkelpcZUHK6v5IIWXAmLu6bvCZuBEOGYrb8xLybP0ph3oS
	 SdF53aAk1yvqAEbb8cAr2OTb5KsDiK7BXWHKjiflkJamVUPlkfPYoptwMaL6T7Ddf4
	 ZYqW6/xMoWnX6mQMsgIH3aB8MknbaJpIck8vruv4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 198D7F80117;
	Thu, 16 Sep 2021 10:50:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79B71F8025E; Thu, 16 Sep 2021 10:50:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2809FF80113
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 10:50:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2809FF80113
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="202676174"
X-IronPort-AV: E=Sophos;i="5.85,297,1624345200"; d="scan'208";a="202676174"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 01:50:12 -0700
X-IronPort-AV: E=Sophos;i="5.85,297,1624345200"; d="scan'208";a="545443502"
Received: from gkapusti-mobl.ccr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.35.152])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 01:50:09 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, marc.herbert@intel.com
Subject: [PATCH] ASoC: SOF: loader: release_firmware() on load failure to
 avoid batching
Date: Thu, 16 Sep 2021 11:50:08 +0300
Message-Id: <20210916085008.28929-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

From: Marc Herbert <marc.herbert@intel.com>

Invoke release_firmware() when the firmware fails to boot in
sof_probe_continue().

The request_firmware() framework must be informed of failures in
sof_probe_continue() otherwise its internal "batching"
feature (different from caching) cached the firmware image
forever. Attempts to correct the file in /lib/firmware/ were then
silently and confusingly ignored until the next reboot. Unloading the
drivers did not help because from their disconnected perspective the
firmware had failed so there was nothing to release.

Also leverage the new snd_sof_fw_unload() function to simplify the
snd_sof_device_remove() function.

Signed-off-by: Marc Herbert <marc.herbert@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/core.c   | 4 +---
 sound/soc/sof/loader.c | 2 ++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 6be4f159ee35..20082c0f2f39 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -370,7 +370,6 @@ int snd_sof_device_remove(struct device *dev)
 			dev_warn(dev, "error: %d failed to prepare DSP for device removal",
 				 ret);
 
-		snd_sof_fw_unload(sdev);
 		snd_sof_ipc_free(sdev);
 		snd_sof_free_debug(sdev);
 		snd_sof_free_trace(sdev);
@@ -393,8 +392,7 @@ int snd_sof_device_remove(struct device *dev)
 		snd_sof_remove(sdev);
 
 	/* release firmware */
-	release_firmware(pdata->fw);
-	pdata->fw = NULL;
+	snd_sof_fw_unload(sdev);
 
 	return 0;
 }
diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 2b38a77cd594..9c3f251a0dd0 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -880,5 +880,7 @@ EXPORT_SYMBOL(snd_sof_run_firmware);
 void snd_sof_fw_unload(struct snd_sof_dev *sdev)
 {
 	/* TODO: support module unloading at runtime */
+	release_firmware(sdev->pdata->fw);
+	sdev->pdata->fw = NULL;
 }
 EXPORT_SYMBOL(snd_sof_fw_unload);
-- 
2.33.0

