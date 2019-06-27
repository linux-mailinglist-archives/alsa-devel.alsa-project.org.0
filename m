Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B6257F75
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2019 11:41:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF2B9172C;
	Thu, 27 Jun 2019 11:40:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF2B9172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561628475;
	bh=QRHTAy4+b9NFs9Oe45vBcVNAG4hIXcIgOyctKqJ4EQ4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kr3EErKwCbC7XeYONpvCwpanBDE+eg9Vri85BmOGutqv4pkI18Zcfmroez0hTJPrQ
	 hDna7wORfGcdX79hpu1Zsy6gsahfwEWJnpFOlYDb2rISsQfMHU7ulVCS6e8tTGFxdX
	 j9GtGOgs23Wo2zCYpjwvcNzeHtna8cTraSjPGYeo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D367BF806F0;
	Thu, 27 Jun 2019 11:39:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D053F896F6; Thu, 27 Jun 2019 11:39:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28A84F89678
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 11:39:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28A84F89678
Received: by mail-ot1-f68.google.com with SMTP id s20so1616708otp.4
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 02:39:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w2ekETM4fKeRevTrixLm0mXW0oYRCPcem5D5CxK1aEY=;
 b=Na9XfH6GANkJ1MTqS9Gm10mgVUnD1j6wgmP224Mwy0JQt0kuHAEYzJ5Z7JfTNjboja
 rKPxCyw0mXyEXfAGK23XpXjvflW23hFezflXpYaUoiv/w0ctFv4oyHW0h6ihu0+9Md8E
 bOSMNl0zGBS1dYHhO29WjaqOFNjrebe+W01dIv0AVPpDz/R/SdyrigHFftf2qqD9wlYC
 Hq3KWNYXiNDGrWUpoAj/85wy6RZv31r8wuWeYPHnlZZR5PtAMwsqyByeCW4xWaSbEgZ6
 L4mhHV6pjq5ej/YIWUb5KdA2zxF0fygcP9Kmra5j+agj/doSnW29ZGdkWilaIbbPSl5T
 HoqA==
X-Gm-Message-State: APjAAAVOXXyTBEoAP1+nywhA5MTiJaafEMhdLFUBrxVUZ7jYWyMyUGe7
 77nesRqVdIK7HAOfywjVS9B/uBfdR+/0I1AGwYY=
X-Google-Smtp-Source: APXvYqx1vC+G2STtO3Oiq49V6CCXxRaqEQC67XDLklK1lL7gL6P31xV2IO7NENn/6uSCBQwk1NUjtJrCr+mUAv9hZJI=
X-Received: by 2002:a9d:5d15:: with SMTP id b21mr2648855oti.262.1561628361346; 
 Thu, 27 Jun 2019 02:39:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190626153611.10170-1-ckeepax@opensource.cirrus.com>
In-Reply-To: <20190626153611.10170-1-ckeepax@opensource.cirrus.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 27 Jun 2019 11:39:10 +0200
Message-ID: <CAJZ5v0hvN=8YmF+v6wKx9mQ=DRosAtK7QU=EWYf5PXEDsn4FEQ@mail.gmail.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, patches@opensource.cirrus.com
Subject: Re: [alsa-devel] [PATCH 1/2] device property: Add new array helper
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

On Wed, Jun 26, 2019 at 5:36 PM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> It is fairly common to want to read an integer array property
> that is composed of an unknown number of fixed size integer
> groups. For example, say each group consists of three values
> which correspond to the settings for one input on the device
> and the driver supports several chips with different numbers
> of inputs.
>
> Add a new helper function to provide this functionality, it
> differs for the existing helpers in that it allows reading a
> smaller number of values than the full array size and checks
> that the number of values read is a multiple of the group size.

I'm not convinced.

> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  drivers/base/property.c  | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/property.h |  2 ++
>  2 files changed, 50 insertions(+)
>
> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index 348b37e64944c..656d21e01a648 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
> @@ -133,6 +133,54 @@ int device_property_read_u32_array(struct device *dev, const char *propname,
>  EXPORT_SYMBOL_GPL(device_property_read_u32_array);
>
>  /**
> + * device_property_read_u32_2darray - return a 2d u32 array property of a device
> + * @dev: Device to get the property of
> + * @propname: Name of the property
> + * @val: The values are stored here or %NULL to return the number of values
> + * @nval: Size of the @val array
> + * @multiple: Number of entries in each block of data
> + *
> + * Function reads an array of u32 properties split up into fixed size
> + * sub-groups, with @propname from the device firmware description and
> + * stores them to @val if found.
> + *
> + * Return: Number of values read
> + *        %0 if the property was not found,
> + *        %-EINVAL if given arguments are not valid,
> + *        %-ENODATA if the property does not have a value,
> + *        %-EPROTO if the property is not an array of numbers,
> + *        %-EOVERFLOW if the size of the property is not as expected.
> + *        %-ENXIO if no suitable firmware interface is present.
> + */
> +int device_property_read_u32_2darray(struct device *dev, const char *propname,
> +                                    u32 *val, size_t nval, int multiple)
> +{
> +       int n, ret;
> +
> +       n = device_property_read_u32_array(dev, propname, NULL, 0);
> +       if (n == -EINVAL) {
> +               return 0;       /* missing, ignore */

Why can't the caller use the (scheduled for merging in the 5.3 cycle)
new device_property_count_u32() to get the size of the array?

> +       } else if (n < 0) {
> +               dev_warn(dev, "%s malformed (%d)\n", propname, n);

Why dev_warn()?  Is there any reason real for anything higher-level
that dev_dbg() here?

> +               return n;
> +       } else if ((n % multiple) != 0) {

I guess the reason why this matters is that the caller expects a
certain number of full "rows" and n values are read.  Why not to
discard the extra values instead of returning an error here?

> +               dev_warn(dev, "%s not a multiple of %d entries\n",
> +                        propname, multiple);
> +               return -EOVERFLOW;

Why this error code?

> +       }
> +
> +       if (n > nval)
> +               n = nval;
> +
> +       ret = device_property_read_u32_array(dev, propname, val, n);

So this reads "copy at most nval values from the array property".

If that's really what you need, it can be done in two lines of code in
prospective callers of this wrapper.

> +       if (ret < 0)
> +               return ret;
> +       else
> +               return n;
> +}
> +EXPORT_SYMBOL_GPL(device_property_read_u32_2darray);
> +
> +/**
>   * device_property_read_u64_array - return a u64 array property of a device
>   * @dev: Device to get the property of
>   * @propname: Name of the property
> diff --git a/include/linux/property.h b/include/linux/property.h
> index e9caa290cda52..5ab0b4a7d34a2 100644
> --- a/include/linux/property.h
> +++ b/include/linux/property.h
> @@ -40,6 +40,8 @@ int device_property_read_u16_array(struct device *dev, const char *propname,
>                                    u16 *val, size_t nval);
>  int device_property_read_u32_array(struct device *dev, const char *propname,
>                                    u32 *val, size_t nval);
> +int device_property_read_u32_2darray(struct device *dev, const char *propname,
> +                                    u32 *val, size_t nval, int multiple);
>  int device_property_read_u64_array(struct device *dev, const char *propname,
>                                    u64 *val, size_t nval);
>  int device_property_read_string_array(struct device *dev, const char *propname,
> --

I don't see much value in this change, sorry.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
