Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1345F54631F
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 12:06:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B203F1A43;
	Fri, 10 Jun 2022 12:05:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B203F1A43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654855559;
	bh=aIFIew+Yau01V1IDNrrIlj6EGRJGB0DuPdbXbFjR+Uw=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=llkNMLpe9Gz8pR7Fv1V0/fo8Xr2izBeZHrElgL+bA+vMyjey3/DrQABbn87EhWd2R
	 +1/uxG+Tk3pPZLljfjd/zACvEf3TNb/RD7YTSxhJPVrUcx0kNJK75jzYz7/69xU4f1
	 5N/91KKhjrDCkxF0F1OYSCTomTc6hHvkH1GRQiBU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 423BFF800E5;
	Fri, 10 Jun 2022 12:05:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEACAF804D2; Fri, 10 Jun 2022 12:04:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9710F800C7
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 12:04:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9710F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="UlHAciK6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654855494; x=1686391494;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=wM8AR7EF4KqQEH54DYTVZVfCtuLjTuQvtuihUj3UHdY=;
 b=UlHAciK6SnS1vpG2BOkBUvy9dXgecuL+lFJCpsqh48guDuQVFmDsMMmv
 8MLB0aiPtyY3Qlwamh+I/BSiYBA+W7kkOoiE+E210ntuaOiFqrVHrXDPs
 91p+XizV2vj4GOvzRINpzane5XccJ2kq5p/Kc2d0xcAjC1LTRn6ItbUk4 Q=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 10 Jun 2022 03:04:50 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 03:04:49 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 10 Jun 2022 03:04:48 -0700
Received: from [10.216.33.153] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 10 Jun
 2022 03:04:42 -0700
Message-ID: <70631864-ff95-5c73-64ed-602774eb0de7@quicinc.com>
Date: Fri, 10 Jun 2022 15:34:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v4 1/2] soundwire: qcom: Add flag for software clock
 gating check
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@quicinc.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <quic_rohkumar@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>, <vkoul@kernel.org>
References: <1654785023-1667-1-git-send-email-quic_srivasam@quicinc.com>
 <1654785023-1667-2-git-send-email-quic_srivasam@quicinc.com>
 <97757ee1-2525-4e97-855e-da6fb66f01ae@linux.intel.com>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <97757ee1-2525-4e97-855e-da6fb66f01ae@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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


On 6/9/2022 8:52 PM, Pierre-Louis Bossart wrote:
Thanks for your time Pierre-Louis!!!
>
> On 6/9/22 09:30, Srinivasa Rao Mandadapu wrote:
>> Validate software clock gating required or not and do software
>> clock gating on hclk if soundwire is operational and keep it
>> running by adding flag in private data structure.
>> This is to avoid conflict between older architectures,
>> where software clock gating is not required and on latest
>> architectues, where software clock gating is mandatory.
> architectures.
Okay. Will fix it.
>
>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   drivers/soundwire/qcom.c | 14 ++++++++++----
>>   1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>> index a3fccf0..8e163da 100644
>> --- a/drivers/soundwire/qcom.c
>> +++ b/drivers/soundwire/qcom.c
>> @@ -181,6 +181,7 @@ struct qcom_swrm_ctrl {
>>   struct qcom_swrm_data {
>>   	u32 default_cols;
>>   	u32 default_rows;
>> +	bool sw_clk_gate_required;
>>   };
>>   
>>   static const struct qcom_swrm_data swrm_v1_3_data = {
>> @@ -1311,6 +1312,15 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>>   			return PTR_ERR(ctrl->mmio);
>>   	}
>>   
>> +	if (data->sw_clk_gate_required) {
>> +		ctrl->audio_cgcr = devm_reset_control_get_exclusive(dev, "swr_audio_cgcr");
>> +		if (IS_ERR(ctrl->audio_cgcr)) {
> You need to handle the NULL case, devm_reset_control_get_exclusive() can
> return ERR_OR_NULL
>
> https://elixir.bootlin.com/linux/latest/source/drivers/reset/core.c#L1045
Okay. Will change accordingly.
>
>> +			dev_err(dev, "Failed to get cgcr reset ctrl required for SW gating\n");
>> +			ret = PTR_ERR(ctrl->audio_cgcr);
>> +			goto err_init;
>> +		}
>> +	}
>> +
>>   	ctrl->irq = of_irq_get(dev->of_node, 0);
>>   	if (ctrl->irq < 0) {
>>   		ret = ctrl->irq;
>> @@ -1336,10 +1346,6 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>>   	ctrl->bus.compute_params = &qcom_swrm_compute_params;
>>   	ctrl->bus.clk_stop_timeout = 300;
>>   
>> -	ctrl->audio_cgcr = devm_reset_control_get_exclusive(dev, "swr_audio_cgcr");
>> -	if (IS_ERR(ctrl->audio_cgcr))
>> -		dev_err(dev, "Failed to get audio_cgcr reset required for soundwire-v1.6.0\n");
>> -
>>   	ret = qcom_swrm_get_port_config(ctrl);
>>   	if (ret)
>>   		goto err_clk;
