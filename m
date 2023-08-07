Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E35077269B
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 15:53:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A90510E;
	Mon,  7 Aug 2023 15:52:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A90510E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691416393;
	bh=D6BJkn+2Tm1Jutgypu2pMs/cOW5nmz3vGKbB4oJVAqI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RuPyse3HaX3FMvquQQ4momILWLtBbPWw89ZdOMom69nARLeNqVr4PI6EK/MhC7Yb4
	 bSUtq3CYZfBUMfvktjuQWMm7q0ZNRxyfiQ5mmp//exAM3PiV6YBb/vFkRTIIW07/AD
	 EJEeUwyAjaNb/PWPR9OJXg/1XGl/vFzP8A/njRKw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F390FF8016B; Mon,  7 Aug 2023 15:52:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 218AEF8051E;
	Mon,  7 Aug 2023 15:52:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3F6EF80548; Mon,  7 Aug 2023 15:52:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0492EF80116
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 15:52:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0492EF80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=na8gP6Qk;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=6J77PTb5
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6D40921A81;
	Mon,  7 Aug 2023 13:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1691416331;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=RKJKrXXwpfnI3REPiYAnZ+LtM6m+j/v4L8N4xYIHx3g=;
	b=na8gP6QkZN0d3BO4RETgs6oU2Njgdo8GhAYkEbOhADl1pRENzBuVXhh5GUKqWHAnEceu+1
	uv28+/TpqOhwI5xqQFZJxx1JmaFhCYNIxh5+mtE+uFCeiOL4r8/g/H2qJG1tCrXVO2/d2Q
	wT8NMtkkdyI93lQjLIx7+mYxDMF5iz0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1691416331;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=RKJKrXXwpfnI3REPiYAnZ+LtM6m+j/v4L8N4xYIHx3g=;
	b=6J77PTb5hYtdH0Q0pjrzoxiPmgcOYqdqRNf8DtxaJp+dag9nZ8XvmqYm511/hxLCc1cD0i
	RdJRblfDYd7XXMCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4AFBB13910;
	Mon,  7 Aug 2023 13:52:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 5mxnEQv30GS3JwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 07 Aug 2023 13:52:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Curtis Malainey <cujomalainey@chromium.org>
Subject: [PATCH RFC 0/6] ALSA: Fix UAF with delayed kobj release
Date: Mon,  7 Aug 2023 15:52:00 +0200
Message-Id: <20230807135207.17708-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZCSPIO3DNANH44U2XRZFDN24BN566QSW
X-Message-ID-Hash: ZCSPIO3DNANH44U2XRZFDN24BN566QSW
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

this is a test patch set for addressing the UAF problems with delayed
kobj releases reported by Curtis:
 https://lore.kernel.org/r/20230801171928.1460120-1-cujomalainey@chromium.org

The patch introduced a simple helper for allocating memory with a
refcount, and converts the card object, control, PCM and compress
objects with the new type.  With the refcount, the actual memory
release is delayed until all referrer are gone.

It's just a RFC and only lightly tested.  I myself am not sure whether
this is the best way to go.  It might be better to take Curtis'
approach, just converting the device to its own allocation, too.
(But I don't know whether Curtis' patch set covers all cases -- can
still be a UAF of card_dev due to devres vs kobj release?)


thanks,

Takashi

===

Takashi Iwai (6):
  ALSA: core: Introduced referenced memory allocator
  ALSA: core: Fix potential UAF by delayed kobject release of card_dev
  ALSA: core: Associate memory reference with device initialization
  ALSA: pcm: Release memory with reference
  ALSA: control: Reference card by ctl_dev
  ALSA: compress: Reference card by the device

 include/sound/core.h           |   7 ++-
 sound/core/compress_offload.c  |   2 +-
 sound/core/control.c           |   2 +-
 sound/core/hwdep.c             |   2 +-
 sound/core/init.c              | 105 +++++++++++++++++++++++++++------
 sound/core/pcm.c               |   6 +-
 sound/core/rawmidi.c           |   2 +-
 sound/core/seq/seq_clientmgr.c |   2 +-
 sound/core/timer.c             |   2 +-
 9 files changed, 101 insertions(+), 29 deletions(-)

-- 
2.35.3

