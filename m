Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2936B5F082E
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Sep 2022 12:02:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0DCB1694;
	Fri, 30 Sep 2022 12:01:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0DCB1694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664532150;
	bh=PK3plzZiM17l0pzLWvfyLT89gxqTq7VRyc4sSsBKQ7I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ax7GVIITwbERePWjGR7GpxlUGPqLJy440rTByeMZQb6G6tJeiFwdQ3GX7MIpOFDw+
	 ONJEVnWS/kJZSK1OSMTIse/x2gD0W6HQZG294JCaeHHTleCwdaDAQum6FD3j7IiZTa
	 3cnfP6IeIzFTO5up8khs40GvvthxYYqKKA5aN4jI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 621FDF80095;
	Fri, 30 Sep 2022 12:01:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62D1FF80155; Fri, 30 Sep 2022 12:01:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48FA1F80095
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 12:01:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48FA1F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="xn8I3jCu"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="mbUOfAHk"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BD80A21905;
 Fri, 30 Sep 2022 10:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664532091; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+nOKUquyiv30kaHtOSZU7ykLR2SWdt0i5cN0GwQ/MIs=;
 b=xn8I3jCuQwxHH/KkRDjuHm8r1omEUx6bOfkZVboSRFwssFhgcxzE0TDqH8jwi02hKw8t1A
 Utv1Xfob5EyNGl3ypgOniPOi+ExTmpxtfEqh2Bn6LIZj4JN32Pz4FjOneqbcItYtHT42j+
 urhjZEHCWvDPFXM/rOrIr0r/KLH18Xk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664532091;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+nOKUquyiv30kaHtOSZU7ykLR2SWdt0i5cN0GwQ/MIs=;
 b=mbUOfAHkEz+urC85Dwl2eM21AVUu6a7DEsJj8Dk/gkdGh9QpXtangkMhd8HJIU30DVd8MC
 fowTWb+PM9djMmCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A38AC13677;
 Fri, 30 Sep 2022 10:01:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tHxFJ3u+NmPxagAAMHmgww
 (envelope-from <tiwai@suse.de>); Fri, 30 Sep 2022 10:01:31 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Fix NULL dererence at error path
Date: Fri, 30 Sep 2022 12:01:29 +0200
Message-Id: <20220930100129.19445-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Sabri N . Ferreiro" <snferreiro1@gmail.com>
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

At an error path to release URB buffers and contexts, the driver might
hit a NULL dererence for u->urb pointer, when u->buffer_size has been
already set but the actual URB allocation failed.

Fix it by adding the NULL check of urb.  Also, make sure that
buffer_size is cleared after the error path or the close.

Cc: <stable@vger.kernel.org>
Reported-by: Sabri N. Ferreiro <snferreiro1@gmail.com>
Link: https://lore.kernel.org/r/CAKG+3NRjTey+fFfUEGwuxL-pi_=T4cUskYG9OzpzHytF+tzYng@mail.gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index b2d0b42b581f..36f753a28341 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -95,12 +95,13 @@ static inline unsigned get_usb_high_speed_rate(unsigned int rate)
  */
 static void release_urb_ctx(struct snd_urb_ctx *u)
 {
-	if (u->buffer_size)
+	if (u->urb && u->buffer_size)
 		usb_free_coherent(u->ep->chip->dev, u->buffer_size,
 				  u->urb->transfer_buffer,
 				  u->urb->transfer_dma);
 	usb_free_urb(u->urb);
 	u->urb = NULL;
+	u->buffer_size = 0;
 }
 
 static const char *usb_error_string(int err)
-- 
2.35.3

