Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B281CAC053A
	for <lists+alsa-devel@lfdr.de>; Thu, 22 May 2025 09:07:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42840601EB;
	Thu, 22 May 2025 09:06:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42840601EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747897616;
	bh=klBvKDvpwl4gp4m/b/wd8VoDUHlmQcQRiNXg7PmMfY0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ifLJzdmOVu7Wji8L3RAg+w4r/u65Sudic9dzp1/ZtBKCnBO8hpG3pUVRpRE8Vu5PZ
	 BzRRm0I8xic2P5fWFwkSndeslTvwdzNAqn1xeVR95foryfPGFwW5J/D+CMy+nFy9xM
	 2JlQ/yCh+oFEbrrTJPGDF9RhRLi9fYsVTT6UCt0w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 409E1F805B5; Thu, 22 May 2025 09:06:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E36BF80549;
	Thu, 22 May 2025 09:06:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D720F8056F; Thu, 22 May 2025 09:06:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3BFF5F800C1
	for <alsa-devel@alsa-project.org>; Thu, 22 May 2025 09:06:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BFF5F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=culIDnTi;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=WlQKjxuB;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=culIDnTi;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=WlQKjxuB
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 403741FD38;
	Thu, 22 May 2025 07:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1747897573;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vLsGjQ0+c7Ah8dYJuAvconzlFQvoVcI2uqVlYGOZNbg=;
	b=culIDnTiBpjQy83JFmW0NKRMhzb/3hAlWHdkZOao+9jAjCpspGm11mBTPq6xYrLvZ2sU8Q
	OHaWmsnxblc6NgbpqSoPvcAfRnl8kakOZHa0Hm7su9x6l6G2eJw9BzEw1LB9t/RnUxc2hx
	9k4ODYTyEKviq45mq+h42r3t8L2dE4E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747897573;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vLsGjQ0+c7Ah8dYJuAvconzlFQvoVcI2uqVlYGOZNbg=;
	b=WlQKjxuBUwSNLF7HpZwbGc9iRD0Djv+ysq7tglpElpA66H90V48vvIJpol3S3ayaTOQyV9
	LZgOoMXAU2W0hSDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=culIDnTi;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WlQKjxuB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1747897573;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vLsGjQ0+c7Ah8dYJuAvconzlFQvoVcI2uqVlYGOZNbg=;
	b=culIDnTiBpjQy83JFmW0NKRMhzb/3hAlWHdkZOao+9jAjCpspGm11mBTPq6xYrLvZ2sU8Q
	OHaWmsnxblc6NgbpqSoPvcAfRnl8kakOZHa0Hm7su9x6l6G2eJw9BzEw1LB9t/RnUxc2hx
	9k4ODYTyEKviq45mq+h42r3t8L2dE4E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747897573;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vLsGjQ0+c7Ah8dYJuAvconzlFQvoVcI2uqVlYGOZNbg=;
	b=WlQKjxuBUwSNLF7HpZwbGc9iRD0Djv+ysq7tglpElpA66H90V48vvIJpol3S3ayaTOQyV9
	LZgOoMXAU2W0hSDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2C6CD13433;
	Thu, 22 May 2025 07:06:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id swKYCeXMLmiDBgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 May 2025 07:06:13 +0000
Date: Thu, 22 May 2025 09:06:12 +0200
Message-ID: <87v7pt86qj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Daniel Dadap <ddadap@nvidia.com>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH] conf: aliases: add hda-acpi -> HDA-Intel alias
In-Reply-To: <aC5HQAcun3NMnVMA@ddadap-lakeline.nvidia.com>
References: <aCXs810qs_pvuOtx@ddadap-lakeline.nvidia.com>
	<aC5HQAcun3NMnVMA@ddadap-lakeline.nvidia.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,nvidia.com:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 403741FD38
Message-ID-Hash: MNZE5RJDTQ3RYYZGNJOO3VU62LM6AU2W
X-Message-ID-Hash: MNZE5RJDTQ3RYYZGNJOO3VU62LM6AU2W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MNZE5RJDTQ3RYYZGNJOO3VU62LM6AU2W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 21 May 2025 23:36:00 +0200,
Daniel Dadap wrote:
> 
> Add Takashi to CC. This is for the hda_acpi driver which was just merged
> into the for-next branch in the tiwai/sound tree.
> 
> On Thu, May 15, 2025 at 08:32:39AM -0500, Daniel Dadap wrote:
> > The new snd_hda_acpi driver in Linux exposes the existing Azalia
> > interface to non-PCI devices advertised over ACPI. Add an alias
> > to the existing HDA-Intel configuration file so that devices using
> > this driver can be discovered properly.
> > 
> > Signed-off-by: Daniel Dadap <ddadap@nvidia.com>

Applied now.  Thanks.


Takashi
