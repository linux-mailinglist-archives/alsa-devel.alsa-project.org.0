Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B32F446BF2B
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 16:21:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 478CD2484;
	Tue,  7 Dec 2021 16:20:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 478CD2484
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638890464;
	bh=CI+xkJ/0sHoUz2aqPeCXnwrtuLY8DOsJOMdxr3iKR8I=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RWT33mTiiIjHfYmx3zwDTuORU6Hn8CLabUYtgPNNIVO398W2T0Tdg1RK6N3lcTVR6
	 hx5xEXMicGRDhEMbKljYXszfFnll0RjIGfFv/pc/jViaTpYyBUYE7kIp9UaZvOzXVf
	 Hjglqe6chYk/NxRmt7jFSWOSTiotHNZQFvzaET7E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB9DAF8032B;
	Tue,  7 Dec 2021 16:19:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0778F8028D; Tue,  7 Dec 2021 16:19:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BA49F80217
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 16:19:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BA49F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="inbP5+46"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1638890382; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=OffRXYVqA0fHWMHhvj+JrTlza66+wlOh5c7WlOlrA7A=;
 b=inbP5+46d+WzMsvPYivxP07O8tOBl35fUiyeqqHpmN3DPBGsjSk4bGos0qxR/mYFidThAtjj
 ul4uExOh0kUau4P0Bk4LsndPegs4CjM+v9Fk0n9uuuKtedTO4iW5IIq9Utrk//fT3WxSCPPw
 lopeRwKikGm7tRbjbwpQF0fS+OU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 61af7b8c642caac318d76ac3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 07 Dec 2021 15:19:40
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B7452C43617; Tue,  7 Dec 2021 15:19:39 +0000 (UTC)
Received: from [10.242.143.72] (unknown [202.46.23.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 60C21C4338F;
 Tue,  7 Dec 2021 15:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 60C21C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v4 5/5] pinctrl: qcom: Add SC7280 lpass pin configuration
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.com>
References: <1638531140-25899-1-git-send-email-srivasam@codeaurora.com>
 <1638531140-25899-6-git-send-email-srivasam@codeaurora.com>
 <Ya45YKsdloY8l8do@builder.lan>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <7846a98f-618b-97f7-ce56-ad6597015619@codeaurora.org>
Date: Tue, 7 Dec 2021 20:49:25 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Ya45YKsdloY8l8do@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, Venkata Prasad Potturu <potturu@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, plai@codeaurora.org, tiwai@suse.com,
 agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 linux-gpio@vger.kernel.org, broonie@kernel.org, rohitkr@codeaurora.org,
 swboyd@chromium.org, judyhsiao@chromium.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
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


On 12/6/2021 9:55 PM, Bjorn Andersson wrote:
Thanks for your time Bjorn!!
> On Fri 03 Dec 05:32 CST 2021, Srinivasa Rao Mandadapu wrote:
>
>> From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>>
>> Add pin control support for SC7280 LPASS LPI.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>> ---
>>   drivers/pinctrl/qcom/Kconfig                    |   8 ++
>>   drivers/pinctrl/qcom/Makefile                   |   1 +
>>   drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c | 169 ++++++++++++++++++++++++
>>   3 files changed, 178 insertions(+)
>>   create mode 100644 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
>>
>> diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
>> index e750e10..37fe868 100644
>> --- a/drivers/pinctrl/qcom/Kconfig
>> +++ b/drivers/pinctrl/qcom/Kconfig
>> @@ -328,4 +328,12 @@ config PINCTRL_SM8250_LPASS_LPI
>>   	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
>>   	  (Low Power Island) found on the Qualcomm Technologies Inc SM8250 platform.
>>   
>> +config PINCTRL_SC7280_LPASS_LPI
>> +	tristate "Qualcomm Technologies Inc SM8250 LPASS LPI pin controller driver"
> You misspelled SC7280 here.
Okay. will address it.
>
>> +	depends on PINCTRL_LPASS_LPI
>> +	help
>> +	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>> +	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
>> +	  (Low Power Island) found on the Qualcomm Technologies Inc SC7280 platform.
>> +
>>   endif
>> diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
>> index 8bc877e..6c3ddaf 100644
>> --- a/drivers/pinctrl/qcom/Makefile
>> +++ b/drivers/pinctrl/qcom/Makefile
>> @@ -38,3 +38,4 @@ obj-$(CONFIG_PINCTRL_SM8250) += pinctrl-sm8250.o
>>   obj-$(CONFIG_PINCTRL_SM8350) += pinctrl-sm8350.o
>>   obj-$(CONFIG_PINCTRL_LPASS_LPI) += pinctrl-lpass-lpi.o
>>   obj-$(CONFIG_PINCTRL_SM8250_LPASS_LPI) += pinctrl-sm8250-lpass-lpi.o
>> +obj-$(CONFIG_PINCTRL_SC7280_LPASS_LPI) += pinctrl-sc7280-lpass-lpi.o
> Please keep these entries sorted alphabetically, same with Kconfig.
Okay. will address it.
>
> Regards,
> Bjorn
>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
>> new file mode 100644
>> index 0000000..94bec15
>> --- /dev/null
>> +++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
>> @@ -0,0 +1,169 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
>> + * ALSA SoC platform-machine driver for QTi LPASS
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/gpio/driver.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +
>> +#include "pinctrl-lpass-lpi.h"
>> +
>> +enum lpass_lpi_functions {
>> +	LPI_MUX_dmic1_clk,
>> +	LPI_MUX_dmic1_data,
>> +	LPI_MUX_dmic2_clk,
>> +	LPI_MUX_dmic2_data,
>> +	LPI_MUX_dmic3_clk,
>> +	LPI_MUX_dmic3_data,
>> +	LPI_MUX_i2s1_clk,
>> +	LPI_MUX_i2s1_data,
>> +	LPI_MUX_i2s1_ws,
>> +	LPI_MUX_i2s2_clk,
>> +	LPI_MUX_i2s2_data,
>> +	LPI_MUX_i2s2_ws,
>> +	LPI_MUX_qua_mi2s_data,
>> +	LPI_MUX_qua_mi2s_sclk,
>> +	LPI_MUX_qua_mi2s_ws,
>> +	LPI_MUX_swr_rx_clk,
>> +	LPI_MUX_swr_rx_data,
>> +	LPI_MUX_swr_tx_clk,
>> +	LPI_MUX_swr_tx_data,
>> +	LPI_MUX_wsa_swr_clk,
>> +	LPI_MUX_wsa_swr_data,
>> +	LPI_MUX_gpio,
>> +	LPI_MUX__,
>> +};
>> +
>> +static const unsigned int gpio0_pins[] = { 0 };
>> +static const unsigned int gpio1_pins[] = { 1 };
>> +static const unsigned int gpio2_pins[] = { 2 };
>> +static const unsigned int gpio3_pins[] = { 3 };
>> +static const unsigned int gpio4_pins[] = { 4 };
>> +static const unsigned int gpio5_pins[] = { 5 };
>> +static const unsigned int gpio6_pins[] = { 6 };
>> +static const unsigned int gpio7_pins[] = { 7 };
>> +static const unsigned int gpio8_pins[] = { 8 };
>> +static const unsigned int gpio9_pins[] = { 9 };
>> +static const unsigned int gpio10_pins[] = { 10 };
>> +static const unsigned int gpio11_pins[] = { 11 };
>> +static const unsigned int gpio12_pins[] = { 12 };
>> +static const unsigned int gpio13_pins[] = { 13 };
>> +static const unsigned int gpio14_pins[] = { 14 };
>> +
>> +/* sc7280 variant specific data */
>> +static const struct pinctrl_pin_desc sc7280_lpi_pins[] = {
>> +	PINCTRL_PIN(0, "gpio0"),
>> +	PINCTRL_PIN(1, "gpio1"),
>> +	PINCTRL_PIN(2, "gpio2"),
>> +	PINCTRL_PIN(3, "gpio3"),
>> +	PINCTRL_PIN(4, "gpio4"),
>> +	PINCTRL_PIN(5, "gpio5"),
>> +	PINCTRL_PIN(6, "gpio6"),
>> +	PINCTRL_PIN(7, "gpio7"),
>> +	PINCTRL_PIN(8, "gpio8"),
>> +	PINCTRL_PIN(9, "gpio9"),
>> +	PINCTRL_PIN(10, "gpio10"),
>> +	PINCTRL_PIN(11, "gpio11"),
>> +	PINCTRL_PIN(12, "gpio12"),
>> +	PINCTRL_PIN(13, "gpio13"),
>> +	PINCTRL_PIN(14, "gpio14"),
>> +};
>> +
>> +static const char * const swr_tx_clk_groups[] = { "gpio0" };
>> +static const char * const swr_tx_data_groups[] = { "gpio1", "gpio2", "gpio14" };
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
>> +static const char * const i2s2_data_groups[] = { "gpio12", "gpio13" };
>> +
>> +static const struct lpi_pingroup sc7280_groups[] = {
>> +	LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
>> +	LPI_PINGROUP(1, 2, swr_tx_data, qua_mi2s_ws, _, _),
>> +	LPI_PINGROUP(2, 4, swr_tx_data, qua_mi2s_data, _, _),
>> +	LPI_PINGROUP(3, 8, swr_rx_clk, qua_mi2s_data, _, _),
>> +	LPI_PINGROUP(4, 10, swr_rx_data, qua_mi2s_data, _, _),
>> +	LPI_PINGROUP(5, 12, swr_rx_data, _, _, _),
>> +	LPI_PINGROUP(6, NO_SLEW, dmic1_clk, i2s1_clk, _,  _),
>> +	LPI_PINGROUP(7, NO_SLEW, dmic1_data, i2s1_ws, _, _),
>> +	LPI_PINGROUP(8, NO_SLEW, dmic2_clk, i2s1_data, _, _),
>> +	LPI_PINGROUP(9, NO_SLEW, dmic2_data, i2s1_data, _, _),
>> +	LPI_PINGROUP(10, 16, i2s2_clk, wsa_swr_clk, _, _),
>> +	LPI_PINGROUP(11, 18, i2s2_ws, wsa_swr_data, _, _),
>> +	LPI_PINGROUP(12, NO_SLEW, dmic3_clk, i2s2_data, _, _),
>> +	LPI_PINGROUP(13, NO_SLEW, dmic3_data, i2s2_data, _, _),
>> +	LPI_PINGROUP(14, 6, swr_tx_data, _, _, _),
>> +};
>> +
>> +static const struct lpi_function sc7280_functions[] = {
>> +	LPI_FUNCTION(dmic1_clk),
>> +	LPI_FUNCTION(dmic1_data),
>> +	LPI_FUNCTION(dmic2_clk),
>> +	LPI_FUNCTION(dmic2_data),
>> +	LPI_FUNCTION(dmic3_clk),
>> +	LPI_FUNCTION(dmic3_data),
>> +	LPI_FUNCTION(i2s1_clk),
>> +	LPI_FUNCTION(i2s1_data),
>> +	LPI_FUNCTION(i2s1_ws),
>> +	LPI_FUNCTION(i2s2_clk),
>> +	LPI_FUNCTION(i2s2_data),
>> +	LPI_FUNCTION(i2s2_ws),
>> +	LPI_FUNCTION(qua_mi2s_data),
>> +	LPI_FUNCTION(qua_mi2s_sclk),
>> +	LPI_FUNCTION(qua_mi2s_ws),
>> +	LPI_FUNCTION(swr_rx_clk),
>> +	LPI_FUNCTION(swr_rx_data),
>> +	LPI_FUNCTION(swr_tx_clk),
>> +	LPI_FUNCTION(swr_tx_data),
>> +	LPI_FUNCTION(wsa_swr_clk),
>> +	LPI_FUNCTION(wsa_swr_data),
>> +};
>> +
>> +static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {
>> +	.pins = sc7280_lpi_pins,
>> +	.npins = ARRAY_SIZE(sc7280_lpi_pins),
>> +	.groups = sc7280_groups,
>> +	.ngroups = ARRAY_SIZE(sc7280_groups),
>> +	.functions = sc7280_functions,
>> +	.nfunctions = ARRAY_SIZE(sc7280_functions),
>> +};
>> +
>> +static const struct of_device_id lpi_pinctrl_of_match[] = {
>> +	{
>> +	       .compatible = "qcom,sc7280-lpass-lpi-pinctrl",
>> +	       .data = &sc7280_lpi_data,
>> +	},
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>> +
>> +static struct platform_driver lpi_pinctrl_driver = {
>> +	.driver = {
>> +		   .name = "qcom-sc7280-lpass-lpi-pinctrl",
>> +		   .of_match_table = lpi_pinctrl_of_match,
>> +	},
>> +	.probe = lpi_pinctrl_probe,
>> +	.remove = lpi_pinctrl_remove,
>> +};
>> +
>> +module_platform_driver(lpi_pinctrl_driver);
>> +MODULE_DESCRIPTION("QTI SC7280 LPI GPIO pin control driver");
>> +MODULE_LICENSE("GPL");
>> +
>> -- 
>> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
>> is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

