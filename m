Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E045352026
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Apr 2021 21:52:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E4FB16AE;
	Thu,  1 Apr 2021 21:51:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E4FB16AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617306721;
	bh=HmkNGRIjZsYBe8dxLKAHBQmly+6fyWanBmO5uZ2lni0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QfLtVnEN1NJ5lwhfEW/mzaRzvsM+CkjKXtgv2UD6ZfXSJc4cuYAlj0MF1LGbIpYQl
	 kyZfft3sqniiPt7jS1h+w/X6ZfAvR/KGIuRM6odwzq4UTUUO4Sd6SgT0mzCZPOR51J
	 aXM/4BqOA+DJ8pHZ1QrbqlU6qGHC28yr+ajsMR8s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1478DF8013F;
	Thu,  1 Apr 2021 21:50:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 810D3F8026B; Thu,  1 Apr 2021 21:50:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B81AF8013F
 for <alsa-devel@alsa-project.org>; Thu,  1 Apr 2021 21:50:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B81AF8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="K2FBGeFc"
Received: by mail-ed1-x52d.google.com with SMTP id w18so3259961edc.0
 for <alsa-devel@alsa-project.org>; Thu, 01 Apr 2021 12:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TXMNvHbAHbKh/NcmmnfAIy5A5476Yjvsjiuoq3Ul5X4=;
 b=K2FBGeFcdK5o7IjNXEu+4UNuXSJWVyuhOpgGChAhWVI0h8R3nHyJVR9xsTX6MxdeJU
 IAxXqg8dt+/iuaoxpeFd2myy0QuDcyQUStLVS4w8E1P7FwvOTRLBX2YkDyRPCntUcScl
 ouqPqRaZ5uqW1LvD7q+yHTCFiQMkcSOO1744tMJmC5JucTxMMV2dUO7/v5sqVvwNeitn
 2xkIYMePmvAvWeDsChVOsiIsILemd3gZkg5dCLL9Bl4jMPCTdfa9IuxUs3gJFoBGe4rZ
 83hWHGANNnfUXp2wPSxa9JbYyXbh4jl9xAPF6VQKlSJpFJRFKeP6Lq3xe08Pz1GDpso5
 OJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TXMNvHbAHbKh/NcmmnfAIy5A5476Yjvsjiuoq3Ul5X4=;
 b=lxn0dg3r4SIVsOr+bzQVVC6NyEO2K6IUyGkoGZ82ZsyXbAXf9zb9oBiqRq/VBE4fhT
 3RrZv+YNNXiUXTGKX2URdT54queeUCJqd2zMH4SNaOpLPUeLW/mBihAyi+u7//ZUm9D5
 hBAfwDzlPi5NYr+qAR3LLWZc1jBcQkuY+l7xu1nWZ81wCVIPscOUo/hsAUTwnIvzPk8A
 7lMzOW2p02D5QvDvQmfrOtjgFmIrLwbKmuMNdAU3rOXdwxRpYeOZMG4LgdUmtxPzCTIF
 XIzxtq9cV9KABOm37IWoxSuyA/qHOEtVu+XOn/bZrWA18uYpIjECM8Vx/TlCb96n77ZC
 A9DA==
X-Gm-Message-State: AOAM530VB4HogQkmHwHYKzVCQplTxhB8KZRNVM/b1qfJPYA7nRX69xTa
 hd6g617jjOq4LqpSWlTsP5mAJKUdTy+X0tZR8Xg=
