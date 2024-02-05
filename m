Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 468A6849483
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Feb 2024 08:27:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EDA1200;
	Mon,  5 Feb 2024 08:27:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EDA1200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707118032;
	bh=sOZPsVWyHoeELv8lbeaSKh4wNWFfURCR+whNZUoiahg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Rpb+ipx6lwmYLC3i4oNsmsTAsAmGNtu9Bct9l7VK3wncvJGIkjjN90ceKFMlNJaXi
	 QddS45bxMju25q3Ny4bX6ZhNqduYTu5VUH6qFOcZVjzNCKy3WGguPZ1mD8/2jsg07X
	 /bpS0IRUO8UVOVtiq/2Y3gH5kNh1iCcwTouawV8o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1DB1F805AE; Mon,  5 Feb 2024 08:26:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A62BF80589;
	Mon,  5 Feb 2024 08:26:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DCAAF804E7; Mon,  5 Feb 2024 08:26:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E57CF8016E
	for <alsa-devel@alsa-project.org>; Mon,  5 Feb 2024 08:26:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E57CF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=cBUcRynh;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=n7vIRy9V;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=YM+nNcbd;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=PXhylMj+
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D75FC22284;
	Mon,  5 Feb 2024 07:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707117988;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vQlwKvepqE96JG4+RlHJGRLhkZTzMFoUfZrLwwszz7c=;
	b=cBUcRynhjIs/2Rd/QEVBPpFXJ1Zt+HJIR7agDQLqrPkgB9ZXM552L00XjxslL2JzML2/ei
	Qr8kLGtYEkj9tRx2f0CEmA5PRqkQHon8eWNp3eQp6NUkANBt6jzAcliMRGgLSVzluIU6Dk
	drLB6eK2J3iIiXHJRCuDWLwGQ01raCQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707117988;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vQlwKvepqE96JG4+RlHJGRLhkZTzMFoUfZrLwwszz7c=;
	b=n7vIRy9V4bZ42yxs+nKLTcjVWlkg/TuNW/jgf6ZeDkmrm6iFPZOoISHxE2MbQMLMlG4diJ
	Ko5Hh71g65/5whBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707117987;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vQlwKvepqE96JG4+RlHJGRLhkZTzMFoUfZrLwwszz7c=;
	b=YM+nNcbdQ5g1g+tgNDp7vL8awezHxIE4GLArR+1H4tMKr+Ui7MYP4tcX4fnjbndCeOH4nb
	pEavrZXJSaJTqEfvgeiqNAXI6h7t8Ej8oseo6aLQB8cH+tunjgXpHUW8h2qMrQr26HAQ0k
	8jWKWu55pSP5duoBUp9ndbpgstchb/o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707117987;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vQlwKvepqE96JG4+RlHJGRLhkZTzMFoUfZrLwwszz7c=;
	b=PXhylMj+r8QOLXIZAxcC0srPlvuY4X82cPwpiYy3N79rA7OAsLT8QddSCZznI0CRi4s4xp
	fgpPGADHaQQX+QDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A2C3C136F5;
	Mon,  5 Feb 2024 07:26:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ud4bJqONwGVqfgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 05 Feb 2024 07:26:27 +0000
Date: Mon, 05 Feb 2024 08:26:27 +0100
Message-ID: <87plxb9xss.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: <shumingf@realtek.com>
Cc: <alsa-devel@alsa-project.org>,
	<kailang@realtek.com>,
	<flove@realtek.com>,
	<oder_chiou@realtek.com>
Subject: Re: [PATCH] ALSA: hda/realtek: add IDs for Dell dual spk platform
In-Reply-To: <20240205072252.3791500-1-shumingf@realtek.com>
References: <20240205072252.3791500-1-shumingf@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=YM+nNcbd;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PXhylMj+
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-5.47 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,realtek.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.96)[99.84%]
X-Rspamd-Queue-Id: D75FC22284
Message-ID-Hash: WYIZKMJTZWEGZN5LAB7DGQFU2WLCKQIW
X-Message-ID-Hash: WYIZKMJTZWEGZN5LAB7DGQFU2WLCKQIW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WYIZKMJTZWEGZN5LAB7DGQFU2WLCKQIW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 05 Feb 2024 08:22:52 +0100,
<shumingf@realtek.com> wrote:
> 
> From: Shuming Fan <shumingf@realtek.com>
> 
> This patch adds another two IDs for the Dell dual speaker platform.
> 
> Signed-off-by: Shuming Fan <shumingf@realtek.com>

Thanks, applied now.


Takashi
