Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAAC7AC64B
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Sep 2023 04:19:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3134BA4D;
	Sun, 24 Sep 2023 04:19:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3134BA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695521996;
	bh=sdIddmbtYgKgQlVkSPXDKiToRLgSl+MZmiTyDsvnNZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cjX03UPMnJymhCwgD5rn81X91sv/mwaAU4F7zpDR4h4rSCAjrrc7Wew9wAM6cfwEQ
	 JqYsNcrQa1kQgZVcv9psuw3kIvuoicWaykh565I2iUP7nRfwe73GKBXo/4L392tvE1
	 8bSj1ww0stjmDGO/jCjKKBKrp6xLja5pdaI1rFCo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BBFB7F80290; Sun, 24 Sep 2023 04:18:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68FCBF80166;
	Sun, 24 Sep 2023 04:18:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D102F8016A; Sun, 24 Sep 2023 04:16:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B2FE9F800AA
	for <alsa-devel@alsa-project.org>; Sun, 24 Sep 2023 04:16:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2FE9F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm2 header.b=O3GBwYZg;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=bKuFl7+L
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id B061D5C1AE4;
	Sat, 23 Sep 2023 22:16:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sat, 23 Sep 2023 22:16:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1695521783; x=
	1695608183; bh=IaRCraUof08SHGYnDs9H9chR6gVBTRW4urokzUdjgO4=; b=O
	3GBwYZgkvEjGXAF4gWkSjTWRzqtYs+bPsj0lbBHIsJ/fXB5V23Z4Ghk+4YclyDns
	StD3qTMxNUiMLN9svG4N6sqb2Wx1QIKi4B8dg+zyeaANVOR0GVh1zr/jEpbRtlv3
	2ePimfK1O9Szh5DdGslWh8YHAMe1dYzCHG7PfajVrt3FPvwv6AIGMAbR/54uYLpy
	2prfcn7EB52aHBIMzZnu73d/IOT0ih2iQIiumc8pCNVJ7dDUUnirzd3kVpwrlSuq
	JYKF0psQZNjxVFTS8AqKzATDXKw307ONNliVzeJF7kFQ/kbKbPtpdah3lyY7Xjh2
	s3TZ6GvTlM1m3gZHf5hvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1695521783; x=1695608183; bh=IaRCraUof08SH
	GYnDs9H9chR6gVBTRW4urokzUdjgO4=; b=bKuFl7+L7CUY7T6W14zdmwIvIJ09v
	7iIPWcYSNQ52mJbYhqATqHJwpFqhz4N7ombxUcwvAyoMPaFsC4bBHKPTeYZMhOCw
	V+qCsYQkj0sACzFPSwaDZ01SGtyzs7yfkUfHia20g81X3rfyK5JrXYrPfdqVGo/X
	+I6U9gakELykk8g5dlmPigmJWrfJ7RDHlJF8Gg14cJebez/N4fT0vv9VnYI6de5G
	Dc21/xN/PuXCbXO1PF+o2QNR7hF8s+Fxu/RUx/1wbQj/exxmZ22OO4uc9nUNbsUd
	VHn+0YEuZ8Ebv4OhNzN16AA0q7IlX+NxVRV/2dS575VNNhBTuuik+po7Q==
X-ME-Sender: <xms:9psPZZZoNoB9-c9iwMnHB3c__Qt4bf-NnlEUomlriqJTNjYMuPxv4w>
    <xme:9psPZQZoXz8sqwwAImiYxUUPp7SRQDbr7dgnpyVtDlIQxPQi3Ao4mwI9ev5usIRUx
    PTUpq-_tIDFAy_Z-Is>
X-ME-Received: 
 <xmr:9psPZb8G_cO2JaA_FmDzKh_qrwMmvYnp0idkBh9vyHTOcyE-bBUCPuluY7theAeVPT49y4olWLIcmXeuiWNcflonwZEOZj-X0WFY>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedviedrudeluddgheekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    goufhushhpvggtthffohhmrghinhculdegledmnecujfgurhepfffhvfevuffkfhggtggu
    jgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceooh
    dqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhep
    ffehleelgeefhfdvhfduieegieelhfeigfeileffueeivdffhffguddvkefgieelnecuff
    homhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmpdhgihhthhhusgdr
    ihhopdhrvggrughthhgvughotghsrdhiohdpghhtkhdqrhhsrdhorhhgnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihes
    shgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:9psPZXrlwuVd6UCpnXjHr331QKfcYqC8_tE4t-LLMp2yZdAbf5-oNA>
    <xmx:9psPZUoV44JLKzl-n19DOA8cJLzuyActDxQ3NVLrEoISL48Y4OZTFg>
    <xmx:9psPZdQo7wxM_hFqfyuv2o3_MFbjQzuCvDdAeqFHR3TzDRi-yXYaZA>
    <xmx:95sPZb3B-6-kq-gs21BE9MyPszGYbdoNtcP7YwDmhigBCsNUKGZMRg>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 23 Sep 2023 22:16:21 -0400 (EDT)
Date: Sun, 24 Sep 2023 11:16:17 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Michele Perrone <michele.perrone@weiss.ch>
Cc: Takashi Iwai <tiwai@suse.de>, Rolf Anderegg <rolf.anderegg@weiss.ch>,
	alsa-devel@alsa-project.org
