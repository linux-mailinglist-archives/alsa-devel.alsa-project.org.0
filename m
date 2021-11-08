Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 513F9447D3E
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Nov 2021 11:02:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AED581684;
	Mon,  8 Nov 2021 11:02:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AED581684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636365773;
	bh=Bm/3d6u5tHfeZWKzUdtUtUvDhEreBTTHzkDS0NR2g8A=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k36z4gd6S5Df5e6ST4s22zbdX07zc5WfoBiRiBVeVZdWrZPiDdrUTd6NaFR7Uw2XT
	 mm9XpEBZjxwuN0UXAqIhsP5+mq7TxSYKMJMvxTA1KQa1hdzYRdE7YlkOxYGRA4aBA/
	 YR7chSA0xDJWrVyQXBfAqhNstFcsOeOZTp0GO+OE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AB66F8007E;
	Mon,  8 Nov 2021 11:01:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CCCAF8049E; Mon,  8 Nov 2021 11:01:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32884F8007E
 for <alsa-devel@alsa-project.org>; Mon,  8 Nov 2021 11:01:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32884F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="Qc9dcOHR"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636365687; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=0l+Axwex3km/18zRKU/2t97iNvhS734FDSfeO1OvkLA=;
 b=Qc9dcOHRFOAtTyoGZ8a+oqgHfqF3IzULNl8V1jDtudYj4umG2A4MBN+Gdd1a3QSC48vkutXI
 7PnMbaXegHOLFJQ95u3og5AZflseUHQWV7C3g8NP3v9WOkhAACgmsTuOHFb1FY1TDKnrgGg0
 ezXhFxyXpJhDxohbN4DAtEPpjkc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6188f5726b778b5a1907ca7d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 08 Nov 2021 10:01:22
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1DA58C43635; Mon,  8 Nov 2021 10:01:21 +0000 (UTC)
Received: from [10.242.143.72] (unknown [202.46.23.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 73DEEC4360D;
 Mon,  8 Nov 2021 10:01:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 73DEEC4360D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v2 3/3] pinctrl: qcom: Add SC7280 lpass pin configuration
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1635342097-2726-1-git-send-email-srivasam@codeaurora.org>
 <1635342097-2726-4-git-send-email-srivasam@codeaurora.org>
 <3a05fc62-a060-3257-ad54-53e376763fe3@linaro.org>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <54ab2532-a0d5-a04f-0f8c-2ce11fdf973e@codeaurora.org>
Date: Mon, 8 Nov 2021 15:31:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <3a05fc62-a060-3257-ad54-53e376763fe3@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>
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


On 11/3/2021 4:52 PM, Srinivas Kandagatla wrote:
Thanks Srini for your TIme!!!
> Thanks Srinivasa for the patches.
>
> On 27/10/2021 14:41, Srinivasa Rao Mandadapu wrote:
>> Update pin control support for SC7280 LPASS LPI.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>> ---
>>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 40 
>> ++++++++++++++++++++++++++++++++
>>   1 file changed, 40 insertions(+)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c 
>> b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> index 0bd0c16..17a05a6 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> @@ -122,6 +122,7 @@ static const struct pinctrl_pin_desc 
>> lpass_lpi_pins[] = {
>>       PINCTRL_PIN(11, "gpio11"),
>>       PINCTRL_PIN(12, "gpio12"),
>>       PINCTRL_PIN(13, "gpio13"),
>> +    PINCTRL_PIN(14, "gpio14"),
>
> I see your point in first patch making these names more generic, but 
> this is not really going to work, as the above line just added new pin 
> for sm8250 even though it really only has 0-13 pins.
>
> I think it would be more clear if you could just make a dedicated 
> structures for sc7280. Simillar comments apply for other changes too.
>
> Other than that the patch looks good to me.
>
> --srini

Okay. agree to your point. As lpass_lpi_pins array is just declaration, 
and it will be used in functions, I thought it won't impact as functions 
are different for both architectures.

With your feedback understood that it may not work existing archs. Will 
change accordingly and re-post it.

>
>>   };
>>     enum lpass_lpi_functions {
>> @@ -136,6 +137,7 @@ enum lpass_lpi_functions {
>>       LPI_MUX_i2s1_ws,
>>       LPI_MUX_i2s2_clk,
>>       LPI_MUX_i2s2_data,
>> +    LPI_MUX_sc7280_i2s2_data,
>>       LPI_MUX_i2s2_ws,
>>       LPI_MUX_qua_mi2s_data,
>>       LPI_MUX_qua_mi2s_sclk,
>> @@ -144,6 +146,7 @@ enum lpass_lpi_functions {
>>       LPI_MUX_swr_rx_data,
>>       LPI_MUX_swr_tx_clk,
>>       LPI_MUX_swr_tx_data,
>> +    LPI_MUX_sc7280_swr_tx_data,
>>       LPI_MUX_wsa_swr_clk,
>>       LPI_MUX_wsa_swr_data,
>>       LPI_MUX_gpio,
>> @@ -164,8 +167,11 @@ static const unsigned int gpio10_pins[] = { 10 };
>>   static const unsigned int gpio11_pins[] = { 11 };
>>   static const unsigned int gpio12_pins[] = { 12 };
>>   static const unsigned int gpio13_pins[] = { 13 };
>> +static const unsigned int gpio14_pins[] = { 14 };
>> +
>>   static const char * const swr_tx_clk_groups[] = { "gpio0" };
>>   static const char * const swr_tx_data_groups[] = { "gpio1", 
>> "gpio2", "gpio5" };
>> +static const char * const sc7280_swr_tx_data_groups[] = { "gpio1", 
>> "gpio2", "gpio14" };
>>   static const char * const swr_rx_clk_groups[] = { "gpio3" };
>>   static const char * const swr_rx_data_groups[] = { "gpio4", "gpio5" };
>>   static const char * const dmic1_clk_groups[] = { "gpio6" };
>> @@ -185,6 +191,7 @@ static const char * const i2s1_data_groups[] = { 
>> "gpio8", "gpio9" };
>>   static const char * const wsa_swr_clk_groups[] = { "gpio10" };
>>   static const char * const wsa_swr_data_groups[] = { "gpio11" };
>>   static const char * const i2s2_data_groups[] = { "gpio12", "gpio12" };
>> +static const char * const sc7280_i2s2_data_groups[] = { "gpio12", 
>> "gpio13" };
>>     static const struct lpi_pingroup sm8250_groups[] = {
>>       LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
>> @@ -203,6 +210,24 @@ static const struct lpi_pingroup sm8250_groups[] 
>> = {
>>       LPI_PINGROUP(13, NO_SLEW, dmic3_data, i2s2_data, _, _),
>>   };
>>   +static const struct lpi_pingroup sc7280_groups[] = {
>> +    LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
>> +    LPI_PINGROUP(1, 2, swr_tx_data, qua_mi2s_ws, _, _),
>> +    LPI_PINGROUP(2, 4, swr_tx_data, qua_mi2s_data, _, _),
>> +    LPI_PINGROUP(3, 8, swr_rx_clk, qua_mi2s_data, _, _),
>> +    LPI_PINGROUP(4, 10, swr_rx_data, qua_mi2s_data, _, _),
>> +    LPI_PINGROUP(5, 12, swr_rx_data, _, _, _),
>> +    LPI_PINGROUP(6, NO_SLEW, dmic1_clk, i2s1_clk, _,  _),
>> +    LPI_PINGROUP(7, NO_SLEW, dmic1_data, i2s1_ws, _, _),
>> +    LPI_PINGROUP(8, NO_SLEW, dmic2_clk, i2s1_data, _, _),
>> +    LPI_PINGROUP(9, NO_SLEW, dmic2_data, i2s1_data, _, _),
>> +    LPI_PINGROUP(10, 16, i2s2_clk, wsa_swr_clk, _, _),
>> +    LPI_PINGROUP(11, 18, i2s2_ws, wsa_swr_data, _, _),
>> +    LPI_PINGROUP(12, NO_SLEW, dmic3_clk, sc7280_i2s2_data, _, _),
>> +    LPI_PINGROUP(13, NO_SLEW, dmic3_data, sc7280_i2s2_data, _, _),
>> +    LPI_PINGROUP(14, 6, sc7280_swr_tx_data, _, _, _),
>> +};
>> +
>>   static const struct lpi_function lpass_functions[] = {
>>       LPI_FUNCTION(dmic1_clk),
>>       LPI_FUNCTION(dmic1_data),
>> @@ -215,6 +240,7 @@ static const struct lpi_function 
>> lpass_functions[] = {
>>       LPI_FUNCTION(i2s1_ws),
>>       LPI_FUNCTION(i2s2_clk),
>>       LPI_FUNCTION(i2s2_data),
>> +    LPI_FUNCTION(sc7280_i2s2_data),
>>       LPI_FUNCTION(i2s2_ws),
>>       LPI_FUNCTION(qua_mi2s_data),
>>       LPI_FUNCTION(qua_mi2s_sclk),
>> @@ -223,6 +249,7 @@ static const struct lpi_function 
>> lpass_functions[] = {
>>       LPI_FUNCTION(swr_rx_data),
>>       LPI_FUNCTION(swr_tx_clk),
>>       LPI_FUNCTION(swr_tx_data),
>> +    LPI_FUNCTION(sc7280_swr_tx_data),
>>       LPI_FUNCTION(wsa_swr_clk),
>>       LPI_FUNCTION(wsa_swr_data),
>>   };
>> @@ -236,6 +263,15 @@ static struct lpi_pinctrl_variant_data 
>> sm8250_lpi_data = {
>>       .nfunctions = ARRAY_SIZE(lpass_functions),
>>   };
>>   +static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {
>> +    .pins = lpass_lpi_pins,
>> +    .npins = ARRAY_SIZE(lpass_lpi_pins),
>> +    .groups = sc7280_groups,
>> +    .ngroups = ARRAY_SIZE(sc7280_groups),
>> +    .functions = lpass_functions,
>> +    .nfunctions = ARRAY_SIZE(lpass_functions),
>> +};
>> +
>>   static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
>>                unsigned int addr)
>>   {
>> @@ -677,6 +713,10 @@ static const struct of_device_id 
>> lpi_pinctrl_of_match[] = {
>>              .compatible = "qcom,sm8250-lpass-lpi-pinctrl",
>>              .data = &sm8250_lpi_data,
>>       },
>> +    {
>> +           .compatible = "qcom,sc7280-lpass-lpi-pinctrl",
>> +           .data = &sc7280_lpi_data,
>> +    },
>>       { }
>>   };
>>   MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

