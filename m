Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB3692F86B
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jul 2024 11:54:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A4AFE65;
	Fri, 12 Jul 2024 11:54:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A4AFE65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720778053;
	bh=Z+kgDXh4aC9aHWHAcpb3b6Gr9Wjsz/MqCuSyeK6hwAY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=oAJcVMtj6b5rVBFOrrVzzE/qdqdKlnS/MNycuV6Tzmpyr0Gs2vnlgmTMX+KlIpzdJ
	 JlLwxTSyMTEocRoLBlfKVtit21EZBBpXCGyTDt6NAxJDBYNQBs8Mv0N+rWJEkuaix2
	 ZOC1fRNXHuVERbb+n/wENV0RKc9FgyjisDhgsBoU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED259F805B1; Fri, 12 Jul 2024 11:53:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A42E6F800FA;
	Fri, 12 Jul 2024 11:53:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A77BF801F5; Fri, 12 Jul 2024 11:48:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 29143F800FA
	for <alsa-devel@alsa-project.org>; Fri, 12 Jul 2024 11:48:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29143F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=asahilina.net header.i=@asahilina.net
 header.a=rsa-sha256 header.s=default header.b=xM1QBoLM
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: lina@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 2B15E4347F;
	Fri, 12 Jul 2024 09:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1720777696;
	bh=DBxWamB7thDTQssSsI2lahjfw8GY8wFwjut5upkIp08=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=xM1QBoLMmGWfbA+EmeVL/Gqjr1kLcHs7IJI34N+OsjapvFeAXsbPk5RyaLPn2u1j6
	 0ubengXUxMUq76p4DdSU8Ts72S1mU0SFJi05QTvGCO40qV/rBlcvrc0fKUfOvVmhGq
	 mNZOSh/hgS0N5Sco/4P4aREiibHQOdu3UUhzllgwF5ZwG3p5+1bRsr2932DyZJfxQa
	 g3SHYPle+2r5frnz9YEM0iZlP8eh1yuoccanOCUxEXDqV2tdNx+O8r1qeSYCjqm3DM
	 Rm18qe3i6giAE8+WjtiAYlJvkEtQF3tnUtOnpfZyrm8HOIPjGxOp8jdmaj57z8iLbK
	 cS3QS5BOIylHQ==
Message-ID: <ccba37b8-0b92-43a9-83f3-297d96183855@asahilina.net>
Date: Fri, 12 Jul 2024 18:48:09 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Handling complex matrix mixers in ALSA
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 "Geoffrey D. Bennett" <g@b4.vu>
References: <48beda37-1795-4d48-987d-1e2582cb3a18@asahilina.net>
 <8734ot42oo.wl-tiwai@suse.de> <20240702004611.GA1029857@workstation.local>
Content-Language: en-US
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <20240702004611.GA1029857@workstation.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 2UK5HSBBNQLC56BTJHSJBQCW2SUZXP5V
X-Message-ID-Hash: 2UK5HSBBNQLC56BTJHSJBQCW2SUZXP5V
X-MailFrom: lina@asahilina.net
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2UK5HSBBNQLC56BTJHSJBQCW2SUZXP5V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 7/2/24 9:46 AM, Takashi Sakamoto wrote:
> On Mon, Jul 01, 2024 at 04:17:11PM +0200, Takashi Iwai wrote:
>> As Geoffrey already suggested, the matrix size can be reduced since
>> each kcontrol element can be an array, so the number of controls can
>> be either column or row size of the matrix, which is well manageable.
>  
> Additionally, a snd_kcontrol structure can provide multiple control
> elements by its 'count' member. I call it 'control element set'. It can
> reduce allocation in kernel space. If the hardware in this case provides
> software interface to access to all source coefficients to one
> destination at once, it is suitable in the case.
The hardware interface is basically a command stream of "set" commands
for each individual mixer node, so there is no particular
dimension/grouping that is more optimal. You can send up to 64~128
arbitrary updates per 512-byte USB bulk packet (depending on whether you
have to allocate nodes or just update existing nodes).

Due to the max 2048 active node limitation, the driver is going to have
to process/diff bulk updates anyway regardless of the way we group them
(I will have to scan the new values, first update any zero values to
free up nodes, then update nonzero values, and bail with an error before
sending the update to the hardware if we run out of nodes). Hopefully
this will never happen in real-life scenarios, but it does mean that
some matrix mixer configurations are "illegal" and will be refused by
the driver, due to hardware limitations.

> For example, assuming the matrix mixer has 34 destination and 66
> sources, they can be expressed by 34 control elements with 66 array
> elements. A single snd_kcontrol structure can provide them, as long as
> they have the same nature. The control elements are identified by index
> value.

