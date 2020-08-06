Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6D323E161
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Aug 2020 20:48:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 933D182E;
	Thu,  6 Aug 2020 20:47:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 933D182E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596739681;
	bh=yeoh5po/uEStJysOByJr0wuJN2YbhgPeRVXPO08nimY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OmbLhvyhAk+HBywYHzXQ8BukqIDA7wCiPNsuY7eFysHOYT/EZPrrVMUFw8cgzGZx/
	 qJXY4R9HiiTRjaY+ZIQxQCujHrJzeE5d7i4q4Q2X46MctykHBYwe0hBKI/m+nTDHbQ
	 JOuCJ/L5Bg8XLGu2AHTAUZ3VuEe+i+C5n1uK8ahE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7449F8015A;
	Thu,  6 Aug 2020 20:46:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8528FF80159; Thu,  6 Aug 2020 20:46:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODY_30,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 521B8F80124;
 Thu,  6 Aug 2020 20:46:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 521B8F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SOlY72SB"
Received: by mail-ed1-x543.google.com with SMTP id df16so19544481edb.9;
 Thu, 06 Aug 2020 11:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=JRzoxAL9EADaRb4UwOkfOuVMw7RbgAdAz6m8ixYTgzw=;
 b=SOlY72SBsqK7iV+sUk5KsXI6ImU2fSYh10Hr9P3P0oGCPIedl8720QrlquGy6haoUe
 Z+MBCWdr3D3QcFN6j030BKMJjzG/yhi5WMCBEjKqw0Rvblu84IOJwFxg/S4rnel3BX7m
 StLUNKpnmqcgOPI1pHNCh9OBg/hYVgZz6yFHKRJjNy1OcGntqh6XlGAjVrjWmgTeRsmW
 dsiThEdP7zBGypzppA1h3ItHs5EWBy5dU0zP7GhpzYXrHWU/Rd/txZFUXFuZGTwAEY8M
 SsCBRhBU0rhZFfVgSaQrKwK/jZMrpVwPUsyF5jPD3J5XT1Fhh3ronM8UGvLQAlETTcqH
 tU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=JRzoxAL9EADaRb4UwOkfOuVMw7RbgAdAz6m8ixYTgzw=;
 b=TIMPYOt/qP5Rlrxuv8yFrzKqsN5k/0V9whsDL3haD6qDCrHwFlgqx6S0zVVhPfy+rf
 NkhzB9T+4LtOtowPnwnfSUQjC4S6Vgn8KNOf7gOF8pnFGFlTDZ04X2uhKjJOFAwuhsaF
 u7qNRs5XwmATN/0OIOE6nZO5M6pNpujwkF76VB1q84AmEeKkLK0cCUYi8NGGyf+CqjEw
 YdAIc98ldRvb2aELrmVLO7fJ7TPvdHFS3sO8cySjy2YJRZD7f5PtFTEbyCwHg05Q5BjT
 KhudYNDJM8zq/VaMd/6/KU+MnuFLhdp/s7T5dHkbQ8Iiybjxp1nL3/5dadRvhoY7+Z4k
 NrlQ==
X-Gm-Message-State: AOAM533T4+FlbUJsSQXPIggyMPQnBNwMb9l2I5sYO7LUYivK8yEMASkc
 KqsWEDCFY5JvYvd5UxOf++MXRRERAtsbhFsUL/8=
X-Google-Smtp-Source: ABdhPJyUuZ/pm1uTwrOAd1r8XOx2InBj72TZUoeZk02PSKa0SZ1EafBYuxeqTNLixEFNw1UVy/4Mwvu6ev8CnvLJWQQ=
X-Received: by 2002:a50:d51e:: with SMTP id u30mr5369297edi.296.1596739567042; 
 Thu, 06 Aug 2020 11:46:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAGnHSEkpYqyZJjG587FSVUzYX2zV1tm83zj+uGjF4e24o4iAMA@mail.gmail.com>
 <20200806020601.GA6286@laptop>
 <CAGnHSEnMhF-1y7rL=JsmcFdTNVaA5ygv5N4TS9dhpORyOm+H_A@mail.gmail.com>
 <20200806091458.GA360003@workstation>
 <CAGnHSEkV9cpWoQKP1mT7RyqyTvGrZu045k=3W45Jm=mBidqDnw@mail.gmail.com>
 <20200806144729.GA381789@workstation>
 <CAGnHSEn+hLKCtyhW8i2PBy2Wo-yMfpK6Jc49avrHXY8BA9N1VQ@mail.gmail.com>
 <20200806171936.GA400233@workstation>
