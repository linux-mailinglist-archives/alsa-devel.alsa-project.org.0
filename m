Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CAA28E419
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Oct 2020 18:13:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93AB61754;
	Wed, 14 Oct 2020 18:12:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93AB61754
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602692018;
	bh=teZ/KIk8PDExpoNrgBbaowBHaxPG3Bul6/nX0eB9HLI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U9xwkLfnKJidt472rTnHP4GhPgeTbJst02Mgba0W1LUkB09+YuGooPx+kLeej/JQn
	 9NylQvdneGcCV66/cGd6M28k20LRXX6nfhHQXKk28XgkLEf6VRjpZid0rrL9B94One
	 ICedHF+b41T6u5Qnxs6SiHQLQfK8dRoAnsLzZNUM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B1B4F80260;
	Wed, 14 Oct 2020 18:12:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BA40F80225; Wed, 14 Oct 2020 18:12:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF06DF800F6
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 18:12:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF06DF800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nostatic-org.20150623.gappssmtp.com
 header.i=@nostatic-org.20150623.gappssmtp.com header.b="dOGhQEOH"
Received: by mail-yb1-xb41.google.com with SMTP id s89so3072740ybi.12
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 09:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nostatic-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4IEZfdjF/3gJsQUpkZU9vmq/3E+345IlbYQVHG3JXUQ=;
 b=dOGhQEOHn/fgXMHEi7ASX/jyCHOKodPfHtoKCkxxi9VhAEKcBmjj0th5ecfHdFYFlY
 CTYgeh7ol831zZQ81kH+1gXlqMqmk75ftK92yRROHP2cK5BBwZCtcd/F3KMZI93bywoc
 8FMq5hyDe/6egzSI9Vjoidi7YXWVW47Gm0UsTDpKcj8YYIoy1i+CLOyfagq4LlylMYZ3
 eLCPmYSn1bBF4i98ZuRgq/yH31g6yMW+wKnUTb298eTnmHiZqrp/W4smlHUyZM8JqowB
 hP75W2PdYWwedb7q4SYKqicndxvxfgl1cnVEj9ojp3y0zyk4LeV2y6yXRhtWMUUY547Y
 sp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4IEZfdjF/3gJsQUpkZU9vmq/3E+345IlbYQVHG3JXUQ=;
 b=ami0AHbR1S19k80xvIL46eR98Au7j/0MF6kVd25wcpVnINjqy4ceNmJprG3yKXKWHG
 XgPwW3eyKBIMj17WO6oPVl9bcgtOteyVGgU8AEsH46SolS7XUdIhCv9vYUpWHhU6h51h
 Yj+6zri8aD+0L5FPOmD6P4tttn0OAeH6VnqNXmqnYJgh/IyGUnXC8x4BRhlYk768vIbJ
 Kq/MZqyUJD2Yj5i2m0yxhC9xm/7vxVZxFaiXFqcO+MjsSf1SUQUvR8KBNi4EYA0qrkQ6
 0+LFweCi3e8XX/yHC9y4LmWGua7ioYvCQ+0eACJgmgoiFY9llYDovHgtAN1dsyji9x3Q
 AVzw==
X-Gm-Message-State: AOAM532tlISGkMUBK4UQEaPp/6073yd3vHJtiFiiimuS4OcKbdyuE0Wo
 VlEBfCubtcnlMVdLu0IvLb9Ne+geZi8Mua29FvBjaA==
X-Google-Smtp-Source: ABdhPJzvAsScMI1PGYNYkNoXzsWq2rbttWeN9Y9CzbZqNPGtSn/DrNhoPaXoHCmy8DGwLt6tj47fyqQPsfbG57HFk2E=
X-Received: by 2002:a05:6902:6a6:: with SMTP id j6mr63836ybt.383.1602691924940; 
 Wed, 14 Oct 2020 09:12:04 -0700 (PDT)
MIME-Version: 1.0
References: <20191011171937.8013-1-szszoke.code@gmail.com>
 <s5hftjriy1q.wl-tiwai@suse.de>
 <CAPMdQDmY7CdbrHyOwhJNFBREQ0EO1SKufRdN_YR6TG4zmJzXpA@mail.gmail.com>
 <CAHXb3bf+0uKS-+aEVsgebUbYPt1wCBZ7GLAjF57BrPDHcveuQQ@mail.gmail.com>
 <CAPMdQDmE3cgu2whqTxf7pFUoQusUYJKK7xLASev8JdWD-9oypQ@mail.gmail.com>
In-Reply-To: <CAPMdQDmE3cgu2whqTxf7pFUoQusUYJKK7xLASev8JdWD-9oypQ@mail.gmail.com>
From: Mike Oliphant <oliphant@nostatic.org>
Date: Wed, 14 Oct 2020 09:11:56 -0700
Message-ID: <CAHXb3bdrPC_v0oAEkWDR-VH7NZ3uoFdSw-dzNo_Fwy8HzeTopA@mail.gmail.com>
Subject: Re: [alsa-devel] [PATCH] ALSA: usb-audio: Disable quirks for BOSS
 Katana amplifiers
To: Mailing Lists <maillist@superlative.org>
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

Keith - are you getting an implicit feedback endpoint created when you run
with the patch?

