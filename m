Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2E93D52C8
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jul 2021 07:18:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 257C81724;
	Mon, 26 Jul 2021 07:17:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 257C81724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627276683;
	bh=BDw7KkyEuWcxSqvMaYGFBIa9yTnyxkC/jDmCbQTz7Ak=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K7hoNxYSKxR0mFivx9R0YkuyEEcNWmIk5JhsEiBQxMF0gaeFuV0AJRW/LKjAxlX7I
	 p0XW20/FPMRguwlrLw6nWH6ARlpjjc2emXHTl9yFm4IQjpe5lMsEsYWjwia79mJk2m
	 /0jPb3PlhTrbzps5jhDjo2nehDXPaqmRJTFhRhXs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EE4AF80253;
	Mon, 26 Jul 2021 07:16:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 601CBF8025E; Mon, 26 Jul 2021 07:16:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DATE_IN_PAST_03_06, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4ECA0F80132
 for <alsa-devel@alsa-project.org>; Mon, 26 Jul 2021 07:16:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4ECA0F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="V8MXuFFK"
Received: by mail-qk1-x72a.google.com with SMTP id c18so7769256qke.2
 for <alsa-devel@alsa-project.org>; Sun, 25 Jul 2021 22:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XygC5wCkMDbFQQ9ce88kjiV4VAshB5QTsAEs+cXfzBo=;
 b=V8MXuFFKyGipObIamnLlOLefvbGxx8fkYXPtJXfQaR6zPfL/sGcnUox+MUW6t3kNhX
 BJw+rGDeH1JGkQSSG5zJynhThfUINGX2dPi+NCPN48fkRyFn+aFXi/AcO/7cJJDAM5DF
 AL6dsSpy2Ahm28uUQTYOAWlKSxNTTN0m+9KeJCuV4LpaNH9lEDGYei1zpZngRnyIGv16
 jXfdiwJK+om/0/+qnATixilPqLd6igKtGOdGYMjTe62l4xcIMK/4sYegrpvGoyHBq7pP
 l5uhhjp/yZ3Xus6oGwGx6pPMBDxHUpsiKqatKgzcknjU0EAzy2OyVNe2zzIyeK0md5Bl
 6+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XygC5wCkMDbFQQ9ce88kjiV4VAshB5QTsAEs+cXfzBo=;
 b=WdDGf4Mis7QRnNnfqBZPljJD/rCsACLVoMR8QA9Fug3wIeBNdBw5/iVDRQZLbcarL8
 ZNmMd7Qy1fscxW28Hj1CT486dMIp14wvwA1rqkSkiVDkGMvEhqv5tjFYuuZrF8O+2rjD
 pkeJ1dtlhJLw2w42zCnWMOBIINLsD4JcHyigqgLLCRO4yUsJCmMKFs33eTLrQljPuw1z
 yCGTN3lKyDmQ9i2yYUldIruZIXucccpVU05DSqChdpALRgdKLuBJM5v2j7ma+Ejue6T3
 NjBEt3LJrQOGrqvgq/Y3bWAh5eE87R3G7ZpNaG2QrDcC1zfJrwV3eXrPHTXwp/X58uFc
 tzrQ==
X-Gm-Message-State: AOAM530siLE/NKBwTJMkiCk7rb0Q62BB2uIaCJI4nGVeyh7YyoqNP+96
 fyfGaL3N0dVaHcXaJ4ZD3DpTrjx6UpaFz94mj8o=
X-Google-Smtp-Source: ABdhPJxvuO0i1cOxHKEIeKjGh7PuOqW1BCoICcn1IG0kXrcAMZC5H6irn+d1FLDu5WKxOfVJpitbnWiFrFfoLek0xww=
X-Received: by 2002:a05:620a:1278:: with SMTP id
 b24mr15914369qkl.250.1627276579628; 
 Sun, 25 Jul 2021 22:16:19 -0700 (PDT)
MIME-Version: 1.0
References: <1627100621-19225-1-git-send-email-chihhao.chen@mediatek.com>
 <s5h7dhgi1e2.wl-tiwai@suse.de>
 <CAEsQvcs3P+TqQFzQetPfRycpo66eJFwnzwhk2JyCXFaCLFHmFg@mail.gmail.com>
 <s5hwnpehm7y.wl-tiwai@suse.de>
In-Reply-To: <s5hwnpehm7y.wl-tiwai@suse.de>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Mon, 26 Jul 2021 02:16:11 +0000
Message-ID: <CAEsQvcumEDOKgUB6h2-im5QabhPfaSaU63RF8pegPt5ZCPx+Pw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: fix incorrect clock source setting
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, wsd_upstream@mediatek.com, damien@zamaudio.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, chihhao.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
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

On Sun, Jul 25, 2021 at 7:44 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Sat, 24 Jul 2021 17:04:13 +0200,
> Geraldo Nascimento wrote:
> >
> > On Sat, Jul 24, 2021 at 8:05 AM Takashi Iwai <tiwai@suse.de> wrote:
> > >
> > > This looks like a regression introduced by the recent commit
> > > d2e8f641257d ("ALSA: usb-audio: Explicitly set up the clock
> > > selector"), which is a fix for certain devices.  Too bad that the
> > > behavior really depends on the device...
> >
> > Dr. Iwai, perhaps we could restrict the generalized fix for the
> > Behringer UFX1604 / UFX1204 with some simple logic to devices that
> > only have *one* clock source.
> >
> > In that case the clock selector must be set to the only clock source.
> >
> > This way we keep the generalization without breaking devices with more
> > than one clock source.
> >
> > Just an idea.
>
> I don't think it's easy to generalize.  All those bugs are more or
> less BIOS bugs, and a logic doesn't apply always, just because it's a
> bug :)  For example, setting the clock selector itself should be a
> valid operation from the specification POV, while this leads to
> breakage on some devices.  So, even if we add a more generic
> workaround, we need to see which side effect is more commonly seen at
> first.
>
>
> Takashi

Hello,

Like I said in one of the other emails in this thread, it's hard to
pinpoint a cause for the breakage of Samsung USBC Headset (AKG) with
VID/PID (0x04e8/0xa051) without the lsusb -v of the device in
question.

But from the description Chihhao Chen gave in the original message,
I'm *guessing* the Clock Source for the Samsung USB Headset (AKG) runs
at 48000hz and that we'd see a 2x Clock Multiplier in the lsusb -v

This is all a wild guess, without the lsusb -v it's impossible to be
sure, but if I'm right then the valid setting for the Microphone's
Clock Selector is the Clock Multiplier, not the Clock Source, which,
remember, runs at half the clock, hence why Chihhao Chen sees half the
data rate for USB IN.

Unfortunately our kernel code presently *does* always set the Clock
Selector to the Clock Source, which is a bad assumption to make in my
humble opinion.

The only valid case for setting the Clock Selector to the Clock Source
is when there's precisely one Clock Selector, precisely one Clock
Source and no Clock Multipliers.

In that special case we may be able to touch the setting of the only
Clock Selector to match the only Clock Source.

And, frankly, the only reason we're forced to do that explicitly is
because some Behringer gear (Archwave AG DACs) gets confused and seems
to somehow keep the old rate on the Clock Selector upon sample rate
change.

Thank you,
Geraldo Nascimento
