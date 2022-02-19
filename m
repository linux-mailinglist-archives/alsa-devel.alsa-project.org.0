Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C2E4BC4FB
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Feb 2022 03:43:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C67516B0;
	Sat, 19 Feb 2022 03:42:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C67516B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645238597;
	bh=fReTITXfTzGCs4ja1z3LoU5s4Y9MQVo5Co4tBaZbaok=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ljv2YG5LRCjk1dQMbJ7Kq8KVqYQ24wXdYLuCxwiNBMYQfdxEeRn8e387fBx6BGbFa
	 CeiTMPNtD/UlFOvn5KrWA1hMCPC/vCSJ/SHUZG0brIx8FL+hobcd6hgJcJW0uqarbz
	 CYOZVdSJPnGfNaXvPwMp+bRGN1nKIBFk2pz8oj00=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CE3DF800AB;
	Sat, 19 Feb 2022 03:42:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74EF6F800AB; Sat, 19 Feb 2022 03:42:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9D87F800EB
 for <alsa-devel@alsa-project.org>; Sat, 19 Feb 2022 03:42:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9D87F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="lq9SttMK"
Received: by mail-oi1-x229.google.com with SMTP id k2so1310921oia.2
 for <alsa-devel@alsa-project.org>; Fri, 18 Feb 2022 18:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=BYr579noUa+v/EevgyiiBpBGftY8I6NvFfFqbmvgVPg=;
 b=lq9SttMKTQi+OIqSysXHp4QDH87Z08F6PT4TArsjISf7YMLs5kXrWPGh6XOqzyjSAI
 BpMR4Gu5f4F1u0h8pqZeEraTCyZVvdeCRrSdCgsdZS7zCu/jiJj9ue7Hx+hBSiYLyx0o
 zITutlI6jDwh9NeQ/FELd2/4y3YrobCg/v4ME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=BYr579noUa+v/EevgyiiBpBGftY8I6NvFfFqbmvgVPg=;
 b=HiyfK1x7J4kJdhLHuIWFXz0DLr+TFy6orDZAwGhCq75Pxhvhss82AQzXD0p4mGjd6d
 j6Ld2tDb3yY7zyBo1VQrLfWgTapEKxCDnujZO0kFymQZYDJilF/rVWHTUz+yKGwIdshn
 M+ImJHk4zZ1O6y9npQaEpOHW1vLEIPsK9UzP6I14yXiJQsSUq4ziyT2pS+sM8Ctv2Kri
 4pYdCTYLPZcANAp6ftDrG5eaQtd74SVNIlLp7Za6I0MB8AgerDaTH2hamRcljf/KekNJ
 KqDaI8nyWXopoJR8+aXd71+trp3DpqBbYmLKSm44jYhzOXFode6Y3QN8n1wnF7G6V9wv
 IQXg==
X-Gm-Message-State: AOAM532AtHgprBSboFapZ/ywBX3EMQfma1RKCRoi2tmFafQ4o/wlL9LF
 cF0Bgm2uK7bZaZ8yCW597h5Zp3AEvlwk5A/Ep/baWg==
X-Google-Smtp-Source: ABdhPJz3wTFfUooHNMBgbpJtCGjVTLtMQgGIzsDLA791qi/BpaTBHKMpt7dJlMBa3SAb6cuIZN0tB2/QvLkzyyKlH78=
X-Received: by 2002:a05:6808:f88:b0:2d4:c8c2:b898 with SMTP id
 o8-20020a0568080f8800b002d4c8c2b898mr603490oiw.112.1645238520857; Fri, 18 Feb
 2022 18:42:00 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Feb 2022 18:42:00 -0800
MIME-Version: 1.0
In-Reply-To: <1644851994-22732-6-git-send-email-quic_srivasam@quicinc.com>
References: <1644851994-22732-1-git-send-email-quic_srivasam@quicinc.com>
 <1644851994-22732-6-git-send-email-quic_srivasam@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 18 Feb 2022 18:42:00 -0800
