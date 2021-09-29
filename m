Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB8A41C05F
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 10:13:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2658216AC;
	Wed, 29 Sep 2021 10:12:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2658216AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632903208;
	bh=CxQQ6mwJaxr80ANg2ciHujPIy+Z0tqmuDLyB6kF329o=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lqo0BvfiU0mm0D9XxaHecGyLyw7U+7bU4jJsyp8aFqcJE7QXaQKT2vR6NQW2sNve/
	 Cs0UnJQE/4dfrSZs0o3IX+BL0fLOj0wQ+3xhm0rDvujY4rCQkaI7hTkkY29H3H8Wnp
	 bEKIZllfxXn5M37jkD4Yzw+Wujd1dj68woGmm1QE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D6DEF8051E;
	Wed, 29 Sep 2021 10:10:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5E7FF8026D; Wed, 29 Sep 2021 10:10:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99D2EF804B0
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 10:08:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99D2EF804B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="iZ1fQirS"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="jXHcztAq"
Received: from relay1.suse.de (relay1.suse.de [149.44.160.133])
 by smtp-out1.suse.de (Postfix) with ESMTP id EDCE622532
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 08:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632902928; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jfks1gVLL7Ayxjlk/CmzX1TOvM5p3nwOsjqjx3Akf5Q=;
 b=iZ1fQirSOUM/HtPXXyE3j2S2uUus+VaBOfno8RWF1XBpKPE9xRtAtNZVNDPXdmePRFl+qr
 fhUhSrFG9/ug2hj5a3AodyiEy7CKJLfxw/hfU52Vof0jRZP+e8Q+44bht6al+hE3GiCw6p
 mZwCYsS83P+u0Yb7CbouNA0p1TCvSwI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632902928;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jfks1gVLL7Ayxjlk/CmzX1TOvM5p3nwOsjqjx3Akf5Q=;
 b=jXHcztAqNrz/oBiAVgKPIIz47OGmFHgaWjChPKCq3caQPYM/XaJ1PHTBRVk7wdsoUgKwsQ
 qAS2la7M5d3frXBw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay1.suse.de (Postfix) with ESMTP id DD8C825D6E;
 Wed, 29 Sep 2021 08:08:48 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 7/9] ALSA: usb-audio: Add spinlock to stop_urbs()
Date: Wed, 29 Sep 2021 10:08:42 +0200
Message-Id: <20210929080844.11583-8-tiwai@suse.de>
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

In theory, stop_urbs() may be called concurrently.
Although we have the state check beforehand, it's safer to apply
ep->lock during the critical list head manipulations.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 1f757a7eeafe..c32022672319 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -927,6 +927,7 @@ void snd_usb_endpoint_sync_pending_stop(struct snd_usb_endpoint *ep)
 static int stop_urbs(struct snd_usb_endpoint *ep, bool force)
 {
 	unsigned int i;
+	unsigned long flags;
 
 	if (!force && atomic_read(&ep->running))
 		return -EBUSY;
@@ -934,9 +935,11 @@ static int stop_urbs(struct snd_usb_endpoint *ep, bool force)
 	if (!ep_state_update(ep, EP_STATE_RUNNING, EP_STATE_STOPPING))
 		return 0;
 
+	spin_lock_irqsave(&ep->lock, flags);
 	INIT_LIST_HEAD(&ep->ready_playback_urbs);
 	ep->next_packet_head = 0;
 	ep->next_packet_queued = 0;
+	spin_unlock_irqrestore(&ep->lock, flags);
 
 	for (i = 0; i < ep->nurbs; i++) {
 		if (test_bit(i, &ep->active_mask)) {
-- 
2.26.2

