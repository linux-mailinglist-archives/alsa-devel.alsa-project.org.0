Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C65A53A162
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jun 2022 11:58:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1F4916DD;
	Wed,  1 Jun 2022 11:57:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1F4916DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654077484;
	bh=ySqko9whvF07xTDthLkA4pK6j2/J4LoysCt2czmq5cg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lLi1US4bVubBON7zs+CUbaL0w++9oV1SavKoqWlzp2g+Bj6gq41rxVkyhGOWkcEpl
	 0Cakw1eURT+pgwJnBAVox9hifBj37Go5fzG/SvzRnhoNwszzHrhKX4jLsib7Qk0pCC
	 /Pb5jMDF3ICwnLQKGlnrYZ6iGdicX5Lo3cOig/Kg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BD76F800BD;
	Wed,  1 Jun 2022 11:57:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77876F80238; Wed,  1 Jun 2022 11:57:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0E82F80089
 for <alsa-devel@alsa-project.org>; Wed,  1 Jun 2022 11:56:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0E82F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="AhwlKQ8K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654077419; x=1685613419;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Rezegc47oD04NrEL7IdrsnJsfPKKiLWJ9Y6Vzv7ZuDI=;
 b=AhwlKQ8KbatjQkN8n38gpoJ1MgoU5sn2sSxog6a1ybWJ1tpydOaAaEDv
 ghY5rDXHLmj9rSmhbJoJrM40LO9HbkoW/E6ApGp/5w2Wj9Oj58KkMMzkn
 PKNrgmEBILRhnddOFyaxqgIMRkD4yeTV6n/jOOfRoDo4LP3JGemRViKTJ 4=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 01 Jun 2022 02:56:55 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 02:56:53 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 1 Jun 2022 02:56:53 -0700
Received: from [10.216.6.145] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 1 Jun 2022
 02:56:47 -0700
Message-ID: <26bfd089-46d6-d08d-efac-71ffc04f674c@quicinc.com>
Date: Wed, 1 Jun 2022 15:26:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 2/2] pinctrl: qcom: sc7280: Add lpi pinctrl variant data
 structure for adsp based targets
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <1651672580-18952-1-git-send-email-quic_srivasam@quicinc.com>
 <1651672580-18952-3-git-send-email-quic_srivasam@quicinc.com>
 <YoJrGGg0RviVn2Xj@ripper>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <YoJrGGg0RviVn2Xj@ripper>
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
 bgoswami@quicinc.com, quic_plai@quicinc.com, judyhsiao@chromium.org,
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


On 5/16/2022 8:47 PM, Bjorn Andersson wrote:
Thanks for Your time Bjorn!!!
> On Wed 04 May 06:56 PDT 2022, Srinivasa Rao Mandadapu wrote:
>
>> Add compatible string and lpi pinctrl variant data structure for adsp enabled
>> sc7280 platforms.
> This says what the change does, but gives no clue to what this
> compatible represents and why the clock is not optional.
>
> Could you please describe here what scenario this compatible is to be
> used for etc, so that when someone else adds support for the next
> platform they can use the git history to understand which case to
> follow.
>
> Thanks,
> Bjorn
Okay. Will update the commit message.
>
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
>>   	LPI_FUNCTION(wsa_swr_data),
>>   };
>>   
>> +static const struct lpi_pinctrl_variant_data sc7280_adsp_lpi_data = {
>> +	.pins = sc7280_lpi_pins,
>> +	.npins = ARRAY_SIZE(sc7280_lpi_pins),
>> +	.groups = sc7280_groups,
>> +	.ngroups = ARRAY_SIZE(sc7280_groups),
>> +	.functions = sc7280_functions,
>> +	.nfunctions = ARRAY_SIZE(sc7280_functions),
>> +	.is_clk_optional = false,
>> +};
>> +
>>   static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {
>>   	.pins = sc7280_lpi_pins,
>>   	.npins = ARRAY_SIZE(sc7280_lpi_pins),
>> @@ -149,6 +159,10 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>>   	       .compatible = "qcom,sc7280-lpass-lpi-pinctrl",
>>   	       .data = &sc7280_lpi_data,
>>   	},
>> +	{
>> +		.compatible = "qcom,sc7280-lpass-adsp-lpi-pinctrl",
>> +		.data = &sc7280_adsp_lpi_data,
>> +	},
>>   	{ }
>>   };
>>   MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>> -- 
>> 2.7.4
>>
