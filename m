Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F01A67558
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Mar 2025 14:40:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E37560373;
	Tue, 18 Mar 2025 14:40:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E37560373
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742305256;
	bh=cvajKkvuqbKU3jmB3q0F6N9Su9s3Rg3eh8HYzmL+ajE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S+nIAsRj4jry5v8do1L/a6tZwfiMr5ADStHJXZDdNk8XSCfgGF7zZcCdzFvO0z/xi
	 1oVL+nbcG3LZxM5Y7pAySr6JrMOGqzpM1SWILwKBwEQK+4yqTt9N63JVUquRrIAIFM
	 TkrICQ7SjUhI6/BPxEpKxxquyMcIh4blRXSRn7eI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0996EF805BA; Tue, 18 Mar 2025 14:40:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CBAAEF805AE;
	Tue, 18 Mar 2025 14:40:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFEF5F80587; Tue, 18 Mar 2025 14:40:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4AE70F80093
	for <alsa-devel@alsa-project.org>; Tue, 18 Mar 2025 14:40:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AE70F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=1fEYIhzG;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=3/xlkDBI;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=vUdxEEWb;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=rKJdWq17
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EC1A221232;
	Tue, 18 Mar 2025 13:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1742305217;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h/5krZYaFQojyOXw3q5Pi7Cp5WRjTZ9YjAT8NAGmDKM=;
	b=1fEYIhzGu9k0PzFkTbCgIg4R6MOTDFd+nwwoOeds8uz6l9Ocxy8X6+OLbNWSTcVUfw5kfv
	H6EcYQBTuJHJX3/XCx8mMlk0f3CxwJxRt1AhGgFMCGbpdpHqq6rj7Ut1oENWUPUtEwvIFz
	Obrm6OZZyuZGoeqGqonuZ2loaJ/yw6E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742305217;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h/5krZYaFQojyOXw3q5Pi7Cp5WRjTZ9YjAT8NAGmDKM=;
	b=3/xlkDBIhLBpULrXTFSoLzyPYj9Tc58c/HqtHLhgWd/qsUE/hljZTPq5mPUPclk73y0fVe
	M2AVMDePgrO4kQCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1742305216;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h/5krZYaFQojyOXw3q5Pi7Cp5WRjTZ9YjAT8NAGmDKM=;
	b=vUdxEEWbmCOhAfvCg8s0JuM0MhBpN9Age+TmlSjis+ANiHmrXz1B6UOYwD1QA1wpYQorwu
	Ht3mvTYUcqgfIjwPrhnLkMaqnPYMujto6LhxM64zBOtmEQiM8Ldc4zckhNPo+DQWXUyTWX
	TVn21d2i65m6F3BjnwWFIpX/SD4www4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742305216;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h/5krZYaFQojyOXw3q5Pi7Cp5WRjTZ9YjAT8NAGmDKM=;
	b=rKJdWq17VN6nXT7nXaBVl1mbGkbbylu3BAKjXnqWyevmUBJkOekcohzPS4igBbrt3CQ1iE
	hKJSrMuDyrkLQgCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C8F7F139D2;
	Tue, 18 Mar 2025 13:40:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zt3VL8B32WcUdQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 18 Mar 2025 13:40:16 +0000
Date: Tue, 18 Mar 2025 14:40:16 +0100
Message-ID: <877c4m1mpr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dhruv Deshpande <dhrv.d@proton.me>
Cc: tiwai@suse.com,
	alsa-devel@alsa-project.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Support mute LED on HP Laptop
 15s-du3xxx
In-Reply-To: <20250317085621.45056-1-dhrv.d@proton.me>
References: <20250317083319.42195-1-dhrv.d@proton.me>
	<875xk8f3ue.wl-tiwai@suse.de>
	<20250317085621.45056-1-dhrv.d@proton.me>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: NJ34M6KBG7ESGKXKAEJWYOICG4CWOCO4
X-Message-ID-Hash: NJ34M6KBG7ESGKXKAEJWYOICG4CWOCO4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NJ34M6KBG7ESGKXKAEJWYOICG4CWOCO4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 17 Mar 2025 09:56:53 +0100,
Dhruv Deshpande wrote:
> 
> The mute LED on this HP laptop uses ALC236 and requires a quirk to function.
> This patch enables the existing quirk for the device.
> 
> Tested on my laptop and the LED behaviour works as intended.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Dhruv Deshpande <dhrv.d@proton.me>

Applied now.  Thanks.


Takashi
