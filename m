Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 817E1767EF8
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Jul 2023 14:02:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 231CE83E;
	Sat, 29 Jul 2023 14:01:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 231CE83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690632159;
	bh=m1lj8KGB4cab2cFik1XUimkWDhFGvnyBF0LPPesnjq0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PBaOPW1OlF770fbH7EEkih6Wvl66MqxaqPaPi/bqbhZP8d9pNwRpqpRY9nl9NySUb
	 WW394VvcQV5BUM06xdKoHAbII/NYweJYfCygb4RJnQv3ibkIlP67R9eV9qsou5SpOe
	 i4G3o4FAchdxabk/jBg4+ANSiVGwm+pNxF4fFNr0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E40F1F80557; Sat, 29 Jul 2023 14:01:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63E2DF80310;
	Sat, 29 Jul 2023 14:01:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 092E6F80548; Sat, 29 Jul 2023 14:00:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 33372F80310
	for <alsa-devel@alsa-project.org>; Sat, 29 Jul 2023 14:00:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33372F80310
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=fOj76iqA;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=X11RbWgL
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9798F1F8A3;
	Sat, 29 Jul 2023 12:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690632056;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=egMCYOG2uWRf43Q/bpZk0mUrDdU/hmHB0oSczsRgcao=;
	b=fOj76iqAakewDDQVg3ERFYSUceIt7FXI6JlQ6lqVO8CyUdWR40ud7wy+cFCKChbnaVTTWe
	z7MW6lpyDYO9CKnXZIu84EKiuJBQaQhrJEMq+wgVxj8qI0av88N04uEPa/8X62OhCYYUWP
	MemmXjpHbJMWduN8ubdjPZQpVMoJbMw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690632056;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=egMCYOG2uWRf43Q/bpZk0mUrDdU/hmHB0oSczsRgcao=;
	b=X11RbWgLVHaVFMDD4fs+yMbTOlkTBvvV3L7WBcl8wn9fAfvlWx62BvCqodWUbixJ6Ye9SG
	8+NF8hp2N8kibeDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6F00013596;
	Sat, 29 Jul 2023 12:00:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id +cUlGnj/xGT+ewAAMHmgww
	(envelope-from <tiwai@suse.de>); Sat, 29 Jul 2023 12:00:56 +0000
Date: Sat, 29 Jul 2023 14:00:55 +0200
Message-ID: <87leezc4g8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Justin Stitt <justinstitt@google.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: bcd2000: refactor deprecated strncpy
In-Reply-To: <20230727-sound-usb-bcd2000-v1-1-0dc73684b2f0@google.com>
References: <20230727-sound-usb-bcd2000-v1-1-0dc73684b2f0@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: LP32QXIN56RPBBZ7W35XFS4DM5ANM6DP
X-Message-ID-Hash: LP32QXIN56RPBBZ7W35XFS4DM5ANM6DP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LP32QXIN56RPBBZ7W35XFS4DM5ANM6DP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 28 Jul 2023 00:09:29 +0200,
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
> `card->driver` or `card->shortname` require this NUL-padding behavior
> then `strscpy_pad` should be used. My interpretation, though, is that
> the aforementioned fields are just fine as NUL-terminated strings.
> Please correct my assumptions if needed and I'll send in a v2.
> 
> [1]: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings
> [2]: manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html
> [3]: https://linux.die.net/man/3/strncpy
> 
> Link: https://github.com/KSPP/linux/issues/90
> Link: https://lore.kernel.org/r/20230727-sound-xen-v1-1-89dd161351f1@google.com (related ALSA patch)
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Applied now.  Thanks.


Takashi
