Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B07172F9EC0
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 12:52:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4339C17D4;
	Mon, 18 Jan 2021 12:51:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4339C17D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610970758;
	bh=u+/Lvmx82fHsPTJNJ4qh18z7nI4LE6d6U8U51an8MqU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gjnqu03M6JNX78ZE8CiJy1CU17MLbA0mtsp2osAqllnYU5YCeqwY0JJW9X3+GfY7T
	 AaHpAHqRWdvmsqdWvSaamiY/EUFsJDLonnnP62LE4rBwEmDPsbSnqZu8iunj45AisP
	 kvm/vhZNTFhiQiIXRDPV+aR7M+qrpJ0n+XHcXM/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E18EF8019D;
	Mon, 18 Jan 2021 12:51:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6890F8016E; Mon, 18 Jan 2021 12:51:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56C30F800C0
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 12:50:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56C30F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VWQddsAF"
Received: by mail-pl1-x633.google.com with SMTP id s15so8519689plr.9
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 03:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bekUkQFAhgR2QZLCVYSsef2aZeUwNBoiuL9ybwHmiio=;
 b=VWQddsAFzbpSpQUIq3J6j6x9XgpGG/Ga/of9rwwoDXfZgrTL6sJe6gXAW+z+nsmXr6
 c6qWsSjtv9YcSkdMV0uKBcd+AyL1XZezomb9WRy3efKHFxGPsYpYhVBPGmh+FAoB+CRw
 S9dpWBn0VXxLfdXcdWpTR7wSoWBYYQD6TEqU+0S8NuuUprFMslz0CgJwYeK3R6ucCdbI
 vv0mXXBSQzxZykhIRmQi70QzKAHATHrKXuXWqmLzkvAq5SRBTLkW6459e6bh5QeM9Roc
 YcSK6jYMDgzTV7msGQhiSMhHqtGG+HNruiyf74dwfjzN5uYsu8/CtXnFvmium0ZTrYpq
 jIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bekUkQFAhgR2QZLCVYSsef2aZeUwNBoiuL9ybwHmiio=;
 b=t8ufhYhm/9Dxd4l3U5OurVgDB0hRFJOwnb1q9bNPQWcvFoqRXghiR7PK3SGezMgiVp
 C8mYq36W1bOqjD6Aml2GDeLhfFEZiQm0A93qxRIqea8YGao+ETaynPlHh7d1/XfLGM+8
 1oIVMe8dJaETMn4Os13UfXYHekEswvJl+zUYIAy9Tythh7Mj6t2oeal+1UyGtHuKk2+A
 ZGAFm6blf638Y5q+cm2Crm2ajky5JyPv2uDMKhbCBVfkEVy+3D7qOAyoZDwyI53o2ILX
 Yt4v4LPJawmSBWxdR7FCDyn3w/z+GUFm+jLQIuSoUm6rFwgd8fQzQ1S7pd02nQzW0gQY
 YVBg==
X-Gm-Message-State: AOAM530bryb9FINQTJkXgK6H3r/kBfaadD4N6oSNPTziZxM/E9H/1Nik
 Jd4wf7K7lHmmnoFzcXMHAc7I5dU8t2dcz7xHRuA=
X-Google-Smtp-Source: ABdhPJztWxrnFhIDxax+TDiNWYYjEBwfNua/MlG7dhmQhveS21GiH0bsf3SXDCd4sUen5lDYfBRSzGsUABLCUXX3Qa0=
X-Received: by 2002:a17:90a:6c90:: with SMTP id
 y16mr26644109pjj.129.1610970655499; 
 Mon, 18 Jan 2021 03:50:55 -0800 (PST)
MIME-Version: 1.0
References: <20210117212252.206115-1-hdegoede@redhat.com>
 <20210117212252.206115-3-hdegoede@redhat.com>
In-Reply-To: <20210117212252.206115-3-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 18 Jan 2021 13:51:44 +0200
Message-ID: <CAHp75VcKjx7+=+n7xjOE4sL_gOt5h7HzQGdvzYhC5x=EmeXLtA@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] mfd: arizona: Replace arizona_of_get_type() with
 device_get_match_data()
To: Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>
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

