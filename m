Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B5977CD97
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 15:55:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EB0E82A;
	Tue, 15 Aug 2023 15:54:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EB0E82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692107714;
	bh=gKkrmPTEpn+BPnntj8i23b1j8vNCDlCueJZPnwhDYjI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bls+DMzwBDaqNzJh9y7qySricF+xfGeXA+4tOXFGX+PV6Clc4fdUW3rDR+ILgxeIg
	 YqUopqScjazwsWQY4nEN0ISr8mjyfMwrlj0dknqLkzuvP/kgQIdXhzjNDWrogo4MGM
	 bYCv528gPGbZNXw7HCCx/ojcuKHzhtHmS7X9xxDY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CFF0F80254; Tue, 15 Aug 2023 15:54:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7313F8016A;
	Tue, 15 Aug 2023 15:54:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B603EF8016D; Tue, 15 Aug 2023 15:54:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9EBEAF80027
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 15:54:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EBEAF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=rfem9i8l;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=wMl8sKEa
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2A6742186F;
	Tue, 15 Aug 2023 13:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692107657;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qlu9hn+bvH89g0o8QY1YoKNm1RBkRpBhGERxF0lUqKo=;
	b=rfem9i8l+lr5wJV1iAYuOB62wQT6CkXsY9ONOFLDZUP8ATjxKAIwYqI/dYZQaaniJfWMXH
	iIDQ6ZTD7mJ8FPQA6Pa6ZOf1AC9CNr6BQP1h69PeJoAwBDCFHubNbvNdf3z24GsM6qabnX
	e+dDdU89dmVipUxhTrnJV/Lfk1vpWys=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692107657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qlu9hn+bvH89g0o8QY1YoKNm1RBkRpBhGERxF0lUqKo=;
	b=wMl8sKEaSb9QoQg/JXMSYcXuzvXKBia4hRUycSCw4YE/qlh7xTbkgdC9sQrJ+uknoA/gzi
	YCi3lXHe8SwG5MAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 090941353E;
	Tue, 15 Aug 2023 13:54:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id hxDZAImD22S9QwAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 15 Aug 2023 13:54:17 +0000
Date: Tue, 15 Aug 2023 15:54:16 +0200
Message-ID: <871qg4za0n.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/25] ALSA: core: Add memory copy helpers between
 iov_iter and iomem
In-Reply-To: <ZNuC4qKYOR4piQQU@smile.fi.intel.com>
References: <20230814115523.15279-1-tiwai@suse.de>
	<20230814115523.15279-4-tiwai@suse.de>
	<ZNuC4qKYOR4piQQU@smile.fi.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 5YM663Q62DWL4I4KGJNQ2A3GBDFXWNZH
X-Message-ID-Hash: 5YM663Q62DWL4I4KGJNQ2A3GBDFXWNZH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5YM663Q62DWL4I4KGJNQ2A3GBDFXWNZH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 15 Aug 2023 15:51:30 +0200,
Andy Shevchenko wrote:
> 
> On Mon, Aug 14, 2023 at 01:55:01PM +0200, Takashi Iwai wrote:
> > Add two more helpers for copying memory between iov_iter and iomem,
> > which will be used by the new PCM copy ops in a few drivers.
> > The existing helpers became wrappers of those now.
> > 
> > Note that copy_from/to_iter() returns the copied bytes, hence the
> > error condition is inverted from copy_from/to_user().
> 
> ...
> 
> > -	return copy_to_user(dst, (const void __force*)src, count) ? -EFAULT : 0;
> > +	return !copy_to_iter((const void __force *)src, count, dst) ? -EFAULT : 0;
> 
> Inverted means, I believe, this
> 
> 	return copy_to_iter((const void __force *)src, count, dst) == count ? 0 : -EFAULT;
> 
> as far as I understand the idea behind the copy_to_user() return value.
> 
> Ditto for other cases.

OK, this looks more correct.  I'll fix in v2.


thanks,

Takashi
