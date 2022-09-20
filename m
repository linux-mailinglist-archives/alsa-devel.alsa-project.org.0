Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FD45BEC9D
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 20:12:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61C99852;
	Tue, 20 Sep 2022 20:11:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61C99852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663697563;
	bh=LI+ORPH3iDBEFs12HuIcG7/Bzq4Qq2Gk9yL9HCuhNRE=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=olHrv384vyg5cEburt9RcNMUOb9uT6iObAQvbBawck/kYEatMWsb64dURG70fcNUq
	 FEHE/ZVH92X+EVMCfq/hsZ3AXctbjMvPg6cqYPw4xBH7zW4ALbYBr7DkWTUzJJX2Bp
	 5XpeYkoAuLBn6MO5LkXCKdBlYtHa8S9PoF39u2Yc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5D31F804DA;
	Tue, 20 Sep 2022 20:11:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FF5BF8012B; Tue, 20 Sep 2022 20:11:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5787FF8012B
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 20:11:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5787FF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="hr8Hzwau"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="Xp0sBwlY"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DA29F21A99;
 Tue, 20 Sep 2022 18:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663697487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=KLtCb51gnsxByq4Gfb2Ca9LcGJ1eu+mJK+StsJ2d+QE=;
 b=hr8HzwauJoo0g5j3xRt5Qb+39l6VjRKa8rGIBWlAzln1n0SykI/vp6MV8eXgsGjITRtn+6
 AscdxEU3I2lC8WKVKKxDHwm/zfupG6a3XfGjWp7ORM+dH05uYt5jd19oPjDMM6+gu03EF7
 svUuGob3OyFyLlvxUzWkGLyKpHtnDos=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663697487;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=KLtCb51gnsxByq4Gfb2Ca9LcGJ1eu+mJK+StsJ2d+QE=;
 b=Xp0sBwlY2UpWkidRQu1l2p7oIpzZHMIf/JvbmuIQq/+nUHFK0oV+nt+ZoDBBNOeW83FGDz
 vfi0SfrANns2WqBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BEB961346B;
 Tue, 20 Sep 2022 18:11:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nyjaLU8CKmPRdQAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 20 Sep 2022 18:11:27 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Properly refcounting clock rate
Date: Tue, 20 Sep 2022 20:11:26 +0200
Message-Id: <20220920181126.4912-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
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

We fixed the bug introduced by the patch for managing the shared
clocks at the commit 809f44a0cc5a ("ALSA: usb-audio: Clear fixed clock
rate at closing EP"), but it was merely a workaround.  By this change,
the clock reference rate is cleared at each EP close, hence the still
remaining EP may need a re-setup of rate unnecessarily.

This patch introduces the proper refcounting for the clock reference
object so that the clock setup is done only when needed.

Fixes: 809f44a0cc5a ("ALSA: usb-audio: Clear fixed clock rate at closing EP")
Fixes: c11117b634f4 ("ALSA: usb-audio: Refcount multiple accesses on the single clock")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 0c94ebc98e90..b2d0b42b581f 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -39,6 +39,7 @@ struct snd_usb_iface_ref {
 struct snd_usb_clock_ref {
 	unsigned char clock;
 	atomic_t locked;
+	int opened;
 	int rate;
 	bool need_setup;
 	struct list_head list;
@@ -803,6 +804,7 @@ snd_usb_endpoint_open(struct snd_usb_audio *chip,
 				ep = NULL;
 				goto unlock;
 			}
+			ep->clock_ref->opened++;
 		}
 
 		ep->cur_audiofmt = fp;
@@ -926,8 +928,10 @@ void snd_usb_endpoint_close(struct snd_usb_audio *chip,
 		endpoint_set_interface(chip, ep, false);
 
 	if (!--ep->opened) {
-		if (ep->clock_ref && !atomic_read(&ep->clock_ref->locked))
-			ep->clock_ref->rate = 0;
+		if (ep->clock_ref) {
+			if (!--ep->clock_ref->opened)
+				ep->clock_ref->rate = 0;
+		}
 		ep->iface = 0;
 		ep->altsetting = 0;
 		ep->cur_audiofmt = NULL;
@@ -1649,8 +1653,7 @@ void snd_usb_endpoint_stop(struct snd_usb_endpoint *ep, bool keep_pending)
 			WRITE_ONCE(ep->sync_source->sync_sink, NULL);
 		stop_urbs(ep, false, keep_pending);
 		if (ep->clock_ref)
-			if (!atomic_dec_return(&ep->clock_ref->locked))
-				ep->clock_ref->rate = 0;
+			atomic_dec(&ep->clock_ref->locked);
 	}
 }
 
-- 
2.35.3

