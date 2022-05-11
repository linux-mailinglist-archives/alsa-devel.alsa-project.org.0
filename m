Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5171B523856
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 18:16:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5AC619FE;
	Wed, 11 May 2022 18:15:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5AC619FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652285765;
	bh=RMAe9DE8UK4BUGS8njLPMU7bpr3X9ConfquBfnIOwEA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RHjEbMTxu4jYLHkYsH1rOZ5iwsGa2zB00j0GsNcZwKv9kjMnpekJn8LmdIfOHoMlb
	 Fm5izPZOD19csjJyWbhdc4OOTHGHkHv5yUDjb/8Bw79jK3CGGkGsxzCQ655iS4Xs+i
	 YU68QaARH6W5NlE5fqhkztpbmVoF2sh70KiY9gwU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E540CF80508;
	Wed, 11 May 2022 18:14:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 307DBF804CB; Wed, 11 May 2022 18:14:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 782E9F80137
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 18:14:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 782E9F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ZKoaXRNV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652285672; x=1683821672;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RMAe9DE8UK4BUGS8njLPMU7bpr3X9ConfquBfnIOwEA=;
 b=ZKoaXRNVsDlU8SF2jnuBX9qnOyyCfx+DA8/Ft5Qaqps7+0fMmS14O9ev
 br+oGW0u8JW+PFYIK8l4xnliZ4BlIPi/AZA7z2IaUA4pPId0YimUCdZ6H
 O+dJDam1fpF68vCqAwEvljgkl/vWJ3ELpPefd4G3FsvnLyfds7QYcDgFr
 NdOkrM5igi9la9ItzbCPN0oJ2kCl0lj8NECp8tGq2aQ0zpzb3Vdw8oU8g
 w8h88Uo7cqt9iK16oMcsB2BxUIG15qq8aPUFsAhl1eKXR130gGwlWz9n/
 CyoAOa0fPebcUTSbWSVIUjop0uUJaDR159F6mFRkYBQnRUblJrNgV4d18 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="269679942"
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="269679942"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 09:14:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="594209658"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga008.jf.intel.com with ESMTP; 11 May 2022 09:14:23 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 01/14] ALSA: Add snd_pcm_direction_name() helper
Date: Wed, 11 May 2022 18:23:50 +0200
Message-Id: <20220511162403.3987658-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511162403.3987658-1-cezary.rojewski@intel.com>
References: <20220511162403.3987658-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 kai.vehmanen@linux.intel.com, harshapriya.n@intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

Allow for retrieving string naming a direction of a stream without the
need of substream pointer.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/pcm.h | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 6b99310b5b88..26523cfe428d 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1392,6 +1392,20 @@ static inline void snd_pcm_limit_isa_dma_size(int dma, size_t *max)
 
 const char *snd_pcm_format_name(snd_pcm_format_t format);
 
+/**
+ * snd_pcm_direction_name - Get a string naming the direction of a stream
+ * @direction: Stream's direction, one of SNDRV_PCM_STREAM_XXX
+ *
+ * Returns a string naming the direction of the stream.
+ */
+static inline const char *snd_pcm_direction_name(int direction)
+{
+	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
+		return "Playback";
+	else
+		return "Capture";
+}
+
 /**
  * snd_pcm_stream_str - Get a string naming the direction of a stream
  * @substream: the pcm substream instance
@@ -1400,10 +1414,7 @@ const char *snd_pcm_format_name(snd_pcm_format_t format);
  */
 static inline const char *snd_pcm_stream_str(struct snd_pcm_substream *substream)
 {
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		return "Playback";
-	else
-		return "Capture";
+	return snd_pcm_direction_name(substream->stream);
 }
 
 /*
-- 
2.25.1

