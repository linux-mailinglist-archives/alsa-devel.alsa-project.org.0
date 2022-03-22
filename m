Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 514CC4E44BE
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Mar 2022 18:09:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3B8E1772;
	Tue, 22 Mar 2022 18:08:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3B8E1772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647968974;
	bh=JL/k4Ka8fzJXduoKYXRgWCPLM/E0X+aSAyMZSIdD67w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PhrNk1BliOsTNxoz20jiJ2WtNnVx/XOW7TC0hQ7HsJ+JGtK4DobEkqhdlNDU1ucjf
	 6v8bvfMqvIVfZMDSv2XFzFvNwUi190gre9JGMmdzVgVB0bL3A17EvDRa29mWwHBpOs
	 KJTt/tFccEsK+r5BfS9F0fKfkVtMJ2dK9Neka9oc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93D0CF80518;
	Tue, 22 Mar 2022 18:07:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BED84F80517; Tue, 22 Mar 2022 18:07:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A622F8012A
 for <alsa-devel@alsa-project.org>; Tue, 22 Mar 2022 18:07:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A622F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="lpqB+3ia"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="DZNpQcmb"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 2B6DF1F38C;
 Tue, 22 Mar 2022 17:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1647968867; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7BHpLrva0gn3z4ug3sivlVXdf446dwWnsWltmnc0TZg=;
 b=lpqB+3ia31feVNsJ+xBeXoPm6qiplwLJhmVWhDZV/IyaXPbcHw3SGJXSzRSs4AC4A/GUng
 pBBP5SQ+ligtAPpdNJZTRXrE3fhB8LOcXqKJ7LFW4xGGBNLbjQpvNsX2O/aL9VemqGMYlB
 53hv0qnsSQn2sro/BM4Y8R47P1laEwE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1647968867;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7BHpLrva0gn3z4ug3sivlVXdf446dwWnsWltmnc0TZg=;
 b=DZNpQcmbWVN9G8MQ1OCIhMSCIW7VkpTffNB6yrufNEyRTH9rnv6dvK62Km/q4i3NvKX5TL
 dXqcSVcCEbXCNUDA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 25492A3B87;
 Tue, 22 Mar 2022 17:07:47 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/4] ALSA: pcm: Fix races among concurrent read/write and
 buffer changes
Date: Tue, 22 Mar 2022 18:07:18 +0100
Message-Id: <20220322170720.3529-3-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220322170720.3529-1-tiwai@suse.de>
References: <20220322170720.3529-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Hu Jiahui <kirin.say@gmail.com>, linux-kernel@vger.kernel.org
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

In the current PCM design, the read/write syscalls (as well as the
equivalent ioctls) are allowed before the PCM stream is running, that
is, at PCM PREPARED state.  Meanwhile, we also allow to re-issue
hw_params and hw_free ioctl calls at the PREPARED state that may
change or free the buffers, too.  The problem is that there is no
protection against those mix-ups.

This patch applies the previously introduced runtime->buffer_mutex to
the read/write operations so that the concurrent hw_params or hw_free
call can no longer interfere during the operation.  The mutex is
unlocked before scheduling, so we don't take it too long.

Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_lib.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index f2090025236b..a40a35e51fad 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1906,9 +1906,11 @@ static int wait_for_avail(struct snd_pcm_substream *substream,
 		if (avail >= runtime->twake)
 			break;
 		snd_pcm_stream_unlock_irq(substream);
+		mutex_unlock(&runtime->buffer_mutex);
 
 		tout = schedule_timeout(wait_time);
 
+		mutex_lock(&runtime->buffer_mutex);
 		snd_pcm_stream_lock_irq(substream);
 		set_current_state(TASK_INTERRUPTIBLE);
 		switch (runtime->status->state) {
@@ -2219,6 +2221,7 @@ snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 
 	nonblock = !!(substream->f_flags & O_NONBLOCK);
 
+	mutex_lock(&runtime->buffer_mutex);
 	snd_pcm_stream_lock_irq(substream);
 	err = pcm_accessible_state(runtime);
 	if (err < 0)
@@ -2310,6 +2313,7 @@ snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 	if (xfer > 0 && err >= 0)
 		snd_pcm_update_state(substream, runtime);
 	snd_pcm_stream_unlock_irq(substream);
+	mutex_unlock(&runtime->buffer_mutex);
 	return xfer > 0 ? (snd_pcm_sframes_t)xfer : err;
 }
 EXPORT_SYMBOL(__snd_pcm_lib_xfer);
-- 
2.31.1

