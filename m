Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E49684BC9D7
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Feb 2022 19:32:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C5C416A1;
	Sat, 19 Feb 2022 19:31:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C5C416A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645295559;
	bh=WTY1w1IDV/S75U0I3wa/18yi90g/z0KBDjKPk7TBrAs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aZHZgCMWKLzxL0tBz3vSOFd4Dv8SxG7Ovg3xcZUrDbDq2Ue3hODKtSJFuaV5QQL0W
	 oL7lkDRw7JfU+AVkcAk7Rezb4cH/CL8D0M8IkgATpVnAyf2KnQgN7RRe56gtebrST7
	 7kS4puSEWgTkZW+D68ZKJc5sroj4yw79V7oG13bc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF42EF800AB;
	Sat, 19 Feb 2022 19:31:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2826F8016A; Sat, 19 Feb 2022 19:31:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2D45F80118
 for <alsa-devel@alsa-project.org>; Sat, 19 Feb 2022 19:31:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2D45F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="EvM/v0sb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645295485; x=1676831485;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=XlX35MepxLjsnDD4Y8HkPIx6tSPqHowSOSDbBxcf6Bw=;
 b=EvM/v0sb/mt8JU6wy/0lFy0edBa+eNV3lIBORHsHTNWuVzWQBdyp69Q5
 1vM+v3UbCeaOAPqsM/drMswpRymeaKywf7bJ8LHgLyGfDuBHCtJDuMW7k
 ju30v/URh0IClFojHalTXeBJBGz3of3K+nf1XOq+dmue2od9ofulwtNJu g=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 19 Feb 2022 10:31:19 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2022 10:31:18 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Sat, 19 Feb 2022 10:30:56 -0800
Received: from [10.216.20.52] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Sat, 19 Feb
 2022 10:30:48 -0800
Message-ID: <68d7149a-5bc2-839f-7782-7c72f8a6b6fd@quicinc.com>
Date: Sun, 20 Feb 2022 00:00:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v6 5/7] pinctrl: qcom: Extract chip specific LPASS LPI code
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, Linus Walleij
 <linus.walleij@linaro.org>, <agross@kernel.org>,
 <alsa-devel@alsa-project.org>, <bgoswami@codeaurora.org>,
 <bjorn.andersson@linaro.org>, <broonie@kernel.org>,
 <devicetree@vger.kernel.org>, <judyhsiao@chromium.org>,
 <lgirdwood@gmail.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <perex@perex.cz>, <quic_plai@quicinc.com>, <robh+dt@kernel.org>,
 <rohitkr@codeaurora.org>, <srinivas.kandagatla@linaro.org>, <tiwai@suse.com>
References: <1644851994-22732-1-git-send-email-quic_srivasam@quicinc.com>
 <1644851994-22732-6-git-send-email-quic_srivasam@quicinc.com>
 <CAE-0n521g=RMetskRmiz-QxTJWaewYxDSJ6UtvZuYDM5Hq-sHQ@mail.gmail.com>
From: "Srinivasa Rao Mandadapu (Temp)" <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <CAE-0n521g=RMetskRmiz-QxTJWaewYxDSJ6UtvZuYDM5Hq-sHQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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


