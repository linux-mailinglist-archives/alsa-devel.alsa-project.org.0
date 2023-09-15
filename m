Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A347A18DD
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 10:30:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AEE1E0E;
	Fri, 15 Sep 2023 10:30:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AEE1E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694766657;
	bh=NvtKkNS0mgdLpHybT5aYxkcaIR7ncD9OycRU2esFWXs=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=IsnkgzQ2mtWCToyumA/ZdGLqX3KAaKFS3DZ6RBs08u3fEoyqnyIwoEP+hU49c4E1f
	 IqVjjfHIIk4r833qu/RXtadWDDgjFjCXUCliDSczF7f1ZqPaoghyunYlV/F8JLzxwv
	 6qMIpIWPpOHbbwEqCYkeWzJj6F4Cqy/M2qN25Qbk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF39DF80552; Fri, 15 Sep 2023 10:28:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA081F805B4;
	Fri, 15 Sep 2023 10:28:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EEA4F8055C; Fri, 15 Sep 2023 10:28:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75A74F801F5
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 10:28:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75A74F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=WUUApGCO;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=+BI3Zgpd
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B7E4821866;
	Fri, 15 Sep 2023 08:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1694766486; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VstkLaUXZE/SmFaQOloixQ4kN0bqX1olMLIPbKDpVSo=;
	b=WUUApGCOE2+G/KDkeUhZbBI1e1gT6GqoAPLe9ZdMLSTG0lbe68cHWI9oQKn9S6SdrviUVu
	sxNAGR/gVM12HDlTtqzGasdGNusaCwbQF7nXITw5UIY4e2Eu0aIcnNuKs1Dx/MlRPKoT0a
	jUK/JYupG+VAU/p4bOfeaplBIfoN2Ko=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694766486;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VstkLaUXZE/SmFaQOloixQ4kN0bqX1olMLIPbKDpVSo=;
	b=+BI3ZgpdNPFfmBDhOwt4o4Qsl1lQVBVofzHQZhdqfGmkxy9ByhoGHeJYIJJhTy0FSL/jbq
	2XOoTjkOxnXYK+DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 95BAE1358A;
	Fri, 15 Sep 2023 08:28:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id OLJqI5YVBGVfQQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 15 Sep 2023 08:28:06 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/13] ALSA: seq: midi: Fix -Wformat-truncation warning
Date: Fri, 15 Sep 2023 10:27:51 +0200
Message-Id: <20230915082802.28684-3-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230915082802.28684-1-tiwai@suse.de>
References: <20230915082802.28684-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: I2L7SUMJENQY2NRVWIKR4OJWRA5GFRA7
X-Message-ID-Hash: I2L7SUMJENQY2NRVWIKR4OJWRA5GFRA7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I2L7SUMJENQY2NRVWIKR4OJWRA5GFRA7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The compile warnings with -Wformat-truncation appearing at
snd_seq_midisynth_probe() in seq_midi.c are false-positive; those must
fit within the given string size.

For suppressing the warning, replace snprintf() with scnprintf().
As stated in the above, truncation doesn't matter.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_midi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/seq/seq_midi.c b/sound/core/seq/seq_midi.c
index 44302d98950e..18320a248aa7 100644
--- a/sound/core/seq/seq_midi.c
+++ b/sound/core/seq/seq_midi.c
@@ -349,9 +349,9 @@ snd_seq_midisynth_probe(struct device *_dev)
 		if (! port->name[0]) {
 			if (info->name[0]) {
 				if (ports > 1)
-					snprintf(port->name, sizeof(port->name), "%s-%u", info->name, p);
+					scnprintf(port->name, sizeof(port->name), "%s-%u", info->name, p);
 				else
-					snprintf(port->name, sizeof(port->name), "%s", info->name);
+					scnprintf(port->name, sizeof(port->name), "%s", info->name);
 			} else {
 				/* last resort */
 				if (ports > 1)
-- 
2.35.3

