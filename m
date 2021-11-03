Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEC9444084
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Nov 2021 12:24:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B89816A0;
	Wed,  3 Nov 2021 12:23:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B89816A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635938653;
	bh=peIGgMOS8Eyx4No9ojsTVcq8XExIADU4LKYc/zQnX1s=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f3sQ2jZ/8bslAczAZcpcSRsgRMmX9/eLeU8c8ooGg7LblcqIrdKp1G2u+HBis/0Yf
	 3yK1lStl+k3Rvc8gC/JmMTl1syOtT678vt7bt6LFt+1xuGnT2/Iadu90PfKy3mBb9R
	 MaFQsynoP67zjcKbbPKXplcZuDdI61d4HYOX/0kE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FE40F804C3;
	Wed,  3 Nov 2021 12:22:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B50CF80224; Wed,  3 Nov 2021 12:22:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEC15F80224
 for <alsa-devel@alsa-project.org>; Wed,  3 Nov 2021 12:22:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEC15F80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="naqXJPRv"
Received: by mail-wr1-x430.google.com with SMTP id d3so3001959wrh.8
 for <alsa-devel@alsa-project.org>; Wed, 03 Nov 2021 04:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xvRy8189/PatcFWb8Yj/D891VzazaAXtP9HMgX8A0nQ=;
 b=naqXJPRvnK8bF3PMFmomTuXyKAPAzSb0z3wTSm+JnP3wBYNZrAlLSTN/xBFG4dVRuR
 d7lc74EFavOnu/pS3MZAqMprJuKoBK6907WaCb196MBtGV/zBxbGBdR37FjzSR9Eu27W
 uyX5G/70gmxypyQgWaRa74qQu1GhZoRlDFll64L09HyC9uXZyNk0c1cAnCtfhymU0WKC
 kh5qOWQMUZ4T6/3T6Et09TlXSFTulSIS6WtbYWGQa2w87XRqEaL+5nd9VQdD4YTL/zyv
 79joWDIbfMq0BmW4W/KLIrNC9moK2QfEYa3s+6Oi2AYExnDU+eiwatJQvbd4nEWsim2R
 lm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xvRy8189/PatcFWb8Yj/D891VzazaAXtP9HMgX8A0nQ=;
 b=JK318hDJo/efT/S8eJy/jF4zUzXbIci+cNmslr7AvLH2HX99NaEyjjQ1sR7AT4oGds
 7hXhDsKNO+SgryyING66DH2fe4KEF0Mxa3aj0WWe/ReV87WeSOiZ50+gTHnUt21+ukBu
 B4dtpx45ZV2PMeISCZ1yuaiVpL9BUjJj1tIqgkWWaYxOiaUZQ9dFWqakW2vk1V1ceeKb
 4MbZjKZCnExqsCdTTMO4ODD0midwMawSn/WCoogUTWJhD++Cei3ZjyYPsLUTmjZ7EokS
 +tjKa8L2FQA4MDAoTacxmoZcqpCZINzNIi+f/tFOvnYVWBfWk2Mhlv3cAPE0BNY4Hquq
 qRHQ==
X-Gm-Message-State: AOAM531yoSSHlHFtgu8S+MsGSZsvkE8d0fWFFEHjHO1uHHtNrmoIKFeM
 duo/uk6+5aomOzUMSikMimQQjw==
X-Google-Smtp-Source: ABdhPJyXWkbG6Ra2Pj7zQiEQ3L/R/kN0TUGvlv9OSMWlLRmWllNCm16kbG0h+J29Us/K5UXaXMuEjg==
X-Received: by 2002:adf:df0b:: with SMTP id y11mr30942648wrl.181.1635938542002; 
 Wed, 03 Nov 2021 04:22:22 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id k37sm1591933wms.21.2021.11.03.04.22.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 04:22:21 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] pinctrl: qcom: Add SC7280 lpass pin configuration
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1635342097-2726-1-git-send-email-srivasam@codeaurora.org>
 <1635342097-2726-4-git-send-email-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <3a05fc62-a060-3257-ad54-53e376763fe3@linaro.org>
Date: Wed, 3 Nov 2021 11:22:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1635342097-2726-4-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Thanks Srinivasa for the patches.

