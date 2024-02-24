Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8515B862372
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Feb 2024 09:37:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D52786F;
	Sat, 24 Feb 2024 09:37:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D52786F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708763860;
	bh=7JGNRZkYoPDJjnAr+mqF6UujxaH9Ir22F0z1PmTxqMc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hmMYq3mUG6jJzwcpsByvKk9jkV0ze1eqXeqd8YZkFXfSjQ+9ExGCMCx8SHp3BBAyz
	 amjqQ/d0fod15FlTdTMrb3UCrWZ3aWyAQFPrdyJsFwt9A83QmiopR8oKcYbRZhl6m5
	 y6rBxDS7p50QbbeEgGm122jPNgW47TlrXsPle20E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC43FF8057A; Sat, 24 Feb 2024 09:37:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DDC99F805A0;
	Sat, 24 Feb 2024 09:37:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71500F80496; Sat, 24 Feb 2024 09:35:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6DC9F800ED
	for <alsa-devel@alsa-project.org>; Sat, 24 Feb 2024 09:35:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6DC9F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Hq8hPwm/;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=RMKzyCw2;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Hq8hPwm/;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=RMKzyCw2
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2035D1F7DA;
	Sat, 24 Feb 2024 08:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1708763703;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gtu2NMMgC2ZT38NG2DsPyX7+sb/yi/V2b/lqRoT4OEQ=;
	b=Hq8hPwm/LpUcr9+FbGuu8fHD002yMlSue0pMx7tcEaUbehZv9r780aFN64eiPZx7Y5ZDU5
	zMWiSgwVQgnMwZnMxsQy8jPTHZybL5Ml+uvedBhSbuK60Pmao5oQwvyRrnbYbInmbpVA2M
	93PwRAuusli5t6dGb1WyiDzjry2NCpQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708763703;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gtu2NMMgC2ZT38NG2DsPyX7+sb/yi/V2b/lqRoT4OEQ=;
	b=RMKzyCw2ls9n95FHHac2TfFEOrb46pQCRc24vaAsH/A3EPy9F3diw7qF4NQ+dYv6wmlA0g
	FQrmwBNnZ8qyGiDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1708763703;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gtu2NMMgC2ZT38NG2DsPyX7+sb/yi/V2b/lqRoT4OEQ=;
	b=Hq8hPwm/LpUcr9+FbGuu8fHD002yMlSue0pMx7tcEaUbehZv9r780aFN64eiPZx7Y5ZDU5
	zMWiSgwVQgnMwZnMxsQy8jPTHZybL5Ml+uvedBhSbuK60Pmao5oQwvyRrnbYbInmbpVA2M
	93PwRAuusli5t6dGb1WyiDzjry2NCpQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708763703;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gtu2NMMgC2ZT38NG2DsPyX7+sb/yi/V2b/lqRoT4OEQ=;
	b=RMKzyCw2ls9n95FHHac2TfFEOrb46pQCRc24vaAsH/A3EPy9F3diw7qF4NQ+dYv6wmlA0g
	FQrmwBNnZ8qyGiDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E8BAA133DC;
	Sat, 24 Feb 2024 08:35:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yG4hNzaq2WV4cwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 24 Feb 2024 08:35:02 +0000
Date: Sat, 24 Feb 2024 09:35:02 +0100
Message-ID: <87r0h21cqx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Willian Wang <kernel@willian.wang>
Cc: Gergo Koteles <soyer@irl.hu>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: Re: PCI SSID and Codec SSID collision?
In-Reply-To: <170872537997.7.10064075757981956606.273437309@willian.wang>
References: <170869932581.7.612391552809015627.273152461@willian.wang>
	<4786204abbd7acadd27a8cf487be91e524eaa444.camel@irl.hu>
	<170872537997.7.10064075757981956606.273437309@willian.wang>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [1.78 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 SUBJECT_ENDS_QUESTION(1.00)[];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.12)[66.73%]
Message-ID-Hash: EFSNOMAQSRQMLSDXTN5BYBTGUKNNCNJ4
X-Message-ID-Hash: EFSNOMAQSRQMLSDXTN5BYBTGUKNNCNJ4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EFSNOMAQSRQMLSDXTN5BYBTGUKNNCNJ4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 23 Feb 2024 22:55:40 +0100,
Willian Wang wrote:
> 
> Here is my attempt. I hope it doesn't break with the DuetITL mode, I
> chose to create a special case for it instead of otherwise because
> there is an european version of the 14IRP8 with different codec SSID
> (https://bugzilla.kernel.org/show_bug.cgi?id=208555#c778, 0x17aa38bf
> vs 0x17aa38be).
> 
> This is my first time contributing with a commit and I'm not sure if I
> did everything correctly so please let me know. I also don't know if I
> should send it to a specific email with you as CC or something like
> that.

Looks good.  And yes, could you resubmit only the patch without
hanging on the thread?


thanks,

Takashi
