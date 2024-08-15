Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B3F953630
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2024 16:50:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 891292BAA;
	Thu, 15 Aug 2024 16:49:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 891292BAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723733405;
	bh=ke6VNv1lAVkxRscQyt5m4O5ycbGVyRyFHfkcFZkcQ4s=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HOlSatIn4HzqATfMqm7yXbVzeFQNW0HcJDgYaji4WZRe8nTN8cLkx/dwoYWF9DTBz
	 nEuCIZBNCNGgoYDtJKD8xoKPs35uswCI19dZCJQvvc5o7lOJ3pwBq3oe5Aw7Xj3zpQ
	 DuIAAv28NzCsWjnmhfrND5ZGgSEIF6BKPC88X+l4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2C8DF805E0; Thu, 15 Aug 2024 16:49:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 964EEF805AE;
	Thu, 15 Aug 2024 16:49:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAA01F80423; Thu, 15 Aug 2024 16:42:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A205F800B0
	for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2024 16:40:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A205F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=RfUoP3G6;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Uadqpp+A;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=p6tEA6KU;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=4IBnLcmb
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CFD7B221E4;
	Thu, 15 Aug 2024 14:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1723732825; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=zGooQYVTddePbfHEckKN/ir2vzacfuY8GeAmthSLqeo=;
	b=RfUoP3G6crS2IgwHgmQO5cGABQocsABzv2pzd7UnrpQnc6YQ+XOjWduGjrYjrpQpdy6ToT
	qiEVttUFqxJF+03I2Tofof6PTdVs2PE/G7j2TX5FGqgZ12Ed2kgScr7x86L6ygNdscrksB
	GUU5NCMGM7ZKuyiRyPnbA3FbTQV/pk8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723732825;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=zGooQYVTddePbfHEckKN/ir2vzacfuY8GeAmthSLqeo=;
	b=Uadqpp+AgYwe5GQv27xeZ8yErB4KVhyLgJT9ObNZpoMS0MnQCOYyPtOzejQoLpxqzdRhPY
	k/m8UM0nA5zdFABg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=p6tEA6KU;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4IBnLcmb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1723732824; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=zGooQYVTddePbfHEckKN/ir2vzacfuY8GeAmthSLqeo=;
	b=p6tEA6KUTTTgn/KlshlmDuB/yLbMz4vUl8CjGNzFfk+m9oxOoXUuGoLMHh4yHimI7reHzX
	AJLXin4+i46GP2l7N88aqpIr2we0uarGxmqupe9K5faWYmZfjS/FPL1xhTABo3A3FDD2GT
	bjWtrWLRIogQLDANppd7v70dXEj9cDg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723732824;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=zGooQYVTddePbfHEckKN/ir2vzacfuY8GeAmthSLqeo=;
	b=4IBnLcmbuESUTmbh1gqSgK+qoIrihmtUQ8YXnp+Wc/MtDDiFL3l2vzJUhOy3vcODAhKiz2
	O9+EVSyxpF+OiRBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A954913983;
	Thu, 15 Aug 2024 14:40:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4fA2J1gTvmaMfgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 15 Aug 2024 14:40:24 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib] control: Make ump_{endpoint|block}_info calls
 optional
Date: Thu, 15 Aug 2024 16:41:02 +0200
Message-ID: <20240815144103.13141-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-5.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_DN_NONE(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email]
X-Rspamd-Queue-Id: CFD7B221E4
X-Rspamd-Action: no action
Message-ID-Hash: V3UXR73RD7QF5K6JYJNZODPQ3OTEXSZ6
X-Message-ID-Hash: V3UXR73RD7QF5K6JYJNZODPQ3OTEXSZ6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V3UXR73RD7QF5K6JYJNZODPQ3OTEXSZ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the NULL check for ump_endpoint_info and ump_block_info calls.
Those can be NULl depending on the target.

Fixes: 81b0cf46d16a ("control: Add UMP Endpoint and Block info query support")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 src/control/control.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/src/control/control.c b/src/control/control.c
index d77ab24cc69c..e443d5436103 100644
--- a/src/control/control.c
+++ b/src/control/control.c
@@ -1293,7 +1293,10 @@ int snd_ctl_ump_next_device(snd_ctl_t *ctl, int *device)
 int snd_ctl_ump_endpoint_info(snd_ctl_t *ctl, snd_ump_endpoint_info_t *info)
 {
 	assert(ctl && info);
-	return ctl->ops->ump_endpoint_info(ctl, info);
+	fprintf(stderr, "%s:%d\n", __func__, __LINE__);
+	if (ctl->ops->ump_endpoint_info)
+		return ctl->ops->ump_endpoint_info(ctl, info);
+	return -ENXIO;
 }
 
 /**
@@ -1305,7 +1308,9 @@ int snd_ctl_ump_endpoint_info(snd_ctl_t *ctl, snd_ump_endpoint_info_t *info)
 int snd_ctl_ump_block_info(snd_ctl_t *ctl, snd_ump_block_info_t *info)
 {
 	assert(ctl && info);
-	return ctl->ops->ump_block_info(ctl, info);
+	if (ctl->ops->ump_block_info)
+		return ctl->ops->ump_block_info(ctl, info);
+	return -ENXIO;
 }
 
 /**
-- 
2.43.0

