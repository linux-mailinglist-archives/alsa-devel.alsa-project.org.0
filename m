Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7697ACDDCE
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 10:55:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 083F81615;
	Mon,  7 Oct 2019 10:54:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 083F81615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570438500;
	bh=y/I3b9p1PnrNEtdCUuvBLNY0GNCNYEb/fwU/gpkje1I=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZzA2iOUqkfUJGN+fC+v29THhEUVbCL0V081TadKnDPU6W8cln6CAtrPC6QdUpOgg/
	 2QuDTQB0OsxL16EUJR5s6yySWVouVSCUopDrr6eFz1KVlzqgmnxeEAYmBHwp5cK5Jy
	 tZ2Jw8ljLTjR0Tz9xabDFzLYNMUAc8QZDUf/+Cas=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 568CDF802FB;
	Mon,  7 Oct 2019 10:53:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CA2BF802BE; Mon,  7 Oct 2019 10:53:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_30,
 SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A48A0F80137
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 10:53:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A48A0F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="cX/5/YR7"
Received: by mail-vs1-xe44.google.com with SMTP id p13so8368141vsr.4
 for <alsa-devel@alsa-project.org>; Mon, 07 Oct 2019 01:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XziM4hA4Gmod9STm0oZGOi/d+jlnR7kuU5XbW9R6uD8=;
 b=cX/5/YR7k5pAylNLIqPAAPAbqQyoHj+bpqk7ufj7PajazKDW9ENMGiSjrcmOeaOmJM
 WIlLHO7sq2wYdat4obJgNS/mHRUu9pNK/rBux1Ls6ASSnwKc2LtO8EQFsqBH/pRbhsKs
 BfJuOROtLOUPFdNOr+TBr1t8dUAWxKlmsKkrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XziM4hA4Gmod9STm0oZGOi/d+jlnR7kuU5XbW9R6uD8=;
 b=JLBo+WV1+hkS/jpLHkovaOioZibw7MUYmptRxFf+vv6BgiwyxHp1gp0ySLQC0QvKJ7
 +8m+Sv6pXuzzMaVXuMKKeA6SjydEskruYSg4MPVLhJIFoVfTTdua1S+YVxk+8xjdHB8z
 fSAJ73m4ATySrRFNxad7RAltIDfoXZpHY8aRMRpJ4Ahn+tGj/qdVZCKDWxxF41W11mHO
 Z4q+2l2mveFWB2E0R2Y61GCHEj16r0iKY6QPY22mKJ27qErYwcYCT+HlOut0BNYq06ri
 ZLPsaRMyG3z1n56c23g8VeQtT9WmICPGkM+orshBIY2E/3oazhLKS9+w/KY0/tWLcURa
 xCFw==
X-Gm-Message-State: APjAAAWcHO9W3LgGY71Oe31f5pYZr0kqX16rhOTMSItSJLBNlTJv0XOf
 IQjlq3E9mJcA20IMzEm3qm5yn+We+OH3c4s4dqJO1A==
X-Google-Smtp-Source: APXvYqyCRLg+qUZT9unfn57Tqrts1U2AADTp/EWbz0rzG3BQN2HWuUEFxTZufHm0MxoBjaVXzzffUnzl3GjLy5LL/fs=
X-Received: by 2002:a67:2b86:: with SMTP id
 r128mr15127774vsr.119.1570438387453; 
 Mon, 07 Oct 2019 01:53:07 -0700 (PDT)
MIME-Version: 1.0
References: <20191007071610.65714-1-cychiang@chromium.org>
 <CA+Px+wWkr1xmSpgEkSaGS7UZu8TKUYvSnbjimBRH29=kDtcHKA@mail.gmail.com>
In-Reply-To: <CA+Px+wWkr1xmSpgEkSaGS7UZu8TKUYvSnbjimBRH29=kDtcHKA@mail.gmail.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Mon, 7 Oct 2019 16:52:41 +0800
Message-ID: <CAFv8Nw+DEXePD-G-ujKgd9zAq+pDAaHF_rZTbRyDupVANGmqsQ@mail.gmail.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Hung-Te Lin <hungte@chromium.org>,
 Mark Brown <broonie@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Dylan Reid <dgreid@chromium.org>, Guenter Roeck <linux@roeck-us.net>
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

On Mon, Oct 7, 2019 at 4:03 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Mon, Oct 7, 2019 at 3:16 PM Cheng-Yi Chiang <cychiang@chromium.org> wrote:
> >
> > Add an interface for other driver to query VPD value.
> > This will be used for ASoC machine driver to query calibration
> > data stored in VPD for smart amplifier speaker resistor
> > calibration.
> >
> > Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> > ---
> >  drivers/firmware/google/vpd.c              | 16 ++++++++++++++++
> >  include/linux/firmware/google/google_vpd.h | 18 ++++++++++++++++++
> >  2 files changed, 34 insertions(+)
> >  create mode 100644 include/linux/firmware/google/google_vpd.h
> >
> > diff --git a/drivers/firmware/google/vpd.c b/drivers/firmware/google/vpd.c
> > index db0812263d46..71e9d2da63be 100644
> > --- a/drivers/firmware/google/vpd.c
> > +++ b/drivers/firmware/google/vpd.c
> > @@ -65,6 +65,22 @@ static ssize_t vpd_attrib_read(struct file *filp, struct kobject *kobp,
> >                                        info->bin_attr.size);
> >  }
> >
> > +int vpd_attribute_read_value(bool ro, const char *key,
> > +                            char **value, u32 value_len)
> > +{
> > +       struct vpd_attrib_info *info;
> > +       struct vpd_section *sec = ro ? &ro_vpd : &rw_vpd;
> > +
> > +       list_for_each_entry(info, &sec->attribs, list) {
> > +               if (strcmp(info->key, key) == 0) {
> > +                       *value = kstrndup(info->value, value_len, GFP_KERNEL);
>
> Value is not necessary a NULL-terminated string.
> kmalloc(info->bin_attr.size) and memcpy(...) would make the most
> sense.
>
> The value_len parameter makes less sense.  It seems the caller knows
> the length of the value in advance.
> Suggest to change the value_len to report the length of value.  I.e.
> *value_len = info->bin_attr.size;
>
> Also please check the return value for memory allocation-like
> functions (e.g. kstrndup, kmalloc) so that *value won't be NULL but
> the function returned 0.

Thanks for the review.
I will them in v2.

>
> > +                       return 0;
> > +               }
> > +       }
> > +       return -EINVAL;
> > +}
> > +EXPORT_SYMBOL(vpd_attribute_read_value);
> > +
> >  /*
> >   * vpd_section_check_key_name()
> >   *
> > diff --git a/include/linux/firmware/google/google_vpd.h b/include/linux/firmware/google/google_vpd.h
> > new file mode 100644
> > index 000000000000..6f1160f28af8
> > --- /dev/null
> > +++ b/include/linux/firmware/google/google_vpd.h
> > @@ -0,0 +1,18 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Google VPD interface.
> > + *
> > + * Copyright 2019 Google Inc.
> > + */
> > +
> > +/* Interface for reading VPD value on Chrome platform. */
> > +
> > +#ifndef __GOOGLE_VPD_H
> > +#define __GOOGLE_VPD_H
> > +
> > +#include <linux/types.h>
> > +
> > +int vpd_attribute_read_value(bool ro, const char *key,
> > +                            char **value, u32 value_len);
> > +
> > +#endif  /* __GOOGLE_VPD_H */
> > --
> > 2.23.0.581.g78d2f28ef7-goog
> >
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
