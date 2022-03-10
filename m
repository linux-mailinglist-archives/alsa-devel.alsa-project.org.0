Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0364D5029
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 18:24:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEB8E1A26;
	Thu, 10 Mar 2022 18:23:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEB8E1A26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646933078;
	bh=5HUB0S/yA+cIcdUK0g898VTcm+oN/CC8sQ4wpRDHOF8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rcDEEGgDya3vwvlrGRVRBBbBchTVEt/C7URMae0J2Lr5e032xc3r3v+pvP5JRaYwR
	 J2+mxDf+ioWDmYadQ4AiDErvxdMSH6WuiUoAg6/TYS47TBchM3BuYCG4l03dSyCY0w
	 v7PkA7115BUkPlSGPJld1aZrXgEuke/NuU5r2rSc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53726F8051E;
	Thu, 10 Mar 2022 18:22:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1E72F80516; Thu, 10 Mar 2022 18:22:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3D20F8012C
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 18:22:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3D20F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="KR7PRLCH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646932970; x=1678468970;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5HUB0S/yA+cIcdUK0g898VTcm+oN/CC8sQ4wpRDHOF8=;
 b=KR7PRLCHUgahqIF1r8FkAM4069lGHaHOsr0f1wGTzv+ggZ/PR5SoM6bM
 YcsfrswalSVKL0rFFwfCiA9vrdZxb5PnKNRufhBWBsTJIMzwCab9n2X/h
 gpByOsvU+Os9TAWVJauQEoxmMeldY4lcu7keOE+rcmZzWEjWZoEQxJngG
 M1rAStJF6EM7owSaKECT9jWqYn8WCnDs3JpbNcwSEqgLa7Fq09EUwUB8H
 FO9Tr5Yp3rbtvfhbfBOkP0cAZX7pmfCWqG0IJ6lfT34BYzJljPLL3k/Kw
 XF5SF/5zBvqVmqKuO53aQrxMhSfHK+FojGncnKm5TiRfLygnCMXGWL6l5 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="235918917"
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; d="scan'208";a="235918917"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 09:22:41 -0800
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; d="scan'208";a="554738635"
Received: from maxdorn-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.77.185])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 09:22:40 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/5] ASoC: SOF: trace: Use proper DMA direction for the trace
 data buffer
Date: Thu, 10 Mar 2022 11:16:49 -0600
Message-Id: <20220310171651.249385-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220310171651.249385-1-pierre-louis.bossart@linux.intel.com>
References: <20220310171651.249385-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Buffers allocated with snd_dma_alloc_pages() will have DMA direction
DMA_BIDIRECTIONAL. The trace data memory is only used for one DMA
direction: DMA_FROM_DEVICE, DMA only writes there, never reads.

We also need to do a sync before accessing (reading with CPU) from the
trace data buffer to copy it to user space.

Note: snd_dma_buffer_sync() is also used for normal playback and capture
streams to make sure that the data is available for the DMA or CPU.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/trace.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/trace.c b/sound/soc/sof/trace.c
index 104388c551cb..ea8e4506d02e 100644
--- a/sound/soc/sof/trace.c
+++ b/sound/soc/sof/trace.c
@@ -320,6 +320,13 @@ static ssize_t sof_dfsentry_trace_read(struct file *file, char __user *buffer,
 	if (count > avail)
 		count = avail;
 
+	/*
+	 * make sure that all trace data is available for the CPU as the trace
+	 * data buffer might be allocated from non consistent memory.
+	 * Note: snd_dma_buffer_sync() is called for normal audio playback and
+	 *	 capture streams also.
+	 */
+	snd_dma_buffer_sync(&sdev->dmatb, SNDRV_DMA_SYNC_CPU);
 	/* copy available trace data to debugfs */
 	rem = copy_to_user(buffer, ((u8 *)(dfse->buf) + lpos), count);
 	if (rem)
@@ -464,8 +471,9 @@ int snd_sof_init_trace(struct snd_sof_dev *sdev)
 	}
 
 	/* allocate trace data buffer */
-	ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV_SG, sdev->dev,
-				  DMA_BUF_SIZE_FOR_TRACE, &sdev->dmatb);
+	ret = snd_dma_alloc_dir_pages(SNDRV_DMA_TYPE_DEV_SG, sdev->dev,
+				      DMA_FROM_DEVICE, DMA_BUF_SIZE_FOR_TRACE,
+				      &sdev->dmatb);
 	if (ret < 0) {
 		dev_err(sdev->dev,
 			"error: can't alloc buffer for trace %d\n", ret);
-- 
2.30.2

