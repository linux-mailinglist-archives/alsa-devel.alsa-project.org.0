Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3405CFF09
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 18:37:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30A8F86E;
	Tue,  8 Oct 2019 18:36:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30A8F86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570552622;
	bh=yKATf/zI6kpKPeYqrxgQPr4gB1vuNipPbIGJ8OhDUkw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NCCDw9OJcBQLQRwmq7wcIXskOOe+bN6aIe2N9Ae2uR7f8pmmFGd1NIGeSBCpV9uKj
	 f0pjQXDO5cssaJDaprxu0jDBSoubSdW+Rhg49HpHt/SNwDKFIQXEQfnH498IwTgohy
	 979E68CppiCXjsbvZ2spKaBZdewp0qgOLQU9GcOY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A939F8045E;
	Tue,  8 Oct 2019 18:35:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36014F8038F; Tue,  8 Oct 2019 18:35:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cvs.linux-mips.org (eddie.linux-mips.org [148.251.95.138])
 by alsa1.perex.cz (Postfix) with ESMTP id A375DF80113
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 18:35:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A375DF80113
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
 (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
 id S23991911AbfJHQfJd4fX3 (ORCPT
 <rfc822;alsa-devel@alsa-project.org>); Tue, 8 Oct 2019 18:35:09 +0200
Date: Tue, 8 Oct 2019 18:35:08 +0200
From: Ladislav Michl <ladis@linux-mips.org>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20191008163508.GA16283@lenoch>
References: <20191006104631.60608-1-yuehaibing@huawei.com>
 <20191007130309.EAEBE2741EF0@ypsilon.sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191007130309.EAEBE2741EF0@ypsilon.sirena.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
 piotrs@opensource.cirrus.com, YueHaibing <yuehaibing@huawei.com>,
 m.felsch@pengutronix.de, linux-kernel@vger.kernel.org, paul@crapouillou.net,
 Hulk Robot <hulkci@huawei.com>, srinivas.kandagatla@linaro.org,
 andradanciu1997@gmail.com, enric.balletbo@collabora.com,
 shifu0704@thundersoft.com, tiwai@suse.com, mirq-linux@rere.qmqm.pl,
 rf@opensource.wolfsonmicro.com
Subject: Re: [alsa-devel] Applied "ASoc: tas2770: Fix build error without
 GPIOLIB" to the asoc tree
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

Hi YueHaibing & Mark,

On Mon, Oct 07, 2019 at 02:03:09PM +0100, Mark Brown wrote:
> The patch
> 
>    ASoc: tas2770: Fix build error without GPIOLIB
> 
> has been applied to the asoc tree at
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

Hmm, too late it seems...
Patch should actually remove <linux/gpio.h> as this is legacy one (see comment
on the top and also Documentation/driver-api/gpio/consumer.rst)

And that brings a question. Given this is -next only is it actually possible
to squash fixes into 1a476abc723e ("tas2770: add tas2770 smart PA kernel driver")
just to make bisect a bit more happy?

	l.

> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.  
> 
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
> 
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
> 
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
> 
> Thanks,
> Mark
> 
> >From 03fe492e8346d3da59b6eb7ea306d46ebf22e9d5 Mon Sep 17 00:00:00 2001
> From: YueHaibing <yuehaibing@huawei.com>
> Date: Sun, 6 Oct 2019 18:46:31 +0800
> Subject: [PATCH] ASoc: tas2770: Fix build error without GPIOLIB
> 
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
> Suggested-by: Ladislav Michl <ladis@linux-mips.org>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> Link: https://lore.kernel.org/r/20191006104631.60608-1-yuehaibing@huawei.com
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  sound/soc/codecs/tas2770.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
> index dbbb21fe0548..15f6fcc6d87e 100644
> --- a/sound/soc/codecs/tas2770.c
> +++ b/sound/soc/codecs/tas2770.c
> @@ -15,6 +15,7 @@
>  #include <linux/pm.h>
>  #include <linux/i2c.h>
>  #include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/firmware.h>
> -- 
> 2.20.1
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
