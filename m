Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4B070A60A
	for <lists+alsa-devel@lfdr.de>; Sat, 20 May 2023 09:05:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED3706C1;
	Sat, 20 May 2023 09:04:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED3706C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684566309;
	bh=5gIlhHjeWD/18zghF2nm6tu7vzKZx1LIClM1ozz3NnA=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=V5ZY/EO8ssRv3B4NdaXOo3omjpJ9cUiohgym9ZmBI7AQx2U/tw/KayHyxXpcsIUKJ
	 ogLSkmbXCB/LOFLYsdQ/SOjqfg36nCtbK2IGAvYEvevmMDSWBLruZaEGcEdKgSFMFo
	 z5EXPlC3GwQD9bcz2vefxo+HHSchq1yBARIdxIjk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1803CF8059F; Sat, 20 May 2023 09:02:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 892A1F805A0;
	Sat, 20 May 2023 09:02:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57ED9F80272; Sat, 20 May 2023 09:00:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9FAEFF80542
	for <alsa-devel@alsa-project.org>; Sat, 20 May 2023 09:00:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FAEFF80542
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=egjELy+b;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=0u55cms0
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6893721905;
	Sat, 20 May 2023 07:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684566025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=QnL2tLnc8AmBadSQlRRF9ShwC8Jb46HWI1q126pVbyA=;
	b=egjELy+bDkADVT6maqmOjUccEzKArLsPRz2tC1m+tbwjGHUX52MhJn+tEJ6r/w0y9ycQQ9
	WH0mfEIMf/Rz74y4kHPGVirGS3G5hDea1m/FSpW7UoaiiBJJN58TAtByhSub03+drEBIIv
	EsSZMmfrTYrzNH/+i/YXY8+DfVzoXUE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684566025;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=QnL2tLnc8AmBadSQlRRF9ShwC8Jb46HWI1q126pVbyA=;
	b=0u55cms0IOwg5BbIZaX38b4uWTW8lJSvcf7/BG+v/84dFpIthC/syxogVChekWUmbmN8rO
	cQES+GT8P/FnZwDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4A542134F5;
	Sat, 20 May 2023 07:00:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id fEdLEQlwaGTwGwAAMHmgww
	(envelope-from <tiwai@suse.de>); Sat, 20 May 2023 07:00:25 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 0/8] Add MIDI 2.0 support
Date: Sat, 20 May 2023 09:00:13 +0200
Message-Id: <20230520070021.1301-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3PXX6NE7NFUN4UW6MTD27XOO6DH7FGR7
X-Message-ID-Hash: 3PXX6NE7NFUN4UW6MTD27XOO6DH7FGR7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3PXX6NE7NFUN4UW6MTD27XOO6DH7FGR7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is a series of patches for alsa-lib to add the support of MIDI
2.0 features, corresponding to the kernel patches that have been
submitted recently:
  https://lore.kernel.org/r/20230519093114.28813-1-tiwai@suse.de

The API extensions are minimalistic, and only a few basic accessors
have been defined.


Takashi

---

Takashi Iwai (8):
  uapi: Update rawmidi API to 2.0.3
  rawmidi: Add UMP ioctl support
  ump: Add initial support
  control: Add UMP device query support
  ump: Add helpers to parse / set UMP packet data
  ump: Add helpers for handling SysEx data
  uapi: Update asequencer.h definitions for 1.0.3
  seq: Add UMP support

 configure.ac                    |   1 +
 include/Makefile.am             |   2 +-
 include/control.h               |   1 +
 include/local.h                 |   4 +
 include/rawmidi.h               |   3 +
 include/seq.h                   |  44 ++
 include/seq_event.h             |  42 +-
 include/seqmid.h                |  24 ++
 include/sound/uapi/asequencer.h |  91 ++++-
 include/sound/uapi/asound.h     |  58 ++-
 include/ump.h                   | 119 ++++++
 include/ump_msg.h               | 598 +++++++++++++++++++++++++++
 src/Versions.in                 |  23 ++
 src/control/control.c           |  14 +
 src/control/control_hw.c        |   9 +
 src/control/control_local.h     |   1 +
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
 26 files changed, 2261 insertions(+), 78 deletions(-)
 create mode 100644 include/ump.h
 create mode 100644 include/ump_msg.h
 create mode 100644 src/rawmidi/ump.c
 create mode 100644 src/rawmidi/ump_local.h

-- 
2.35.3

