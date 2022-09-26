Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E36BA5EA7C0
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Sep 2022 15:58:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 791F8AEA;
	Mon, 26 Sep 2022 15:57:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 791F8AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664200704;
	bh=BqsVI5JTfLNDH+QOuX4kR1DOU+xDMLg4EyLfij+2Jdo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GTePOFQq/bwUVuAetaaIpGfwb+2LsFRev5U/uQJfgCq0cbZpDA3ibl3Y2ze44/yEN
	 m7OxbAf8sR6fFRXaRqEuWKX2tcwa7TYI+gJLX2AAnZu8CPQX4IY1O3uWUAKhwJIYY2
	 3Fw33tr/cZiGmQ30biK5Hve4RWzZgVQ6ZnGILp9g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2EABF80553;
	Mon, 26 Sep 2022 15:56:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A32BAF8055B; Mon, 26 Sep 2022 15:56:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D897F804D2
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 15:56:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D897F804D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="vaJGlQ35"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="gZjasnPz"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DCAFB1F8A3;
 Mon, 26 Sep 2022 13:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664200570; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yMBaXWRVJYIK6LMR2Cwx7+b0uDPGKhczLe6l/iu2tME=;
 b=vaJGlQ35tVt+PkRWVdrzEqBxKzhYEA5hx212Fj6VxeVBm8wJ7fkZtJXg9dGLX4duoQAYPs
 qSDsVKY/45Sqp8JbeN9Vy3Tv9WrmyQqb5jCZrIO1Lxj6RDYDjo9jKtTUU6CpjlOO3Ow8Gi
 6ahw8tsD+4e7wbZeoUzK6Tg5AyXpe3Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664200570;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yMBaXWRVJYIK6LMR2Cwx7+b0uDPGKhczLe6l/iu2tME=;
 b=gZjasnPzXFisWzGgSNXrYrcrX31wBNyEDsnX2UkIb516yJPRIPRPUTCXuV3v5Ea8O7Q90+
 DTLUS2FlN85USWAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C3E83139BD;
 Mon, 26 Sep 2022 13:56:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aLj2LnqvMWPxegAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 26 Sep 2022 13:56:10 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/11] ALSA: aloop: Replace runtime->status->state reference
 to runtime->state
Date: Mon, 26 Sep 2022 15:55:50 +0200
Message-Id: <20220926135558.26580-4-tiwai@suse.de>
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
 sound/drivers/aloop.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 12f12a294df5..a38e602b4fc6 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -535,7 +535,7 @@ static void copy_play_buf(struct loopback_pcm *play,
 
 	/* check if playback is draining, trim the capture copy size
 	 * when our pointer is at the end of playback ring buffer */
-	if (runtime->status->state == SNDRV_PCM_STATE_DRAINING &&
+	if (runtime->state == SNDRV_PCM_STATE_DRAINING &&
 	    snd_pcm_playback_hw_avail(runtime) < runtime->buffer_size) { 
 	    	snd_pcm_uframes_t appl_ptr, appl_ptr1, diff;
 		appl_ptr = appl_ptr1 = runtime->control->appl_ptr;
@@ -730,7 +730,7 @@ static void loopback_snd_timer_period_elapsed(struct loopback_cable *cable,
 
 	if (event == SNDRV_TIMER_EVENT_MSTOP) {
 		if (!dpcm_play ||
-		    dpcm_play->substream->runtime->status->state !=
+		    dpcm_play->substream->runtime->state !=
 				SNDRV_PCM_STATE_DRAINING) {
 			spin_unlock_irqrestore(&cable->lock, flags);
 			return;
-- 
2.35.3

