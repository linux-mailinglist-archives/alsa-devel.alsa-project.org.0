Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CD02E3D65
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Dec 2020 15:16:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51F63171B;
	Mon, 28 Dec 2020 15:15:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51F63171B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609164991;
	bh=F7nnAEjQNb2un2qoM7pFGWFc/16736+Vo+D2THtKN30=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b/pAIbDmI/iGd6GGBpkx3AEF3CVrq7kSxaBdc3mwLPx5PPb7ql/J0oL2By25+BUWh
	 MFYdohziZgDVN+AaTQUaqIKO1YHlihptsfhy5URz0YJhOpaQCcMJhNirul9B43uNJJ
	 Tv5ENhW0NUSbOpj0B5LuPFrHT7HMZ4/42ufu+/yI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A947F801F9;
	Mon, 28 Dec 2020 15:14:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA824F801F5; Mon, 28 Dec 2020 15:14:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B073EF80143
 for <alsa-devel@alsa-project.org>; Mon, 28 Dec 2020 15:14:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B073EF80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="rg7WbRj1"
Received: by mail-pg1-x52b.google.com with SMTP id i7so7388093pgc.8
 for <alsa-devel@alsa-project.org>; Mon, 28 Dec 2020 06:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jzv76ZxrfyN9aLufGK4Ag7xuBKo0xh2BNWYNmVhmZnU=;
 b=rg7WbRj11lokwdONgJDWxxmo2Cd5hR3p5eTsMApwFhZ6YrjXaJ2X9Ld3UxV/xCqYPc
 h/65VLLkmldjIfJsYlSpXTBQWFibWMITt0L8g6yE9Y/Hw1E+qWVySxw6amuAbuWnaDeq
 p+MnueT1C2ayp5PExAHLUuQ6FMFRKlniOkFt600zGL6Wu7sFTqZtfcpoNuNNc0ZjXIL5
 lYOn1VnmkFaeI+zEPdHxh8xXir1e+F/6HcRf48MQ/x5fBra3uB9pw0QXKGOiuM717k0n
 7ZhUl5bhEqbO8+GXpI38MiNEFG2hHYa3jSRtzl6QpRhv6iaryfxb1rcN5sOgaNkilPVl
 UOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jzv76ZxrfyN9aLufGK4Ag7xuBKo0xh2BNWYNmVhmZnU=;
 b=Iq9TpMDbxBX1fwf5aICJjxv+V2jD37qEBZ2tv2XoB2ycFD0Ke2lxhGx42aOabZ9exI
 TQ0H1dUSqwiAA9I9n1iMyd0w5YmtjJXOD/VktizkewB4GH7w59d1gA6ghPzcGt0RDI++
 PRr4fiAMJp6IVamRz/FZTa4xQtIR/qcY7ecmzOcA0ITpwvMVFb6djXt4yZsNcmC+bSA9
 FV9nJh8JqCEY2F5IyXAD5PrsnsaHOzNpfNsVDi459g0CYTYlr1vsmF1yH4xQ01O3q1me
 btnVtJyQoCBAY9/L0lkeEqaFnEk2eDxRy4w46NMZRdjHXeE1QZ+a+fTpJCtkyLAqrXA+
 r7zA==
X-Gm-Message-State: AOAM531vlAPUEMJdA6UegWl76+bBRqPpEJMNtbc5pCTxhri0a7ZJP9UW
 Wk6sk2GHPyoKJ1QNhYySDe06h4Xryv+bvisBA2o=
X-Google-Smtp-Source: ABdhPJw0jdWVruIXOd+HR2C6dc9/TXCfNZWddyDREtzDGvhSptycRDJkF3safh2eGG216pDI3oUUfKtBMTD5AmHVd6g=
X-Received: by 2002:a63:b1e:: with SMTP id 30mr43734626pgl.203.1609164884087; 
 Mon, 28 Dec 2020 06:14:44 -0800 (PST)
MIME-Version: 1.0
References: <20201227211232.117801-1-hdegoede@redhat.com>
 <20201227211232.117801-4-hdegoede@redhat.com>
