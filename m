Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C563E4717
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 16:01:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91F3D167B;
	Mon,  9 Aug 2021 16:00:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91F3D167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628517669;
	bh=InvUAn2ClKhoUoJ43WiCXy9/cc9B4pfp/C1smi5MWn4=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eMEJgWd6VFkzJchGsGnCJcJi+Kiq5ICylIwrck04/v5u8nOYZkoLosbfV3l2Vib8c
	 AFfZ+l3lksotSpahuFciCxcOYM014myqIFcinGfynfpTjQY6at+FL8LuN9vQd0Qc/L
	 i/wPnXNg58LRTbwzf4YB8JHt3I5mqjWEnKltuZyA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3138F8032D;
	Mon,  9 Aug 2021 15:59:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A330F802D2; Mon,  9 Aug 2021 15:59:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D928CF800C8
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 15:59:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D928CF800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="aQn5f6f+"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="NZpg/9Hn"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id A80DD21F68
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 13:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628517567; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=WVKfHbLoaqUk9i9LD3ri6MRaMszt4Lh4Udq8w5JCgvU=;
 b=aQn5f6f+3gIMXhe+QyoZlSMgqI8zzOt6UFTsBvqPBwd6ikFs/aCQqdnasQ6crCn+7kUHKl
 5aWw4EZb8zZuAuWjwLUD+nVisOENi1lh+MNb3RvkNcWfRsKOS9mSm3G14HsFoaoHCUYt76
 /mp77JUCfE27RgmCpXFAqS8T+vEZIcQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628517567;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=WVKfHbLoaqUk9i9LD3ri6MRaMszt4Lh4Udq8w5JCgvU=;
 b=NZpg/9HnwDdQNE1FIofJJwvCc2YiMC3eroW/eheVFSCYhFkVcKn+cUSeURDlUMDB938bY3
 Zh5whix6B3g9+CBw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id A1CF6A3B8A;
 Mon,  9 Aug 2021 13:59:27 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: msnd: Use proper mmap method
Date: Mon,  9 Aug 2021 15:59:26 +0200
Message-Id: <20210809135926.8687-1-tiwai@suse.de>
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

The old ISA MSND driver basically maps the iomem as the DMA buffer.
For this type of buffer, we have already the standard mmap helper,
snd_pcm_lib_mmap_iomem().  Set the DMA address and use the standard
helper for allowing the mmap on all architectures properly.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/msnd/msnd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/isa/msnd/msnd.c b/sound/isa/msnd/msnd.c
index 4fbc22a5bc5a..e23eaf449c50 100644
--- a/sound/isa/msnd/msnd.c
+++ b/sound/isa/msnd/msnd.c
@@ -473,6 +473,7 @@ static int snd_msnd_playback_open(struct snd_pcm_substream *substream)
 	snd_msnd_enable_irq(chip);
 
 	runtime->dma_area = (__force void *)chip->mappedbase;
+	runtime->dma_addr = chip->base;
 	runtime->dma_bytes = 0x3000;
 
 	chip->playback_substream = substream;
@@ -566,6 +567,7 @@ static const struct snd_pcm_ops snd_msnd_playback_ops = {
 	.prepare =	snd_msnd_playback_prepare,
 	.trigger =	snd_msnd_playback_trigger,
 	.pointer =	snd_msnd_playback_pointer,
+	.mmap =		snd_pcm_lib_mmap_iomem,
 };
 
 static int snd_msnd_capture_open(struct snd_pcm_substream *substream)
@@ -576,6 +578,7 @@ static int snd_msnd_capture_open(struct snd_pcm_substream *substream)
 	set_bit(F_AUDIO_READ_INUSE, &chip->flags);
 	snd_msnd_enable_irq(chip);
 	runtime->dma_area = (__force void *)chip->mappedbase + 0x3000;
+	runtime->dma_addr = chip->base + 0x3000;
 	runtime->dma_bytes = 0x3000;
 	memset(runtime->dma_area, 0, runtime->dma_bytes);
 	chip->capture_substream = substream;
@@ -662,6 +665,7 @@ static const struct snd_pcm_ops snd_msnd_capture_ops = {
 	.prepare =	snd_msnd_capture_prepare,
 	.trigger =	snd_msnd_capture_trigger,
 	.pointer =	snd_msnd_capture_pointer,
+	.mmap =		snd_pcm_lib_mmap_iomem,
 };
 
 
-- 
2.26.2

