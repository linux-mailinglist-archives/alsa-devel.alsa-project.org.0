Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AF7AEB922
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jun 2025 15:42:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2E406022D;
	Fri, 27 Jun 2025 15:41:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2E406022D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751031720;
	bh=h8D9pPn4sOkX4oQmW3Z8WwOOxlbZEHtWkdrxDyyRkcY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LKYKhWlkKzALZaLplJhNqe0K5darEwlXKA8g3qmcBFUaERj8hXxeQptLvGBL2ifq7
	 t/xz69+JT4ZUgXdhhidid7g5PipXdRFxn/m1a0yv0UbDEO5ACXD9vuezo66VsloB6T
	 OXCDPi+a0xFSiDZGmBa/9S4zTheY6gAWDKvCqQ8k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0DA6F805C6; Fri, 27 Jun 2025 15:41:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4818F805BF;
	Fri, 27 Jun 2025 15:41:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AE74F80217; Fri, 27 Jun 2025 15:41:22 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 99F5DF80100
	for <alsa-devel@alsa-project.org>; Fri, 27 Jun 2025 15:41:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99F5DF80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=FW5Bhyb+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=TMtY9Lwk;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=q3uS4Fcd;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=aPqQ2So7
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 797171F394;
	Fri, 27 Jun 2025 13:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1751031679;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YtDxVsp/4IJmXUiqr9/NzkFxmPWCRtSb2R6+f79q0us=;
	b=FW5Bhyb+yJsWsYu46SRNGuIindIUt0qUEWT7fHFUHaNX2Vro4PpZoS5Yw0LLEZVzvtRt0A
	9hSZPRzQG8ivNK/6tlMM8mpVEcHSwVsVcfJ1OCRSqlwTwzGx6lNbaECcOMza/FVydBVDAM
	GLKz1efUTv71Um1fFn2Ia5/kyLbxoag=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751031679;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YtDxVsp/4IJmXUiqr9/NzkFxmPWCRtSb2R6+f79q0us=;
	b=TMtY9Lwkwl9+8loxlefW1neNjmgDBqcmOSJ/ieo2d4HYIGAr48rXIXtWoROK4d/689G6N3
	qpsBNpQ38M9i33Cw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=q3uS4Fcd;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=aPqQ2So7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1751031677;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YtDxVsp/4IJmXUiqr9/NzkFxmPWCRtSb2R6+f79q0us=;
	b=q3uS4FcdrbOj3RsFe+Eo1SDRoLLsGg3PmL2Mvbgkq6HWHThq6R5i4FQ8vqu8rRsapXxL3X
	hj1Ajqnccxw5RRsk58S3kgylWQ5UM+wqeSTxb67h01usejhVxgMR6C58RjqVI8kxxxpp5M
	ZSo7F/4q3h0Ap5wJX6pXSozgdSHi8qg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751031677;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YtDxVsp/4IJmXUiqr9/NzkFxmPWCRtSb2R6+f79q0us=;
	b=aPqQ2So71XUd2WzoBh0Lug5H7oL3LAjpDTcK214rSbQJaI3h95wwoKB5izdBY1w5c4aGeW
	TrFLZZQYdum1ZzBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 60066138A7;
	Fri, 27 Jun 2025 13:41:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id D2M4Fn2fXmgMQQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Jun 2025 13:41:17 +0000
Date: Fri, 27 Jun 2025 15:41:16 +0200
Message-ID: <875xghgv43.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sandeep Verma <kv.sandeep1807@gmail.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: Handling Lost Audio IRQs in ALSA: Triggering XRUN on Timer
 Detection?
In-Reply-To: 
 <CAMvEac3q50CSfagMXgRzuVOJUniBa1NrbQQHL4R0SZrn0KFZPA@mail.gmail.com>
References: 
 <CAMvEac3q50CSfagMXgRzuVOJUniBa1NrbQQHL4R0SZrn0KFZPA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-2022-JP
X-Spamd-Result: default: False [-2.48 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.17)[-0.854];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cleanly.my:url,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid,afterward.to:url]
X-Rspamd-Queue-Id: 797171F394
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: 2RUXVCAXBKAWALNX5DZ7VCWKC7QVTOQN
X-Message-ID-Hash: 2RUXVCAXBKAWALNX5DZ7VCWKC7QVTOQN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2RUXVCAXBKAWALNX5DZ7VCWKC7QVTOQN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 25 Jun 2025 05:29:43 +0200,
Sandeep Verma wrote:
> 
> Hi all,I’m currently investigating a sporadic issue in our system where an
> audio interrupt is occasionally lost. When this happens, ALSA detects the
> anomaly (presumably through its internal timestamp or delay detection), but
> it doesn’t appear to take corrective action―leading to persistent audio
> jitter afterward.To address this, I’m considering implementing a mechanism
> in our driver or platform layer that uses a timer to check if the expected
> audio interrupt hasn’t arrived within a certain timeframe (e.g., 2x the
> period size). If this condition is met, I plan to explicitly trigger an
> XRUN to reset the pipeline and recover cleanly.My questions are:
> 
>    1. Is this an acceptable and “ALSA-friendly” way to handle lost IRQs?

Yes, a XRUN detection in the driver side is fine, per se.

>    2. If this is a reasonable approach, why doesn’t ALSA do this by default?

Maybe a simple answer is that because it's a rare case.

The PCM core has a correction of the lost interrupt at PCM pointer
reporting, but it's done at updating the PCM pointer, e.g. via
snd_pcm_period_elapsed() call.  The detection of the lost interrupt is
left to each driver, since there can be various mechanisms to do
that.

>    3. Is there a better or recommended way within the ALSA framework to
>    detect and recover from such missed interrupts?

The recovery depends on the tolerance.  The XRUN handling is a
brute-force stop and restart.  But it might be that you can simply
ignore one lost interrupt if the buffer consists of many small
periods, too.

> I’d appreciate any guidance or suggestions. If this kind of timer-based
> recovery would be broadly useful, I’d also be happy to explore whether it
> could be proposed upstream.

So feel free to submit your fix patch.

But, for the kernel patches, please submit to linux-sound ML, instead
of alsa-devel ML.


thanks,

Takashi
