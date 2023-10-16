Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 651767CAE05
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Oct 2023 17:47:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF18091;
	Mon, 16 Oct 2023 17:46:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF18091
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697471242;
	bh=n890mq0xNi9/TEIzvXgVivD79BgnnzUvlDxpdIdppks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cHHPBGT6arat7ymhqEBa52ZqfBRWaaK+pU36i3dlVZpgwmdvYGaihu2asHAcx+KLs
	 qnCssMrxxcD5V9zRKud9hWMMAiaCgR+IxzB97q5dXDZARZ/ZjTr9XvRTeqUqlEAvOA
	 tzTqbtZmN/rrBSjxA9yh365FZ6IttQHe61pz0Sfg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96586F8025F; Mon, 16 Oct 2023 17:46:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 36334F8024E;
	Mon, 16 Oct 2023 17:46:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EA6AF8025F; Mon, 16 Oct 2023 17:46:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4B4F5F80236
	for <alsa-devel@alsa-project.org>; Mon, 16 Oct 2023 17:45:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B4F5F80236
Received: by m.b4.vu (Postfix, from userid 1000)
	id 9BA806147B9C; Tue, 17 Oct 2023 02:15:54 +1030 (ACDT)
Date: Tue, 17 Oct 2023 02:15:54 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Subject: Re: [PATCH RFC] ALSA: scarlett2: Add ioctls for user-space access
Message-ID: <ZS1asqF0cXRUzBwb@m.b4.vu>
References: <ZSqehHhedJQY9h/1@m.b4.vu>
 <76c1526d-78be-92d2-cf2b-148278394575@perex.cz>
 <ZS0tajzKr68CZ5uA@m.b4.vu>
 <123242ed-c343-dab8-fed1-9f5d2da44d7a@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <123242ed-c343-dab8-fed1-9f5d2da44d7a@perex.cz>
Message-ID-Hash: YGN5SRDCOM4RNKFMMQZL5MOWO2MLWYYZ
X-Message-ID-Hash: YGN5SRDCOM4RNKFMMQZL5MOWO2MLWYYZ
X-MailFrom: g@b4.vu
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YGN5SRDCOM4RNKFMMQZL5MOWO2MLWYYZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Oct 16, 2023 at 03:28:11PM +0200, Jaroslav Kysela wrote:
> On 16. 10. 23 14:32, Geoffrey D. Bennett wrote:
> > On Mon, Oct 16, 2023 at 09:04:21AM +0200, Jaroslav Kysela wrote:
> > > On 14. 10. 23 15:58, Geoffrey D. Bennett wrote:
> > > > In order to support functions such as firmware upgrade from
> > > > user-space, add ioctls for submitting arbitrary proprietary requests
> > > > through scarlett2_usb() and requesting/releasing exclusive access.
> > > > ---
> > > > 
> > > > Hi Takashi,
> > > > 
> > > > I recently figured how to update the firmware on Scarlett Gen 2+
> > > > devices. I think the best way to implement this is with an ioctl
> > > > giving access to the scarlett2_usb() function from user-space, plus
> > > > two ioctls to request/release exclusive access.
> > > > 
> > > > Does something like this seem reasonable?
> > > 
> > > Maybe you can use libusb for this job without an additional kernel
> > > interface. It allows to detach the USB kernel driver and attach it again
> > > when the job is complete.
> > 
> > Hi Jaroslav,
> > 
> > I considered using libusb (I used it during initial development of the
> > driver), and if the only purpose of the ioctl would be for firmware
> > updates then it would be reasonable to detach the kernel driver for
> > that. However...
> > 
> > Beyond just being able to do firmware operations, that ioctl would
> > also allow access to all of the configuration space using cmd =
> > SCARLETT2_USB_GET_DATA and SCARLETT2_USB_SET_DATA. I think this would
> > be the cleanest way to allow implementing non-mixer related
> > functionality in user-space, such as reading the current firmware
> > version, reading/updating the device name and channel names, and
> > updating the software configuration space for Focusrite Control
> > compatibility to name a few. These sorts of applications need to be
> > able to make these proprietary requests through the scarlett2 driver
> > to avoid disrupting it (or disrupting audio).
> 
> Thank you for this bigger picture. But except the firmware upgrade, all
> those functions seem to be implementable in a more abstract way using
> standard control API. Note that we can assign the controls also to card
> (e.g. SNDRV_CTL_ELEM_IFACE_CARD) to classify them as non-mixer.

Hi Jaroslav,

By "more abstract way", you mean to have a control for every parameter
which could be read or written? I can see that working for things like
firmware version, device name, and channel name, but I think it would
be pretty awful for the software configuration space that Focusrite
Control uses, and bloat the driver quite a bit for what seems to me to
be something more suited to user-land implementation.

(an aside, will alsactl store/restore SNDRV_CTL_ELEM_TYPE_BYTES?)

Or am I misunderstanding and you mean there is already a way (like
SNDRV_CTL_IOCTL_TLV_COMMAND?) to send commands & get responses?

By "pretty awful"/bloat, a bit more explanation:

(1) Part of the NVRAM that can be accessed refers to the hardware
controls which the driver allows the user to read/write (such as
dim/mute/volume/level/pad/air/phantom/etc.)

(2) Part of the NVRAM is used by the Focusrite Control software to
store the state of the interface in a higher-level way. It does not
support all features of the hardware (e.g. routing is quite
restricted).

It's not possible to represent all functions of (1) inside (2), so
when I developed the driver I ignored (2) and implemented all features
of (1). It doesn't make sense to implement (2) in the kernel as that
would double the number of controls, but what would make sense would
be a user-space application that implements read/write of (2) with a
UI that restricts the user to what can be represented in (2).

For example: in (1), routing is all mono vs. in (2) routing is
stereo-only, channels can be paired together, and there are
balance/pan controls. I feel strongly this is the sort of thing where
the kernel provides the low-level (1) hardware interface, and a
user-space app provides a higher-level (2) interface.

It'd be nice if the app could store this data on the device itself
like Focusrite Control does. And perhaps it could even do this in a
non-Focusrite Control compatible way (for additional functionality
when compatibility is not desired). But those options are not feasible
if there is no access to read/write NVRAM arbitrarily.

That's why I came up with the proposed ioctl interface to the
scarlett2_usb() function. That will allow user-space to access all
applicable functions:

- reboot
- get flash info
- get flash segment info
- erase flash segment
- get erase segment progress
- write flash segment
- read NVRAM
- write NVRAM

through a common interface, without disconnecting the kernel driver,
and without adding specific support for a bunch of things that are not
applicable to the hardware controls (1).

Thanks,
Geoffrey.