On Sun, Jan 17, 2021 at 11:23 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Replace the custom arizona_of_get_type() function with the generic
> device_get_match_data() helper. Besides being a nice cleanup this
> also makes it easier to add support for binding to ACPI enumerated
> devices.
>
> While at it also fix a possible NULL pointer deref of the id
> argument to the probe functions (this could happen on e.g. manual
> driver binding through sysfs).

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - New patch in v2 of this patchset
> ---
>  drivers/mfd/arizona-core.c | 11 -----------
>  drivers/mfd/arizona-i2c.c  | 10 ++++++----
>  drivers/mfd/arizona-spi.c  | 10 ++++++----
>  drivers/mfd/arizona.h      |  9 ---------
>  4 files changed, 12 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
> index 000cb82023e3..75f1bc671d59 100644
> --- a/drivers/mfd/arizona-core.c
> +++ b/drivers/mfd/arizona-core.c
> @@ -797,17 +797,6 @@ const struct dev_pm_ops arizona_pm_ops = {
>  EXPORT_SYMBOL_GPL(arizona_pm_ops);
>
>  #ifdef CONFIG_OF
> -unsigned long arizona_of_get_type(struct device *dev)
> -{
> -       const struct of_device_id *id = of_match_device(arizona_of_match, dev);
> -
> -       if (id)
> -               return (unsigned long)id->data;
> -       else
> -               return 0;
> -}
> -EXPORT_SYMBOL_GPL(arizona_of_get_type);
> -
>  static int arizona_of_get_core_pdata(struct arizona *arizona)
>  {
>         struct arizona_pdata *pdata = &arizona->pdata;
> diff --git a/drivers/mfd/arizona-i2c.c b/drivers/mfd/arizona-i2c.c
> index 2a4a3a164d0a..5e83b730c4ce 100644
> --- a/drivers/mfd/arizona-i2c.c
> +++ b/drivers/mfd/arizona-i2c.c
> @@ -23,14 +23,16 @@
>  static int arizona_i2c_probe(struct i2c_client *i2c,
>                              const struct i2c_device_id *id)
>  {
> +       const void *match_data;
>         struct arizona *arizona;
>         const struct regmap_config *regmap_config = NULL;
> -       unsigned long type;
> +       unsigned long type = 0;
>         int ret;
>
> -       if (i2c->dev.of_node)
> -               type = arizona_of_get_type(&i2c->dev);
> -       else
> +       match_data = device_get_match_data(&i2c->dev);
> +       if (match_data)
> +               type = (unsigned long)match_data;
> +       else if (id)
>                 type = id->driver_data;
>
>         switch (type) {
> diff --git a/drivers/mfd/arizona-spi.c b/drivers/mfd/arizona-spi.c
> index 704f214d2614..798b88295c77 100644
> --- a/drivers/mfd/arizona-spi.c
> +++ b/drivers/mfd/arizona-spi.c
> @@ -23,14 +23,16 @@
>  static int arizona_spi_probe(struct spi_device *spi)
>  {
>         const struct spi_device_id *id = spi_get_device_id(spi);
> +       const void *match_data;
>         struct arizona *arizona;
>         const struct regmap_config *regmap_config = NULL;
> -       unsigned long type;
> +       unsigned long type = 0;
>         int ret;
>
> -       if (spi->dev.of_node)
> -               type = arizona_of_get_type(&spi->dev);
> -       else
> +       match_data = device_get_match_data(&spi->dev);
> +       if (match_data)
> +               type = (unsigned long)match_data;
> +       else if (id)
>                 type = id->driver_data;
>
>         switch (type) {
> diff --git a/drivers/mfd/arizona.h b/drivers/mfd/arizona.h
> index 995efc6d7f32..801cbbcd71cb 100644
> --- a/drivers/mfd/arizona.h
> +++ b/drivers/mfd/arizona.h
> @@ -50,13 +50,4 @@ int arizona_dev_exit(struct arizona *arizona);
>  int arizona_irq_init(struct arizona *arizona);
>  int arizona_irq_exit(struct arizona *arizona);
>
> -#ifdef CONFIG_OF
> -unsigned long arizona_of_get_type(struct device *dev);
> -#else
> -static inline unsigned long arizona_of_get_type(struct device *dev)
> -{
> -       return 0;
> -}
> -#endif
> -
>  #endif
> --
> 2.28.0
>


-- 
With Best Regards,
Andy Shevchenko
