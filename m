Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 293AA2F8D8E
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Jan 2021 15:48:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F04DC17E8;
	Sat, 16 Jan 2021 15:47:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F04DC17E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610808515;
	bh=HzY53iaMDkxlCrkaIL6qPiKVcTOdDyl+ydbCWpCclKg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TO45VEd82WnfX0rDW9k9VA9i5ZzJMedkXFEtyXzWCgOy3zX2lOv5EOMNIn6ZJisH+
	 qsb1dJqRrhUbLq5lTop5QWZX3flJqQyc/rxmtWs33DuFmRbHij1zeNvN8yXba4ar/l
	 ujlgSI2k5HbdKun0FbwC1YdYtT/R3J8XoIp9uz9k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E120F8026F;
	Sat, 16 Jan 2021 15:47:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC152F8025E; Sat, 16 Jan 2021 15:46:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B314CF80134
 for <alsa-devel@alsa-project.org>; Sat, 16 Jan 2021 15:46:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B314CF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="LmIIXxKj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610808409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VcTYlJfv01axpJK4vnd7O3uwpWJGDHk4puaBt63QC6I=;
 b=LmIIXxKj15ck/0ztCJ881Anor8KygPAbv67C7lwJaQEcLrbbmz1Ob4dyRzYGVef4BLoMCB
 4JuLDwaMtotX2L3AeOAmuqbg3M/1/ulb/P51n1XtOqyD1YjjHJO9SJbeLTf/h1YRwpB0tm
 SeXulEsVexO44gnBvuRjB4sD1fl4UPs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-rZ63W15iMIqVklS8zUkboQ-1; Sat, 16 Jan 2021 09:46:45 -0500
X-MC-Unique: rZ63W15iMIqVklS8zUkboQ-1
Received: by mail-ed1-f72.google.com with SMTP id a24so135731eda.14
 for <alsa-devel@alsa-project.org>; Sat, 16 Jan 2021 06:46:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VcTYlJfv01axpJK4vnd7O3uwpWJGDHk4puaBt63QC6I=;
 b=WBsJ/UytyUSDmk9sTKNoHv8tBCly5BTIgf95uHiWaHgcCRBmWu/xJFw0bK8taxd+WB
 hG1Ak5MRM5UM73lbsfyantUwslbwgINudRQC3XCs0PYhkEwqvkJ2THgjISlYuDMG6SKB
 VJHxUAIAtWpcMSK/Aax3Edh0PqN5v8C9hAso2NjoADHDvpjTgDalNqR++bJRtfUzERun
 o/Gm3si0UsPrn7QtbNn9KDZRyameF3Q3R9yBHSGMc4s7E7MZRgbLWjMOr9b2Odfup3Z8
 fDhloDylUhtY1i0XP1QVf6WM6D67STX5NjhJRPmNq5YNYxALxdPHyjHxn7U8L10DDrm3
 o0vw==
X-Gm-Message-State: AOAM531A+VAFcPFzEMJW+dfFtB+5oAbVswf398IPaUKj0BBGqvh+FgXM
 l6mhaaBfoOrSwISfxAhbLBh62TijwTkAiPpPqkHIzVHG3mHGF+dbtvHQ9OV+CRwR1PKWkULoiNt
 SbvE62f5ZpYjRyGdv2+vzZU0=
X-Received: by 2002:a17:906:804c:: with SMTP id
 x12mr11998508ejw.42.1610808404334; 
 Sat, 16 Jan 2021 06:46:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwh2dzEePXou8ehRPVsaKmmllVB6qkpljg6ffqyogAis6ElOP2KdZ5P145rlzQU4nWJvJd3WQ==
X-Received: by 2002:a17:906:804c:: with SMTP id
 x12mr11998494ejw.42.1610808404115; 
 Sat, 16 Jan 2021 06:46:44 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id p16sm7478518edw.44.2021.01.16.06.46.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Jan 2021 06:46:43 -0800 (PST)
Subject: Re: [PATCH 03/14] mfd: arizona: Add support for ACPI enumeration of
 WM5102 connected over SPI
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20201227211232.117801-1-hdegoede@redhat.com>
 <20201227211232.117801-4-hdegoede@redhat.com>
 <CAHp75VesAo9-GGCVyGcQuNLG8KOLcB_S+bokcxJTfeDn7sb0Bg@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <3946c0c5-6ace-47f9-9a3e-182bf6615d1f@redhat.com>
Date: Sat, 16 Jan 2021 15:46:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VesAo9-GGCVyGcQuNLG8KOLcB_S+bokcxJTfeDn7sb0Bg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Hi,

Thank you for the review.

