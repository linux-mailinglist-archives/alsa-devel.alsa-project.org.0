Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B69AB7FAA
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 10:04:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BE15625E8;
	Thu, 15 May 2025 09:56:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BE15625E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747295800;
	bh=XO2VW6yW6g1AO1YwoxZW55mAH6fKX8pXVdfog2134aA=;
	h=Date:From:To:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qz/RBY98ZZHqM1781Pex/KO1tZJRcmbfEwNPeJ6XJw5A3ZdpEf1BDXYJIz4loR3zw
	 wqo/GkoL66z4t1Uh4oBUt9DymmDULxDrhK7G0S11Jh5DphyYUCameC9cr+ymlU8zRa
	 Sgo9bkEidUdScsPLYwhm6WagZp4iAHy3DLFpHbNc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C4ADF80617; Wed, 14 May 2025 17:17:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0476FF8060F;
	Wed, 14 May 2025 17:17:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F00D0F805F8; Wed, 14 May 2025 17:17:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C371F805F3
	for <alsa-devel@alsa-project.org>; Wed, 14 May 2025 17:17:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C371F805F3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=sc/WXbtN;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Q55LZ4DM;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=sc/WXbtN;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Q55LZ4DM
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CE3DF21241
	for <alsa-devel@alsa-project.org>; Wed, 14 May 2025 15:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1747235843; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=2ULNUs3F/MULwFLjowrOXi2XqIE2Trzd+ssBpSXFsCk=;
	b=sc/WXbtNI5dtPikH5yePsvpmql0J/pdFpQAkLhzJq3DeNTWG7exaYoB5wkbHVzsupbCTqj
	HKNyfRgt0WNUSZSzHwlyIYU93lx6KC4z7CV2NdFvPbhcXV3PpKj+UCC+H1mtBFbZk7OYSH
	0m2wMeIb43jTMocnXdzbMvvRN0pw9F8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747235843;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=2ULNUs3F/MULwFLjowrOXi2XqIE2Trzd+ssBpSXFsCk=;
	b=Q55LZ4DMQKNMXHlC09IUpWo1iOQU+yj8Kzb1tGakKzmUiI56mAKuRpMKNFoo/xvFY2SBt5
	iNgTuD52H6sL5ADg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1747235843; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=2ULNUs3F/MULwFLjowrOXi2XqIE2Trzd+ssBpSXFsCk=;
	b=sc/WXbtNI5dtPikH5yePsvpmql0J/pdFpQAkLhzJq3DeNTWG7exaYoB5wkbHVzsupbCTqj
	HKNyfRgt0WNUSZSzHwlyIYU93lx6KC4z7CV2NdFvPbhcXV3PpKj+UCC+H1mtBFbZk7OYSH
	0m2wMeIb43jTMocnXdzbMvvRN0pw9F8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747235843;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=2ULNUs3F/MULwFLjowrOXi2XqIE2Trzd+ssBpSXFsCk=;
	b=Q55LZ4DMQKNMXHlC09IUpWo1iOQU+yj8Kzb1tGakKzmUiI56mAKuRpMKNFoo/xvFY2SBt5
	iNgTuD52H6sL5ADg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BA607137E8
	for <alsa-devel@alsa-project.org>; Wed, 14 May 2025 15:17:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id I0xfLAO0JGgrJgAAD6G6ig
	(envelope-from <tiwai@suse.de>)
	for <alsa-devel@alsa-project.org>; Wed, 14 May 2025 15:17:23 +0000
Date: Wed, 14 May 2025 17:17:23 +0200
Message-ID: <87frh7te64.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: MIDI 2.0 Network UDP server/client programs for ALSA
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
Message-ID-Hash: LL4WNMS2JN5H7M2VTMD7UAV6KQFIYEXW
X-Message-ID-Hash: LL4WNMS2JN5H7M2VTMD7UAV6KQFIYEXW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LL4WNMS2JN5H7M2VTMD7UAV6KQFIYEXW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

I recently wrote a set of small programs for the new Network MIDI 2.0
UDP transport with ALSA sequencer / rawmidi API, based on v1.0 spec.
The current version (v0.3) is found at:
  https://github.com/tiwai/amidi2net

A network server can be invoked simply via:
  % amidi2net-server
and this will create an ALSA sequencer client/port.  This ALSA
sequencer port can be connected by any other ALSA sequencer programs
or devices.

The server opens a UDP port, so that it can be connected by a client
on another machine on the net, e.g.:
  % amidi2net-client -l amidi2net
which creates an ALSA sequencer client/port similarly, and this can be
connected by other apps, too.  After the network connection, server
and client can pass the UMP data between them freely, so they work as
a bridge or hub for applications on both machines.

Some details are found in README and man pages.

For the builds, you'll need openssl and avahi devel packages.
(It allows to build without those, but basic functions will be
missing.)

As it's a quite initial version, there can be bugs and subject to
change.  But the stuff seems working stably.

Feel free to reach me if you find any issues.


thanks,

Takashi
