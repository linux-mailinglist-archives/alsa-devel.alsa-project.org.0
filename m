Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E49BA16CDF
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 23:12:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6765D17E0;
	Tue,  7 May 2019 23:11:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6765D17E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557263552;
	bh=un+QaU0fDigbEZqyIj4fbMPAUoVNHzPI+UyIjeVORBA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WYHmKr0LDe6Ss7dv/GHNcNwlSt9scsUCgK+piv518bk7Z8H2Um4DkFeJPIRwhQuKK
	 yRefo+N18sEaeahvBYr9Nyu/7MoQfw7v7CqiZcSCZsitx9STzR1WHSt+vARI6DECgf
	 AbF5kaKgkZfmoOObt2Ua80yMqMTgJRpNM1/qkH24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BEE6F89674;
	Tue,  7 May 2019 23:10:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13DF5F89674; Tue,  7 May 2019 23:10:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B88FFF80726
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 23:10:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B88FFF80726
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="cUOg7k9m"
Received: by mail-oi1-x241.google.com with SMTP id a132so2416827oib.2
 for <alsa-devel@alsa-project.org>; Tue, 07 May 2019 14:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PpIRLa0EPUkGsaV2kP7/hzLOtUoCRFJZqLN3Lcca6Ag=;
 b=cUOg7k9mN2ZDKIuaTY1HLFy+LFLFpnDmIIm0r3g+1/7VkYbeQvAC4YXOJnQc9TRV5N
 GR6JHP18g28yQZmK/SllGH2EXDLTKul4eEbEeS+AtS9dVoIXwp6OpjtYtOQXpBAfOpzL
 U60G09cU1yb8d4As0t+45+YMr0+wRa1JpeDx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PpIRLa0EPUkGsaV2kP7/hzLOtUoCRFJZqLN3Lcca6Ag=;
 b=Gf+Vj+ZEyraeXx29OA+yuZ1WWqosXFTmjxUfJbMzLHPSlfNxFoxktbuXH9fPZhWuQn
 XVjntm0atdsOKm88UM3u5dQN84QCarRtBHbDDqiAeIDz5MqYJ+jYGJw0waut4BiEqNHb
 CrwykcYTnhBOoGBnWQYUt97jns0T8w+E71mQqrq8vpdj+7fGf4Y2dNMEfiQGApJnpakj
 GMgpulItUBMwlijgEYeZbcxk5BxN38Sp00d4ghkiOnajLLzOp3EV3A6+53yMFFJCv6oO
 EBo0qyKjX1Z1nusIe7qHsqVMNY0DM5t+ZnW8VdW8kn9Bf8m1HPXvaoQiZLtJEkwBn49d
 LxCA==
X-Gm-Message-State: APjAAAUFqjx886n/L6lKCQ92mLym3TLgDPNCySZ6+9oDHcu3aqRgQdbn
 Gly6tXwRzJ2IWMT3FOPY0ld3ZtZkf72o7sMEa3OE
X-Google-Smtp-Source: APXvYqyPpe1r8f0ECxtL8xtGyY0xiMA2MOfeCE4mu2pOYNrp0A3f7Z7tJVmpv2MxdLR85pwcuhtH3rdhjAu1lQ04Ack=
X-Received: by 2002:aca:3603:: with SMTP id d3mr310846oia.145.1557263436986;
 Tue, 07 May 2019 14:10:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190503230751.168403-1-fletcherw@chromium.org>
 <20190503230751.168403-2-fletcherw@chromium.org>
In-Reply-To: <20190503230751.168403-2-fletcherw@chromium.org>
From: Curtis Malainey <cujomalainey@chromium.org>
Date: Tue, 7 May 2019 14:10:26 -0700
Message-ID: <CAJ77E19K7ukNzvhOx1Jh_E6A69fqc6OMJ1aEgR6QjFmM0d=ePw@mail.gmail.com>
To: Fletcher Woodruff <fletcherw@chromium.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Ben Zhang <benzh@chromium.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v4 1/3] ASoC: rt5677: allow multiple
 interrupt sources
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

