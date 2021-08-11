Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E403D3E9271
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Aug 2021 15:20:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 840001763;
	Wed, 11 Aug 2021 15:19:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 840001763
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628688024;
	bh=WXwsag3nSjne81+NsWCNdU+TUMAUlJMkrz9ypNm603k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dF8le0nYF1YZpqevZ74LNhSIA6/PEPbfQ2xYiaaGF6uk2ZafW0G2lQaIcwsWWMFA/
	 OJIOaNXcKMyZqnGOFA5D6vqj72sm3k7//Rp1XpsOnB/7c01v0HKaV+7+MWqKFMM8FE
	 +EYRyJxQ/YiIY/WB2kQ44Q4RPrRfoHAbgJv0HMV8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E43C5F800F4;
	Wed, 11 Aug 2021 15:18:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDAF6F802D2; Wed, 11 Aug 2021 15:18:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6649CF800F4
 for <alsa-devel@alsa-project.org>; Wed, 11 Aug 2021 15:18:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6649CF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mlZycOyD"
Received: by mail-lf1-x130.google.com with SMTP id x27so5675458lfu.5
 for <alsa-devel@alsa-project.org>; Wed, 11 Aug 2021 06:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6kHCOipcjZXWmpo3HZhEMRyqVY8BxVQo5dObADAmxsY=;
 b=mlZycOyDjS0LQHewOGJq54kzmcwWqvlJVNq11HE5HgNAzxkBrMYxLhx+4ouRpKp8fX
 dCBUxUPha/98WxKo2m/kZHIp0jFUo+b8T+HNc5N7gOlbpPyj779HMso9ZAb4ykmsLc+B
 LF8ee8YH8QRD3wLC2E5gOr9txV/ixiMN4SwE4+3XIn5mHcA/Umw5LaK3UE1G6zOfNKO8
 UAPKRyydUzFdxdtdN8ClwtCOFlwn7pR/axz9eLSTXTIBMUZbwLHwcwXnNq6+1LBVcNkP
 71vzTwzM4rGYnJc5DA0cqZ1sw5XSxXFqd1OKzfk4hhswjQBur8iQLXwv9ArNoZppjHEZ
 PRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6kHCOipcjZXWmpo3HZhEMRyqVY8BxVQo5dObADAmxsY=;
 b=oXucpjE1LTIzXVwfppdSaDKrFatzjK6ONSGorPR2IpBGnHBjlW6/4IAqf5xa6hZjLr
 A5SlH68qQ8I/ZO+QvPsKv1N83ujyzUp/76Jx/kpgYm+ckjERYVAPZzAif2el2WLjCutC
 B22l3yXFNqIKKBhooXptLWG9HjJ9aB+A3xnBA2GpKKhVWAHyE/NFE9AVQCPbD0vP/opo
 rDI/dyjk+FgmUs8oELNGKenP5HLdPhHSO74yzvbT+U9oRAhuJxhCF79m5+/st0hcVTJ9
 yCplnfaFxgH4Hp0E51lWgnjMSeGqR3UZNR/IKv3Zn75Vu1ima+P+SCyd9yz6SuLNaXOL
 3tnw==
X-Gm-Message-State: AOAM531X1kplXipkYvtjL2ZfrjzDViwtFDOh45/vjhFQxMGq69FpPJEd
 FClCJd7nuXsVaSsEY/m399fVR2ViOFqsAC0AS7s=
X-Google-Smtp-Source: ABdhPJziB6KFxpa67eSH3zBrs9TUw30rTGO3+bApDge1fl9VbSihlN0yFZCa8fXe2RjD+T3fyNYskaBLbsPaaX3JXw8=
X-Received: by 2002:ac2:4205:: with SMTP id y5mr6953636lfh.512.1628687921400; 
 Wed, 11 Aug 2021 06:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAHhAz+hQBnUVWBnoQO6y44C-G5CnZdFLJ7v738_Y5Rt6AZSkrA@mail.gmail.com>
 <41bebccc-7940-8379-0108-047bd1cc92f9@perex.cz>
 <CACk2A5ZcrVTv4AVHdmRDh-xWkx=1BHi6SV8yYqX1Z2DzcDR8hA@mail.gmail.com>
In-Reply-To: <CACk2A5ZcrVTv4AVHdmRDh-xWkx=1BHi6SV8yYqX1Z2DzcDR8hA@mail.gmail.com>
From: Muni Sekhar <munisekharrms@gmail.com>
Date: Wed, 11 Aug 2021 18:48:29 +0530
Message-ID: <CAHhAz+gD-UtvXgsWnWx8yPwMbpY4R-ZJqPg9TNNF+iZrmKxQSA@mail.gmail.com>
Subject: Re: USB-Audio: Device or resource busy (strace log)
To: vishnu <vardhanraj4143@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel <alsa-devel@alsa-project.org>,
 kernelnewbies <kernelnewbies@kernelnewbies.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
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

On Wed, Aug 11, 2021 at 6:19 PM vishnu <vardhanraj4143@gmail.com> wrote:
>
> can you paste output of
> arecord -l (list of capture devices).
$ arecord -l
**** List of CAPTURE Hardware Devices ****
card 0: USB [Plantronics .Audio 628 USB], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0


> Which device you are using and os.
> Does this instance is already open by default? like any video playing or something like that?
lsof does not catch it.

>
> Yes you can stop pulse audio and try..
>
> On Wed, Aug 11, 2021 at 6:17 PM Jaroslav Kysela <perex@perex.cz> wrote:
>>
>> On 11. 08. 21 14:36, Muni Sekhar wrote:
>> > Hi All,
>> >
>> > $ cat /proc/asound/cards
>> >  0 [USB            ]: USB-Audio - Plantronics .Audio 628 USB
>> >                       Plantronics Plantronics .Audio 628 USB at
>> > usb-0000:00:14.0-2, full speed
>> >
>> > I am using a Plantronics USB Audio headset.
>> >
>> > $ arecord --device hw:0,0 --channels 2 --format S16_LE --rate 44100Hz x.wav
>> > arecord: main:722: audio open error: Device or resource busy
>> >
>> >
>> > 'arecord' command always fails the first time after system boot in my
>> > system. But subsequent execution of the 'arecord' command runs fine.
>> >
>> >
>> > I've attached the strace log for the "audio open error: Device or
>> > resource busy" failure. Is there any fix available for this issue?
>>
>> You may check which other task blocks the PCM device:
>>
>>   lsof /dev/snd/pcmC0D0c
It does not output any process.
$ lsof /dev/snd/pcmC0D0c

1st run:
----------
$ arecord --device hw:0,0 --channels 2 --format S16_LE --rate 44100Hz x.wav
arecord: main:722: audio open error: Device or resource busy

2nd run:
----------
$ arecord --device hw:0,0 --channels 2 --format S16_LE --rate 44100Hz x.wav
Recording WAVE 'x.wav' : Signed 16 bit Little Endian, Rate 44100 Hz, Stereo
^CAborted by signal Interrupt...


>>
>> I guess that it will be pulseaudio (device enumeration).
>>
>>                                         Jaroslav
>>
>> --
>> Jaroslav Kysela <perex@perex.cz>
>> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.



-- 
Thanks,
Sekhar
