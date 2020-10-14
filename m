Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD1E28E360
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Oct 2020 17:37:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D79DC1741;
	Wed, 14 Oct 2020 17:36:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D79DC1741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602689835;
	bh=djeAU4sO95uDTtxw28n0+45OFiaamDGeEQ6Zayf5NKU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NFfv1ydLcbbz0ioLc3AzTcznspAF3A6ed0LE38ShsVYc30oQDSS1lSLmvwTUQdYPL
	 4dzp0swAFFBQWiZ/+LN5Wu5t11j3vA0NxOUCuah3Fl0tuGxmBt8cfiDGsdnq8jQ6EN
	 2SzcBoWN3+MhtkY7Y8bBg0FUPTECpgSt/tDrp8So=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F0BCF8021D;
	Wed, 14 Oct 2020 17:35:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98B45F80217; Wed, 14 Oct 2020 17:35:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1612DF8012B
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 17:35:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1612DF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=superlative.org header.i=@superlative.org
 header.b="azSMVMUX"
Received: by mail-oi1-x242.google.com with SMTP id w141so3671589oia.2
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 08:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=superlative.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w+hFOfldH59cu+z3L7/4WVGslhqUI7VQRFcF+f924hc=;
 b=azSMVMUXJqQOShST3F0gYcA54s/l5KZaFvzRU4+kHIHDamQBKwFWzWUl61K8BrMFUO
 LFhEB93YvkCWTruHpAnrAiA8Mc+fBkqTlO6WbdFRPJ85wBnn8rnuxliSTxz2upq50KPx
 qFCl9+GIm3ucbqmqnl8Bdq1N6GgVk5FQYq2QNya6QJ9hSw7DXFSDCn3OlhpIlXKsp3/D
 6izomzAPk6iOnZN07m8uzlm4XOI3STaIwarSNQIDsqs1+QmjtENK54p0IdyhHGCtGmww
 LF94i7ULD6qdUhI9rL5fViJVj1rpbEdtk/bHguMrKfh+pD3SYdhK2BG2kcbXVQS6OG6p
 +xJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w+hFOfldH59cu+z3L7/4WVGslhqUI7VQRFcF+f924hc=;
 b=dALkCb9ioV5+Ws+KQF4Di+5EYZ38uFF7BumcAXw3qkZ2voBH8GD0ruNV0+cIRkOsLY
 Jf5YtcRn+47mL0AKwdo3rBXWbbbI7y4HifBhjkP5TRrfP1c7eiB9FKu4cSe/f+vwBluX
 qsQIqwOKCLivQz/RAVyLe/NGRVOlugvawqHfDFoayqkqfRO3HzDhcMynOJ8Nfw4EMd4T
 fw45B0wKC0IvOdawA+uNpUkORbtk9F4jj8rIdEHySThvvHKxDMJgTEuslQnPAZRyJfBR
 OFXvXCsCCyPGhv9cBPiyCntkvSDYbTD8bWMjqbyd9UW9e6VJ1gbbDkQiOEjdXmkNbUTn
 VHrA==
X-Gm-Message-State: AOAM531MLMQHa27VvB65zAceAvIh+8MfVixS2SChiNhq2FkXLg199B/w
 W6r1G4GNH+9wI0APdnLxLCzbqmPtTX34L8KZ+qM0Og==
X-Google-Smtp-Source: ABdhPJz1j+he7JmtjPlacBUMb6Yho/s0Bm1FAUxMsUJ0U8wzsvHu9N8rY8JYKmGSLsbVH18Qg+3RF4DNrfrw2rYVgoQ=
X-Received: by 2002:aca:5903:: with SMTP id n3mr2664562oib.159.1602689720133; 
 Wed, 14 Oct 2020 08:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20191011171937.8013-1-szszoke.code@gmail.com>
 <s5hftjriy1q.wl-tiwai@suse.de>
 <CAPMdQDmY7CdbrHyOwhJNFBREQ0EO1SKufRdN_YR6TG4zmJzXpA@mail.gmail.com>
 <CAHXb3bf+0uKS-+aEVsgebUbYPt1wCBZ7GLAjF57BrPDHcveuQQ@mail.gmail.com>
In-Reply-To: <CAHXb3bf+0uKS-+aEVsgebUbYPt1wCBZ7GLAjF57BrPDHcveuQQ@mail.gmail.com>
From: Mailing Lists <maillist@superlative.org>
Date: Wed, 14 Oct 2020 16:35:09 +0100
Message-ID: <CAPMdQDmE3cgu2whqTxf7pFUoQusUYJKK7xLASev8JdWD-9oypQ@mail.gmail.com>
Subject: Re: [alsa-devel] [PATCH] ALSA: usb-audio: Disable quirks for BOSS
 Katana amplifiers
