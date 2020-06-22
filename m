Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BF8204DCD
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 11:22:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82BF31758;
	Tue, 23 Jun 2020 11:21:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82BF31758
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592904128;
	bh=oYLBCyAm5FjCC84dS7eX+Tasy/J+DICuuWBL7C/Gke8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hvMRX3EQlWFqgZkcATuTefJFWGnHVq1T6Yik8+PJT9UgeNxt9bUokhAU+rDwuSdBl
	 cE7kfLBSmRiXGZV2oZHbZzmc1dZtYA/AiU5CSniJEYRvDxy2s491HFC8cVHQX1zDJl
	 N1F0+j1V/OUkrhLD7aDMXTWzxbkN7DpvNdVd5Wi4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5729AF802DF;
	Tue, 23 Jun 2020 11:18:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89934F802C2; Tue, 23 Jun 2020 11:18:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45207F802A0
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 11:18:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45207F802A0
IronPort-SDR: FLoxJl4bzuarT0A+/a2BYgFI78fUOYnyy5c9ACvC7Uisop1AdydRt5ifZ3uhk1XKOZFAGMOOfQ
 LfVFtJMo1smg==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="145508158"
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; d="scan'208";a="145508158"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2020 02:18:01 -0700
IronPort-SDR: oQ2PXqOTHakAJqIPjIt0manH1QGCuU6ht7/b6NrbFiy2RQGGuzc/mAm3ojaUyyjtCYSvDDYYhQ
 PJ6p7ksSh+Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; d="scan'208";a="293142002"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga002.jf.intel.com with ESMTP; 23 Jun 2020 02:17:57 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 4/5] soundwire: cadence: allocate/free dma_data in
 set_sdw_stream
Date: Tue, 23 Jun 2020 05:23:31 +0800
Message-Id: <20200622212332.16277-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200622212332.16277-1-yung-chuan.liao@linux.intel.com>
References: <20200622212332.16277-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The current memory allocation is somewhat strange: the dma_data is
allocated in set_sdw_stream, but released in the intel DAI
shutdown. This no longer works with the multi-cpu implementation,
since the dma_data is released in the dai shutdown which takes place
before the dailink shutdown.

Move to a more symmetric allocation where the dma_data is allocated
with non-NULL SoundWire stream, and conversely released when a NULL
stream is provided - for consistency with the stream startup and
shutdown operations.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 52 ++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 14 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 5c0df066bfc6..24eafe0aa1c3 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -1439,25 +1439,49 @@ int cdns_set_sdw_stream(struct snd_soc_dai *dai,
 	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
 	struct sdw_cdns_dma_data *dma;
 
-	dma = kzalloc(sizeof(*dma), GFP_KERNEL);
-	if (!dma)
-		return -ENOMEM;
+	if (stream) {
+		/* first paranoia check */
+		if (direction == SNDRV_PCM_STREAM_PLAYBACK)
+			dma = dai->playback_dma_data;
+		else
+			dma = dai->capture_dma_data;
 
-	if (pcm)
-		dma->stream_type = SDW_STREAM_PCM;
-	else
-		dma->stream_type = SDW_STREAM_PDM;
+		if (dma) {
+			dev_err(dai->dev,
+				"dma_data already allocated for dai %s\n",
+				dai->name);
+			return -EINVAL;
+		}
 
-	dma->bus = &cdns->bus;
-	dma->link_id = cdns->instance;
+		/* allocate and set dma info */
+		dma = kzalloc(sizeof(*dma), GFP_KERNEL);
+		if (!dma)
+			return -ENOMEM;
 
-	dma->stream = stream;
+		if (pcm)
+			dma->stream_type = SDW_STREAM_PCM;
+		else
+			dma->stream_type = SDW_STREAM_PDM;
 
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = dma;
-	else
-		dai->capture_dma_data = dma;
+		dma->bus = &cdns->bus;
+		dma->link_id = cdns->instance;
 
+		dma->stream = stream;
+
+		if (direction == SNDRV_PCM_STREAM_PLAYBACK)
+			dai->playback_dma_data = dma;
+		else
+			dai->capture_dma_data = dma;
+	} else {
+		/* for NULL stream we release allocated dma_data */
+		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+			kfree(dai->playback_dma_data);
+			dai->playback_dma_data = NULL;
+		} else {
+			kfree(dai->capture_dma_data);
+			dai->capture_dma_data = NULL;
+		}
+	}
 	return 0;
 }
 EXPORT_SYMBOL(cdns_set_sdw_stream);
-- 
2.17.1

