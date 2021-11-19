Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6B345795F
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Nov 2021 00:12:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A60E178F;
	Sat, 20 Nov 2021 00:11:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A60E178F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637363535;
	bh=5eG/Kd3riu7qmU626qBW99tCdqOxfyIwccmd+iFj9HY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JrzScret5mAIejYCSV3LIbIfDkVf3P/ODtRXqsvCdM5N9cFkFs1YPylwbmIAuepiO
	 DN6rEH6g4nRzn8KiZHp3BP5pbTz5VG5T/gjS/B72XVnSsL901WK8/iCGiKBTDfmFpn
	 h4rjy0rg6ODmB/K+nM4eEKjWsE4MwffmWmlPj9tg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 856B9F80508;
	Sat, 20 Nov 2021 00:09:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 906C7F804DF; Sat, 20 Nov 2021 00:09:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C657F8012E
 for <alsa-devel@alsa-project.org>; Sat, 20 Nov 2021 00:09:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C657F8012E
X-IronPort-AV: E=McAfee;i="6200,9189,10173"; a="234456139"
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; d="scan'208";a="234456139"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 15:09:17 -0800
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; d="scan'208";a="496075713"
Received: from mredenti-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.30.252])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 15:09:16 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 2/4] ALSA: pcm: introduce INFO_NO_REWINDS flag
Date: Fri, 19 Nov 2021 17:08:50 -0600
Message-Id: <20211119230852.206310-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119230852.206310-1-pierre-louis.bossart@linux.intel.com>
References: <20211119230852.206310-1-pierre-louis.bossart@linux.intel.com>
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

When the hardware can only deal with a monotonically increasing
appl_ptr, this flag can be set.

In case the application requests a rewind, be it with a
snd_pcm_rewind() or with a direct change of a mmap'ed pointer followed
by a SNDRV_PCM_IOCTL_SYNC_PTR, this patch checks if a rewind
occurred and returns an error.

Credits to Takashi Iwai for identifying the path with SYNC_PTR and
suggesting the pointer checks.

Suggested-by: Takashi Iwai <tiwai@suse.de>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/uapi/sound/asound.h |  2 +-
 sound/core/pcm_lib.c        | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index 5fbb79e30819..ff7e638221c5 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -300,7 +300,7 @@ typedef int __bitwise snd_pcm_subformat_t;
 #define SNDRV_PCM_INFO_HAS_LINK_ESTIMATED_ATIME    0x04000000  /* report estimated link audio time */
 #define SNDRV_PCM_INFO_HAS_LINK_SYNCHRONIZED_ATIME 0x08000000  /* report synchronized audio/system time */
 #define SNDRV_PCM_INFO_EXPLICIT_SYNC	0x10000000	/* needs explicit sync of pointers and data */
-
+#define SNDRV_PCM_INFO_NO_REWINDS	0x20000000	/* hardware can only support monotonic changes of appl_ptr */
 #define SNDRV_PCM_INFO_DRAIN_TRIGGER	0x40000000		/* internal kernel flag - trigger in drain */
 #define SNDRV_PCM_INFO_FIFO_IN_FRAMES	0x80000000	/* internal kernel flag - FIFO size is in frames */
 
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index fdd992772b20..f2090025236b 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -2128,6 +2128,7 @@ int pcm_lib_apply_appl_ptr(struct snd_pcm_substream *substream,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	snd_pcm_uframes_t old_appl_ptr = runtime->control->appl_ptr;
+	snd_pcm_sframes_t diff;
 	int ret;
 
 	if (old_appl_ptr == appl_ptr)
@@ -2135,6 +2136,19 @@ int pcm_lib_apply_appl_ptr(struct snd_pcm_substream *substream,
 
 	if (appl_ptr >= runtime->boundary)
 		return -EINVAL;
+	/*
+	 * check if a rewind is requested by the application
+	 */
+	if (substream->runtime->info & SNDRV_PCM_INFO_NO_REWINDS) {
+		diff = appl_ptr - old_appl_ptr;
+		if (diff >= 0) {
+			if (diff > runtime->buffer_size)
+				return -EINVAL;
+		} else {
+			if (runtime->boundary + diff > runtime->buffer_size)
+				return -EINVAL;
+		}
+	}
 
 	runtime->control->appl_ptr = appl_ptr;
 	if (substream->ops->ack) {
-- 
2.25.1

