Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E14197CBCDC
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Oct 2023 09:54:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 503C984A;
	Tue, 17 Oct 2023 09:53:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 503C984A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697529285;
	bh=9rdr5AenEeJZ/4KlT+yFmC+1GXxmXORgdh4s9wIKvd8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CAIBS69CXG6iyZ0oR/gO1Nn+tVlQJvySwc3skcvvh+NcKO1rEV8KZTvfFx1D2selM
	 cGsJCGnyGFiYGzW1z5IkI10pobBuzPNvpuI0VlFZmC6l0FAXtZJ52y/Dg0Nm3kozeu
	 tIfAMmNcVG7bg6UZrFwgIG+pK/MiK5nBLJ4xthNs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29F65F80558; Tue, 17 Oct 2023 09:53:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 65BEAF80236;
	Tue, 17 Oct 2023 09:53:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF701F8024E; Tue, 17 Oct 2023 09:53:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8DA48F80166
	for <alsa-devel@alsa-project.org>; Tue, 17 Oct 2023 09:53:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DA48F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=seGTy8zJ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=7/VD7DHD
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 476771FEFD;
	Tue, 17 Oct 2023 07:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1697529202;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NG/+3wLjfhZCNHVrGetEKfmz7mEEk4XJGmSCzq1yS7M=;
	b=seGTy8zJRRtaGnum+dLwTSAWpRyZpI+l3Kz6BAgBxQxfjUFGJhR7wZnz7fDx6bRPcCdnr/
	u6293qPDOJaa/HQj6XYQNWyqwFIv7X1U19DZyWD/J9ZTvF/GyD4FPSxvMk4KhWGfu35vCY
	jy4vnPJtjfeaIq/G9BEgWS4XTncU1Z4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1697529202;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NG/+3wLjfhZCNHVrGetEKfmz7mEEk4XJGmSCzq1yS7M=;
	b=7/VD7DHDIpKJ5U1ijDvuth5F4faOFB4voRUqO3QM72pefg6smpuM9DsahRF+yMqTdqt24W
	UMr1MqSc6t4RVtAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 22BC613597;
	Tue, 17 Oct 2023 07:53:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id j7iGB3I9LmXTOQAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 17 Oct 2023 07:53:22 +0000
Date: Tue, 17 Oct 2023 09:53:21 +0200
Message-ID: <87edhtn0r2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH RFC] ALSA: scarlett2: Add ioctls for user-space access
In-Reply-To: <ZS1asqF0cXRUzBwb@m.b4.vu>
References: <ZSqehHhedJQY9h/1@m.b4.vu>
	<76c1526d-78be-92d2-cf2b-148278394575@perex.cz>
	<ZS0tajzKr68CZ5uA@m.b4.vu>
	<123242ed-c343-dab8-fed1-9f5d2da44d7a@perex.cz>
	<ZS1asqF0cXRUzBwb@m.b4.vu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-10.10 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