To: Mike Oliphant <oliphant@nostatic.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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

Hi Mike,
That's odd. I've been using the patches in this thread with both my GT-001
and my GT-1 with no issues for a few weeks now. Of course that might be
pure dumb luck and differences in hardware, interrupts, and so on.

Cheers,

Keith

On Wed, 14 Oct 2020 at 16:19, Mike Oliphant <oliphant@nostatic.org> wrote:

> When I tried this change earlier this year on the BOSS GT-1, it enabled
> sound output on the card (which was not previously working), but with
> significant issues. It resulted in frequent pops and crackles - presumabl=
y
> because of the loss of synchronization using implicit feedback.
>
> This was the fix that ended up working for me:
>
>
> https://mailman.alsa-project.org/pipermail/alsa-devel/2020-January/161951=
.html
>
> But maybe something else has changed in the handling of implicit feedback
> since then?
>
> Mike
>
> On Wed, Oct 14, 2020 at 5:17 AM Mailing Lists <maillist@superlative.org>
> wrote:
>
>> Following up on this, it appears there are a bunch of the
>> newer-generation Roland/Boss devices which need similar treatment.
>>
>> So far I have tested the GT-1, the GT-001, and the BR-80, and others hav=
e
>> reported the RC-300 as working with similar modifications. I have been
>> using the following change to the code in pcm.c
>> set_sync_ep_implicit_fb_quirk:
>>
>>     case USB_ID(0x0582, 0x01d8): /* BOSS Katana */
>>     case USB_ID(0x0582, 0x0130): /* BOSS Micro BR-80 */
>>     case USB_ID(0x0582, 0x0138): /* BOSS RC-300 */
>>     case USB_ID(0x0582, 0x01d6): /* BOSS GT-1 */
>>     case USB_ID(0x0582, 0x01e5): /* BOSS GT-001 */
>> /* BOSS Katana amplifiers and many other newer BOSS devices do not need
>> quirks */
>>
>> There's probably others too, such as the GT-100 (I believe the GT-001 an=
d
>> GT-100 have similar hardware).
>>
>> My question is, should this just be submitted as a patch to pcm.c or
>> would it be better handled in quirks and, if so, how?
>>
>> Or something else?
>>
>> Personally, I dislike the approach of hard-coding exceptions into core
>> code as it seems that's what quirks are there for, but there seems to be=
 a
>> whole bunch of exceptions in there already.
>>
>> Cheers,
>>
>> Keith
>>
>> On Thu, 17 Oct 2019 at 09:20, Takashi Iwai <tiwai@suse.de> wrote:
>>
>>> On Fri, 11 Oct 2019 19:19:36 +0200,
>>> Szabolcs Sz=C5=91ke wrote:
>>> >
>>> > BOSS Katana amplifiers cannot be used for recording or playback if
>>> quirks
>>> > are applied
>>> >
>>> > BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=3D195223
>>> > Signed-off-by: Szabolcs Sz=C5=91ke <szszoke.code@gmail.com>
>>>
>>> Applied now.  Thanks.
>>>
>>>
>>> Takashi
>>>
>>> >
>>> > ---
>>> >  sound/usb/pcm.c | 3 +++
>>> >  1 file changed, 3 insertions(+)
>>> >
>>> > diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
>>> > index 33cd26763c0e..daadb0c66eee 100644
>>> > --- a/sound/usb/pcm.c
>>> > +++ b/sound/usb/pcm.c
>>> > @@ -348,6 +348,9 @@ static int set_sync_ep_implicit_fb_quirk(struct
>>> snd_usb_substream *subs,
>>> >               ep =3D 0x84;
>>> >               ifnum =3D 0;
>>> >               goto add_sync_ep_from_ifnum;
>>> > +     case USB_ID(0x0582, 0x01d8): /* BOSS Katana */
>>> > +             /* BOSS Katana amplifiers do not need quirks */
>>> > +             return 0;
>>> >       }
>>> >
>>> >       if (attr =3D=3D USB_ENDPOINT_SYNC_ASYNC &&
>>> > --
>>> > 2.20.1
>>> >
>>> _______________________________________________
>>> Alsa-devel mailing list
>>> Alsa-devel@alsa-project.org
>>> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
>>>
>>
>>
>> --
>> --
>> Keith A Milner
>>
>

--=20
--=20
Keith A Milner
