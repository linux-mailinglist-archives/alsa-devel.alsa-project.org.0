Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7569EB17E9B
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Aug 2025 10:51:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDD706025C;
	Fri,  1 Aug 2025 10:51:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDD706025C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754038312;
	bh=7kFkcZ+uggSUszdMqMqGgSuSZPbh1bMMOwSvim53B2c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X6W+Q+rdN5GLZZLHejBUyIe+JMHGs1nuzH5TVz+2deR+OgT7KDo9GWWuHD0to2ogB
	 pi966TsU23V4cj+WvTrImyEzN1ZKzyBK8rD8yzt0eXOBZA6kMcwr/UdV4ExrDuBmIR
	 7hLb5tuvKrMifAvPRpNqMeuz+BCaFmZfQsib/eww=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB89EF805C8; Fri,  1 Aug 2025 10:51:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0DE6F805C4;
	Fri,  1 Aug 2025 10:51:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4908EF80518; Fri,  1 Aug 2025 10:50:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8EB0F8012A
	for <alsa-devel@alsa-project.org>; Fri,  1 Aug 2025 10:50:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8EB0F8012A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=VOT+N03L;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=smzIWbB5;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=VOT+N03L;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=smzIWbB5
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0472C21B71;
	Fri,  1 Aug 2025 08:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1754038211;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qTJ+vQafVYqPXHFeijA46kRDC7+L4XKsCmqEb3f6nYI=;
	b=VOT+N03LE3CXDtS+jW1VkUR8h+nIk+9h8HaScUlouc6dWsmsVdRyNsiRFPMqyfoFOMwUpf
	nU7HL0nKRx9s7DyESCnbl0nQIkZTRScbt1VZsHo2EUnT9tMme2y1eC9H399J9fx6CvQj8T
	ZmbVW1j9EsXE6Nt56ahXEQp9lTePIUE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754038211;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qTJ+vQafVYqPXHFeijA46kRDC7+L4XKsCmqEb3f6nYI=;
	b=smzIWbB5wrfXn148CGbdGUCDBBzvQ+6DcdDSJt6n4BUfz8JuFQ3ZXX/vBRpvwpbgMOTpdP
	HoRCHceiIrPznSCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VOT+N03L;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=smzIWbB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1754038211;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qTJ+vQafVYqPXHFeijA46kRDC7+L4XKsCmqEb3f6nYI=;
	b=VOT+N03LE3CXDtS+jW1VkUR8h+nIk+9h8HaScUlouc6dWsmsVdRyNsiRFPMqyfoFOMwUpf
	nU7HL0nKRx9s7DyESCnbl0nQIkZTRScbt1VZsHo2EUnT9tMme2y1eC9H399J9fx6CvQj8T
	ZmbVW1j9EsXE6Nt56ahXEQp9lTePIUE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754038211;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qTJ+vQafVYqPXHFeijA46kRDC7+L4XKsCmqEb3f6nYI=;
	b=smzIWbB5wrfXn148CGbdGUCDBBzvQ+6DcdDSJt6n4BUfz8JuFQ3ZXX/vBRpvwpbgMOTpdP
	HoRCHceiIrPznSCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CF93D13876;
	Fri,  1 Aug 2025 08:50:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IsROMcJ/jGjDLgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 01 Aug 2025 08:50:10 +0000
