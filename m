Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFCC53E5A3
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 18:10:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 393BC1A90;
	Mon,  6 Jun 2022 18:09:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 393BC1A90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654531846;
	bh=N5k6/hRuI9AyJFz7PMaRYfsY/gVcl3HbQQ/8s6zPXAw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CsWaPGwepoukQm8Trn6UsYpHDIfYvzn+l3xLxLXh4nZJdSt7ogN3praepMdj4pLtO
	 T6pTHi5GuvhLe1tL4zp1X32FPYV7QrNVUykTRxJ7ZzwfNE0cD5O7YAkPS2THB2MZNV
	 hYLg9VefmCwGTWNPb6I+t+RXdcCHaHdARHkB87ew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9CB8F8052F;
	Mon,  6 Jun 2022 18:09:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E69CBF8051E; Mon,  6 Jun 2022 18:09:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2CD8F8051E
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 18:09:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2CD8F8051E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="vDNF3d4r"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="0oUDfonD"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C781B21B04;
 Mon,  6 Jun 2022 16:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1654531753; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nF1SK7dK9r0pT4UeBKfa7xvQOwIagFDlsVW0Swm1k4A=;
 b=vDNF3d4rlWF2ybYS3CW/kcYnZo0KBStrlupQvRBIWTO8hOZW14ErvZyIlon70V7lbX2CLO
 YByvgTGu7jksHrbEZ2OVJo7Jnsk088FQyvhrmdj83/TiBd2H3z2yCSjGsr+t2A8XA6fIor
 E7hptDY/dQhccyyb74639I0I1osTHMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1654531753;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nF1SK7dK9r0pT4UeBKfa7xvQOwIagFDlsVW0Swm1k4A=;
 b=0oUDfonDhgffPkWsZe1Rb+knggMIQ/v8Q7KON9pbObdEDx0vcu34QOzFyCU1KjjuoiUUyN
 FRMi6VX7ombE6KAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ABED413A5F;
 Mon,  6 Jun 2022 16:09:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EJVFKakmnmKoAwAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 06 Jun 2022 16:09:13 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ALSA: usb-audio: Set up (implicit) sync for Saffire 6
Date: Mon,  6 Jun 2022 18:09:10 +0200
Message-Id: <20220606160910.6926-3-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220606160910.6926-1-tiwai@suse.de>
References: <20220606160910.6926-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Andr=C3=A9=20Kapelrud?= <a.kapelrud@gmail.com>
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

Focusrite Saffire 6 has fixed audioformat quirks with multiple
endpoints assigned to a single altsetting.  Unfortunately the generic
parser couldn't detect the sync endpoint correctly as the implicit
sync due to the missing EP attribute bits.  In the former kernels, it
used to work somehow casually, but it's been broken for a while after
the large code change in 5.11.

This patch cures the regression by the following:
- Allow the static quirk table to provide the sync EP information;
  we just need to fill the fields and let the generic parser skipping
  parsing if sync_ep is already set.
- Add the sync endpoint information to the entry for Saffire 6.

Fixes: 7b0efea4baf0 ("ALSA: usb-audio: Add missing ep_idx in fixed EP quirks")
Reported-and-tested-by: André Kapelrud <a.kapelrud@gmail.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/pcm.c          | 3 +++
 sound/usb/quirks-table.h | 7 ++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index b0369df53910..e692ae04436a 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -291,6 +291,9 @@ int snd_usb_audioformat_set_sync_ep(struct snd_usb_audio *chip,
 	bool is_playback;
 	int err;
 
+	if (fmt->sync_ep)
+		return 0; /* already set up */
+
 	alts = snd_usb_get_host_interface(chip, fmt->iface, fmt->altsetting);
 	if (!alts)
 		return 0;
diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 78eb41b621d6..4f56e1784932 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -2658,7 +2658,12 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 					.nr_rates = 2,
 					.rate_table = (unsigned int[]) {
 						44100, 48000
-					}
+					},
+					.sync_ep = 0x82,
+					.sync_iface = 0,
+					.sync_altsetting = 1,
+					.sync_ep_idx = 1,
+					.implicit_fb = 1,
 				}
 			},
 			{
-- 
2.35.3

