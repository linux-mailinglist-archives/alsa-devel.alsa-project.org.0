Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D75F016A
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 16:29:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E4E916DD;
	Tue,  5 Nov 2019 16:28:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E4E916DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572967775;
	bh=oXmMVeZwQJbrtEjah+ktvGaea51NwuXAJEb4n5fihdk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=StJr91jcCFaWnKBOwmNieJ+Ul5pBrLCMEAajfdcHp3RZetP4q5B49OttIKhde8waw
	 xiSe8wNc1PP9R7IyMVwHCbvtYCAX67utupIqIPpuVCIjV7D0XW0jyaH++BXozfs9Pv
	 ToM+ijSajXLFJ3vAO6iWpHDfDOrmsRtiZMJ4Xu40=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F581F8072A;
	Tue,  5 Nov 2019 16:19:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 863D7F80600; Tue,  5 Nov 2019 16:19:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16432F8060E
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 16:19:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16432F8060E
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 55F73B29D
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 15:18:59 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue,  5 Nov 2019 16:18:44 +0100
Message-Id: <20191105151856.10785-13-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191105151856.10785-1-tiwai@suse.de>
References: <20191105151856.10785-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 12/24] ALSA: caiaq: Convert to the common
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
 sound/usb/caiaq/audio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/usb/caiaq/audio.c b/sound/usb/caiaq/audio.c
index 444bb637ce13..970eb0865ba3 100644
--- a/sound/usb/caiaq/audio.c
+++ b/sound/usb/caiaq/audio.c
@@ -170,15 +170,14 @@ static int snd_usb_caiaq_substream_close(struct snd_pcm_substream *substream)
 static int snd_usb_caiaq_pcm_hw_params(struct snd_pcm_substream *sub,
 				       struct snd_pcm_hw_params *hw_params)
 {
-	return snd_pcm_lib_alloc_vmalloc_buffer(sub,
-						params_buffer_bytes(hw_params));
+	return snd_pcm_lib_malloc_pages(sub, params_buffer_bytes(hw_params));
 }
 
 static int snd_usb_caiaq_pcm_hw_free(struct snd_pcm_substream *sub)
 {
 	struct snd_usb_caiaqdev *cdev = snd_pcm_substream_chip(sub);
 	deactivate_substream(cdev, sub);
-	return snd_pcm_lib_free_vmalloc_buffer(sub);
+	return snd_pcm_lib_free_pages(sub);
 }
 
 /* this should probably go upstream */
@@ -334,7 +333,6 @@ static const struct snd_pcm_ops snd_usb_caiaq_ops = {
 	.prepare =	snd_usb_caiaq_pcm_prepare,
 	.trigger =	snd_usb_caiaq_pcm_trigger,
 	.pointer =	snd_usb_caiaq_pcm_pointer,
-	.page =		snd_pcm_lib_get_vmalloc_page,
 };
 
 static void check_for_elapsed_periods(struct snd_usb_caiaqdev *cdev,
@@ -843,6 +841,8 @@ int snd_usb_caiaq_audio_init(struct snd_usb_caiaqdev *cdev)
 				&snd_usb_caiaq_ops);
 	snd_pcm_set_ops(cdev->pcm, SNDRV_PCM_STREAM_CAPTURE,
 				&snd_usb_caiaq_ops);
+	snd_pcm_lib_preallocate_pages_for_all(cdev->pcm, SNDRV_DMA_TYPE_VMALLOC,
+					      NULL, 0, 0);
 
 	cdev->data_cb_info =
 		kmalloc_array(N_URBS, sizeof(struct snd_usb_caiaq_cb_info),
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