Message-ID-Hash: ARAF2FIY6IJKRVR4VYLDKUSOOB7A4GM6
X-Message-ID-Hash: ARAF2FIY6IJKRVR4VYLDKUSOOB7A4GM6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ARAF2FIY6IJKRVR4VYLDKUSOOB7A4GM6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 16 Oct 2023 17:45:54 +0200,
Geoffrey D. Bennett wrote:
> 
> On Mon, Oct 16, 2023 at 03:28:11PM +0200, Jaroslav Kysela wrote:
> > On 16. 10. 23 14:32, Geoffrey D. Bennett wrote:
> > > On Mon, Oct 16, 2023 at 09:04:21AM +0200, Jaroslav Kysela wrote:
> > > > On 14. 10. 23 15:58, Geoffrey D. Bennett wrote:
> > > > > In order to support functions such as firmware upgrade from
> > > > > user-space, add ioctls for submitting arbitrary proprietary requests
> > > > > through scarlett2_usb() and requesting/releasing exclusive access.
> > > > > ---
> > > > > 
> > > > > Hi Takashi,
> > > > > 
> > > > > I recently figured how to update the firmware on Scarlett Gen 2+
> > > > > devices. I think the best way to implement this is with an ioctl
> > > > > giving access to the scarlett2_usb() function from user-space, plus
> > > > > two ioctls to request/release exclusive access.
> > > > > 
> > > > > Does something like this seem reasonable?
> > > > 
> > > > Maybe you can use libusb for this job without an additional kernel
> > > > interface. It allows to detach the USB kernel driver and attach it again
> > > > when the job is complete.
> > > 
> > > Hi Jaroslav,
> > > 
> > > I considered using libusb (I used it during initial development of the
> > > driver), and if the only purpose of the ioctl would be for firmware
> > > updates then it would be reasonable to detach the kernel driver for
> > > that. However...
> > > 
> > > Beyond just being able to do firmware operations, that ioctl would
> > > also allow access to all of the configuration space using cmd =
> > > SCARLETT2_USB_GET_DATA and SCARLETT2_USB_SET_DATA. I think this would
> > > be the cleanest way to allow implementing non-mixer related
> > > functionality in user-space, such as reading the current firmware
> > > version, reading/updating the device name and channel names, and
> > > updating the software configuration space for Focusrite Control
> > > compatibility to name a few. These sorts of applications need to be
> > > able to make these proprietary requests through the scarlett2 driver
> > > to avoid disrupting it (or disrupting audio).
> > 
> > Thank you for this bigger picture. But except the firmware upgrade, all
> > those functions seem to be implementable in a more abstract way using
> > standard control API. Note that we can assign the controls also to card
> > (e.g. SNDRV_CTL_ELEM_IFACE_CARD) to classify them as non-mixer.
> 
> Hi Jaroslav,
> 
> By "more abstract way", you mean to have a control for every parameter
> which could be read or written? I can see that working for things like
> firmware version, device name, and channel name, but I think it would
> be pretty awful for the software configuration space that Focusrite
> Control uses, and bloat the driver quite a bit for what seems to me to
> be something more suited to user-land implementation.
> 
> (an aside, will alsactl store/restore SNDRV_CTL_ELEM_TYPE_BYTES?)
> 
> Or am I misunderstanding and you mean there is already a way (like
> SNDRV_CTL_IOCTL_TLV_COMMAND?) to send commands & get responses?
> 
> By "pretty awful"/bloat, a bit more explanation:
> 
> (1) Part of the NVRAM that can be accessed refers to the hardware
> controls which the driver allows the user to read/write (such as
> dim/mute/volume/level/pad/air/phantom/etc.)
> 
> (2) Part of the NVRAM is used by the Focusrite Control software to
> store the state of the interface in a higher-level way. It does not
> support all features of the hardware (e.g. routing is quite
> restricted).
> 
> It's not possible to represent all functions of (1) inside (2), so
> when I developed the driver I ignored (2) and implemented all features
> of (1). It doesn't make sense to implement (2) in the kernel as that
> would double the number of controls, but what would make sense would
> be a user-space application that implements read/write of (2) with a
> UI that restricts the user to what can be represented in (2).
> 
> For example: in (1), routing is all mono vs. in (2) routing is
> stereo-only, channels can be paired together, and there are
> balance/pan controls. I feel strongly this is the sort of thing where
> the kernel provides the low-level (1) hardware interface, and a
> user-space app provides a higher-level (2) interface.
> 
> It'd be nice if the app could store this data on the device itself
> like Focusrite Control does. And perhaps it could even do this in a
> non-Focusrite Control compatible way (for additional functionality
> when compatibility is not desired). But those options are not feasible
> if there is no access to read/write NVRAM arbitrarily.
> 
> That's why I came up with the proposed ioctl interface to the
> scarlett2_usb() function. That will allow user-space to access all
> applicable functions:
> 
> - reboot
> - get flash info
> - get flash segment info
> - erase flash segment
> - get erase segment progress
> - write flash segment
> - read NVRAM
> - write NVRAM
> 
> through a common interface, without disconnecting the kernel driver,
> and without adding specific support for a bunch of things that are not
> applicable to the hardware controls (1).

I caught a flu and am still in sick leave since the last week, so
this is just a short followup from my side.

First off, I don't think it appropriate to expose a generic register
access via (hwdep) ioctl as your RFC patch.  Then it allows to screw
up the hardware too easily by sending random bytes.  It may result in
a severe defect, too.

If you have some proper "features" to be implemented as the driver
functionality, they can be provided via ioctl, though; but then each
ioctl must serve for only a single purpose.

OTOH, if you need a handy register access for debugging, providing a
debugfs interface could be a solution, too.  It's safer than ioctl
(as it's not allowed for every user unlike ioctl), and it can be
disabled on a production system.


thanks,

Takashi
