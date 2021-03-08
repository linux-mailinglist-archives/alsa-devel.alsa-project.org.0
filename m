Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC61B3312EF
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Mar 2021 17:09:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A48518AC;
	Mon,  8 Mar 2021 17:08:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A48518AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615219753;
	bh=+ayh8DB6AjaU5LiEjo7XWkGZpwk8lbRyMmXrrzBRRqk=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uHpHsCZGcOEbc0aEqzFdleABuXsU6F4A2m+wGhcu/Q8jvwMRI9/a3GLKVZKCfAF3C
	 gyBKvtEc+6+Fb0rb/eS3xGmu5iCaMlh1t0fZZJtIaI5pZu86ifIcUiAOnccMNMOZIA
	 M6ZZk15Lyog97vqCf1KsFU25UaVmRdUsBLd5ikro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8F60F8016C;
	Mon,  8 Mar 2021 17:07:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61E90F801D8; Mon,  8 Mar 2021 17:07:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3DD1F80139
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 17:07:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3DD1F80139
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C9B48AB8C
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 16:07:27 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda: Drop the BATCH workaround for AMD controllers
Date: Mon,  8 Mar 2021 17:07:26 +0100
Message-Id: <20210308160726.22930-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The commit c02f77d32d2c ("ALSA: hda - Workaround for crackled sound on
AMD controller (1022:1457)") introduced a few workarounds for the
recent AMD HD-audio controller, and one of them is the forced BATCH
PCM mode so that PulseAudio avoids the timer-based scheduling.  This
was thought to cover for some badly working applications, but this
actually worsens for more others.  In total, this wasn't a good idea
to enforce it.

This is a partial revert of the commit above for dropping the PCM
BATCH enforcement part to recover from the regression again.

Fixes: c02f77d32d2c ("ALSA: hda - Workaround for crackled sound on AMD controller (1022:1457)")
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=195303
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_controller.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
index 9087981cd1f7..ca2f2ecd1488 100644
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/pci/hda/hda_controller.c
@@ -609,13 +609,6 @@ static int azx_pcm_open(struct snd_pcm_substream *substream)
 				     20,
 				     178000000);
 
-	/* by some reason, the playback stream stalls on PulseAudio with
-	 * tsched=1 when a capture stream triggers.  Until we figure out the
-	 * real cause, disable tsched mode by telling the PCM info flag.
-	 */
-	if (chip->driver_caps & AZX_DCAPS_AMD_WORKAROUND)
-		runtime->hw.info |= SNDRV_PCM_INFO_BATCH;
-
 	if (chip->align_buffer_size)
 		/* constrain buffer sizes to be multiple of 128
 		   bytes. This is more efficient in terms of memory
-- 
2.26.2

