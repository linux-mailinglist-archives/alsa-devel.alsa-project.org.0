Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9029AB034
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2024 15:56:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E53CA4B;
	Tue, 22 Oct 2024 15:56:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E53CA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729605402;
	bh=Y7HT68PXYjz7d0Br/DnftiWOw45gz2zuwSv4S657zF4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gtKi82S2pWFGSPVCTMwj9a2PjTR/JE1xOJITA1jDsRLQYho3WOPtW4HQrBW4gG8dP
	 OqfDK4M0sgE5LfhY1hQr0Xfk+odllmE5THD2nQLKuCS/2Be/wG2WIJuive9nr/+016
	 NfNs512KqbobKY1RC4UtYjeNEXLi7KSwP0dB5Sz8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BEE78F805AB; Tue, 22 Oct 2024 15:56:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BE2ADF80580;
	Tue, 22 Oct 2024 15:56:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16016F8016C; Tue, 22 Oct 2024 15:56:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 14055F80149
	for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2024 15:56:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14055F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=zYP90jaF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=vIs0nCwm;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=B5TBZtQQ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ERVik9h3
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D6F6D1FD13;
	Tue, 22 Oct 2024 13:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1729605359;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IdcbEOWzL6eyI2kQxh26Goo1tOGvWeIqXTumtwk51No=;
	b=zYP90jaFV5Pb19n9JW5vzlWwFSGAe0FYGkbu+Cfa+verVBwzWQkpkwgHO33ZFE1a1dvdZK
	0tuttYC1/ND40gdt/oVuioznRPistLudIU9xk6Zdof6abOgPA7P/swYId5Xclt2KqFkUPn
	faS1AQNksTyS2I8MJkUgpI7CfoJCs9Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729605359;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IdcbEOWzL6eyI2kQxh26Goo1tOGvWeIqXTumtwk51No=;
	b=vIs0nCwm9UqtOTXXFO9pD/BP3RbeOj6NRCQ/HfioJ6yWSWynK/EOKscWg2EUYRGgcMo+x4
	vQLfd+I0xAxQduAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=B5TBZtQQ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ERVik9h3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1729605358;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IdcbEOWzL6eyI2kQxh26Goo1tOGvWeIqXTumtwk51No=;
	b=B5TBZtQQGPrR/TbPsDqk7IKz5X7Tmi0z8yWulsHmNXfN58NXJ7pLzmeTOndtyhgQYMDGux
	Jhn5TKi5cbmYtWR3p10EYoWsI7n5dizutXWa+Q0ru1VZjUVhTK/eHUtBqUewhTzBQ8rmi6
	WUSrnL82ebJ0sAg8lV98eb4e0td5tnc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729605358;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IdcbEOWzL6eyI2kQxh26Goo1tOGvWeIqXTumtwk51No=;
	b=ERVik9h3/yqOOJhof89a2VZZjwOFO1icKKHLZh4yt4bADxjSZ5iuEx8HZ24zLD+hyEGHWK
	EX0IGujbRuv0oXAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 98B1B13AC9;
	Tue, 22 Oct 2024 13:55:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id M/jDJO6uF2epZwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 22 Oct 2024 13:55:58 +0000
Date: Tue, 22 Oct 2024 15:56:44 +0200
Message-ID: <87wmi02qcj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	srinivas.kandagatla@linaro.org,
	mathias.nyman@intel.com,
	perex@perex.cz,
	conor+dt@kernel.org,
	dmitry.torokhov@gmail.com,
	corbet@lwn.net,
	lgirdwood@gmail.com,
	tiwai@suse.com,
	krzk+dt@kernel.org,
	pierre-louis.bossart@linux.intel.com,
	Thinh.Nguyen@synopsys.com,
	broonie@kernel.org,
	bgoswami@quicinc.com,
	robh@kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v29 01/33] xhci: support setting interrupt moderation IMOD
 for secondary interrupters
In-Reply-To: <2024101824-hammock-elastic-8d38@gregkh>
References: <20241015212915.1206789-1-quic_wcheng@quicinc.com>
	<20241015212915.1206789-2-quic_wcheng@quicinc.com>
	<2024101747-defog-squiggly-ef54@gregkh>
	<5847c380-75ce-492a-9a30-0899b7ebe98c@quicinc.com>
	<2024101824-hammock-elastic-8d38@gregkh>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: D6F6D1FD13
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TAGGED_RCPT(0.00)[dt];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,linaro.org,intel.com,perex.cz,kernel.org,gmail.com,lwn.net,suse.com,linux.intel.com,synopsys.com,quicinc.com,vger.kernel.org,alsa-project.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
Message-ID-Hash: JCB2XFTCVEGF4XLOPHCAUAHZMRDHG6QE
X-Message-ID-Hash: JCB2XFTCVEGF4XLOPHCAUAHZMRDHG6QE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JCB2XFTCVEGF4XLOPHCAUAHZMRDHG6QE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 18 Oct 2024 07:52:35 +0200,
Greg KH wrote:
> 
> On Thu, Oct 17, 2024 at 05:07:12PM -0700, Wesley Cheng wrote:
> > Hi Greg,
> > 
> > On 10/16/2024 11:40 PM, Greg KH wrote:
> > > On Tue, Oct 15, 2024 at 02:28:43PM -0700, Wesley Cheng wrote:
> > >> From: Mathias Nyman <mathias.nyman@linux.intel.com>
> > >>
> > >> Allow creators of xHCI secondary interrupters to specify the interrupt
> > >> moderation interval value in nanoseconds when creating the interrupter.
> > >>
> > >> If not sure what value to use then use the xhci driver default
> > >> xhci->imod_interval
> > >>
> > >> Suggested-by: Wesley Cheng <quic_wcheng@quicinc.com>
> > >> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> > >> Link: https://lore.kernel.org/r/20240905143300.1959279-13-mathias.nyman@linux.intel.com
> > >> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > >> ---
> > >>  drivers/usb/host/xhci-mem.c | 8 +++++++-
> > >>  drivers/usb/host/xhci.c     | 4 ++--
> > >>  drivers/usb/host/xhci.h     | 5 ++++-
> > >>  3 files changed, 13 insertions(+), 4 deletions(-)
> > > This is already in 6.12-rc1, which makes me confused as to what tree you
> > > made this series against.
> > 
> > Sorry, I didn't fetch the latest changes from usb-next.
> 
> It wasn't even usb-next, it was 6.12-rc1, so I don't know what tree you
> based this on :(
> 
> > In this case, should I rebase and resbumit?
> 
> As the series can't be applied as-is, probably.  But I think you might
> want to collect some acks from the sound people and xhci developers, as
> I can't do anything with this until they look at the changes.

Honestly speaking, I couldn't follow fully the discussions about the
fundamental design -- IIRC, Pierre and others had concerns to the way
to manage the offload device via kcontrols.  Did we get consensus?

I believe that's the biggest obstacle in the audio side, i.e. what's
visible to users.  The kernel internals can be corrected at any time
later.


thanks,

Takashi
