Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD71CD2EC
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Oct 2019 17:33:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37C741661;
	Sun,  6 Oct 2019 17:33:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37C741661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570376036;
	bh=KMixCoo/r1uXmGScdNkmHrrR8tBXMLktHSveUwn+nU4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tbf7D36VFQrSmmaV7nK2CZAKYX+QW3v0C5nM2xXiUa/OV7+Zpu5YrhbZ57GzqIVlJ
	 itL05+1xnX7+64si1nkEItFgLODojlfQ8Ov817GapNIzbyPp7mMJIo1iKuj0eYkQKH
	 O7+xBd0ODIt7tRsLrl2sQ9ok+tcQcG2DtmGKM3AI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83953F8038F;
	Sun,  6 Oct 2019 17:32:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2620AF8038F; Sun,  6 Oct 2019 17:32:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F07D4F80308
 for <alsa-devel@alsa-project.org>; Sun,  6 Oct 2019 17:32:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F07D4F80308
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl
 header.b="mhOoTq3x"
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 46mSGf3048z4p;
 Sun,  6 Oct 2019 17:30:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1570375806; bh=gGVpWXK4iH8c96Sf0pNYq0Jcb/h2p6O0QCA4k6ZIcko=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mhOoTq3xIXpWE/BsUeYXIYA/6A3LtWCsoA++ru0/dvV+bWcrvjYkrbQVfj7TD+JOv
 tdQT9OmGNubwR+1gti4hT/7zx0jnny5tqQnHBL1RSOnIP1wmrg/mrRqutjSHb78Ww+
 a/UiYvR31pnMvb2kv7ufbdxFxPq47zpZIzbG3/CrNFiyMxF4Lk0s+BnWNkQlZXUkKt
 HVGdLttY6UbYkoseX+HbC/AUT44b30RsGyKQYjElIBkkR868Jfi4QB2XqztE3L4NMO
 LUm/xe228Eld5UgTpMAn4nczOoqnKOV1pxfh/0n5ZFcnX/pspP9fHz9S+uKbeiSMfR
 IoGF/7IKIwUnw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at mail
Date: Sun, 6 Oct 2019 17:31:58 +0200
From: mirq-linux@rere.qmqm.pl
To: YueHaibing <yuehaibing@huawei.com>
Message-ID: <20191006153158.GA9882@qmqm.qmqm.pl>
References: <20191006072241.56808-1-yuehaibing@huawei.com>
 <20191006104631.60608-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191006104631.60608-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: m.felsch@pengutronix.de, andradanciu1997@gmail.com, ladis@linux-mips.org,
 ckeepax@opensource.cirrus.com, kuninori.morimoto.gx@renesas.com,
 linux-kernel@vger.kernel.org, piotrs@opensource.cirrus.com, tiwai@suse.com,
 lgirdwood@gmail.com, paul@crapouillou.net, alsa-devel@alsa-project.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org,
 enric.balletbo@collabora.com, shifu0704@thundersoft.com,
 rf@opensource.wolfsonmicro.com
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

On Sun, Oct 06, 2019 at 06:46:31PM +0800, YueHaibing wrote:
> If GPIOLIB is not set, building fails:
> =

> sound/soc/codecs/tas2770.c: In function tas2770_reset:
> sound/soc/codecs/tas2770.c:38:3: error: implicit declaration of function =
gpiod_set_value_cansleep; did you mean gpio_set_value_cansleep? [-Werror=3D=
implicit-function-declaration]
>    gpiod_set_value_cansleep(tas2770->reset_gpio, 0);
>    ^~~~~~~~~~~~~~~~~~~~~~~~
>    gpio_set_value_cansleep
> sound/soc/codecs/tas2770.c: In function tas2770_i2c_probe:
> sound/soc/codecs/tas2770.c:749:24: error: implicit declaration of functio=
n devm_gpiod_get_optional; did you mean devm_regulator_get_optional? [-Werr=
or=3Dimplicit-function-declaration]
>   tas2770->reset_gpio =3D devm_gpiod_get_optional(tas2770->dev,
>                         ^~~~~~~~~~~~~~~~~~~~~~~
>                         devm_regulator_get_optional
> sound/soc/codecs/tas2770.c:751:13: error: GPIOD_OUT_HIGH undeclared (firs=
t use in this function); did you mean GPIOF_INIT_HIGH?
>              GPIOD_OUT_HIGH);
>              ^~~~~~~~~~~~~~
>              GPIOF_INIT_HIGH
> =

> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: 1a476abc723e ("tas2770: add tas2770 smart PA kernel driver")
> Suggested-by: Ladislav Michl <ladis@linux-mips.org>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
> v2: Add missing include file
> ---
>  sound/soc/codecs/tas2770.c | 1 +
>  1 file changed, 1 insertion(+)
> =

> diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
> index 9da88cc..a36d0d7 100644
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

The Kconfig part is missing - is this intended? If I guess correctly,
the driver won't work without GPIOLIB, so it should either
'select GPIOLIB' or 'depends on GPIOLIB || COMPILE_TEST' or even
'select GPIOLIB if !COMPILE_TEST'.

Best Regards,
Micha=B3 Miros=B3aw
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
