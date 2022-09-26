Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5015EA7C2
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Sep 2022 15:58:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12F3E846;
	Mon, 26 Sep 2022 15:58:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12F3E846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664200732;
	bh=2P4aqlq1BBIKcqXHqUyxSAxVBRehSljoDNk7X8rSPNk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pJq7Za6l14wAFYUQqMybdzmRp0zFQUoLHKGih+9K+jxQ7KBDCDzf7Jz8K6F2jMs0n
	 m07r8jVY9Mr9086lJCP9TKeIKLHPhfeKrrNODXpWzDimo0BUpP9d0ulj8JGjA8eRcU
	 Uua3IYBlJ52WYN97SUJyGOekyGrT7RDBN3u+Sl/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC9C5F80568;
	Mon, 26 Sep 2022 15:56:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDF41F80510; Mon, 26 Sep 2022 15:56:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C51D0F80533
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 15:56:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C51D0F80533
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="WV9+Jl2X"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="hQ6RRQ+8"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 988A721EB7;
 Mon, 26 Sep 2022 13:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664200573; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nxc+CabGtOKLMDXNlhLlL3vH9FuVhzMQHFzWgsRWfs8=;
 b=WV9+Jl2XpwzxeR6UmjDYMHFiY+vPzN3005lUsznLvNH6NOt34cKS5WLge+kSiQku6NleMc
 mBn5bPEF2Ubz6cgWK/UMNYvAXY9VtsIsLvDUq2GRQxjsuTkLWorMWxbfCacD5qnyXscjjv
 9wOEX2gMMW/87WETMy/WThsuTc63zsE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664200573;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nxc+CabGtOKLMDXNlhLlL3vH9FuVhzMQHFzWgsRWfs8=;
 b=hQ6RRQ+8TAm+ePwXVCW7Z3yhfcfv2clhL7ffA5Kp9QHkmYoKo2XVU+5xacEzV5Njt66LA+
 W27trYB/lWeoMmCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 837E0139BD;
 Mon, 26 Sep 2022 13:56:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0K45H32vMWPxegAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 26 Sep 2022 13:56:13 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/11] ALSA: usb-audio: Replace runtime->status->state
 reference to runtime->state
Date: Mon, 26 Sep 2022 15:55:54 +0200
Message-Id: <20220926135558.26580-8-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220926135558.26580-1-tiwai@suse.de>
References: <20220926135558.26580-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>
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

The recent change in ALSA core allows drivers to get the current PCM
state directly from runtime object.  Replace the calls accordingly.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index e721fc12acde..8ed165f036a0 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -1395,7 +1395,7 @@ static int prepare_playback_urb(struct snd_usb_substream *subs,
 	transfer_done = subs->transfer_done;
 
 	if (subs->lowlatency_playback &&
-	    runtime->status->state != SNDRV_PCM_STATE_DRAINING) {
+	    runtime->state != SNDRV_PCM_STATE_DRAINING) {
 		unsigned int hwptr = subs->hwptr_done / stride;
 
 		/* calculate the byte offset-in-buffer of the appl_ptr */
@@ -1583,7 +1583,7 @@ static int snd_usb_substream_playback_trigger(struct snd_pcm_substream *substrea
 		return 0;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
-		stop_endpoints(subs, substream->runtime->status->state == SNDRV_PCM_STATE_DRAINING);
+		stop_endpoints(subs, substream->runtime->state == SNDRV_PCM_STATE_DRAINING);
 		snd_usb_endpoint_set_callback(subs->data_endpoint,
 					      NULL, NULL, NULL);
 		subs->running = 0;
-- 
2.35.3

