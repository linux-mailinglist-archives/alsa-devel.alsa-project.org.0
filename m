Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83233C7F667
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Nov 2025 09:36:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E328A601AB;
	Mon, 24 Nov 2025 09:35:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E328A601AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763973367;
	bh=8m+qH85NlnJoO5ZaeXli3cgD2vt3CwxZ3lvvE6b0txw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FvpZKjo4XThlu1+wappssCYsipM0391Qdhf/O6Ad2Sp2NekyDBaQfzu4RWXTOCdx/
	 CT595b/7ASIJhjtVIsgkRtSTcUnCBeIkNXbMgxRR3rxfB7nJf98m8mPdhBWQZKO3sF
	 IAxbxCbnAMKDU1pIBRTo3DIcKafDaTjsOHRyhNbI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A89BF805D9; Mon, 24 Nov 2025 09:35:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38691F805CA;
	Mon, 24 Nov 2025 09:35:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A95FF8026A; Mon, 24 Nov 2025 09:33:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 55BECF8016E
	for <alsa-devel@alsa-project.org>; Mon, 24 Nov 2025 09:33:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55BECF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=05qjr+1z;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=YprF1vdS;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=05qjr+1z;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=YprF1vdS
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 75A1222063;
	Mon, 24 Nov 2025 08:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1763973227;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t3rcgU0O+ObiykvK2lZUdfsd51GnaBfMqFNpu3h0L7M=;
	b=05qjr+1zwvW8Go6gj/ZpKhrhH380NjjxUGu63tMw9TNZA7mvsu15hXZPOfD0FA7LhZpJd9
	CIm73HWmvMk5DrqzOicuPFBWRsv9MYK2TuzNqJQEA0N41i1f1GVykFjXP6TJ0R+vzAnzMI
	jgDnPMeJHJJeM72rhkclrMIPuYx+V6Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763973227;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t3rcgU0O+ObiykvK2lZUdfsd51GnaBfMqFNpu3h0L7M=;
	b=YprF1vdSnshYwNw2tgMT8BHssrE/sW072Iv8lGUVGamEo6i03LPJvtQRjLFCVSvb+MYgVK
	IdHymqTXk1cSwkCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1763973227;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t3rcgU0O+ObiykvK2lZUdfsd51GnaBfMqFNpu3h0L7M=;
	b=05qjr+1zwvW8Go6gj/ZpKhrhH380NjjxUGu63tMw9TNZA7mvsu15hXZPOfD0FA7LhZpJd9
	CIm73HWmvMk5DrqzOicuPFBWRsv9MYK2TuzNqJQEA0N41i1f1GVykFjXP6TJ0R+vzAnzMI
	jgDnPMeJHJJeM72rhkclrMIPuYx+V6Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763973227;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t3rcgU0O+ObiykvK2lZUdfsd51GnaBfMqFNpu3h0L7M=;
	b=YprF1vdSnshYwNw2tgMT8BHssrE/sW072Iv8lGUVGamEo6i03LPJvtQRjLFCVSvb+MYgVK
	IdHymqTXk1cSwkCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3D8723EA61;
	Mon, 24 Nov 2025 08:33:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6TxgDWsYJGmwNQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 24 Nov 2025 08:33:47 +0000
Date: Mon, 24 Nov 2025 09:33:46 +0100
Message-ID: <87fra3hlsl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Baojun Xu <baojun.xu@ti.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	broonie@kernel.org,
	alsa-devel@alsa-project.org,
	shenghao-ding@ti.com,
	13916275206@139.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Ignore irq for I2C device
In-Reply-To: <aSQLEZCLM0t3BbHl@smile.fi.intel.com>
References: <20251122095903.2239-1-baojun.xu@ti.com>
	<aSQLEZCLM0t3BbHl@smile.fi.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,alsa-project.org,ti.com,139.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
Message-ID-Hash: KABXUSQSWWMUCN7I7BWKT3SONAMXMUTM
X-Message-ID-Hash: KABXUSQSWWMUCN7I7BWKT3SONAMXMUTM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KABXUSQSWWMUCN7I7BWKT3SONAMXMUTM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 24 Nov 2025 08:36:49 +0100,
Andy Shevchenko wrote:
> 
> On Sat, Nov 22, 2025 at 05:59:03PM +0800, Baojun Xu wrote:
> > In some projects (HP Lampass), no GPIO was assigned for irq,
> > it would be better to ignore it.
> 
> I don't think this is correct approach, but Hans probably knows better
> the code.
> 
> Also when touching this kind of drivers, please provide ACPI DSDT excerpt
> to show the Device object description in question.

Yes, and the patch was submitted rather to the wrong target.
It's no sound driver but x86 platform driver.
Please resubmit to the right target.


thanks,

Takashi
