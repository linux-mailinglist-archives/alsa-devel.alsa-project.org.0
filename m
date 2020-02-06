Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7751C154991
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 17:46:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27E33169D;
	Thu,  6 Feb 2020 17:45:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27E33169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581007577;
	bh=GrGLqizLvpBRwpm3lFPkKbGE99aPIdjWNYlsUah6pvE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NVUFVpwnftkOCjtozVoIZG/eQCeTfKsbtKfUeupUIxyUYelARWmqGk3dssj1csnAn
	 DAXKZftQyancwmelFBsG/BSfWl4Oj7z4roLDGwPNMnO4NUfXM7CoabAgpFhcHBVe+C
	 RtZmn2uZbFuKHL9wSt1TQ5FrCzbPvoudpSQ1qVnA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63CE0F802C4;
	Thu,  6 Feb 2020 17:40:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23E66F8028E; Thu,  6 Feb 2020 17:40:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D718F8015B
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 17:39:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D718F8015B
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 41355AFBA
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 16:39:47 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu,  6 Feb 2020 17:39:43 +0100
Message-Id: <20200206163945.6797-7-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200206163945.6797-1-tiwai@suse.de>
References: <20200206163945.6797-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 6/8] ALSA: pcm: Use a macro for parameter masks
	to reduce the needed cast
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The parameter bit mask needs often explicit cast with __force,
e.g. for the PCM subformat type.  Instead of adding __force at each
place, which is error prone, this patch introduces a new macro and
replaces the all bit shift with it.  This fixes the sparse warnings
like the following:
  sound/core/pcm_native.c:2508:30: warning: restricted snd_pcm_access_t degrades to integer

No functional changes, just sparse warning fixes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_native.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 900f9cfd4646..559633d4702d 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -228,6 +228,9 @@ int snd_pcm_info_user(struct snd_pcm_substream *substream,
 	return err;
 }
 
