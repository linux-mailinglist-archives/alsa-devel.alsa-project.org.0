Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F308B8221C9
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 20:10:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16201EB9;
	Tue,  2 Jan 2024 20:10:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16201EB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704222629;
	bh=Vt0sMFYlRjioUQDDDkS52n6W8+vhZ6C6zvpG4SfLsqc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=um9nGfKPFicJDMZhy0Ps1uwMqrNacdg9u7/harhvEXqw9JpfKx/uir8driNw5Ufpm
	 G5t+6X1rSd98a6pdR+0O8JuFn0xF2x8osyQB05wdyjcGfkeF/gU1qud91ekO+zt/5z
	 hDeACYkpirsq7b1S+uVZSMGxu2DNLpEakc2Io7VU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56197F805A0; Tue,  2 Jan 2024 20:10:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C857F80580;
	Tue,  2 Jan 2024 20:10:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EFFFF80557; Tue,  2 Jan 2024 20:09:58 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 63149F80424
	for <alsa-devel@alsa-project.org>; Tue,  2 Jan 2024 20:09:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63149F80424
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=zmvZh4Xa;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ljqqFpOV;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=zmvZh4Xa;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ljqqFpOV
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 256A31F7B9;
	Fri, 29 Dec 2023 14:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1703860827;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6ZFrIyrsoyE1a1N5hjjoD7plvaNI6lZtgk7Kb37Nqo4=;
	b=zmvZh4XaX2DLKbXzLwT8XIheI4SWr0E31f7rRjjsG780Gkcay9y98JSXhn3oIYSu25YeXi
	yxWXWhjqEqS7cC2BQrXPGXemo+PMJeqZ6wmDlyxgNiDiXJFHpBKMhbW5bb9B/vK/554kY6
	//hGZSJM/NGQtbRHxBHQaOLkjdDf3fA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1703860827;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6ZFrIyrsoyE1a1N5hjjoD7plvaNI6lZtgk7Kb37Nqo4=;
	b=ljqqFpOVCTXivfG+hIyFJhVTd9cKko9hyoMyrirnNgrOysu4mNRC8PPrNzedgXfADJ4DKv
	A/I31v76z35LOMAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1703860827;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6ZFrIyrsoyE1a1N5hjjoD7plvaNI6lZtgk7Kb37Nqo4=;
	b=zmvZh4XaX2DLKbXzLwT8XIheI4SWr0E31f7rRjjsG780Gkcay9y98JSXhn3oIYSu25YeXi
	yxWXWhjqEqS7cC2BQrXPGXemo+PMJeqZ6wmDlyxgNiDiXJFHpBKMhbW5bb9B/vK/554kY6
	//hGZSJM/NGQtbRHxBHQaOLkjdDf3fA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1703860827;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6ZFrIyrsoyE1a1N5hjjoD7plvaNI6lZtgk7Kb37Nqo4=;
	b=ljqqFpOVCTXivfG+hIyFJhVTd9cKko9hyoMyrirnNgrOysu4mNRC8PPrNzedgXfADJ4DKv
	A/I31v76z35LOMAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EF7EA133E5;
	Fri, 29 Dec 2023 14:40:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LgQGOVrajmVgfAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Dec 2023 14:40:26 +0000
Date: Fri, 29 Dec 2023 15:40:26 +0100
Message-ID: <87il4hxeat.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: scarlett2: Convert meter levels from little-endian
In-Reply-To: <ZYsBIE3DSKdi4YC/@m.b4.vu>
References: <ZYsBIE3DSKdi4YC/@m.b4.vu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-3.30 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[99.98%]
Message-ID-Hash: LSWTJJNIYN2TSNJUTJWLSRQZ55R2DZS3
X-Message-ID-Hash: LSWTJJNIYN2TSNJUTJWLSRQZ55R2DZS3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LSWTJJNIYN2TSNJUTJWLSRQZ55R2DZS3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 26 Dec 2023 17:36:48 +0100,
Geoffrey D. Bennett wrote:
> 
> Add missing conversion from little-endian data to CPU-endian in
> scarlett2_usb_get_meter_levels().
> 
> Fixes: 3473185f31df ("ALSA: scarlett2: Remap Level Meter values")
> Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
> ---
> 
> Hi Takashi,
> 
> Can you add this to 6.7-rc8 please.

Applied to for-linus branch.  I'm going to send a PR for 6.7 final in
the next week.


thanks,

Takashi
