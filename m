Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 859C53D9047
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jul 2021 16:20:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13D671FF9;
	Wed, 28 Jul 2021 16:19:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13D671FF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627482040;
	bh=FUUDT5sq18KdBoGFQwwx5fz2ChBGDIexEQ2w9vsc6nU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LrgxwMARWgt2HORVZX+uvjqcKD8EMUpt8i5SLJpGYu6rmkGGsjtjXVrRtwLPc/7MJ
	 Mo2Y/p3tyRQQH7DArT5d3msVOpIvMesM80PYeSk2IqHC3e3vvZFxPaNdDS7TH39EVg
	 FmpljmPAcFS2Qn7CrMLuGrjCaLeDSqCLwr9GNsh4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A717BF8049E;
	Wed, 28 Jul 2021 16:19:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF279F802A9; Wed, 28 Jul 2021 16:19:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B768F8025A
 for <alsa-devel@alsa-project.org>; Wed, 28 Jul 2021 16:19:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B768F8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="pQRR+YtW"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="MLLFJWHo"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 537FB222E6;
 Wed, 28 Jul 2021 14:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627481972; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=kaAe2tctSDGmpkkqpHSuzOznzjbJsdBdtQPqcbVYt2E=;
 b=pQRR+YtWHfTQYBhAu5pR0RQdcKjfYn8AJnaElTjEYuAEyyP8fgxsS0tSW3UCNRCpSh4/8l
 q942K6YmVU9E9Z0+bPSuD1OCrSabgPe/f/hXwqb7HF4tJf6nHaF921GYhyOakjQGPiBIJp
 7IJ9EKQWr9t4WBVffzTNvoQfz2tkyUI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627481972;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=kaAe2tctSDGmpkkqpHSuzOznzjbJsdBdtQPqcbVYt2E=;
 b=MLLFJWHoc3QhsCMB86tCOzxELnHOU77Sjp8+1IJKNfZWquYTqw37WqFZVQs+algQ8GYCbG
 oHrPg1vJuNKn2GCw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 34CEDA3B8F;
 Wed, 28 Jul 2021 14:19:32 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: intel: skylake: Drop superfluous mmap callback
Date: Wed, 28 Jul 2021 16:19:30 +0200
Message-Id: <20210728141930.17740-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Mark Brown <broonie@kernel.org>,
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

skl_platform_soc_mmap() just calls the standard mmap helper, hence
it's superfluous.  Let's drop it.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/intel/skylake/skl-pcm.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index b1ca64d2f7ea..c604200de80e 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -1214,13 +1214,6 @@ static snd_pcm_uframes_t skl_platform_soc_pointer(
 	return bytes_to_frames(substream->runtime, pos);
 }
 
-static int skl_platform_soc_mmap(struct snd_soc_component *component,
-				 struct snd_pcm_substream *substream,
-				 struct vm_area_struct *area)
-{
-	return snd_pcm_lib_default_mmap(substream, area);
-}
-
 static u64 skl_adjust_codec_delay(struct snd_pcm_substream *substream,
 				u64 nsec)
 {
@@ -1460,7 +1453,6 @@ static const struct snd_soc_component_driver skl_component  = {
 	.trigger	= skl_platform_soc_trigger,
 	.pointer	= skl_platform_soc_pointer,
 	.get_time_info	= skl_platform_soc_get_time_info,
-	.mmap		= skl_platform_soc_mmap,
 	.pcm_construct	= skl_platform_soc_new,
 	.module_get_upon_open = 1, /* increment refcount when a pcm is opened */
 };
-- 
2.26.2