On 12/28/20 3:14 PM, Andy Shevchenko wrote:
> On Sun, Dec 27, 2020 at 11:16 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The Intel Bay Trail (x86/ACPI) based Lenovo Yoga Tablet 2 series use
>> a WM5102 codec connected over SPI.
>>
>> Add support for ACPI enumeration to arizona-spi so that arizona-spi can
>> bind to the codec on these tablets.
>>
>> This is loosely based on an earlier attempt (for Android-x86) at this by
>> Christian Hartmann, combined with insights in things like the speaker GPIO
>> from the android-x86 android port for the Lenovo Yoga Tablet 2 1051F/L [1].
> 
> Few nitpicks here and there, but the most important bit that hits me
> is device_get_match_data().
> 
>> [1] https://github.com/Kitsune2222/Android_Yoga_Tablet_2-1051F_Kernel
>>
>> Cc: Christian Hartmann <cornogle@googlemail.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/mfd/arizona-spi.c | 120 ++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 120 insertions(+)
>>
>> diff --git a/drivers/mfd/arizona-spi.c b/drivers/mfd/arizona-spi.c
>> index 704f214d2614..bcdbd72fefb5 100644
>> --- a/drivers/mfd/arizona-spi.c
>> +++ b/drivers/mfd/arizona-spi.c
>> @@ -7,7 +7,10 @@
>>   * Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
>>   */
>>
>> +#include <linux/acpi.h>
>>  #include <linux/err.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/gpio/machine.h>
>>  #include <linux/module.h>
>>  #include <linux/pm_runtime.h>
>>  #include <linux/regmap.h>
>> @@ -15,11 +18,119 @@
>>  #include <linux/slab.h>
>>  #include <linux/spi/spi.h>
>>  #include <linux/of.h>
>> +#include <uapi/linux/input-event-codes.h>
>>
>>  #include <linux/mfd/arizona/core.h>
>>
>>  #include "arizona.h"
>>
>> +#ifdef CONFIG_ACPI
>> +const struct acpi_gpio_params reset_gpios = { 1, 0, false };
>> +const struct acpi_gpio_params ldoena_gpios = { 2, 0, false };
>> +
>> +static const struct acpi_gpio_mapping arizona_acpi_gpios[] = {
>> +       { "reset-gpios", &reset_gpios, 1, },
>> +       { "wlf,ldoena-gpios", &ldoena_gpios, 1 },
>> +       { }
>> +};
>> +
>> +/*
>> + * The ACPI resources for the device only describe external GPIO-s. They do
>> + * not provide mappings for the GPIO-s coming from the Arizona codec itself.
>> + */
>> +static const struct gpiod_lookup arizona_soc_gpios[] = {
>> +       { "arizona", 2, "wlf,spkvdd-ena", 0, GPIO_ACTIVE_HIGH },
>> +       { "arizona", 4, "wlf,micd-pol", 0, GPIO_ACTIVE_LOW },
>> +};
>> +
>> +/*
>> + * The AOSP 3.5 mm Headset: Accessory Specification gives the following values:
>> + * Function A Play/Pause:           0 ohm
>> + * Function D Voice assistant:    135 ohm
>> + * Function B Volume Up           240 ohm
>> + * Function C Volume Down         470 ohm
>> + * Minimum Mic DC resistance     1000 ohm
>> + * Minimum Ear speaker impedance   16 ohm
>> + * Note the first max value below must be less then the min. speaker impedance,
>> + * to allow CTIA/OMTP detection to work. The other max values are the closest
>> + * value from extcon-arizona.c:arizona_micd_levels halfway 2 button resistances.
>> + */
>> +static const struct arizona_micd_range arizona_micd_aosp_ranges[] = {
>> +       { .max =  11, .key = KEY_PLAYPAUSE },
>> +       { .max = 186, .key = KEY_VOICECOMMAND },
>> +       { .max = 348, .key = KEY_VOLUMEUP },
>> +       { .max = 752, .key = KEY_VOLUMEDOWN },
>> +};
>> +
>> +static void arizona_spi_acpi_remove_lookup(void *lookup)
>> +{
>> +       gpiod_remove_lookup_table(lookup);
>> +}
>> +
>> +static int arizona_spi_acpi_probe(struct arizona *arizona)
>> +{
>> +       struct gpiod_lookup_table *lookup;
>> +       int i, ret;
>> +
>> +       /* Add mappings for the 2 ACPI declared GPIOs used for reset and ldo-ena */
>> +       devm_acpi_dev_add_driver_gpios(arizona->dev, arizona_acpi_gpios);
>> +
>> +       /* Add lookups for the SoCs own GPIOs used for micdet-polarity and spkVDD-enable */
>> +       lookup = devm_kzalloc(arizona->dev,
>> +                             struct_size(lookup, table, ARRAY_SIZE(arizona_soc_gpios) + 1),
>> +                             GFP_KERNEL);
>> +       if (!lookup)
>> +               return -ENOMEM;
>> +
>> +       lookup->dev_id = dev_name(arizona->dev);
> 
>> +       for (i = 0; i < ARRAY_SIZE(arizona_soc_gpios); i++)
>> +               lookup->table[i] = arizona_soc_gpios[i];
> 
> Would memcpy() do the same at one pass?

True, fixed for v2.

>> +       gpiod_add_lookup_table(lookup);
>> +       ret = devm_add_action_or_reset(arizona->dev, arizona_spi_acpi_remove_lookup, lookup);
>> +       if (ret)
>> +               return ret;
> 
>> +       /* Enable 32KHz clock from SoC to codec for jack-detect */
>> +       acpi_evaluate_object(ACPI_HANDLE(arizona->dev), "CLKE", NULL, NULL);
> 
> No error check?

The codec will still work without the 32KHz clk, but we will loose jack-detect
functionality. I expect the ACPI call to already print some error, but to make
sure something is logged and to clarify what any previous logged ACPI errors are
about I've added code to log a warning when this fails for v2.

> 
>> +       /*
>> +        * Some DSDTs wrongly declare the IRQ trigger-type as IRQF_TRIGGER_FALLING
>> +        * The IRQ line will stay low when a new IRQ event happens between reading
>> +        * the IRQ status flags and acknowledging them. When the IRQ line stays
>> +        * low like this the IRQ will never trigger again when its type is set
>> +        * to IRQF_TRIGGER_FALLING. Correct the IRQ trigger-type to fix this.
>> +        */
>> +       arizona->pdata.irq_flags = IRQF_TRIGGER_LOW;
>> +
>> +       /* Wait 200 ms after jack insertion */
>> +       arizona->pdata.micd_detect_debounce = 200;
>> +
>> +       /* Use standard AOSP values for headset-button mappings */
>> +       arizona->pdata.micd_ranges = arizona_micd_aosp_ranges;
>> +       arizona->pdata.num_micd_ranges = ARRAY_SIZE(arizona_micd_aosp_ranges);
>> +
>> +       return 0;
>> +}
>> +
>> +static const struct acpi_device_id arizona_acpi_match[] = {
>> +       {
>> +               .id = "WM510204",
>> +               .driver_data = WM5102,
>> +       },
>> +       {
>> +               .id = "WM510205",
>> +               .driver_data = WM5102,
>> +       },
> 
>> +       { },
> 
> No need for comma here.

Fixed for v2.

> 
>> +};
>> +MODULE_DEVICE_TABLE(acpi, arizona_acpi_match);
>> +#else
> 
>> +static void arizona_spi_acpi_probe(struct arizona *arizona)
>> +{
>> +}
> 
> Can be one line?

