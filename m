Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E07FFCE47F
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 16:01:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 319671616;
	Mon,  7 Oct 2019 16:00:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 319671616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570456860;
	bh=GGpquykgMEZOg7c7+F1Hv5RmLLFNZJVVRM2CDize5Jk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TEgx/A6ZHqGz8rTlvhV0a0RoV3nyz5NDyaFkXHaq8G27zKxYFKUTn1vbcuU725d4J
	 cOmCBiEmvULe2FBCk4nBsmDbRPdhvNlqk/3oASbLHecNXRl+Dx9oN/ptgYO2bxeJ57
	 m5Cewf59zdxh4XvPJjTzyMaEpS+mo4m6gXmppXlY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A20C2F802DF;
	Mon,  7 Oct 2019 15:59:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22834F800BF; Mon,  7 Oct 2019 15:59:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_30,
 SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BC25F800BF
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 15:59:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BC25F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="kDOH59OZ"
Received: by mail-vs1-xe42.google.com with SMTP id d204so8919205vsc.12
 for <alsa-devel@alsa-project.org>; Mon, 07 Oct 2019 06:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ctSXe3Qibn7SwlKCbsSDIKSVJbFoB8K7abxEy4a8a2Y=;
 b=kDOH59OZ6r1FcPSXe+JGbtRsP2+75ns0l5OY5gHErPOOKope1DPRHLXTxUrkcPgf6z
 bLCUrMwDkb0U8f1EbVgdAYQXz+IY/WPdw2QVF8FpuYOIqlo3/g+rPGykW5dJExYIIRbs
 gBiPr5yJigX15w4y1wtSGnsdBzV6QSQO13RXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ctSXe3Qibn7SwlKCbsSDIKSVJbFoB8K7abxEy4a8a2Y=;
 b=eoysLaigd35Vp+8saKik4o18v2OQTPgKwrmlCP+4nZE/HxFSInAzgC+jRIY7AdJfA/
 Cgm1F8LZB26+QAEBksbwaKIgFCtIKoAgB5yd2qeLCdB3oWvPjGG6hfUI/+qGRMkfw2TO
 GId2afubxpwHGIpo3NqErHMt7yJFIGTjZz90sI+vzjb+Q/YeXOxm9P4ZrEfHH2n8UJHf
 pdVXcsqmgvb3WT+b/y/8mN0S0S9tPBAm6QQajdl3lzjlwDmf97gtKx3Pzz/KZQ2KtHIk
 aalJ7cB0s0vuIsPTXT6+k4/diU5ZzIHdiJM0HZFwXvQL8q/hPdOgQatRB8luQoHZOJXD
 lybQ==
X-Gm-Message-State: APjAAAXqFo4g2zPQWy/oZALUGwJRzDS6cU6Jnh4cIaWwMn1nNnKDrCfq
 6jOpyw/r3MG54Jat61rDBatKuE5fkEqRz8hjEfzIuw==
X-Google-Smtp-Source: APXvYqzvEfSO3HqKvInVixjThDGPwl6gp+QVYjOFJmfDBQtcYmmYhlgtXAGem4GcilN/j4BZcMBegIbfRsM/k/N7jPA=
X-Received: by 2002:a67:2b86:: with SMTP id
 r128mr15828347vsr.119.1570456748312; 
 Mon, 07 Oct 2019 06:59:08 -0700 (PDT)
MIME-Version: 1.0
References: <20191007071610.65714-1-cychiang@chromium.org>
 <CA+Px+wWkr1xmSpgEkSaGS7UZu8TKUYvSnbjimBRH29=kDtcHKA@mail.gmail.com>
 <ebf9bc3f-a531-6c5b-a146-d80fe6c5d772@roeck-us.net>
In-Reply-To: <ebf9bc3f-a531-6c5b-a146-d80fe6c5d772@roeck-us.net>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Mon, 7 Oct 2019 21:58:41 +0800
Message-ID: <CAFv8NwLuYKHJoG9YR3WvofwiMnXCgYv-Sk7t5jCvTZbST+Ctjw@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Hung-Te Lin <hungte@chromium.org>,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Dylan Reid <dgreid@chromium.org>
Subject: Re: [alsa-devel] [PATCH] firmware: vpd: Add an interface to read
	VPD value
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

