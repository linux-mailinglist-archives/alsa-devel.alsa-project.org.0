Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7988A4F924
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Mar 2025 09:51:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E364602B8;
	Wed,  5 Mar 2025 09:50:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E364602B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741164660;
	bh=04ydXd9ZJD8ggoSOkUAHeWehYwl21UxkbE4x2UDfo14=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eGtV28yysvUzmgWNZ4jw4BzAofs0RoT2CwnGUvYKd9FrORZ9fvGKAjI9oXrAnK5QP
	 TIw7J+XJRA0LkXUUUUAfU17oXlYGI/9954P72uIcLvA31SjbGuAzGzKRtFsVcFw9yZ
	 Px/bZh0x+bvj/xwvtKe70hExO6qMOqmOz4/E1UQo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E114F8011B; Wed,  5 Mar 2025 09:50:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49634F805BD;
	Wed,  5 Mar 2025 09:50:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D984F802BE; Wed,  5 Mar 2025 09:50:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4618F8011B
	for <alsa-devel@alsa-project.org>; Wed,  5 Mar 2025 09:50:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4618F8011B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=0uKAOdLD;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=rx471RPS;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=0uKAOdLD;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=rx471RPS
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 68F9021193;
	Wed,  5 Mar 2025 08:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1741164611;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4sJb+1hJybwJ9oz3a1IbC6b0kZKRl4Lv6tcPSNukdjQ=;
	b=0uKAOdLDdhRub0XKqX7/fWzHZe7BkRNHlAvCCitqAHZOykI4hQyMALa6TaOLlVHfP8Nc9I
	2txSaH9DSc5rFY9L09Qz6wSt/8waZQ0AW7uhd1X7RopBiX7YMSueNkm5kfAtkz2ZP+AL6b
	IaNuMAtrWqrBlMmTXGHN85nKBAyjepw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741164611;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4sJb+1hJybwJ9oz3a1IbC6b0kZKRl4Lv6tcPSNukdjQ=;
	b=rx471RPSMPC8R2xP0TFBrI6GCZIFrUIoA7UUmdUgD7CSeIAXyDf4pAFzoiT5i8Vg8ETO1a
	Vl1xp1S+/iUHvcDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0uKAOdLD;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rx471RPS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1741164611;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4sJb+1hJybwJ9oz3a1IbC6b0kZKRl4Lv6tcPSNukdjQ=;
	b=0uKAOdLDdhRub0XKqX7/fWzHZe7BkRNHlAvCCitqAHZOykI4hQyMALa6TaOLlVHfP8Nc9I
	2txSaH9DSc5rFY9L09Qz6wSt/8waZQ0AW7uhd1X7RopBiX7YMSueNkm5kfAtkz2ZP+AL6b
	IaNuMAtrWqrBlMmTXGHN85nKBAyjepw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741164611;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4sJb+1hJybwJ9oz3a1IbC6b0kZKRl4Lv6tcPSNukdjQ=;
	b=rx471RPSMPC8R2xP0TFBrI6GCZIFrUIoA7UUmdUgD7CSeIAXyDf4pAFzoiT5i8Vg8ETO1a
	Vl1xp1S+/iUHvcDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 41E5313939;
	Wed,  5 Mar 2025 08:50:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BOtvDkMQyGeVXwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Mar 2025 08:50:11 +0000
Date: Wed, 05 Mar 2025 09:50:10 +0100
Message-ID: <87tt87uail.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: update ALC222 depop optimize
In-Reply-To: <494a665481e043a38b94d844654fa81f@realtek.com>
References: <81c7f0ec4a2447219c06095e0de4d1d3@realtek.com>
	<87zfhzud4s.wl-tiwai@suse.de>
	<f7fba6fc8d9e4abfb0c89e487e1d5d89@realtek.com>
	<87wmd3uc28.wl-tiwai@suse.de>
	<494a665481e043a38b94d844654fa81f@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 68F9021193
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: MDS5KWTVZUV3RAP3SBAMUOF52B774TDU
X-Message-ID-Hash: MDS5KWTVZUV3RAP3SBAMUOF52B774TDU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MDS5KWTVZUV3RAP3SBAMUOF52B774TDU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 05 Mar 2025 09:22:20 +0100,
Kailang wrote:
> 
> 
> 
> > -----Original Message-----
> > From: Takashi Iwai <tiwai@suse.de>
> > Sent: Wednesday, March 5, 2025 4:17 PM
> > To: Kailang <kailang@realtek.com>
> > Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>;
> > linux-sound@vger.kernel.org
> > Subject: Re: update ALC222 depop optimize
> > 
> > 
> > External mail : This email originated from outside the organization. Do not
> > reply, click links, or open attachments unless you recognize the sender and
> > know the content is safe.
> > 
> > 
> > 
> > On Wed, 05 Mar 2025 08:56:41 +0100,
> > Kailang wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Takashi Iwai <tiwai@suse.de>
> > > > Sent: Wednesday, March 5, 2025 3:54 PM
> > > > To: Kailang <kailang@realtek.com>
> > > > Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>;
> > > > linux-sound@vger.kernel.org
> > > > Subject: Re: update ALC222 depop optimize
> > > >
> > > >
> > > > External mail : This email originated from outside the organization.
> > > > Do not reply, click links, or open attachments unless you recognize
> > > > the sender and know the content is safe.
> > > >
> > > >
> > > >
> > > > On Wed, 05 Mar 2025 07:32:00 +0100,
> > > > Kailang wrote:
> > > > >
> > > > > Hi Takashi,
> > > > >
> > > > > Update ALC222 depop optimize as attach.
> > > >
> > > > Could you give a bit more background info why this change is needed?
> > > > Is it a mandatory change to fix something, or it improves something?
> > > >
> > > This codec has two headphone design.
> > > The HP2 was nid 0x14.
> > 
> > Sorry not clear enough: do you mean the patch is to fix the depop problems on
> > the models with two headphone pins with ALC222?
> 
> Yes, the original depop was only supported one headphone.

OK, and then would it be a bit risky to blindly assume the second
headphone pin 0x14?  Isn't it set up via pin config?


thanks,

Takashi
