Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 094DC2E3DD0
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Dec 2020 15:21:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95EFF1720;
	Mon, 28 Dec 2020 15:20:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95EFF1720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609165304;
	bh=6P02yudSFuRvDAb1yd+N9QI67Furir65Ex3Xgg8iHx8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lGcdfBY6LfGi6RHBOIV6fmh4wuPpICqBfehEsvtPbZDZAXroAQOFImrSQp5buN8S5
	 oMBc953GjmqA/a/FcPGJkdkEkctX/Kka0PFsxgxJfM691Zn0rTHdWjNgTHZ91c+8mk
	 O++kRNWndTCTVnEkU0/ZM0SXeq13+IX44HkjoQzk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C332F801F9;
	Mon, 28 Dec 2020 15:20:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B924EF801F5; Mon, 28 Dec 2020 15:20:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F01BEF80143
 for <alsa-devel@alsa-project.org>; Mon, 28 Dec 2020 15:20:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F01BEF80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kXj6ALbb"
Received: by mail-pl1-x632.google.com with SMTP id j1so5709337pld.3
 for <alsa-devel@alsa-project.org>; Mon, 28 Dec 2020 06:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c3eeDccvrtLhJ2RlU4cT+GxgHVi8ODX3K/3/cMoQn/k=;
 b=kXj6ALbb7BsUDHxYmTLQCj+IoAVVGAFFcd/GgRVc1henpkMQOd3UkBcPkLLlBdf9FF
 q6M8/srNJmwFr5kf5LhooXTW+6g6Ihfzov1bjX3G0HPc8uSvzXuft7hoORGrGtENY6lC
 +RoQyAkLm2S5THWl+AubvKZ5ueibnu5Lj0mGBkvtF7o23RGpXobbsnFi6OJMjMTwTGhb
 383K9+T1iDrltKQIyGN0Oc7PhcEcIDfc0NQHvd+kJs4/StE2E0E3E2dRCZRQHtbXhSyw
 kWwHZKwSjNJA4QEmE1WAICI7Z2R3lNheiQWhRCM541xMsPxJqjTZgN7C1LYr3nXjwP8i
 HKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c3eeDccvrtLhJ2RlU4cT+GxgHVi8ODX3K/3/cMoQn/k=;
 b=h493WC3Gpy2FKjhs6u6CShNbh5ncvsZGyliamQrVlIVzuNhzvl727FIaTF6oF1/UHf
 gtuBFXJGkcgexwTF6hhQGhc7d3aIz+PTn057t6JqLO9gFZrRHEWabL6DcDkag+zop54/
 CL+jnJhGePN1pdd+u5tUgBp64BIb6P2FIb/M7O9ZWRU4FBiv8Itgx7PO8GDvBPBzLwbQ
 yP20j+xaOeLRVrPypLfSsKjIfc5UI5pJ+YOkRVbKzoFLn8TyhhVriz/3s+qExzaUEpbW
 VHiefKYNClv3qqNVpJeniCvF3ilnQ/Frxm0dPF6mRwXHOb59GnTwIUrRDkoXcb5XGUlE
 TawA==
X-Gm-Message-State: AOAM532b2eP8dEIepUqgEAQHSGjFgyhc+swiXGFgsxL4cKTRqkBHSaer
 b4PFfeoQYwl9ocYsIJCU+TA9/q9XjYhxV0fj0hk=
X-Google-Smtp-Source: ABdhPJwNC33nHrVZvkEyUW3jXHOEfzfHJSbX/0d6I5CasyY83H4HtlUyaSLZUVZKRF8RaXC/Ld1qRvjesVFnjc4wom4=
X-Received: by 2002:a17:902:e98c:b029:da:cb88:f11d with SMTP id
 f12-20020a170902e98cb02900dacb88f11dmr24012086plb.17.1609165203427; Mon, 28
 Dec 2020 06:20:03 -0800 (PST)
MIME-Version: 1.0
References: <20201227211232.117801-1-hdegoede@redhat.com>
In-Reply-To: <20201227211232.117801-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 28 Dec 2020 16:19:46 +0200
Message-ID: <CAHp75VcMGjhuNWgVx6Jn6vGCN8pvPO5ePz7oprabhiW=Ffc_rg@mail.gmail.com>
Subject: Re: [PATCH 00/14] MFD/extcon/ASoC: Add support for Intel Bay Trail
 boards with WM5102 codec
To: Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 patches@opensource.cirrus.com, Mark Brown <broonie@kernel.org>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Lee Jones <lee.jones@linaro.org>
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

On Sun, Dec 27, 2020 at 11:15 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi All,
>
> This patch series adds support for Intel Bay Trail based device which use
> a WM5102 codec for audio output/input. This was developed and tested on a
> Lenovo Yoga Tablet 1051L.
>
> This series consists of 3 parts:
> 1. Arizona MFD drv patches for ACPI bindings, better jack-detect support
>    and misc. fixes
> 2. extcon-arizona driver fixes and improved jack reporting (this depends
>    on the MFD changes)
> 3. ASoC patches in the form of a quirk for BYTCR detecting, a new
>    machine driver for BYT + WM5102 and jack-detect support for the new
>    machine driver (which again depends on the MFD changes).
>
> Given that 2. and 3. depend on the MFD changes I believe that it is best
> if all patches in this series are merged through the MFD tree (once
> reviewed and acked) and then Lee can provide a immutable branch for
> the ASoC and extcon maintainers to merge into their trees.
>
> I have a patch with matching UCM profile changes available here:
> https://github.com/jwrdegoede/alsa-ucm-conf/commit/316109e7814926ba984322c1d9190575fab9021c
>
> This series + the UCM profile has been tested with both the SST and
> SOF ASoC drivers for BYT devices.

Thanks for fixing this!
I found the series pretty much in a good shape (only two patches I
think need a bit of work), FWIW
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
after addressing comments.

> BugLink: https://github.com/thesofproject/linux/issues/2485

Shouldn't this be somewhere in the "main" fix? (Yes, I understand that
it may sound silly and should be copied to almost half of the series,
but if there is a good place it would be nice to have in the Git
history)


-- 
With Best Regards,
Andy Shevchenko
