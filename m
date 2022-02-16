Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0DB4B7FF6
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 06:15:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6320916FA;
	Wed, 16 Feb 2022 06:15:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6320916FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644988557;
	bh=yhXlAOHBQ1qwE9VEoSYTwMP1F+8Qe9BUSgpIA9/AGZ4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aNC0LbQ6QD+M3PvrBx9FcMt0K1+xblxfXQStgaGwf4M73UTshj0yDMUwkn/cSiVuK
	 MQO+4IYYMohpaAhzu0FLFDapkrHaId/9XjZ0WTGooxeyRwJtrtU7CC8r82FB4yDtBQ
	 mmytrnqd6CdNm0UWcWDis/qlxYKe0KzzoV72vBpE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9DC6F8012E;
	Wed, 16 Feb 2022 06:14:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2A4BF80128; Wed, 16 Feb 2022 06:14:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A15EF800C0
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 06:14:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A15EF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="anhgRD2w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644988484; x=1676524484;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ylavwFYQD6KGHhXFsIL//yJI76kYPD2M2lrrfVfYUGw=;
 b=anhgRD2wahskLrkf14k0kcOdGFCXuEQwdc5yY0edn5xM8KmYjnRXXHYF
 XDqN0aYsLK2Yl5/CpT2TbvNHaGvOlyBFaMRWOGTAKvNuXu7bi0oVVAeTM
 lwoTROozFRHBNAMjnVAQQY7hRtHEH+aP97Sz+ezkGw2eSUk3XXrj7qcUv 4=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 15 Feb 2022 21:14:40 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 21:14:33 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 15 Feb 2022 21:14:32 -0800
Received: from [10.216.55.237] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 15 Feb
 2022 21:14:27 -0800
Subject: Re: [RESEND v13 05/10] ASoC: qcom: Add register definition for codec
 rddma and wrdma
To: Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
 <alsa-devel@alsa-project.org>, <bgoswami@codeaurora.org>,
 <bjorn.andersson@linaro.org>, <broonie@kernel.org>,
 <devicetree@vger.kernel.org>, <judyhsiao@chromium.org>,
 <lgirdwood@gmail.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <perex@perex.cz>, <quic_plai@quicinc.com>,
 <robh+dt@kernel.org>, <rohitkr@codeaurora.org>,
 <srinivas.kandagatla@linaro.org>, <tiwai@suse.com>
References: <1644850708-11099-1-git-send-email-quic_srivasam@quicinc.com>
 <1644850708-11099-6-git-send-email-quic_srivasam@quicinc.com>
 <CAE-0n53iKwT8u=d2KG5KX8fJgFs1JhTnaGCfG=OLarhvLdmf3Q@mail.gmail.com>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
Message-ID: <13d0bb5c-4f63-12a0-3c2c-c2d0e0211026@quicinc.com>
Date: Wed, 16 Feb 2022 10:44:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n53iKwT8u=d2KG5KX8fJgFs1JhTnaGCfG=OLarhvLdmf3Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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


On 2/15/2022 6:42 AM, Stephen Boyd wrote:
Thanks for your time Stephen!!!
> Quoting Srinivasa Rao Mandadapu (2022-02-14 06:58:23)
>> This patch adds register definitions for codec read dma and write dma
>   git grep "This patch" -- Documentation/process/
Okay. Will remove and reword the commit message.
>
>> lpass interface.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
>> index 7cc3763..e059c4a 100644
>> --- a/sound/soc/qcom/lpass.h
>> +++ b/sound/soc/qcom/lpass.h
>> @@ -39,6 +39,29 @@
>>                          return -EINVAL;         \
>>          } while (0)
>>
>> +static inline bool is_cdc_dma_port(int dai_id)
>> +{
>> +       switch (dai_id) {
>> +       case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
>> +       case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
>> +       case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
>> +               return true;
>> +       default:
> Drop case
Okay. will remove it.
>
>> +               return false;
>> +       }
> return false;
>
> would be shorter.
Okay. will change it.
>
>> +}
>> +
>> +static inline bool is_rxtx_cdc_dma_port(int dai_id)
>> +{
>> +       switch (dai_id) {
>> +       case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
>> +       case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
>> +               return true;
>> +       default:
>> +               return false;
>> +       }
> Same.
Okay.
>
>> +}
>> +
>>   struct lpaif_i2sctl {
>>          struct regmap_field *loopback;
>>          struct regmap_field *spken;