On 27/10/2021 14:41, Srinivasa Rao Mandadapu wrote:
> Update pin control support for SC7280 LPASS LPI.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> ---
>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 40 ++++++++++++++++++++++++++++++++
>   1 file changed, 40 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> index 0bd0c16..17a05a6 100644
> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> @@ -122,6 +122,7 @@ static const struct pinctrl_pin_desc lpass_lpi_pins[] = {
>   	PINCTRL_PIN(11, "gpio11"),
>   	PINCTRL_PIN(12, "gpio12"),
>   	PINCTRL_PIN(13, "gpio13"),
> +	PINCTRL_PIN(14, "gpio14"),

I see your point in first patch making these names more generic, but 
this is not really going to work, as the above line just added new pin 
for sm8250 even though it really only has 0-13 pins.

I think it would be more clear if you could just make a dedicated 
structures for sc7280. Simillar comments apply for other changes too.

Other than that the patch looks good to me.

--srini

>   };
>   
>   enum lpass_lpi_functions {
> @@ -136,6 +137,7 @@ enum lpass_lpi_functions {
>   	LPI_MUX_i2s1_ws,
>   	LPI_MUX_i2s2_clk,
>   	LPI_MUX_i2s2_data,
> +	LPI_MUX_sc7280_i2s2_data,
>   	LPI_MUX_i2s2_ws,
>   	LPI_MUX_qua_mi2s_data,
>   	LPI_MUX_qua_mi2s_sclk,
> @@ -144,6 +146,7 @@ enum lpass_lpi_functions {
>   	LPI_MUX_swr_rx_data,
>   	LPI_MUX_swr_tx_clk,
>   	LPI_MUX_swr_tx_data,
> +	LPI_MUX_sc7280_swr_tx_data,
>   	LPI_MUX_wsa_swr_clk,
>   	LPI_MUX_wsa_swr_data,
>   	LPI_MUX_gpio,
> @@ -164,8 +167,11 @@ static const unsigned int gpio10_pins[] = { 10 };
>   static const unsigned int gpio11_pins[] = { 11 };
>   static const unsigned int gpio12_pins[] = { 12 };
>   static const unsigned int gpio13_pins[] = { 13 };
> +static const unsigned int gpio14_pins[] = { 14 };
> +
>   static const char * const swr_tx_clk_groups[] = { "gpio0" };
>   static const char * const swr_tx_data_groups[] = { "gpio1", "gpio2", "gpio5" };
> +static const char * const sc7280_swr_tx_data_groups[] = { "gpio1", "gpio2", "gpio14" };
>   static const char * const swr_rx_clk_groups[] = { "gpio3" };
>   static const char * const swr_rx_data_groups[] = { "gpio4", "gpio5" };
>   static const char * const dmic1_clk_groups[] = { "gpio6" };
> @@ -185,6 +191,7 @@ static const char * const i2s1_data_groups[] = { "gpio8", "gpio9" };
>   static const char * const wsa_swr_clk_groups[] = { "gpio10" };
>   static const char * const wsa_swr_data_groups[] = { "gpio11" };
>   static const char * const i2s2_data_groups[] = { "gpio12", "gpio12" };
> +static const char * const sc7280_i2s2_data_groups[] = { "gpio12", "gpio13" };
>   
>   static const struct lpi_pingroup sm8250_groups[] = {
>   	LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
> @@ -203,6 +210,24 @@ static const struct lpi_pingroup sm8250_groups[] = {
>   	LPI_PINGROUP(13, NO_SLEW, dmic3_data, i2s2_data, _, _),
>   };
>   
> +static const struct lpi_pingroup sc7280_groups[] = {
> +	LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
> +	LPI_PINGROUP(1, 2, swr_tx_data, qua_mi2s_ws, _, _),
> +	LPI_PINGROUP(2, 4, swr_tx_data, qua_mi2s_data, _, _),
> +	LPI_PINGROUP(3, 8, swr_rx_clk, qua_mi2s_data, _, _),
> +	LPI_PINGROUP(4, 10, swr_rx_data, qua_mi2s_data, _, _),
> +	LPI_PINGROUP(5, 12, swr_rx_data, _, _, _),
> +	LPI_PINGROUP(6, NO_SLEW, dmic1_clk, i2s1_clk, _,  _),
> +	LPI_PINGROUP(7, NO_SLEW, dmic1_data, i2s1_ws, _, _),
> +	LPI_PINGROUP(8, NO_SLEW, dmic2_clk, i2s1_data, _, _),
> +	LPI_PINGROUP(9, NO_SLEW, dmic2_data, i2s1_data, _, _),
> +	LPI_PINGROUP(10, 16, i2s2_clk, wsa_swr_clk, _, _),
> +	LPI_PINGROUP(11, 18, i2s2_ws, wsa_swr_data, _, _),
> +	LPI_PINGROUP(12, NO_SLEW, dmic3_clk, sc7280_i2s2_data, _, _),
> +	LPI_PINGROUP(13, NO_SLEW, dmic3_data, sc7280_i2s2_data, _, _),
> +	LPI_PINGROUP(14, 6, sc7280_swr_tx_data, _, _, _),
> +};
> +
>   static const struct lpi_function lpass_functions[] = {
>   	LPI_FUNCTION(dmic1_clk),
>   	LPI_FUNCTION(dmic1_data),
> @@ -215,6 +240,7 @@ static const struct lpi_function lpass_functions[] = {
>   	LPI_FUNCTION(i2s1_ws),
>   	LPI_FUNCTION(i2s2_clk),
>   	LPI_FUNCTION(i2s2_data),
> +	LPI_FUNCTION(sc7280_i2s2_data),
>   	LPI_FUNCTION(i2s2_ws),
>   	LPI_FUNCTION(qua_mi2s_data),
>   	LPI_FUNCTION(qua_mi2s_sclk),
> @@ -223,6 +249,7 @@ static const struct lpi_function lpass_functions[] = {
>   	LPI_FUNCTION(swr_rx_data),
>   	LPI_FUNCTION(swr_tx_clk),
>   	LPI_FUNCTION(swr_tx_data),
> +	LPI_FUNCTION(sc7280_swr_tx_data),
>   	LPI_FUNCTION(wsa_swr_clk),
>   	LPI_FUNCTION(wsa_swr_data),
>   };
> @@ -236,6 +263,15 @@ static struct lpi_pinctrl_variant_data sm8250_lpi_data = {
>   	.nfunctions = ARRAY_SIZE(lpass_functions),
>   };
>   
> +static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {
> +	.pins = lpass_lpi_pins,
> +	.npins = ARRAY_SIZE(lpass_lpi_pins),
> +	.groups = sc7280_groups,
> +	.ngroups = ARRAY_SIZE(sc7280_groups),
> +	.functions = lpass_functions,
> +	.nfunctions = ARRAY_SIZE(lpass_functions),
> +};
> +
>   static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
>   			 unsigned int addr)
>   {
> @@ -677,6 +713,10 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>   	       .compatible = "qcom,sm8250-lpass-lpi-pinctrl",
>   	       .data = &sm8250_lpi_data,
>   	},
> +	{
> +	       .compatible = "qcom,sc7280-lpass-lpi-pinctrl",
> +	       .data = &sc7280_lpi_data,
> +	},
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
> 
