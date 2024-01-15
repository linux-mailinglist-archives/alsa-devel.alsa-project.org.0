Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BDC82DB9B
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jan 2024 15:46:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBB5474C;
	Mon, 15 Jan 2024 15:45:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBB5474C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705329964;
	bh=3ZAgxTvYLT4p/6Jfdg/hH3P2UEIL7sapOq315p64icA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i7LAVBOvwG+Zn1FuS6jdAcs5EpjTmi+v+jWTbBCbijPAhRj06ea5TpmDPbkw5JeTc
	 Pehfd/xJ8IPlPUlgjdCQ1g8JS5w2cmiBdqFlRHWSYLvDtHqXRKXvzih9dU3olyiblk
	 n8XhVoCQgQsTV7j85g9f90oVliJ2IGfRtzutG07g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DDBDF80589; Mon, 15 Jan 2024 15:45:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21BDFF8057C;
	Mon, 15 Jan 2024 15:45:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B8BEF801F5; Mon, 15 Jan 2024 15:45:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F1CD1F8003A
	for <alsa-devel@alsa-project.org>; Mon, 15 Jan 2024 15:45:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1CD1F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bgdev-pl.20230601.gappssmtp.com
 header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=AqXXd4cJ
Received: by mail-vs1-xe2a.google.com with SMTP id
 ada2fe7eead31-466fb179334so1751916137.1
        for <alsa-devel@alsa-project.org>;
 Mon, 15 Jan 2024 06:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705329908;
 x=1705934708; darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuVawFO9EzN+TBa58xh+36pumfMhcFBvr33I0w01EEI=;
        b=AqXXd4cJhiolWDsbheCcCc33UK8niLX9WC4w6m1xwDaD1jWe15O0+gxzjGsEDUI2yP
         h8lxZuMt4t9UI/0EdDIXOBauBehOlXOowjqy0vUiHELUr0hBC+TvcTMEqe6Q3sHzMOXz
         tFOI0jUhoVF5FzgXi7aeKLqfG9A3w3Lsaa38M3tP4tb+ubirGEdnZJWrzYnJVbv53Y7A
         jAFr1D4VHEItaoFCw4j9hpyvcntI2WEWmMGsSpG8yQ19HbrF01ymhqqvuDH2UI6gBVxr
         Bjw/jPkhNBmOeDcLVxkeHns9ZvZS6VdoHwTOJ82PVTiHlk1d4IyLmCeh6ERiPB5Y5bWZ
         K9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705329908; x=1705934708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SuVawFO9EzN+TBa58xh+36pumfMhcFBvr33I0w01EEI=;
        b=iivp+MWvDSfJ28Dvg8utGyDQ8zllrk7UoF183AzZjxVVh8eiGV9sF14MtsDj9S1wnk
         PrZPV1soR+4GwxK2gaZnG5P56zLMolPrYf06OL1aCxSDrF+NqViG/FQUXU6aA1WFuQRO
         TK6Um+s1Y49BXSFZC9yac1plSZcRJnkOBqqWkgG1/Cjw3R0xgQRZhr31AFj/+xsBlmIi
         Q8kZ+eK8a1e3zEIFfYZ2h2yHzqBQQW3fMyuu8GvG6jFuhfMBEB4AMDVWEmSNtXSu30k9
         Q/H44kyZjHlkeOQsbO3HqBudIgLEGwq6GjE9K5PZc3ZoA1F9+eC489tctDHbmcCwvD/k
         K47w==
X-Gm-Message-State: AOJu0YzKGiepvsTka3tFtUMEpirzcvmMh0bs6qOH7DJs3RFYUuYUgDOl
	vffQc9nK004K3gcC3VrubDCFkDkqWTkw+zxYHRg66Qrp3MoRGw==
X-Google-Smtp-Source: 
 AGHT+IGJDE4lOs0qLyW3K5JCXA+QxakNz3/fiIWWEpBYwSLgeMEoaJ+IBgFXwjixVSu78D7RMDJHh5Ff34cMI8dnNE0=
X-Received: by 2002:a67:ed0e:0:b0:467:ac23:3ca2 with SMTP id
 l14-20020a67ed0e000000b00467ac233ca2mr3160044vsp.8.1705329906237; Mon, 15 Jan
 2024 06:45:06 -0800 (PST)
