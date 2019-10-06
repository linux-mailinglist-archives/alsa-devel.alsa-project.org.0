Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A06CD02A
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Oct 2019 11:59:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FE9B1665;
	Sun,  6 Oct 2019 11:58:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FE9B1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570355959;
	bh=3kBQJh7EknBnbPjvnQzsNEs0NLjWU6oBqXhDZYqy/JE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YWicM169fCAJm75xqSNRPTohkIH1Y2qWBo7paRsNg+zlubtS91CWUtiKh1rZcLX47
	 e8mchr/2+E1Bv7P4jOqJ5w7ohz30LgaDmQ4TM4T1Eygw3kokrQoN14O0W1FZlFXPfC
	 z40KKEHZB5IAkDqONtDVHyWlP+YD6IJWFiodzls4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 499B9F8045E;
	Sun,  6 Oct 2019 11:57:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69833F8038F; Sun,  6 Oct 2019 11:57:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from cvs.linux-mips.org (eddie.linux-mips.org [148.251.95.138])
 by alsa1.perex.cz (Postfix) with ESMTP id E3787F80137
 for <alsa-devel@alsa-project.org>; Sun,  6 Oct 2019 11:57:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3787F80137
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
 (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
 id S23990413AbfJFJ51AhgUS (ORCPT
 <rfc822;alsa-devel@alsa-project.org>); Sun, 6 Oct 2019 11:57:27 +0200
Date: Sun, 6 Oct 2019 11:57:20 +0200
From: Ladislav Michl <ladis@linux-mips.org>
To: YueHaibing <yuehaibing@huawei.com>
Message-ID: <20191006095720.GA13261@lenoch>
References: <20191006072241.56808-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191006072241.56808-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: m.felsch@pengutronix.de, andradanciu1997@gmail.com,
 ckeepax@opensource.cirrus.com, kuninori.morimoto.gx@renesas.com,
 linux-kernel@vger.kernel.org, mirq-linux@rere.qmqm.pl,
 piotrs@opensource.cirrus.com, tiwai@suse.com, lgirdwood@gmail.com,
 paul@crapouillou.net, alsa-devel@alsa-project.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, enric.balletbo@collabora.com,
 shifu0704@thundersoft.com, rf@opensource.wolfsonmicro.com
Subject: Re: [alsa-devel] [PATCH -next] ASoc: tas2770: Fix build error
 without GPIOLIB
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

Dear YueHaibing,

On Sun, Oct 06, 2019 at 03:22:41PM +0800, YueHaibing wrote:
> If GPIOLIB is not set, building fails:
> 
> sound/soc/codecs/tas2770.c: In function tas2770_reset:
> sound/soc/codecs/tas2770.c:38:3: error: implicit declaration of function gpiod_set_value_cansleep; did you mean gpio_set_value_cansleep? [-Werror=implicit-function-declaration]
>    gpiod_set_value_cansleep(tas2770->reset_gpio, 0);
>    ^~~~~~~~~~~~~~~~~~~~~~~~
>    gpio_set_value_cansleep
> sound/soc/codecs/tas2770.c: In function tas2770_i2c_probe:
> sound/soc/codecs/tas2770.c:749:24: error: implicit declaration of function devm_gpiod_get_optional; did you mean devm_regulator_get_optional? [-Werror=implicit-function-declaration]
>   tas2770->reset_gpio = devm_gpiod_get_optional(tas2770->dev,
>                         ^~~~~~~~~~~~~~~~~~~~~~~
>                         devm_regulator_get_optional
> sound/soc/codecs/tas2770.c:751:13: error: GPIOD_OUT_HIGH undeclared (first use in this function); did you mean GPIOF_INIT_HIGH?
>              GPIOD_OUT_HIGH);
>              ^~~~~~~~~~~~~~
>              GPIOF_INIT_HIGH
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: 1a476abc723e ("tas2770: add tas2770 smart PA kernel driver")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  sound/soc/codecs/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index bcac957..d639f17 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -1108,6 +1108,7 @@ config SND_SOC_TAS2552
>  config SND_SOC_TAS2770
>  	tristate "Texas Instruments TAS2770 speaker amplifier"
>  	depends on I2C
> +	select GPIOLIB

GPIOLIB API is working perfectly fine even if GPIOLIB is not selected
and gpiod_* functions will merely return -ENOSYS in this case.
Please see <linux/gpio/consumer.h> and fix your patch accordingly.

>  config SND_SOC_TAS5086
>  	tristate "Texas Instruments TAS5086 speaker amplifier"
> -- 
> 2.7.4
> 
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
