Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85652F0179
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 16:31:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1512D1674;
	Tue,  5 Nov 2019 16:30:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1512D1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572967863;
	bh=aJPJ9lcAqlNn6EHIN5W1kIKzdKE1rGDETvJs7beKltQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WBQYc6ZcWX9RtZBU573I6Mgf5rHhnbhNMP2pyEQF3rY+SRVK6BEClLyPAAm9FMfEw
	 UixLQSRggQjHX//yFXT6yqYJY2jHlIvvWEuZnfSwg7iGvOzNb/gI+wFrvochZaYEOU
	 ssbWjlYbnF1jW8QlNeGW2J2+GOjc+42doZWIzowU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0EB5F8075A;
	Tue,  5 Nov 2019 16:19:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3BE3F8060E; Tue,  5 Nov 2019 16:19:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4EA27F805FF
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 16:19:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EA27F805FF
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5D4B2B2A3
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 15:18:59 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue,  5 Nov 2019 16:18:46 +0100
Message-Id: <20191105151856.10785-15-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191105151856.10785-1-tiwai@suse.de>
References: <20191105151856.10785-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 14/24] ALSA: ua101: Convert to the common
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
 sound/usb/misc/ua101.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/usb/misc/ua101.c b/sound/usb/misc/ua101.c
index 307b72d5fffa..566a4a31528a 100644
--- a/sound/usb/misc/ua101.c
+++ b/sound/usb/misc/ua101.c
@@ -733,8 +733,8 @@ static int capture_pcm_hw_params(struct snd_pcm_substream *substream,
 	if (err < 0)
 		return err;
 
-	return snd_pcm_lib_alloc_vmalloc_buffer(substream,
-						params_buffer_bytes(hw_params));
+	return snd_pcm_lib_malloc_pages(substream,
+					params_buffer_bytes(hw_params));
 }
 
 static int playback_pcm_hw_params(struct snd_pcm_substream *substream,
@@ -751,13 +751,13 @@ static int playback_pcm_hw_params(struct snd_pcm_substream *substream,
 	if (err < 0)
 		return err;
 
-	return snd_pcm_lib_alloc_vmalloc_buffer(substream,
-						params_buffer_bytes(hw_params));
+	return snd_pcm_lib_malloc_pages(substream,
+					params_buffer_bytes(hw_params));
 }
 
 static int ua101_pcm_hw_free(struct snd_pcm_substream *substream)
 {
-	return snd_pcm_lib_free_vmalloc_buffer(substream);
+	return snd_pcm_lib_free_pages(substream);
 }
 
 static int capture_pcm_prepare(struct snd_pcm_substream *substream)
@@ -889,7 +889,6 @@ static const struct snd_pcm_ops capture_pcm_ops = {
 	.prepare = capture_pcm_prepare,
 	.trigger = capture_pcm_trigger,
 	.pointer = capture_pcm_pointer,
-	.page = snd_pcm_lib_get_vmalloc_page,
 };
 
 static const struct snd_pcm_ops playback_pcm_ops = {
@@ -901,7 +900,6 @@ static const struct snd_pcm_ops playback_pcm_ops = {
 	.prepare = playback_pcm_prepare,
 	.trigger = playback_pcm_trigger,
 	.pointer = playback_pcm_pointer,
-	.page = snd_pcm_lib_get_vmalloc_page,
 };
 
 static const struct uac_format_type_i_discrete_descriptor *
@@ -1296,6 +1294,8 @@ static int ua101_probe(struct usb_interface *interface,
 	strcpy(ua->pcm->name, name);
 	snd_pcm_set_ops(ua->pcm, SNDRV_PCM_STREAM_PLAYBACK, &playback_pcm_ops);
 	snd_pcm_set_ops(ua->pcm, SNDRV_PCM_STREAM_CAPTURE, &capture_pcm_ops);
+	snd_pcm_lib_preallocate_pages_for_all(ua->pcm, SNDRV_DMA_TYPE_VMALLOC,
+					      NULL, 0, 0);
 
 	err = snd_usbmidi_create(card, ua->intf[INTF_MIDI],
 				 &ua->midi_list, &midi_quirk);
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
