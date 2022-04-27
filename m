Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 998B851134A
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 10:10:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4612D17DE;
	Wed, 27 Apr 2022 10:09:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4612D17DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651047044;
	bh=RMAe9DE8UK4BUGS8njLPMU7bpr3X9ConfquBfnIOwEA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kbSOIfDXt91cZ7s/3mJ2fnhNILbAGmHakUOPtLstFkasW0/I1AtaOWQYVCBFcpNJ+
	 3Ls7TGu2lkmjLiR8n3nf+56/a2gkyzBra6Xf3H1SKbgzdv1mtle2KB0DUzCAzOAXyN
	 jk3/pEsV2ygko9Bl9XATPfDWA59oOXVbRjlNrJO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB1CEF80506;
	Wed, 27 Apr 2022 10:09:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2EC5AF804E2; Wed, 27 Apr 2022 10:09:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EE02F80100
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 10:09:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EE02F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="gG5x9PuJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651046948; x=1682582948;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RMAe9DE8UK4BUGS8njLPMU7bpr3X9ConfquBfnIOwEA=;
 b=gG5x9PuJpHC1ZYYFN6rVg4aVWFScJZREB/sjhCqGQZNQcfXg9/NXgBGB
 /Of5Sv7061vg/1AKAQLKQnTFLwQytdJbsrI2J5OdPQWvzFO3ii7DKKE1T
 KUaDpWbqA67nnME7IrJGMew6Z1Sw90zDlbhowDDDNOBRkaeaqLhrEY7rA
 qKaOuWwZoBCTQGg1PvT5NajIMSbFdt9FyN6i1Nkg7YJ7PjznkxXyK2v5w
 NuWF1Hui/muIkGbLPb7KYGhbvWIp6F/K6R/XZeaBYT7xg0124cFZehKQN
 cKkd7l48Rv+PNP3jKARB93OiNI2Mi4Pv9DZ1dLpJUdqS1nWz+TTqqplUc Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="291006161"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="291006161"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 01:09:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="705437316"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 27 Apr 2022 01:08:58 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 01/14] ALSA: Add snd_pcm_direction_name() helper
Date: Wed, 27 Apr 2022 10:18:49 +0200
Message-Id: <20220427081902.3525183-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427081902.3525183-1-cezary.rojewski@intel.com>
References: <20220427081902.3525183-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, rad@semihalf.com,
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

