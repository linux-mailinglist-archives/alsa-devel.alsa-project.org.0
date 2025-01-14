Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B06F1A1026E
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2025 09:56:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A3A76028B;
	Tue, 14 Jan 2025 09:55:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A3A76028B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1736844961;
	bh=VdYDiQKfYHXl9v3+EulRoFi1u5ObdVFOsa86/Um9fR8=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ngTg4x2ksuACdRKYUTeZP+gLwhsoqHxknz5GKHf4z5/nPXOZ0RHM7s3qrnOgODHuK
	 CfNehdQjuj+9/UP6Jk0YARpWSWddBzeV3O3dKROxgZZOy+m2nxCTAzgF1u83UkvNep
	 r5EtEaZ2Da8q/FsqownxjwbXnjMcn2tPwtAZMYpc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED48DF805C0; Tue, 14 Jan 2025 09:55:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1164F80563;
	Tue, 14 Jan 2025 09:55:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE28FF80563; Tue, 14 Jan 2025 09:55:22 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A5D85F80169
	for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2025 09:55:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5D85F80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=2MH7151y;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=a6rAA4JW;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=2MH7151y;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=a6rAA4JW
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 877681F38F;
	Tue, 14 Jan 2025 08:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1736844919; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=OojZwKdWg3WYnuLYlIALBY0L6+nUhieIC8NNsR4LqXI=;
	b=2MH7151y7PvTa51k7CO5ccshlaTS5vAhiVttVuNPeSnv3sYD8SWb4+TXwi2O8HWHpIJR1J
	gN8Uvj4Iyqfx7FrM/cnP34wB1FmgdCFc8PEkz/Jqow0LTFZ5mWrp1EyVRkEZIXKZVsw5dS
	IjWRUf16etbpJYI/KuH0HmwGopi/S3I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736844919;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=OojZwKdWg3WYnuLYlIALBY0L6+nUhieIC8NNsR4LqXI=;
	b=a6rAA4JWedDglraT5dqLTbuXve6i8aMaK86hNwYGju9OEuAuYPzonhgm08AQKnZlTaWeIj
	gsw1zX4O7/fdPhDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1736844919; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=OojZwKdWg3WYnuLYlIALBY0L6+nUhieIC8NNsR4LqXI=;
	b=2MH7151y7PvTa51k7CO5ccshlaTS5vAhiVttVuNPeSnv3sYD8SWb4+TXwi2O8HWHpIJR1J
	gN8Uvj4Iyqfx7FrM/cnP34wB1FmgdCFc8PEkz/Jqow0LTFZ5mWrp1EyVRkEZIXKZVsw5dS
	IjWRUf16etbpJYI/KuH0HmwGopi/S3I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736844919;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=OojZwKdWg3WYnuLYlIALBY0L6+nUhieIC8NNsR4LqXI=;
	b=a6rAA4JWedDglraT5dqLTbuXve6i8aMaK86hNwYGju9OEuAuYPzonhgm08AQKnZlTaWeIj
	gsw1zX4O7/fdPhDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5F5A41384C;
	Tue, 14 Jan 2025 08:55:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id H3LvFXcmhmcHbQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Jan 2025 08:55:19 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 0/5] Updates for rawmidi / sequencer 
Date: Tue, 14 Jan 2025 09:55:08 +0100
Message-ID: <20250114085515.11880-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	SUBJECT_ENDS_SPACES(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
Message-ID-Hash: RZSA6KUE5F2ZOICNC6IGLZN2H6OMNXC6
X-Message-ID-Hash: RZSA6KUE5F2ZOICNC6IGLZN2H6OMNXC6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RZSA6KUE5F2ZOICNC6IGLZN2H6OMNXC6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The kernel 6.14 will receive a few small enhancements for rawmidi
and sequencer APIs, and this patch set covers those.


Takashi

===

Takashi Iwai (5):
  Sync UAPI asound.h with 6.14 kernel
  Sync UAPI asequencer.h with 6.14 kernel
  rawmidi: Extensions for tied device and substream inactive flag
  rawmidi: Make rawmidi flag bits doxygen-style comments
  seq: Define new events for UMP EP/FB change notifications

 include/local.h                 |  1 +
 include/rawmidi.h               |  4 +++-
 include/seq_event.h             | 12 ++++++++++++
 include/sound/uapi/asequencer.h | 12 +++++++++++-
 include/sound/uapi/asound.h     |  8 ++++++--
 src/rawmidi/rawmidi.c           | 22 +++++++++++++++++++++-
 6 files changed, 54 insertions(+), 5 deletions(-)

-- 
2.43.0

