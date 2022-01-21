Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5FD49620E
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jan 2022 16:28:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43D0F2A2E;
	Fri, 21 Jan 2022 16:27:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43D0F2A2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642778921;
	bh=OKxbPiJ/A2DNqScQ/J1xnFNz3kx9P3xLF0u7GoPbleI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SQXHDOAJk/LKGli7fYEdVPv+61uHtU9hS+ZRLgY4AAcs1Tt9tXiL+GdCWCBziMkI0
	 nRWmHqnYZ+7aTZpkAHPGaYAlu6wVucw/oJhhDuv79H1ZwBgR7XL9GRrHG5JxraTt8L
	 9iSydKXUTxbOxchg36tSlXNXXLUfmEmXQSA62zk4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9622AF80302;
	Fri, 21 Jan 2022 16:27:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A7C2F8028B; Fri, 21 Jan 2022 16:27:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E9FDF8007E
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 16:27:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E9FDF8007E
Received: by mail-qk1-f182.google.com with SMTP id a21so10294370qkn.0
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 07:27:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lj9jNsBYb6UuT5y2PdXbZKoxmEZr3Bxmp3rSob9MHGo=;
 b=s1rwQLVNdqVQ1aVpvMuELwIheN1yVnkMj8VGHhFVLpnqHi9fUC1jSOCXI1xZ5RF5bu
 jTIZjNzRPpmUasHjyyRsuhkkJqrxVOyRjzBwc8VDt1RbEakZYamu+8FSL01kv8MBi5Mh
 2BVycnLn6R43pY7KLMLTWe/0Cw+TGhKy59/9N2rvZLdnQ3S8uozOtFMpaPMDIHNXI8RK
 mvFbfuYkuJZTZjNoxN0FvC1OCVRChAPdVs5CNPpCuizbz8jZNqwOTII3kJ5Rp0kXKr8I
 pCARkn24HN+HnZY/lkfY7JGmuPxE3J3dXgQd4r2ANyED6pHKT4Q7go8Jn0nXJFl270cT
 9wjw==
X-Gm-Message-State: AOAM533vywRf24LhLo4/n5VsreqJzSGxe7VcmfHkYwJjtIMGDWdsFXUg
 Kwzw8gz2OIRko7H6UvKT349cfe+sR54cdCrlm44=
X-Google-Smtp-Source: ABdhPJxnWtWFJcRR4dimsXsjEm0ivqK4zpnjlksKnljWHNKERDI4Oy3ChV7XbKvHYaxI/FRIOfZTrrEbZJq6kapKNOo=
X-Received: by 2002:a05:620a:1a97:: with SMTP id
 bl23mr3052588qkb.621.1642778846386; 
 Fri, 21 Jan 2022 07:27:26 -0800 (PST)
MIME-Version: 1.0
References: <20220121143254.6432-1-sbinding@opensource.cirrus.com>
 <20220121143254.6432-7-sbinding@opensource.cirrus.com>
In-Reply-To: <20220121143254.6432-7-sbinding@opensource.cirrus.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 21 Jan 2022 16:27:15 +0100
Message-ID: <CAJZ5v0hGviZkciBx5pc2bP6yJfHi4_gOuBj7+exVfPaXCZvuvg@mail.gmail.com>
Subject: Re: [PATCH v5 6/9] platform/x86: serial-multi-instantiate: Reorganize
 I2C functions
To: Stefan Binding <sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 patches@opensource.cirrus.com, linux-spi <linux-spi@vger.kernel.org>,
 Len Brown <lenb@kernel.org>
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