Date: Fri, 01 Aug 2025 10:50:10 +0200
Message-ID: <878qk34e9p.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sean Anderson <sean.anderson@seco.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: retire_capture_urb: Corrected urb data len
In-Reply-To: <195fcbb0-37f6-4379-87c9-1ef75b07bf6f@seco.com>
References: <68a97d61-21bf-b45e-f6ed-c0906dd4b197@seco.com>
	<87ilmfj72j.wl-tiwai@suse.de>
	<9d41eda1-1172-ea60-dd87-b3e38a529170@seco.com>
	<87r110iz8w.wl-tiwai@suse.de>
	<53306c0f-e5ef-44ee-b90c-a3ea61ca454c@seco.com>
	<87v8q6wcf6.wl-tiwai@suse.de>
	<195fcbb0-37f6-4379-87c9-1ef75b07bf6f@seco.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 0472C21B71
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
Message-ID-Hash: TYEH3T43V7VC5F4ZV4EDEZBCCMYMT547
X-Message-ID-Hash: TYEH3T43V7VC5F4ZV4EDEZBCCMYMT547
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TYEH3T43V7VC5F4ZV4EDEZBCCMYMT547/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 31 Jul 2025 23:49:11 +0200,
Sean Anderson wrote:
> 
> Hi,
> 
> On 9/2/22 01:52, Takashi Iwai wrote:
> > On Thu, 01 Sep 2022 17:25:41 +0200,
> > Sean Anderson wrote:
> >> 
> >> 
> >> 
> >> On 8/28/22 3:49 AM, Takashi Iwai wrote:
> >> > On Fri, 26 Aug 2022 20:57:53 +0200,
> >> > Sean Anderson wrote:
> >> >> 
> >> >> On 8/26/22 12:36 PM, Takashi Iwai wrote:
> >> >> > On Fri, 26 Aug 2022 18:22:24 +0200,
> >> >> > Sean Anderson wrote:
> >> >> >> 
> >> >> >> Hi all,
> >> >> >> 
> >> >> >> I have a "FiiO DigiHug USB Audio" sound card (1852:7022) [3]. I have had
> >> >> >> no problems with the audio, but I did notice a large number of message
> >> >> >> like 
> >> >> >> 
> >> >> >> retire_capture_urb: 4992 callbacks suppressed
> >> >> >> 
> >> >> >> in my dmesg [1]. This is caused by the "Corrected urb data len."
> >> >> >> warning.
> >> >> > 
> >> >> > What exact values are shown there?
> >> >> 
> >> >> Unfortunately, as detailed below, I was unable to turn off ratelimiting.
> >> >> 
> >> >> > The problem is that your hardware
> >> >> > (likely a buggy firmware) returns the unaligned size of bytes as the
> >> >> > data.  Maybe it's worth to replace dev_warn_ratelimited() there with
> >> >> > dev_warn() and take all warnings once.  Then we can see what kind of
> >> >> > values are delivered from the hardware.
> >> >> 
> >> >> I'll have an attempt at that next week
> >> >> 
> >> >> >> The patch adding this warning [2] makes it seem like
> >> >> >> this warning should be an uncommon occurance. However, based on the
> >> >> >> number of suppressed callbacks, this seems to be happening at a rate of
> >> >> >> around 500 Hz.
> >> >> >> 
> >> >> >> Is this buggy hardware? Or is this a bug in the driver? Does there need
> >> >> >> to be a quirk? Or perhaps the warning above should be a debug instead?
> >> >> > 
> >> >> > There is no quirk for that.  As long as the device works with that
> >> >> > workaround (except for messages), we can simply add a quirk to not
> >> >> > warn but always apply the workaround silently for such devices.
> >> >> 
> >> >> OK. I wasn't sure what the correct resolution would be.
> >> > 
> >> > Actually I was wrong: the existing quirk QUIRK_FLAG_ALIGN_TRANSFER
> >> > should cover that.
> >> > 
> >> > Could you try to pass quirk_flags=0x04 for the corresponding card slot
> >> > (the option takes an array) to snd-usb-audio module?  Alternatively,
> >> > try to pass quirk_alias=18557022:0e510408 to snd-usb-audio?
> >> 
> >> I tried both options, but neither worked.
> > 
> > I have no further idea.  You should try the latest kernel without
> > modification before checking further.
> > 
> > And, looking at the code again, it's really strange that you get those
> > messages.  Actually the transfer size *is* aligned to the audio frames
> > as default *unless* QUIRK_FLAG_ALIGN_TRANSFER is passed.  And the
> > check is done rather the audio sample size alignment -- which must fit
> > within the audio frame alignment.
> > 
> > So, QUIRK_FLAG_ALIGN_TRANSFER is already set for your device by some
> > reason incorrectly, or the code is doing wrong on your kernel.
> > We need to check what values are shown there actually, then check
> > whether the problem happens with the latest vanilla kernel.
> 
> Sorry for the very long hiatus. I have reproduced this issue on kernel
> 6.15.8.
> 
> From closer inspection this message seems to be from the first print and
> not the second one:
> 
> if (urb->iso_frame_desc[i].status && printk_ratelimit()) {
> 	dev_dbg(&subs->dev->dev, "frame %d active: %d\n",
> 		i, urb->iso_frame_desc[i].status);
> 	// continue;
> }
> 
> This probably be a dev_dbg_ratelimited. Indeed, that suppresses these
> messages.

The use or printk_ratelimit() like the above is already discouraged,
so it makes more sense to switch to dev_dbg_ratelimited() if it
works.

> The actual message that's being ratelimited is
> 
> usb 3-11.2: frame 0 active: -71
> 
> which is EPROTO. Looks like that comes from xhci_hcd. With debug enabled
> I get a lot of
> 
> xhci_hcd 0000:80:14.0: Transfer error for slot 36 ep 4 on endpoint
> 
> The spec says this is 
> 
> | Asserted in the case where the host did not receive a valid response
> | from the device (Timeout, CRC, Bad PID, unexpected NYET, etc.).
> 
> and I don't really know what to make of that. Should I send a patch to
> convert that dev_dbg to dev_dbg_ratelimited? Or do you want to debug
> this further?

Usually EPROTO means something the USB controller doesn't like :)
It's often a device firmware problem, but can be other means, too.
You can try to connect to a different port or a machine, and see
whether the problem is seen consistently.


thanks,

Takashi
