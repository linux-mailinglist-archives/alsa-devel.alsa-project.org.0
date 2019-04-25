Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E52FB583
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Apr 2019 09:34:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3A22871;
	Sun, 28 Apr 2019 09:33:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3A22871
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556436843;
	bh=njBIZyqvRMc65mqsFx6d487Uo4sWGL9oLvi2QDrNeXY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fcy/N4SGlRph/LizxaBsyNwN/26hcZ1UDAiztkWlBn8zF7HYjcg2beyhgK8jYoR5M
	 mzkR66MfQ/ab7GKN6Y8qe3D4XboZAVlrAL8D8Nf9mAkBbwtKGfh+79jWVPo32A1pep
	 dY5/H/+LSB9NGFKuqwMbE0sEiw6j372qhKf27BBw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51CECF89726;
	Sun, 28 Apr 2019 09:30:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E294CF896DB; Thu, 25 Apr 2019 18:38:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-it1-x143.google.com (mail-it1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0983F80C41
 for <alsa-devel@alsa-project.org>; Thu, 25 Apr 2019 18:38:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0983F80C41
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="j1TPVsIh"
Received: by mail-it1-x143.google.com with SMTP id w15so1190177itc.0
 for <alsa-devel@alsa-project.org>; Thu, 25 Apr 2019 09:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VHDZQTX3nTBqKHo1hwDhNBgtUmmqtkCr53n/vkeR56Q=;
 b=j1TPVsIhDKAuuO0VpVPCDmktnph6s35mRzixFM1NAho8Fq+Z/s0YMnD9bGYGOLL90T
 U1eJJrcQHy5O4bCAHLQYw24J83Ik0tKEDl3JU+R9b7H/HBj2Ne7ipEqgVUfSNKuyZQ3x
 7fiWkfcZlPYtP+Yf7sXyv0eV4KKPScuOZgM44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VHDZQTX3nTBqKHo1hwDhNBgtUmmqtkCr53n/vkeR56Q=;
 b=MIDNfbUKeiji+Yw3t99pMdzsLN0nABL3PHdMCaC1q144MCk5ZVRIItLMmOckRg2D7M
 S9Hn+j0RM9oeuKfP53to7aiW1LckhrW3zvRJapk9KdBhQpoNaghhhK59Ko6RoYD0kRjx
 DFa5FXYmc44AvBylw/WqB03I7TG0Rzk1YayfwI69y5Zb1AUyDP8IFNKncYnTWNn9r2Lq
 iECCLrUTXDrnLEeEm6CnqYA5mDo6YyIaghXHbd0qtQIYALcPaAiDQxAt1xVuvFZyTAUx
 S8pXZwrGx1KFcZcapeEXARjfavZaXkFThrnejzrc/BbRAHqDwjP8Yqxt2FcUs0ZbEYJk
 yJmA==
X-Gm-Message-State: APjAAAUKtdZhLgmHwLy+M4imhV/4KBQpvgD+a4e7wLL8fzyZwYM2ZlUe
 NcJ+5N9xhotFi99+OhUuoLviYuyoKConJ20MU6C29A==
X-Google-Smtp-Source: APXvYqxNy4UeJbrXeclqdR151+4gMxTbAtwFxtI2swR6YMhD574KAt1e8MS4I5F0GpJLsf1ugAYv69xntqo8PDwhr74=
X-Received: by 2002:a24:90f:: with SMTP id 15mr4436683itm.100.1556210300671;
 Thu, 25 Apr 2019 09:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190424232918.243308-1-gwendal@chromium.org>
 <20190425081232.GA14758@dell>
 <aa1c0ab7-6491-69a8-936c-26460b78d6c2@collabora.com>
 <CAPUE2ussoqWAP-1Hpa2mGq-23NuTh=Ai3dssiZYYiqLBDTCJwQ@mail.gmail.com>
 <0fad0c23-7939-606e-86e1-748dd1115b82@collabora.com>
In-Reply-To: <0fad0c23-7939-606e-86e1-748dd1115b82@collabora.com>
From: Gwendal Grignou <gwendal@chromium.org>
Date: Thu, 25 Apr 2019 09:38:09 -0700
Message-ID: <CAPUE2uu7npyi0jgHPLCD-3DWkiKuhRidBgyiVK6O1TesHLqkEg@mail.gmail.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-Mailman-Approved-At: Sun, 28 Apr 2019 09:30:26 +0200
Cc: alsa-devel@alsa-project.org, Lee Jones <lee.jones@linaro.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Guenter Roeck <groeck@chromium.org>,
 Benson Leung <bleung@chromium.org>, Cheng-Yi Chiang <cychiang@chromium.org>
Subject: Re: [alsa-devel] [PATCH 00/30] Update cros_ec_commands.h
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Apr 25, 2019 at 9:11 AM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> Hi,
>
> cc'ing some ASOC reviewers.
>
> On 25/4/19 18:00, Gwendal Grignou wrote:
> > On Thu, Apr 25, 2019 at 4:19 AM Enric Balletbo i Serra
> > <enric.balletbo@collabora.com> wrote:
> >>
> >> Hi Gwendal, Lee
> >>
> >> On 25/4/19 10:12, Lee Jones wrote:
> >>> On Wed, 24 Apr 2019, Gwendal Grignou wrote:
> >>>
> >>>> The interface between CrosEC embedded controller and the host,
> >>>> described by cros_ec_commands.h, as diverged from what the embedded
> >>>> controller really support.
> >>>>
> >>>> The source of thruth is at
> >>>> https://chromium.googlesource.com/chromiumos/platform/ec/+/master/include/ec_commands.h
> >>>>
> >>>> That include file is converted to remove ACPI and Embedded only code.
> >>>>
> >>>> From now on, cros_ec_commands.h will be automatically generated from
> >>>> the file above, do not modify directly.
> >>>>
> >>>> Fell free to squash the commits below.
> >>>
> >>> This is going to need a bunch of Chromium reviews (and testing
> >>> ideally) before I can take this set.
> >>>
> >>
> >> I tested this patchset in different ways. With the full series applied I checked
> >> that didn't break any cros-ec driver on Kevin, Samus and Veyron devices. I also
> >> checked via userspace tool that I don't see any problem sending commands and
> >> finally I checked that applying one-by-one the patches didn't break the build on
> >> x86 and arm64, there is though, a problem,
> >>
> >> [PATCH 24/30] mfd: cros_ec: Update I2S API
> >>
> >> introduces a build problem because removes a struct that is currently used by
> >> the cros_ec_codec driver. I think that at the same time we should update that
> >> driver with the new struct name.
> > Sorry, I did not structure this patchset right. The i2s patch is available at
> > https://patchwork.kernel.org/patch/10877645/
> >
>
> I think would be better squash both patches, otherwise things like bisection
> would be a pain. The patch then touches two subsystems but won't break
> compilation, and is pretty simple, so I think should not be a problem go through
> i.e. the mfd tree.
I squashed both patches in [PATCH v2 24/30] mfd: cros_ec: Update I2S API

Thanks for the feedback,

Gwendal.
>
> > Gwendal.
> >>
> >> Once this is fixed,
> >>
> >> Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> >>
> >> for the full series.
> >>
> >> Thanks,
> >>  Enric
> >>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