MIME-Version: 1.0
References: <20240112163608.528453-1-krzysztof.kozlowski@linaro.org>
 <20240112163608.528453-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240112163608.528453-2-krzysztof.kozlowski@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 15 Jan 2024 15:44:55 +0100
Message-ID: 
 <CAMRc=Me6q9Qc_vDMraCrNf6FhZP_KH_WkByQdZ-0Q9KxD2o-zA@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] reset: gpio: Add GPIO-based reset controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Peter Rosin <peda@axentia.se>, Philipp Zabel <p.zabel@pengutronix.de>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Sean Anderson <sean.anderson@seco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: RZC6AWS6YOQ5LTK2QENY7HKOGAIE373G
X-Message-ID-Hash: RZC6AWS6YOQ5LTK2QENY7HKOGAIE373G
X-MailFrom: brgl@bgdev.pl
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RZC6AWS6YOQ5LTK2QENY7HKOGAIE373G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jan 12, 2024 at 5:36=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Add a simple driver to control GPIO-based resets using the reset
> controller API for the cases when the GPIOs are shared and reset should
> be coordinated.  The driver is expected to be used by reset core
> framework for ad-hoc reset controllers.
>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: Sean Anderson <sean.anderson@seco.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  MAINTAINERS                |   5 ++
>  drivers/reset/Kconfig      |   9 +++
>  drivers/reset/Makefile     |   1 +
>  drivers/reset/reset-gpio.c | 121 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 136 insertions(+)
>  create mode 100644 drivers/reset/reset-gpio.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7fe27cd60e1b..a0fbd4814bc7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8866,6 +8866,11 @@ F:       Documentation/i2c/muxes/i2c-mux-gpio.rst
>  F:     drivers/i2c/muxes/i2c-mux-gpio.c
>  F:     include/linux/platform_data/i2c-mux-gpio.h
>
> +GENERIC GPIO RESET DRIVER
> +M:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> +S:     Maintained
> +F:     drivers/reset/reset-gpio.c
> +
>  GENERIC HDLC (WAN) DRIVERS
>  M:     Krzysztof Halasa <khc@pm.waw.pl>
>  S:     Maintained
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index ccd59ddd7610..bb1b5a326eb7 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -66,6 +66,15 @@ config RESET_BRCMSTB_RESCAL
>           This enables the RESCAL reset controller for SATA, PCIe0, or PC=
Ie1 on
>           BCM7216.
>
> +config RESET_GPIO
> +       tristate "GPIO reset controller"
> +       help
> +         This enables a generic reset controller for resets attached via
> +         GPIOs.  Typically for OF platforms this driver expects "reset-g=
pios"
> +         property.
> +
> +         If compiled as module, it will be called reset-gpio.
> +
>  config RESET_HSDK
>         bool "Synopsys HSDK Reset Driver"
>         depends on HAS_IOMEM
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 8270da8a4baa..fd8b49fa46fc 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -11,6 +11,7 @@ obj-$(CONFIG_RESET_BCM6345) +=3D reset-bcm6345.o
>  obj-$(CONFIG_RESET_BERLIN) +=3D reset-berlin.o
>  obj-$(CONFIG_RESET_BRCMSTB) +=3D reset-brcmstb.o
>  obj-$(CONFIG_RESET_BRCMSTB_RESCAL) +=3D reset-brcmstb-rescal.o
> +obj-$(CONFIG_RESET_GPIO) +=3D reset-gpio.o
>  obj-$(CONFIG_RESET_HSDK) +=3D reset-hsdk.o
>  obj-$(CONFIG_RESET_IMX7) +=3D reset-imx7.o
>  obj-$(CONFIG_RESET_INTEL_GW) +=3D reset-intel-gw.o
> diff --git a/drivers/reset/reset-gpio.c b/drivers/reset/reset-gpio.c
> new file mode 100644
> index 000000000000..0fe482740f1b
> --- /dev/null
> +++ b/drivers/reset/reset-gpio.c
> @@ -0,0 +1,121 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/gpio/consumer.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
> +
> +struct reset_gpio_priv {
> +       struct reset_controller_dev rc;
> +       struct gpio_desc *reset;
> +};
> +
> +static inline struct reset_gpio_priv
> +*rc_to_reset_gpio(struct reset_controller_dev *rc)
> +{
> +       return container_of(rc, struct reset_gpio_priv, rc);
> +}
> +
> +static int reset_gpio_assert(struct reset_controller_dev *rc, unsigned l=
ong id)
> +{
> +       struct reset_gpio_priv *priv =3D rc_to_reset_gpio(rc);
> +
> +       gpiod_set_value_cansleep(priv->reset, 1);
> +
> +       return 0;
> +}
> +
> +static int reset_gpio_deassert(struct reset_controller_dev *rc,
> +                              unsigned long id)
> +{
> +       struct reset_gpio_priv *priv =3D rc_to_reset_gpio(rc);
> +
> +       gpiod_set_value_cansleep(priv->reset, 0);
> +
> +       return 0;
> +}
> +
> +static int reset_gpio_status(struct reset_controller_dev *rc, unsigned l=
ong id)
> +{
> +       struct reset_gpio_priv *priv =3D rc_to_reset_gpio(rc);
> +
> +       return gpiod_get_value_cansleep(priv->reset);
> +}
> +
> +static const struct reset_control_ops reset_gpio_ops =3D {
> +       .assert =3D reset_gpio_assert,
> +       .deassert =3D reset_gpio_deassert,
> +       .status =3D reset_gpio_status,
> +};
> +
> +static int reset_gpio_of_xlate(struct reset_controller_dev *rcdev,
> +                              const struct of_phandle_args *reset_spec)
> +{
> +       return reset_spec->args[0];
> +}
> +
> +static void reset_gpio_of_node_put(void *data)
> +{
> +       of_node_put(data);
> +}
> +
> +static int reset_gpio_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct of_phandle_args *platdata =3D dev_get_platdata(dev);
> +       struct reset_gpio_priv *priv;
> +       int ret;
> +
> +       if (!platdata)
> +               return -EINVAL;
> +
> +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       platform_set_drvdata(pdev, &priv->rc);
> +
> +       /* Relies on GPIO_LOOKUP */

