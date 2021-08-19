Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8F93F1CD1
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Aug 2021 17:31:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B9AB168C;
	Thu, 19 Aug 2021 17:30:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B9AB168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629387090;
	bh=Kaav/O4YI4DSLck9fR/RnPI0JouY2yuYYFYwdQPYHPo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KUkygTa3MVpIrI3CWm3tFXwOrR69NCQF1FuNQthCI3EOONpzmkPDiyfa2x1o5qVL/
	 cohYbFFBSIyISJJjFzrWBluJa1jeP4R5stlyHIEzJIdHIud+GlBovxijovZvbZn/nA
	 uTLHM0WaeJWdwspYWmkuBnCSTEq13AgjIrHEOxg0=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4264F80272;
	Thu, 19 Aug 2021 17:30:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 767E3F8026D; Thu, 19 Aug 2021 17:30:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92B2DF800F8
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 17:29:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92B2DF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="SgmEy9to"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="q6W3qdj6"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id DCB861FDB3;
 Thu, 19 Aug 2021 15:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1629386986; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=mgGv71fASqJT0s4wVPPejUsJI944p2bEh4k32XP9SzQ=;
 b=SgmEy9totbBYiLq8WO0HERqG6fmH42HY9MpaGd4P9a1u3pSP0Za00/+IIIIdlVnYlW0Pc1
 oLlT2XJfOC14nPBPFn+EOv8nA7k+r5AFjCvjJgcepruRrQu7z3FngbZlUASIUBDqlJb90w
 kQNB1bKBvjSqLGSaR7vXGvXdh2Y30n4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1629386986;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=mgGv71fASqJT0s4wVPPejUsJI944p2bEh4k32XP9SzQ=;
 b=q6W3qdj68e1pSfQHdkdmd4k4y9cintoyAmDZjHn4vUkmRNfEao2U5bLGnG+SR3tAzuBUGD
 wxr/Do1ahgszRpAw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id D613BA3B83;
 Thu, 19 Aug 2021 15:29:46 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: intel: atom: Fix breakage for PCM buffer address setup
Date: Thu, 19 Aug 2021 17:29:45 +0200
Message-Id: <20210819152945.8510-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>
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

The commit 2e6b836312a4 ("ASoC: intel: atom: Fix reference to PCM
buffer address") changed the reference of PCM buffer address to
substream->runtime->dma_addr as the buffer address may change
dynamically.  However, I forgot that the dma_addr field is still not
set up for the CONTINUOUS buffer type (that this driver uses) yet in
5.14 and earlier kernels, and it resulted in garbage I/O.  The problem
will be fixed in 5.15, but we need to address it quickly for now.

The fix is to deduce the address again from the DMA pointer with
virt_to_phys(), but from the right one, substream->runtime->dma_area.

Fixes: 2e6b836312a4 ("ASoC: intel: atom: Fix reference to PCM buffer address")
Reported-and-tested-by: Hans de Goede <hdegoede@redhat.com>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/2048c6aa-2187-46bd-6772-36a4fb3c5aeb@redhat.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index 5db2f4865bbb..905c7965f653 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -127,7 +127,7 @@ static void sst_fill_alloc_params(struct snd_pcm_substream *substream,
 	snd_pcm_uframes_t period_size;
 	ssize_t periodbytes;
 	ssize_t buffer_bytes = snd_pcm_lib_buffer_bytes(substream);
-	u32 buffer_addr = substream->runtime->dma_addr;
+	u32 buffer_addr = virt_to_phys(substream->runtime->dma_area);
 
 	channels = substream->runtime->channels;
 	period_size = substream->runtime->period_size;
-- 
2.26.2

