Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C2A86FB62
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Mar 2024 09:13:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EC9282B;
	Mon,  4 Mar 2024 09:13:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EC9282B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709539990;
	bh=I5Gp4atogEPxcGuz0XEud2ICQgL5hsry5Os9X0XOcHM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Bg74bxhqcF0owuGnSnTtfFwzjkKHUObM34Euwyg33l7kIRytIZe343UZXQ5cOlCwO
	 QzHMdF2XmV1y04vt4SRYitJCxAaxI4xX/mc39T9EspdfQ0LErfcDK7Vek9nE7T3CpW
	 elT36XFBI+cz17wKZffi+UmtsdkRP4Er+vQuBZHo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D6E2F80494; Mon,  4 Mar 2024 09:12:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83F1DF80563;
	Mon,  4 Mar 2024 09:12:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2FD6F8024E; Mon,  4 Mar 2024 09:11:42 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 71BB3F8014B
	for <alsa-devel@alsa-project.org>; Mon,  4 Mar 2024 09:11:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71BB3F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=0e8Y1+ME;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=IujqTbtA;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=0e8Y1+ME;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=IujqTbtA
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 490B26878C;
	Mon,  4 Mar 2024 08:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1709539889;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ll30tKGQWON0zxMBper/sQMPhTvb/K7qL/K/HIuDngk=;
	b=0e8Y1+MERwAUEOQ/L/Nsg57FlZjtnjXWfiBHnbbT+AddUaldAm0iXN1HVVzAao64M2PbZt
	r6t+zrXsoPIOpw0YKIX27s7AbN/wgrcWd4iRp86lwektLKVBw6VXQkpEHGshZzuk1RPWEV
	d4KXdQn+rK+pxTrU2mwgTwJbSVYo9x0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709539889;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ll30tKGQWON0zxMBper/sQMPhTvb/K7qL/K/HIuDngk=;
	b=IujqTbtAdyAGtIxkq0uzfpKrz1o0KzcPMKJILUsIcNxUh6KjM+ylTuCES0iRMDbagTjq+2
	DbaspJVcinduYKAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1709539889;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ll30tKGQWON0zxMBper/sQMPhTvb/K7qL/K/HIuDngk=;
	b=0e8Y1+MERwAUEOQ/L/Nsg57FlZjtnjXWfiBHnbbT+AddUaldAm0iXN1HVVzAao64M2PbZt
	r6t+zrXsoPIOpw0YKIX27s7AbN/wgrcWd4iRp86lwektLKVBw6VXQkpEHGshZzuk1RPWEV
	d4KXdQn+rK+pxTrU2mwgTwJbSVYo9x0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709539889;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ll30tKGQWON0zxMBper/sQMPhTvb/K7qL/K/HIuDngk=;
	b=IujqTbtAdyAGtIxkq0uzfpKrz1o0KzcPMKJILUsIcNxUh6KjM+ylTuCES0iRMDbagTjq+2
	DbaspJVcinduYKAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2C90613A58;
	Mon,  4 Mar 2024 08:11:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SyaHCTGC5WVEaAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 04 Mar 2024 08:11:29 +0000
Date: Mon, 04 Mar 2024 09:11:28 +0100
Message-ID: <874jdm2z7z.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: Re: Enable Headset Mic for Acer NB platform
In-Reply-To: <fe0eb6661ca240f3b7762b5b3257710d@realtek.com>
References: <521cc46507f54cd0ae460fb2e0cf90f8@realtek.com>
	<87bk7y5ix6.wl-tiwai@suse.de>
	<fe0eb6661ca240f3b7762b5b3257710d@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-1.98 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 TO_DN_ALL(0.00)[];
	 RCPT_COUNT_TWO(0.00)[2];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.88)[99.49%]
Message-ID-Hash: 2TYFAQUJRE6KYN64LULVRFEY3KCOC76X
X-Message-ID-Hash: 2TYFAQUJRE6KYN64LULVRFEY3KCOC76X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2TYFAQUJRE6KYN64LULVRFEY3KCOC76X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 04 Mar 2024 03:11:47 +0100,
Kailang wrote:
> 
> 
> Oh! Sorry! I forgot.

Thanks, applied now.


Takashi

> 
> > -----Original Message-----
> > From: Takashi Iwai <tiwai@suse.de>
> > Sent: Friday, March 1, 2024 6:46 PM
> > To: Kailang <kailang@realtek.com>
> > Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> > Subject: Re: Enable Headset Mic for Acer NB platform
> > 
> > 
> > External mail.
> > 
> > 
> > 
> > On Fri, 01 Mar 2024 09:21:26 +0100,
> > Kailang wrote:
> > >
> > > Hi Takashi,
> > >
> > > This patch will enable headset Mic for Acer NB platform.
> > 
> > Is the patch missing?
> > 
> > 
> > thanks,
> > 
> > Takashi
> 
