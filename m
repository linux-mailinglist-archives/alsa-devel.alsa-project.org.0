Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8810D82F282
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jan 2024 17:39:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D3003E7;
	Tue, 16 Jan 2024 17:39:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D3003E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705423194;
	bh=CV/olyrm1VZ3QEqz2uxfJ+BixQFL/YIf8PhCCd23kBM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fom4b0ZGXcM3ZKfY7ve4UTEm1RpNG/q+/mD7HyjkHoYue05BiDYxGqgVGn2y1NYRx
	 xNauYo2nYB22JHt1M7sCBM1Pe5dXcXNAOfDAeSYmM89De38OV6lBuNDp1omDMxBYzi
	 TmK0ZduZfFUyUPL61oGXLfyBVzVqkQPkWw6FcLu4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F585F80570; Tue, 16 Jan 2024 17:39:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D53C6F8055B;
	Tue, 16 Jan 2024 17:39:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E976F801F5; Tue, 16 Jan 2024 17:39:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A00B0F800F5
	for <alsa-devel@alsa-project.org>; Tue, 16 Jan 2024 17:39:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A00B0F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=XEfwEmvw;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=F+xatjPZ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=XEfwEmvw;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=F+xatjPZ
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4AB9A1FD62;
	Tue, 16 Jan 2024 16:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1705423158;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jsj0vKhlvTgFQYxJuJit+EKAIqb/jVytwb64W8HRaTg=;
	b=XEfwEmvwmzS6/9EkaRNy6OMy097MZ8QPAA3KEA7jQYzNaO7LeKVhM9e0UXrxOdMkGyuZk8
	v9UB0xAnZYiAFe3T+oHRsCW3/3ghpjd0a96zMCMVcD4iyNKSyUaQVJwfnC8WGtp2xFfF0Q
	CrGjaMnMfD28ed5qWQURWOoWsX/JDEw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1705423158;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jsj0vKhlvTgFQYxJuJit+EKAIqb/jVytwb64W8HRaTg=;
	b=F+xatjPZ7ftC2Ab5mbom/EqLFb1F3YXqUQX3FToRr6IpxQ5lh17POzfzl4Pjagcyn0iVEa
	x5OCUt26m36IPpDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1705423158;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jsj0vKhlvTgFQYxJuJit+EKAIqb/jVytwb64W8HRaTg=;
	b=XEfwEmvwmzS6/9EkaRNy6OMy097MZ8QPAA3KEA7jQYzNaO7LeKVhM9e0UXrxOdMkGyuZk8
	v9UB0xAnZYiAFe3T+oHRsCW3/3ghpjd0a96zMCMVcD4iyNKSyUaQVJwfnC8WGtp2xFfF0Q
	CrGjaMnMfD28ed5qWQURWOoWsX/JDEw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1705423158;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jsj0vKhlvTgFQYxJuJit+EKAIqb/jVytwb64W8HRaTg=;
	b=F+xatjPZ7ftC2Ab5mbom/EqLFb1F3YXqUQX3FToRr6IpxQ5lh17POzfzl4Pjagcyn0iVEa
	x5OCUt26m36IPpDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 239BB132FA;
	Tue, 16 Jan 2024 16:39:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UWDyBjaxpmVxJAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 16 Jan 2024 16:39:18 +0000
Date: Tue, 16 Jan 2024 17:39:17 +0100
Message-ID: <87ply1utai.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.8-merge-window
In-Reply-To: <20240116151032.B3BE4C433F1@smtp.kernel.org>
References: <20240116151032.B3BE4C433F1@smtp.kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [0.88 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[gmail.com,alsa-project.org];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.02)[53.20%]
Message-ID-Hash: S6JIMH7SCLRIQU22JQFMZY6CUFA6YGFC
X-Message-ID-Hash: S6JIMH7SCLRIQU22JQFMZY6CUFA6YGFC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S6JIMH7SCLRIQU22JQFMZY6CUFA6YGFC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 16 Jan 2024 16:10:24 +0100,
Mark Brown wrote:
> 
> The following changes since commit 67508b874844b80ac49f70b78d67036c28b9fe7e:
> 
>   ASoC: pxa: sspa: Don't select SND_ARM (2023-12-29 17:41:15 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.8-merge-window
> 
> for you to fetch changes up to ab09fb9c629ed3aaea6a82467f08595dbc549726:
> 
>   ASoC: SOF: ipc4-loader: remove the CPC check warnings (2024-01-15 14:04:52 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.8
> 
> A bunch of small fixes that come in during the merge window, mainly
> fixing issues from some core refactoring around dummy components that
> weren't detected until things reached mainline.
> 
> The TAS driver changes are a little larger than normal for a device ID
> addition due to some shuffling around of where things are registered and
> DT updates but aren't really any more substantial than normal.

Thanks, pulled now.


Takashi
