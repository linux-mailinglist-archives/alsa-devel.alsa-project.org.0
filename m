Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E38990F227
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2024 17:29:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DF56A4B;
	Wed, 19 Jun 2024 17:29:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DF56A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718810965;
	bh=igA+pMrIHj0aA5tw+c4Co0K5K5XbKx6I/lEP2rwGHMQ=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hWIW24UCbL7lLxUTVoIcP+AAKKZR8juTb4hlVinPc9tD4hGgc6sw4ey/7IHFGOqm7
	 IudTo8cHEdGozlYNMjFkrZGude5cvn742VMYqu6KtKdJkRwqbqomIgQ4+SsMr4aJZJ
	 S4QfsZ4sbNcqM1esI+eBh+8z115XX6wMin8W1SX4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A7A9F805B4; Wed, 19 Jun 2024 17:28:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 031B1F805B2;
	Wed, 19 Jun 2024 17:28:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39DDCF804F2; Wed, 19 Jun 2024 17:28:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED9D7F80154
	for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2024 17:28:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED9D7F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=F8skvmEk;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ZNZk3Nbz;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=F8skvmEk;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ZNZk3Nbz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DD57321A2D;
	Wed, 19 Jun 2024 15:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1718810910; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=sTiceUumyFuX10RTfw4OjGbsVR70tqVan6SC9YEUva0=;
	b=F8skvmEk+9IJb4zEG/mT+E1h48GohYJODk/7H8uOFiq9n/qv8rsh7WGEkN8BLf9mO/DuUU
	omqbIHoMtKPLF5JnTrV0LV/WKzZ0A3/yjWDXGpKtaXjuYYvpbBPCY+zaTee6pFHl5Hiq0N
	T9ibGDPJRuoNMpYrhFI3zYbF3/fP/H8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718810910;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=sTiceUumyFuX10RTfw4OjGbsVR70tqVan6SC9YEUva0=;
	b=ZNZk3NbzbswbphKfuplrI8LWkmj36jnRN83zJDvgA2UiT7+SxAcZtLvwEV9VbnAx8Am1Y+
	/hz81eGZmzP/hzAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1718810910; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=sTiceUumyFuX10RTfw4OjGbsVR70tqVan6SC9YEUva0=;
	b=F8skvmEk+9IJb4zEG/mT+E1h48GohYJODk/7H8uOFiq9n/qv8rsh7WGEkN8BLf9mO/DuUU
	omqbIHoMtKPLF5JnTrV0LV/WKzZ0A3/yjWDXGpKtaXjuYYvpbBPCY+zaTee6pFHl5Hiq0N
	T9ibGDPJRuoNMpYrhFI3zYbF3/fP/H8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718810910;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=sTiceUumyFuX10RTfw4OjGbsVR70tqVan6SC9YEUva0=;
	b=ZNZk3NbzbswbphKfuplrI8LWkmj36jnRN83zJDvgA2UiT7+SxAcZtLvwEV9VbnAx8Am1Y+
	/hz81eGZmzP/hzAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C0FA413668;
	Wed, 19 Jun 2024 15:28:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8v3tLR75cmYRJAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 19 Jun 2024 15:28:30 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 0/4] Add API helper functions for creating UMP
 Endpoint and Blocks
Date: Wed, 19 Jun 2024 17:28:49 +0200
Message-ID: <20240619152855.6809-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.33 / 50.00];
	BAYES_HAM(-1.53)[91.89%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
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
Message-ID-Hash: I4LD2DQL26EFKMW3SOCY4YZG6QUHOVRR
X-Message-ID-Hash: I4LD2DQL26EFKMW3SOCY4YZG6QUHOVRR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I4LD2DQL26EFKMW3SOCY4YZG6QUHOVRR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

this is a patch set to alsa-lib to add the new API functions for
creating a virtual UMP Endpoint and UMP Blocks arbitrarily from a
user-space, that is, to create a virtual UMP device.

An example program is included in test directory.


Takashi

===

Takashi Iwai (4):
  ump: Add missing *_set variants for snd_ump_endpoint_info and
    snd_ump_block_info
  seq: Add API helper functions for creating UMP Endpoint and Blocks
  test: Add an example program to create a virtual UMP Endpoint
  Add test/seq-ump-example to .gitignore

 .gitignore             |   1 +
 include/seqmid.h       |   7 +
 include/ump.h          |  36 ++++-
 src/rawmidi/ump.c      | 304 +++++++++++++++++++++++++++++++++++++++--
 src/seq/seq.c          |   6 +-
 src/seq/seq_local.h    |   4 +
 src/seq/seqmid.c       | 249 +++++++++++++++++++++++++++++++++
 test/Makefile.am       |   3 +-
 test/seq-ump-example.c | 187 +++++++++++++++++++++++++
 9 files changed, 783 insertions(+), 14 deletions(-)
 create mode 100644 test/seq-ump-example.c

-- 
2.43.0

