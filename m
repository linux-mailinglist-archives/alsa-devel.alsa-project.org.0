Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJELDYZVqWli5gAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Thu, 05 Mar 2026 11:05:58 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CD020F575
	for <lists+alsa-devel@lfdr.de>; Thu, 05 Mar 2026 11:05:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2170602BC;
	Thu,  5 Mar 2026 11:05:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2170602BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772705156;
	bh=PK+lmcJgCr33KPHfKMa4Fj90Y6ypafAkz8NSiwaWXJ4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KAzHpNlTONBfWNoWvpzvHJBootCJyX0BUG7g7nLyYbfLi3/RnsXhWebjaLp0exkJV
	 FjtwURA39s6dFX0Z+y12BiXj0hJ9CFhEVNO5Ae6/T6OMffdGQeFwmdB30flVcRaOis
	 fLOXNY0xUhUk78Mi1tv2TnQeSBdf0Q/yu3l1x9yg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8492CF805F3; Thu,  5 Mar 2026 11:05:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41580F805ED;
	Thu,  5 Mar 2026 11:05:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E825F8025A; Thu,  5 Mar 2026 11:05:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CCBDF80087
	for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2026 11:04:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CCBDF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=pYHGoofg;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=1SPRpQ/j;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=pYHGoofg;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=1SPRpQ/j
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2947E3F8CF;
	Thu,  5 Mar 2026 10:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1772705099;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OLLIuUupvLUHzcyOCwC+BYpKrNbpWCDU1+MQcaHm6wE=;
	b=pYHGoofgUf8kVSNyOQfC+9ZOBvUUzDU4LWLHTPex0+n70FIkFD2kcRKwZeE9Huo17tVn4z
	+Rzp3T5X06JkMsdOHviQiravM9OVyo3aPGl4qjca5qhkLbrbJGOZRjgqkwMq5Ri/G6sR9/
	gLMTIm8riEjM/wGgnjd3p2V4IWUjgr8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772705099;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OLLIuUupvLUHzcyOCwC+BYpKrNbpWCDU1+MQcaHm6wE=;
	b=1SPRpQ/jX2SqHr218sf3bYl4HKP3ouENo5AXeimOTQKsfbBSIUeEi/bqAlCMVHeT5KfRWS
	VpHltP5wgJPo9QCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=pYHGoofg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="1SPRpQ/j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1772705099;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OLLIuUupvLUHzcyOCwC+BYpKrNbpWCDU1+MQcaHm6wE=;
	b=pYHGoofgUf8kVSNyOQfC+9ZOBvUUzDU4LWLHTPex0+n70FIkFD2kcRKwZeE9Huo17tVn4z
	+Rzp3T5X06JkMsdOHviQiravM9OVyo3aPGl4qjca5qhkLbrbJGOZRjgqkwMq5Ri/G6sR9/
	gLMTIm8riEjM/wGgnjd3p2V4IWUjgr8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772705099;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OLLIuUupvLUHzcyOCwC+BYpKrNbpWCDU1+MQcaHm6wE=;
	b=1SPRpQ/jX2SqHr218sf3bYl4HKP3ouENo5AXeimOTQKsfbBSIUeEi/bqAlCMVHeT5KfRWS
	VpHltP5wgJPo9QCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EB3723EA68;
	Thu,  5 Mar 2026 10:04:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NqcBOEpVqWlIVQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 05 Mar 2026 10:04:58 +0000
Date: Thu, 05 Mar 2026 11:04:58 +0100
Message-ID: <87v7fay4l1.wl-tiwai@suse.de>
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
 <c4392a10442c436484d9758c54622888b07a3a74.camel@opensource.cirrus.com>
References: <20260303145815.9930-1-mstrozek@opensource.cirrus.com>
	<20260303145815.9930-2-mstrozek@opensource.cirrus.com>
	<87seagx6c4.wl-tiwai@suse.de>
	<c4392a10442c436484d9758c54622888b07a3a74.camel@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OKCFGN2BWEIYYIZ3MRJIVS25B7XBWGEA
X-Message-ID-Hash: OKCFGN2BWEIYYIZ3MRJIVS25B7XBWGEA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OKCFGN2BWEIYYIZ3MRJIVS25B7XBWGEA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: B7CD020F575
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,alsa0.perex.cz:rdns,alsa0.perex.cz:helo];
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

On Thu, 05 Mar 2026 10:54:35 +0100,
Maciej Strozek wrote:
> 
> W dniu wto, 03.03.2026 o godzinie 16∶47 +0100, użytkownik Takashi Iwai
> napisał:
> > > 
> > > + */
> > > +struct snd_ctl_card_components {
> > > + int card;
> > > + unsigned int length;
> > > + unsigned char *components;
> > > +};
> > 
> > And the ioctl can serve for two purposes:
> > 
> > - When length=0 is set, the kernel stores the current number of bytes
> >   and returns without copying.  User-space can use this mode for
> >   allocating the buffer.
> > 
> In alsa-lib all data must be allocated beforehand, so this length==0
> query is not very useful there, it will just go into a [512] array
> anyway. Are there any other users that may benefit from this?

My suggested API can work even with the fixed size 512, too, if 512 is
hight enough.  It's just more flexible.  And there is no restriction
about alsa-lib data allocation; the function can query the size then
allocate, too.


Takashi
