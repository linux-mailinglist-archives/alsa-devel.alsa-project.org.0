Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C484939363
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 19:58:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00E76DFA;
	Mon, 22 Jul 2024 19:57:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00E76DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721671085;
	bh=jSXRBTmea23Bh6nLSKsfzc5du2S/jA66z5wIWiahhIE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=EmDkEHGCtHVxBNyOfahezdujbWVCahVxxFNY0NxKMBN8ERxlRz3vambPZLc0WMaHC
	 TrwLT2sbi+Ioy8vnXUfqq+UwlcrJQnE2nacYWyls7hY7dRtIat3VZ6emypY5OhXEmb
	 bHGdQDv9l0x0Fb+nivc3iI41RLTALlgHrtuVbXuY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5ABE6F805D7; Mon, 22 Jul 2024 19:57:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 388A5F805FB;
	Mon, 22 Jul 2024 19:57:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C932DF80580; Mon, 22 Jul 2024 19:52:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5BE13F80579
	for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2024 19:51:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BE13F80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=l+IWxvmh;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ylgCWHwS;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=PkynghIN;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=cT6akZwn
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EE1E721B9F;
	Mon, 22 Jul 2024 17:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721670706; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6CFIWZTpRPaq/HrxpiVG6Y2tOufbF5OzW8UiwtRMJa4=;
	b=l+IWxvmhefEgsRJ3zuC2x8ggdz3mz+o1Swr4i/f2YGqRhKolEEivDMRUy6qt/OIBEHFHVG
	ekatkHkVlqBXb16qVtNmU8rfi7WFcs3nSuDDYN4IwfTWhJ91u5jbJnNMaz08o2ZIf5140E
	yH/iI2XgS4xy/DQyNPMZ51zqBnOzYyM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721670706;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6CFIWZTpRPaq/HrxpiVG6Y2tOufbF5OzW8UiwtRMJa4=;
	b=ylgCWHwSvOgApJWU/kkUSLY2gIzsw9VylMsecEVyA3UUe2DJBPGMlkhZZnHGgZCEQCK6xq
	qfPB5L8dwxob5hBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721670705; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6CFIWZTpRPaq/HrxpiVG6Y2tOufbF5OzW8UiwtRMJa4=;
	b=PkynghINQBfa4HAI4WM2DNyNNztzF46G0c9QT/erW8BPvkTynJ1s09RIuI936xLGWWacug
	nM37wnnrFOsreEVMNduYQEIhpOAp26G35FqzP0lzTOZhRdynI7FuTlWi2iurgwSy/SKvC/
	N0dyCuQsmbgCZ3z+360GzjAiuSMx8k8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721670705;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6CFIWZTpRPaq/HrxpiVG6Y2tOufbF5OzW8UiwtRMJa4=;
	b=cT6akZwn+tgwa/iQblnwx5VM1R43Zffbzt6aZVWNNB8j8GyH81a8eUdqfz41J+R6M8U+F5
	/nAFim3ouX1Ps3BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C5A2D1398E;
	Mon, 22 Jul 2024 17:51:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6Aj0LjGcnmbyBgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 22 Jul 2024 17:51:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils 08/10] aseqdump: Show SysEx prefix to UMP SysEx
 data dump
Date: Mon, 22 Jul 2024 19:52:12 +0200
Message-ID: <20240722175215.8223-9-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240722175215.8223-1-tiwai@suse.de>
References: <20240722175215.8223-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.60 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.999];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
Message-ID-Hash: Q6R2HF6KMFPCX67K5LZ4YZZ6GW6Q75KO
X-Message-ID-Hash: Q6R2HF6KMFPCX67K5LZ4YZZ6GW6Q75KO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q6R2HF6KMFPCX67K5LZ4YZZ6GW6Q75KO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Show the event prefix "SysEx" for UMP SysEx data.  Otherwise it's
difficult to know what it is.

Fixes: 506097ebb184 ("aseqdump: Show UMP SysEx messages")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 seq/aseqdump/aseqdump.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/seq/aseqdump/aseqdump.c b/seq/aseqdump/aseqdump.c
index f717557824ad..7be988fa094b 100644
--- a/seq/aseqdump/aseqdump.c
+++ b/seq/aseqdump/aseqdump.c
@@ -673,6 +673,7 @@ static void dump_ump_sysex_event(const unsigned int *ump)
 	int i, length;
 
 	printf("Group %2d, ", group_number(snd_ump_msg_group(ump)));
+	printf("SysEx ");
 	switch (snd_ump_sysex_msg_status(ump)) {
 	case SND_UMP_SYSEX_STATUS_SINGLE:
 		printf("Single  ");
-- 
2.43.0

