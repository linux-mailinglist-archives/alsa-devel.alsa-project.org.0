Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 499DD313920
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 17:18:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3496169B;
	Mon,  8 Feb 2021 17:18:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3496169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612801136;
	bh=AHxAjaRM9Rp/UTfNCHhLRgGM9Vx4g7k9LhbRdSnhI5s=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZZu11+SOn9W9Pl/YlNxlVC6PeGPx86q9avIOQu1KYHDRlxJGTGEze7kkQ81ja+Bjp
	 ZGpsXuIK/xWMnQYrXQK+KOCVNSR4TuZ49xfSmisfPEtc5V/W062IYPlt8+zTdT0r08
	 tJUNbWFEUNBuwhJR4w765uyGU9BkE/UFmyJyPbSA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0E65F8028B;
	Mon,  8 Feb 2021 17:17:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 869A6F8027C; Mon,  8 Feb 2021 17:17:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5D2BF80277
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 17:17:39 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id DD6E4A0040;
 Mon,  8 Feb 2021 17:17:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz DD6E4A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1612801053; bh=m7SIBkKLsazEHy7ONU3dwueRp1h2KiM8SslMSe7Ljys=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=B4DJ6vX2xp9YIw5yAoWNy2YhMIUfgn0RcCi1v2Zzb8IosyUUzwGuplXgtdM5o6GkM
 zjiaAlSw4o2AP3Z7VdA+QsJ/YhEtZbyih8SY1kow9EFFFxax0m2vnDsz/HgHyguOuL
 1pm37TrZTkFzZh6Ffontn2GJK39E7mogSW3u6gD0=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  8 Feb 2021 17:17:29 +0100 (CET)
Subject: Re: [PATCH] [RFC] ALSA: control - add generic LED API to sound core
 routines
To: Takashi Iwai <tiwai@suse.de>
References: <20210207201157.869972-1-perex@perex.cz>
 <s5him72y4q0.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <3bc1b151-68ce-8408-aff1-aeba2e6fe4c3@perex.cz>
Date: Mon, 8 Feb 2021 17:17:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <s5him72y4q0.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Hans de Goede <hdegoede@redhat.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Perry Yuan <Perry.Yuan@dell.com>
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

Dne 08. 02. 21 v 16:11 Takashi Iwai napsal(a):
> On Sun, 07 Feb 2021 21:11:57 +0100,
> Jaroslav Kysela wrote:
>>
>> [DO NOT MERGE!]
>> [This is just an early proposal for comments]
>> [The code is not tested / debugged]
>>
>> The recent laptops have usually two LEDs assigned to reflect
>> the speaker and microphone mute state. This implementation
>> adds a tiny layer on top of the control API which calculates
>> the state for those LEDs using the driver callbacks.
>>
>> Two new access flags are introduced to describe the controls
>> which affects the audio path settings (an easy path for drivers).
>>
>> The LED resource can be shared with multiple sound cards with
>> this code. The user space controls may be added to the state
>> chain, too.
>>
>> This code should replace the LED code in the HDA driver and
>> add a possibility to easy extend the other drivers (ASoC
>> codecs etc.).
> 
> Having a common helper in the ALSA core sounds like a good way to go.
> 
> My slight concern is that this will end up having the dependency on
> LEDS stuff unconditionally when CONFIG_SND_LED=y.

You probably mean that the LEDs subsystem is activated even if we don't have
audio LED class driver connected, right?

I think that the HDA way (select conditionally the LED code) in the low-level
driver Kconfig is good, but I'm open for any other suggestions.

> Also, are those new access flags exposed to user-space intentionally,
> so that user-space gets some information?

Yes, it's one benefit, the second benefit is that we can create user space
controls for hardware which does not have any switch / volume controls for the
given path.

An example is the AMD ACP bridge with the simple digital microphones. We can
use alsa-lib's softvol plugin to control the volume for this and it would be
nice to mark this user space control with the mic mute LED flag.

> Last but not least: I'm not sure whether we should limit to only two
> LEDs (mic and spk).  I'm afraid that there will be more LEDs in
> future; people love decorations :)

We have some more free bits in the access field. If the LED count will
increase in future for the standard hardware, we should reconsider the
implementation (info callback or so).

Perhaps, it may be clever to reserve three bits from the access flags now (to
create a three bit value not a mask). In this case, we can carry information
for 7 LED types (assuming that one control element can be assigned only to one
LED type).

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
