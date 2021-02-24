Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 666E9323AE7
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Feb 2021 11:57:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB6E0167C;
	Wed, 24 Feb 2021 11:56:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB6E0167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614164270;
	bh=tzVVj7ghbgttvKRprFKLG9iuiYQWdsHgw9HTRCetUXw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KfRl7fBBiYjbE3H+bpYragQzWJjrkM2B6NIKrSIE2CH74KQwmgh7IiqCxqDGIk1lP
	 Ym88Cp7a0KNmBeHbh5YwA7/gqUOlrxeMy5NbqB3MRqqDdZqDqiWmRMluhQEunOsxdZ
	 2ul9u7YBcWYnmrEZXc8Ld78QNOGCbffaZ+Xafijs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D8ABF8016C;
	Wed, 24 Feb 2021 11:56:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 111F0F8016C; Wed, 24 Feb 2021 11:56:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF3E6F800F2
 for <alsa-devel@alsa-project.org>; Wed, 24 Feb 2021 11:56:09 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id F005FA0046;
 Wed, 24 Feb 2021 11:56:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz F005FA0046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1614164169; bh=GF4aU5km6L2vjOgRmVP4klsH+png4ZM/0Ev8dxLdvOE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=5Rd5N29srKF8reT54yUHLsUm9NRVDPb010NxqCzLSnPp1gSumOlN4rhZLcD8tLTiL
 wkh9L0+kNnLTrL2eZI09RUeUTYooijLk2hyT09qUTtTnXSYB4sFqWkkoqcW9VZMLdk
 DciHi3GVNHFnMmcXM3nHaCPgonP9R5wHxCrYbUmI=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 24 Feb 2021 11:56:01 +0100 (CET)
Subject: Re: [RFC 2/2] ASoC: rt5670: Add LED trigger support
To: Takashi Iwai <tiwai@suse.de>
References: <20210215142419.308651-1-hdegoede@redhat.com>
 <20210215142419.308651-3-hdegoede@redhat.com>
 <20210223134506.GF5116@sirena.org.uk>
 <578b1ee3-f426-c5b5-bc78-5a91108ebdc8@redhat.com>
 <20210223140930.GH5116@sirena.org.uk> <s5h8s7evp8p.wl-tiwai@suse.de>
 <fc28d535-87a7-fbfd-89c7-992a537606bc@perex.cz>
 <s5hv9aiu55y.wl-tiwai@suse.de>
 <5c6a21c1-7107-3351-25be-c007b0b946d3@perex.cz>
 <s5hh7m2szwb.wl-tiwai@suse.de>
 <776b4ad9-2612-b08a-cb76-c3e1ce02388a@perex.cz>
 <s5h8s7du9tn.wl-tiwai@suse.de>
 <4574088a-4676-131a-0065-499a516f80ae@perex.cz>
 <s5h1rd5u7p4.wl-tiwai@suse.de>
 <03068e15-2157-3ae6-ffd6-7ec315bb49a3@perex.cz>
 <s5hv9ahsqkj.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <e7de1dd2-199e-9e07-65a4-2a2eb2b46b49@perex.cz>
Date: Wed, 24 Feb 2021 11:56:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <s5hv9ahsqkj.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bard.liao@intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 24. 02. 21 v 11:33 Takashi Iwai napsal(a):
> On Wed, 24 Feb 2021 10:49:41 +0100,
> Jaroslav Kysela wrote:
>>
>> Dne 24. 02. 21 v 10:38 Takashi Iwai napsal(a):
>>
>>>> It seems that you misunderstood the number of issues which my code is trying
>>>> to resolve:
>>>>
>>>> 1) set LED based on state from multiple cards (so you cannot trigger LED
>>>> inside single driver / single control element); we need one arbiter; this is
>>>> the main argument
>>>> 2) unifies the audio LED interface
>>>> 3) reduce the hardware driver code
>>>
>>> Those purposes are all fine.  But they don't need to be exposed for
>>> user controls that can be abused.  That's the very concern.
>>
>> So, how to handle this feature for AMD ACP without PA / PipeWire modifications?
>>
>> And if we add an user space channel to the audio LED arbiter code, how it
>> differs from my proposed control API extension?
> 
> As the early patch does, creating a kernel control (but not a generic
> "Capture" switch but specific to LED) and control it in UCM profile.
> What's the practical problem there?  That's what I might have missed
> as the starting point of the discussion.

UCM is just a database which does not do any state management for those
controls. I've not found a simple way to create an arbiter for UCM without
adding more layers to this API. Yes, we have enable/disable sequences, but for
LED, you need to create "group" of devices and do the OR state management:

Current device enable/disable scheme:

  Device1 -> enable (LED off)
  Device2 -> enable (LED off)
  Device2 -> disable (LED on) --- but Device1 is on, so LED should be off

  ... LED off - set LED control to off
  ... LED on - set LED control to on

Even the current mechanism fails here, we don't look into the mute switch
value in UCM at the moment, so the LED will reflect only device use - not the
mute switch. So, as you see, UCM does not cover this. It's just used to
activate and deactivate paths, but there's no state management (except for the
device on/off).

And, it will work only for UCM not for the standard/legacy ALSA setup.

Those are reasons for which I ruled out the UCM for the LED control.

>> We have already locking
>> mechanism for the user control element to one task, so it's possible to create
>> safe user space implementation (depending on the standard task priviledges) on
>> demand even with my proposal.
>>
>> Could you elaborate the abuse you mean? Three bits?
> 
> You can create up to 1028 user controls per card and each of them can
> fire the led trigger...  That's an interesting experiment :)
> 
> So far, a user control is merely storing the value, let read/write via
> the control API.  That's all, and nothing wrong can happen just by
> that.  Now if it interacts with other subsystem...
> 
> A more serious concern is rather the fragility of the setup; for
> enabling the mute LED control, you'd have to create a new user-space
> control, the function of the control has to be ignored by some
> application and some not, etc.  This has to be done on each machine

You're using "ignore", but as I explained before, the user space switch will
be used in the whole chain:

capture stream ->
  alsa-lib mute switch / silence PCM stream ->
  PA mute switch / silence PCM stream

So PA can use this switch like the traditional hardware mute switch.

And we cannot do much in the user space for a better mute support here.

> when the system got updated.  And, not everyone is using alsa-lib.
> Does tiny ALSA and other existing backend support the user control
> element management?  Some uncertainty here.

It's not an argument. Tiny alsa library does not have all features from
alsa-lib. Nobody is restricted to follow the similar mechanism.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
