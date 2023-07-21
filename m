Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1898D75C9C1
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 16:23:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CDEE1F7;
	Fri, 21 Jul 2023 16:22:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CDEE1F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689949380;
	bh=GXoU49u331ZCgqrK7scBm8Umfv/IALDjPgcyLcgvb4k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ACvRNwNNUq7SU6rc0rxWYvcka5y8FMkVDJAdtPdqgMv0xp16c7IPY2qrJjamrgqd5
	 EzhyDuZMvHqsE0Rkcj+xV2776MtKdEDOGuoeajSvg6vE3whru37hC1HCw6wSBsQzX7
	 eQ7iJKY2X22JwAMLexAt3Non5iBQG4xnIqaM0jCc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41CD7F80535; Fri, 21 Jul 2023 16:22:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D4B1F8032D;
	Fri, 21 Jul 2023 16:22:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69E52F8047D; Fri, 21 Jul 2023 16:21:57 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id ABBACF8007E
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 16:21:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABBACF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=UUujr/pt;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=OFnCMSO9
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B66AD21846;
	Fri, 21 Jul 2023 14:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689949311;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ysAjf4LaAMYK81D2vTaHAE6f/DlMCudpo3ZriX8GUwA=;
	b=UUujr/pt9EUeSV0flxzGlho75ibuqAHQ5eyLqBuvPQu+buTyk9lVNB4Cmv6neDEZ+Q55po
	VPqib/jyIWoXbNwdi3Vo1hDmWF26yzcTg+sVjVMUOcZn2gkvQbVBLfgehymq3/aL3DMzqg
	DZTYmhgA0iZ38CRqI9DWd+Tqfe+oPRE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689949311;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ysAjf4LaAMYK81D2vTaHAE6f/DlMCudpo3ZriX8GUwA=;
	b=OFnCMSO95Dml0FqzVI/VLkaZkkbmwKijXB4em4Y2GimQYV3QHr3iQZwKzUytxHGozsJG/C
	59a/j1JTozvD8NBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 86D37134BA;
	Fri, 21 Jul 2023 14:21:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id EpQEIH+UumRWCgAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 21 Jul 2023 14:21:51 +0000
Date: Fri, 21 Jul 2023 16:21:51 +0200
Message-ID: <875y6dfips.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v1 1/1] ALSA: korg1212: Re-use sockptr_t and respective
 APIs
In-Reply-To: <ZLqA3f8tdqxzZn/k@smile.fi.intel.com>
References: <20230721100146.67293-1-andriy.shevchenko@linux.intel.com>
	<878rb9h901.wl-tiwai@suse.de>
	<ZLphAJG4Tz8zLUSN@smile.fi.intel.com>
	<87y1j9fs55.wl-tiwai@suse.de>
	<ZLqA3f8tdqxzZn/k@smile.fi.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: MFULSWVBPBJZRFAPNJBXTMDBHJL3QKDV
X-Message-ID-Hash: MFULSWVBPBJZRFAPNJBXTMDBHJL3QKDV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MFULSWVBPBJZRFAPNJBXTMDBHJL3QKDV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 21 Jul 2023 14:58:05 +0200,
Andy Shevchenko wrote:
> 
> On Fri, Jul 21, 2023 at 12:58:14PM +0200, Takashi Iwai wrote:
> > On Fri, 21 Jul 2023 12:42:08 +0200,
> > Andy Shevchenko wrote:
> > > On Fri, Jul 21, 2023 at 12:08:46PM +0200, Takashi Iwai wrote:
> > > > On Fri, 21 Jul 2023 12:01:46 +0200,
> > > > Andy Shevchenko wrote:
> 
> ...
> 
> > > > While I see the benefit, I feel this is very confusing.  If we use the
> > > > API for a generic use, it should be renamed at first.
> 
> > > Any suggestion for the name?
> > 
> > It's a universal pointer...  uniptr_t?
> > Or a generic pointer, genptr_t?
> > 
> > I'm not good at naming, and I'm open for it.
> 
> It seems it's already spread enough with this name, I would rather stick with
> it for now (besides net it's used in crypto, nvme, and security).
> 
> The (new) callback though makes a lot of sense on its own.

OK, fair enough.

> What do you think?

Yes, we can go with it.

Basically we need to add a new "copy" callback to take sockptr_t and
use it instead of the old "copy_kernel" and "copy_user" callbacks.
It's used only in sound/core/pcm_lib.c, so it shouldn't be too
difficult, I suppose.
Then replace the defined callbacks in each driver, and finally
deprecate old callbacks.


thanks,

Takashi