Message-ID: <CAE-0n521g=RMetskRmiz-QxTJWaewYxDSJ6UtvZuYDM5Hq-sHQ@mail.gmail.com>
Subject: Re: [PATCH v6 5/7] pinctrl: qcom: Extract chip specific LPASS LPI code
To: Linus Walleij <linus.walleij@linaro.org>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org,
 alsa-devel@alsa-project.org, 
 bgoswami@codeaurora.org, bjorn.andersson@linaro.org, broonie@kernel.org, 
 devicetree@vger.kernel.org, judyhsiao@chromium.org, lgirdwood@gmail.com, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, perex@perex.cz, quic_plai@quicinc.com, 
 robh+dt@kernel.org, rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org, 
 tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>
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

Quoting Srinivasa Rao Mandadapu (2022-02-14 07:19:52)
> diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
> index ca6f68a..8871451 100644
> --- a/drivers/pinctrl/qcom/Kconfig
> +++ b/drivers/pinctrl/qcom/Kconfig
> @@ -357,4 +357,12 @@ config PINCTRL_LPASS_LPI
>           Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
>           (Low Power Island) found on the Qualcomm Technologies Inc SoCs.
>
> +config PINCTRL_SM8250_LPASS_LPI

Can this be sorted somehow? On Kconfig? Adding to the end of the file
causes conflicts more often than adding alphabetically.

> +       tristate "Qualcomm Technologies Inc SM8250 LPASS LPI pin controller driver"
> +       depends on PINCTRL_LPASS_LPI
> +       help
> +         This is the pinctrl, pinmux, pinconf and gpiolib driver for the
> +         Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
> +         (Low Power Island) found on the Qualcomm Technologies Inc SM8250 platform.
> +
>  endif
> diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
> index 709882f..c10d14d2 100644
> --- a/drivers/pinctrl/qcom/Makefile
> +++ b/drivers/pinctrl/qcom/Makefile
> @@ -41,3 +41,4 @@ obj-$(CONFIG_PINCTRL_SM8250) += pinctrl-sm8250.o
>  obj-$(CONFIG_PINCTRL_SM8350) += pinctrl-sm8350.o
>  obj-$(CONFIG_PINCTRL_SM8450) += pinctrl-sm8450.o
>  obj-$(CONFIG_PINCTRL_LPASS_LPI) += pinctrl-lpass-lpi.o
> +obj-$(CONFIG_PINCTRL_SM8250_LPASS_LPI) += pinctrl-sm8250-lpass-lpi.o

Can this be sorted somehow? Either on Kconfig or file name?

> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> index 54750ba..8a82fd9 100644
> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> @@ -4,91 +4,15 @@
>   * Copyright (c) 2020 Linaro Ltd.
>   */
>
> -#include <linux/bitops.h>
> -#include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/gpio/driver.h>
> -#include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> -#include <linux/of.h>
>  #include <linux/pinctrl/pinconf-generic.h>
>  #include <linux/pinctrl/pinconf.h>
>  #include <linux/pinctrl/pinmux.h>
> -#include <linux/platform_device.h>
> -#include <linux/slab.h>
> -#include <linux/types.h>
> -#include "../core.h"
>  #include "../pinctrl-utils.h"
> -
> -#define LPI_SLEW_RATE_CTL_REG          0xa000
> -#define LPI_TLMM_REG_OFFSET            0x1000
> -#define LPI_SLEW_RATE_MAX              0x03
> -#define LPI_SLEW_BITS_SIZE             0x02
> -#define LPI_SLEW_RATE_MASK             GENMASK(1, 0)
> -#define LPI_GPIO_CFG_REG               0x00
> -#define LPI_GPIO_PULL_MASK             GENMASK(1, 0)
> -#define LPI_GPIO_FUNCTION_MASK         GENMASK(5, 2)
> -#define LPI_GPIO_OUT_STRENGTH_MASK     GENMASK(8, 6)
> -#define LPI_GPIO_OE_MASK               BIT(9)
> -#define LPI_GPIO_VALUE_REG             0x04
> -#define LPI_GPIO_VALUE_IN_MASK         BIT(0)
> -#define LPI_GPIO_VALUE_OUT_MASK                BIT(1)
> -
> -#define LPI_GPIO_BIAS_DISABLE          0x0
> -#define LPI_GPIO_PULL_DOWN             0x1
> -#define LPI_GPIO_KEEPER                        0x2
> -#define LPI_GPIO_PULL_UP               0x3
> -#define LPI_GPIO_DS_TO_VAL(v)          (v / 2 - 1)
> -#define LPI_NO_SLEW                            -1
> -
> -#define LPI_FUNCTION(fname)                                    \
> -       [LPI_MUX_##fname] = {                           \
> -               .name = #fname,                         \
> -               .groups = fname##_groups,               \
> -               .ngroups = ARRAY_SIZE(fname##_groups),  \
> -       }
> -
> -#define LPI_PINGROUP(id, soff, f1, f2, f3, f4)         \
> -       {                                               \
> -               .group.name = "gpio" #id,                       \
> -               .group.pins = gpio##id##_pins,          \
> -               .pin = id,                              \
> -               .slew_offset = soff,                    \
> -               .group.num_pins = ARRAY_SIZE(gpio##id##_pins),  \
> -               .funcs = (int[]){                       \
> -                       LPI_MUX_gpio,                   \
> -                       LPI_MUX_##f1,                   \
> -                       LPI_MUX_##f2,                   \
> -                       LPI_MUX_##f3,                   \
> -                       LPI_MUX_##f4,                   \
> -               },                                      \
> -               .nfuncs = 5,                            \
> -       }
> -
> -struct lpi_pingroup {
> -       struct group_desc group;
> -       unsigned int pin;
> -       /* Bit offset in slew register for SoundWire pins only */
> -       int slew_offset;
> -       unsigned int *funcs;
> -       unsigned int nfuncs;
> -};
> -
> -struct lpi_function {
> -       const char *name;
> -       const char * const *groups;
> -       unsigned int ngroups;
> -};
> -
> -struct lpi_pinctrl_variant_data {
> -       const struct pinctrl_pin_desc *pins;
> -       int npins;
> -       const struct lpi_pingroup *groups;
> -       int ngroups;
> -       const struct lpi_function *functions;
> -       int nfunctions;
> -};
> +#include "pinctrl-lpass-lpi.h"
>
>  #define MAX_LPI_NUM_CLKS       2
>
> @@ -104,136 +28,6 @@ struct lpi_pinctrl {
>         const struct lpi_pinctrl_variant_data *data;
>  };
>
> -/* sm8250 variant specific data */
> -static const struct pinctrl_pin_desc sm8250_lpi_pins[] = {
> -       PINCTRL_PIN(0, "gpio0"),
> -       PINCTRL_PIN(1, "gpio1"),
> -       PINCTRL_PIN(2, "gpio2"),
> -       PINCTRL_PIN(3, "gpio3"),
> -       PINCTRL_PIN(4, "gpio4"),
> -       PINCTRL_PIN(5, "gpio5"),
> -       PINCTRL_PIN(6, "gpio6"),
> -       PINCTRL_PIN(7, "gpio7"),
> -       PINCTRL_PIN(8, "gpio8"),
> -       PINCTRL_PIN(9, "gpio9"),
> -       PINCTRL_PIN(10, "gpio10"),
> -       PINCTRL_PIN(11, "gpio11"),
> -       PINCTRL_PIN(12, "gpio12"),
> -       PINCTRL_PIN(13, "gpio13"),
> -};
> -
> -enum sm8250_lpi_functions {
> -       LPI_MUX_dmic1_clk,
> -       LPI_MUX_dmic1_data,
> -       LPI_MUX_dmic2_clk,
> -       LPI_MUX_dmic2_data,
> -       LPI_MUX_dmic3_clk,
> -       LPI_MUX_dmic3_data,
> -       LPI_MUX_i2s1_clk,
> -       LPI_MUX_i2s1_data,
> -       LPI_MUX_i2s1_ws,
> -       LPI_MUX_i2s2_clk,
> -       LPI_MUX_i2s2_data,
> -       LPI_MUX_i2s2_ws,
> -       LPI_MUX_qua_mi2s_data,
> -       LPI_MUX_qua_mi2s_sclk,
> -       LPI_MUX_qua_mi2s_ws,
> -       LPI_MUX_swr_rx_clk,
> -       LPI_MUX_swr_rx_data,
> -       LPI_MUX_swr_tx_clk,
> -       LPI_MUX_swr_tx_data,
> -       LPI_MUX_wsa_swr_clk,
> -       LPI_MUX_wsa_swr_data,
> -       LPI_MUX_gpio,
> -       LPI_MUX__,
> -};
> -
> -static int gpio0_pins[] = { 0 };
> -static int gpio1_pins[] = { 1 };
> -static int gpio2_pins[] = { 2 };
> -static int gpio3_pins[] = { 3 };
> -static int gpio4_pins[] = { 4 };
> -static int gpio5_pins[] = { 5 };
> -static int gpio6_pins[] = { 6 };
> -static int gpio7_pins[] = { 7 };
> -static int gpio8_pins[] = { 8 };
> -static int gpio9_pins[] = { 9 };
> -static int gpio10_pins[] = { 10 };
> -static int gpio11_pins[] = { 11 };
> -static int gpio12_pins[] = { 12 };
> -static int gpio13_pins[] = { 13 };
> -static const char * const swr_tx_clk_groups[] = { "gpio0" };
> -static const char * const swr_tx_data_groups[] = { "gpio1", "gpio2", "gpio5" };
> -static const char * const swr_rx_clk_groups[] = { "gpio3" };
> -static const char * const swr_rx_data_groups[] = { "gpio4", "gpio5" };
> -static const char * const dmic1_clk_groups[] = { "gpio6" };
> -static const char * const dmic1_data_groups[] = { "gpio7" };
> -static const char * const dmic2_clk_groups[] = { "gpio8" };
> -static const char * const dmic2_data_groups[] = { "gpio9" };
> -static const char * const i2s2_clk_groups[] = { "gpio10" };
> -static const char * const i2s2_ws_groups[] = { "gpio11" };
> -static const char * const dmic3_clk_groups[] = { "gpio12" };
> -static const char * const dmic3_data_groups[] = { "gpio13" };
> -static const char * const qua_mi2s_sclk_groups[] = { "gpio0" };
> -static const char * const qua_mi2s_ws_groups[] = { "gpio1" };
> -static const char * const qua_mi2s_data_groups[] = { "gpio2", "gpio3", "gpio4" };
> -static const char * const i2s1_clk_groups[] = { "gpio6" };
> -static const char * const i2s1_ws_groups[] = { "gpio7" };
> -static const char * const i2s1_data_groups[] = { "gpio8", "gpio9" };
> -static const char * const wsa_swr_clk_groups[] = { "gpio10" };
> -static const char * const wsa_swr_data_groups[] = { "gpio11" };
> -static const char * const i2s2_data_groups[] = { "gpio12", "gpio12" };
> -
> -static const struct lpi_pingroup sm8250_groups[] = {
> -       LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
> -       LPI_PINGROUP(1, 2, swr_tx_data, qua_mi2s_ws, _, _),
> -       LPI_PINGROUP(2, 4, swr_tx_data, qua_mi2s_data, _, _),
> -       LPI_PINGROUP(3, 8, swr_rx_clk, qua_mi2s_data, _, _),
> -       LPI_PINGROUP(4, 10, swr_rx_data, qua_mi2s_data, _, _),
> -       LPI_PINGROUP(5, 12, swr_tx_data, swr_rx_data, _, _),
> -       LPI_PINGROUP(6, LPI_NO_SLEW, dmic1_clk, i2s1_clk, _,  _),
> -       LPI_PINGROUP(7, LPI_NO_SLEW, dmic1_data, i2s1_ws, _, _),
> -       LPI_PINGROUP(8, LPI_NO_SLEW, dmic2_clk, i2s1_data, _, _),
> -       LPI_PINGROUP(9, LPI_NO_SLEW, dmic2_data, i2s1_data, _, _),
> -       LPI_PINGROUP(10, 16, i2s2_clk, wsa_swr_clk, _, _),
> -       LPI_PINGROUP(11, 18, i2s2_ws, wsa_swr_data, _, _),
> -       LPI_PINGROUP(12, LPI_NO_SLEW, dmic3_clk, i2s2_data, _, _),
> -       LPI_PINGROUP(13, LPI_NO_SLEW, dmic3_data, i2s2_data, _, _),
> -};
> -
> -static const struct lpi_function sm8250_functions[] = {
> -       LPI_FUNCTION(dmic1_clk),
> -       LPI_FUNCTION(dmic1_data),
> -       LPI_FUNCTION(dmic2_clk),
> -       LPI_FUNCTION(dmic2_data),
> -       LPI_FUNCTION(dmic3_clk),
> -       LPI_FUNCTION(dmic3_data),
> -       LPI_FUNCTION(i2s1_clk),
> -       LPI_FUNCTION(i2s1_data),
> -       LPI_FUNCTION(i2s1_ws),
> -       LPI_FUNCTION(i2s2_clk),
> -       LPI_FUNCTION(i2s2_data),
> -       LPI_FUNCTION(i2s2_ws),
> -       LPI_FUNCTION(qua_mi2s_data),
> -       LPI_FUNCTION(qua_mi2s_sclk),
> -       LPI_FUNCTION(qua_mi2s_ws),
> -       LPI_FUNCTION(swr_rx_clk),
> -       LPI_FUNCTION(swr_rx_data),
> -       LPI_FUNCTION(swr_tx_clk),
> -       LPI_FUNCTION(swr_tx_data),
> -       LPI_FUNCTION(wsa_swr_clk),
> -       LPI_FUNCTION(wsa_swr_data),
> -};
> -
> -static struct lpi_pinctrl_variant_data sm8250_lpi_data = {
> -       .pins = sm8250_lpi_pins,
> -       .npins = ARRAY_SIZE(sm8250_lpi_pins),
> -       .groups = sm8250_groups,
> -       .ngroups = ARRAY_SIZE(sm8250_groups),
> -       .functions = sm8250_functions,
> -       .nfunctions = ARRAY_SIZE(sm8250_functions),
> -};
> -
>  static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
>                          unsigned int addr)
>  {
> @@ -580,7 +374,7 @@ static const struct gpio_chip lpi_gpio_template = {
>         .dbg_show               = lpi_gpio_dbg_show,
>  };
>
> -static int lpi_pinctrl_probe(struct platform_device *pdev)
> +int lpi_pinctrl_probe(struct platform_device *pdev)
>  {
>         const struct lpi_pinctrl_variant_data *data;
>         struct device *dev = &pdev->dev;
> @@ -659,8 +453,9 @@ static int lpi_pinctrl_probe(struct platform_device *pdev)
>
>         return ret;
>  }
> +EXPORT_SYMBOL(lpi_pinctrl_probe);

EXPORT_SYMBOL_GPL?

>
> -static int lpi_pinctrl_remove(struct platform_device *pdev)
> +int lpi_pinctrl_remove(struct platform_device *pdev)
>  {
>         struct lpi_pinctrl *pctrl = platform_get_drvdata(pdev);
>
> @@ -669,25 +464,7 @@ static int lpi_pinctrl_remove(struct platform_device *pdev)
>
>         return 0;
>  }
> +EXPORT_SYMBOL(lpi_pinctrl_remove);

EXPORT_SYMBOL_GPL?

>
> -static const struct of_device_id lpi_pinctrl_of_match[] = {
> -       {
> -              .compatible = "qcom,sm8250-lpass-lpi-pinctrl",
> -              .data = &sm8250_lpi_data,
> -       },
> -       { }
> -};
> -MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
> new file mode 100644
> index 0000000..a511d72
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
> @@ -0,0 +1,86 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2016-2019, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2020 Linaro Ltd.
> + */
> +#ifndef __PINCTRL_LPASS_LPI_H__
> +#define __PINCTRL_LPASS_LPI_H__
> +
> +#include <linux/bitops.h>
> +#include <linux/bitfield.h>
> +#include "../core.h"
> +
> +#define LPI_SLEW_RATE_CTL_REG  0xa000
> +#define LPI_TLMM_REG_OFFSET            0x1000
> +#define LPI_SLEW_RATE_MAX              0x03
> +#define LPI_SLEW_BITS_SIZE             0x02
> +#define LPI_SLEW_RATE_MASK             GENMASK(1, 0)
> +#define LPI_GPIO_CFG_REG               0x00
> +#define LPI_GPIO_PULL_MASK             GENMASK(1, 0)
> +#define LPI_GPIO_FUNCTION_MASK         GENMASK(5, 2)
> +#define LPI_GPIO_OUT_STRENGTH_MASK     GENMASK(8, 6)
> +#define LPI_GPIO_OE_MASK               BIT(9)
> +#define LPI_GPIO_VALUE_REG             0x04
> +#define LPI_GPIO_VALUE_IN_MASK         BIT(0)
> +#define LPI_GPIO_VALUE_OUT_MASK                BIT(1)
> +
> +#define LPI_GPIO_BIAS_DISABLE          0x0
> +#define LPI_GPIO_PULL_DOWN             0x1
> +#define LPI_GPIO_KEEPER                        0x2
> +#define LPI_GPIO_PULL_UP               0x3
> +#define LPI_GPIO_DS_TO_VAL(v)          (v / 2 - 1)
> +#define LPI_NO_SLEW                            -1
> +
> +#define LPI_FUNCTION(fname)                                    \
> +       [LPI_MUX_##fname] = {                           \
> +               .name = #fname,                         \
> +               .groups = fname##_groups,               \
> +               .ngroups = ARRAY_SIZE(fname##_groups),  \
> +       }
> +
> +#define LPI_PINGROUP(id, soff, f1, f2, f3, f4)         \
> +       {                                               \
> +               .group.name = "gpio" #id,                       \
> +               .group.pins = gpio##id##_pins,          \
> +               .pin = id,                              \
> +               .slew_offset = soff,                    \
> +               .group.num_pins = ARRAY_SIZE(gpio##id##_pins),  \
> +               .funcs = (int[]){                       \
> +                       LPI_MUX_gpio,                   \
> +                       LPI_MUX_##f1,                   \
> +                       LPI_MUX_##f2,                   \
> +                       LPI_MUX_##f3,                   \
> +                       LPI_MUX_##f4,                   \
> +               },                                      \
> +               .nfuncs = 5,                            \
> +       }
> +
> +struct lpi_pingroup {
> +       struct group_desc group;
> +       unsigned int pin;
> +       /* Bit offset in slew register for SoundWire pins only */
> +       int slew_offset;
> +       unsigned int *funcs;
> +       unsigned int nfuncs;
> +};
> +
> +struct lpi_function {
> +       const char *name;
> +       const char * const *groups;
> +       unsigned int ngroups;
> +};
> +
> +struct lpi_pinctrl_variant_data {
> +       const struct pinctrl_pin_desc *pins;
> +       int npins;
> +       const struct lpi_pingroup *groups;
> +       int ngroups;
> +       const struct lpi_function *functions;
> +       int nfunctions;
> +};
> +
> +int lpi_pinctrl_probe(struct platform_device *pdev);
> +int lpi_pinctrl_remove(struct platform_device *pdev);
> +
> +#endif /*__PINCTRL_LPASS_LPI_H__*/
> +

Drop the extra newline on this file please.

> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
> new file mode 100644
> index 0000000..27e358e
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
> @@ -0,0 +1,166 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2016-2019, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2020 Linaro Ltd.
> + */
> +
> +#include <linux/clk.h>

Drop unused include please.

> +#include <linux/gpio/driver.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +#include "pinctrl-lpass-lpi.h"
> +
> +enum lpass_lpi_functions {
> +       LPI_MUX_dmic1_clk,
> +       LPI_MUX_dmic1_data,
> +       LPI_MUX_dmic2_clk,
> +       LPI_MUX_dmic2_data,
> +       LPI_MUX_dmic3_clk,
> +       LPI_MUX_dmic3_data,
> +       LPI_MUX_i2s1_clk,
> +       LPI_MUX_i2s1_data,
> +       LPI_MUX_i2s1_ws,
> +       LPI_MUX_i2s2_clk,
> +       LPI_MUX_i2s2_data,
> +       LPI_MUX_i2s2_ws,
> +       LPI_MUX_qua_mi2s_data,
> +       LPI_MUX_qua_mi2s_sclk,
> +       LPI_MUX_qua_mi2s_ws,
> +       LPI_MUX_swr_rx_clk,
> +       LPI_MUX_swr_rx_data,
> +       LPI_MUX_swr_tx_clk,
> +       LPI_MUX_swr_tx_data,
> +       LPI_MUX_wsa_swr_clk,
> +       LPI_MUX_wsa_swr_data,
> +       LPI_MUX_gpio,
> +       LPI_MUX__,
> +};
> +
> +static int gpio0_pins[] = { 0 };

Why not const?

> +static int gpio1_pins[] = { 1 };
> +static int gpio2_pins[] = { 2 };
> +static int gpio3_pins[] = { 3 };
> +static int gpio4_pins[] = { 4 };
> +static int gpio5_pins[] = { 5 };
> +static int gpio6_pins[] = { 6 };
> +static int gpio7_pins[] = { 7 };
> +static int gpio8_pins[] = { 8 };
> +static int gpio9_pins[] = { 9 };
> +static int gpio10_pins[] = { 10 };
> +static int gpio11_pins[] = { 11 };
> +static int gpio12_pins[] = { 12 };
> +static int gpio13_pins[] = { 13 };
> +
> +
> +/* sm8250 variant specific data */
> +static const struct pinctrl_pin_desc sm8250_lpi_pins[] = {
> +       PINCTRL_PIN(0, "gpio0"),
> +       PINCTRL_PIN(1, "gpio1"),
> +       PINCTRL_PIN(2, "gpio2"),
> +       PINCTRL_PIN(3, "gpio3"),
> +       PINCTRL_PIN(4, "gpio4"),
> +       PINCTRL_PIN(5, "gpio5"),
> +       PINCTRL_PIN(6, "gpio6"),
> +       PINCTRL_PIN(7, "gpio7"),
> +       PINCTRL_PIN(8, "gpio8"),
> +       PINCTRL_PIN(9, "gpio9"),
> +       PINCTRL_PIN(10, "gpio10"),
> +       PINCTRL_PIN(11, "gpio11"),
> +       PINCTRL_PIN(12, "gpio12"),
> +       PINCTRL_PIN(13, "gpio13"),
> +};
> +
> +static const char * const swr_tx_clk_groups[] = { "gpio0" };
> +static const char * const swr_tx_data_groups[] = { "gpio1", "gpio2", "gpio5" };
> +static const char * const swr_rx_clk_groups[] = { "gpio3" };
> +static const char * const swr_rx_data_groups[] = { "gpio4", "gpio5" };
> +static const char * const dmic1_clk_groups[] = { "gpio6" };
> +static const char * const dmic1_data_groups[] = { "gpio7" };
> +static const char * const dmic2_clk_groups[] = { "gpio8" };
> +static const char * const dmic2_data_groups[] = { "gpio9" };
> +static const char * const i2s2_clk_groups[] = { "gpio10" };
> +static const char * const i2s2_ws_groups[] = { "gpio11" };
> +static const char * const dmic3_clk_groups[] = { "gpio12" };
> +static const char * const dmic3_data_groups[] = { "gpio13" };
> +static const char * const qua_mi2s_sclk_groups[] = { "gpio0" };
> +static const char * const qua_mi2s_ws_groups[] = { "gpio1" };
> +static const char * const qua_mi2s_data_groups[] = { "gpio2", "gpio3", "gpio4" };
> +static const char * const i2s1_clk_groups[] = { "gpio6" };
> +static const char * const i2s1_ws_groups[] = { "gpio7" };
> +static const char * const i2s1_data_groups[] = { "gpio8", "gpio9" };
> +static const char * const wsa_swr_clk_groups[] = { "gpio10" };
> +static const char * const wsa_swr_data_groups[] = { "gpio11" };
> +static const char * const i2s2_data_groups[] = { "gpio12", "gpio12" };
> +
> +static const struct lpi_pingroup sm8250_groups[] = {
> +       LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
> +       LPI_PINGROUP(1, 2, swr_tx_data, qua_mi2s_ws, _, _),
> +       LPI_PINGROUP(2, 4, swr_tx_data, qua_mi2s_data, _, _),
> +       LPI_PINGROUP(3, 8, swr_rx_clk, qua_mi2s_data, _, _),
> +       LPI_PINGROUP(4, 10, swr_rx_data, qua_mi2s_data, _, _),
> +       LPI_PINGROUP(5, 12, swr_tx_data, swr_rx_data, _, _),
> +       LPI_PINGROUP(6, LPI_NO_SLEW, dmic1_clk, i2s1_clk, _,  _),
> +       LPI_PINGROUP(7, LPI_NO_SLEW, dmic1_data, i2s1_ws, _, _),
> +       LPI_PINGROUP(8, LPI_NO_SLEW, dmic2_clk, i2s1_data, _, _),
> +       LPI_PINGROUP(9, LPI_NO_SLEW, dmic2_data, i2s1_data, _, _),
> +       LPI_PINGROUP(10, 16, i2s2_clk, wsa_swr_clk, _, _),
> +       LPI_PINGROUP(11, 18, i2s2_ws, wsa_swr_data, _, _),
> +       LPI_PINGROUP(12, LPI_NO_SLEW, dmic3_clk, i2s2_data, _, _),
> +       LPI_PINGROUP(13, LPI_NO_SLEW, dmic3_data, i2s2_data, _, _),
> +};
> +
> +static const struct lpi_function sm8250_functions[] = {
> +       LPI_FUNCTION(dmic1_clk),
> +       LPI_FUNCTION(dmic1_data),
> +       LPI_FUNCTION(dmic2_clk),
> +       LPI_FUNCTION(dmic2_data),
> +       LPI_FUNCTION(dmic3_clk),
> +       LPI_FUNCTION(dmic3_data),
> +       LPI_FUNCTION(i2s1_clk),
> +       LPI_FUNCTION(i2s1_data),
> +       LPI_FUNCTION(i2s1_ws),
> +       LPI_FUNCTION(i2s2_clk),
> +       LPI_FUNCTION(i2s2_data),
> +       LPI_FUNCTION(i2s2_ws),
> +       LPI_FUNCTION(qua_mi2s_data),
> +       LPI_FUNCTION(qua_mi2s_sclk),
> +       LPI_FUNCTION(qua_mi2s_ws),
> +       LPI_FUNCTION(swr_rx_clk),
> +       LPI_FUNCTION(swr_rx_data),
> +       LPI_FUNCTION(swr_tx_clk),
> +       LPI_FUNCTION(swr_tx_data),
> +       LPI_FUNCTION(wsa_swr_clk),
> +       LPI_FUNCTION(wsa_swr_data),
> +};
> +
> +static struct lpi_pinctrl_variant_data sm8250_lpi_data = {

It would be great if this could be const.

> +       .pins = sm8250_lpi_pins,
> +       .npins = ARRAY_SIZE(sm8250_lpi_pins),
> +       .groups = sm8250_groups,
> +       .ngroups = ARRAY_SIZE(sm8250_groups),
> +       .functions = sm8250_functions,
> +       .nfunctions = ARRAY_SIZE(sm8250_functions),
> +};
> +
