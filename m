Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 562B534B36E
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Mar 2021 01:56:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8441167A;
	Sat, 27 Mar 2021 01:55:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8441167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616806608;
	bh=0HSgiwadZ12ib3FSSt+UH7B+D+crpHrdsGtGE0kHaEM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n35H+wry0+IxHyfSXDC+g9s69c4aJaL+mzOAiQdp8BaPv83+VZYOz4RniHsBW3Cpg
	 XsPYVJJ8svqwrpMHmYd9iMb/wIUdXINRGlkVdW3TMt/2a+RN9CtTzB0EymRoDxBkag
	 7Fjc7lVW17Wj2zDMt4VcmHKsieVIBfZ/+ES7F6DE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FC20F801D5;
	Sat, 27 Mar 2021 01:55:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36CA6F8016B; Sat, 27 Mar 2021 01:55:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C91FCF80104
 for <alsa-devel@alsa-project.org>; Sat, 27 Mar 2021 01:55:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C91FCF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HVPPBTRG"
Received: by mail-qk1-x734.google.com with SMTP id c4so7150089qkg.3
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 17:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=/2Nx/60Qog8NiE8neYsxs06Jr3kpPBJgE040GJFrIo8=;
 b=HVPPBTRGzmoNLzf0dapFvEkBxlk9NcVuRrX4457+KGmle+SnzycMnFW0gkoBaxS/8W
 jv37unfYIjS8EPJs4vsApwCQMW4vjDbo7A/aFijMHIFGh5iWh9ULdG7cRJvpEFPztaNz
 I3Izvgmh09PU653e1oqyTDExu5TBFxhDWZRfDesyV5UHWmwN7On6grcNjM5FUj7DSpuB
 Q/OB7QvQxfTElLYcsVUL+r2ra9R4AUurkEVvls1ZwBxUidoBfXmoiL4t9cs4sGAlLJWx
 +yf0rFFhQGjVkS5yyCP6oGPBHNt5GmKn6komdc9XtW/JEfAFE54aLpoCqmX01gD8Qz6a
 y9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=/2Nx/60Qog8NiE8neYsxs06Jr3kpPBJgE040GJFrIo8=;
 b=DGn2LeZHtJN3k5ypUctS1fvj3MScwxlrrkjivvHqt7GH7lmriQyuUYkLvxV7KJnrkP
 CeZVOuOR+Cq40xzu/MEfC+oUzcaBFBjOB6ZFZw79v/9HQofumNyFPgQX1cglv/pM2rfk
 QZFbptqBJwmDgC75O7jy6DQBP2F6Pjw4WrMYWrmmjIAnimZ8aqBoP1wIITAQDKEjpjGA
 hnPrQQ533Ftouhig5EtDWfnkVAhAAlFvYVs7Fyi0cY8V3ux/9DQPtrhlbWwPHUOPHG6I
 NbZqS3zOMD2140xwLRpXLSjP4fFDgFbkawsUe//qJ40AEHpOvN7UbfTwSMusFhuAs+f5
 ivhg==
X-Gm-Message-State: AOAM5334kHWxPgAL0Puadh6qN3bJL89y+WIKuzGfZC+lFiMjy2q9YHc3
 JJC2yBwLRFHgAShoj5pKFmg/0szvbDrbo8Ct4iND6MnW
X-Google-Smtp-Source: ABdhPJx6NL5uyV1IuFhgjdPOktKtmzk3/eY2fTJe2ihlBnL3qHOZoRr5vazq3pv7h0DF8Jm4+G4aTUOrA+nFClR3Buw=
X-Received: by 2002:a05:620a:10a6:: with SMTP id
 h6mr15816435qkk.366.1616806513978; 
 Fri, 26 Mar 2021 17:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAEsQvcsXKRzCfDcid7nBnfvg6Vx1xQiBuK-EQmv4iGkDvZ0b3Q@mail.gmail.com>
 <CAEsQvctoyhh6-iz4SnxtiGuugcZ+9g6g7CQeub6-mxD5Fix9rA@mail.gmail.com>
In-Reply-To: <CAEsQvctoyhh6-iz4SnxtiGuugcZ+9g6g7CQeub6-mxD5Fix9rA@mail.gmail.com>
From: Geraldo <geraldogabriel@gmail.com>
Date: Fri, 26 Mar 2021 21:59:51 -0300
Message-ID: <CAEsQvcsP1=5NYZqK_12YZ=eMLWeZkc5RbEEW0EdJRMSdM=C9tg@mail.gmail.com>
Subject: Re: [PATCH] Behringer UFX1604: get rid of pops and clicks while on
 96000hz
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

To clarify: I'm not blaming anyone for introducing an implicit feedback
quirk on a Synchronous endpoint. In fact, I'm almost sure it was somehow
needed at the time. But it isn't anymore. What is needed is to set the
CLOCK_SELECTOR to pin 1 right after we set CLOCK_SOURCE to our desired rate.

Em Qui, 25 de mar de 2021 19:45, Geraldo <geraldogabriel@gmail.com>
escreveu:

> Oh, forgot to mention. Both IN and OUT audio endpoints on the UFX1604 are
> Synchronous. Somehow someone thought it was a good idea to add an implicit
> feedback quirk for it.
>
> I consider this unneeded and pointless. In fact I disengaged the implicit
> feedback quirk on my 5.12-rc4 tree and it runs fine without it.
>
> On Thu, Mar 25, 2021 at 7:39 PM Geraldo <geraldogabriel@gmail.com> wrote:
>
>> Hello everyone!
>>
>> This one has been bugging me for quite a while. I went deep hard in the
>> guts of ALSA to try to solve it, and it turned out to be a minor thing
>> apparently. The problem is old, and every UFX1604 Linux user can attest
>> that it's impossible to use 96000hz in DUPLEX mode without annoying pops
>> and clicks on the capture stream.
>>
>> The fix is simple: after we alter the CLOCK_SOURCE to match our sample
>> rate, let's tell the CLOCK_SELECTOR we want CLOCK_SOURCE 212 (synced to USB
>> SOF) on pin 1. Solves the problem for me, no more pops and clicks while on
>> 96000hz.
>>
>> If you own an UFX1604 please give this patch a good testing. Let me know
>> if it solves the pops and clicks on the input stream for you while on
>> DUPLEX 96000hz.
>>
>> --- clock.c.git 2021-03-22 04:19:55.543485748 -0300
>> +++ clock.c     2021-03-25 19:23:38.597197159 -0300
>> @@ -610,6 +610,13 @@ int snd_usb_set_sample_rate_v2v3(struct
>>         if (err < 0)
>>                 return err;
>>
>> +        if (chip->usb_id == USB_ID(0x1397, 0x0001)) { /* Behringer
>> UFX1604 */
>> +                printk(KERN_WARNING "Setting clock selector for
>> UFX1604");
>> +                err = uac_clock_selector_set_val(chip, 211, 1);
>> +                if (err < 0)
>> +                    return err;
>> +       }
>> +
>>         return get_sample_rate_v2v3(chip, fmt->iface, fmt->altsetting,
>> clock);
>>  }
>>
>>
>
