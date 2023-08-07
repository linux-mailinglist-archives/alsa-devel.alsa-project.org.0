Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB13277290C
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 17:23:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 813EE825;
	Mon,  7 Aug 2023 17:22:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 813EE825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691421800;
	bh=4KzcKIJrFTKt6BYYCTH/0bkFuDF8emktLfBEAUaCVuM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fl9Yqj0XnteR5okFMeyQDalpZPziFrm406WVvgXBbkpapxn3T9icfu0og89ofsjEo
	 G4opM48M2FHTnZ6EvxxDLJtKi0D2Y9mSr8OyhzNhYsB+6JGHlyyn4luourmO7oV2JN
	 KMQjlYUzEVPGEuf1NiD3WVSEHk9C/nwClAYwqJlc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A86C1F80544; Mon,  7 Aug 2023 17:22:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E98BF8016B;
	Mon,  7 Aug 2023 17:22:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48129F8016D; Mon,  7 Aug 2023 17:22:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AA693F80087
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 17:22:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA693F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Wf8vbcxp;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=wsLdYZZz
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E97531FE64;
	Mon,  7 Aug 2023 15:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1691421738;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GoN726XQvVM3O4Jmru+mvY7j3YKAGZ0sihu6ZlArcy0=;
	b=Wf8vbcxp47efBkbpPARn1+tyjp1K9lorjSr6zw+RUXpkkx+j0xlBWJ9rkdEOqOtRtGzpmj
	uD8r9u5a9VUJhpu4h+I1ovMLnfeBugWTqwj6SC9dbpUGexeKDmpZiY5rwZ8k4P7esevqv1
	9h78CD6apzj7JVb1++2c0R0Z6vsTkSU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1691421738;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GoN726XQvVM3O4Jmru+mvY7j3YKAGZ0sihu6ZlArcy0=;
	b=wsLdYZZzxzxpdYpNL5x4TK1cl7YIjiVlFWpaWYUIk0YcmOWEPxN3CihrdAW8Pcs2lZf0+0
	FtN529EXC9vkz6Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9031713487;
	Mon,  7 Aug 2023 15:22:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id /zcDIioM0WQqUwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 07 Aug 2023 15:22:18 +0000
Date: Mon, 07 Aug 2023 17:22:18 +0200
Message-ID: <87pm3yj2s5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	Andrey Utkin <andrey_utkin@fastmail.com>,
	Anton Sviridenko <anton@corp.bluecherry.net>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Ismael Luceno <ismael@iodev.co.uk>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-media@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 00/24] ALSA: Generic PCM copy ops using sockptr_t
In-Reply-To: <ZMlGKy7ibjkQ6ii7@smile.fi.intel.com>
References: <20230731154718.31048-1-tiwai@suse.de>
	<b906d60b-ece4-45b5-8167-2046c8dc00f4@sirena.org.uk>
	<87h6pjj2ui.wl-tiwai@suse.de>
	<a02cf5c3-1fac-4ec6-9d9c-f8e8d0c067e0@sirena.org.uk>
	<87leeugbxm.wl-tiwai@suse.de>
	<ZMlGKy7ibjkQ6ii7@smile.fi.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 562EQQK4OIFEFACYBYTKD7US4ESQQKUA
