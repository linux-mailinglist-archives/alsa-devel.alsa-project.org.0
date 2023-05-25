Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3C471076C
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 10:32:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09214825;
	Thu, 25 May 2023 10:31:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09214825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685003549;
	bh=gLE6atwbXfyB8LdhVJxtYTlBdpJcgv/0I1RpzdTtOqY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FSEdffdw3WO5WUk7JvT+m+I+DHnrwn//MFd24Go6XxeLlEIN7KkSNnAy7wqBzNSJf
	 /BC5YAQ7q3TA0msnGZK+4T7/PfV5Y9gELJcFc0/2IVOvsI7RB+0Qg9jXn3TzDBOAst
	 cjCZqejk5GpVGAWsxi89IWHlHZq1XWwniTsg3+kE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8294F80558; Thu, 25 May 2023 10:31:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35466F80249;
	Thu, 25 May 2023 10:31:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 103CCF8024E; Thu, 25 May 2023 10:31:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0AF44F80249
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 10:31:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AF44F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=oLDBbTg5;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=O7RzbkAL
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7AB5F21D1F;
	Thu, 25 May 2023 08:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1685003488;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=1vfaA4+pkWAA6TMGbFG3XewEliaJ+L4s9UyhIfpw/fE=;
	b=oLDBbTg5inpWZ7N947AETIwVwA+tx0FXND/RQl78IhtDz31HHDJFLKVZSj7jTfyIVeGVMu
	6IJRX4/ug4Y+D3kaYcUB1aO5+ycmIhgg+Bs1x8gTz9pCwoZgibLSnXwc7vuGUv+LN5wnym
	/+/6WS0NlXgCnNTW7r6pwrpGBygoUzo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1685003488;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=1vfaA4+pkWAA6TMGbFG3XewEliaJ+L4s9UyhIfpw/fE=;
	b=O7RzbkALm3BAg6pcFXOLReNtTkHw/bA6nufogeya4NcieCtr2p0ZhYeDT8vHhNWA9ZPGnm
	XCLID4LB8IjBtrDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5114E13356;
	Thu, 25 May 2023 08:31:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 2XT1EuAcb2S8OwAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 25 May 2023 08:31:28 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH 1/2] ALSA: ump: Drop redundant check of note-on with zero
 velocity
Date: Thu, 25 May 2023 10:31:23 +0200
Message-Id: <20230525083124.15277-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PRCU7WCAZW5PK4P3IESKA62WTHI5Z7ZV
X-Message-ID-Hash: PRCU7WCAZW5PK4P3IESKA62WTHI5Z7ZV
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PRCU7WCAZW5PK4P3IESKA62WTHI5Z7ZV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The check of a note-on event with zero velocity is done twice, and the
latter one is superfluous.  Let's drop it.

Fixes: 0b5288f5fe63 ("ALSA: ump: Add legacy raw MIDI support")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/4683198a-84f6-4238-9e87-c70667d84523@kili.mountain
Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/ump_convert.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/core/ump_convert.c b/sound/core/ump_convert.c
index cb7c2f959a27..164829d3e305 100644
--- a/sound/core/ump_convert.c
+++ b/sound/core/ump_convert.c
@@ -340,9 +340,6 @@ static int cvt_legacy_cmd_to_ump(struct snd_ump_endpoint *ump,
 
 	switch (status) {
 	case UMP_MSG_STATUS_NOTE_ON:
-		if (!buf[2])
-			status = UMP_MSG_STATUS_NOTE_OFF;
-		fallthrough;
 	case UMP_MSG_STATUS_NOTE_OFF:
 		midi2->note.note = buf[1];
 		midi2->note.velocity = upscale_7_to_16bit(buf[2]);
-- 
2.35.3

