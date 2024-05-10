Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE438C251C
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2024 14:51:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12C18E69;
	Fri, 10 May 2024 14:51:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12C18E69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715345496;
	bh=CQ0IspQjDWbbS3g51VnTaGk429YGlMnVpea4u7GPQwA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oJCfMc5I8ddKEUtsQC3+EyuqH31Cj59AcVzZLk2o7VxyEQxROsnEzPiMjQ3A5pco/
	 44YjbwtXMbCqzQLwLYS5EXnPlGUdnRLdMWT6KK6OPCxxRJ4uI03FM9MvdtQJn08wwX
	 MiGIO+0RozJ7Qt8yrHekZRZTTXLAkwWVb1TBS5nQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABCE1F805A1; Fri, 10 May 2024 14:51:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27097F8057E;
	Fri, 10 May 2024 14:51:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56982F8049C; Fri, 10 May 2024 14:50:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DAA4FF8003A
	for <alsa-devel@alsa-project.org>; Fri, 10 May 2024 14:50:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAA4FF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=JAaDb+45;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=HAmpuIpc;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=JAaDb+45;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=HAmpuIpc
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 818CA3F4AC;
	Fri, 10 May 2024 12:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1715345446;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3AL5leTzBLPEB95hniC/EAEo8d26SqdJrG4pffaifsY=;
	b=JAaDb+458izEok288jzKqbAHYRBsOiJxMizTdAcrln2Odt5F3thrjs297KXDa3DtuGbcc5
	vnfk4cqjI8zqFNWY6qamlgwTmAUKbqY8K5mHwN0B3huClOur3YFWuXkNca2IbeoIExCNZt
	63CjubFtxvCWqIRUHNcSnRDPnE9qxmI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715345446;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3AL5leTzBLPEB95hniC/EAEo8d26SqdJrG4pffaifsY=;
	b=HAmpuIpcR0B7e8gQrg0K4FtUeRhVaMg4seOdy/H4iCaIKB8tE2PCrB1q23qWL27FTrh0KE
	k3Bbh+w2y66lGlCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1715345446;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3AL5leTzBLPEB95hniC/EAEo8d26SqdJrG4pffaifsY=;
	b=JAaDb+458izEok288jzKqbAHYRBsOiJxMizTdAcrln2Odt5F3thrjs297KXDa3DtuGbcc5
	vnfk4cqjI8zqFNWY6qamlgwTmAUKbqY8K5mHwN0B3huClOur3YFWuXkNca2IbeoIExCNZt
	63CjubFtxvCWqIRUHNcSnRDPnE9qxmI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715345446;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3AL5leTzBLPEB95hniC/EAEo8d26SqdJrG4pffaifsY=;
	b=HAmpuIpcR0B7e8gQrg0K4FtUeRhVaMg4seOdy/H4iCaIKB8tE2PCrB1q23qWL27FTrh0KE
	k3Bbh+w2y66lGlCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5F0A91386E;
	Fri, 10 May 2024 12:50:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XAC3FSYYPmajdwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 10 May 2024 12:50:46 +0000
Date: Fri, 10 May 2024 14:51:01 +0200
Message-ID: <87seyp96fe.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.9-rc7
In-Reply-To: <Zj4Mi5u9RFCw1Cl1@finisterre.sirena.org.uk>
References: <5d7330b5bc59eaa0a0ed5d7be3c9a838.broonie@kernel.org>
	<Zj4Mi5u9RFCw1Cl1@finisterre.sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,alsa-project.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[3]
Message-ID-Hash: 55V7H3J5JBZFN567RZKWK4YV3BCJKCWM
X-Message-ID-Hash: 55V7H3J5JBZFN567RZKWK4YV3BCJKCWM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/55V7H3J5JBZFN567RZKWK4YV3BCJKCWM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 10 May 2024 14:01:15 +0200,
Mark Brown wrote:
> 
> On Fri, May 10, 2024 at 12:57:58PM +0100, Mark Brown wrote:
> 
> > ASoC: Fixes for v6.9
> > 
> > A few final fixes for v6.9, none of them super major but all real.
> 
> I just realised I've got a couple more fixes still in test - I'll send
> an additional request for those later assuming no problems.

OK, I merged now to for-linus branch but in anyway I'll wait for the
more fix.  I'm not going to send a PR in this week, so if any, it'll
be after rc8 (if ever exists) or 6.10-rc1.


thanks,

Takashi
