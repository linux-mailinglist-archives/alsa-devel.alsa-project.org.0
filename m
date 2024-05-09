Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEA48C14B3
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 20:25:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC5A7E66;
	Thu,  9 May 2024 20:25:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC5A7E66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715279147;
	bh=OoYgrioelbsOKtHSb3Ts6idZ9W1cRPY/0JdsOVdNjFw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lEWmAcvFXLZj2IqGiCe1yNALaDiHqApUA6ds8cal0jNg+kWN1F8QnIgzWSaKh3NGD
	 7JWyR0vgOFmCe+/798YJXHjgkSuMliJU4I5Ulsb0jySWkHaL0OvpZ/bNypS/vMIm61
	 dgtOfHm7urh6iLEB9II4gTd+sIOhzpaAYakGhaJo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19B2CF8057D; Thu,  9 May 2024 20:25:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7E7DF805A0;
	Thu,  9 May 2024 20:25:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FB68F8049C; Thu,  9 May 2024 20:25:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2F677F800E2
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 20:25:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F677F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=A8UFbAph;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=7uH/ueaK;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=A8UFbAph;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=7uH/ueaK
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6445A605B2;
	Thu,  9 May 2024 18:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1715279102;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KnCVpeZusPnIDUJeLHJVPaKdd2uDQNX1q2chP9jLd20=;
	b=A8UFbAphdpZs5QssilgNZc1S86sSZbWie43aXmrm8oaT5feh2b9cP7zFXh2EbGoHjE2J8r
	AYS6jRM+9ynH6wN6ESLwYEOfR7k+YuEnqI7K322Q86SSaBu7eam5ufL0YqxTRr+4ID1WZ7
	0WzXnqrZZep7fCRsGjWZw2v7GF6UwPM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715279102;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KnCVpeZusPnIDUJeLHJVPaKdd2uDQNX1q2chP9jLd20=;
	b=7uH/ueaKo9p/KhR91KgAOqOd2sP1DjShaEhHL0Om2PFGrHWTIGtgjlp4FrC6nJUAQvI1xL
	F5HDYu0LJN3Vt1Cw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1715279102;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KnCVpeZusPnIDUJeLHJVPaKdd2uDQNX1q2chP9jLd20=;
	b=A8UFbAphdpZs5QssilgNZc1S86sSZbWie43aXmrm8oaT5feh2b9cP7zFXh2EbGoHjE2J8r
	AYS6jRM+9ynH6wN6ESLwYEOfR7k+YuEnqI7K322Q86SSaBu7eam5ufL0YqxTRr+4ID1WZ7
	0WzXnqrZZep7fCRsGjWZw2v7GF6UwPM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715279102;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KnCVpeZusPnIDUJeLHJVPaKdd2uDQNX1q2chP9jLd20=;
	b=7uH/ueaKo9p/KhR91KgAOqOd2sP1DjShaEhHL0Om2PFGrHWTIGtgjlp4FrC6nJUAQvI1xL
	F5HDYu0LJN3Vt1Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 217ED13941;
	Thu,  9 May 2024 18:25:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id C7/WBv4UPWbGRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 May 2024 18:25:02 +0000
Date: Thu, 09 May 2024 20:25:16 +0200
Message-ID: <87r0eaalmb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	rafael@kernel.org
Subject: Re: [PATCH 1/2] ALSA: hda: intel-dsp-config: Switch to ACPI NHLT
In-Reply-To: <ZjzuxCqME77ei91Z@finisterre.sirena.org.uk>
References: <20240419084307.2718881-1-cezary.rojewski@intel.com>
	<20240419084307.2718881-2-cezary.rojewski@intel.com>
	<892ad456-cfe5-4ff1-ab67-7709677608cd@intel.com>
	<87zfsz9n8d.wl-tiwai@suse.de>
	<87v83n9lpv.wl-tiwai@suse.de>
	<ZjzuxCqME77ei91Z@finisterre.sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
Message-ID-Hash: 4COLLGUHCAL4LECQ2JTJ5KHGGUMH4PGE
X-Message-ID-Hash: 4COLLGUHCAL4LECQ2JTJ5KHGGUMH4PGE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4COLLGUHCAL4LECQ2JTJ5KHGGUMH4PGE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 09 May 2024 17:41:56 +0200,
Mark Brown wrote:
> 
> On Thu, May 09, 2024 at 03:08:28PM +0200, Takashi Iwai wrote:
> 
> > I don't know how Mark applied the ASoC patch, but if that actually
> > worked, it's better to take from his tree.  Or, in such a case, at
> > best to be merged through the tree where the new API got introduced
> > (i.e. ACPI tree).
> 
> The cover letter mentioned a branch that's a dependency - TBH I'd been
> expecting you to apply the core ALSA patch to your tree, but I can apply
> to mine if you prefer?

Ah thanks, I overlooked that.  Now applied to my tree.


Takashi
