Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3DA875F35
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Mar 2024 09:15:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B437B83E;
	Fri,  8 Mar 2024 09:15:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B437B83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709885733;
	bh=E1VuqqBqHBmB3AcmKON5HxlyrVTCGRnUsIHcAq9I8bc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dBfpnOdDMiI7Q7xhpsQzWPgrxnnmXl6i/M766orKqOXh+MpHgvpmK7i73l+zQuTNT
	 a4nd0T6RjP8nrKNJpN2DZ6bdGVmfL8wKpxbF0NraqtywjWbXhya8ZJsQ8SsL8/TUPu
	 OVlNS7sCr69U05MlgCHRfEqioTcRr0YPNcDokc3o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5353FF8057E; Fri,  8 Mar 2024 09:15:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62F9BF805A0;
	Fri,  8 Mar 2024 09:15:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09F4AF8024E; Fri,  8 Mar 2024 09:14:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A4FEF80088
	for <alsa-devel@alsa-project.org>; Fri,  8 Mar 2024 09:14:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A4FEF80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=zlyblu0W;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=WFodxNfX;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=zlyblu0W;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=WFodxNfX
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E019C20F45;
	Fri,  8 Mar 2024 08:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1709885683;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nl8GdUngAEynxbdYL0T+D1PDfvTfBnMDZGTDnjnebBI=;
	b=zlyblu0Wj/Dl8gSbA7o9rlVel51E0Lo1eW6x/tpa+DiwZHsIq45JlIeOuW1rWGYefbfOi8
	B5OYDatBI5IuoFtMfrAP8+p0ChAjgt3gJTfwufzgHiC4ojO9pFkJoYbNh7iqFuqmygPQb/
	gvDcZ6x7I70gPUt65SKaJoNgTv6BroI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709885683;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nl8GdUngAEynxbdYL0T+D1PDfvTfBnMDZGTDnjnebBI=;
	b=WFodxNfX9jfeGwpof4JxSDzzxJvWHBVE0Y4JhAK9tPMC0IaW0Gba1CYpCT9vw78K1rUShk
	h3jiao1rg2yQfXCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1709885683;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nl8GdUngAEynxbdYL0T+D1PDfvTfBnMDZGTDnjnebBI=;
	b=zlyblu0Wj/Dl8gSbA7o9rlVel51E0Lo1eW6x/tpa+DiwZHsIq45JlIeOuW1rWGYefbfOi8
	B5OYDatBI5IuoFtMfrAP8+p0ChAjgt3gJTfwufzgHiC4ojO9pFkJoYbNh7iqFuqmygPQb/
	gvDcZ6x7I70gPUt65SKaJoNgTv6BroI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709885683;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nl8GdUngAEynxbdYL0T+D1PDfvTfBnMDZGTDnjnebBI=;
	b=WFodxNfX9jfeGwpof4JxSDzzxJvWHBVE0Y4JhAK9tPMC0IaW0Gba1CYpCT9vw78K1rUShk
	h3jiao1rg2yQfXCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B493313310;
	Fri,  8 Mar 2024 08:14:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6nJHKvPI6mVsTQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 08 Mar 2024 08:14:43 +0000
Date: Fri, 08 Mar 2024 09:14:43 +0100
Message-ID: <878r2txhqk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.8-rc7
In-Reply-To: <20240307201313.4B02EC433F1@smtp.kernel.org>
References: <20240307201313.4B02EC433F1@smtp.kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zlyblu0W;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WFodxNfX
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.29 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FREEMAIL_CC(0.00)[gmail.com,alsa-project.org];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-1.78)[93.65%]
X-Rspamd-Queue-Id: E019C20F45
Message-ID-Hash: ANJI4OQ2PYW3ZGFMBZ5MVOILBCPJNVPJ
X-Message-ID-Hash: ANJI4OQ2PYW3ZGFMBZ5MVOILBCPJNVPJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ANJI4OQ2PYW3ZGFMBZ5MVOILBCPJNVPJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 07 Mar 2024 21:13:02 +0100,
Mark Brown wrote:
> 
> The following changes since commit ed00a6945dc32462c2d3744a3518d2316da66fcc:
> 
>   ASoC: amd: yc: Fix non-functional mic on Lenovo 21J2 (2024-02-28 12:24:59 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.8-rc7
> 
> for you to fetch changes up to 96e202f8c52ac49452f83317cf3b34cd1ad81e18:
> 
>   ASoC: wm8962: Fix up incorrect error message in wm8962_set_fll (2024-03-06 17:44:22 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.8
> 
> Some more driver specific fixes for v6.8, plus one new x86 platform
> quirk.  All good fixes to have if you have systems that use the relevant
> hardware.

Pulled now.  Thanks.


Takashi
