Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3333DCD8D4
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Oct 2019 21:14:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C3661661;
	Sun,  6 Oct 2019 21:13:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C3661661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570389272;
	bh=5MWjQpLuNFGN7yY5Vya2IOVaIyJcK9ntlMSMAt3YAZg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nc1Wy2BeE7En0VkIk+NyM7Uv6ZU5Te7BXxETHwR9fkfkKfAmzZGFyyenO9XO05wLm
	 gcFC2A8k2SAxLufnWoBLyZrd2BCqCaGZwn/SIZK+3AHgc+wHv5DMgR/x6JeHRCw7U7
	 lbKe8SbkxvQ2laqPmdyOgWu8ZM5eLAyyQg5ebe/o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C352FF8038F;
	Sun,  6 Oct 2019 21:12:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A8EBF8038F; Sun,  6 Oct 2019 21:12:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=KHOP_HELO_FCRDNS, PRX_BODY_30, 
 SPF_HELO_NONE, SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from cvs.linux-mips.org (eddie.linux-mips.org [148.251.95.138])
 by alsa1.perex.cz (Postfix) with ESMTP id 916FAF80308
 for <alsa-devel@alsa-project.org>; Sun,  6 Oct 2019 21:12:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 916FAF80308
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
 (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
 id S23990429AbfJFTMibd0Fl (ORCPT
 <rfc822;alsa-devel@alsa-project.org>); Sun, 6 Oct 2019 21:12:38 +0200
Date: Sun, 6 Oct 2019 21:12:37 +0200
From: Ladislav Michl <ladis@linux-mips.org>
To: mirq-linux@rere.qmqm.pl
Message-ID: <20191006191237.GA6543@lenoch>
References: <20191006072241.56808-1-yuehaibing@huawei.com>
 <20191006104631.60608-1-yuehaibing@huawei.com>
 <20191006153158.GA9882@qmqm.qmqm.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191006153158.GA9882@qmqm.qmqm.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: m.felsch@pengutronix.de, andradanciu1997@gmail.com,
 ckeepax@opensource.cirrus.com, kuninori.morimoto.gx@renesas.com,
 linux-kernel@vger.kernel.org, piotrs@opensource.cirrus.com,
 YueHaibing <yuehaibing@huawei.com>, tiwai@suse.com, lgirdwood@gmail.com,
 paul@crapouillou.net, alsa-devel@alsa-project.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, enric.balletbo@collabora.com,
 shifu0704@thundersoft.com, rf@opensource.wolfsonmicro.com
Subject: Re: [alsa-devel] [PATCH v2 -next] ASoc: tas2770: Fix build error
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Micha=B3,

On Sun, Oct 06, 2019 at 05:31:58PM +0200, mirq-linux@rere.qmqm.pl wrote:
> On Sun, Oct 06, 2019 at 06:46:31PM +0800, YueHaibing wrote:
> > If GPIOLIB is not set, building fails:
> > =

> > sound/soc/codecs/tas2770.c: In function tas2770_reset:
> > sound/soc/codecs/tas2770.c:38:3: error: implicit declaration of functio=
n gpiod_set_value_cansleep; did you mean gpio_set_value_cansleep? [-Werror=
=3Dimplicit-function-declaration]
> >    gpiod_set_value_cansleep(tas2770->reset_gpio, 0);
> >    ^~~~~~~~~~~~~~~~~~~~~~~~
> >    gpio_set_value_cansleep
> > sound/soc/codecs/tas2770.c: In function tas2770_i2c_probe:
> > sound/soc/codecs/tas2770.c:749:24: error: implicit declaration of funct=
ion devm_gpiod_get_optional; did you mean devm_regulator_get_optional? [-We=
rror=3Dimplicit-function-declaration]
> >   tas2770->reset_gpio =3D devm_gpiod_get_optional(tas2770->dev,
> >                         ^~~~~~~~~~~~~~~~~~~~~~~
> >                         devm_regulator_get_optional
> > sound/soc/codecs/tas2770.c:751:13: error: GPIOD_OUT_HIGH undeclared (fi=
rst use in this function); did you mean GPIOF_INIT_HIGH?
> >              GPIOD_OUT_HIGH);
> >              ^~~~~~~~~~~~~~
> >              GPIOF_INIT_HIGH
> > =

> > Reported-by: Hulk Robot <hulkci@huawei.com>
> > Fixes: 1a476abc723e ("tas2770: add tas2770 smart PA kernel driver")
> > Suggested-by: Ladislav Michl <ladis@linux-mips.org>
> > Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> > ---
> > v2: Add missing include file
> > ---
> >  sound/soc/codecs/tas2770.c | 1 +
> >  1 file changed, 1 insertion(+)
> > =

> > diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
> > index 9da88cc..a36d0d7 100644
> > --- a/sound/soc/codecs/tas2770.c
> > +++ b/sound/soc/codecs/tas2770.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/pm.h>
> >  #include <linux/i2c.h>
> >  #include <linux/gpio.h>
> > +#include <linux/gpio/consumer.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/regulator/consumer.h>
> >  #include <linux/firmware.h>
> =

> The Kconfig part is missing - is this intended? If I guess correctly,
> the driver won't work without GPIOLIB, so it should either
> 'select GPIOLIB' or 'depends on GPIOLIB || COMPILE_TEST' or even
> 'select GPIOLIB if !COMPILE_TEST'.

while the first one is actually preferable I won't do this in this patch,
but rather generally. The same you can say about regulator, regmap and
other interfaces, so perhaps leaving that to patchset focusing on this
kind of problem seem to be better.

Btw, I guess linux/gpio/consumer.h is enough for this driver and including
linux/gpio.h should be dropped.

	ladis

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
