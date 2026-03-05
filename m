Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOvNG45YqWkh5wAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Thu, 05 Mar 2026 11:18:54 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2122020F950
	for <lists+alsa-devel@lfdr.de>; Thu, 05 Mar 2026 11:18:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78ABD602BB;
	Thu,  5 Mar 2026 11:18:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78ABD602BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772705933;
	bh=BnRy5OAYrtn4zXSIqDR+8Xc8KDN+p5CXNhVfoELcvuU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Tl2SWNOAdQHawCMG9Sn9h7ecPIQcnIEfsZWKnFCie0GH51avdiBI26KWOojzBVDHd
	 BYW0j++sXrR17V4Z81F8QmW74i/Rb1Sk18DBvVUx6AtEsqkjx5LnaIUriA6k+x8Qx3
	 Lreh7ZQd5bRig2V+PcTToovY4A58EBkIY+B+pZdw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBBC9F805EC; Thu,  5 Mar 2026 11:18:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A228F805EC;
	Thu,  5 Mar 2026 11:18:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2962CF8025A; Thu,  5 Mar 2026 11:18:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 52E12F80087
	for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2026 11:18:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52E12F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=HOjiXlrg;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=4a0UHMq7;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=HOjiXlrg;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=4a0UHMq7
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 799B85BCF6;
	Thu,  5 Mar 2026 10:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1772705886;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0B6E7IV+RocukvDYzrznAWf1CA3qHkgH4euHnWwhlxQ=;
	b=HOjiXlrgpocBy0exQ5pcz5GshgfbWJCZqQRttrCkWHnKl5uTovcT0YWQ0Y1lG90KxRRA4v
	Qdf6uydzbvtHk6PDGBFcrpA/u2+pSS+i8svXe+Dt7RP3EJDwKULpUltH8aOBznooHAzIC7
	4EN3KA8B56yXxmXkH9eGBzVXhZyamGU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772705886;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0B6E7IV+RocukvDYzrznAWf1CA3qHkgH4euHnWwhlxQ=;
	b=4a0UHMq7ABPKOOiDlN7qatKNtFD9Lo/2hjf77Lo1ES258szVqWaTkvIfR4aXOWy58kz9gM
	wE8D+baGldVevnDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1772705886;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0B6E7IV+RocukvDYzrznAWf1CA3qHkgH4euHnWwhlxQ=;
	b=HOjiXlrgpocBy0exQ5pcz5GshgfbWJCZqQRttrCkWHnKl5uTovcT0YWQ0Y1lG90KxRRA4v
	Qdf6uydzbvtHk6PDGBFcrpA/u2+pSS+i8svXe+Dt7RP3EJDwKULpUltH8aOBznooHAzIC7
	4EN3KA8B56yXxmXkH9eGBzVXhZyamGU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772705886;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0B6E7IV+RocukvDYzrznAWf1CA3qHkgH4euHnWwhlxQ=;
	b=4a0UHMq7ABPKOOiDlN7qatKNtFD9Lo/2hjf77Lo1ES258szVqWaTkvIfR4aXOWy58kz9gM
	wE8D+baGldVevnDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3EF033EA68;
	Thu,  5 Mar 2026 10:18:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id O0fxDV5YqWk+YwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 05 Mar 2026 10:18:06 +0000
Date: Thu, 05 Mar 2026 11:18:05 +0100
Message-ID: <87pl5iy3z6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 2/2] ALSA: control: add ioctl to retrieve full card
 components
In-Reply-To: 
 <cf59b85f5bfa3607b7ef799714df56bf42daa67a.camel@opensource.cirrus.com>
References: <20260303145815.9930-1-mstrozek@opensource.cirrus.com>
	<20260303145815.9930-2-mstrozek@opensource.cirrus.com>
	<87seagx6c4.wl-tiwai@suse.de>
	<c4392a10442c436484d9758c54622888b07a3a74.camel@opensource.cirrus.com>
	<87v7fay4l1.wl-tiwai@suse.de>
	<cf59b85f5bfa3607b7ef799714df56bf42daa67a.camel@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: T5443HUXAW77ESAF2YQ5CRQ4SBQYCFUT
X-Message-ID-Hash: T5443HUXAW77ESAF2YQ5CRQ4SBQYCFUT
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; emergency; member-moderation;
 nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size;
 news-moderation; no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T5443HUXAW77ESAF2YQ5CRQ4SBQYCFUT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: 2122020F950
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default,suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mstrozek@opensource.cirrus.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:patches@opensource.cirrus.com,m:alsa-devel@alsa-project.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa0.perex.cz:rdns,alsa0.perex.cz:helo,suse.de:dkim,suse.de:mid,alsa-project.org:dkim];
	FORGED_SENDER(0.00)[tiwai@suse.de,alsa-devel-bounces@alsa-project.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[alsa-devel@alsa-project.org];
	DKIM_TRACE(0.00)[alsa-project.org:+,suse.de:+];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	FROM_NEQ_ENVFROM(0.00)[tiwai@suse.de,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[alsa-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Thu, 05 Mar 2026 11:11:40 +0100,
Maciej Strozek wrote:
> 
> W dniu czw, 05.03.2026 o godzinie 11∶04 +0100, użytkownik Takashi Iwai
> napisał:
> > On Thu, 05 Mar 2026 10:54:35 +0100,
> > Maciej Strozek wrote:
> > > 
> > > W dniu wto, 03.03.2026 o godzinie 16∶47 +0100, użytkownik Takashi
> > > Iwai
> > > napisał:
> > > > > 
> > > > > + */
> > > > > +struct snd_ctl_card_components {
> > > > > + int card;
> > > > > + unsigned int length;
> > > > > + unsigned char *components;
> > > > > +};
> > > > 
> > > > And the ioctl can serve for two purposes:
> > > > 
> > > > - When length=0 is set, the kernel stores the current number of
> > > > bytes
> > > >   and returns without copying.  User-space can use this mode for
> > > >   allocating the buffer.
> > > > 
> > > In alsa-lib all data must be allocated beforehand, so this
> > > length==0
> > > query is not very useful there, it will just go into a [512] array
> > > anyway. Are there any other users that may benefit from this?
> > 
> > My suggested API can work even with the fixed size 512, too, if 512
> > is
> > hight enough.  It's just more flexible.  And there is no restriction
> > about alsa-lib data allocation; the function can query the size then
> > allocate, too.
> > 
> > 
> > Takashi
> 
> OK, will prepare v4 with this, thanks

Well, let's see how others think, too.  The API design needs more
considerations because we can't change it any longer once after
defined.


thanks,

Takashi