I find it more readable as is.

> 
>> +#endif
>> +
>>  static int arizona_spi_probe(struct spi_device *spi)
>>  {
>>         const struct spi_device_id *id = spi_get_device_id(spi);
>> @@ -30,6 +141,8 @@ static int arizona_spi_probe(struct spi_device *spi)
>>
>>         if (spi->dev.of_node)
>>                 type = arizona_of_get_type(&spi->dev);
>> +       else if (ACPI_COMPANION(&spi->dev))
>> +               type = (unsigned long)acpi_device_get_match_data(&spi->dev);
> 
> Can we rather get rid of these and use device_get_match_data() directly?

That is a good idea, I'll add a nw preparation patch to v2 replacing the
custom arizona_of_get_type() helper with device_get_match_data().

>>         else
>>                 type = id->driver_data;
>>
>> @@ -75,6 +188,12 @@ static int arizona_spi_probe(struct spi_device *spi)
>>         arizona->dev = &spi->dev;
>>         arizona->irq = spi->irq;
>>
>> +       if (ACPI_COMPANION(&spi->dev)) {
> 
> has_acpi_companion() ?

Fixed for v2.

>> +               ret = arizona_spi_acpi_probe(arizona);
>> +               if (ret)
>> +                       return ret;
>> +       }
>> +
>>         return arizona_dev_init(arizona);
>>  }
>>
>> @@ -102,6 +221,7 @@ static struct spi_driver arizona_spi_driver = {
>>                 .name   = "arizona",
>>                 .pm     = &arizona_pm_ops,
>>                 .of_match_table = of_match_ptr(arizona_of_match),
>> +               .acpi_match_table = ACPI_PTR(arizona_acpi_match),
>>         },
>>         .probe          = arizona_spi_probe,
>>         .remove         = arizona_spi_remove,
>> --
>> 2.28.0
>>
> 
> 

Regards,

Hans

