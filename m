Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D043955640
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Aug 2024 09:46:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89F862BD2;
	Sat, 17 Aug 2024 09:46:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89F862BD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723880802;
	bh=RUGGfYatZRZnk1U5MFvj0Gi0/PMuhb/Y/mXABqQp25s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Gb+4cTbKpu6+3jIZetdDmjg447sxWFIINNc0efln9DmQuBXoUVBTdEOubWqeBaB1X
	 lvI9RaIYgncZKtrlfXFJ0Z5i3j70jKsRQhghNPQ+m7EeGY/eG6cSl1VzYa8bnajHZ1
	 w5pVF5jo9tK81UkMpJ9Eqy+pqhAc+X3SUA+eXpvA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98147F805B3; Sat, 17 Aug 2024 09:46:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CCE90F800BF;
	Sat, 17 Aug 2024 09:46:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74E3BF80423; Sat, 17 Aug 2024 09:44:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9B4BF800B0
	for <alsa-devel@alsa-project.org>; Sat, 17 Aug 2024 09:44:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9B4BF800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=zH4NIzWl;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=b8w8rr4v;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=zH4NIzWl;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=b8w8rr4v
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A9D3F201FA;
	Sat, 17 Aug 2024 07:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1723880660;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/xvEPZkP2VnIptCsRFeWqaIcY7nBLVjS1F7Cu9JUa8k=;
	b=zH4NIzWlGMNXD6Wd/79QeJW5jr5hZKKTmGBeGP5MgBSMY4BKaDjmnX9YdpLlZuSTj5itxL
	IC088rMyyqbG9CcX3KAVt5BKcsGBcEoEmKiP3fErlqRUGfFOcv0tF3v6IBQZkxTy5Z1Q/Y
	vbA4kKimZoLwWDwC/8mNQZf3Cay3hT8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723880660;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/xvEPZkP2VnIptCsRFeWqaIcY7nBLVjS1F7Cu9JUa8k=;
	b=b8w8rr4vb3LzgHjxmGAdiGHSf5weSzFPxe0jNZrObamM8yK7ehvDivyZBtLU+nXLrtkOop
	QsuZODJ+haUgt6BA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1723880660;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/xvEPZkP2VnIptCsRFeWqaIcY7nBLVjS1F7Cu9JUa8k=;
	b=zH4NIzWlGMNXD6Wd/79QeJW5jr5hZKKTmGBeGP5MgBSMY4BKaDjmnX9YdpLlZuSTj5itxL
	IC088rMyyqbG9CcX3KAVt5BKcsGBcEoEmKiP3fErlqRUGfFOcv0tF3v6IBQZkxTy5Z1Q/Y
	vbA4kKimZoLwWDwC/8mNQZf3Cay3hT8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723880660;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/xvEPZkP2VnIptCsRFeWqaIcY7nBLVjS1F7Cu9JUa8k=;
	b=b8w8rr4vb3LzgHjxmGAdiGHSf5weSzFPxe0jNZrObamM8yK7ehvDivyZBtLU+nXLrtkOop
	QsuZODJ+haUgt6BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5944C13991;
	Sat, 17 Aug 2024 07:44:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EBqEFNRUwGaEfgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 17 Aug 2024 07:44:20 +0000
Date: Sat, 17 Aug 2024 09:45:01 +0200
Message-ID: <87y14v1tky.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	andriy.shevchenko@linux.intel.com,
	cujomalainey@chromium.org,
	lmajczak@google.com
Subject: Re: [PATCH v2 01/14] ALSA: hda: Move SST device entries to AVS
In-Reply-To: <ef967f55-fd8e-4491-84f6-76808d839dae@sirena.org.uk>
References: <20240814083929.1217319-1-cezary.rojewski@intel.com>
	<20240814083929.1217319-2-cezary.rojewski@intel.com>
	<ef967f55-fd8e-4491-84f6-76808d839dae@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.994];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid]
Message-ID-Hash: JRHCIWFATLLPERVLSVXEJ6CQGTSJKXKD
X-Message-ID-Hash: JRHCIWFATLLPERVLSVXEJ6CQGTSJKXKD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JRHCIWFATLLPERVLSVXEJ6CQGTSJKXKD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 17 Aug 2024 00:06:15 +0200,
Mark Brown wrote:
> 
> On Wed, Aug 14, 2024 at 10:39:16AM +0200, Cezary Rojewski wrote:
> > The avs-driver succeeds the skylake-driver. It suppots all
> > configurations of its predecessor and more. Reflect that in the existing
> > selection table.
> 
> Takashi, are you OK with this?

Sorry, I overlooked.

Reviewed-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi

