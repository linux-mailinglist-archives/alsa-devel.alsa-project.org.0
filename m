Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC45657C2E2
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jul 2022 05:44:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FDD91774;
	Thu, 21 Jul 2022 05:43:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FDD91774
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658375079;
	bh=IxndbWF+iYoDEGVDRtxB5l7D6zF0XAS1zFbJO5reIIE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hed12WvGqylDfkz/3OPiMvtVv3nLDt4Jar+hoc4amVWjRoi4Cas3OsEy7MghA5WQ4
	 EsXi3Vup0/7AHejcv0Np3VRVmXUuW/7Bksrz0mf6lbU+9pDcnA+Rwa8Z0T5H0A5HBI
	 VqD6P6f0RFW+mKy8YSWpV6ZzLwkjBtjVsUTZaSnI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91949F80256;
	Thu, 21 Jul 2022 05:43:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39CC4F8016D; Thu, 21 Jul 2022 05:43:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,PRX_BODY_65,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DC9CF80166
 for <alsa-devel@alsa-project.org>; Thu, 21 Jul 2022 05:43:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DC9CF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="p1MOI/Pw"
Received: by mail-ed1-x536.google.com with SMTP id r6so638697edd.7
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 20:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=6npaS1zRKm+yyU2zCsQvl5XLwT7kKQ+yzE8xge/iXYI=;
 b=p1MOI/PwyKmAKZLRGUU7wHJ3gwmCfOuMSd9qe8/di7NRgYoQPVattGIm2LLA/5ZRzt
 UmkU5j7zN1FHuEPODuf5718XISFVfuLHo7rlPOyFt0V58zPmMwJD1kG7cNARq4n1qG1/
 xWPDaDD+f5JXnDkwiGvO7GhQVNM9VnDE/QT9Wer6VhUl3z6bBcM9aN93BWHJJX/y/Q3I
 HBozrneJP0gbcCgI0IKl+MyC0FQKZzDHKL02n/9I3eqSk38jOFbMYJk3ShWxQIAokptk
 0ew9hHw8UUP63i9jplHud3h+FVPCkA0FQyUiO55QiCkqmVKmB+mDy86it0JvXhH0iuM9
 +ncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=6npaS1zRKm+yyU2zCsQvl5XLwT7kKQ+yzE8xge/iXYI=;
 b=vN99Ef2dzyTK9E0ou+luoyjAL9WZAryfyt+rbcu1JOH60hHJDoxE2p9E6E7IvWzZwN
 sZMmOfAuaxRl1uDwL5M76momY/Yfi8peqUOZ+EICUvGxFyqMkmgLG4f4/kxueNA9qE2i
 AecxERYdlmPJ2HQiHKikB6WPDZy6IORoSCrwGQW7EwUuMRgzFKPf4TClsPspDE67taje
 KXIOSL7g5b44qSp03LLDkCah4S3kY17LnJ5ue71WGVwVYmJ5GEW7BKHzdvgQ7cZUHv8j
 +ZxPi9hGCa522Pa8nKHO8yoBbJNQAYJxeyf27r58ZBjKbV6kjZRHwhuMW3UfN29AKnED
 1H9Q==
X-Gm-Message-State: AJIora+77Xuw1YgSNpw+KY87aiGzPzpzI25T0ROuFgK4Qekaab9fN6ZF
 EU8EVpTwUwyHIkV/Tdw3qiOvUowV9dhfQchuEAM=
X-Google-Smtp-Source: AGRyM1uOI+8BZmBho8NWh0C+///IOSzyEsQPkRoYp57fJlWZ+qY2k+4HwdfPpAVjNR2BGQDSHLue/6IDKdxW5yyntWw=
X-Received: by 2002:a05:6402:3326:b0:43a:902b:d335 with SMTP id
 e38-20020a056402332600b0043a902bd335mr55228432eda.412.1658375009916; Wed, 20
 Jul 2022 20:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220719065357.2705918-1-airlied@gmail.com>
 <20220719094835.52197852@sal.lan>