On Fri, Jan 21, 2022 at 3:33 PM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> From: Lucas Tanure <tanureal@opensource.cirrus.com>
>
> Reorganize I2C functions to accommodate SPI support
> Split the probe and factor out parts of the code
> that will be used in the SPI support
>
> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> ---
>  .../platform/x86/serial-multi-instantiate.c   | 145 +++++++++++-------
>  1 file changed, 90 insertions(+), 55 deletions(-)
>
> diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
> index 32fb3f904547..162ec20a861a 100644
> --- a/drivers/platform/x86/serial-multi-instantiate.c
> +++ b/drivers/platform/x86/serial-multi-instantiate.c
> @@ -29,96 +29,131 @@ struct smi_instance {
>
>  struct smi {
>         int i2c_num;
> -       struct i2c_client *i2c_devs[];
> +       struct i2c_client **i2c_devs;
>  };
>
> -static int smi_probe(struct platform_device *pdev)
> +static int smi_get_irq(struct platform_device *pdev, struct acpi_device *adev,
> +                      const struct smi_instance *inst)
> +{
> +       int ret;
> +
> +       switch (inst->flags & IRQ_RESOURCE_TYPE) {
> +       case IRQ_RESOURCE_GPIO:
> +               ret = acpi_dev_gpio_irq_get(adev, inst->irq_idx);
> +               break;
> +       case IRQ_RESOURCE_APIC:
> +               ret = platform_get_irq(pdev, inst->irq_idx);
> +               break;
> +       default:
> +               ret = 0;
> +               break;

return 0;

would be slightly more efficient here

> +       }
> +
> +       if (ret < 0)
> +               dev_err_probe(&pdev->dev, ret, "Error requesting irq at index %d: %d\n",
> +                             inst->irq_idx, ret);
> +
> +       return ret;
> +}
> +
> +static void smi_devs_unregister(struct smi *smi)
> +{
> +       while (smi->i2c_num > 0)
> +               i2c_unregister_device(smi->i2c_devs[--smi->i2c_num]);
> +}
> +
> +/**
> + * smi_i2c_probe - Instantiate multiple I2C devices from inst array
> + * @pdev:      Platform device
> + * @adev:      ACPI device
> + * @smi:       Internal struct for Serial multi instantiate driver
> + * @inst:      Array of instances to probe

This is called inst_array below.

> + *
> + * Returns the number of I2C devices instantiate, Zero if none is found or a negative error code.
> + */
> +static int smi_i2c_probe(struct platform_device *pdev, struct acpi_device *adev, struct smi *smi,
> +                        const struct smi_instance *inst_array)
>  {
>         struct i2c_board_info board_info = {};
> -       const struct smi_instance *inst;
>         struct device *dev = &pdev->dev;
> -       struct acpi_device *adev;
> -       struct smi *smi;
>         char name[32];
> -       int i, ret;
> +       int i, ret, count;
>
> -       inst = device_get_match_data(dev);
> -       if (!inst) {
> -               dev_err(dev, "Error ACPI match data is missing\n");
> -               return -ENODEV;
> -       }
> -
> -       adev = ACPI_COMPANION(dev);
> -
> -       /* Count number of clients to instantiate */
>         ret = i2c_acpi_client_count(adev);
> -       if (ret < 0)
> -               return ret;
> +       if (ret <= 0)
> +               return ret == 0 ? -ENODEV : ret;

I would prefer

if ret < 0)
        return ret;
else if (!ret)
        return -ENODEV;

>
> -       smi = devm_kmalloc(dev, struct_size(smi, i2c_devs, ret), GFP_KERNEL);
> -       if (!smi)
> -               return -ENOMEM;
> +       count = ret;
>
> -       smi->i2c_num = ret;
> +       smi->i2c_devs = devm_kcalloc(dev, count, sizeof(*smi->i2c_devs), GFP_KERNEL);
> +       if (!smi->i2c_devs)
> +               return -ENOMEM;
>
> -       for (i = 0; i < smi->i2c_num && inst[i].type; i++) {
> +       for (i = 0; i < count && inst_array[i].type; i++) {
>                 memset(&board_info, 0, sizeof(board_info));
> -               strlcpy(board_info.type, inst[i].type, I2C_NAME_SIZE);
> -               snprintf(name, sizeof(name), "%s-%s.%d", dev_name(dev), inst[i].type, i);
> +               strscpy(board_info.type, inst_array[i].type, I2C_NAME_SIZE);

The switch-over from strlcpy() to strscpy() should be mentioned in the
changelog.

> +               snprintf(name, sizeof(name), "%s-%s.%d", dev_name(dev), inst_array[i].type, i);
>                 board_info.dev_name = name;
> -               switch (inst[i].flags & IRQ_RESOURCE_TYPE) {
> -               case IRQ_RESOURCE_GPIO:
> -                       ret = acpi_dev_gpio_irq_get(adev, inst[i].irq_idx);
> -                       if (ret < 0) {
> -                               dev_err(dev, "Error requesting irq at index %d: %d\n",
> -                                               inst[i].irq_idx, ret);
> -                               goto error;
> -                       }
> -                       board_info.irq = ret;
> -                       break;
> -               case IRQ_RESOURCE_APIC:
> -                       ret = platform_get_irq(pdev, inst[i].irq_idx);
> -                       if (ret < 0) {
> -                               dev_dbg(dev, "Error requesting irq at index %d: %d\n",
> -                                       inst[i].irq_idx, ret);
> -                               goto error;
> -                       }
> -                       board_info.irq = ret;
> -                       break;
> -               default:
> -                       board_info.irq = 0;
> -                       break;
> -               }
> +
> +               ret = smi_get_irq(pdev, adev, &inst_array[i]);
> +               if (ret < 0)
> +                       goto error;
> +               board_info.irq = ret;
> +
>                 smi->i2c_devs[i] = i2c_acpi_new_device(dev, i, &board_info);
>                 if (IS_ERR(smi->i2c_devs[i])) {
>                         ret = dev_err_probe(dev, PTR_ERR(smi->i2c_devs[i]),
>                                             "Error creating i2c-client, idx %d\n", i);
>                         goto error;
>                 }
> +               smi->i2c_num++;
>         }
> -       if (i < smi->i2c_num) {
> +       if (smi->i2c_num < count) {
>                 dev_err(dev, "Error finding driver, idx %d\n", i);

That's not particularly informative and so not particularly useful for
a casual receiver of this message.  I'd make it dev_dbg().

>                 ret = -ENODEV;
>                 goto error;
>         }
>
> -       platform_set_drvdata(pdev, smi);
> -       return 0;
> +       dev_info(dev, "Instantiated %d I2C devices.\n", smi->i2c_num);
>
> +       return 0;
>  error:
> -       while (--i >= 0)
> -               i2c_unregister_device(smi->i2c_devs[i]);
> +       smi_devs_unregister(smi);
>
>         return ret;
>  }
>
> +static int smi_probe(struct platform_device *pdev)
> +{
> +       const struct smi_instance *inst_array;
> +       struct device *dev = &pdev->dev;
> +       struct acpi_device *adev;
> +       struct smi *smi;
> +
> +       inst_array = device_get_match_data(dev);
> +       if (!inst_array) {
> +               dev_err(dev, "Error ACPI match data is missing\n");

Again, this isn't very informative to someone reading this message on
a random system, so I'd change the log level.

> +               return -ENODEV;
> +       }
> +
> +       adev = ACPI_COMPANION(dev);
> +       if (!adev)
> +               return -ENODEV;

Since you're at it anyway, I'd check the companion's presence upfront,
because you can't do much without it in any case.

> +
> +       smi = devm_kzalloc(dev, sizeof(*smi), GFP_KERNEL);
> +       if (!smi)
> +               return -ENOMEM;
> +
> +       platform_set_drvdata(pdev, smi);
> +
> +       return smi_i2c_probe(pdev, adev, smi, inst_array);
> +}
> +
>  static int smi_remove(struct platform_device *pdev)
>  {
>         struct smi *smi = platform_get_drvdata(pdev);
> -       int i;
>
> -       for (i = 0; i < smi->i2c_num; i++)
> -               i2c_unregister_device(smi->i2c_devs[i]);
> +       smi_devs_unregister(smi);
>
>         return 0;
>  }
> --
> 2.25.1
>
