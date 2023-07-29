Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9638C767EF6
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Jul 2023 14:01:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABFC61E9;
	Sat, 29 Jul 2023 14:00:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABFC61E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690632108;
	bh=q6rPs+e0/Si+HCy6zwkNfnTFAHjEQFPmrxex2QpZLXs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CT/TmqGFjSs6CJ66zEESoD1Svy3NwRl+gPC4cbGsTNCh2e6NOxSSFkESH2mXDS+8i
	 AgJHDfaS+2TOkgI8+FtQt4hYe4lIq69WTC79YF8i/6gixoBX460FN11ndnzFGzmUyK
	 jGS/W8dj+4LCVZl7bPgN8Mp+qLWCRhDpUn8zdBTc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3682EF80520; Sat, 29 Jul 2023 14:00:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED857F80163;
	Sat, 29 Jul 2023 14:00:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1C4CF8019B; Sat, 29 Jul 2023 14:00:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47DADF800D2
	for <alsa-devel@alsa-project.org>; Sat, 29 Jul 2023 14:00:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47DADF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=QYGnugli;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=QJaimAam
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2AEE8216DA;
	Sat, 29 Jul 2023 12:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690632039;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Og/4urZItaDoPrqR068TFRdUJk+qNCxhcstZwekFiAg=;
	b=QYGnugli6rutLEo+kJ+ZftYb7EXCKpsSPU7RmEy/7nYr2hO+uHW9UP8K0IDGIbj2FnSb25
	oGBEqfRtvvIThGze/OFnXY7qL4CUtEBk5QpiL0NfwIuWB5X+xLxiFpNqfJ0DE4uLgF1thh
	7iJMdZRc5S4EwaCE9xhNVpG9Xbu8Zeo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690632039;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Og/4urZItaDoPrqR068TFRdUJk+qNCxhcstZwekFiAg=;
	b=QJaimAam/uW1kKz6sI4J6IlBDWgUMY0aTmoM+wWSHaXT6n593FEcE16ddZnk5QcAP+Q8Nb
	aHA46TInyhT2i2Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E735713596;
	Sat, 29 Jul 2023 12:00:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id qrlrN2b/xGThewAAMHmgww
	(envelope-from <tiwai@suse.de>); Sat, 29 Jul 2023 12:00:38 +0000
Date: Sat, 29 Jul 2023 14:00:38 +0200
Message-ID: <87mszfc4gp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Justin Stitt <justinstitt@google.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	xen-devel@lists.xenproject.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] ALSA: xen-front: refactor deprecated strncpy
In-Reply-To: <20230727-sound-xen-v1-1-89dd161351f1@google.com>
References: <20230727-sound-xen-v1-1-89dd161351f1@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 4IK5VKZIA66HEBCTXNM64LPKOO75UWLY
X-Message-ID-Hash: 4IK5VKZIA66HEBCTXNM64LPKOO75UWLY
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4IK5VKZIA66HEBCTXNM64LPKOO75UWLY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 27 Jul 2023 23:53:24 +0200,
Justin Stitt wrote:
> 
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> A suitable replacement is `strscpy` [2] due to the fact that it
> guarantees NUL-termination on its destination buffer argument which is
> _not_ always the case for `strncpy`!
> 
> It should be noted that, in this case, the destination buffer has a
> length strictly greater than the source string. Moreover, the source
> string is NUL-terminated (and so is the destination) which means there
> was no real bug happening here. Nonetheless, this patch would get us one
> step closer to eliminating the `strncpy` API in the kernel, as its use
> is too ambiguous. We need to favor less ambiguous replacements such as:
> strscpy, strscpy_pad, strtomem and strtomem_pad (amongst others).
> 
> Technically, my patch yields subtly different behavior. The original
> implementation with `strncpy` would fill the entire destination buffer
> with null bytes [3] while `strscpy` will leave the junk, uninitialized
> bytes trailing after the _mandatory_ NUL-termination. So, if somehow
> `pcm->name` or `card->driver/shortname/longname` require this
> NUL-padding behavior then `strscpy_pad` should be used. My
> interpretation, though, is that the aforementioned fields are just fine
> as NUL-terminated strings. Please correct my assumptions if needed and
> I'll send in a v2.
> 
> [1]: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings
> [2]: manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html
> [3]: https://linux.die.net/man/3/strncpy
> 
> Link: https://github.com/KSPP/linux/issues/90
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Applied now.  Thanks.


Takashi
