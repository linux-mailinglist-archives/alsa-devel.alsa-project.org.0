Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D5E118051
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 07:21:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 045661663;
	Tue, 10 Dec 2019 07:20:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 045661663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575958907;
	bh=qBg6mB7A7hvLaQtL/XFOnOxY7Nv49wK+wbmiC5W/dTo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MzAnc0JycTkuY/uukJxq1zSn+rmCmhRKQjYnTN8O9gdo4DybfiiEr8AER9ncL/T6Y
	 GW7ASmwYVtFHPDkScZ3o0KPEBXX3ZCCCTVZ904xJ/KOJQVSX8vKGJR3QwvRqO01Idl
	 y3Qkh3LBHp5Tu/4JO7d7BJ/gS4EwWEuKEJKR7RJY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2F28F802E9;
	Tue, 10 Dec 2019 07:13:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88EF5F802A8; Tue, 10 Dec 2019 07:12:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73EDEF80254
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 07:11:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73EDEF80254
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 14493B1E3
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 06:11:52 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 10 Dec 2019 07:11:35 +0100
Message-Id: <20191210061145.24641-14-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210061145.24641-1-tiwai@suse.de>
References: <20191210061145.24641-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 13/23] ALSA: asihpi: Drop superfluous ioctl PCM
	ops
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

snd_card_asihpi_playback_ioctl() and snd_card_asihpi_capture_ioctl()
do nothing but calling the default handler.
Now PCM core accepts NULL as the default ioctl ops, so let's drop
altogether.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/asihpi/asihpi.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
index ccdaaf28dcf8..1fdb9f9f0ae0 100644
--- a/sound/pci/asihpi/asihpi.c
+++ b/sound/pci/asihpi/asihpi.c
@@ -943,15 +943,6 @@ static void snd_card_asihpi_isr(struct hpi_adapter *a)
 }
 
 /***************************** PLAYBACK OPS ****************/
-static int snd_card_asihpi_playback_ioctl(struct snd_pcm_substream *substream,
-					  unsigned int cmd, void *arg)
-{
-	char name[16];
-	snd_pcm_debug_name(substream, name, sizeof(name));
-	snd_printddd(KERN_INFO "%s ioctl %d\n", name, cmd);
-	return snd_pcm_lib_ioctl(substream, cmd, arg);
-}
-
 static int snd_card_asihpi_playback_prepare(struct snd_pcm_substream *
 					    substream)
 {
@@ -1118,7 +1109,6 @@ static int snd_card_asihpi_playback_close(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_card_asihpi_playback_mmap_ops = {
 	.open = snd_card_asihpi_playback_open,
 	.close = snd_card_asihpi_playback_close,
-	.ioctl = snd_card_asihpi_playback_ioctl,
 	.hw_params = snd_card_asihpi_pcm_hw_params,
 	.hw_free = snd_card_asihpi_hw_free,
 	.prepare = snd_card_asihpi_playback_prepare,
@@ -1143,12 +1133,6 @@ snd_card_asihpi_capture_pointer(struct snd_pcm_substream *substream)
 	return bytes_to_frames(runtime, dpcm->pcm_buf_dma_ofs % dpcm->buffer_bytes);
 }
 
-static int snd_card_asihpi_capture_ioctl(struct snd_pcm_substream *substream,
-					 unsigned int cmd, void *arg)
-{
-	return snd_pcm_lib_ioctl(substream, cmd, arg);
-}
-
 static int snd_card_asihpi_capture_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -1284,7 +1268,6 @@ static int snd_card_asihpi_capture_close(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_card_asihpi_capture_mmap_ops = {
 	.open = snd_card_asihpi_capture_open,
 	.close = snd_card_asihpi_capture_close,
-	.ioctl = snd_card_asihpi_capture_ioctl,
 	.hw_params = snd_card_asihpi_pcm_hw_params,
 	.hw_free = snd_card_asihpi_hw_free,
 	.prepare = snd_card_asihpi_capture_prepare,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