On Mon, Oct 7, 2019 at 8:27 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 10/7/19 1:03 AM, Tzung-Bi Shih wrote:
> > On Mon, Oct 7, 2019 at 3:16 PM Cheng-Yi Chiang <cychiang@chromium.org> wrote:
> >>
> >> Add an interface for other driver to query VPD value.
> >> This will be used for ASoC machine driver to query calibration
> >> data stored in VPD for smart amplifier speaker resistor
> >> calibration.
> >>
> >> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> >> ---
> >>   drivers/firmware/google/vpd.c              | 16 ++++++++++++++++
> >>   include/linux/firmware/google/google_vpd.h | 18 ++++++++++++++++++
> >>   2 files changed, 34 insertions(+)
> >>   create mode 100644 include/linux/firmware/google/google_vpd.h
> >>
> >> diff --git a/drivers/firmware/google/vpd.c b/drivers/firmware/google/vpd.c
> >> index db0812263d46..71e9d2da63be 100644
> >> --- a/drivers/firmware/google/vpd.c
> >> +++ b/drivers/firmware/google/vpd.c
> >> @@ -65,6 +65,22 @@ static ssize_t vpd_attrib_read(struct file *filp, struct kobject *kobp,
> >>                                         info->bin_attr.size);
> >>   }
> >>
> >> +int vpd_attribute_read_value(bool ro, const char *key,
> >> +                            char **value, u32 value_len)
>
> FWIW, I don't think the "_value" in this function name adds any value,
> unless there is going to be some other read function.
ACK
>
> The API should be documented, and state clearly that the caller must release
> the returned value.
ACK
>
> >> +{
> >> +       struct vpd_attrib_info *info;
> >> +       struct vpd_section *sec = ro ? &ro_vpd : &rw_vpd;
> >> +
> >> +       list_for_each_entry(info, &sec->attribs, list) {
> >> +               if (strcmp(info->key, key) == 0) {
> >> +                       *value = kstrndup(info->value, value_len, GFP_KERNEL);
> >
> > Value is not necessary a NULL-terminated string.
> > kmalloc(info->bin_attr.size) and memcpy(...) would make the most
> > sense.
> >
> kmemdup() ?
ACK
>
> > The value_len parameter makes less sense.  It seems the caller knows
> > the length of the value in advance.
> > Suggest to change the value_len to report the length of value.  I.e.
> > *value_len = info->bin_attr.size;
> >  > Also please check the return value for memory allocation-like
> > functions (e.g. kstrndup, kmalloc) so that *value won't be NULL but
> > the function returned 0.
> >
> >> +                       return 0;
> >> +               }
> >> +       }
> >> +       return -EINVAL;
>
> Maybe something like -ENOENT would be more appropriate here.
>
ACK
> >> +}
> >> +EXPORT_SYMBOL(vpd_attribute_read_value);
> >> +
>
> I would suggest to use EXPORT_SYMBOL_GPL().
>
ACK

Hi Guenter,
Thanks for the quick review.
I'll update accordingly in v2.

> >>   /*
> >>    * vpd_section_check_key_name()
> >>    *
> >> diff --git a/include/linux/firmware/google/google_vpd.h b/include/linux/firmware/google/google_vpd.h
> >> new file mode 100644
> >> index 000000000000..6f1160f28af8
> >> --- /dev/null
> >> +++ b/include/linux/firmware/google/google_vpd.h
> >> @@ -0,0 +1,18 @@
> >> +/* SPDX-License-Identifier: GPL-2.0 */
> >> +/*
> >> + * Google VPD interface.
> >> + *
> >> + * Copyright 2019 Google Inc.
> >> + */
> >> +
> >> +/* Interface for reading VPD value on Chrome platform. */
> >> +
> >> +#ifndef __GOOGLE_VPD_H
> >> +#define __GOOGLE_VPD_H
> >> +
> >> +#include <linux/types.h>
> >> +
> >> +int vpd_attribute_read_value(bool ro, const char *key,
> >> +                            char **value, u32 value_len);
> >> +
> >> +#endif  /* __GOOGLE_VPD_H */
> >> --
> >> 2.23.0.581.g78d2f28ef7-goog
> >>
> >
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