On 2/19/2022 8:12 AM, Stephen Boyd wrote:
Thanks for Your time Stephen!!!
> Quoting Srinivasa Rao Mandadapu (2022-02-14 07:19:52)
>> diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
>> index ca6f68a..8871451 100644
>> --- a/drivers/pinctrl/qcom/Kconfig
>> +++ b/drivers/pinctrl/qcom/Kconfig
>> @@ -357,4 +357,12 @@ config PINCTRL_LPASS_LPI
>>            Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
>>            (Low Power Island) found on the Qualcomm Technologies Inc SoCs.
>>
>> +config PINCTRL_SM8250_LPASS_LPI
> Can this be sorted somehow? On Kconfig? Adding to the end of the file
> causes conflicts more often than adding alphabetically.
Okay. Will sort it and re post it.
>
>> +       tristate "Qualcomm Technologies Inc SM8250 LPASS LPI pin controller driver"
>> +       depends on PINCTRL_LPASS_LPI
>> +       help
>> +         This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>> +         Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
>> +         (Low Power Island) found on the Qualcomm Technologies Inc SM8250 platform.
>> +
>>   endif
>> diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
>> index 709882f..c10d14d2 100644
>> --- a/drivers/pinctrl/qcom/Makefile
>> +++ b/drivers/pinctrl/qcom/Makefile
>> @@ -41,3 +41,4 @@ obj-$(CONFIG_PINCTRL_SM8250) += pinctrl-sm8250.o
>>   obj-$(CONFIG_PINCTRL_SM8350) += pinctrl-sm8350.o
>>   obj-$(CONFIG_PINCTRL_SM8450) += pinctrl-sm8450.o
>>   obj-$(CONFIG_PINCTRL_LPASS_LPI) += pinctrl-lpass-lpi.o
>> +obj-$(CONFIG_PINCTRL_SM8250_LPASS_LPI) += pinctrl-sm8250-lpass-lpi.o
> Can this be sorted somehow? Either on Kconfig or file name?
Okay.
>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> index 54750ba..8a82fd9 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> @@ -4,91 +4,15 @@
>>    * Copyright (c) 2020 Linaro Ltd.
>>    */
>>
>> -#include <linux/bitops.h>
>> -#include <linux/bitfield.h>
>>   #include <linux/clk.h>
>>   #include <linux/gpio/driver.h>
>> -#include <linux/io.h>
>>   #include <linux/module.h>
>>   #include <linux/of_device.h>
>> -#include <linux/of.h>
>>   #include <linux/pinctrl/pinconf-generic.h>
>>   #include <linux/pinctrl/pinconf.h>
>>   #include <linux/pinctrl/pinmux.h>
>> -#include <linux/platform_device.h>
>> -#include <linux/slab.h>
>> -#include <linux/types.h>
>> -#include "../core.h"
>>   #include "../pinctrl-utils.h"
>> -
>> -#define LPI_SLEW_RATE_CTL_REG          0xa000
>> -#define LPI_TLMM_REG_OFFSET            0x1000
>> -#define LPI_SLEW_RATE_MAX              0x03
>> -#define LPI_SLEW_BITS_SIZE             0x02
>> -#define LPI_SLEW_RATE_MASK             GENMASK(1, 0)
>> -#define LPI_GPIO_CFG_REG               0x00
>> -#define LPI_GPIO_PULL_MASK             GENMASK(1, 0)
>> -#define LPI_GPIO_FUNCTION_MASK         GENMASK(5, 2)
>> -#define LPI_GPIO_OUT_STRENGTH_MASK     GENMASK(8, 6)
>> -#define LPI_GPIO_OE_MASK               BIT(9)
>> -#define LPI_GPIO_VALUE_REG             0x04
>> -#define LPI_GPIO_VALUE_IN_MASK         BIT(0)
>> -#define LPI_GPIO_VALUE_OUT_MASK                BIT(1)
>> -
>> -#define LPI_GPIO_BIAS_DISABLE          0x0
>> -#define LPI_GPIO_PULL_DOWN             0x1
>> -#define LPI_GPIO_KEEPER                        0x2
>> -#define LPI_GPIO_PULL_UP               0x3
>> -#define LPI_GPIO_DS_TO_VAL(v)          (v / 2 - 1)
>> -#define LPI_NO_SLEW                            -1
>> -
>> -#define LPI_FUNCTION(fname)                                    \
>> -       [LPI_MUX_##fname] = {                           \
>> -               .name = #fname,                         \
>> -               .groups = fname##_groups,               \
>> -               .ngroups = ARRAY_SIZE(fname##_groups),  \
>> -       }
>> -
>> -#define LPI_PINGROUP(id, soff, f1, f2, f3, f4)         \
>> -       {                                               \
>> -               .group.name = "gpio" #id,                       \
>> -               .group.pins = gpio##id##_pins,          \
>> -               .pin = id,                              \
>> -               .slew_offset = soff,                    \
>> -               .group.num_pins = ARRAY_SIZE(gpio##id##_pins),  \
>> -               .funcs = (int[]){                       \
>> -                       LPI_MUX_gpio,                   \
>> -                       LPI_MUX_##f1,                   \
>> -                       LPI_MUX_##f2,                   \
>> -                       LPI_MUX_##f3,                   \
>> -                       LPI_MUX_##f4,                   \
>> -               },                                      \
>> -               .nfuncs = 5,                            \
>> -       }
>> -
>> -struct lpi_pingroup {
>> -       struct group_desc group;
>> -       unsigned int pin;
>> -       /* Bit offset in slew register for SoundWire pins only */
>> -       int slew_offset;
>> -       unsigned int *funcs;
>> -       unsigned int nfuncs;
>> -};
>> -
>> -struct lpi_function {
>> -       const char *name;
>> -       const char * const *groups;
>> -       unsigned int ngroups;
>> -};
>> -
>> -struct lpi_pinctrl_variant_data {
>> -       const struct pinctrl_pin_desc *pins;
>> -       int npins;
>> -       const struct lpi_pingroup *groups;
>> -       int ngroups;
>> -       const struct lpi_function *functions;
>> -       int nfunctions;
>> -};
>> +#include "pinctrl-lpass-lpi.h"
>>
>>   #define MAX_LPI_NUM_CLKS       2
>>
>> @@ -104,136 +28,6 @@ struct lpi_pinctrl {
>>          const struct lpi_pinctrl_variant_data *data;
>>   };
>>
>> -/* sm8250 variant specific data */
>> -static const struct pinctrl_pin_desc sm8250_lpi_pins[] = {
>> -       PINCTRL_PIN(0, "gpio0"),
>> -       PINCTRL_PIN(1, "gpio1"),
>> -       PINCTRL_PIN(2, "gpio2"),
>> -       PINCTRL_PIN(3, "gpio3"),
>> -       PINCTRL_PIN(4, "gpio4"),
>> -       PINCTRL_PIN(5, "gpio5"),
>> -       PINCTRL_PIN(6, "gpio6"),
>> -       PINCTRL_PIN(7, "gpio7"),
>> -       PINCTRL_PIN(8, "gpio8"),
>> -       PINCTRL_PIN(9, "gpio9"),
>> -       PINCTRL_PIN(10, "gpio10"),
>> -       PINCTRL_PIN(11, "gpio11"),
>> -       PINCTRL_PIN(12, "gpio12"),
>> -       PINCTRL_PIN(13, "gpio13"),
>> -};
>> -
>> -enum sm8250_lpi_functions {
>> -       LPI_MUX_dmic1_clk,
>> -       LPI_MUX_dmic1_data,
>> -       LPI_MUX_dmic2_clk,
>> -       LPI_MUX_dmic2_data,
>> -       LPI_MUX_dmic3_clk,
>> -       LPI_MUX_dmic3_data,
>> -       LPI_MUX_i2s1_clk,
>> -       LPI_MUX_i2s1_data,
>> -       LPI_MUX_i2s1_ws,
>> -       LPI_MUX_i2s2_clk,
>> -       LPI_MUX_i2s2_data,
>> -       LPI_MUX_i2s2_ws,
>> -       LPI_MUX_qua_mi2s_data,
>> -       LPI_MUX_qua_mi2s_sclk,
>> -       LPI_MUX_qua_mi2s_ws,
>> -       LPI_MUX_swr_rx_clk,
>> -       LPI_MUX_swr_rx_data,
>> -       LPI_MUX_swr_tx_clk,
>> -       LPI_MUX_swr_tx_data,
>> -       LPI_MUX_wsa_swr_clk,
>> -       LPI_MUX_wsa_swr_data,
>> -       LPI_MUX_gpio,
>> -       LPI_MUX__,
>> -};
>> -
>> -static int gpio0_pins[] = { 0 };
>> -static int gpio1_pins[] = { 1 };
>> -static int gpio2_pins[] = { 2 };
>> -static int gpio3_pins[] = { 3 };
>> -static int gpio4_pins[] = { 4 };
>> -static int gpio5_pins[] = { 5 };
>> -static int gpio6_pins[] = { 6 };
>> -static int gpio7_pins[] = { 7 };
>> -static int gpio8_pins[] = { 8 };
>> -static int gpio9_pins[] = { 9 };
>> -static int gpio10_pins[] = { 10 };
>> -static int gpio11_pins[] = { 11 };
>> -static int gpio12_pins[] = { 12 };
>> -static int gpio13_pins[] = { 13 };
>> -static const char * const swr_tx_clk_groups[] = { "gpio0" };
>> -static const char * const swr_tx_data_groups[] = { "gpio1", "gpio2", "gpio5" };
>> -static const char * const swr_rx_clk_groups[] = { "gpio3" };
>> -static const char * const swr_rx_data_groups[] = { "gpio4", "gpio5" };
>> -static const char * const dmic1_clk_groups[] = { "gpio6" };
>> -static const char * const dmic1_data_groups[] = { "gpio7" };
>> -static const char * const dmic2_clk_groups[] = { "gpio8" };
>> -static const char * const dmic2_data_groups[] = { "gpio9" };
>> -static const char * const i2s2_clk_groups[] = { "gpio10" };
>> -static const char * const i2s2_ws_groups[] = { "gpio11" };
>> -static const char * const dmic3_clk_groups[] = { "gpio12" };
>> -static const char * const dmic3_data_groups[] = { "gpio13" };
>> -static const char * const qua_mi2s_sclk_groups[] = { "gpio0" };
>> -static const char * const qua_mi2s_ws_groups[] = { "gpio1" };
>> -static const char * const qua_mi2s_data_groups[] = { "gpio2", "gpio3", "gpio4" };
>> -static const char * const i2s1_clk_groups[] = { "gpio6" };
>> -static const char * const i2s1_ws_groups[] = { "gpio7" };
>> -static const char * const i2s1_data_groups[] = { "gpio8", "gpio9" };
>> -static const char * const wsa_swr_clk_groups[] = { "gpio10" };
>> -static const char * const wsa_swr_data_groups[] = { "gpio11" };
>> -static const char * const i2s2_data_groups[] = { "gpio12", "gpio12" };
>> -
>> -static const struct lpi_pingroup sm8250_groups[] = {
>> -       LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
>> -       LPI_PINGROUP(1, 2, swr_tx_data, qua_mi2s_ws, _, _),
>> -       LPI_PINGROUP(2, 4, swr_tx_data, qua_mi2s_data, _, _),
>> -       LPI_PINGROUP(3, 8, swr_rx_clk, qua_mi2s_data, _, _),
>> -       LPI_PINGROUP(4, 10, swr_rx_data, qua_mi2s_data, _, _),
>> -       LPI_PINGROUP(5, 12, swr_tx_data, swr_rx_data, _, _),
>> -       LPI_PINGROUP(6, LPI_NO_SLEW, dmic1_clk, i2s1_clk, _,  _),
>> -       LPI_PINGROUP(7, LPI_NO_SLEW, dmic1_data, i2s1_ws, _, _),
>> -       LPI_PINGROUP(8, LPI_NO_SLEW, dmic2_clk, i2s1_data, _, _),
>> -       LPI_PINGROUP(9, LPI_NO_SLEW, dmic2_data, i2s1_data, _, _),
>> -       LPI_PINGROUP(10, 16, i2s2_clk, wsa_swr_clk, _, _),
>> -       LPI_PINGROUP(11, 18, i2s2_ws, wsa_swr_data, _, _),
>> -       LPI_PINGROUP(12, LPI_NO_SLEW, dmic3_clk, i2s2_data, _, _),
>> -       LPI_PINGROUP(13, LPI_NO_SLEW, dmic3_data, i2s2_data, _, _),
>> -};
>> -
>> -static const struct lpi_function sm8250_functions[] = {
>> -       LPI_FUNCTION(dmic1_clk),
>> -       LPI_FUNCTION(dmic1_data),
>> -       LPI_FUNCTION(dmic2_clk),
>> -       LPI_FUNCTION(dmic2_data),
>> -       LPI_FUNCTION(dmic3_clk),
>> -       LPI_FUNCTION(dmic3_data),
>> -       LPI_FUNCTION(i2s1_clk),
>> -       LPI_FUNCTION(i2s1_data),
>> -       LPI_FUNCTION(i2s1_ws),
>> -       LPI_FUNCTION(i2s2_clk),
>> -       LPI_FUNCTION(i2s2_data),
>> -       LPI_FUNCTION(i2s2_ws),
>> -       LPI_FUNCTION(qua_mi2s_data),
>> -       LPI_FUNCTION(qua_mi2s_sclk),
>> -       LPI_FUNCTION(qua_mi2s_ws),
>> -       LPI_FUNCTION(swr_rx_clk),
>> -       LPI_FUNCTION(swr_rx_data),
>> -       LPI_FUNCTION(swr_tx_clk),
>> -       LPI_FUNCTION(swr_tx_data),
>> -       LPI_FUNCTION(wsa_swr_clk),
>> -       LPI_FUNCTION(wsa_swr_data),
>> -};
>> -
>> -static struct lpi_pinctrl_variant_data sm8250_lpi_data = {
>> -       .pins = sm8250_lpi_pins,
>> -       .npins = ARRAY_SIZE(sm8250_lpi_pins),
>> -       .groups = sm8250_groups,
>> -       .ngroups = ARRAY_SIZE(sm8250_groups),
>> -       .functions = sm8250_functions,
>> -       .nfunctions = ARRAY_SIZE(sm8250_functions),
>> -};
>> -
>>   static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
>>                           unsigned int addr)
>>   {
>> @@ -580,7 +374,7 @@ static const struct gpio_chip lpi_gpio_template = {
>>          .dbg_show               = lpi_gpio_dbg_show,
>>   };
>>
>> -static int lpi_pinctrl_probe(struct platform_device *pdev)
>> +int lpi_pinctrl_probe(struct platform_device *pdev)
>>   {
>>          const struct lpi_pinctrl_variant_data *data;
>>          struct device *dev = &pdev->dev;
>> @@ -659,8 +453,9 @@ static int lpi_pinctrl_probe(struct platform_device *pdev)
>>
>>          return ret;
>>   }
>> +EXPORT_SYMBOL(lpi_pinctrl_probe);
> EXPORT_SYMBOL_GPL?
Okay. will change it.
>
>> -static int lpi_pinctrl_remove(struct platform_device *pdev)
>> +int lpi_pinctrl_remove(struct platform_device *pdev)
>>   {
>>          struct lpi_pinctrl *pctrl = platform_get_drvdata(pdev);
>>
>> @@ -669,25 +464,7 @@ static int lpi_pinctrl_remove(struct platform_device *pdev)
>>
>>          return 0;
>>   }
>> +EXPORT_SYMBOL(lpi_pinctrl_remove);
> EXPORT_SYMBOL_GPL?
Okay. will change it.
>
>> -static const struct of_device_id lpi_pinctrl_of_match[] = {
>> -       {
>> -              .compatible = "qcom,sm8250-lpass-lpi-pinctrl",
>> -              .data = &sm8250_lpi_data,
>> -       },
>> -       { }
>> -};
>> -MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
>> new file mode 100644
>> index 0000000..a511d72
>> --- /dev/null
>> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
>> @@ -0,0 +1,86 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2016-2019, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2020 Linaro Ltd.
>> + */
>> +#ifndef __PINCTRL_LPASS_LPI_H__
>> +#define __PINCTRL_LPASS_LPI_H__
>> +
>> +#include <linux/bitops.h>
>> +#include <linux/bitfield.h>
>> +#include "../core.h"
>> +
>> +#define LPI_SLEW_RATE_CTL_REG  0xa000
>> +#define LPI_TLMM_REG_OFFSET            0x1000
>> +#define LPI_SLEW_RATE_MAX              0x03
>> +#define LPI_SLEW_BITS_SIZE             0x02
>> +#define LPI_SLEW_RATE_MASK             GENMASK(1, 0)
>> +#define LPI_GPIO_CFG_REG               0x00
>> +#define LPI_GPIO_PULL_MASK             GENMASK(1, 0)
>> +#define LPI_GPIO_FUNCTION_MASK         GENMASK(5, 2)
>> +#define LPI_GPIO_OUT_STRENGTH_MASK     GENMASK(8, 6)
>> +#define LPI_GPIO_OE_MASK               BIT(9)
>> +#define LPI_GPIO_VALUE_REG             0x04
>> +#define LPI_GPIO_VALUE_IN_MASK         BIT(0)
>> +#define LPI_GPIO_VALUE_OUT_MASK                BIT(1)
>> +
>> +#define LPI_GPIO_BIAS_DISABLE          0x0
>> +#define LPI_GPIO_PULL_DOWN             0x1
>> +#define LPI_GPIO_KEEPER                        0x2
>> +#define LPI_GPIO_PULL_UP               0x3
>> +#define LPI_GPIO_DS_TO_VAL(v)          (v / 2 - 1)
>> +#define LPI_NO_SLEW                            -1
>> +
>> +#define LPI_FUNCTION(fname)                                    \
>> +       [LPI_MUX_##fname] = {                           \
>> +               .name = #fname,                         \
>> +               .groups = fname##_groups,               \
>> +               .ngroups = ARRAY_SIZE(fname##_groups),  \
>> +       }
>> +
>> +#define LPI_PINGROUP(id, soff, f1, f2, f3, f4)         \
>> +       {                                               \
>> +               .group.name = "gpio" #id,                       \
>> +               .group.pins = gpio##id##_pins,          \
>> +               .pin = id,                              \
>> +               .slew_offset = soff,                    \
>> +               .group.num_pins = ARRAY_SIZE(gpio##id##_pins),  \
>> +               .funcs = (int[]){                       \
>> +                       LPI_MUX_gpio,                   \
>> +                       LPI_MUX_##f1,                   \
>> +                       LPI_MUX_##f2,                   \
>> +                       LPI_MUX_##f3,                   \
>> +                       LPI_MUX_##f4,                   \
>> +               },                                      \
>> +               .nfuncs = 5,                            \
>> +       }
>> +
>> +struct lpi_pingroup {
>> +       struct group_desc group;
>> +       unsigned int pin;
>> +       /* Bit offset in slew register for SoundWire pins only */
>> +       int slew_offset;
>> +       unsigned int *funcs;
>> +       unsigned int nfuncs;
>> +};
>> +
>> +struct lpi_function {
>> +       const char *name;
>> +       const char * const *groups;
>> +       unsigned int ngroups;
>> +};
>> +
>> +struct lpi_pinctrl_variant_data {
>> +       const struct pinctrl_pin_desc *pins;
>> +       int npins;
>> +       const struct lpi_pingroup *groups;
>> +       int ngroups;
>> +       const struct lpi_function *functions;
>> +       int nfunctions;
>> +};
>> +
>> +int lpi_pinctrl_probe(struct platform_device *pdev);
>> +int lpi_pinctrl_remove(struct platform_device *pdev);
>> +
>> +#endif /*__PINCTRL_LPASS_LPI_H__*/
>> +
> Drop the extra newline on this file please.
Okay. will remove it.
>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
>> new file mode 100644
>> index 0000000..27e358e
>> --- /dev/null
>> +++ b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
>> @@ -0,0 +1,166 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2016-2019, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2020 Linaro Ltd.
>> + */
>> +
>> +#include <linux/clk.h>
> Drop unused include please.
Okay.
>
>> +#include <linux/gpio/driver.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +
>> +#include "pinctrl-lpass-lpi.h"
>> +
>> +enum lpass_lpi_functions {
>> +       LPI_MUX_dmic1_clk,
>> +       LPI_MUX_dmic1_data,
>> +       LPI_MUX_dmic2_clk,
>> +       LPI_MUX_dmic2_data,
>> +       LPI_MUX_dmic3_clk,
>> +       LPI_MUX_dmic3_data,
>> +       LPI_MUX_i2s1_clk,
>> +       LPI_MUX_i2s1_data,
>> +       LPI_MUX_i2s1_ws,
>> +       LPI_MUX_i2s2_clk,
>> +       LPI_MUX_i2s2_data,
>> +       LPI_MUX_i2s2_ws,
>> +       LPI_MUX_qua_mi2s_data,
>> +       LPI_MUX_qua_mi2s_sclk,
>> +       LPI_MUX_qua_mi2s_ws,
>> +       LPI_MUX_swr_rx_clk,
>> +       LPI_MUX_swr_rx_data,
>> +       LPI_MUX_swr_tx_clk,
>> +       LPI_MUX_swr_tx_data,
>> +       LPI_MUX_wsa_swr_clk,
>> +       LPI_MUX_wsa_swr_data,
>> +       LPI_MUX_gpio,
>> +       LPI_MUX__,
>> +};
>> +
>> +static int gpio0_pins[] = { 0 };
> Why not const?
It's creating conflict with group_desc structure params.
>
>> +static int gpio1_pins[] = { 1 };
>> +static int gpio2_pins[] = { 2 };
>> +static int gpio3_pins[] = { 3 };
>> +static int gpio4_pins[] = { 4 };
>> +static int gpio5_pins[] = { 5 };
>> +static int gpio6_pins[] = { 6 };
>> +static int gpio7_pins[] = { 7 };
>> +static int gpio8_pins[] = { 8 };
>> +static int gpio9_pins[] = { 9 };
>> +static int gpio10_pins[] = { 10 };
>> +static int gpio11_pins[] = { 11 };
>> +static int gpio12_pins[] = { 12 };
>> +static int gpio13_pins[] = { 13 };
>> +
>> +
>> +/* sm8250 variant specific data */
>> +static const struct pinctrl_pin_desc sm8250_lpi_pins[] = {
>> +       PINCTRL_PIN(0, "gpio0"),
>> +       PINCTRL_PIN(1, "gpio1"),
>> +       PINCTRL_PIN(2, "gpio2"),
>> +       PINCTRL_PIN(3, "gpio3"),
>> +       PINCTRL_PIN(4, "gpio4"),
>> +       PINCTRL_PIN(5, "gpio5"),
>> +       PINCTRL_PIN(6, "gpio6"),
>> +       PINCTRL_PIN(7, "gpio7"),
>> +       PINCTRL_PIN(8, "gpio8"),
>> +       PINCTRL_PIN(9, "gpio9"),
>> +       PINCTRL_PIN(10, "gpio10"),
>> +       PINCTRL_PIN(11, "gpio11"),
>> +       PINCTRL_PIN(12, "gpio12"),
>> +       PINCTRL_PIN(13, "gpio13"),
>> +};
>> +
>> +static const char * const swr_tx_clk_groups[] = { "gpio0" };
>> +static const char * const swr_tx_data_groups[] = { "gpio1", "gpio2", "gpio5" };
>> +static const char * const swr_rx_clk_groups[] = { "gpio3" };
>> +static const char * const swr_rx_data_groups[] = { "gpio4", "gpio5" };
>> +static const char * const dmic1_clk_groups[] = { "gpio6" };
>> +static const char * const dmic1_data_groups[] = { "gpio7" };
>> +static const char * const dmic2_clk_groups[] = { "gpio8" };
>> +static const char * const dmic2_data_groups[] = { "gpio9" };
>> +static const char * const i2s2_clk_groups[] = { "gpio10" };
>> +static const char * const i2s2_ws_groups[] = { "gpio11" };
>> +static const char * const dmic3_clk_groups[] = { "gpio12" };
>> +static const char * const dmic3_data_groups[] = { "gpio13" };
>> +static const char * const qua_mi2s_sclk_groups[] = { "gpio0" };
>> +static const char * const qua_mi2s_ws_groups[] = { "gpio1" };
>> +static const char * const qua_mi2s_data_groups[] = { "gpio2", "gpio3", "gpio4" };
>> +static const char * const i2s1_clk_groups[] = { "gpio6" };
>> +static const char * const i2s1_ws_groups[] = { "gpio7" };
>> +static const char * const i2s1_data_groups[] = { "gpio8", "gpio9" };
>> +static const char * const wsa_swr_clk_groups[] = { "gpio10" };
>> +static const char * const wsa_swr_data_groups[] = { "gpio11" };
>> +static const char * const i2s2_data_groups[] = { "gpio12", "gpio12" };
>> +
>> +static const struct lpi_pingroup sm8250_groups[] = {
>> +       LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
>> +       LPI_PINGROUP(1, 2, swr_tx_data, qua_mi2s_ws, _, _),
>> +       LPI_PINGROUP(2, 4, swr_tx_data, qua_mi2s_data, _, _),
>> +       LPI_PINGROUP(3, 8, swr_rx_clk, qua_mi2s_data, _, _),
>> +       LPI_PINGROUP(4, 10, swr_rx_data, qua_mi2s_data, _, _),
>> +       LPI_PINGROUP(5, 12, swr_tx_data, swr_rx_data, _, _),
>> +       LPI_PINGROUP(6, LPI_NO_SLEW, dmic1_clk, i2s1_clk, _,  _),
>> +       LPI_PINGROUP(7, LPI_NO_SLEW, dmic1_data, i2s1_ws, _, _),
>> +       LPI_PINGROUP(8, LPI_NO_SLEW, dmic2_clk, i2s1_data, _, _),
>> +       LPI_PINGROUP(9, LPI_NO_SLEW, dmic2_data, i2s1_data, _, _),
>> +       LPI_PINGROUP(10, 16, i2s2_clk, wsa_swr_clk, _, _),
>> +       LPI_PINGROUP(11, 18, i2s2_ws, wsa_swr_data, _, _),
>> +       LPI_PINGROUP(12, LPI_NO_SLEW, dmic3_clk, i2s2_data, _, _),
>> +       LPI_PINGROUP(13, LPI_NO_SLEW, dmic3_data, i2s2_data, _, _),
>> +};
>> +
>> +static const struct lpi_function sm8250_functions[] = {
>> +       LPI_FUNCTION(dmic1_clk),
>> +       LPI_FUNCTION(dmic1_data),
>> +       LPI_FUNCTION(dmic2_clk),
>> +       LPI_FUNCTION(dmic2_data),
>> +       LPI_FUNCTION(dmic3_clk),
>> +       LPI_FUNCTION(dmic3_data),
>> +       LPI_FUNCTION(i2s1_clk),
>> +       LPI_FUNCTION(i2s1_data),
>> +       LPI_FUNCTION(i2s1_ws),
>> +       LPI_FUNCTION(i2s2_clk),
>> +       LPI_FUNCTION(i2s2_data),
>> +       LPI_FUNCTION(i2s2_ws),
>> +       LPI_FUNCTION(qua_mi2s_data),
>> +       LPI_FUNCTION(qua_mi2s_sclk),
>> +       LPI_FUNCTION(qua_mi2s_ws),
>> +       LPI_FUNCTION(swr_rx_clk),
>> +       LPI_FUNCTION(swr_rx_data),
>> +       LPI_FUNCTION(swr_tx_clk),
>> +       LPI_FUNCTION(swr_tx_data),
>> +       LPI_FUNCTION(wsa_swr_clk),
>> +       LPI_FUNCTION(wsa_swr_data),
>> +};
>> +
>> +static struct lpi_pinctrl_variant_data sm8250_lpi_data = {
> It would be great if this could be const.
Okay. Will add.
>> +       .pins = sm8250_lpi_pins,
>> +       .npins = ARRAY_SIZE(sm8250_lpi_pins),
>> +       .groups = sm8250_groups,
>> +       .ngroups = ARRAY_SIZE(sm8250_groups),
>> +       .functions = sm8250_functions,
>> +       .nfunctions = ARRAY_SIZE(sm8250_functions),
>> +};
>> +
