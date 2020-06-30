Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4701421040B
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 08:42:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C170E1680;
	Wed,  1 Jul 2020 08:41:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C170E1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593585762;
	bh=tcpzQE8i26SuXvBF6hSs1Dh4vk/45y1ck1i9wkeCJN0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E9ml7Ef384s3OTa9jHzuYlVHm1nyb8qE9AksDfrhn3nZ3hCEXI76Duyo/erkVjWv4
	 8PhbU4njLVf3El5g1dYNmTZY4oStc6Zre2CWcVp0L9hqHuhPR6NQ4g05Y6YcKXYC/i
	 fwnibuU4KiS/UcRqnLqdgR6pqsg2AXfQ8mxYLusM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0678DF802E7;
	Wed,  1 Jul 2020 08:38:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1166F802DB; Wed,  1 Jul 2020 08:38:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CC5EF8020C
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 08:38:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CC5EF8020C
IronPort-SDR: ECo301srXZTCjAhA5q1Lpu/XUHw+GYVtCam/COc6RgaR0s3AypXAGs0x0goTZrWedGU1gKR6Rg
 GrQkinicCDqQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="126109916"
X-IronPort-AV: E=Sophos;i="5.75,299,1589266800"; d="scan'208";a="126109916"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 23:38:36 -0700
IronPort-SDR: eqYGQQd709q3rzrNxl2K3eQUl8IEWAC5nYrSvQ/PPtWAvZpcpSOkpDcA3FFXIUWB6Co2cS3rn5
 4N+ulvVItb0g==
X-IronPort-AV: E=Sophos;i="5.75,299,1589266800"; d="scan'208";a="454946965"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 23:38:32 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 4/5] soundwire: cadence: allocate/free dma_data in
 set_sdw_stream
Date: Wed,  1 Jul 2020 02:43:55 +0800
Message-Id: <20200630184356.24939-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200630184356.24939-1-yung-chuan.liao@linux.intel.com>
References: <20200630184356.24939-1-yung-chuan.liao@linux.intel.com>
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
index 9ea87538b9ef..613dbd415b91 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -1437,25 +1437,49 @@ int cdns_set_sdw_stream(struct snd_soc_dai *dai,
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

