Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4172E3D8F
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Dec 2020 15:18:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1036E1710;
	Mon, 28 Dec 2020 15:17:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1036E1710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609165101;
	bh=5LUbBI1gyuNYj0CSrFsMmOUA9YPlSs1eSpFES5/nvGI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ASGaHI+HJ0ekuBXkP6rVHOewL5bLihSNu8VQD4lRP2zwTBZNDQtHkowX7H2aB/Lvm
	 RmBxii4DPl+NzEQB8CVQOYXV56uI+2+SlXsyrogeCgzqG9XMkJ5gKi22Rw2gVQJNRP
	 NEyOY2OhV4noEQh9Od+EZ/4GBq7h2VVTtB/YP09U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72279F801F9;
	Mon, 28 Dec 2020 15:16:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7D84F801F5; Mon, 28 Dec 2020 15:16:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DF7EF80143
 for <alsa-devel@alsa-project.org>; Mon, 28 Dec 2020 15:16:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DF7EF80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BASgsSc6"
Received: by mail-pg1-x529.google.com with SMTP id p18so7381498pgm.11
 for <alsa-devel@alsa-project.org>; Mon, 28 Dec 2020 06:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tG/RECwRgNQRQ8Y3N/bmt9ivqZMjunU0lDRr6TZ1FSs=;
 b=BASgsSc6AnQXc6h5OKkLHTc8nKdTjRKgDhLNdBqlxiHrzOKY+xmqtDb6hX1w3ne7aP
 +GSzpQldp9Ol/Tsf+3hroeJPMnK9Yvk9n2qUWJ6Nk8vUn3mc2v2Al1DLuCAHnHgTeDd9
 uOP4Jyul3i3FiDyb3ggNcGbZ8phIPSBBjEoFddI9zJwlMrmCStujI/TsjZ5ZhI5pxC+a
 4YFPVDaDV2eC1jaW+sDSERr92tbw9Pgo9SLKTqt73r5rvJuDJgsOaldg/f+7iNutwcG0
 qdijuRjw1OfQMIEKKtuWwiTdSmU5ToRX59ewX+mUuz6Y9x2wPqM9nWeafu9tDnF081lV
 JN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tG/RECwRgNQRQ8Y3N/bmt9ivqZMjunU0lDRr6TZ1FSs=;
 b=JE1ACIDc1LkPv2cuDNWtQVhPkzQW89/K1iVR7xBjfaasnXpULVYLdHzPcNg+NR9S27
 Ix0/maRb/ga91DgiQELtOj9FXl9jOryrXXXob44LlOEO6pvS/quUV07zpt/ZAZqVn9Hi
 tOOSpXXiJ+Ul32jTojjRCY+mCISJFXN7mjs8ZJV2Oy1h/xZ7BoxVuKpp5SyQf3dkVPzG
 RHWMTcszbAMgZTFfeInbhOZgv1IoGhmIe5wPvmNrPlMvsJYF7GpDQBHH5F8zX9qenLDo
 SB81Rs/JfQVMy9cbqF0lQqWQC5TRjTYI+4SJ798apgkJG1w7hhd4LOJvxQkuDxV+a8r9
 e8SA==
X-Gm-Message-State: AOAM531LRc65+CxfgDQxATtZs7Vg3ak4bgW6XoUb/eqJmsq4CWcojHQf
 ck3O9wvzF7XoOLfHi6Mb/gectWyRY7ojkw0eJAc=
X-Google-Smtp-Source: ABdhPJzgfoxIJsP2SMbDpjaL6TOeeco/9fSOdRZRL5HgwYT+kLVXmorkD+7UgHeMCnuoRe3C8xC6Ph7OGm2IH3XMfIw=
X-Received: by 2002:a63:b1e:: with SMTP id 30mr43741498pgl.203.1609164994000; 
 Mon, 28 Dec 2020 06:16:34 -0800 (PST)
MIME-Version: 1.0
References: <20201227211232.117801-1-hdegoede@redhat.com>
 <20201227211232.117801-11-hdegoede@redhat.com>
In-Reply-To: <20201227211232.117801-11-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 28 Dec 2020 16:16:17 +0200
Message-ID: <CAHp75VfpdJkDxwynHTaLbVKZ1fp7XZS=RUSC1OV_06cmpyoNAQ@mail.gmail.com>
Subject: Re: [PATCH 10/14] extcon: arizona: Also report jack state through
 snd_soc_jack_report()
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

On Sun, Dec 27, 2020 at 11:16 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> The Linux Arizona driver uses the MFD framework to create several
> sub-devices for the Arizona codec and then uses a driver per function.
>
> The extcon-arizona driver handles jack-detect support and exports info
> about the jack state to userspace through the standard extcon sysfs
> class interface.
>
> Standard Linux userspace does not monitor/use the extcon sysfs interface
> for jack-detection, resulting in the jack-state not being taken into
> account by userspace.
>
> The ASoC machine-driver may have created a standard ASoC jack when
> registering the card. In this case also report the jack-state through the
> ASoC jack so that jack-detection works with standard Linux userspace.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/extcon/extcon-arizona.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
> index d5b3231744f9..931a7d239aea 100644
> --- a/drivers/extcon/extcon-arizona.c
> +++ b/drivers/extcon/extcon-arizona.c
> @@ -20,6 +20,7 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/extcon-provider.h>
>
> +#include <sound/jack.h>
>  #include <sound/soc.h>
>
>  #include <linux/mfd/arizona/core.h>
> @@ -598,11 +599,19 @@ static int arizona_hpdet_do_id(struct arizona_extcon_info *info, int *reading,
>  static void arizona_set_extcon_state(struct arizona_extcon_info *info,
>                                      unsigned int id, bool state)
>  {
> -       int ret;
> +       int ret, mask = 0;

I would rather prefer... drop  assignment here...

>         ret = extcon_set_state_sync(info->edev, id, state);
>         if (ret)
>                 dev_err(info->arizona->dev, "Failed to set extcon state: %d\n", ret);
> +
> +       switch (id) {
> +       case EXTCON_JACK_HEADPHONE:     mask = SND_JACK_HEADPHONE;      break;
> +       case EXTCON_JACK_MICROPHONE:    mask = SND_JACK_MICROPHONE;     break;

...introduce default here, which immediately bails out (return)...

> +       }
> +
> +       if (info->arizona->jack && mask)

...and drop mask check here.

> +               snd_soc_jack_report(info->arizona->jack, state ? mask : 0, mask);
>  }
>
>  static irqreturn_t arizona_hpdet_irq(int irq, void *data)
> --
> 2.28.0
>


-- 
With Best Regards,
Andy Shevchenko
