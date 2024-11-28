Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0FE9DB926
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Nov 2024 14:59:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA1BB2C49;
	Thu, 28 Nov 2024 14:59:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA1BB2C49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732802371;
	bh=Oo8PPv2Mk161s3bZ5f5cDW+F+AUpgzj5F0GEqVt2ekc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YGqc5uv54WxpvY7n+h590Nx+mNr7nS6rwEg2AM1nNVg/69KwcIxAthAH74HlP3+fa
	 /N2/Fv8oghZvkvQ0jCs9fI1A+iUWQapy4CZLFSpwet7H1+emWZ2IYJK+tB/3ZBPc1j
	 IDGWn7R5E3JL1XvGS3Er1ZaJ3zXcWRsqgsFQAeww=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BAA68F805AE; Thu, 28 Nov 2024 14:58:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F460F80588;
	Thu, 28 Nov 2024 14:58:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E227F80236; Thu, 28 Nov 2024 14:58:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3066BF80116
	for <alsa-devel@alsa-project.org>; Thu, 28 Nov 2024 14:58:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3066BF80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=eB6H+615;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ZN/ygYID;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=ToZbjqxH;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=JRt3956s
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 45C4C21190;
	Thu, 28 Nov 2024 13:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1732802324;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=djjfcwuUeLB3723jh1swp0uPQBSh59ZCEln1C0kD39w=;
	b=eB6H+615d/kmfNo19K3CBUs+JToWCPWBH6p0TLYJqJVAOjamDvhUHTX/KUPm5aKT08RoFY
	S2BQFwHy4+jqHj6gtUWRsH0E8BINvgd8DoKsgqrMAPVnNKOIIz3FB27kgMpbdyqtHgmhIX
	Jb0GHz4t5BQvW1Jde+kUFpoLifFgGho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732802324;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=djjfcwuUeLB3723jh1swp0uPQBSh59ZCEln1C0kD39w=;
	b=ZN/ygYIDVzmDS2FmoLyyjndLbbkhJuhbGfNU+VqcRYve059drMlxqs+E6tBw//BCXUTMDW
	ZXhTTQ8pymxeuPCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ToZbjqxH;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JRt3956s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1732802323;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=djjfcwuUeLB3723jh1swp0uPQBSh59ZCEln1C0kD39w=;
	b=ToZbjqxHrRdde06BMW2+UgY4NA1FX3giDUoCVH91xqf+cY8K5BmQq0KklEALjB44j83Fns
	rQeaUF3tHhkvO1LbjE0obsFGAZwzr5JBEe91O3fSBoGGnDHKeqXNEUazm3/6d3NOVIDhVz
	vyG1+y8dm6cdQuv6vlR0KsSk+L8hUyI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732802323;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=djjfcwuUeLB3723jh1swp0uPQBSh59ZCEln1C0kD39w=;
	b=JRt3956sEBMAZcBCWczrSQgw/g51V8mD2LdhcfDi01AMvc6wfFiSi7Um59rKw5JiNEI95R
	TizvL2kjLtncz7Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 27D5613974;
	Thu, 28 Nov 2024 13:58:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cPCDCBN3SGdOCAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 28 Nov 2024 13:58:43 +0000
Date: Thu, 28 Nov 2024 14:58:42 +0100
Message-ID: <871pyv4fzh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.13-merge-window
In-Reply-To: <ff3c03fcb18cf5f9ea197a775b771867.broonie@kernel.org>
References: <ff3c03fcb18cf5f9ea197a775b771867.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 45C4C21190
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
Message-ID-Hash: TTHWJ3TYKDA3J7K4JH3LV5P72EO4S2JH
X-Message-ID-Hash: TTHWJ3TYKDA3J7K4JH3LV5P72EO4S2JH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TTHWJ3TYKDA3J7K4JH3LV5P72EO4S2JH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 28 Nov 2024 14:54:23 +0100,
Mark Brown wrote:
> 
> The following changes since commit 82ff5abc2edcfba0c0f1a1be807795e2876f46e9:
> 
>   ASoC: hdmi-codec: reorder channel allocation list (2024-11-15 13:43:00 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.13-merge-window
> 
> for you to fetch changes up to b682aa788e5f9f1ddacdfbb453e49fd3f4e83721:
> 
>   ASoC: amd: yc: Add a quirk for microfone on Lenovo ThinkPad P14s Gen 5 21MES00B00 (2024-11-27 13:45:45 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.13
> 
> A pile of driver specific quirks and fixes that came in since the merge
> window.  One of the AMD fixes is a bit broken for some systems, I'm
> expecting an incremental change to fix that but it seems better overall
> to merge the rest of the fixes.
> 
> There's also one small documentation update that seemed sensible to
> apply now, pointing to the dapm-graph tool.

Thanks, pulled now.


Takashi