In-Reply-To: <20201227211232.117801-4-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 28 Dec 2020 16:14:27 +0200
Message-ID: <CAHp75VesAo9-GGCVyGcQuNLG8KOLcB_S+bokcxJTfeDn7sb0Bg@mail.gmail.com>
Subject: Re: [PATCH 03/14] mfd: arizona: Add support for ACPI enumeration of
 WM5102 connected over SPI
To: Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Christian Hartmann <cornogle@googlemail.com>,
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
> The Intel Bay Trail (x86/ACPI) based Lenovo Yoga Tablet 2 series use
> a WM5102 codec connected over SPI.
>
> Add support for ACPI enumeration to arizona-spi so that arizona-spi can
> bind to the codec on these tablets.
>
> This is loosely based on an earlier attempt (for Android-x86) at this by
> Christian Hartmann, combined with insights in things like the speaker GPIO
> from the android-x86 android port for the Lenovo Yoga Tablet 2 1051F/L [1].

Few nitpicks here and there, but the most important bit that hits me
is device_get_match_data().

> [1] https://github.com/Kitsune2222/Android_Yoga_Tablet_2-1051F_Kernel
>
> Cc: Christian Hartmann <cornogle@googlemail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/mfd/arizona-spi.c | 120 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 120 insertions(+)
>
> diff --git a/drivers/mfd/arizona-spi.c b/drivers/mfd/arizona-spi.c
> index 704f214d2614..bcdbd72fefb5 100644
> --- a/drivers/mfd/arizona-spi.c
> +++ b/drivers/mfd/arizona-spi.c
> @@ -7,7 +7,10 @@
>   * Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
>   */
>
> +#include <linux/acpi.h>
>  #include <linux/err.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/machine.h>
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
> @@ -15,11 +18,119 @@
>  #include <linux/slab.h>
>  #include <linux/spi/spi.h>
>  #include <linux/of.h>
> +#include <uapi/linux/input-event-codes.h>
>
>  #include <linux/mfd/arizona/core.h>
>
>  #include "arizona.h"
>
> +#ifdef CONFIG_ACPI
> +const struct acpi_gpio_params reset_gpios = { 1, 0, false };
> +const struct acpi_gpio_params ldoena_gpios = { 2, 0, false };
> +
> +static const struct acpi_gpio_mapping arizona_acpi_gpios[] = {
> +       { "reset-gpios", &reset_gpios, 1, },
> +       { "wlf,ldoena-gpios", &ldoena_gpios, 1 },
> +       { }
> +};
> +
> +/*
> + * The ACPI resources for the device only describe external GPIO-s. They do
> + * not provide mappings for the GPIO-s coming from the Arizona codec itself.
> + */
> +static const struct gpiod_lookup arizona_soc_gpios[] = {
> +       { "arizona", 2, "wlf,spkvdd-ena", 0, GPIO_ACTIVE_HIGH },
> +       { "arizona", 4, "wlf,micd-pol", 0, GPIO_ACTIVE_LOW },
> +};
> +
> +/*
> + * The AOSP 3.5 mm Headset: Accessory Specification gives the following values:
> + * Function A Play/Pause:           0 ohm
> + * Function D Voice assistant:    135 ohm
> + * Function B Volume Up           240 ohm
> + * Function C Volume Down         470 ohm
> + * Minimum Mic DC resistance     1000 ohm
> + * Minimum Ear speaker impedance   16 ohm
> + * Note the first max value below must be less then the min. speaker impedance,
> + * to allow CTIA/OMTP detection to work. The other max values are the closest
> + * value from extcon-arizona.c:arizona_micd_levels halfway 2 button resistances.
> + */
> +static const struct arizona_micd_range arizona_micd_aosp_ranges[] = {
> +       { .max =  11, .key = KEY_PLAYPAUSE },
> +       { .max = 186, .key = KEY_VOICECOMMAND },
> +       { .max = 348, .key = KEY_VOLUMEUP },
> +       { .max = 752, .key = KEY_VOLUMEDOWN },
> +};
> +
> +static void arizona_spi_acpi_remove_lookup(void *lookup)
> +{
> +       gpiod_remove_lookup_table(lookup);
> +}
> +
> +static int arizona_spi_acpi_probe(struct arizona *arizona)
> +{
> +       struct gpiod_lookup_table *lookup;
> +       int i, ret;
> +
> +       /* Add mappings for the 2 ACPI declared GPIOs used for reset and ldo-ena */
> +       devm_acpi_dev_add_driver_gpios(arizona->dev, arizona_acpi_gpios);
> +
> +       /* Add lookups for the SoCs own GPIOs used for micdet-polarity and spkVDD-enable */
> +       lookup = devm_kzalloc(arizona->dev,
> +                             struct_size(lookup, table, ARRAY_SIZE(arizona_soc_gpios) + 1),
> +                             GFP_KERNEL);
> +       if (!lookup)
> +               return -ENOMEM;
> +
> +       lookup->dev_id = dev_name(arizona->dev);

> +       for (i = 0; i < ARRAY_SIZE(arizona_soc_gpios); i++)
> +               lookup->table[i] = arizona_soc_gpios[i];

Would memcpy() do the same at one pass?

> +       gpiod_add_lookup_table(lookup);
> +       ret = devm_add_action_or_reset(arizona->dev, arizona_spi_acpi_remove_lookup, lookup);
> +       if (ret)
> +               return ret;

> +       /* Enable 32KHz clock from SoC to codec for jack-detect */
> +       acpi_evaluate_object(ACPI_HANDLE(arizona->dev), "CLKE", NULL, NULL);

No error check?

> +       /*
> +        * Some DSDTs wrongly declare the IRQ trigger-type as IRQF_TRIGGER_FALLING
> +        * The IRQ line will stay low when a new IRQ event happens between reading
> +        * the IRQ status flags and acknowledging them. When the IRQ line stays
> +        * low like this the IRQ will never trigger again when its type is set
> +        * to IRQF_TRIGGER_FALLING. Correct the IRQ trigger-type to fix this.
> +        */
> +       arizona->pdata.irq_flags = IRQF_TRIGGER_LOW;
> +
> +       /* Wait 200 ms after jack insertion */
> +       arizona->pdata.micd_detect_debounce = 200;
> +
> +       /* Use standard AOSP values for headset-button mappings */
> +       arizona->pdata.micd_ranges = arizona_micd_aosp_ranges;
> +       arizona->pdata.num_micd_ranges = ARRAY_SIZE(arizona_micd_aosp_ranges);
> +
> +       return 0;
> +}
> +
> +static const struct acpi_device_id arizona_acpi_match[] = {
> +       {
> +               .id = "WM510204",
> +               .driver_data = WM5102,
> +       },
> +       {
> +               .id = "WM510205",
> +               .driver_data = WM5102,
> +       },

> +       { },

No need for comma here.

> +};
> +MODULE_DEVICE_TABLE(acpi, arizona_acpi_match);
> +#else

