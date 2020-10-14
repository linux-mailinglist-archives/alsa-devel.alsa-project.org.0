Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3535028E329
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Oct 2020 17:21:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2109169E;
	Wed, 14 Oct 2020 17:20:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2109169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602688895;
	bh=HXv1DYFPawx5liwksaogTsfIjJWZwsAIljVLeXa9DhU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eLN1hHDRkylt2EM1hcp4vP9IgB9a2HxnwI8S/+f/T78JWZfZXmv5Ip0YAC8ArO6x8
	 vzQtSieQgfwlRXppQ3xG2DyhiAMoi1awN9iRfDrYTHm5CPCIl9ExvmbF7jLhaZgBe7
	 bmTc68/KTByt/mL1BvnE+eRhnQ01C3SK8cmicv7k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7578DF800F6;
	Wed, 14 Oct 2020 17:19:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4224AF80217; Wed, 14 Oct 2020 17:19:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A973F800F6
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 17:19:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A973F800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nostatic-org.20150623.gappssmtp.com
 header.i=@nostatic-org.20150623.gappssmtp.com header.b="fnfT8sXc"
Received: by mail-yb1-xb41.google.com with SMTP id l15so2975908ybp.2
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 08:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nostatic-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kbg1X6+NY/VDH+IJUtKICNwKR+XIAIOie9LVQL4dL/s=;
 b=fnfT8sXcEkhPSUkTknRC1TbI5v6rdolfn5utv4w2pOjCnTZi6P7RLt716E+a5I/wha
 /hw+26bzgpvK5oN1OystHmwGvqm/jcPp2TycPfFdh0NXTGiIXnO5YNfVA2oUtOWO4d8r
 zEAnPZrXrGpyLActa/NqwIK1iS2JHLTyuRPmvgGsBSBVc+b109S/aamIdRqGvYyTJAGX
 f8oTuUSOKPasJigEs11Vr9+HH2ppBDosOelZI0mscZHT5QS2tIRQnzKGmCu4h4qB63iL
 rVICD4lTyOtLogOwcrZyhlJlh9rGV9Nj0tjvp18T9t+h1IAC2EzxHjQqHGovKvt1/oCB
 Jasg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kbg1X6+NY/VDH+IJUtKICNwKR+XIAIOie9LVQL4dL/s=;
 b=bUaCyZwsG6f/XRr+RmIsnVvK93pEVql/1LYHBwbotw2ouqlJkm+oP69ILPzHMFxRto
 rfYZhu0+42WJm8wlKe+nbnMKM7WhGBS4HaCvc5O2gFYbSANLMjAR6kPbGJ4+Wx/KJqOg
 9atksLxWLNtQZu+9/ZrvxIuKcDLOqQ76VwzeflDWSLsYUxavczEGRAKNGX4JzqBwRWs8
 1niiaDhrItIqknm6VY+7GD/FUUMGLqjdr9GJFOpqPldGpzRXZA+ANDjY62nPBK1UA6vU
 T3jmFkMbNY45gdlDR5PPUK4w0YbqK6LDe3csILMuyeX3Xk+nywn7No/Om+DQuWMj7m/I
 NXPw==
X-Gm-Message-State: AOAM532CrmC36u4JCS2q2Qz0wdPKtQd12ZOS54ixWGz8OfsIg4V3qUfS
 1HnV+vUyfV3hZ8jDQ7pJuGfZJo8rQV7f+NmwaC7CQA==
X-Google-Smtp-Source: ABdhPJxGh+ihRVAPepx56/RFwmv2W82ABXELeQkqzkDK/1o77F+l+aXHktqwPkkLrp8i5xTQfegcQfwlv7NT0jI8opg=
X-Received: by 2002:a25:7ac3:: with SMTP id v186mr1439753ybc.160.1602688784600; 
 Wed, 14 Oct 2020 08:19:44 -0700 (PDT)
MIME-Version: 1.0
References: <20191011171937.8013-1-szszoke.code@gmail.com>
 <s5hftjriy1q.wl-tiwai@suse.de>
 <CAPMdQDmY7CdbrHyOwhJNFBREQ0EO1SKufRdN_YR6TG4zmJzXpA@mail.gmail.com>
