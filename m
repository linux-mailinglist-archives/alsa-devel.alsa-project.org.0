Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A98340C657
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 15:24:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E95318A1;
	Wed, 15 Sep 2021 15:23:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E95318A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631712287;
	bh=iG552K7GX0ywRbE+BXHd6Zz3qmphy1WP0rxjlBGoL24=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VjnTun/5QisnvWH54nvTKIsU0k4CBW/2QugCeMMjPp3vGgkxkYPga4NtqKWiAgzzk
	 ZfLVi35Fs1dWtPkOVMG+fsa8UmYr+8UryZ4lLyjC4Qkc8c8YmnRCl7hEGjkjE/T52G
	 0TvX+zZkljvv3lzQnP9e6UgRUuFXVXsADcuKqNCY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E36DAF8032C;
	Wed, 15 Sep 2021 15:19:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D712F8032C; Wed, 15 Sep 2021 15:19:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DATE_IN_PAST_03_06, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58030F80227
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 15:19:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58030F80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="j6cm7pyq"
Received: by mail-qv1-xf33.google.com with SMTP id 93so1821010qva.7
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 06:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iG552K7GX0ywRbE+BXHd6Zz3qmphy1WP0rxjlBGoL24=;
 b=j6cm7pyqPI7TB/gIxLbbFDeZc5MCyPvY4mTZlXPZtwWShllS/xzhnb87Yt8ZNtmt1X
 uVRYE+5mhgtQ1pUJDuj5evDuZt935Mhjnd0tzTDY3Aw4b9xZgYb4K+2YxJg8lHZtFoJ4
 Oc10fY1HoeA2woQtOT7aLvuDSUdFI1PAyPYd9/ZCxuobVmXT8RQx1zbkM9YxfAonKoc/
 WiIupZQHbUsbjD3IweREzEnOCLdxQQFThERRHu0xrm+BccmTKSui2ONMoe2vvSZvaPlH
 AZ9pbfaHv8HQVrZjBw7qAr8UNoJgenzxL3Vae4fTqU/MdghRCU8tadnH62tB7NVtYoQ9
 3FIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iG552K7GX0ywRbE+BXHd6Zz3qmphy1WP0rxjlBGoL24=;
 b=flkpf708PPLZIGF4fz6pCYH3XwBLxoSQck3EMBQOw1ZAgz3rVSPOakTDUAJuBbmpwh
 hz8TZJB4V3QED+TMTBvytJzF0ueYxCTQnnxFSIsH2YSkDZGItM+/03TryEdVqli5oLAX
 aK0fqVIWMiIH0fKKxCw7LGEJ6FKCW1ZFszaKVZM4zYPNz2v0RquKm9IY6rjPBVzQ1IC6
 uELE6E1c/kPGgsad0K0SaSVCZ9DUa35ImKcLYcpp9EqZK8f1GurXLBC0BjMXXhCW7ao+
 LoquF4NQCHECQB3Yzckp+k3jGmIRjrP3FDsAtKprqwyBoMsIOLs+TN0bZ9WpUdG3WvjA
 afyA==
X-Gm-Message-State: AOAM5319xLHequq4j4FM6lIbkiEmXNF0aqfcwsFhWpRWmwTNWhxgqJg8
 ZT8qHqmlcyQ398pl98ZHHoWl9rLhH0uOfU7ZZf4=
X-Google-Smtp-Source: ABdhPJzzRIucp5QOFzXRHep3ZYcPaR6RwUzCLjII1cKKBJo/6qkGjCtBZ6IcPeHA05DfabMaf5SFl59OpjAyzMr+TRY=
X-Received: by 2002:a0c:e341:: with SMTP id a1mr10778937qvm.61.1631711939772; 
 Wed, 15 Sep 2021 06:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <F8QtqhEtr7zd-TLTxx_4bX0GAXvq-griyYIyEpXrRybmRihHHpwt5nZUCn97mDEbJSW9TTesUMmwmFUukYEjWnGsCYi70LZhg6BA6iF9BMQ=@protonmail.com>
 <CAEsQvcuzPwkBWXfnJPe-xFGYHvvk-MiKijeXTUZ0KhBLtgR5sA@mail.gmail.com>
In-Reply-To: <CAEsQvcuzPwkBWXfnJPe-xFGYHvvk-MiKijeXTUZ0KhBLtgR5sA@mail.gmail.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Wed, 15 Sep 2021 10:18:48 +0000
Message-ID: <CAEsQvcvRbP-sxjjG_Bn9dHRjEe9BXpQ_egVP=hgkQwWsj=EcOw@mail.gmail.com>
Subject: Re: Location Of _snd_ctl_ops Definitions
To: Ryan McClue <re.mcclue@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
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

Hello again, Ryan!

Besides control_hw.c here are the relevant hits I could find:
https://github.com/alsa-project/alsa-lib/search?q=snd_ctl_ops_t

Hope it helps,
Geraldo Nasscimento

On Wed, Sep 15, 2021 at 1:11 PM Geraldo Nascimento
<geraldogabriel@gmail.com> wrote:
>
> Hi, Ryan!
>
> Em Qua, 15 de set de 2021 05:45, Ryan McClue <re.mcclue@protonmail.com> escreveu:
>>
>> The struct _snd_ctl_ops contains a number of function pointers.
>> Where are these functions defined in the alsa-lib source tree, e.g int (*subscribe_events)(snd_ctl_t *handle, int subscribe)
>
>
> Perhaps you are looking for src/control/control_hw.c specifically at line 341?
>
> Thanks,
> Geraldo Nascimento
>
>>
>> --
>> Ryan McClue, Sydney
