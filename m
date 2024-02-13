Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7F185300E
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 13:03:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0889786E;
	Tue, 13 Feb 2024 13:03:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0889786E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707825801;
	bh=lQvXOiYbN7ijUs4uZHWglAHFBJJLScF1aZlTN9THRds=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e48ytnXEKOUZExFHdI9fGJwh1pJTCXdVGJyrzUwv44CSNCLvgE4NYSxbMvxM90cbR
	 IrXEnigzBUHL6E3GPdKObIlDUG2AbJ9WQkRLRkZIgBMkD1Ii2A9EG3RoU+sqC882rQ
	 T0vXE1wjnXtTtVBxMGgte0r5ERYyhFDH1avppNqw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 877D6F8058C; Tue, 13 Feb 2024 13:02:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD610F8059F;
	Tue, 13 Feb 2024 13:02:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFB19F80238; Tue, 13 Feb 2024 13:02:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A239BF8015B
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 13:02:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A239BF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=mbtQOJWI;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=X1ohQcox;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=mbtQOJWI;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=X1ohQcox
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 797A41FCA1;
	Tue, 13 Feb 2024 12:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707825745;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7s8TY48d2sWEZq6v8pf1kB4rU8R+US3lEisv7Ug8+dY=;
	b=mbtQOJWIJembR1g+vuy2zaWCUnlj6gOADYsB2X8aUTvylDqsEvx8SpS2bZ2sn66544EIkS
	X20WDvpQpMmxCde3LMjl0upjn9BnB/UnF5lIHzLbETkcx3hwJceFKhtEJPk7OpucT8ejDp
	pjf4IqiRo8L797PeGrzKPvEBYYyLgvY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707825745;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7s8TY48d2sWEZq6v8pf1kB4rU8R+US3lEisv7Ug8+dY=;
	b=X1ohQcoxefjTyo8aWK5/HtO4NfgnLXl4qhf3ZOjmj6UMkOQ4bm6JJEHpwHzMVFWhxMIpDO
	vz7iqEvLUN65Q5Cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707825745;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7s8TY48d2sWEZq6v8pf1kB4rU8R+US3lEisv7Ug8+dY=;
	b=mbtQOJWIJembR1g+vuy2zaWCUnlj6gOADYsB2X8aUTvylDqsEvx8SpS2bZ2sn66544EIkS
	X20WDvpQpMmxCde3LMjl0upjn9BnB/UnF5lIHzLbETkcx3hwJceFKhtEJPk7OpucT8ejDp
	pjf4IqiRo8L797PeGrzKPvEBYYyLgvY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707825745;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7s8TY48d2sWEZq6v8pf1kB4rU8R+US3lEisv7Ug8+dY=;
	b=X1ohQcoxefjTyo8aWK5/HtO4NfgnLXl4qhf3ZOjmj6UMkOQ4bm6JJEHpwHzMVFWhxMIpDO
	vz7iqEvLUN65Q5Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5BDE11370C;
	Tue, 13 Feb 2024 12:02:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tH3lFVFay2WKAgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 13 Feb 2024 12:02:25 +0000
Date: Tue, 13 Feb 2024 13:02:25 +0100
Message-ID: <87sf1wy3la.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexander Tsoy <alexander@tsoy.me>,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Nikolay Yakimov <root@livid.pp.ru>,
	Saranya Gopal <saranya.gopal@intel.com>
Subject: Re: [PATCH] USB: Always select config with the highest supported UAC
 version
In-Reply-To: <2024021353-reversing-waltz-7402@gregkh>
References: <20240212152848.44782-1-alexander@tsoy.me>
	<2024021353-reversing-waltz-7402@gregkh>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [0.85 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.05)[60.23%]
Message-ID-Hash: CZM6SIMW7OTMITIYIUYLQHB64DL6SAO7
X-Message-ID-Hash: CZM6SIMW7OTMITIYIUYLQHB64DL6SAO7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CZM6SIMW7OTMITIYIUYLQHB64DL6SAO7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 13 Feb 2024 12:05:47 +0100,
Greg Kroah-Hartman wrote:
> On Mon, Feb 12, 2024 at 06:28:48PM +0300, Alexander Tsoy wrote:
> >  
> > -			/* If there is no UAC3 config, prefer the first config */
> > -			else if (i == 0)
> > +			if (i == 0)
> >  				best = c;
> >  
> > +			/* Assume that bInterfaceProtocol value is always
> > +			 * growing when UAC versions are incremented, so that
> > +			 * the direct comparison is possible. */
> 
> How do we know this assumption is always true?  What happens when it is not?

I believe this assumption is acceptable.  It's all about the protocol
number from 1 to 3, so far.  If UAC4 is ever supported in future,
it'll be highly probably the number 4.  (If not and keeping the same
protocol number 3, we'll need a different check in anyway.)
And the other numbers are excluded already in is_supported_uac()
check.

> > +			else if (is_supported_uac(desc) && best_desc &&
> > +				 (!is_supported_uac(best_desc) ||
> > +				  (desc->bInterfaceProtocol >
> > +				   best_desc->bInterfaceProtocol)))
> > +					best = c;
> 
> I really can't understand this if logic, sorry, can you describe it
> better so that we can maintain it over time?

The condition looks cryptic, though, yes.

Maybe the check should be factored out, e.g.

/* return true if the new config has a higher priority then the old config */
static bool check_uac_desc_priority(struct usb_host_config *old,
				struct usb_host_config *new)
{
	if (!is_supported_uac(new))
		return false;

	if (!is_supported_uac(old))
		return true;

	/*
	 * Assume that bInterfaceProtocol value is always growing;
	 * so far, it's true from UAC1 to UAC3 (1..3)
	 */
	if (new->bInterfaceProtocol > old->bInterfaceProtocol)
		return true;

	return false;
}


thanks,

Takashi
