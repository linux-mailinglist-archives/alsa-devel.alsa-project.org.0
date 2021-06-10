Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF333A3539
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Jun 2021 22:57:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BDCF17F6;
	Thu, 10 Jun 2021 22:57:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BDCF17F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623358674;
	bh=XpUgVnwM3lHg7Nb4lqCqRUbp5LRayUjLBJJGJaVqHRg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oJ9KeDk1lIGyv9N2O8Gjgimpr7hsAQZ+RlZ2cOivbYIqN4HFOw0QXbODdedZ2SFiX
	 BbgdNmjVXITrjROzLwzZBss2Jb3/qruxBtj68+Y6KtBeFtKRpMu0FKJfNLFWZ1u3oC
	 RVDHYu2cl1SzZ5wYKID3Heox+qO9vTB2BkHMZhqU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B22FF804E4;
	Thu, 10 Jun 2021 22:54:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7ED5DF804C2; Thu, 10 Jun 2021 22:54:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09738F804B3
 for <alsa-devel@alsa-project.org>; Thu, 10 Jun 2021 22:54:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09738F804B3
IronPort-SDR: uNvCNS7BQuYU+jV5FNxM8QgfarRhqzSMVR8CSvzWdNXuRyTToGi4q3E//+DV6zvj8AXCO2po+h
 FGIRUpj6/AoA==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="226812423"
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="226812423"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 13:53:53 -0700
IronPort-SDR: 2PLW9ZJ8YOydIH/1KJFXDe3OTcphEMguCu6IC1tsOQ4QfGZoTL2jrMQcXkzgFyUjFdyYrnONwP
 /LnbZlXSFUqw==
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="620183641"
Received: from umedepal-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.213.170.65])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 13:53:52 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 6/8] ALSA: pcm: conditionally avoid mmap of control data
Date: Thu, 10 Jun 2021 15:53:24 -0500
Message-Id: <20210610205326.1176400-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610205326.1176400-1-pierre-louis.bossart@linux.intel.com>
References: <20210610205326.1176400-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
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

In case of mmap, by default alsa-lib mmaps both control and status data.

If driver subscribes for application pointer update, driver needs to get
notification whenever appl ptr changes. With the above case driver won't
get appl ptr notifications.

This patch check on a hw info flag and returns error when user land asks
for mmaping control & status data, thus forcing user to issue
IOCTL_SYNC_PTR.

This patch was originally submitted in 2017, c.f.
https://lore.kernel.org/alsa-devel/1494896518-23399-4-git-send-email-subhransu.s.prusty@intel.com/

Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 include/uapi/sound/asound.h |  1 +
 sound/core/pcm_native.c     | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index 535a7229e1d9..e7566bfc106c 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -299,6 +299,7 @@ typedef int __bitwise snd_pcm_subformat_t;
 #define SNDRV_PCM_INFO_HAS_LINK_ABSOLUTE_ATIME     0x02000000  /* report absolute hardware link audio time, not reset on startup */
 #define SNDRV_PCM_INFO_HAS_LINK_ESTIMATED_ATIME    0x04000000  /* report estimated link audio time */
 #define SNDRV_PCM_INFO_HAS_LINK_SYNCHRONIZED_ATIME 0x08000000  /* report synchronized audio/system time */
+#define SNDRV_PCM_INFO_NO_STATUS_MMAP	0x10000000	/* status and control mmap not supported */
 
 #define SNDRV_PCM_INFO_DRAIN_TRIGGER	0x40000000		/* internal kernel flag - trigger in drain */
 #define SNDRV_PCM_INFO_FIFO_IN_FRAMES	0x80000000	/* internal kernel flag - FIFO size is in frames */
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 8dbe86cf2e4f..01f755ce54a8 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3810,11 +3810,13 @@ static int snd_pcm_mmap(struct file *file, struct vm_area_struct *area)
 	struct snd_pcm_file * pcm_file;
 	struct snd_pcm_substream *substream;	
 	unsigned long offset;
+	unsigned int info;
 	
 	pcm_file = file->private_data;
 	substream = pcm_file->substream;
 	if (PCM_RUNTIME_CHECK(substream))
 		return -ENXIO;
+	info = substream->runtime->hw.info;
 
 	offset = area->vm_pgoff << PAGE_SHIFT;
 	switch (offset) {
@@ -3825,6 +3827,13 @@ static int snd_pcm_mmap(struct file *file, struct vm_area_struct *area)
 	case SNDRV_PCM_MMAP_OFFSET_STATUS_NEW:
 		if (!pcm_status_mmap_allowed(pcm_file))
 			return -ENXIO;
+		/*
+		 * force fallback to ioctl if driver doesn't support status
+		 * and control mmap.
+		 */
+		if (info & SNDRV_PCM_INFO_NO_STATUS_MMAP)
+			return -ENXIO;
+
 		return snd_pcm_mmap_status(substream, file, area);
 	case SNDRV_PCM_MMAP_OFFSET_CONTROL_OLD:
 		if (pcm_file->no_compat_mmap || !IS_ENABLED(CONFIG_64BIT))
@@ -3833,6 +3842,14 @@ static int snd_pcm_mmap(struct file *file, struct vm_area_struct *area)
 	case SNDRV_PCM_MMAP_OFFSET_CONTROL_NEW:
 		if (!pcm_control_mmap_allowed(pcm_file))
 			return -ENXIO;
+
+		/*
+		 * force fallback to ioctl if driver doesn't support status
+		 * and control mmap.
+		 */
+		if (info & SNDRV_PCM_INFO_NO_STATUS_MMAP)
+			return -ENXIO;
+
 		return snd_pcm_mmap_control(substream, file, area);
 	default:
 		return snd_pcm_mmap_data(substream, file, area);
-- 
2.25.1

