Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D575C154988
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 17:45:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C7A616C7;
	Thu,  6 Feb 2020 17:44:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C7A616C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581007505;
	bh=7uHb20k3CSedFftPX1gmj2Kf7WQ7zlzpp8ysGPyOLEM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pT9PhibZ0CbXn2kBw5N1CF8WnikFL0dPlpDbI+Zt95dt98XtU0pvVgMCy1Ej1/rYb
	 OS5ImgygrZCuZ8w/bbzb/EBcGzSL/dLTvcqRua/vRWncKyNo4bNVbQqKCwVmV7W3PY
	 EKWah0me3v84/djXzAwVbPCo42DwZXZF3edzuS3M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51295F802A0;
	Thu,  6 Feb 2020 17:40:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D008CF80277; Thu,  6 Feb 2020 17:39:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C381F80255
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 17:39:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C381F80255
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 33F83AFB5
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 16:39:47 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu,  6 Feb 2020 17:39:42 +0100
Message-Id: <20200206163945.6797-6-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200206163945.6797-1-tiwai@suse.de>
References: <20200206163945.6797-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5/8] ALSA: pcm: Use standard macros for fixing
	PCM format cast
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

Simplify the code with the new macros for PCM format type iterations.
This fixes the sparse warnings nicely:
  sound/core/pcm_native.c:2302:26: warning: restricted snd_pcm_format_t degrades to integer
  sound/core/pcm_native.c:2306:54: warning: incorrect type in argument 1 (different base types)
  sound/core/pcm_native.c:2306:54:    expected restricted snd_pcm_format_t [usertype] format
  sound/core/pcm_native.c:2306:54:    got unsigned int [assigned] k
  ....

No functional changes, just sparse warning fixes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/oss/pcm_oss.c | 19 ++++++++-----------
 sound/core/pcm_native.c  | 15 ++++++++-------
 2 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index 13db77771f0f..707eb2a9d50c 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -884,20 +884,17 @@ static int snd_pcm_oss_change_params_locked(struct snd_pcm_substream *substream)
 		sformat = snd_pcm_plug_slave_format(format, sformat_mask);
 
 	if ((__force int)sformat < 0 ||
-	    !snd_mask_test(sformat_mask, (__force int)sformat)) {
-		for (sformat = (__force snd_pcm_format_t)0;
-		     (__force int)sformat <= (__force int)SNDRV_PCM_FORMAT_LAST;
-		     sformat = (__force snd_pcm_format_t)((__force int)sformat + 1)) {
-			if (snd_mask_test(sformat_mask, (__force int)sformat) &&
+	    !snd_mask_test_format(sformat_mask, sformat)) {
+		pcm_for_each_format(sformat) {
+			if (snd_mask_test_format(sformat_mask, sformat) &&
 			    snd_pcm_oss_format_to(sformat) >= 0)
-				break;
-		}
-		if ((__force int)sformat > (__force int)SNDRV_PCM_FORMAT_LAST) {
-			pcm_dbg(substream->pcm, "Cannot find a format!!!\n");
-			err = -EINVAL;
-			goto failure;
+				goto format_found;
 		}
+		pcm_dbg(substream->pcm, "Cannot find a format!!!\n");
+		err = -EINVAL;
+		goto failure;
 	}
+ format_found:
 	err = _snd_pcm_hw_param_set(sparams, SNDRV_PCM_HW_PARAM_FORMAT, (__force int)sformat, 0);
 	if (err < 0)
 		goto failure;
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 336406bcb59e..900f9cfd4646 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2293,21 +2293,21 @@ static int snd_pcm_hw_rule_mulkdiv(struct snd_pcm_hw_params *params,
 static int snd_pcm_hw_rule_format(struct snd_pcm_hw_params *params,
 				  struct snd_pcm_hw_rule *rule)
 {
-	unsigned int k;
+	snd_pcm_format_t k;
 	const struct snd_interval *i =
 				hw_param_interval_c(params, rule->deps[0]);
 	struct snd_mask m;
 	struct snd_mask *mask = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
 	snd_mask_any(&m);
-	for (k = 0; k <= SNDRV_PCM_FORMAT_LAST; ++k) {
+	pcm_for_each_format(k) {
 		int bits;
-		if (! snd_mask_test(mask, k))
+		if (!snd_mask_test_format(mask, k))
 			continue;
 		bits = snd_pcm_format_physical_width(k);
 		if (bits <= 0)
 			continue; /* ignore invalid formats */
 		if ((unsigned)bits < i->min || (unsigned)bits > i->max)
-			snd_mask_reset(&m, k);
+			snd_mask_reset(&m, (__force unsigned)k);
 	}
 	return snd_mask_refine(mask, &m);
 }
@@ -2316,14 +2316,15 @@ static int snd_pcm_hw_rule_sample_bits(struct snd_pcm_hw_params *params,
 				       struct snd_pcm_hw_rule *rule)
 {
 	struct snd_interval t;
-	unsigned int k;
+	snd_pcm_format_t k;
+
 	t.min = UINT_MAX;
 	t.max = 0;
 	t.openmin = 0;
 	t.openmax = 0;
-	for (k = 0; k <= SNDRV_PCM_FORMAT_LAST; ++k) {
+	pcm_for_each_format(k) {
 		int bits;
-		if (! snd_mask_test(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT), k))
+		if (!snd_mask_test_format(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT), k))
 			continue;
 		bits = snd_pcm_format_physical_width(k);
 		if (bits <= 0)
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