In-Reply-To: <CAPMdQDmY7CdbrHyOwhJNFBREQ0EO1SKufRdN_YR6TG4zmJzXpA@mail.gmail.com>
From: Mike Oliphant <oliphant@nostatic.org>
Date: Wed, 14 Oct 2020 08:19:36 -0700
Message-ID: <CAHXb3bf+0uKS-+aEVsgebUbYPt1wCBZ7GLAjF57BrPDHcveuQQ@mail.gmail.com>
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

When I tried this change earlier this year on the BOSS GT-1, it enabled
sound output on the card (which was not previously working), but with
significant issues. It resulted in frequent pops and crackles - presumably
because of the loss of synchronization using implicit feedback.

This was the fix that ended up working for me:

https://mailman.alsa-project.org/pipermail/alsa-devel/2020-January/161951.h=
tml

But maybe something else has changed in the handling of implicit feedback
since then?

Mike

On Wed, Oct 14, 2020 at 5:17 AM Mailing Lists <maillist@superlative.org>
wrote:

> Following up on this, it appears there are a bunch of the newer-generatio=
n
> Roland/Boss devices which need similar treatment.
>
> So far I have tested the GT-1, the GT-001, and the BR-80, and others have
> reported the RC-300 as working with similar modifications. I have been
> using the following change to the code in pcm.c
> set_sync_ep_implicit_fb_quirk:
>
>     case USB_ID(0x0582, 0x01d8): /* BOSS Katana */
>     case USB_ID(0x0582, 0x0130): /* BOSS Micro BR-80 */
>     case USB_ID(0x0582, 0x0138): /* BOSS RC-300 */
>     case USB_ID(0x0582, 0x01d6): /* BOSS GT-1 */
>     case USB_ID(0x0582, 0x01e5): /* BOSS GT-001 */
> /* BOSS Katana amplifiers and many other newer BOSS devices do not need
> quirks */
>
> There's probably others too, such as the GT-100 (I believe the GT-001 and
> GT-100 have similar hardware).
>
> My question is, should this just be submitted as a patch to pcm.c or woul=
d
> it be better handled in quirks and, if so, how?
>
> Or something else?
>
> Personally, I dislike the approach of hard-coding exceptions into core
> code as it seems that's what quirks are there for, but there seems to be =
a
> whole bunch of exceptions in there already.
>
> Cheers,
>
> Keith
>
> On Thu, 17 Oct 2019 at 09:20, Takashi Iwai <tiwai@suse.de> wrote:
>
>> On Fri, 11 Oct 2019 19:19:36 +0200,
>> Szabolcs Sz=C5=91ke wrote:
>> >
>> > BOSS Katana amplifiers cannot be used for recording or playback if
>> quirks
>> > are applied
>> >
>> > BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=3D195223
>> > Signed-off-by: Szabolcs Sz=C5=91ke <szszoke.code@gmail.com>
>>
>> Applied now.  Thanks.
>>
>>
>> Takashi
>>
>> >
>> > ---
>> >  sound/usb/pcm.c | 3 +++
>> >  1 file changed, 3 insertions(+)
>> >
>> > diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
>> > index 33cd26763c0e..daadb0c66eee 100644
>> > --- a/sound/usb/pcm.c
>> > +++ b/sound/usb/pcm.c
>> > @@ -348,6 +348,9 @@ static int set_sync_ep_implicit_fb_quirk(struct
>> snd_usb_substream *subs,
>> >               ep =3D 0x84;
>> >               ifnum =3D 0;
>> >               goto add_sync_ep_from_ifnum;
>> > +     case USB_ID(0x0582, 0x01d8): /* BOSS Katana */
>> > +             /* BOSS Katana amplifiers do not need quirks */
>> > +             return 0;
>> >       }
>> >
>> >       if (attr =3D=3D USB_ENDPOINT_SYNC_ASYNC &&
>> > --
>> > 2.20.1
>> >
>> _______________________________________________
>> Alsa-devel mailing list
>> Alsa-devel@alsa-project.org
>> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
>>
>
>
> --
> --
> Keith A Milner
>
