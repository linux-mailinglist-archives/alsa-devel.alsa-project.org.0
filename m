Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3586A116B50
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:44:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF87816F5;
	Mon,  9 Dec 2019 11:44:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF87816F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575888294;
	bh=p+6nGKyqpMvRJK6qY2Ym/z9pBJU8iDJnkx6SEPU2Kh0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g2zmpearywxj9EzzP50z569QQA52AyFQ9bhrBvL/woQ4OUArOFMKOLyvy6MThZ5wW
	 4RVaB7cdD/nmzPnzxJ+RK38JRoXOHWF6pSQHaCxdJALY8+dDte+sAk3s2nM8DSNOza
	 NcEfikhCqd84H5zHIidNWWWvK5huuEF/bWSYrmKw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20B42F80686;
	Mon,  9 Dec 2019 10:52:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CC48F803BE; Mon,  9 Dec 2019 10:51:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 959FCF802E9
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 959FCF802E9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A12D9B2E5
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:49 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:49:37 +0100
Message-Id: <20191209094943.14984-66-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 65/71] ALSA: caiaq: Use managed buffer
	allocation
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

Clean up the driver with the new managed buffer allocation API.
The hw_params callback became superfluous and dropped.
The hw_free callback still remains because of the substream
deactivation sync call.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/caiaq/audio.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/sound/usb/caiaq/audio.c b/sound/usb/caiaq/audio.c
index 970eb0865ba3..8513b120e57e 100644
--- a/sound/usb/caiaq/audio.c
+++ b/sound/usb/caiaq/audio.c
@@ -167,17 +167,11 @@ static int snd_usb_caiaq_substream_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int snd_usb_caiaq_pcm_hw_params(struct snd_pcm_substream *sub,
-				       struct snd_pcm_hw_params *hw_params)
-{
-	return snd_pcm_lib_malloc_pages(sub, params_buffer_bytes(hw_params));
-}
-
 static int snd_usb_caiaq_pcm_hw_free(struct snd_pcm_substream *sub)
 {
 	struct snd_usb_caiaqdev *cdev = snd_pcm_substream_chip(sub);
 	deactivate_substream(cdev, sub);
-	return snd_pcm_lib_free_pages(sub);
+	return 0;
 }
 
 /* this should probably go upstream */
@@ -328,7 +322,6 @@ static const struct snd_pcm_ops snd_usb_caiaq_ops = {
 	.open =		snd_usb_caiaq_substream_open,
 	.close =	snd_usb_caiaq_substream_close,
 	.ioctl =	snd_pcm_lib_ioctl,
-	.hw_params =	snd_usb_caiaq_pcm_hw_params,
 	.hw_free =	snd_usb_caiaq_pcm_hw_free,
 	.prepare =	snd_usb_caiaq_pcm_prepare,
 	.trigger =	snd_usb_caiaq_pcm_trigger,
@@ -841,8 +834,8 @@ int snd_usb_caiaq_audio_init(struct snd_usb_caiaqdev *cdev)
 				&snd_usb_caiaq_ops);
 	snd_pcm_set_ops(cdev->pcm, SNDRV_PCM_STREAM_CAPTURE,
 				&snd_usb_caiaq_ops);
-	snd_pcm_lib_preallocate_pages_for_all(cdev->pcm, SNDRV_DMA_TYPE_VMALLOC,
-					      NULL, 0, 0);
+	snd_pcm_set_managed_buffer_all(cdev->pcm, SNDRV_DMA_TYPE_VMALLOC,
+				       NULL, 0, 0);
 
 	cdev->data_cb_info =
 		kmalloc_array(N_URBS, sizeof(struct snd_usb_caiaq_cb_info),
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
