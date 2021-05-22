Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FEC38D6C5
	for <lists+alsa-devel@lfdr.de>; Sat, 22 May 2021 20:04:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 375201686;
	Sat, 22 May 2021 20:04:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 375201686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621706697;
	bh=+YWbL8Wao79d+ZiILzk6c350PpJXczeLfFM7+sy3U8w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cjFH2a+bUR3SPu0GO8YODrhqLZrNId4tRbb3C5C+PmGGb6Mfuqdr1HoCRZJoHZ2bs
	 /0nnlnQWoMdaOMUutVJ5ZEKc3JCwjAJosPTFeH+8gDFsDMu5ifJ/EkyDNBMCipmGq+
	 jfkNTKfWaDDY8nlxhRgl9/HOsDjfIGXcNpj1EJtE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9154FF80229;
	Sat, 22 May 2021 20:03:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AF30F80217; Sat, 22 May 2021 20:03:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_21,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDB28F800E5
 for <alsa-devel@alsa-project.org>; Sat, 22 May 2021 20:03:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDB28F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="muQq2swW"
Received: by mail-pg1-x533.google.com with SMTP id l70so16882019pga.1
 for <alsa-devel@alsa-project.org>; Sat, 22 May 2021 11:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kgByPaKMRlbcsDoWOQvJ40jszq+jqFURhAL/dvpTFDI=;
 b=muQq2swWToOetBfoBOYs1Mg8IYHvDznj2Jhoo8O9OU/LiJPmSmfac3lYdZqP+s7qSb
 TiB0dQLXmwOnWW5us5j8zEXY7Pt1CVWoYQrUzkR5PxQpxMUCkdABZfsUDlLgK0JxWUh+
 LgogKyArKWvUKf4iqV3/RaWNEt4MwUlDAHOg2Aglnam4mZOM1u+5rXiHq32mWLxjWtuX
 S2Kr6gSkjwIKVy4tH856Q+H3CPLnB4QA5AkNVObSLFwzHwvv5z4jU1GwMGpB7sMTrW9H
 O44h2flPw1iBXpT6Pn2TLuA/NAiGYDN8ZP06ovw10EB53Ydxvb/mTy7JR3TD2F0eAUkw
 neTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kgByPaKMRlbcsDoWOQvJ40jszq+jqFURhAL/dvpTFDI=;
 b=eRMc1W6kcs0IEdKy4koWjVE7jXBypAr91yQLyoLamPFAWvHHYipOvQJxdgGD4mSniK
 7KznWxAx9QDBGVlBt3B/Az0qM0GY19r2tMEAYd2xiFtGAjpLqLCm2+cl8l3y1A56g43Y
 voW8JU6WVyghp8J7jXNzAGqF4NFU/JTR4xfvcOhQGZl61rbf71w4KFgZK8r3zugI+D5Q
 1jQXTSOCiZvgED9gIYId3isx/eXFtJs7ip+AbrmRuOHQShb9Xj/uPbRZmReoYJbP6grc
 cWB2KEyJL3XGcbhUqIDwfmcvUozpqddzgl/MZg8/mzZit5Vm9h7ifeVkLIwJGMWkzxu1
 EZNg==
X-Gm-Message-State: AOAM531WRFTlJD6zx6dCOnoyllzxy4xCnqQwwMRIKVgEYdYWofpqjM9U
 8oDsLaN9kQ3tp4oYQVnkF1ZfgEgRpZ28VspcL9A=
X-Google-Smtp-Source: ABdhPJwzsYfuD2dQ49rIqZhTOcduPoAw+ran4Gh3eObbejt7z4KWqRGyayVLp46Rm4esYOYdVjEqeqjd8GEo9AAZVP8=
X-Received: by 2002:a63:4145:: with SMTP id o66mr5279957pga.4.1621706598731;
 Sat, 22 May 2021 11:03:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210521171418.393871-1-hdegoede@redhat.com>
 <20210522190138.1715b095@jic23-huawei>
In-Reply-To: <20210522190138.1715b095@jic23-huawei>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 22 May 2021 21:03:02 +0300
Message-ID: <CAHp75Vex3uvGz+g9rkuU3wMwFOui-fASxvcP7b3KNCQ2CrBH3A@mail.gmail.com>
Subject: Re: [PATCH 0/8] iio: accel: bmc150: Add support for yoga's with dual
 accelerometers with an ACPI HID of DUAL250E
To: Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 linux-iio <linux-iio@vger.kernel.org>, patches@opensource.cirrus.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jeremy Cline <jeremy@jcline.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>
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

On Sat, May 22, 2021 at 9:00 PM Jonathan Cameron <jic23@kernel.org> wrote:

> On Fri, 21 May 2021 19:14:10 +0200
> Hans de Goede <hdegoede@redhat.com> wrote:

> > Some 360 degree hinges (yoga) style 2-in-1 devices use 2 bmc150 accels
> > to allow the OS to determine the angle between the display and the base
> > of the device, so that the OS can determine if the 2-in-1 is in laptop
> > or in tablet-mode.
> >
> > We already support this setup on devices using a single ACPI node
> > with a HID of "BOSC0200" to describe both accelerometers. This patch
> > set extends this support to also support the same setup but then
> > using a HID of "DUAL250E".
> >
> > While testing this I found some crashes on rmmod, patches 1-2
> > fix those patches, patch 3 does some refactoring and patch 4
> > adds support for the "DUAL250E" HID.
> >
> > Unfortunately we need some more special handling though, which the
> > rest of the patches are for.
> >
> > On Windows both accelerometers are read (polled) by a special service
> > and this service calls a DSM (Device Specific Method), which in turn
> > translates the angles to one of laptop/tablet/tent/stand mode and then
> > notifies the EC about the new mode and the EC then enables or disables
> > the builtin keyboard and touchpad based in the mode.
> >
> > When the 2-in-1 is powered-on or resumed folded in tablet mode the
> > EC senses this independent of the DSM by using a HALL effect sensor
> > which senses that the keyboard has been folded away behind the display.
> >
> > At power-on or resume the EC disables the keyboard based on this and
> > the only way to get the keyboard to work after this is to call the
> > DSM to re-enable it (similar to how we also need to call a special
> > DSM in the kxcjk-1013.c accel driver to re-enable the keyboard).
> >
> > Patches 5-7 deal with the DSM mess and patch 8 adds labels to the
> > 2 accelerometers specifying which one is which.
>
> Given only thing I'm planning to do is tweak the line wrapping, I'm
> happy to pick this series up.
>
> The two fixes will slow things down a bit though as we should probably
> get those upstream this cycle.
>
> I'm going to leave this on list for a few days before I take anything
> though, to give others time to take a look.

You are, guys, too fast :-)

I have few (minor) comments on a few patches, in general they are okay!
So, after settling on the comments,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
for the entire series.

Thanks, Hans, for doing this!

> One side note, cc list includes a few random choices... Seems you've
> accidentally included alsa people as well as IIO ones.


-- 
With Best Regards,
Andy Shevchenko
