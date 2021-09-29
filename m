Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA7241C054
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 10:11:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B4331690;
	Wed, 29 Sep 2021 10:10:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B4331690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632903090;
	bh=jMbSngIBAClmnQKDtIlcv8K6P5TIOUOr1aiWxbvcrx8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M9VTvWYPjmLNva2k8Ma+crSUUZl4USY2waqRwprVXyRJz7x3QkNsJ/MOOsp2P/GdK
	 RnQjhWpBOQHVvgv5gHG3z6ybdshqKhqKHgIgEHISWi1Vz70ZRSnVqfl5KfZAa4JQIV
	 oRv+4yB/Otg6vElxYEunrfvttr7nrPKGkl1Ds0G8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3044F804F3;
	Wed, 29 Sep 2021 10:09:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E32FDF804EB; Wed, 29 Sep 2021 10:09:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90B3FF80272
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 10:08:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90B3FF80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="TfkDYAL7"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="J4pslpme"
Received: from relay1.suse.de (relay1.suse.de [149.44.160.133])
 by smtp-out2.suse.de (Postfix) with ESMTP id D03B5202F8
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 08:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632902928; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UKFlCKij3O5xs6xf2iFC6xI20txKPD+yz9t3uOl7W5w=;
 b=TfkDYAL7MPwhU8AUBA0NnlR2xEH6PWW558+J9PAxdt7MP5Q/GnIPxjdbxK1HMG//QHOLM4
 7FmVqYPdF9iDLVXfG9eu3ixMiM+Ox25fcN+wmLfm1ffu9A/Rz12rdUhX9vKPhC57aCvHrx
 Ak1nDHV5iLlChXGCkzv9RkFyHlkNSyk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632902928;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UKFlCKij3O5xs6xf2iFC6xI20txKPD+yz9t3uOl7W5w=;
 b=J4pslpme8WMnti1zG8kZCq1N3D+WNgx+FknqwomvzsvBzcIKWNY14637h1YmRvD0deMw/5
 XjjX/wS4SC1G8eBw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay1.suse.de (Postfix) with ESMTP id C159E25D6F;
 Wed, 29 Sep 2021 08:08:48 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/9] ALSA: usb-audio: Disable low-latency mode for implicit
 feedback sync
Date: Wed, 29 Sep 2021 10:08:40 +0200
Message-Id: <20210929080844.11583-6-tiwai@suse.de>
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

When a playback stream runs in the implicit feedback mode, its
operation is passive and won't start unless the capture packet is
received.  This behavior contradicts with the low-latency playback
mode, and we should turn off lowlatency_playback flag accordingly.

In theory, we may take the low-latency mode when the playback-first
quirk is set, but it still conflicts with the later operation with the
fixed packet numbers, so it's disabled all together for now.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/pcm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 84b03a32ee23..ec7eeb1b82b8 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -595,6 +595,9 @@ static int lowlatency_playback_available(struct snd_pcm_runtime *runtime,
 	/* free-wheeling mode? (e.g. dmix) */
 	if (runtime->stop_threshold > runtime->buffer_size)
 		return false;
+	/* implicit feedback mode has own operation mode */
+	if (snd_usb_endpoint_implicit_feedback_sink(subs->data_endpoint))
+		return false;
 	/* too short periods? */
 	if (subs->data_endpoint->nominal_queue_size >= subs->buffer_bytes)
 		return false;
-- 
2.26.2

