Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CADDEF0181
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 16:32:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60E21167E;
	Tue,  5 Nov 2019 16:31:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60E21167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572967945;
	bh=aIa+W6I/I8vsxvYFInZx5PYj8HDGO813S0SVYduGRik=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BNUC8QNWWzMhPvrK8T001V9zBhsUKNQ03YxHaquu/2fThO+3CCVYNzPUMLEh7CaaD
	 WSIgTzOhRHdyKZRHX2xMq/tTLw9+vgQDOmytcZJTPGZxXQ/8v0z6N6pCQuFKOobVFW
	 6oC3z4cPij9xZIoijfYErmgdfQcXrqQADNltkvVE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C7CFF8076A;
	Tue,  5 Nov 2019 16:19:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB156F80638; Tue,  5 Nov 2019 16:19:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAFA2F80633
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 16:19:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAFA2F80633
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6BC0FB2C2
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 15:18:59 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue,  5 Nov 2019 16:18:48 +0100
Message-Id: <20191105151856.10785-17-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191105151856.10785-1-tiwai@suse.de>
References: <20191105151856.10785-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 16/24] ALSA: pdaudiocf: Convert to the common
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

Since the driver requires the DMA32 allocation, it passes the
specially encoded device to snd_pcm_lib_preallocate_pages().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c b/sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c
index c21fec60cd98..067b1c3a3e02 100644
--- a/sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c
+++ b/sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c
@@ -89,8 +89,7 @@ static int pdacf_pcm_trigger(struct snd_pcm_substream *subs, int cmd)
 static int pdacf_pcm_hw_params(struct snd_pcm_substream *subs,
 				     struct snd_pcm_hw_params *hw_params)
 {
-	return snd_pcm_lib_alloc_vmalloc_32_buffer
-					(subs, params_buffer_bytes(hw_params));
+	return snd_pcm_lib_malloc_pages(subs, params_buffer_bytes(hw_params));
 }
 
 /*
@@ -98,7 +97,7 @@ static int pdacf_pcm_hw_params(struct snd_pcm_substream *subs,
  */
 static int pdacf_pcm_hw_free(struct snd_pcm_substream *subs)
 {
-	return snd_pcm_lib_free_vmalloc_buffer(subs);
+	return snd_pcm_lib_free_pages(subs);
 }
 
 /*
@@ -262,7 +261,6 @@ static const struct snd_pcm_ops pdacf_pcm_capture_ops = {
 	.prepare =	pdacf_pcm_prepare,
 	.trigger =	pdacf_pcm_trigger,
 	.pointer =	pdacf_pcm_capture_pointer,
-	.page =		snd_pcm_lib_get_vmalloc_page,
 };
 
 
@@ -279,6 +277,9 @@ int snd_pdacf_pcm_new(struct snd_pdacf *chip)
 		return err;
 		
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &pdacf_pcm_capture_ops);
+	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
+					      snd_dma_continuous_data(GFP_KERNEL | GFP_DMA32),
+					      0, 0);
 
 	pcm->private_data = chip;
 	pcm->info_flags = 0;
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
