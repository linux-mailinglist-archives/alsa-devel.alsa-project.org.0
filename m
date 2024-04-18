Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B238A9E94
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 17:37:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D0EDB76;
	Thu, 18 Apr 2024 17:37:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D0EDB76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713454667;
	bh=2I36Eko68aUI5g/DQONb2pTb1RZqa+2vnBOO8kZT6us=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iWcJYvuxeQ0Cjp0HUMSFE9zEufr8EDgPU3vAZ7dOKjgxVcmbVM5wKmJV4zwblUi8u
	 JP3MFpWeMJGDYQlWtZ7PeudRrcjiR2Fh7u6CmQ4HWiY8vSn92nB0YLAhwlZDLyigt8
	 e4GWhofz1/0p/2SdoBTifr+l9I1+belNC2kBmGGI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 750A9F80571; Thu, 18 Apr 2024 17:37:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4190F80423;
	Thu, 18 Apr 2024 17:37:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EF7DF8025A; Thu, 18 Apr 2024 17:37:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34D09F8013D
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 17:36:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34D09F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=116hrGFb;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=RS/StU3F;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=y2q5e1+9;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=0XpPso11
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D5467350E3;
	Thu, 18 Apr 2024 15:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1713454618;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FenP6M5Gv7bHL0FXpLwiYWJ4mVpgIU9DyVa7jR8WpPI=;
	b=116hrGFbo+sg8+02Vdxo+GJXn0RqRYTv9Vb6/Fofd0mh/5l3QZH33Av53kQ59KGA7Srzkx
	12xKNE29xsaqsbnt+O/qXI/yd/HKUe24Pefsfi1gf0xX5JGH+1fPt0KH519yFNoNyFzTNp
	8iFckHof9xDaORWcx0IPT4+ZTp5eOsU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713454618;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FenP6M5Gv7bHL0FXpLwiYWJ4mVpgIU9DyVa7jR8WpPI=;
	b=RS/StU3FjzjTiYYNjGEuLxB3XJVGARjdWMz22LfJIt5CluuHmENmwRjCP2rnmvS/zL6LFY
	7GXhsEJz1hZ0aRDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1713454617;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FenP6M5Gv7bHL0FXpLwiYWJ4mVpgIU9DyVa7jR8WpPI=;
	b=y2q5e1+9+s38McIubN8gTubZ2p2TTfxUncZVOv0aSFxrBONldB7IJhWLVrtk07hx2qhDQr
	OtrpBJ8pa62Y5rF9L6piehIOCSzndmjlbEqVkMxSKPDeHysz+XioY695L8RkIIHY8Tciy4
	//JN0t5oWnWVU6NDc/k/kRVZ7XYXz3Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713454617;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FenP6M5Gv7bHL0FXpLwiYWJ4mVpgIU9DyVa7jR8WpPI=;
	b=0XpPso11j8JtXDvkZ3wkGWZb1pxNOZ9vsyM5pJqf+V2USqd+7QsYZ9btqSw8hyWQIGOj6+
	MhzPeyJxEVwV8cDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AA02F1384C;
	Thu, 18 Apr 2024 15:36:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id egk2KBk+IWZqPQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 18 Apr 2024 15:36:57 +0000
Date: Thu, 18 Apr 2024 17:37:06 +0200
Message-ID: <87le5awul9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: Re: Thinkpad with ALC1318 has a chance of damaging the IC
In-Reply-To: <acb0953b16d14047ae581772268c1e7c@realtek.com>
References: <c646c8ef954d41e6b8fa78b202fd306d@realtek.com>
	<87o7a7xkas.wl-tiwai@suse.de>
	<acb0953b16d14047ae581772268c1e7c@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]
Message-ID-Hash: QW7CPU5OQTRY4VAV5UV55T2KR6FG23J7
X-Message-ID-Hash: QW7CPU5OQTRY4VAV5UV55T2KR6FG23J7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QW7CPU5OQTRY4VAV5UV55T2KR6FG23J7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 18 Apr 2024 08:33:42 +0200,
Kailang wrote:
> 
> Hi Takashi,
> 
> New patch was attached.
> new additional function was request from Lenovo.

I got a compile error.  The check should be rather

	if (codec->core.dev.power.power_state.event == PM_EVENT_FREEZE)

Maybe better to define is_s4_suspend() just like is_s4_resume().

And, please rebase the patch to the latest for-linus branch of
sound.git tree.


thanks,

Takashi

> 
> BR,
> Kailang
> 
> > -----Original Message-----
> > From: Takashi Iwai <tiwai@suse.de>
> > Sent: Thursday, April 18, 2024 2:22 PM
> > To: Kailang <kailang@realtek.com>
> > Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> > Subject: Re: Thinkpad with ALC1318 has a chance of damaging the IC
> > 
> > 
> > External mail.
> > 
> > 
> > 
> > On Mon, 15 Apr 2024 11:27:50 +0200,
> > Kailang wrote:
> > >
> > > Hi Takashi,
> > >
> > > Please don't apply this patch.
> > > They want to add stream open to enable GPIO3 functions.
> > 
> > OK, let me know if the new patch is ready.
> > 
> > 
> > thanks,
> > 
> > Takashi
> > 
> > >
> > > BR,
> > > Kailang
> > >
> > > > -----Original Message-----
> > > > From: Kailang
> > > > Sent: Wednesday, April 10, 2024 5:23 PM
> > > > To: Takashi Iwai (tiwai@suse.de) <tiwai@suse.de>
> > > > Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> > > > Subject: Thinkpad with ALC1318 has a chance of damaging the IC
> > > >
> > > > Hi Takashi,
> > > >
> > > > Thinkpad with ALC1318 has a chance of damaging the IC at S4 resume.
> > > >
> > > > BR,
> > > > Kailang
> 