Subject: Re: Re: MAN301 external clock issues (Re: [PATCH] ALSA: dice: add
 stream format parameters for Weiss devices)
Message-ID: <20230924021617.GA298150@workstation.local>
Mail-Followup-To: Michele Perrone <michele.perrone@weiss.ch>,
	Takashi Iwai <tiwai@suse.de>,
	Rolf Anderegg <rolf.anderegg@weiss.ch>, alsa-devel@alsa-project.org
References: <99c82e03-7323-4d4d-8ced-7fd773138f6e@weiss.ch>
 <2644a27e-aa51-4d11-9890-988c02f9631e@weiss.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2644a27e-aa51-4d11-9890-988c02f9631e@weiss.ch>
Message-ID-Hash: LUL4DYS3NF2NEAHPSKDPOZZJ7G5JAUMX
X-Message-ID-Hash: LUL4DYS3NF2NEAHPSKDPOZZJ7G5JAUMX
X-MailFrom: o-takashi@sakamocchi.jp
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LUL4DYS3NF2NEAHPSKDPOZZJ7G5JAUMX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Wed, Sep 20, 2023 at 12:25:07PM +0200, Michele Perrone wrote:
>    Hi Takashi,
> 
>    On 19/09/23 16:09, Takashi Sakamoto wrote:
> 
> For the case of external source of clock, you need to configure the
> sampling rate in device by your hand, by accesing to GLOBAL_CLOCK_SELECT
> offset in global section of TCAT protocol.
> 
>    I'm able to do this from the kernel space, but I wouldn't know how to
>    achieve this in the user-space without switching back and forth between
>    internal and external clock source.
>    Moreover, there seems to be no 'write' handler installed inside
>    'snd_dice_create_hwdep()'[2], so using 'snd_hwdep_write()' from
>    user-space ALSA is not possible.

>    The only option I see is adding a new control to
>    'snd_kcontrol_new controls[]'[3], inside 'dice_snd_ctl_construct()'[3]
>    in our AV/C code.
>    But I don't think this is the best solution, in view of the fact the we
>    will be switching to snd-firewire-ctl-services[4] in the near future.
>
> I programmed ALSA dice driver to behave like that.
> 
> The driver configures the target device for sampling rate which ALSA PCM
> application expects when the device uses internal source of clock. When
> the device is configured to use external source of clock, the driver
> adds constrains to ALSA PCM hardware configuration so that the application
> works with current sampling rate configured in device.
> 
>    Thanks for explaining this. I have now found the place in the code
>    where
>    you do this[1].
>    May I ask, what is the reason for this limitation? I don't see any
>    relevant connection between that last used internal sampling rate, and
>    the current external sampling rate.
>    Moreover, the DICE driver is able to see the external sampling rate in
>    real-time. So when the external clock rate is selected and locked,
>    wouldn't it make sense that the device rate followed the external rate
>    automatically, without user-space intervention?

In TCAT general protocol, we can find several fields for detected
sampling frequency[1].

* STATUS_NOMINAL_RATE_MASK (offset 0x54 in global section)
* GLOBAL_SAMPLE_RATE (offset 0x5c in global section)
* EXT_SYNC_RATE (offset 0x08 in external sync section)

The last two of them are extension or optional, thus we assume that all of
models with DICE ASICs do not necessarily support them. As long as I
investigate, the first is just for detected nominal sampling transfer
frequency in incoming IEC 61883-6 stream which is locked, against your
expectation.

When supporting all of models with DICE ASICs in market and firmware, it
is inevitable not to rely on the auto-detection you mentioned. Actually,
old version of firmware does not support GLOBAL_SAMPLE_RATE. Furthermore,
we have a few models which support external sync section.

Just for models provided by Weiss Engineering, additional kctl could be
one of solution as you mentioned, but it seems to be hard for upstreaming
due to the reason, sorry.


Well, in the protocol, the device can send notification to registered
offset of node ID for several purposes. You can see below events in the
driver code:

* NOTIFY_RX_CFG_CHG
* NOTIFY_TX_CFG_CHG
* NOTIFY_LOCK_CHG
* NOTIFY_CLOCK_ACCEPTED
* NOTIFY_EXT_STATUS

For your issue, observation of lock-change, clock-accepted, and ext-status
notifications is useful, I think. The ALSA HwDep character device added
by ALSA dice driver is mainly for the notification[2]. When receiving the
notification, the driver cache the message and allow the user space
application to read it.

I maintain libhitaki[3] for convenience to such user space application.
Hitaki.SndDice implements Hitaki.QuadletNotification::notified GObject
signal[4], which is emitted when reading the notification. The library
supports GObject Introspection[5] to provide language bindings such as
PyGObject[6] and gtk-rs/gir[7].

You can see rough Python 3 sample to print the notification[8].


[1] See 'sound/firewire/dice/dice-interface.h' in Linux kernel
[2] https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/include/uapi/sound/firewire.h?id=82fbb4f7b476
[3] https://github.com/alsa-project/libhitaki
[4] https://alsa-project.github.io/gobject-introspection-docs/hitaki/class.SndDice.html
[5] https://gi.readthedocs.io/en/latest/
[6] https://pygobject.readthedocs.io/en/latest/
[7] https://gtk-rs.org/gir/book/
[8] https://gist.github.com/takaswie/673a7f83964f7986d3f1e4e9b86cde03


Regards

Takashi Sakamoto
