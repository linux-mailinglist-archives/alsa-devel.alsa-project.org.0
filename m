Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0A2F0178
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 16:30:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 843C916F1;
	Tue,  5 Nov 2019 16:29:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 843C916F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572967822;
	bh=eTgKP9N6zLKtdXgMHO6ZFMOMdbViheaSzp23Zo/3CPc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u6Ky/ZT0NTScCc6jS+6edOAUXNV3XPuqHnsRJdQKnIVzMQAOa/C0hN2q4lLaaa0rz
	 eZRXEiN+5TQR8fUanY9WG88NyXy4hHk6F4YvjxMgkk/VBlGHJcvn2AYdCUwLElNBTe
	 B/jz5TEG9HcLlZYuxsgkOiwY1vYa7GpmHY/t+QAI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF53BF80750;
	Tue,  5 Nov 2019 16:19:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72BE0F80600; Tue,  5 Nov 2019 16:19:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD532F8060D
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 16:19:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD532F8060D
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 586B1B2A0
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 15:18:59 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue,  5 Nov 2019 16:18:45 +0100
Message-Id: <20191105151856.10785-14-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191105151856.10785-1-tiwai@suse.de>
References: <20191105151856.10785-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 13/24] ALSA: hiface: Convert to the common
	vmalloc memalloc
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

The recent change (*) in the ALSA memalloc core allows us to drop the
special vmalloc-specific allocation and page handling.  This patch
coverts to the common code.
(*) df3fd6509421: ALSA: memalloc: Add vmalloc buffer allocation
                  support
    6ef6be988f98: ALSA: pcm: Handle special page mapping in the
                  default mmap handler

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/hiface/pcm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/usb/hiface/pcm.c b/sound/usb/hiface/pcm.c
index c406497c5919..e0de71917274 100644
--- a/sound/usb/hiface/pcm.c
+++ b/sound/usb/hiface/pcm.c
@@ -418,13 +418,13 @@ static int hiface_pcm_close(struct snd_pcm_substream *alsa_sub)
 static int hiface_pcm_hw_params(struct snd_pcm_substream *alsa_sub,
 				struct snd_pcm_hw_params *hw_params)
 {
-	return snd_pcm_lib_alloc_vmalloc_buffer(alsa_sub,
-						params_buffer_bytes(hw_params));
+	return snd_pcm_lib_malloc_pages(alsa_sub,
+					params_buffer_bytes(hw_params));
 }
 
 static int hiface_pcm_hw_free(struct snd_pcm_substream *alsa_sub)
 {
-	return snd_pcm_lib_free_vmalloc_buffer(alsa_sub);
+	return snd_pcm_lib_free_pages(alsa_sub);
 }
 
 static int hiface_pcm_prepare(struct snd_pcm_substream *alsa_sub)
@@ -518,7 +518,6 @@ static const struct snd_pcm_ops pcm_ops = {
 	.prepare = hiface_pcm_prepare,
 	.trigger = hiface_pcm_trigger,
 	.pointer = hiface_pcm_pointer,
-	.page = snd_pcm_lib_get_vmalloc_page,
 };
 
 static int hiface_pcm_init_urb(struct pcm_urb *urb,
@@ -614,6 +613,8 @@ int hiface_pcm_init(struct hiface_chip *chip, u8 extra_freq)
 
 	strlcpy(pcm->name, "USB-SPDIF Audio", sizeof(pcm->name));
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &pcm_ops);
+	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
+					      NULL, 0, 0);
 
 	rt->instance = pcm;
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
