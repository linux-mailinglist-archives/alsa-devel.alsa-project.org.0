Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E82F4A38161
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2025 12:09:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B5D2602C1;
	Mon, 17 Feb 2025 12:09:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B5D2602C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739790593;
	bh=A+iv6qO29XgqD4VG1oVAkB/UtYttbrxjzMWbxAAM21s=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=iYl7ft/9jAsm1tTEdwNVNAYMCxaZzeq6akJtmKnpxh+Sap64FqRKBeX/YpbGRMLkS
	 Shko3hUk8l7nWB5El/kFFARB4RhpdtdfgyxJTS8Ac9VXxumJWyWpVMY2nLo5JUz9yq
	 ZffIig5RGjFt81JYJuuSbEMAguYMrbp1TQCy2GQA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36F7CF805C2; Mon, 17 Feb 2025 12:09:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EAAC7F805BB;
	Mon, 17 Feb 2025 12:09:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46DE2F80246; Mon, 17 Feb 2025 12:09:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 361F0F80100
	for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2025 12:09:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 361F0F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Ko9ofZlJ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=w4dfJm1U;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Ko9ofZlJ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=w4dfJm1U
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0271C1F74B;
	Mon, 17 Feb 2025 11:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1739790544; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=9XJiCv+MN8VTH0o+uw211lMHs6qeJ/8abIhxoTl3zTo=;
	b=Ko9ofZlJAG54GSfwiZL/5iYFNfCiDlv5Rygg+ktvFV7THXQ6hImJVhDsCz2EdmzLC5qicK
	rEe2zDQC/SPJT7aflF3Y1CfMyd9JvGbK5IzxCFaSqCY7HUq7Ax+EvCrQtpT3hAfF5GlY/8
	xSMhGFGdSO6T15TTALOBANDEh+G1TRM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739790544;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=9XJiCv+MN8VTH0o+uw211lMHs6qeJ/8abIhxoTl3zTo=;
	b=w4dfJm1UxrkZo0mt3QMeie/f0k/kGFPSI75nrRsOdFTCAfN93f6Opn8Aqd0evvroIBhol+
	uw8II8NBN2l3FSAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1739790544; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=9XJiCv+MN8VTH0o+uw211lMHs6qeJ/8abIhxoTl3zTo=;
	b=Ko9ofZlJAG54GSfwiZL/5iYFNfCiDlv5Rygg+ktvFV7THXQ6hImJVhDsCz2EdmzLC5qicK
	rEe2zDQC/SPJT7aflF3Y1CfMyd9JvGbK5IzxCFaSqCY7HUq7Ax+EvCrQtpT3hAfF5GlY/8
	xSMhGFGdSO6T15TTALOBANDEh+G1TRM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739790544;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=9XJiCv+MN8VTH0o+uw211lMHs6qeJ/8abIhxoTl3zTo=;
	b=w4dfJm1UxrkZo0mt3QMeie/f0k/kGFPSI75nrRsOdFTCAfN93f6Opn8Aqd0evvroIBhol+
	uw8II8NBN2l3FSAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B429C1379D;
	Mon, 17 Feb 2025 11:09:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qXPKKM8Ys2cnXgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Feb 2025 11:09:03 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib] seq: Fix bogus return of
 snd_seq_client_info_get_ump_conversion()
Date: Mon, 17 Feb 2025 12:08:55 +0100
Message-ID: <20250217110856.30760-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
Message-ID-Hash: JQ5UXQRHPOR62OGKZURLQLUIHIDCGGYN
X-Message-ID-Hash: JQ5UXQRHPOR62OGKZURLQLUIHIDCGGYN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JQ5UXQRHPOR62OGKZURLQLUIHIDCGGYN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

snd_seq_client_info_get_ump_conversion() should have returned the
proper bit of group_filter bit field, but it just did return
midi_version field -- a stupid copy & paste error.  Let's fix it.

Fixes: 2aefb5c41cc0 ("seq: Add UMP support")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 src/seq/seq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/seq/seq.c b/src/seq/seq.c
index d3af93f58579..38cb1afd872f 100644
--- a/src/seq/seq.c
+++ b/src/seq/seq.c
@@ -1870,7 +1870,7 @@ int snd_seq_client_info_get_ump_groupless_enabled(const snd_seq_client_info_t *i
 int snd_seq_client_info_get_ump_conversion(const snd_seq_client_info_t *info)
 {
 	assert(info);
-	return info->midi_version;
+	return !(info->group_filter & SNDRV_SEQ_FILTER_NO_CONVERT);
 }
 
 /**
-- 
2.43.0

