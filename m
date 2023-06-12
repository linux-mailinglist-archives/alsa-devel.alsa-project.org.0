Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D38C72BA3C
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 10:21:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF04E823;
	Mon, 12 Jun 2023 10:21:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF04E823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686558115;
	bh=kRTuUsDGzNIqaXundDhxLz9ewOxJLY7tiIXBc0aDmpk=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Ng9VIVvik5tRyhfITKuYW9bIBAb2MhQqnYQevAl5lGVitfHoDWvPWT6ZKvGqK4yw+
	 z7Aw7JIwY2V1rizlaHNjpAagYyIKmQqLfxN3lZfUMJuG38jVVFR+eJcutuoTqXYsBZ
	 B2u8ozzW1hc6UHSYKoKBPn2vNWWq95tFyjUX9Hww=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 619BBF80568; Mon, 12 Jun 2023 10:20:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8A56F8055A;
	Mon, 12 Jun 2023 10:20:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDF14F80563; Mon, 12 Jun 2023 10:20:11 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3DBDAF8055A
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 10:20:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DBDAF8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=H3q/0UT0;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=D4JAonZ/
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2B43D20485;
	Mon, 12 Jun 2023 08:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686558000; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=fFZAH+W+EWqVmjHXokmN4zOKmw157T8QcyXW4VRICcs=;
	b=H3q/0UT056v/0AKV/xrtS87lqQFb/CvhcIuZ8mzlZfw0uN0nLDsJObNgYFihv2fw2pNT82
	53UWY0i4rwLCmcTp9tAcsT5Bty1ZRl0hJLQ9N0fp3YrNYkDs33rJbuyRUIpxMij+95Wmnk
	9y9NL68VRsaVrkfmSnvRbwQhakmXj7c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686558000;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=fFZAH+W+EWqVmjHXokmN4zOKmw157T8QcyXW4VRICcs=;
	b=D4JAonZ/JoQZtnH1XjjOlimuk4gkCytvEPx5fZRZt482ihHFDfiCitpFQhVtJxshjiO2qG
	ET7aPOihoHzaK3Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0D035138EC;
	Mon, 12 Jun 2023 08:20:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id uGI5AjDVhmT5cwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 12 Jun 2023 08:20:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 0/3] ALSA-lib updates for UMP 1.1
Date: Mon, 12 Jun 2023 10:19:45 +0200
Message-Id: <20230612081948.18346-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VRHRNEDZQTYZYXGGIN6K3P2EUHDEXOPC
X-Message-ID-Hash: VRHRNEDZQTYZYXGGIN6K3P2EUHDEXOPC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VRHRNEDZQTYZYXGGIN6K3P2EUHDEXOPC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

this is a patch set for updating alsa-lib to catch up the changes for
MIDI 2.0 UMP v1.1 features.  The basic functionality remains, while
the uapi header is updated a few API functions for the new features
are added.


Takashi

===

Takashi Iwai (3):
  uapi: Update rawmidi API to 2.0.4
  ump: Add UMP 1.1 features
  seq: Add UMP 1.1 features

 include/seq.h                   |  3 ++
 include/sound/uapi/asequencer.h |  5 ++-
 include/sound/uapi/asound.h     | 21 ++++++++--
 include/ump.h                   | 22 +++++++++++
 include/ump_msg.h               | 67 +++++++++++++++++++++++++++++++
 src/Versions.in                 |  2 +
 src/rawmidi/ump.c               | 70 +++++++++++++++++++++++++++++++++
 src/seq/seq.c                   | 32 +++++++++++++++
 8 files changed, 218 insertions(+), 4 deletions(-)

-- 
2.35.3

