Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C72E742FCB6
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 22:01:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64154187D;
	Fri, 15 Oct 2021 22:00:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64154187D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634328109;
	bh=ecQOJIIqa1ii0ARk4CfTEBj3o1TgHfga22ntUtAfYBw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tLZZ27M+evFf6+qEmH6I3HSq1aExs85fBMa5U9vdDSheZuFGVJwNgqr6zEpxNFDq5
	 X2OkmzgYg64ljBJHD9zJQ6gnCMgehHQuOqAnO8iATMEk57vC1Vm9tJ9a9JW6xN5UBX
	 h+7+L1FhDRr7GAYhi94INp6G34yhObrpyd0xPG7A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17DE5F804F2;
	Fri, 15 Oct 2021 21:59:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2229F804E5; Fri, 15 Oct 2021 21:59:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0585F80167
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 21:59:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0585F80167
X-IronPort-AV: E=McAfee;i="6200,9189,10138"; a="228257930"
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="228257930"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 12:59:42 -0700
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="593081853"
Received: from ssureshc-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.190.93])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 12:59:41 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 2/4] ALSA: pcm: introduce INFO_NO_REWINDS flag
Date: Fri, 15 Oct 2021 14:59:30 -0500
Message-Id: <20211015195932.224925-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015195932.224925-1-pierre-louis.bossart@linux.intel.com>
References: <20211015195932.224925-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Kai Vehmanen <kai.vehmanen@intel.com>, broonie@kernel.org,
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

When the hardware can only deal with a monotonically increasing
appl_ptr, this flag can be set.

In case the application requests a rewind, be it with a
snd_pcm_rewind() or with a direct change of a mmap'ed pointer followed
by a SNDRV_PCM_IOCTL_SYNC_PTR, this patch checks if a rewind
occurred and returns an error.

Credits to Takashi Iwai for identifying the path with SYNC_PTR and
suggesting the pointer checks.

Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@intel.com>
---
 include/uapi/sound/asound.h |  2 +-
 sound/core/pcm_lib.c        | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index 5859ca0a1439..59fcf39f022e 100644
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
index ec53a3e7cf35..1d3927aa3dd8 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -2127,6 +2127,7 @@ int pcm_lib_apply_appl_ptr(struct snd_pcm_substream *substream,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	snd_pcm_uframes_t old_appl_ptr = runtime->control->appl_ptr;
+	snd_pcm_sframes_t diff;
 	int ret;
 
 	if (old_appl_ptr == appl_ptr)
@@ -2134,6 +2135,19 @@ int pcm_lib_apply_appl_ptr(struct snd_pcm_substream *substream,
 
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