+/* macro for simplified cast */
+#define PARAM_MASK_BIT(b)	(1U << (__force int)(b))
+
 static bool hw_support_mmap(struct snd_pcm_substream *substream)
 {
 	if (!(substream->runtime->hw.info & SNDRV_PCM_INFO_MMAP))
@@ -257,7 +260,7 @@ static int constrain_mask_params(struct snd_pcm_substream *substream,
 			return -EINVAL;
 
 		/* This parameter is not requested to change by a caller. */
-		if (!(params->rmask & (1 << k)))
+		if (!(params->rmask & PARAM_MASK_BIT(k)))
 			continue;
 
 		if (trace_hw_mask_param_enabled())
@@ -271,7 +274,7 @@ static int constrain_mask_params(struct snd_pcm_substream *substream,
 
 		/* Set corresponding flag so that the caller gets it. */
 		trace_hw_mask_param(substream, k, 0, &old_mask, m);
-		params->cmask |= 1 << k;
+		params->cmask |= PARAM_MASK_BIT(k);
 	}
 
 	return 0;
@@ -293,7 +296,7 @@ static int constrain_interval_params(struct snd_pcm_substream *substream,
 			return -EINVAL;
 
 		/* This parameter is not requested to change by a caller. */
-		if (!(params->rmask & (1 << k)))
+		if (!(params->rmask & PARAM_MASK_BIT(k)))
 			continue;
 
 		if (trace_hw_interval_param_enabled())
@@ -307,7 +310,7 @@ static int constrain_interval_params(struct snd_pcm_substream *substream,
 
 		/* Set corresponding flag so that the caller gets it. */
 		trace_hw_interval_param(substream, k, 0, &old_interval, i);
-		params->cmask |= 1 << k;
+		params->cmask |= PARAM_MASK_BIT(k);
 	}
 
 	return 0;
@@ -349,7 +352,7 @@ static int constrain_params_by_rules(struct snd_pcm_substream *substream,
 	 * have 0 so that the parameters are never changed anymore.
 	 */
 	for (k = 0; k <= SNDRV_PCM_HW_PARAM_LAST_INTERVAL; k++)
-		vstamps[k] = (params->rmask & (1 << k)) ? 1 : 0;
+		vstamps[k] = (params->rmask & PARAM_MASK_BIT(k)) ? 1 : 0;
 
 	/* Due to the above design, actual sequence number starts at 2. */
 	stamp = 2;
@@ -417,7 +420,7 @@ static int constrain_params_by_rules(struct snd_pcm_substream *substream,
 					hw_param_interval(params, r->var));
 			}
 
-			params->cmask |= (1 << r->var);
+			params->cmask |= PARAM_MASK_BIT(r->var);
 			vstamps[r->var] = stamp;
 			again = true;
 		}
@@ -486,9 +489,9 @@ int snd_pcm_hw_refine(struct snd_pcm_substream *substream,
 
 	params->info = 0;
 	params->fifo_size = 0;
-	if (params->rmask & (1 << SNDRV_PCM_HW_PARAM_SAMPLE_BITS))
+	if (params->rmask & PARAM_MASK_BIT(SNDRV_PCM_HW_PARAM_SAMPLE_BITS))
 		params->msbits = 0;
-	if (params->rmask & (1 << SNDRV_PCM_HW_PARAM_RATE)) {
+	if (params->rmask & PARAM_MASK_BIT(SNDRV_PCM_HW_PARAM_RATE)) {
 		params->rate_num = 0;
 		params->rate_den = 0;
 	}
@@ -2506,16 +2509,16 @@ static int snd_pcm_hw_constraints_complete(struct snd_pcm_substream *substream)
 	unsigned int mask = 0;
 
         if (hw->info & SNDRV_PCM_INFO_INTERLEAVED)
-		mask |= 1 << SNDRV_PCM_ACCESS_RW_INTERLEAVED;
+		mask |= PARAM_MASK_BIT(SNDRV_PCM_ACCESS_RW_INTERLEAVED);
         if (hw->info & SNDRV_PCM_INFO_NONINTERLEAVED)
-		mask |= 1 << SNDRV_PCM_ACCESS_RW_NONINTERLEAVED;
+		mask |= PARAM_MASK_BIT(SNDRV_PCM_ACCESS_RW_NONINTERLEAVED);
 	if (hw_support_mmap(substream)) {
 		if (hw->info & SNDRV_PCM_INFO_INTERLEAVED)
-			mask |= 1 << SNDRV_PCM_ACCESS_MMAP_INTERLEAVED;
+			mask |= PARAM_MASK_BIT(SNDRV_PCM_ACCESS_MMAP_INTERLEAVED);
 		if (hw->info & SNDRV_PCM_INFO_NONINTERLEAVED)
-			mask |= 1 << SNDRV_PCM_ACCESS_MMAP_NONINTERLEAVED;
+			mask |= PARAM_MASK_BIT(SNDRV_PCM_ACCESS_MMAP_NONINTERLEAVED);
 		if (hw->info & SNDRV_PCM_INFO_COMPLEX)
-			mask |= 1 << SNDRV_PCM_ACCESS_MMAP_COMPLEX;
+			mask |= PARAM_MASK_BIT(SNDRV_PCM_ACCESS_MMAP_COMPLEX);
 	}
 	err = snd_pcm_hw_constraint_mask(runtime, SNDRV_PCM_HW_PARAM_ACCESS, mask);
 	if (err < 0)
@@ -2525,7 +2528,8 @@ static int snd_pcm_hw_constraints_complete(struct snd_pcm_substream *substream)
 	if (err < 0)
 		return err;
 
-	err = snd_pcm_hw_constraint_mask(runtime, SNDRV_PCM_HW_PARAM_SUBFORMAT, 1 << SNDRV_PCM_SUBFORMAT_STD);
+	err = snd_pcm_hw_constraint_mask(runtime, SNDRV_PCM_HW_PARAM_SUBFORMAT,
+					 PARAM_MASK_BIT(SNDRV_PCM_SUBFORMAT_STD));
 	if (err < 0)
 		return err;
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
