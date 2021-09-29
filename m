Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 928A941C055
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 10:11:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3513916B2;
	Wed, 29 Sep 2021 10:10:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3513916B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632903101;
	bh=X9aoVKlMIHGlsF/H/NOy0ibYdx9KaNRtY5hP9zfdtWk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FD4czeazjAWY5FWUf0zEeqtyRpIDGPPk0HpR9S1enDCw9j9HaoRkP8/SqB7rseS/9
	 QSbqLnHk6YU9U814NQmwADnSjfjXcw/FOrnctXGsRxre2Crwa0Ro5Sy5rc2u26/DQ0
	 lmMosUVyHcM3naE4nKazllZy4/wkJDuFfajPGbQM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5426CF80506;
	Wed, 29 Sep 2021 10:09:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5359F804E7; Wed, 29 Sep 2021 10:09:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99CE3F802C4
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 10:08:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99CE3F802C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="X9zRcqvA"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="3sVYwhSc"
Received: from relay1.suse.de (relay1.suse.de [149.44.160.133])
 by smtp-out1.suse.de (Postfix) with ESMTP id C52E722530
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 08:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632902928; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cIBPFV2aEE77SlvNFfA2KBn6FPxbLpPR7eEYkv8V2W4=;
 b=X9zRcqvApnc//CKFl/KSDw9lpqrpajypdzqzdujllhpqOFy+O8dxEVzH1tDGP1EwwbHAtI
 lZogysBWvbW2jduAW0vPiNh+bmrud87YeqVmi+c+fYsez1E0FOlOpWhlOfkDxD2QAD1fk5
 SUfQTFzKlRPjPKr0gjJBmaWLOjEXPss=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632902928;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cIBPFV2aEE77SlvNFfA2KBn6FPxbLpPR7eEYkv8V2W4=;
 b=3sVYwhScTSm1MG7vDWaQHlUu3T+gYqq1Q0lvaOmecA5dhh0cEhhMDss+jTUOS6t1X6xH46
 /a8uv0WhxpmlOqAA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay1.suse.de (Postfix) with ESMTP id BE9F025D65;
 Wed, 29 Sep 2021 08:08:48 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/9] ALSA: usb-audio: Disable low-latency playback for
 free-wheel mode
Date: Wed, 29 Sep 2021 10:08:39 +0200
Message-Id: <20210929080844.11583-5-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210929080844.11583-1-tiwai@suse.de>
References: <20210929080844.11583-1-tiwai@suse.de>
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

The free-wheel stream operation like dmix may not update the appl_ptr
appropriately, and it doesn't fit with the low-latency playback mode.
Disable the low-latency playback operation when the stream is set up
in such a mode.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/pcm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 4dd7f1c9e2af..84b03a32ee23 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -582,7 +582,8 @@ static int snd_usb_hw_free(struct snd_pcm_substream *substream)
 }
 
 /* check whether early start is needed for playback stream */
-static int lowlatency_playback_available(struct snd_usb_substream *subs)
+static int lowlatency_playback_available(struct snd_pcm_runtime *runtime,
+					 struct snd_usb_substream *subs)
 {
 	struct snd_usb_audio *chip = subs->stream->chip;
 
@@ -591,6 +592,9 @@ static int lowlatency_playback_available(struct snd_usb_substream *subs)
 	/* disabled via module option? */
 	if (!chip->lowlatency)
 		return false;
+	/* free-wheeling mode? (e.g. dmix) */
+	if (runtime->stop_threshold > runtime->buffer_size)
+		return false;
 	/* too short periods? */
 	if (subs->data_endpoint->nominal_queue_size >= subs->buffer_bytes)
 		return false;
@@ -630,7 +634,7 @@ static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
 	subs->period_elapsed_pending = 0;
 	runtime->delay = 0;
 
-	subs->lowlatency_playback = lowlatency_playback_available(subs);
+	subs->lowlatency_playback = lowlatency_playback_available(runtime, subs);
 	if (!subs->lowlatency_playback)
 		ret = start_endpoints(subs);
 
-- 
2.26.2