When I patched the GT-1 device ID into the quirk code, I ended up with no
implicit feedback endpoint created. Without running in implicit feedback
mode, I assume that you are relying on how well the clocks match. In my
case, my card's clock was a bit fast. If I hardcoded the sample rate in
'sound/usb/format.c' to 44105, my pops and crackles mostly went away - more
like every few minutes instead of every few seconds.

Maybe your card just has a clock closer to 44100? Or, as I said in my last
message, maybe something else has changed in the kernel since earlier this
year?

Mike

On Wed, Oct 14, 2020 at 8:35 AM Mailing Lists <maillist@superlative.org>
wrote:

> Hi Mike,
> That's odd. I've been using the patches in this thread with both my GT-00=
1
> and my GT-1 with no issues for a few weeks now. Of course that might be
> pure dumb luck and differences in hardware, interrupts, and so on.
>
> Cheers,
>
> Keith
>
> On Wed, 14 Oct 2020 at 16:19, Mike Oliphant <oliphant@nostatic.org> wrote=
:
>
>> When I tried this change earlier this year on the BOSS GT-1, it enabled
>> sound output on the card (which was not previously working), but with
>> significant issues. It resulted in frequent pops and crackles - presumab=
ly
>> because of the loss of synchronization using implicit feedback.
>>
>> This was the fix that ended up working for me:
>>
>>
>> https://mailman.alsa-project.org/pipermail/alsa-devel/2020-January/16195=
1.html
>>
>> But maybe something else has changed in the handling of implicit feedbac=
k
>> since then?
>>
>> Mike
>>
>> On Wed, Oct 14, 2020 at 5:17 AM Mailing Lists <maillist@superlative.org>
>> wrote:
>>
>>> Following up on this, it appears there are a bunch of the
>>> newer-generation Roland/Boss devices which need similar treatment.
>>>
>>> So far I have tested the GT-1, the GT-001, and the BR-80, and others
>>> have reported the RC-300 as working with similar modifications. I have =
been
>>> using the following change to the code in pcm.c
>>> set_sync_ep_implicit_fb_quirk:
>>>
>>>     case USB_ID(0x0582, 0x01d8): /* BOSS Katana */
>>>     case USB_ID(0x0582, 0x0130): /* BOSS Micro BR-80 */
>>>     case USB_ID(0x0582, 0x0138): /* BOSS RC-300 */
>>>     case USB_ID(0x0582, 0x01d6): /* BOSS GT-1 */
>>>     case USB_ID(0x0582, 0x01e5): /* BOSS GT-001 */
>>> /* BOSS Katana amplifiers and many other newer BOSS devices do not need
>>> quirks */
>>>
>>> There's probably others too, such as the GT-100 (I believe the GT-001
>>> and GT-100 have similar hardware).
>>>
>>> My question is, should this just be submitted as a patch to pcm.c or
>>> would it be better handled in quirks and, if so, how?
>>>
>>> Or something else?
>>>
>>> Personally, I dislike the approach of hard-coding exceptions into core
>>> code as it seems that's what quirks are there for, but there seems to b=
e a
>>> whole bunch of exceptions in there already.
>>>
>>> Cheers,
>>>
>>> Keith
>>>
>>> On Thu, 17 Oct 2019 at 09:20, Takashi Iwai <tiwai@suse.de> wrote:
>>>
>>>> On Fri, 11 Oct 2019 19:19:36 +0200,
>>>> Szabolcs Sz=C5=91ke wrote:
>>>> >
>>>> > BOSS Katana amplifiers cannot be used for recording or playback if
>>>> quirks
>>>> > are applied
>>>> >
>>>> > BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=3D195223
>>>> > Signed-off-by: Szabolcs Sz=C5=91ke <szszoke.code@gmail.com>
>>>>
>>>> Applied now.  Thanks.
>>>>
>>>>
>>>> Takashi
>>>>
>>>> >
>>>> > ---
>>>> >  sound/usb/pcm.c | 3 +++
>>>> >  1 file changed, 3 insertions(+)
>>>> >
>>>> > diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
>>>> > index 33cd26763c0e..daadb0c66eee 100644
>>>> > --- a/sound/usb/pcm.c
>>>> > +++ b/sound/usb/pcm.c
>>>> > @@ -348,6 +348,9 @@ static int set_sync_ep_implicit_fb_quirk(struct
>>>> snd_usb_substream *subs,
>>>> >               ep =3D 0x84;
>>>> >               ifnum =3D 0;
>>>> >               goto add_sync_ep_from_ifnum;
>>>> > +     case USB_ID(0x0582, 0x01d8): /* BOSS Katana */
>>>> > +             /* BOSS Katana amplifiers do not need quirks */
>>>> > +             return 0;
>>>> >       }
>>>> >
>>>> >       if (attr =3D=3D USB_ENDPOINT_SYNC_ASYNC &&
>>>> > --
>>>> > 2.20.1
>>>> >
>>>> _______________________________________________
>>>> Alsa-devel mailing list
>>>> Alsa-devel@alsa-project.org
>>>> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
>>>>
>>>
>>>
>>> --
>>> --
>>> Keith A Milner
>>>
>>
>
> --
> --
> Keith A Milner
>
