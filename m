Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 342A598A641
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2024 15:56:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60AE620C3;
	Mon, 30 Sep 2024 15:55:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60AE620C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727704564;
	bh=P/N39VxAAdMgvisBeZC+CBqqnkTZah13Ij5p4K/DsbM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dn/rFAwhpJWcSqNNSjT+Jqqk6aksyhNHwcMTgfm0b4c/X06y9ZFfbBsGQx158LIaJ
	 Kt7pQn0SSWdwZOF+IyNiHh/CtqXEyRKixnUeSb7Mo6ZIR0KbXO6J2G6OTcICbg/SNd
	 AyrkyfaD1cO6fgdDIkaDCkAR+DX37/tPys77NF2w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEAB9F805B3; Mon, 30 Sep 2024 15:55:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42167F8059F;
	Mon, 30 Sep 2024 15:55:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 451F2F80517; Mon, 30 Sep 2024 15:55:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2F29F80074
	for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2024 15:55:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2F29F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=R3Tqz9oL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=QYaxddRu;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=R3Tqz9oL;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=QYaxddRu
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B701D1FBA4;
	Mon, 30 Sep 2024 13:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1727704525;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M5hnksWNznv7p5BKwksx91M883+SxXIyLlkhprX30Fg=;
	b=R3Tqz9oLcx6KB4ZjwuguoE4Nk7J7vanhDd3nUPSUqLUEo6bRnWQZ1jVHDJP5I0HPNUEvAn
	rVwt4DOnDCJrCFnM6czV/bPjW3nBdtzDyr8RvKwu9ooFvd6lJ5XzpGeWgutWm9MR68k4Su
	zvMlamXjjcnQwl5ITCRa6NvflNenLxg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727704525;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M5hnksWNznv7p5BKwksx91M883+SxXIyLlkhprX30Fg=;
	b=QYaxddRuqOSg1lcX/O7IGy9K7p3e5MZ5PkFLNHf2ZF2LHSh3W70Z6YseN1v1OHufpCYZAZ
	fB+02UWbUSzB1/DQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=R3Tqz9oL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=QYaxddRu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1727704525;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M5hnksWNznv7p5BKwksx91M883+SxXIyLlkhprX30Fg=;
	b=R3Tqz9oLcx6KB4ZjwuguoE4Nk7J7vanhDd3nUPSUqLUEo6bRnWQZ1jVHDJP5I0HPNUEvAn
	rVwt4DOnDCJrCFnM6czV/bPjW3nBdtzDyr8RvKwu9ooFvd6lJ5XzpGeWgutWm9MR68k4Su
	zvMlamXjjcnQwl5ITCRa6NvflNenLxg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727704525;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M5hnksWNznv7p5BKwksx91M883+SxXIyLlkhprX30Fg=;
	b=QYaxddRuqOSg1lcX/O7IGy9K7p3e5MZ5PkFLNHf2ZF2LHSh3W70Z6YseN1v1OHufpCYZAZ
	fB+02UWbUSzB1/DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8DA2313A8B;
	Mon, 30 Sep 2024 13:55:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mlNbIc2t+magBgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 30 Sep 2024 13:55:25 +0000
Date: Mon, 30 Sep 2024 15:56:18 +0200
Message-ID: <87h69xgs8t.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oldherl Oh <me@oldherl.one>
Cc: alsa-devel@alsa-project.org,
	bo.liu@senarytech.com
Subject: Re: [PATCH v2] ALSA: hda/conexant: fix some typos
In-Reply-To: <20240930084132.3373750-1-me@oldherl.one>
References: <20240930084132.3373750-1-me@oldherl.one>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: B701D1FBA4
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: UQTD63AAQP53JQNTRRAI5XLBGEMRTXPH
X-Message-ID-Hash: UQTD63AAQP53JQNTRRAI5XLBGEMRTXPH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UQTD63AAQP53JQNTRRAI5XLBGEMRTXPH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 30 Sep 2024 10:41:32 +0200,
Oldherl Oh wrote:
> 
> Fix some typos in patch_conexant.c
> 
> Signed-off-by: Oldherl Oh <me@oldherl.one>

Thanks, applied.


Takashi