It took me a while to understand what you meant here, but I think I get
it: Using a single snd_kcontrol for the entire mixer, with 34 indexed
elements each taking 66 array values, right?

How do these kinds of controls show up in alsamixer and other userspace
mixer tools? Are they usable at all, or just with low-level access via
amixer/alsactl?

> Once I talked with Philippe Bekaert about the issue, then we found another
> issue about the way to distinguish both each control elements and the array
> members. The usage of ALSA control interface heavily relies on the name of
> control elements, while a single snd_kcontrol structure provides one name
> and all of the controls provided by it have the same name. We've
> investigated to use TLV (Type-Length-Array) function of ALSA control core
> to provide channel information about the sources and destinations, but no
> further work yet[1].

Yeah, that's another issue... these interfaces have fairly homogeneous
channels for the mixer, so it's not a big deal, but if we want to settle
on any particular standard for matrix mixers we're going to need some
way to inform userspace of what the numbered sources/destinations mean...

> I think it better to have another care that in this case we have restriction
> for the size of array; e.g. 128 array elements for integer (long) type of
> value. The restriction is not the matter in your case.

A related device (the MADIface USB, that I don't own but I can probably
support with some traces from someone who does) has, if I'm
understanding the manual correctly, up to a 192x128 mixer mode (128
hardware inputs + 64 playback inputs per output mix), so that would
exceed the maximum number of array elements. I could split each output
submix control into multiple array controls per input group to keep the
count under 128 for each, but that starts getting a bit weird and
arbitrary I think...

> 
>> The VU meter can be provided as volatile read-only controls, too.
>>
>> So from the API-wise POV, it'll be a most straightforward
>> implementation.
> 
> As a side note, the design of software interface for recent hardware
> requires floating point values for this kind of data, while it is not
> supported in ALSA control core and its userspace interface.

I don't know how the VU meter data works yet, but there's another issue
here with the mixer controls. This device uses a 1-bit scale selector
and a 14-bit value, basically a trivial floating point format with a
1-bit exponent. There is also a sign bit (can invert the phase of any
mixer node).

Effectively I have a linear gain between -0x10000 and 0x10000 where
0x8000 is 0dB and -0x8000 is 0dB(inverted), but for values outside of
the -0x3fff..0x3fff range, it loses 3 bits of LSB precision.

The inversion isn't really representable in a single control, right? So
I'd have to have a whole separate boolean matrix control set for the
sign bits, I think?

And then I need to figure out how to scale the values... if I use the
full range of 0..0x10000 then I can use DECLARE_TLV_DB_LINEAR to declare
how it maps to dB, and then I guess I would just have to truncate the
values sent to the hardware (when in the coarse range) but always keep
track of the control value in the driver, so userspace doesn't get
confused with "impossible" values? Of course that would be "lying" about
the hardware precision, since 8 possible values would map to the same
hardware volume at higher scales...

>From reading the alsa-lib code, I think I need to use TLV_DB_GAIN_MUTE
as the min gain and then that turns it into a linear control where 0 = mute?

I'm also a bit worried about being able to accurately represent
+0dB/unity (for bit-perfect passthrough), since ALSA uses 1/100th of a
dB as scale for the TLVs (I think?). x2 gain is +6.02(...) dB, but that
isn't enough significant digits to precisely map 0x8000 to 0dB:

>>> hex(int(0x10000 * (10**(-6.02 / 20))))
'0x8002'
>>> hex(int(0x10000 * (10**(-6.03 / 20))))
'0x7fdc'

So userspace that tries to use the TLV scale data to set "0dB" using the
simple API is unlikely to actually get precisely 0dB.

(This is also a problem for the output fader controls unrelated to the
matrix mixer, since they use the exact same scale encoding with inversion)

Maybe the driver should just use an arbitrary log dB TLV scale for the
controls and internally map to the hardware values? That means doing the
conversions internally and lying about precision at the lower end but at
least it would avoid rounding error when setting a gain to 0dB...

> 
>> OTOH, if you need more efficiency (e.g. the control access is way too
>> much overhead), it can be implemented freely via a hwdep device and
>> your own ioctls or mmaps, too.  But this is literally h/w dependent,
>> and the API becomes too specific, no other way than using own tool, as
>> a drawback.
> 
> [1] https://github.com/PhilippeBekaert/snd-hdspe/issues/13

There's one more thing I'd like to ask. Would it be useful for me to
submit just the streaming part of the device support upstream first
(which would work with the userspace app for config) and then worry
about designing the mixer control interface later? Or should it all be
done in one submission?

~~ Lina
