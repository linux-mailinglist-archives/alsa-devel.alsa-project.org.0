Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBBD3E40B8
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 09:14:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE279167B;
	Mon,  9 Aug 2021 09:13:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE279167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628493267;
	bh=h7GpmDsFZzDY1GQso3+sC5fFsWDwogJ8mm9SUStGGyE=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NWtMSooz6LdAlTG7l0oUStNv1rsjfAQL5egPYl17O0D9VpA+uehbpLSZaQtYMm3TS
	 CKZQp5ci4isBRyiOqtfeSeS/XgSpUfJcDdbsDhSM637CUxeVbOGTLyFT9xWia30uzj
	 NvEuT8bSM1q8aPqhBhGbLCFNukZJrOPW7nPxA0kY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 184FCF8032D;
	Mon,  9 Aug 2021 09:13:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFE0CF802D2; Mon,  9 Aug 2021 09:12:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86F94F800CB
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 09:12:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86F94F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="EkINoJAn"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="glQHhuJk"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 200341FD95
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 07:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628493171; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9etIl8F0/WtWRhvoP2NJsRyLF4ZsVp9xedW+LkDd7/8=;
 b=EkINoJAnaymVq6emeTkXivfL1lMQ+3/1IQn/ygPULD/LjM/IwiVeHe07i0PuuLzW/AehIK
 ku84kibPsTCH5RSUAyqvwRnEbK0bkAM6V4YQLKw4F8wE8SRRQH5qiZ9u/Gtz1KaIR6gp64
 /bb/avj1SNbnV8Mne/rEgynwcQychTA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628493171;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9etIl8F0/WtWRhvoP2NJsRyLF4ZsVp9xedW+LkDd7/8=;
 b=glQHhuJkvhn/kDGENik0dwaRSp0RqXjMPmAlLmbbpNv2GcBKR839wVEtEILj2Hx5Bqa5Bw
 NxK+E2Oy+kCwewBA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 1A821A3B8C;
 Mon,  9 Aug 2021 07:12:51 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: harmony: Drop superfluous address setup
Date: Mon,  9 Aug 2021 09:12:50 +0200
Message-Id: <20210809071250.21846-1-tiwai@suse.de>
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

Harmony driver never uses CONTINUOUS buffer type any longer, hence the
code setting the address is superfluous.  Moreover, the recent change
in the ALSA core already covered the missing address field; it's
already set up.  So let's drop the superfluous line, which includes
the full hw_params callback.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/parisc/harmony.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/sound/parisc/harmony.c b/sound/parisc/harmony.c
index 1440db8b4177..ec4fda324760 100644
--- a/sound/parisc/harmony.c
+++ b/sound/parisc/harmony.c
@@ -563,22 +563,9 @@ snd_harmony_capture_close(struct snd_pcm_substream *ss)
         return 0;
 }
 
-static int 
-snd_harmony_hw_params(struct snd_pcm_substream *ss,
-		      struct snd_pcm_hw_params *hw)
-{
-	struct snd_harmony *h = snd_pcm_substream_chip(ss);
-	
-	if (h->dma.type == SNDRV_DMA_TYPE_CONTINUOUS)
-		ss->runtime->dma_addr = __pa(ss->runtime->dma_area);
-
-	return 0;
-}
-
 static const struct snd_pcm_ops snd_harmony_playback_ops = {
 	.open =	snd_harmony_playback_open,
 	.close = snd_harmony_playback_close,
-	.hw_params = snd_harmony_hw_params,
 	.prepare = snd_harmony_playback_prepare,
 	.trigger = snd_harmony_playback_trigger,
  	.pointer = snd_harmony_playback_pointer,
@@ -587,7 +574,6 @@ static const struct snd_pcm_ops snd_harmony_playback_ops = {
 static const struct snd_pcm_ops snd_harmony_capture_ops = {
         .open = snd_harmony_capture_open,
         .close = snd_harmony_capture_close,
-        .hw_params = snd_harmony_hw_params,
         .prepare = snd_harmony_capture_prepare,
         .trigger = snd_harmony_capture_trigger,
         .pointer = snd_harmony_capture_pointer,
-- 
2.26.2