That doesn't mean anything. The GPIO abstraction is there to hide
*how* the GPIO is assigned to the device. This relies on regular GPIO
infrastructure common to all drivers. If at some point this gets an OF
compatible or is instantiated from ACPI or otherwise, the same code
will still work and not rely on "GPIO_LOOKUP").

> +       priv->reset =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +       if (IS_ERR(priv->reset))
> +               return dev_err_probe(dev, PTR_ERR(priv->reset),
> +                                    "Could not get reset gpios\n");
> +
> +       priv->rc.ops =3D &reset_gpio_ops;
> +       priv->rc.owner =3D THIS_MODULE;
> +       priv->rc.dev =3D dev;
> +       priv->rc.of_args =3D platdata;
> +       priv->rc.of_node =3D of_node_get(platdata->np);
> +       ret =3D devm_add_action_or_reset(dev, reset_gpio_of_node_put,
> +                                      priv->rc.of_node);
> +       if (ret)
> +               return ret;
> +
> +       /* Cells to match GPIO specifier, but it's not really used */
> +       priv->rc.of_reset_n_cells =3D 2;
> +       priv->rc.of_xlate =3D reset_gpio_of_xlate;
> +       priv->rc.nr_resets =3D 1;
> +
> +       return devm_reset_controller_register(dev, &priv->rc);
> +}
> +
> +static const struct platform_device_id reset_gpio_ids[] =3D {
> +       { .name =3D "reset-gpio", },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(platform, reset_gpio_ids);
> +
> +static struct platform_driver reset_gpio_driver =3D {
> +       .probe          =3D reset_gpio_probe,
> +       .id_table       =3D reset_gpio_ids,
> +       .driver =3D {
> +               .name =3D "reset-gpio",
> +       },
> +};
> +module_platform_driver(reset_gpio_driver);
> +
> +MODULE_AUTHOR("Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>");
> +MODULE_DESCRIPTION("Generic GPIO reset driver");
> +MODULE_LICENSE("GPL");
> --
> 2.34.1
>

With the above dropped:

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
