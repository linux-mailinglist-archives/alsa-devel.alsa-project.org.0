Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 258187A18E4
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 10:32:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DCB9E11;
	Fri, 15 Sep 2023 10:31:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DCB9E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694766737;
	bh=4xpHRB3mcyohwp+a2T+yrIcFW3YF3QHo9bMguqd7Fsc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=WPoJ5DDoYt+sgz09WRUqp/3ZU2lWtiFYwz99RwRVoC8e20PMmK8DImnq8jZtrreo7
	 dlb8vCOC1eXeA1OXSX3xcB8xLDcrf33aD1nz0ruMlE7nSoklvnyioSmhJjYXENpV+f
	 QWVr4Oh0YbzRFCf4ab6fNRu1eJMT52ztpxU4zy4s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68693F805F3; Fri, 15 Sep 2023 10:28:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 898DCF805ED;
	Fri, 15 Sep 2023 10:28:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E54B6F805AC; Fri, 15 Sep 2023 10:28:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75AD6F80246
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 10:28:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75AD6F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=qjJqyWHI;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=1j0aNE03
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D75131F38C;
	Fri, 15 Sep 2023 08:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1694766486; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HHX1bGm0oWlRyStPYNVSB7AJmOVXzxA6vzcpaGjCb3A=;
	b=qjJqyWHI/qCP822tnwR6n1Fm+jmSBcrOB7nli6Ik2hl1+rYyAneKkpCHuJk7asWrEJE7nr
	7zN80wx2UqiXRWeGXx+MhMtU24enPe2fR5N5DaXiOup68pRaX1Od5f+SZKDLX++99tMJtc
	ZZtuvj/9oxnAANEd8lawxZVumtLvdOU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694766486;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HHX1bGm0oWlRyStPYNVSB7AJmOVXzxA6vzcpaGjCb3A=;
	b=1j0aNE03WMwCOzKHaz5jn+pq+fQPWAFlTwzkYMnNLvS73VeVpaMhp4/uQjQxv3dISikUAF
	WDnSZE4dz7a8GiAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BCB581358A;
	Fri, 15 Sep 2023 08:28:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id gL8VLZYVBGVfQQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 15 Sep 2023 08:28:06 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/13] ALSA: usb-audio: scarlett_gen2: Fix -Wformat-truncation
 warning
Date: Fri, 15 Sep 2023 10:27:52 +0200
Message-Id: <20230915082802.28684-4-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230915082802.28684-1-tiwai@suse.de>
References: <20230915082802.28684-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6UQHDVZN6FAAGF3CXDTVWX52ZU4YR55I
X-Message-ID-Hash: 6UQHDVZN6FAAGF3CXDTVWX52ZU4YR55I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6UQHDVZN6FAAGF3CXDTVWX52ZU4YR55I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The recent enablement of -Wformat-truncation leads to a false-positive
warning for mixer_scarlett_gen2.c.

For suppressing the warning, replace snprintf() with scnprintf().
As stated in the above, truncation doesn't matter.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer_scarlett_gen2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 9d11bb08667e..5c6f50f38840 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -3218,8 +3218,8 @@ static int scarlett2_add_line_in_ctls(struct usb_mixer_interface *mixer)
 			int from = i * info->inputs_per_phantom + 1;
 			int to = (i + 1) * info->inputs_per_phantom;
 
-			snprintf(s, sizeof(s), fmt2, from, to,
-				 "Phantom Power", "Switch");
+			scnprintf(s, sizeof(s), fmt2, from, to,
+				  "Phantom Power", "Switch");
 			err = scarlett2_add_new_ctl(
 				mixer, &scarlett2_phantom_ctl,
 				i, 1, s, &private->phantom_ctls[i]);
-- 
2.35.3

