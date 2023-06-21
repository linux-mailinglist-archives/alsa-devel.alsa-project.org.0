Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1969F737FC2
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 13:04:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30843844;
	Wed, 21 Jun 2023 13:03:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30843844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687345471;
	bh=OsPUwHyTr2V7nZzKAZZdnJuXGpvMfSY/3sFcvFStALE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=dfKr2vzFHOP8mwzhArESKnXw7HIjd7xwblmhegfUdhF1szdeiiRMW1b0aMDd+7spx
	 6PmS6i3i2JQttqxYa7dG0Ds8rwKilEJMqq7nz+dgjDDp77Fy5MVMCKCqC0A5V9jFsr
	 4ffdku+r0nIbGm9KZyIYHhOR45t3IhkBtrOdZUZM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AAA7F8055C; Wed, 21 Jun 2023 13:02:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4824F80549;
	Wed, 21 Jun 2023 13:02:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4EC6F80169; Wed, 21 Jun 2023 13:02:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3ED37F80163
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 13:02:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3ED37F80163
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Zgkiv+dd;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=/tn+sNMJ
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 876161FDBD;
	Wed, 21 Jun 2023 11:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1687345363; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mFewCFXK/g0dryWshYJeB6V90JnmQN8PBgMjhFgpAVE=;
	b=Zgkiv+dddz2UQEG3boIZkmZzOndVBcaJOO4inquUFC1GRCOFVbHClctZtN4+IRuho6eRFy
	oy3znbl8Nn46GSzlqToKiKazzud8frcGw3Fu19eDQUyykuKpQguU+4syKDeEX7Qb4ID7zS
	NGYN5YxwUBA8MLaCyS9YvxEFME6YmJ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1687345363;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mFewCFXK/g0dryWshYJeB6V90JnmQN8PBgMjhFgpAVE=;
	b=/tn+sNMJ6u/D7lJWGd69L6YtM8bbkx7txHJotLewXWBcGO4dbn2MC1VlciLVcmIjpRyoEF
	ECo5TBHmANSH+sCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7C7A5134B1;
	Wed, 21 Jun 2023 11:02:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id mOkUHtPYkmTdHgAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 21 Jun 2023 11:02:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ALSA: ump: Add no_process_stream flag
Date: Wed, 21 Jun 2023 13:02:40 +0200
Message-Id: <20230621110241.4751-3-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230621110241.4751-1-tiwai@suse.de>
References: <20230621110241.4751-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QBQDIBADJMDSPOKB6ITGGDVRYTNFKMGJ
X-Message-ID-Hash: QBQDIBADJMDSPOKB6ITGGDVRYTNFKMGJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QBQDIBADJMDSPOKB6ITGGDVRYTNFKMGJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is another preliminary patch for USB MIDI 2.0 gadget driver.
Add a new flag, no_process_stream, to snd_ump for suppressing the UMP
Stream message handling in UMP core.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/ump.h | 1 +
 sound/core/ump.c    | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/include/sound/ump.h b/include/sound/ump.h
index 3c7e67475676..2f6a9944c6ef 100644
--- a/include/sound/ump.h
+++ b/include/sound/ump.h
@@ -28,6 +28,7 @@ struct snd_ump_endpoint {
 	u32 stream_wait_for;	/* expected stream message status */
 	bool stream_finished;	/* set when message has been processed */
 	bool parsed;		/* UMP / FB parse finished? */
+	bool no_process_stream;	/* suppress UMP stream messages handling */
 	wait_queue_head_t stream_wait;
 	struct snd_rawmidi_file stream_rfile;
 
diff --git a/sound/core/ump.c b/sound/core/ump.c
index 4150b9c0b35b..5e73c9cf5919 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -854,6 +854,10 @@ static void ump_handle_stream_msg(struct snd_ump_endpoint *ump,
 	unsigned int status;
 	int ret;
 
+	/* UMP stream message suppressed (for gadget UMP)? */
+	if (ump->no_process_stream)
+		return;
+
 	BUILD_BUG_ON(sizeof(*msg) != 16);
 	ump_dbg(ump, "Stream msg: %08x %08x %08x %08x\n",
 		buf[0], buf[1], buf[2], buf[3]);
-- 
2.35.3