X-Google-Smtp-Source: ABdhPJwOTPF5dDg2zgFbty0opD2Zo+kQ5g8MrtLx6O+yXXlXMQhXvpvoe/VuY9rCBiQY+Urnl7DPK8NC5mNEaOup94Q=
X-Received: by 2002:aa7:ce0b:: with SMTP id d11mr2462584edv.209.1617306627164; 
 Thu, 01 Apr 2021 12:50:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAOsVg8oCOSHrqx_7rU_KAYugOaYxmJ1vLvrS_wAah0VKFVZ05w@mail.gmail.com>
 <CAEsQvcuTb_3meXw-X08v1MduNpCA3xA6SXq-ezuJrcC7tP+faw@mail.gmail.com>
 <CAOsVg8rE8772qnGAHwFuK4+A9QA-AcDqAH4PkLJJf2GH3tmiVQ@mail.gmail.com>
 <CAEsQvcvjf-o7x8t06cCB3hwMNXZYf=xJWsbnGdTmt=CXP2HJQA@mail.gmail.com>
 <CAOsVg8qTwqFwnmWZwu02rMqwkpbNZFV4COL8yB-BAJDNuT2gug@mail.gmail.com>
 <CAEsQvcs55c9Y-OwoypArz7gNt5AK3fZZtREjedi7TA6zxZXhdw@mail.gmail.com>
In-Reply-To: <CAEsQvcs55c9Y-OwoypArz7gNt5AK3fZZtREjedi7TA6zxZXhdw@mail.gmail.com>
From: Lucas <jaffa225man@gmail.com>
Date: Thu, 1 Apr 2021 14:50:15 -0500
Message-ID: <CAOsVg8o7=5X4KWOch4Bc1g4+oUKpiYr+S8Bb+oqvTBThj8uBgg@mail.gmail.com>
Subject: Re: [PATCH] Fixing most Roland-related devices' USB audio
To: Geraldo <geraldogabriel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org
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

On Thu, Apr 1, 2021 at 10:55 AM Geraldo <geraldogabriel@gmail.com> wrote:

> Em Qua, 31 de mar de 2021 23:19, Lucas <jaffa225man@gmail.com> escreveu:
>
>> Thanks for the encouragement and wisdom.  I hope your additions, and
>> mine, work out in the end.
>>
>
> They will!
>
> A real hurdle with tasking everyone with patching for their devices, aside
>> from having probably long since given up hope for use of the device on
>> GNU/Linux, is the amount of disparate forums they voiced their issues on.
>> There's also the daunting likelihood that select few music creators
>> actually would decide to compile their own kernels to see if a problem is
>> fixed, let alone feel comfortable enough applying a patch.
>>
>
> Recompiling kernels with custom patches and workarounds for regular
> devices is madness. This should be needed only for development purposes.
>

True, but it's much less of a burden on a source-based distro.  I used to
use mainly Sourcemage GNU/Linux, which made changes pretty painless.  With
debian it's still doable, though I think building the packages takes more
time.  On Sourcemage, updating the whole system after a glibc upgrade takes
even more patience.


>
>> I hadn't realized this was a list to drum up testers, or that every
>> change needs to be tested fully.  I thought it was a direct path to
>> possible acceptance for inclusion in the kernel, if reasonable doubts are
>> considered.
>>
>
> Well the Linux kernel has to be somewhat orderly even if the open source
> development model is inherently chaotic.
>
> This should be a list with lots of testers but I'll bet the volume scares
> them off.
>

Yeah, the sheer amount relegated my thread to oblivion pretty fast.


>
>> I hope they'll let me sidestep that huge, unreasonable, undertaking, as
>> my test implicit feedback "fix" for the UA-4FX (which doesn't need it)
>> proved it still functions as perfectly as without it.
>>
>
> I disagree a bit with you. It's not very wise to add unneeded quirks.
>

In this case the quirks to me seem to be Roland/Edirol/Boss devices that
don't need this method, but yes your point is well taken.


> That should mean that for the devices that don't require this patch, but
>> which had been accidentally added, no harm is done.  I can't really see
>> myself as owner of all these devices someday... ;)
>>
>> Thanks again, Geraldo!,
>>
>>   Lucas Endres
>>
>
> Thank you,
> Geraldo Nascimento
>
>>
Thanks again!
