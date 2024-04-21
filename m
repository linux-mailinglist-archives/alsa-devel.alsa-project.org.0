Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5EA8AC050
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Apr 2024 19:37:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74149E0F;
	Sun, 21 Apr 2024 19:37:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74149E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713721074;
	bh=TwI2qMXYuhhfaiqvQ31qVNyzCDr8DKrAOG+tEu9G14k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uXPIVwnJ9Dz9/XJz1ab5PGL1Q+RrG9t5IIKdgrFcXktxnq85Lr7qDleSDlVvri7rx
	 wmBjSiUWH+/qw+BewCO6BqspQwUN12AwUA596KctTrEpixi2Ie+wbLUeyCXZlO74CO
	 DkqF/MMompaQirP4dtd2nioP61BvIpv1+c8DphFA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5075FF8057C; Sun, 21 Apr 2024 19:37:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1B64F8058C;
	Sun, 21 Apr 2024 19:37:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B584F802E8; Sun, 21 Apr 2024 19:33:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 582B8F8003A
	for <alsa-devel@alsa-project.org>; Sun, 21 Apr 2024 19:32:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 582B8F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=goY/VTqX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Q7TR+q6L;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=goY/VTqX;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Q7TR+q6L
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0C58C5BE8A;
	Sun, 21 Apr 2024 17:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1713720735;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cQUY+ukk88AS8JHZQuQVE/sQcI8MVSVlq2WdArJBT8M=;
	b=goY/VTqX5KaRsFGcTIHPYjrOCFGEpkWZJtqsjB42hp6e5W/MXJTdbKND1vu4IAuk7zR2tq
	kVJVG/vKaOSJk8BZFRsbKJZXb9yGC7YStSWkAmEuW3tWlLMV6fo8disEI7vsWDpYExAZ9k
	5/QpatQ9QKd27+8mqxEfX3oOHPuwiIA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713720735;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cQUY+ukk88AS8JHZQuQVE/sQcI8MVSVlq2WdArJBT8M=;
	b=Q7TR+q6Lo6V8GVD7ClDvnOiDr4ie4zbtgb5FA30cVpoqIwkP6CAoM49S+C3xeVKzzWtDZE
	Mmuw31/TwiausEBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1713720735;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cQUY+ukk88AS8JHZQuQVE/sQcI8MVSVlq2WdArJBT8M=;
	b=goY/VTqX5KaRsFGcTIHPYjrOCFGEpkWZJtqsjB42hp6e5W/MXJTdbKND1vu4IAuk7zR2tq
	kVJVG/vKaOSJk8BZFRsbKJZXb9yGC7YStSWkAmEuW3tWlLMV6fo8disEI7vsWDpYExAZ9k
	5/QpatQ9QKd27+8mqxEfX3oOHPuwiIA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713720735;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cQUY+ukk88AS8JHZQuQVE/sQcI8MVSVlq2WdArJBT8M=;
	b=Q7TR+q6Lo6V8GVD7ClDvnOiDr4ie4zbtgb5FA30cVpoqIwkP6CAoM49S+C3xeVKzzWtDZE
	Mmuw31/TwiausEBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B9CAC13687;
	Sun, 21 Apr 2024 17:32:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 93PhK55NJWY2FAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 21 Apr 2024 17:32:14 +0000
Date: Sun, 21 Apr 2024 19:32:23 +0200
Message-ID: <87a5lm4o60.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: g@b4.vu,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	llvm@lists.linux.dev,
	patches@lists.linux.dev
Subject: Re: [PATCH] ALSA: scarlett2: Zero initialize ret in
 scarlett2_ag_target_ctl_get()
In-Reply-To: 
 <20240419-alsa-scarlett2-fix-wsometimes-uninitialized-v1-1-e2ace8642e08@kernel.org>
References: 
 <20240419-alsa-scarlett2-fix-wsometimes-uninitialized-v1-1-e2ace8642e08@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.24 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	BAYES_HAM(-0.94)[86.47%];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[]
Message-ID-Hash: 2U5EUNSAV5VRVYDLYX6AJU75JWEWMKYM
X-Message-ID-Hash: 2U5EUNSAV5VRVYDLYX6AJU75JWEWMKYM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2U5EUNSAV5VRVYDLYX6AJU75JWEWMKYM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 20 Apr 2024 02:25:59 +0200,
Nathan Chancellor wrote:
> 
> Clang warns (or errors with CONFIG_WERROR):
> 
>   sound/usb/mixer_scarlett2.c:3697:6: error: variable 'err' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>    3697 |         if (private->autogain_updated) {
>         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
>   sound/usb/mixer_scarlett2.c:3707:9: note: uninitialized use occurs here
>    3707 |         return err;
>         |                ^~~
>   sound/usb/mixer_scarlett2.c:3697:2: note: remove the 'if' if its condition is always true
>    3697 |         if (private->autogain_updated) {
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   sound/usb/mixer_scarlett2.c:3688:9: note: initialize the variable 'err' to silence this warning
>    3688 |         int err;
>         |                ^
>         |                 = 0
>   1 error generated.
> 
> Initialize ret to zero to ensure ret is initialized in all paths within
> scarlett2_ag_target_ctl_get(), which matches the style of other
> functions in this driver.
> 
> Fixes: e30ea5340c25 ("ALSA: scarlett2: Add autogain target controls")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks, applied now.

> ---
> FWIW, a lot of the functions that end in just 'mutex_unlock()' before
> returning could probably benefit from the cleanup.h infrastructure,
> which would help with the scope of err in this particular function, but
> I decided to go with the most minimal fix here.

Yeah, we can clean up lots of such code now.

If it were a new code file, I'd suggest it, but since it was an
extention of the existing code, I accepted as is.


thanks,

Takashi
