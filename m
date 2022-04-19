Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5265067E0
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 11:40:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF5311742;
	Tue, 19 Apr 2022 11:39:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF5311742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650361240;
	bh=BjzTAFsi9P1hz8LmlKUOT6u6DqVOGjcqaziaV+5QqNE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TczFTUV8J6ItoqFjZhaXWbdjGWn2utwW9J0I18G+qkYKxGcBg+CMLFhSeR+GADrNR
	 8MIc6xXUnua2rBFzcsWR2MYQOHimDI6CAOXxUY52/x/CqvIfQpZUVE8ztyXYxgqdM2
	 LxJu8hbtDOToq79S4ure0iUGaSXiUUg2zVPNLigk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20981F80269;
	Tue, 19 Apr 2022 11:39:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED1A9F8025D; Tue, 19 Apr 2022 11:39:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53317F80116
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 11:39:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53317F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="XtU9qABY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650361176; x=1681897176;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wVJ9UhjrH0Z/VNjIO0QK3Ri+9clE9QiJj3Vxp/R+xgg=;
 b=XtU9qABY/etAedXsBmvPuuKBJ/zefSxpzvrNE6YI0cS8VuKRlaIwumik
 mLhflqbDzyr+xWfopMk+bcvO+EWEdFxLTg9jdtXKIX4TwLFa6iBnHR8Nv
 S+ko4gPzEXWrOJ3lkusY99ctBs6TfIauXp3h0d1lZ9xf/+KlXi5BVZUkZ A=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 19 Apr 2022 02:39:32 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 02:39:21 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 19 Apr 2022 02:39:19 -0700
Received: from [10.216.20.240] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 19 Apr
 2022 02:39:13 -0700
Message-ID: <de6581e4-f894-6833-bb39-f5830013f7b6@quicinc.com>
Date: Tue, 19 Apr 2022 15:09:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] ASoC: qcom: SC7280: Update machine driver startup,
 shutdown callbacks
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, <agross@kernel.org>, 
 <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>, 
 <robh+dt@kernel.org>, <quic_plai@quicinc.com>, <bgoswami@quicinc.com>,
 <perex@perex.cz>, <tiwai@suse.com>, <quic_rohkumar@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>
References: <1650352619-17370-1-git-send-email-quic_srivasam@quicinc.com>
 <102ad140-dc26-d266-a716-4e22003ec601@linaro.org>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <102ad140-dc26-d266-a716-4e22003ec601@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
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


On 4/19/2022 2:49 PM, Srinivas Kandagatla wrote:
Thanks for your time Srini!!
>
>
> On 19/04/2022 08:16, Srinivasa Rao Mandadapu wrote:
>> Update machine driver startup, shutdown callback functions to support
>> codec DMA paths. Without this change, platforms with WCD codec is 
>> failing
>> to register sound card.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>> ---
>>   sound/soc/qcom/sc7280.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/sound/soc/qcom/sc7280.c b/sound/soc/qcom/sc7280.c
>> index 4ef4034..d64df11 100644
>> --- a/sound/soc/qcom/sc7280.c
>> +++ b/sound/soc/qcom/sc7280.c
>> @@ -295,6 +295,10 @@ static void sc7280_snd_shutdown(struct 
>> snd_pcm_substream *substream)
>>           break;
>>       case LPASS_DP_RX:
>>           break;
>> +    case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
>> +    case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
>> +    case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
>> +        break;
>>       default:
>>           dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
>>               cpu_dai->id);
>
> Why not just make sc7280_snd_startup code like this:
>
> static int sc7280_snd_startup(struct snd_pcm_substream *substream)
> {
>     struct snd_soc_pcm_runtime *rtd = substream->private_data;
>     struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
>     int ret = 0;
>
>     switch (cpu_dai->id) {
>     case MI2S_PRIMARY:
>         ret = sc7280_rt5682_init(rtd);
>         break;
>     default:
>         break;
>     }
>     return ret;
> }
>
> and sc7280_snd_shutdown with something similar

Yes. we can do as you suggested. Then Shall I do it as fix to a commit?

i.e. c5198db ASoC: qcom: Add driver support for ALC5682I-VS

>
> --srini
>> @@ -316,6 +320,10 @@ static int sc7280_snd_startup(struct 
>> snd_pcm_substream *substream)
>>           break;
>>       case LPASS_DP_RX:
>>           break;
>> +    case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
>> +    case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
>> +    case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
>> +        break;
>>       default:
>>           dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
>>               cpu_dai->id);