X-Message-ID-Hash: 562EQQK4OIFEFACYBYTKD7US4ESQQKUA
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 01 Aug 2023 19:51:39 +0200,
Andy Shevchenko wrote:
> 
> On Tue, Aug 01, 2023 at 02:54:45PM +0200, Takashi Iwai wrote:
> > On Mon, 31 Jul 2023 21:40:20 +0200,
> > Mark Brown wrote:
> > > On Mon, Jul 31, 2023 at 09:30:29PM +0200, Takashi Iwai wrote:
> > > > Mark Brown wrote:
> > > 
> > > > > It really feels like we ought to rename, or add an alias for, the type
> > > > > if we're going to start using it more widely - it's not helping to make
> > > > > the code clearer.
> > > 
> > > > That was my very first impression, too, but I changed my mind after
> > > > seeing the already used code.  An alias might work, either typedef or
> > > > define genptr_t or such as sockptr_t.  But we'll need to copy the
> > > > bunch of helper functions, too...
> > > 
> > > I would predict that if the type becomes more widely used that'll happen
> > > eventually and the longer it's left the more work it'll be.
> > 
> > That's true.  The question is how more widely it'll be used, then.
> > 
> > Is something like below what you had in mind, too?
> 
> I agree with your proposal (uniptr_t also works for me), but see below.
> 
> ...
> 
> > +#include <linux/slab.h>
> > +#include <linux/uaccess.h>
> 
> But let make the list of the headers right this time.
> 
> It seems to me that
> 
> err.h
> minmax.h // maybe not, see a remark at the bottom
> string.h
> types.h
> 
> are missing.

OK, makes sense to add them.

> 
> More below.
> 
> ...
> 
> > +	void *p = kmalloc_track_caller(len, GFP_USER | __GFP_NOWARN);
> > +
> > +	if (!p)
> > +		return ERR_PTR(-ENOMEM);
> 
> This can use cleanup.h.

Hm, I don't think it can be replaced with that.
There may be more use of cleanup.h, but it's no direct alternative for
kmalloc_track_caller()...

> > +	if (copy_from_uniptr(p, src, len)) {
> > +		kfree(p);
> > +		return ERR_PTR(-EFAULT);
> > +	}
> > +	return p;
> > +}
> > +
> > +static inline void *memdup_uniptr_nul(uniptr_t src, size_t len)
> > +{
> > +	char *p = kmalloc_track_caller(len + 1, GFP_KERNEL);
> 
> Ditto.
> 
> > +	if (!p)
> > +		return ERR_PTR(-ENOMEM);
> > +	if (copy_from_uniptr(p, src, len)) {
> > +		kfree(p);
> > +		return ERR_PTR(-EFAULT);
> > +	}
> > +	p[len] = '\0';
> > +	return p;
> > +}
> 
> ...
> 
> > +static inline long strncpy_from_uniptr(char *dst, uniptr_t src, size_t count)
> > +{
> > +	if (uniptr_is_kernel(src)) {
> > +		size_t len = min(strnlen(src.kernel, count - 1) + 1, count);
> 
> I didn't get why do we need min()? To check the count == 0 case?
> 
> Wouldn't
> 
> 		size_t len;
> 
> 		len = strnlen(src.kernel, count);
> 		if (len == 0)
> 			return 0;
> 
> 		/* Copy a trailing NUL if found */
> 		if (len < count)
> 			len++;
> 
> be a good equivalent?

A good question.  I rather wonder why it can't be simple strncpy().

> > +		memcpy(dst, src.kernel, len);
> > +		return len;
> > +	}
> > +	return strncpy_from_user(dst, src.user, count);
> > +}
> 
> ...
> 
> > +static inline int check_zeroed_uniptr(uniptr_t src, size_t offset, size_t size)
> > +{
> > +	if (!uniptr_is_kernel(src))
> 
> Why not to align all the functions to use same conditional (either always
> positive or negative)?

A different person, a different taste :)  But it's trivial to fix.

> > +		return check_zeroed_user(src.user + offset, size);
> > +	return memchr_inv(src.kernel + offset, 0, size) == NULL;
> > +}
> 
> ...
> 
> Taking all remarks into account I would rather go with sockptr.h being
> untouched for now, just a big
> 
> /* DO NOT USE, it's obsolete, use uniptr.h instead! */
> 
> to be added.

Possibly that's a safer choice.  But the biggest question is whether
we want a generic type or not.  Let's try to ask it first.

Interestingly, this file doesn't belong to any subsystem in
MAINTAINERS, so I'm not sure who to be Cc'ed.  Chirstoph as the
original author and net dev, maybe.


thanks,

Takashi