On Fri, May 3, 2019 at 4:10 PM Fletcher Woodruff <fletcherw@chromium.org>
wrote:

> From: Ben Zhang <benzh@chromium.org>
>
> This patch allows headphone plug detect and mic present
> detect to be enabled at the same time. This patch implements
> an irq_chip with irq_domain directly instead of using
> regmap-irq, so that interrupt source line polarities can
> be flipped to support irq sharing.
>
> This patch does not add polarity flipping support within regmap-irq
> because there is extra work that must be done within the irq handler
> to support hotword detection. On the Chromebook Pixel, the firmware will
> disconnect GPIO1 from the jack detection irq when a hotword is detected
> and trigger the interrupt handler. Inside the handler, we will need to
> detect this, report the hotword event, and re-connect GPIO1 to the jack
> detection irq.
>
> Signed-off-by: Ben Zhang <benzh@chromium.org>
> Signed-off-by: Fletcher Woodruff <fletcherw@chromium.org>
> ---
>  sound/soc/codecs/rt5677.c | 256 ++++++++++++++++++++++++++++----------
>  sound/soc/codecs/rt5677.h |  14 ++-
>  2 files changed, 203 insertions(+), 67 deletions(-)
>
> diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
> index 9b7a1833d3316c..899e07e30228a1 100644
> --- a/sound/soc/codecs/rt5677.c
> +++ b/sound/soc/codecs/rt5677.c
> @@ -23,6 +23,10 @@
>  #include <linux/firmware.h>
>  #include <linux/of_device.h>
>  #include <linux/property.h>
> +#include <linux/irq.h>
> +#include <linux/interrupt.h>
> +#include <linux/irqdomain.h>
> +#include <linux/workqueue.h>
>  #include <sound/core.h>
>  #include <sound/pcm.h>
>  #include <sound/pcm_params.h>
> @@ -4620,7 +4624,6 @@ static void rt5677_gpio_config(struct rt5677_priv
> *rt5677, unsigned offset,
>  static int rt5677_to_irq(struct gpio_chip *chip, unsigned offset)
>  {
>         struct rt5677_priv *rt5677 = gpiochip_get_data(chip);
> -       struct regmap_irq_chip_data *data = rt5677->irq_data;
>         int irq;
>
>         if ((rt5677->pdata.jd1_gpio == 1 && offset == RT5677_GPIO1) ||
> @@ -4646,7 +4649,7 @@ static int rt5677_to_irq(struct gpio_chip *chip,
> unsigned offset)
>                 return -ENXIO;
>         }
>
> -       return regmap_irq_get_virq(data, irq);
> +       return irq_create_mapping(rt5677->domain, irq);
>  }
>
>  static const struct gpio_chip rt5677_template_chip = {
> @@ -4716,37 +4719,13 @@ static int rt5677_probe(struct snd_soc_component
> *component)
>
>         snd_soc_component_force_bias_level(component, SND_SOC_BIAS_OFF);
>
> -       regmap_write(rt5677->regmap, RT5677_DIG_MISC, 0x0020);
> +       regmap_update_bits(rt5677->regmap, RT5677_DIG_MISC,
> +                       ~RT5677_IRQ_DEBOUNCE_SEL_MASK, 0x0020);
>         regmap_write(rt5677->regmap, RT5677_PWR_DSP2, 0x0c00);
>
>         for (i = 0; i < RT5677_GPIO_NUM; i++)
>                 rt5677_gpio_config(rt5677, i,
> rt5677->pdata.gpio_config[i]);
>
> -       if (rt5677->irq_data) {
> -               regmap_update_bits(rt5677->regmap, RT5677_GPIO_CTRL1,
> 0x8000,
> -                       0x8000);
> -               regmap_update_bits(rt5677->regmap, RT5677_DIG_MISC, 0x0018,
> -                       0x0008);
> -
> -               if (rt5677->pdata.jd1_gpio)
> -                       regmap_update_bits(rt5677->regmap, RT5677_JD_CTRL1,
> -                               RT5677_SEL_GPIO_JD1_MASK,
> -                               rt5677->pdata.jd1_gpio <<
> -                               RT5677_SEL_GPIO_JD1_SFT);
> -
> -               if (rt5677->pdata.jd2_gpio)
> -                       regmap_update_bits(rt5677->regmap, RT5677_JD_CTRL1,
> -                               RT5677_SEL_GPIO_JD2_MASK,
> -                               rt5677->pdata.jd2_gpio <<
> -                               RT5677_SEL_GPIO_JD2_SFT);
> -
> -               if (rt5677->pdata.jd3_gpio)
> -                       regmap_update_bits(rt5677->regmap, RT5677_JD_CTRL1,
> -                               RT5677_SEL_GPIO_JD3_MASK,
> -                               rt5677->pdata.jd3_gpio <<
> -                               RT5677_SEL_GPIO_JD3_SFT);
> -       }
> -
>         mutex_init(&rt5677->dsp_cmd_lock);
>         mutex_init(&rt5677->dsp_pri_lock);
>
> @@ -5063,65 +5042,210 @@ static void rt5677_read_device_properties(struct
> rt5677_priv *rt5677,
>                         &rt5677->pdata.jd3_gpio);
>  }
>
> -static struct regmap_irq rt5677_irqs[] = {
> +struct rt5677_irq_desc {
> +       unsigned int enable_mask;
> +       unsigned int status_mask;
> +       unsigned int polarity_mask;
> +};
> +
> +static const struct rt5677_irq_desc rt5677_irq_descs[] = {
>         [RT5677_IRQ_JD1] = {
> -               .reg_offset = 0,
> -               .mask = RT5677_EN_IRQ_GPIO_JD1,
> +               .enable_mask = RT5677_EN_IRQ_GPIO_JD1,
> +               .status_mask = RT5677_STA_GPIO_JD1,
> +               .polarity_mask = RT5677_INV_GPIO_JD1,
>         },
>         [RT5677_IRQ_JD2] = {
> -               .reg_offset = 0,
> -               .mask = RT5677_EN_IRQ_GPIO_JD2,
> +               .enable_mask = RT5677_EN_IRQ_GPIO_JD2,
> +               .status_mask = RT5677_STA_GPIO_JD2,
> +               .polarity_mask = RT5677_INV_GPIO_JD2,
>         },
>         [RT5677_IRQ_JD3] = {
> -               .reg_offset = 0,
> -               .mask = RT5677_EN_IRQ_GPIO_JD3,
> +               .enable_mask = RT5677_EN_IRQ_GPIO_JD3,
> +               .status_mask = RT5677_STA_GPIO_JD3,
> +               .polarity_mask = RT5677_INV_GPIO_JD3,
>         },
>  };
>
> -static struct regmap_irq_chip rt5677_irq_chip = {
> -       .name = "rt5677",
> -       .irqs = rt5677_irqs,
> -       .num_irqs = ARRAY_SIZE(rt5677_irqs),
> +static irqreturn_t rt5677_irq(int unused, void *data)
> +{
> +       struct rt5677_priv *rt5677 = data;
> +       int ret = 0, i, reg_irq, virq;
> +       bool irq_fired;
> +
> +       mutex_lock(&rt5677->irq_lock);
> +       /* Read interrupt status */
> +       ret = regmap_read(rt5677->regmap, RT5677_IRQ_CTRL1, &reg_irq);
> +       if (ret) {
> +               dev_err(rt5677->component->dev,
> +                       "Failed to read IRQ status: %d\n",
> +                       ret);
> +               goto exit;
> +       }
> +       /*
> +        * Clear the interrupt by flipping the polarity of the
> +        * interrupt source lines that just fired
> +        */
> +       irq_fired = false;
> +       for (i = 0; i < RT5677_IRQ_NUM; i++) {
> +               if (reg_irq & rt5677_irq_descs[i].status_mask) {
> +                       reg_irq ^= rt5677_irq_descs[i].polarity_mask;
> +                       irq_fired = true;
> +               }
> +       }
> +       if (!irq_fired)
> +               goto exit;
>
> -       .num_regs = 1,
> -       .status_base = RT5677_IRQ_CTRL1,
> -       .mask_base = RT5677_IRQ_CTRL1,
> -       .mask_invert = 1,
> -};
> +       ret = regmap_write(rt5677->regmap, RT5677_IRQ_CTRL1, reg_irq);
> +       if (ret) {
> +               dev_err(rt5677->component->dev,
> +                       "Failed to update IRQ status: %d\n",
> +                       ret);
> +               goto exit;
> +       }
> +
> +       /* Process interrupts */
> +       for (i = 0; i < RT5677_IRQ_NUM; i++) {
> +               if ((reg_irq & rt5677_irq_descs[i].enable_mask) &&
> +                   (reg_irq & rt5677_irq_descs[i].status_mask)) {
> +                       virq = irq_find_mapping(rt5677->domain, i);
> +                       if (virq)
> +                               handle_nested_irq(virq);
> +               }
> +       }
> +exit:
> +       mutex_unlock(&rt5677->irq_lock);
> +       return IRQ_HANDLED;
> +}
>
> -static int rt5677_init_irq(struct i2c_client *i2c)
> +static void rt5677_irq_work(struct work_struct *work)
>  {
> -       int ret;
> -       struct rt5677_priv *rt5677 = i2c_get_clientdata(i2c);
> +       struct rt5677_priv *rt5677 =
> +               container_of(work, struct rt5677_priv, irq_work.work);
>
> -       if (!rt5677->pdata.jd1_gpio &&
> -               !rt5677->pdata.jd2_gpio &&
> -               !rt5677->pdata.jd3_gpio)
> -               return 0;
> +       rt5677_irq(0, rt5677);
> +}
>
> -       if (!i2c->irq) {
> -               dev_err(&i2c->dev, "No interrupt specified\n");
> -               return -EINVAL;
> -       }
> +static void rt5677_irq_bus_lock(struct irq_data *data)
> +{
> +       struct rt5677_priv *rt5677 = irq_data_get_irq_chip_data(data);
>
> -       ret = regmap_add_irq_chip(rt5677->regmap, i2c->irq,
> -               IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> 0,
> -               &rt5677_irq_chip, &rt5677->irq_data);
> +       mutex_lock(&rt5677->irq_lock);
> +}
>
> -       if (ret != 0) {
> -               dev_err(&i2c->dev, "Failed to register IRQ chip: %d\n",
> ret);
> -               return ret;
> -       }
> +static void rt5677_irq_bus_sync_unlock(struct irq_data *data)
> +{
> +       struct rt5677_priv *rt5677 = irq_data_get_irq_chip_data(data);
> +
> +       regmap_update_bits(rt5677->regmap, RT5677_IRQ_CTRL1,
> +                       RT5677_EN_IRQ_GPIO_JD1 | RT5677_EN_IRQ_GPIO_JD2 |
> +                       RT5677_EN_IRQ_GPIO_JD3, rt5677->irq_en);
> +       mutex_unlock(&rt5677->irq_lock);
> +}
>
> +static void rt5677_irq_enable(struct irq_data *data)
> +{
> +       struct rt5677_priv *rt5677 = irq_data_get_irq_chip_data(data);
> +
> +       rt5677->irq_en |= rt5677_irq_descs[data->hwirq].enable_mask;
> +}
> +
> +static void rt5677_irq_disable(struct irq_data *data)
> +{
> +       struct rt5677_priv *rt5677 = irq_data_get_irq_chip_data(data);
> +
> +       rt5677->irq_en &= ~rt5677_irq_descs[data->hwirq].enable_mask;
> +}
> +
> +static struct irq_chip rt5677_irq_chip = {
> +       .name                   = "rt5677_irq_chip",
> +       .irq_bus_lock           = rt5677_irq_bus_lock,
> +       .irq_bus_sync_unlock    = rt5677_irq_bus_sync_unlock,
> +       .irq_disable            = rt5677_irq_disable,
> +       .irq_enable             = rt5677_irq_enable,
> +};
> +
> +static int rt5677_irq_map(struct irq_domain *h, unsigned int virq,
> +                         irq_hw_number_t hw)
> +{
> +       struct rt5677_priv *rt5677 = h->host_data;
> +
> +       irq_set_chip_data(virq, rt5677);
> +       irq_set_chip(virq, &rt5677_irq_chip);
> +       irq_set_nested_thread(virq, 1);
> +       irq_set_noprobe(virq);
>         return 0;
>  }
>
> -static void rt5677_free_irq(struct i2c_client *i2c)
> +
> +static const struct irq_domain_ops rt5677_domain_ops = {
> +       .map    = rt5677_irq_map,
> +       .xlate  = irq_domain_xlate_twocell,
> +};
> +
> +static void rt5677_init_irq(struct i2c_client *i2c)
> +{
> +       struct rt5677_priv *rt5677 = i2c_get_clientdata(i2c);
> +       int ret;
> +       unsigned int jd_mask = 0, jd_val = 0;
> +
> +       /* No irq has been assigned to the codec */
> +       if (!i2c->irq)
> +               return;
> +
> +       mutex_init(&rt5677->irq_lock);
> +       INIT_DELAYED_WORK(&rt5677->irq_work, rt5677_irq_work);
> +
> +       /*
> +        * Select RC as the debounce clock so that GPIO works even when
> +        * MCLK is gated which happens when there is no audio stream
> +        * (SND_SOC_BIAS_OFF).
> +        */
> +       regmap_update_bits(rt5677->regmap, RT5677_DIG_MISC,
> +                       RT5677_IRQ_DEBOUNCE_SEL_MASK,
> +                       RT5677_IRQ_DEBOUNCE_SEL_RC);
> +       /* Enable auto power on RC when GPIO states are changed */
> +       regmap_update_bits(rt5677->regmap, RT5677_GEN_CTRL1, 0xff, 0xff);
> +
> +       /* Select and enable jack detection sources per platform data */
> +       if (rt5677->pdata.jd1_gpio) {
> +               jd_mask |= RT5677_SEL_GPIO_JD1_MASK;
> +               jd_val  |= rt5677->pdata.jd1_gpio <<
> RT5677_SEL_GPIO_JD1_SFT;
> +       }
> +       if (rt5677->pdata.jd2_gpio) {
> +               jd_mask |= RT5677_SEL_GPIO_JD2_MASK;
> +               jd_val  |= rt5677->pdata.jd2_gpio <<
> RT5677_SEL_GPIO_JD2_SFT;
> +       }
> +       if (rt5677->pdata.jd3_gpio) {
> +               jd_mask |= RT5677_SEL_GPIO_JD3_MASK;
> +               jd_val  |= rt5677->pdata.jd3_gpio <<
> RT5677_SEL_GPIO_JD3_SFT;
> +       }
> +       regmap_update_bits(rt5677->regmap, RT5677_JD_CTRL1, jd_mask,
> jd_val);
> +
> +       /* Set GPIO1 pin to be IRQ output */
> +       regmap_update_bits(rt5677->regmap, RT5677_GPIO_CTRL1,
> +                       RT5677_GPIO1_PIN_MASK, RT5677_GPIO1_PIN_IRQ);
> +
> +       /* Ready to listen for interrupts */
> +       rt5677->domain = irq_domain_add_linear(i2c->dev.of_node,
> +                       RT5677_IRQ_NUM, &rt5677_domain_ops, rt5677);
> +       if (!rt5677->domain) {
> +               dev_err(&i2c->dev, "Failed to create IRQ domain\n");
> +               return;
> +       }
> +       ret = devm_request_threaded_irq(&i2c->dev, i2c->irq, NULL,
> rt5677_irq,
> +                       IRQF_TRIGGER_RISING | IRQF_ONESHOT,
> +                       "rt5677", i2c);
>
Something is a bit weird here, you are passing in the i2c device type for
the irq but reading out the rt5677_priv in the interrupt. This is causing
KASAN errors.

> +       if (ret) {
> +               dev_err(&i2c->dev, "Failed to request IRQ: %d\n", ret);
> +               return;
> +       }
> +}
> +
> +static void rt5677_irq_exit(struct i2c_client *i2c)
>  {
>         struct rt5677_priv *rt5677 = i2c_get_clientdata(i2c);
>
> -       if (rt5677->irq_data)
> -               regmap_del_irq_chip(i2c->irq, rt5677->irq_data);
> +       cancel_delayed_work_sync(&rt5677->irq_work);
>  }
>
>  static int rt5677_i2c_probe(struct i2c_client *i2c)
> @@ -5259,7 +5383,7 @@ static int rt5677_i2c_probe(struct i2c_client *i2c)
>
>  static int rt5677_i2c_remove(struct i2c_client *i2c)
>  {
> -       rt5677_free_irq(i2c);
> +       rt5677_irq_exit(i2c);
>         rt5677_free_gpio(i2c);
>
>         return 0;
> diff --git a/sound/soc/codecs/rt5677.h b/sound/soc/codecs/rt5677.h
> index 183d92b030459f..9c73bea8635508 100644
> --- a/sound/soc/codecs/rt5677.h
> +++ b/sound/soc/codecs/rt5677.h
> @@ -1636,6 +1636,12 @@
>  #define RT5677_GPIO6_P_NOR                     (0x0 << 0)
>  #define RT5677_GPIO6_P_INV                     (0x1 << 0)
>
> +/* General Control (0xfa) */
> +#define RT5677_IRQ_DEBOUNCE_SEL_MASK           (0x3 << 3)
> +#define RT5677_IRQ_DEBOUNCE_SEL_MCLK           (0x0 << 3)
> +#define RT5677_IRQ_DEBOUNCE_SEL_RC             (0x1 << 3)
> +#define RT5677_IRQ_DEBOUNCE_SEL_SLIM           (0x2 << 3)
> +
>  /* Virtual DSP Mixer Control (0xf7 0xf8 0xf9) */
>  #define RT5677_DSP_IB_01_H                     (0x1 << 15)
>  #define RT5677_DSP_IB_01_H_SFT                 15
> @@ -1713,6 +1719,7 @@ enum {
>         RT5677_IRQ_JD1,
>         RT5677_IRQ_JD2,
>         RT5677_IRQ_JD3,
> +       RT5677_IRQ_NUM,
>  };
>
>  enum rt5677_type {
> @@ -1811,9 +1818,14 @@ struct rt5677_priv {
>         struct gpio_chip gpio_chip;
>  #endif
>         bool dsp_vad_en;
> -       struct regmap_irq_chip_data *irq_data;
>         bool is_dsp_mode;
>         bool is_vref_slow;
> +
> +       /* Interrupt handling */
> +       struct irq_domain *domain;
> +       struct mutex irq_lock;
> +       unsigned int irq_en;
> +       struct delayed_work irq_work;
>  };
>
>  int rt5677_sel_asrc_clk_src(struct snd_soc_component *component,
> --
> 2.21.0.1020.gf2820cf01a-goog
>
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
