Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6B15F8AB7
	for <lists+alsa-devel@lfdr.de>; Sun,  9 Oct 2022 12:44:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D9751697;
	Sun,  9 Oct 2022 12:43:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D9751697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665312249;
	bh=oKVjMAck8D3Eda8DFV51TvNq/ZeOuFGtooJfs885jyg=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CGtg1Hve9Aq8N4eUO1HPdrUGJ+cp4u8vruhyqBk7woPK1dn3fqouwM/7fFoIM+v3w
	 VXjwlzbvnFx/JZ5BeMR9cxSYOOrwbf5Wz8jqqWBd9NBHwVbFFnNaV7DKFjOS+jFur9
	 LTkeRlxg6RQulAP19/qsw7UlJ8hmHgv5g6huPOew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94EFFF80548;
	Sun,  9 Oct 2022 12:42:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDA64F80549; Sun,  9 Oct 2022 12:42:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS,URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FD76F804CB
 for <alsa-devel@alsa-project.org>; Sun,  9 Oct 2022 12:42:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FD76F804CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="F80cDYss"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="aD6G7h5q"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0CCA821941;
 Sun,  9 Oct 2022 10:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665312136; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vO5P1qte9zgckVvw3s7NF9/lc5j4fB4MsV6vreJoehI=;
 b=F80cDYssLXzzNYq0LVwMh6If3AjEXs8Wf8iawkEupLtyqzM6iFLIEoFYRIChyddDk2/Sty
 iZ0abYlzKhWKXkFBbrEv0W+6eF+cbK1DQ1cxkRi88uzSKH5T8HiWHDmtRE3niEFoerFIrM
 9Rw4HyK+qoocX8WOTonuuE4XpFGg5FM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665312136;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vO5P1qte9zgckVvw3s7NF9/lc5j4fB4MsV6vreJoehI=;
 b=aD6G7h5q4q53iNdzP5j63SdqVLyG6uDSltd6zf6CAQhTwRISJTxorJc2gqKYu4nI0TiP9/
 HMc6cqdyQJuyJ4Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DB2F913AC8;
 Sun,  9 Oct 2022 10:42:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kHG6NIelQmMsfAAAMHmgww
 (envelope-from <tiwai@suse.de>); Sun, 09 Oct 2022 10:42:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/4] ALSA: usb-audio: Correct the return code from
 snd_usb_endpoint_set_params()
Date: Sun,  9 Oct 2022 12:42:11 +0200
Message-Id: <20221009104212.18877-4-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221009104212.18877-1-tiwai@suse.de>
References: <20221009104212.18877-1-tiwai@suse.de>
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

snd_usb_endpoint_set_params() should return zero for a success, but
currently it returns the sample rate.  Correct it.

Fixes: 2be79d586454 ("ALSA: usb-audio: Split endpoint setups for hw_params and prepare (take#2)")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index da378e565ef8..44cce6cec9da 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -1386,6 +1386,8 @@ int snd_usb_endpoint_set_params(struct snd_usb_audio *chip,
 	ep->curframesize = ep->curpacksize / ep->cur_frame_bytes;
 
 	err = update_clock_ref_rate(chip, ep);
+	if (err >= 0)
+		err = 0;
  unlock:
 	mutex_unlock(&chip->mutex);
 	return err;
-- 
2.35.3