In-Reply-To: <20200806171936.GA400233@workstation>
From: Tom Yan <tom.ty89@gmail.com>
Date: Fri, 7 Aug 2020 02:45:55 +0800
Message-ID: <CAGnHSEnun90VwfYrLEBi0TJM3PxVjoDrzQKBCyUwzAXBZwtHxA@mail.gmail.com>
Subject: Re: Why doesn't mixer control (values) have some kind of locking
 mechanism? (mutex?)
To: Tom Yan <tom.ty89@gmail.com>, alsa-devel@alsa-project.org, 
 alsa-user@alsa-project.org, pulseaudio-discuss@lists.freedesktop.org, 
 pierre-louis.bossart@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 7 Aug 2020 at 01:19, Takashi Sakamoto <o-takashi@sakamocchi.jp> wrote:
>
>
> In your case, SNDRV_CTL_IOCTL_ELEM_LOCK looks 'write-lock', therefore
> any userspace applications can do read operation to the control element
> locked by the other processes.
>
> To solve the issue, the pair of read/write operations should be done
> between lock/unlock operations. I can consider about two cases.
>
> A case is that all of applications implements the above. This is
> already proposed. The case is that the world is universe.
>
> +-----------+-----------+
> | process A | process B |
> +-----------+-----------+
> |   lock    |           |
> |   read    |           |
> |           |lock(EPERM)| reschedule lock/get/put/unlock actions
> |   write   |           |
> |           |lock(EPERM)| reschedule lock/get/put/unlock actions
> |  unlock   |           |
> |           |   lock    |
> |           |   read    | calculate for new value
> |           |   write   |
> |           |  unlock   |
> +-----------+-----------+
>
> Another case is that a part of application implements the above. Let
> me drill down the case into two cases. These cases are realistic
> (sign...):
>
> +-----------+------------+
> | process A | process B  |
> +-----------+------------+
> |   lock    |            |
> |   read    |            |
> |   write   |            |
> |           |    read    | calculate for new value
> |           |write(EPERM)|
> |  unlock   |            |
> |           |   write    | <- expected value
> +-----------+------------+
>
> +-----------+------------+
> | process A | process B  |
> +-----------+------------+
> |   lock    |            |
> |   read    |            |
> |           |   read     | calculate for new value
> |   write   |            |
> |           |write(EPERM)|
> |  unlock   |            |
> |           |   write    | <- unexpected value
> +-----------+------------+
>
> The lock/unlock mechanism is not perfect solution as long as any
> applications perform like the process.
>
> If we can expect the most of applications to be back to read operation
> at failure of write operation, thing goes well.
>
> +-----------+------------+
> | process A | process B  |
> +-----------+------------+
> |   lock    |            |
> |   read    |            |
> |           |   read     | calculate for new value
> |   write   |            |
> |           |write(EPERM)|
> |  unlock   |            |
> |           |   read     | calculate for new value
> |           |   write    | <- expected value
> +-----------+------------+
>

Oh you were saying, while it is a "write lock in nature", if all the
processes considered/involved make use of it (properly, by attempting
to lock before *reading*), it would work like a "full" lock. Sorry I
wasn't thinking straight.

And I guess there's no point in changing it into a "real" full lock in
the kernel anyway as that won't prevent whatever that doesn't make use
of it race with each other.

Okay so I suppose that means we can/should at least fix amixer with it
for now and see if we can/want to get something better into the
kernel. (I am in no position to comment on whether we should do
compare-and-swap as I don't know if it's a good idea programmatically
speaking, or if there's a huge price in any aspect; all I know is that
it *looks* more neat.)

Thanks a lot! Should I file an issue additionally in the alsa-utils
github repo btw?

>
> Thanks
>
> Takashi Sakamoto
