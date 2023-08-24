Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3DC7868ED
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 09:52:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C9A8839;
	Thu, 24 Aug 2023 09:51:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C9A8839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692863549;
	bh=B1yapP3h+jWniHJCh61cwzsNRQsPchep6rtCESVYqhw=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=t+putbEg5aCbNjGiJLFd4iNHNtRYvcZRYhGkhUBMCNxZ3VN3WmAFM5uraiDGW3XxR
	 +fcziaDPXUKy9l76m4JNkRrF9442ADnbE4oIiotHoZ2pXei8gxIvut5l6ciHcd3Tev
	 HZYvrF/3vUfZggHdyy9/31v9YUsrbojNJJmUzaTo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95F4EF800F5; Thu, 24 Aug 2023 09:51:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C25EFF8022B;
	Thu, 24 Aug 2023 09:51:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9E18F8025F; Thu, 24 Aug 2023 09:51:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EA574F800F5
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 09:51:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA574F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Y39nL83i;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=pvyHqPZn
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C29F020EC3;
	Thu, 24 Aug 2023 07:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692863470; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=GDeGPGJKZ+SLOlE8rjOezz6HNHsqh0RFS8TBD31GYe0=;
	b=Y39nL83iykmeYllfYyiGj/oeymZmrbUEYOMiV0Em//lSRIoMnk4qX6ITDL7f2ZPwD6pPVZ
	91Ffn4Yez1oFraNscZx12CosnIPNNicm9xUJ8KrCMGBna5u70UlflEO/+UDyZw7FSHNL7H
	DzhARnKXCx/WXJbKUSZFFsaRIN+/utQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692863470;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=GDeGPGJKZ+SLOlE8rjOezz6HNHsqh0RFS8TBD31GYe0=;
	b=pvyHqPZnWMpmCR1rvegukPcCUjr0CMwCdZJS457F32lc9ie9K07ES+B2pGQfMyyMAaAUuW
	rOwGVsbdV9EkU6CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9ECD8139BC;
	Thu, 24 Aug 2023 07:51:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id dnTaJe4L52TtLAAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 24 Aug 2023 07:51:10 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/4] ALSA: ump: Improve legacy rawmidi & co
Date: Thu, 24 Aug 2023 09:51:04 +0200
Message-Id: <20230824075108.29958-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: D4D7R5XN46IKJLQB64KNHT4X23HLJVQM
X-Message-ID-Hash: D4D7R5XN46IKJLQB64KNHT4X23HLJVQM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D4D7R5XN46IKJLQB64KNHT4X23HLJVQM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

this is a patch set to fix / enhance the legacy rawmidi handling in
UMP core and USB-audio driver, as well as the update of MIDI 2.0
documentation.


Takashi

===

Takashi Iwai (4):
  ALSA: usb-audio: Attach legacy rawmidi after probing all UMP EPs
  ALSA: ump: Fill group names for legacy rawmidi substreams
  ALSA: ump: Don't create unused substreams for static blocks
  ALSA: documentation: Add description for USB MIDI 2.0 gadget driver

 Documentation/sound/designs/midi-2.0.rst | 188 +++++++++++++++++++++++
 include/sound/ump.h                      |   1 +
 sound/core/ump.c                         |  58 ++++++-
 sound/usb/midi2.c                        |  15 +-
 4 files changed, 250 insertions(+), 12 deletions(-)

-- 
2.35.3