> +static void arizona_spi_acpi_probe(struct arizona *arizona)
> +{
> +}

Can be one line?

> +#endif
> +
>  static int arizona_spi_probe(struct spi_device *spi)
>  {
>         const struct spi_device_id *id = spi_get_device_id(spi);
> @@ -30,6 +141,8 @@ static int arizona_spi_probe(struct spi_device *spi)
>
>         if (spi->dev.of_node)
>                 type = arizona_of_get_type(&spi->dev);
> +       else if (ACPI_COMPANION(&spi->dev))
> +               type = (unsigned long)acpi_device_get_match_data(&spi->dev);

Can we rather get rid of these and use device_get_match_data() directly?

>         else
>                 type = id->driver_data;
>
> @@ -75,6 +188,12 @@ static int arizona_spi_probe(struct spi_device *spi)
>         arizona->dev = &spi->dev;
>         arizona->irq = spi->irq;
>
> +       if (ACPI_COMPANION(&spi->dev)) {

has_acpi_companion() ?

> +               ret = arizona_spi_acpi_probe(arizona);
> +               if (ret)
> +                       return ret;
> +       }
> +
>         return arizona_dev_init(arizona);
>  }
>
> @@ -102,6 +221,7 @@ static struct spi_driver arizona_spi_driver = {
>                 .name   = "arizona",
>                 .pm     = &arizona_pm_ops,
>                 .of_match_table = of_match_ptr(arizona_of_match),
> +               .acpi_match_table = ACPI_PTR(arizona_acpi_match),
>         },
>         .probe          = arizona_spi_probe,
>         .remove         = arizona_spi_remove,
> --
> 2.28.0
>


-- 
With Best Regards,
Andy Shevchenko