In-Reply-To: <20220719094835.52197852@sal.lan>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 21 Jul 2022 13:43:18 +1000
Message-ID: <CAPM=9tzoB_dJXgb9M7y9cJ24Z4vBmy7NRePxJARdYRLag2Vx9g@mail.gmail.com>
Subject: Re: [PATCH] docs: driver-api: firmware: add driver firmware
 guidelines. (v2)
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Wireless List <linux-wireless@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-block@vger.kernel.org,
 "Luis R. Rodriguez" <mcgrof@kernel.org>,
 Network Development <netdev@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 "dri-devel@lists.sf.net" <dri-devel@lists.sf.net>,
 Dave Airlie <airlied@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
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

> It is hard to enforce how vendors will version their firmware. On media,
> we have some drivers whose major means different hardware versions. For
> instance, on xc3028, v3.x means low voltage chips, while v2.x means
> "normal" voltage. We end changing the file name on Linux to avoid the risk
> of damaging the hardware, as using v27 firmware on low power chips damage
> them. So, we have:
>
>         drivers/media/tuners/xc2028.h:#define XC2028_DEFAULT_FIRMWARE "xc3028-v27.fw"
>         drivers/media/tuners/xc2028.h:#define XC3028L_DEFAULT_FIRMWARE "xc3028L-v36.fw"
>
> As their main market is not Linux - nor PC - as their main sales are on
> TV sets, and them don't officially support Linux, there's nothing we can
> do to enforce it.
>
> IMO we need a more generic text here to indicate that Linux firmware
> files should be defined in a way that it should be possible to detect
> when there are incompatibilities with past versions.
> So, I would say, instead:
>
>         Firmware files shall be designed in a way that it allows
>         checking for firmware ABI version changes. It is recommended
>         that firmware files to be versioned with at least major/minor
>         version.

This sounds good, will update with this.

>
> > It
> > +  is suggested that the firmware files in linux-firmware be named with
> > +  some device specific name, and just the major version.
>
> > The
> > +  major/minor/patch versions should be stored in a header in the
> > +  firmware file for the driver to detect any non-ABI fixes/issues.
>
> I would also make this more generic. On media, we ended adding the firmware
> version indicated at the file name. For instance, xc4000 driver checks for
> two firmware files:
>
> drivers/media/tuners/xc4000.c:#define XC4000_DEFAULT_FIRMWARE "dvb-fe-xc4000-1.4.fw"
> drivers/media/tuners/xc4000.c:#define XC4000_DEFAULT_FIRMWARE_NEW "dvb-fe-xc4000-1.4.1.fw"

This is probably fine for products where development never produces
much firmwares, but it quickly becomes unmanageable when you end up
with _NEW_NEW_NEW etc.

I'd rather not encourage this sort of thing unless it is totally
outside our control. So I'd like to keep the guidelines for when we
have some control what we'd recommend.

In this case I'd have recommended you put the 1.4.1 in the header of
the fw, and just have it called dvb-fe-xc4000-1.fw and overwrite the
NEW with the OLD, I understand we likely don't have the control here.

> > +  firmware files in linux-firmware should be overwritten with the newest
> > +  compatible major version.
>
> For me "shall" is mandatory, while "should" is optional.
>
> In this specific case, I'm not so sure if overriding it is the best thing
> to do on all subsystems. I mean, even with the same ABI, older firmware
> usually means that some bugs and/or limitations will be present there.

As long as you can detect the minor/patch versions from the firmware
file after loading it you should be able to do sufficient workarounds.
>
> That's specially true on codecs: even having the same ABI, older versions
> won't support decoding newer protocols. We have one case with some
> digital TV decoders that only support some Cable-TV protocols with
> newer firmware versions. We have also one case were remote controller
> decoding is buggy with older firmwares. On both situations, the ABI
> didn't change.

If the only way to figure that out is by the filename or minor
version, then so be it, but where people have some control I'd rather
provide some harder guidelines.

Dave.
