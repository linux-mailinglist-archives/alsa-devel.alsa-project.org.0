Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C89153C906
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 13:04:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7C7F1845;
	Fri,  3 Jun 2022 13:03:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7C7F1845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654254284;
	bh=aanQiDurE4JnyjF2jrSlI7odjGaiAuc86SEd7yiBWIg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LnBhCwjT6ReMc9uT/RqI7nzXWuSys02gDK9KCTpL9av0KrTTm6hF7wqbrSLBpHQuZ
	 JE1WMbAXNdRPXe3Qy4r+wSQ1W7h4dWWfoMlh/PbC4da8hiV7ffEHuuK1tMdO8kMv3P
	 SFRfKFlPgj/S7US3pC+9IOaJ64eqwHJlZojzVGFk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73E3FF804D1;
	Fri,  3 Jun 2022 13:03:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 726ADF804CC; Fri,  3 Jun 2022 13:03:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88CB6F800F5
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 13:03:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88CB6F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="MftGxfJ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654254216; x=1685790216;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KBAKvX9/GNCNqNjkKFmolG/8gDtP8L5C5SntjrMrokk=;
 b=MftGxfJ+G9CXam6WivL5XcnI05j7tyBOjjJOluh1Oyoc6YcZsy4VdXHW
 h2aEjReQBYWxVAGD/kLwuUsw1Cjp8HslIoP6+yPvueNDOhA20Qi5BVBTF
 lKdgi81jmMR5g1U8qVND6x6+HIbaN8PKjps0dt8azRAuu7XY88XyxItkd 0=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 03 Jun 2022 04:03:23 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2022 04:03:22 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 3 Jun 2022 04:03:21 -0700
Received: from [10.216.32.198] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 3 Jun 2022
 04:03:15 -0700
Message-ID: <a2b7de25-55a4-7d31-2787-be6d0ccf9500@quicinc.com>
Date: Fri, 3 Jun 2022 16:33:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: sc7280: Add lpi pinctrl variant
 data for adsp based targets
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
References: <1654079415-26217-1-git-send-email-quic_srivasam@quicinc.com>
 <1654079415-26217-3-git-send-email-quic_srivasam@quicinc.com>
 <CACRpkdYQW7WByaGoSFKT91OwRao_jJdCAbL0pUuj3vdS6TdkQg@mail.gmail.com>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <CACRpkdYQW7WByaGoSFKT91OwRao_jJdCAbL0pUuj3vdS6TdkQg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 linux-arm-msm@vger.kernel.org, swboyd@chromium.org, tiwai@suse.com,
 agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 linux-gpio@vger.kernel.org, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 bgoswami@quicinc.com, quic_plai@quicinc.com, bjorn.andersson@linaro.org,
 judyhsiao@chromium.org, linux-kernel@vger.kernel.org
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


On 6/3/2022 3:58 PM, Linus Walleij wrote:
Thanks for Your time and valuable inputs Linus!!!
> On Wed, Jun 1, 2022 at 12:30 PM Srinivasa Rao Mandadapu
> <quic_srivasam@quicinc.com> wrote:
>
> So one way to just use a propert and avoid more compatible strings:
>
>> Add compatible string and lpi pinctrl variant data structure for adsp
>> enabled sc7280 platforms.
>> This variant data structure rnd compatible name required for
>> distingushing ADSP based platforms and ADSP bypass platforms.
>> In case of ADSP enabled platforms, where audio is routed through ADSP
>> macro and decodec GDSC Switches are triggered as clocks by pinctrl
>> driver and ADSP firmware controls them. So It's mandatory to enable
>> them in ADSP based solutions.
>> In case of ADSP bypass platforms clock voting is optional as these macro
>> and dcodec GDSC switches are maintained as power domains and operated from
>> lpass clock drivers.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>> ---
>>   drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
>> index 2add9a4..c9e85d9 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
>> @@ -134,6 +134,16 @@ static const struct lpi_function sc7280_functions[] = {
>>          LPI_FUNCTION(wsa_swr_data),
>>   };
>>
>> +static const struct lpi_pinctrl_variant_data sc7280_adsp_lpi_data = {
> Remove static and export this struct in drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
We can remove entire data structure if my below approach is okay.
>
>> +       .pins = sc7280_lpi_pins,
>> +       .npins = ARRAY_SIZE(sc7280_lpi_pins),
>> +       .groups = sc7280_groups,
>> +       .ngroups = ARRAY_SIZE(sc7280_groups),
>> +       .functions = sc7280_functions,
>> +       .nfunctions = ARRAY_SIZE(sc7280_functions),
>> +       .is_clk_optional = false,
>> +};
>>
>>
>>   static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {
>>          .pins = sc7280_lpi_pins,
>>          .npins = ARRAY_SIZE(sc7280_lpi_pins),
>> @@ -149,6 +159,10 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>>                 .compatible = "qcom,sc7280-lpass-lpi-pinctrl",
>>                 .data = &sc7280_lpi_data,
>>          },
>> +       {
>> +               .compatible = "qcom,sc7280-lpass-adsp-lpi-pinctrl",
>> +               .data = &sc7280_adsp_lpi_data,
>> +       },
> Drop this and instead add some code in the probe()
> in drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> lines:
>
> if (of_device_is_compatible(np, "qcom,sc7280-lpass-lpi-pinctrl") &&
> of_property_read_bool(np, "qcom,adsp-mode))
>       data = &sc7280_adsp_lpi_data;

Here, only diff between ADSP and ADSP bypass variant dats is 
"is_clk_optional" field.

So we can keep something like this. Kindly suggest, if it's not making 
sense.

if (of_device_is_compatible(np, "qcom,sc7280-lpass-lpi-pinctrl") &&
of_property_read_bool(np, "qcom,adsp-mode))
      data->is_clk_optional = false;

>
> Yours,
> Linus Walleij
