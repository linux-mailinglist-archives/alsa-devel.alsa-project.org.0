Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AD24215C2
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 19:57:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 230311687;
	Mon,  4 Oct 2021 19:56:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 230311687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633370256;
	bh=5Mm19lEvmsiT9dl2Mb200ew3o5RgXoydZPSlqd0Kmek=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o22uPO9YU8Z3lOKn4Lmp0AJAFMnKVT6YXiZFwoWqFmgWzteBsx7Rh5UbIRFsUeTJG
	 km4vd3xU5M+OuoHTMBNHTfDPlquKeccKOKCzktJyBe2PeF1w0fpXr8uVIBr1sGyyr/
	 vGAUkUbZ/SwhuNPYeLzuohU4uCUtP8GPtEXfuWag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FFF1F804AC;
	Mon,  4 Oct 2021 19:55:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5844FF80424; Mon,  4 Oct 2021 19:55:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2564F80229
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 19:55:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2564F80229
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="206334045"
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="206334045"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 09:24:38 -0700
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="558594216"
Received: from mbrescia-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.77.4])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 09:24:37 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 1/3] ALSA: pcm: introduce INFO_NO_REWINDS flag
Date: Mon,  4 Oct 2021 11:24:21 -0500
Message-Id: <20211004162423.85323-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004162423.85323-1-pierre-louis.bossart@linux.intel.com>
References: <20211004162423.85323-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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
appl_ptr, this flag can be set. In case the application requests a
rewind, snd_pcm_rewind() will not return an error code but signal that
the appl_ptr was not modified.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/uapi/sound/asound.h | 2 +-
 sound/core/pcm_native.c     | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index 1d84ec9db93b..bdb6f3c9db6c 100644
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
 
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index d233cb3b41d8..e3da2cc31a34 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2905,6 +2905,8 @@ static snd_pcm_sframes_t snd_pcm_rewind(struct snd_pcm_substream *substream,
 
 	if (frames == 0)
 		return 0;
+	if (substream->runtime->info & SNDRV_PCM_INFO_NO_REWINDS)
+		return 0;
 
 	snd_pcm_stream_lock_irq(substream);
 	ret = do_pcm_hwsync(substream);
-- 
2.25.1

