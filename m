Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0912270DC7F
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 14:24:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2986A82B;
	Tue, 23 May 2023 14:23:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2986A82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684844684;
	bh=naIFsSKQEWeVJJEqx2nCQ3Obxl0Y9kvp83iZ4nGS+kg=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YXijJzrRKsJifTgNHRv6q2oX2PxYJYxjzDV0STZOVX4pRsyiBj7IX79KKbOuCiriK
	 0PgSXDgIQ7T3/ipylFQxSfmlAS0XWkYEPGdaOiCliE82LWtx+NfMwQzi2xXFeQ+uO6
	 lKdXABqwvIJRMqPwlUVuPQuAs+QLHm6CZ27lb43Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37C3FF8056F; Tue, 23 May 2023 14:23:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6636DF8055B;
	Tue, 23 May 2023 14:23:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B1B0F80564; Tue, 23 May 2023 14:23:03 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id DEE11F80086
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 14:22:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEE11F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=boLIumyf;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=3/Adkr9c
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E021720573;
	Tue, 23 May 2023 12:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684844573; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=vwUwxYbYRvTL7W+lGrQWtIevQiXoUiYE3RZ+smK8ZlU=;
	b=boLIumyfWonAdPL0s3A2mlC+w2HOe7hECAUI3f2pSaMQRy6/b6kVYRVPrssrio9lgxnB+g
	IOlaqYAHFpsAYpW09knSK/BYd+g3umyMdc4Uf04nwu8KEC5ssuRID9Dm07hncvu1xZFm2r
	jzdbzB0LuuyxOaAa3w4Ks3sJoMUhdM0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684844573;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=vwUwxYbYRvTL7W+lGrQWtIevQiXoUiYE3RZ+smK8ZlU=;
	b=3/Adkr9chkSf893/2m8PczGWfVQdq1FPSJ9LwQMTfwlyx5Ucb1oGwlX5f9IeZ9Ke/d+4ZN
	E6HlwmK6apDxgCCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C3AE913588;
	Tue, 23 May 2023 12:22:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 2oGxLh2wbGQNKAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 23 May 2023 12:22:53 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib v2 00/10] Add MIDI 2.0 support
Date: Tue, 23 May 2023 14:22:37 +0200
Message-Id: <20230523122247.11744-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TTV7JDWVXHCCLNDKPMJNPTQWDQY3TI7B
X-Message-ID-Hash: TTV7JDWVXHCCLNDKPMJNPTQWDQY3TI7B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TTV7JDWVXHCCLNDKPMJNPTQWDQY3TI7B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is a revised series of patches for alsa-lib to add the support of
MIDI 2.0 features.  Since v1 [*], two more control API helpers to obtain
UMP EP / block info are added and the CTL protocol version is bumped.


Takashi

[*] http://lore.kernel.org/r/20230520070021.1301-1-tiwai@suse.de

===

Takashi Iwai (10):
  uapi: Update rawmidi API to 2.0.3
  uapi: Update control API to 2.0.9
  rawmidi: Add UMP ioctl support
  ump: Add initial support
  control: Add UMP device query support
  control: Add UMP Endpoint and Block info query support
  ump: Add helpers to parse / set UMP packet data
  ump: Add helpers for handling SysEx data
  uapi: Update asequencer.h definitions for 1.0.3
  seq: Add UMP support

 configure.ac                    |   1 +
 include/Makefile.am             |   2 +-
 include/control.h               |   3 +
 include/local.h                 |   5 +
 include/rawmidi.h               |   3 +
 include/seq.h                   |  44 ++
 include/seq_event.h             |  42 +-
 include/seqmid.h                |  24 ++
 include/sound/uapi/asequencer.h |  91 ++++-
 include/sound/uapi/asound.h     |  62 ++-
 include/ump.h                   | 119 ++++++
 include/ump_msg.h               | 598 +++++++++++++++++++++++++++
 src/Versions.in                 |  26 ++
 src/control/control.c           |  38 ++
 src/control/control_hw.c        |  29 ++
 src/control/control_local.h     |   3 +
 src/rawmidi/Makefile.am         |   5 +-
 src/rawmidi/rawmidi.c           |  19 +
 src/rawmidi/rawmidi_hw.c        |  36 +-
 src/rawmidi/rawmidi_local.h     |   7 +
 src/rawmidi/ump.c               | 702 ++++++++++++++++++++++++++++++++
 src/rawmidi/ump_local.h         |  10 +
 src/seq/seq.c                   | 410 +++++++++++++++++--
 src/seq/seq_hw.c                |  72 +++-
 src/seq/seq_local.h             |   6 +-
 src/seq/seqmid.c                |  38 ++
 26 files changed, 2316 insertions(+), 79 deletions(-)
 create mode 100644 include/ump.h
 create mode 100644 include/ump_msg.h
 create mode 100644 src/rawmidi/ump.c
 create mode 100644 src/rawmidi/ump_local.h

-- 
2.35.3

