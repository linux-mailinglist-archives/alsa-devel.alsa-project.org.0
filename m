Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4719E3575C1
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Apr 2021 22:18:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4CCE852;
	Wed,  7 Apr 2021 22:17:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4CCE852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617826702;
	bh=F3oe/IJo9B67+RIqq8xfKLlKrF23n5YIbb/pZqoNMSI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CZqz5+p1XhhJ4z+T19lV18pnc1d9YkxI/ixjQW5RsV6lLWK0G9uHvg4ZwM31lb9w6
	 4ZGYLpJ637NF3QI7mwNU0c2IfJowa3d2giai2jaFxZbnCCg14o1xG7sLo1mNkbvJuL
	 v/ZqIQbJaI/sE7oDfSz2QkV/DMIJdPFJE8bqEY/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A1DEF8016D;
	Wed,  7 Apr 2021 22:16:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51334F8016A; Wed,  7 Apr 2021 22:16:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22C47F80124
 for <alsa-devel@alsa-project.org>; Wed,  7 Apr 2021 22:16:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22C47F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nostatic-org.20150623.gappssmtp.com
 header.i=@nostatic-org.20150623.gappssmtp.com header.b="znuu43UC"
Received: by mail-yb1-xb29.google.com with SMTP id e188so58747ybb.13
 for <alsa-devel@alsa-project.org>; Wed, 07 Apr 2021 13:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nostatic-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3X+6VIomGspphRVrxZU8mOnuI5xq7UlOfQfKqz/eEUQ=;
 b=znuu43UCxEWGVu1pTuxp31KlXfvxX+HSu6Ls88gE9l2BwCc29HBlgEWIo1Lj1xRxhm
 i0kNtLMCIy7zRz3MB8NAb/LwqjIJ2tHR4Y9JJVa8BVdbSW56xER2OmLEj09xnFgVxTI6
 4IFdDDVSnjwkUssYItZVtUvaI2WSDX9NCNVo6QsjlTawnGq1oEYhRIADmho14zTuvQQC
 ZPH9Dk1PX5JruyjUmI1uxbIzSqnZ/SW+wH/37nzPKgbH06ajNV6V+Tlh4dMwKsz5B5Sy
 MNrOBAax/dT9vPDGNQo29Jvb/B5o+b13U3UoR2QjY9Z5TYs4Be3By3bnxTnmk1Qe005b
 1vrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3X+6VIomGspphRVrxZU8mOnuI5xq7UlOfQfKqz/eEUQ=;
 b=a4CQyeuOp+VoK7tT8VtWSo4fHI6a344klr7fvhfRbAq3RLzvZGu3+7GCUs5V3ZxZe5
 flCjBWnZwDQI0zMwOiyT8vDqGjKCQ3wRoK15LU0hfJ4MsCdhLqUReOK8l3v/YiCFztHr
 Itvs/pBZJQiW9E38OW9hc0bEgbd2bo9/lCOOsW7pxhJAge1bVqzntygV+MFpNUXyAFKV
 zNQR0iEwc6heaH5KfNzgj7LB1nPrlUmXGFEGTGuAwjHm8W2wpui6l8IZWejmilFRDBdU
 Wj6kxg8SlHxFC4kzQjDejv3GF2GZG9HYtwhyFrB5jywxkzIguQoQK0dGiTwjBkbBNnB+
 8HrA==
X-Gm-Message-State: AOAM533dtqk/WK+be33tMB5vUSmUgHm4Jf62VeieGF0FLfu4Umil8278
 +albF1ru1bZArIOEmP6Nrs/GuPIorTokS/Y42lcDDQ==
X-Google-Smtp-Source: ABdhPJxQAhxBMZYCKNdz8THJW9jZ4JViMD7Tfyr87NITlQEzfffJiH175sgJYRi2Wf4lN80nt6bnHj7sZqr7mDfLwRc=
X-Received: by 2002:a25:5004:: with SMTP id e4mr6761931ybb.144.1617826604390; 
 Wed, 07 Apr 2021 13:16:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAHXb3begced9GYCQ4a6qLOK2PrQR9gHeSvb3HAG29DVpZ+vwiQ@mail.gmail.com>
 <CAEsQvcu5freEXMFwBRH0aQsT9=ngvOY_SkA6dmfs_YVvMYYuJw@mail.gmail.com>
In-Reply-To: <CAEsQvcu5freEXMFwBRH0aQsT9=ngvOY_SkA6dmfs_YVvMYYuJw@mail.gmail.com>
From: Mike Oliphant <oliphant@nostatic.org>
Date: Wed, 7 Apr 2021 13:16:33 -0700
Message-ID: <CAHXb3bddyVMXrZHxmtz5AM4j7TRwWSbZcLM94JjcbOMfrd4+2g@mail.gmail.com>
Subject: Re: Implicit feedback on BOSS GT-1, the saga continues...
To: Geraldo Nascimento <geraldogabriel@gmail.com>
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

Hi Geraldo - I don't have that patch applied, but it shouldn't make any
behavioral difference - it just seems to be simplifying the code.

The issue is that the BOSS GT-1 *does* need implicit feedback on playback
to avoid clock timing issues, and the current behavior is disabling that
feedback.

Mike

On Wed, Apr 7, 2021 at 1:04 PM Geraldo Nascimento <geraldogabriel@gmail.com>
wrote:

> Hey Mike, did you catch the latest patch by Takashi Iwai for capture
> quirky devices?
>
> You can find it here:
> https://patchwork.kernel.org/project/alsa-devel/patch/20210406113837.32041-1-tiwai@suse.de/
>
> Em Qua, 7 de abr de 2021 16:55, Mike Oliphant <oliphant@nostatic.org>
> escreveu:
>
>> I had thought that the recent implicit feedback changes were fully working
>> on the BOSS GT-1, but it turns out that I just hadn't tested well enough.
>>
>> Audio playback and capture works, but with periodic dropouts. I get the
>> exact same behavior as I did with the quirk to completely disable implicit
>> feedback. Without the implicit feedback, you get dropouts from clock drift
>> - how bad probably varies from card to card. On mine it is every second or
>> so.
>>
>> If I switch playback feedback for the GT-1 to generic by doing
>> "IMPLICIT_FB_GENERIC_DEV(0x0582, 0x01d6)", I get the previous old
>> behavior,
>> which is that playback completely fails to start.
>>
>> With generic playback feedback, and using my previous patch to endpoint.c
>> to avoid playback waiting on capture mentioned here:
>>
>>
>> https://mailman.alsa-project.org/pipermail/alsa-devel/2020-January/161951.html
>>
>> playback and capture work perfectly for me.
>>
>
