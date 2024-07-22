Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A1A93936A
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 19:59:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CC59845;
	Mon, 22 Jul 2024 19:59:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CC59845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721671197;
	bh=SGkXvjHI6nK1q31QhCcmfZ8ySNY8S0Yo6832vMO4FHE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=SCRfQRTjMfMUHrYZHJaKSQNyXxSeDbQv/5j8ZuFDBR8FEMMAHStS1vHUEEspncYyK
	 kqFa+CV+aQxRbFm2GsCLvNbtrUUP5ca2w4YAB8fUV5Tl0OCPP4wN4fMdEMWGbsuFaY
	 sRps2/jWNk82L2F0RkwIOrJNcwCaGn3fn4Zu25pg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95E94F806F2; Mon, 22 Jul 2024 19:57:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ED2AF80710;
	Mon, 22 Jul 2024 19:57:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C9FCF801F5; Mon, 22 Jul 2024 19:54:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 50571F8007E
	for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2024 19:51:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50571F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=IMQ538DH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=dO5zbBEu;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=IMQ538DH;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=dO5zbBEu
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 31B3B1FB8A;
	Mon, 22 Jul 2024 17:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721670705; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kvB4zTj4+FI/q1XI4nPbs1UMRAVo3A758XbZPAq5UN8=;
	b=IMQ538DHVXXE6xC3hxvgMMnaUOaZydSYpF7XwVITjb7R7Jnn9ray3AFy7H59E/tr/WHhN0
	+wBRvVne4Ks2t1yXP0sBADVJ0GVxSdQLMqRtbS1Z6UdegUWWXfFBk7avO8W5JZzpJzu+ez
	RlDovVwjXQXqNz5ozanBiYECy9SD4n0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721670705;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kvB4zTj4+FI/q1XI4nPbs1UMRAVo3A758XbZPAq5UN8=;
	b=dO5zbBEuKntX1cAlYIfGAqC45MaPMntOL5xZy9qVMjR/xiYK7jz/CEwPa17MZ0JzjJ/ZzU
	FwgC5haeWmI8crAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=IMQ538DH;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=dO5zbBEu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721670705; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kvB4zTj4+FI/q1XI4nPbs1UMRAVo3A758XbZPAq5UN8=;
	b=IMQ538DHVXXE6xC3hxvgMMnaUOaZydSYpF7XwVITjb7R7Jnn9ray3AFy7H59E/tr/WHhN0
	+wBRvVne4Ks2t1yXP0sBADVJ0GVxSdQLMqRtbS1Z6UdegUWWXfFBk7avO8W5JZzpJzu+ez
	RlDovVwjXQXqNz5ozanBiYECy9SD4n0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721670705;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kvB4zTj4+FI/q1XI4nPbs1UMRAVo3A758XbZPAq5UN8=;
	b=dO5zbBEuKntX1cAlYIfGAqC45MaPMntOL5xZy9qVMjR/xiYK7jz/CEwPa17MZ0JzjJ/ZzU
	FwgC5haeWmI8crAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0F05F138A7;
	Mon, 22 Jul 2024 17:51:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GGsgAjGcnmbyBgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 22 Jul 2024 17:51:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils 03/10] aplaymidi: Allow to pass 0 to -u option, too
Date: Mon, 22 Jul 2024 19:52:07 +0200
Message-ID: <20240722175215.8223-4-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240722175215.8223-1-tiwai@suse.de>
References: <20240722175215.8223-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.19 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 31B3B1FB8A
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Bar: /
Message-ID-Hash: STJTT2OQKVMZ3E47HDIEDL2BBRUFDS7T
X-Message-ID-Hash: STJTT2OQKVMZ3E47HDIEDL2BBRUFDS7T
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/STJTT2OQKVMZ3E47HDIEDL2BBRUFDS7T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Specifying -u 0 shouldn't be treated as an error but it should mean
the legacy MIDI 1.0 handling.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 seq/aplaymidi/aplaymidi.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/seq/aplaymidi/aplaymidi.c b/seq/aplaymidi/aplaymidi.c
index dd8d07997985..7aeea824ce0d 100644
--- a/seq/aplaymidi/aplaymidi.c
+++ b/seq/aplaymidi/aplaymidi.c
@@ -996,11 +996,9 @@ int main(int argc, char *argv[])
 			end_delay = atoi(optarg);
 			break;
 		case 'u':
-			if (strcmp(optarg, "1")) {
-				errormsg("Only MIDI 1.0 is supported");
-				return 1;
-			}
-			ump_mode = 1;
+			ump_mode = atoi(optarg);
+			if (ump_mode < 0 || ump_mode > 1)
+				fatal("Only MIDI 1.0 is supported");
 			break;
 		default:
 			usage(argv[0]);
-- 
2.43.0

