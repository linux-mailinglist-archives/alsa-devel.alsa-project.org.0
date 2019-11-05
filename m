Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AE6F0158
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 16:26:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2950D16DB;
	Tue,  5 Nov 2019 16:26:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2950D16DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572967616;
	bh=3xXqgJZs0zHPl7nwOBNhL2IG7cKZK2z7e0AIpxa04hw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BzyrF7Ezc0pBMkxf6EgzbyKLAL26nBV0qsjOeR1DKbu47Ysof5MdQZjcKQ5GdcZ3D
	 j6kCxvprou6pM8rUBgitayB6gTXEMH2pWm+QwPhQ8KuZxw4xF+a/tNJBKGXZTE7EYE
	 OoLrP/ZsQZGAAs0EzJX0rO7Irc68QcKJVm6h6/tA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E40EF806F7;
	Tue,  5 Nov 2019 16:19:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 954BBF80638; Tue,  5 Nov 2019 16:19:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E426F800F3
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 16:19:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E426F800F3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 53CACB29B
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 15:18:59 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue,  5 Nov 2019 16:18:43 +0100
Message-Id: <20191105151856.10785-12-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191105151856.10785-1-tiwai@suse.de>
References: <20191105151856.10785-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 11/24] ALSA: 6fire: Convert to the common
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
 sound/usb/6fire/pcm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/usb/6fire/pcm.c b/sound/usb/6fire/pcm.c
index 4ded944e5d5d..cdc5dd7fbe16 100644
--- a/sound/usb/6fire/pcm.c
+++ b/sound/usb/6fire/pcm.c
@@ -449,13 +449,13 @@ static int usb6fire_pcm_close(struct snd_pcm_substream *alsa_sub)
 static int usb6fire_pcm_hw_params(struct snd_pcm_substream *alsa_sub,
 		struct snd_pcm_hw_params *hw_params)
 {
-	return snd_pcm_lib_alloc_vmalloc_buffer(alsa_sub,
-						params_buffer_bytes(hw_params));
+	return snd_pcm_lib_malloc_pages(alsa_sub,
+					params_buffer_bytes(hw_params));
 }
 
 static int usb6fire_pcm_hw_free(struct snd_pcm_substream *alsa_sub)
 {
-	return snd_pcm_lib_free_vmalloc_buffer(alsa_sub);
+	return snd_pcm_lib_free_pages(alsa_sub);
 }
 
 static int usb6fire_pcm_prepare(struct snd_pcm_substream *alsa_sub)
@@ -560,7 +560,6 @@ static const struct snd_pcm_ops pcm_ops = {
 	.prepare = usb6fire_pcm_prepare,
 	.trigger = usb6fire_pcm_trigger,
 	.pointer = usb6fire_pcm_pointer,
-	.page = snd_pcm_lib_get_vmalloc_page,
 };
 
 static void usb6fire_pcm_init_urb(struct pcm_urb *urb,
@@ -659,6 +658,8 @@ int usb6fire_pcm_init(struct sfire_chip *chip)
 	strcpy(pcm->name, "DMX 6Fire USB");
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &pcm_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &pcm_ops);
+	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
+					      NULL, 0, 0);
 
 	rt->instance = pcm;
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
