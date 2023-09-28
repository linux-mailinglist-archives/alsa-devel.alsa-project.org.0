Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF057B1C96
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Sep 2023 14:36:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C588FA4D;
	Thu, 28 Sep 2023 14:35:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C588FA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695904569;
	bh=GN1bX0k1x0BczDRyI8rQlul/tW86heP9nI7eg/YpkmY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HGDfuP3aLhMPt1WZicbp4qLloxHzms0KX/vucfB8PDfSU1UrUeccjdXqLSRfkUEts
	 JqV7kiQSIlT7a28qpkL/EM6XV4u8e4hFA1/KH4QhnpLdyA4mUPF/I4pjAGpWeuby5F
	 nDcBhH03V45suNJFQqmexr9wxwVln0FXG7SYNJiY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29538F80551; Thu, 28 Sep 2023 14:35:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF4F1F8016A;
	Thu, 28 Sep 2023 14:35:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 877A4F801D5; Thu, 28 Sep 2023 14:35:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-6.5 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C86CF8007C
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 14:35:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C86CF8007C
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 998461FB;
	Thu, 28 Sep 2023 05:35:39 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F5CB3F5A1;
	Thu, 28 Sep 2023 05:35:00 -0700 (PDT)
Message-ID: <9199562c-65ac-d8b1-20bd-429a32ede6c9@arm.com>
Date: Thu, 28 Sep 2023 13:34:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/4] ASoC: rockchip: Convert RK3288 HDMI to GPIO
 descriptors
Content-Language: en-GB
To: Linus Walleij <linus.walleij@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: alsa-devel@alsa-project.org, linux-gpio@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20230928-descriptors-asoc-rockchip-v1-0-a142a42d4787@linaro.org>
 <20230928-descriptors-asoc-rockchip-v1-1-a142a42d4787@linaro.org>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20230928-descriptors-asoc-rockchip-v1-1-a142a42d4787@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LRKOR7UP65PIQYEDNKMSSE5MTYAWNPSR
X-Message-ID-Hash: LRKOR7UP65PIQYEDNKMSSE5MTYAWNPSR
X-MailFrom: robin.murphy@arm.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LRKOR7UP65PIQYEDNKMSSE5MTYAWNPSR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 27/09/2023 11:47 pm, Linus Walleij wrote:
> This converts the Rockchip RK3288 HDMI driver to use GPIO
> descriptors:
> 
> - Look up the HP EN GPIO as a descriptor and handle it directly.
> 
> - Let the Jack detection core obtain and handle the HP detection
>    GPIO, just pass the right name and gpiod_dev and it will
>    do the job.
> 
> - As the probe() code is very insistent on getting valid
>    GPIOs out of the device before it will continue, there
>    is no point to carry all the code handling the GPIOs as
>    optional, drop all these checks.

Isn't it allowing them to be optional as long as of_get_named_gpio() 
returns -ENODEV (which I guess may come out of the chip->of_xlate 
callback)? Or is it implied that that's never actually been able to happen?

(just curious...)

FWIW the DT binding does define them as optional, but the only in-tree 
user provides both, so it seems unlikely to pose a regression in 
practice even if we did just drop the notional support.

Thanks,
Robin.

> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>   sound/soc/rockchip/rk3288_hdmi_analog.c | 54 +++++++++++----------------------
>   1 file changed, 17 insertions(+), 37 deletions(-)
> 
> diff --git a/sound/soc/rockchip/rk3288_hdmi_analog.c b/sound/soc/rockchip/rk3288_hdmi_analog.c
> index 0c6bd9a019db..7199f991ec26 100644
> --- a/sound/soc/rockchip/rk3288_hdmi_analog.c
> +++ b/sound/soc/rockchip/rk3288_hdmi_analog.c
> @@ -12,8 +12,7 @@
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
>   #include <linux/slab.h>
> -#include <linux/gpio.h>
> -#include <linux/of_gpio.h>
> +#include <linux/gpio/consumer.h>
>   #include <sound/core.h>
>   #include <sound/jack.h>
>   #include <sound/pcm.h>
> @@ -26,8 +25,7 @@
>   #define DRV_NAME "rk3288-snd-hdmi-analog"
>   
>   struct rk_drvdata {
> -	int gpio_hp_en;
> -	int gpio_hp_det;
> +	struct gpio_desc *gpio_hp_en;
>   };
>   
>   static int rk_hp_power(struct snd_soc_dapm_widget *w,
> @@ -35,11 +33,8 @@ static int rk_hp_power(struct snd_soc_dapm_widget *w,
>   {
>   	struct rk_drvdata *machine = snd_soc_card_get_drvdata(w->dapm->card);
>   
> -	if (!gpio_is_valid(machine->gpio_hp_en))
> -		return 0;
> -
> -	gpio_set_value_cansleep(machine->gpio_hp_en,
> -				SND_SOC_DAPM_EVENT_ON(event));
> +	gpiod_set_value_cansleep(machine->gpio_hp_en,
> +				 SND_SOC_DAPM_EVENT_ON(event));
>   
>   	return 0;
>   }
> @@ -113,24 +108,23 @@ static int rk_hw_params(struct snd_pcm_substream *substream,
>   }
>   
>   static struct snd_soc_jack_gpio rk_hp_jack_gpio = {
> -	.name = "Headphone detection",
> +	.name = "rockchip,hp-det",
>   	.report = SND_JACK_HEADPHONE,
>   	.debounce_time = 150
>   };
>   
>   static int rk_init(struct snd_soc_pcm_runtime *runtime)
>   {
> -	struct rk_drvdata *machine = snd_soc_card_get_drvdata(runtime->card);
> +	struct snd_soc_card *card = runtime->card;
> +	struct device *dev = card->dev;
>   
>   	/* Enable Headset Jack detection */
> -	if (gpio_is_valid(machine->gpio_hp_det)) {
> -		snd_soc_card_jack_new_pins(runtime->card, "Headphone Jack",
> -					   SND_JACK_HEADPHONE, &headphone_jack,
> -					   headphone_jack_pins,
> -					   ARRAY_SIZE(headphone_jack_pins));
> -		rk_hp_jack_gpio.gpio = machine->gpio_hp_det;
> -		snd_soc_jack_add_gpios(&headphone_jack, 1, &rk_hp_jack_gpio);
> -	}
> +	rk_hp_jack_gpio.gpiod_dev = dev;
> +	snd_soc_card_jack_new_pins(runtime->card, "Headphone Jack",
> +				   SND_JACK_HEADPHONE, &headphone_jack,
> +				   headphone_jack_pins,
> +				   ARRAY_SIZE(headphone_jack_pins));
> +	snd_soc_jack_add_gpios(&headphone_jack, 1, &rk_hp_jack_gpio);
>   
>   	return 0;
>   }
> @@ -182,24 +176,10 @@ static int snd_rk_mc_probe(struct platform_device *pdev)
>   
>   	card->dev = &pdev->dev;
>   
> -	machine->gpio_hp_det = of_get_named_gpio(np,
> -		"rockchip,hp-det-gpios", 0);
> -	if (!gpio_is_valid(machine->gpio_hp_det) && machine->gpio_hp_det != -ENODEV)
> -		return machine->gpio_hp_det;
> -
> -	machine->gpio_hp_en = of_get_named_gpio(np,
> -		"rockchip,hp-en-gpios", 0);
> -	if (!gpio_is_valid(machine->gpio_hp_en) && machine->gpio_hp_en != -ENODEV)
> -		return machine->gpio_hp_en;
> -
> -	if (gpio_is_valid(machine->gpio_hp_en)) {
> -		ret = devm_gpio_request_one(&pdev->dev, machine->gpio_hp_en,
> -					    GPIOF_OUT_INIT_LOW, "hp_en");
> -		if (ret) {
> -			dev_err(card->dev, "cannot get hp_en gpio\n");
> -			return ret;
> -		}
> -	}
> +	machine->gpio_hp_en = devm_gpiod_get(&pdev->dev, "rockchip,hp-en", GPIOD_OUT_LOW);
> +	if (IS_ERR(machine->gpio_hp_en))
> +		return PTR_ERR(machine->gpio_hp_en);
> +	gpiod_set_consumer_name(machine->gpio_hp_en, "hp_en");
>   
>   	ret = snd_soc_of_parse_card_name(card, "rockchip,model");
>   	if (ret) {
> 
