Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8130E5B013F
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 12:05:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AFA51633;
	Wed,  7 Sep 2022 12:04:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AFA51633
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662545132;
	bh=GwdAoHtbQRK3GNuphzrh6uxT/YSdvfn49m/MtNWrhr0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hMrCJxQZII9n2X91jmzJidoz28ZlEOTRcERa3AbyOaEutfNKZmGrh9R8ZEXkym6fq
	 c3geyH2n20d9nwvYtS1kARYKdH4H23XJWmnMsbZEqy+2PZo01ocgFEru7V4tlcpT8I
	 me2xIT0hCfkTOqyxNN4g2+vHo6K2Q+egOu9Bqg5I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7303CF80423;
	Wed,  7 Sep 2022 12:04:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D69C0F8028D; Wed,  7 Sep 2022 12:04:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05087F80118
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 12:04:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05087F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="exAOF65H"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="yZnPunUL"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C818833A34;
 Wed,  7 Sep 2022 10:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662545063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=koam9iWmkqxBblQN/CmFlUFwe/RfoN8dRZBdFAePZnc=;
 b=exAOF65HkbAPQqKh14oxZf74OQloi9Xfi7hxl7pOAA/Xx5zkQ6XKNJrH5sUhmOJNEb2fi/
 ffEx+smYinBuBmlpRcQi9xIRzTosigIBHkxcwuXDNDojYW7zlghfGG+mB0WMmce5jIjsUQ
 TX3EN/snSvwc1CsPudbrWh+iMgfKXac=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662545063;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=koam9iWmkqxBblQN/CmFlUFwe/RfoN8dRZBdFAePZnc=;
 b=yZnPunULAAirfaBiHwh/PtXS7snD9B8xWTxVTRFqdoCITDdrx8+noQ9J7AstwUJo+9ppnJ
 CCHvhqJ549n7dWDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B654513A66;
 Wed,  7 Sep 2022 10:04:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HQsHLKdsGGNaPwAAMHmgww
 (envelope-from <tiwai@suse.de>); Wed, 07 Sep 2022 10:04:23 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Clear fixed clock rate at closing EP
Date: Wed,  7 Sep 2022 12:04:21 +0200
Message-Id: <20220907100421.6443-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
 =?UTF-8?q?Nikl=C4=81vs=20Ko=C4=BCes=C5=86ikovs?=
 <89q1r14hd@relay.firefox.com>, Wim Taymans <wtaymans@redhat.com>
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

The recent commit c11117b634f4 ("ALSA: usb-audio: Refcount multiple
accesses on the single clock") tries to manage the clock rate shared
by several endpoints.  This was intended for avoiding the unmatched
rate by a different endpoint, but unfortunately, it introduced a
regression for PulseAudio and pipewire, too; those applications try to
probe the multiple possible rates (44.1k and 48kHz) and setting up the
normal rate fails but only the last rate is applied.

The cause is that the last sample rate is still left to the clock
reference even after closing the endpoint, and this value is still
used at the next open.  It happens only when applications set up via
PCM prepare but don't start/stop the stream; the rate is reset when
the stream is stopped, but it's not cleared at close.

This patch addresses the issue above, simply by clearing the rate set
in the clock reference at the last close of each endpoint.

Fixes: c11117b634f4 ("ALSA: usb-audio: Refcount multiple accesses on the single clock")
Reported-by: Jason A. Donenfeld <Jason@zx2c4.com>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/all/YxXIWv8dYmg1tnXP@zx2c4.com/
Link: https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/2620
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index a42f2ce19455..8c8f9a851f89 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -925,6 +925,8 @@ void snd_usb_endpoint_close(struct snd_usb_audio *chip,
 		endpoint_set_interface(chip, ep, false);
 
 	if (!--ep->opened) {
+		if (ep->clock_ref && !atomic_read(&ep->clock_ref->locked))
+			ep->clock_ref->rate = 0;
 		ep->iface = 0;
 		ep->altsetting = 0;
 		ep->cur_audiofmt = NULL;
-- 
2.35.3

