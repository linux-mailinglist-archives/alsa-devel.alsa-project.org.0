Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 294254B7FCB
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 05:59:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B27FC174D;
	Wed, 16 Feb 2022 05:58:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B27FC174D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644987577;
	bh=e1qPSlC1j+S9zxbycLjPzyMWvzXISbiIPrrw4XBhsLI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tfSOLBELrrOrF9nfb4/k3yTbutDLdvEOARcb069ResF7XmXBF5deE1cEBY+8qrl0o
	 f6sIsGie9cA/lQLPA+CuINWZaQUJpzT5IZ2qnMyNC6cr4V1hEXZUMutfwxgodVPtgP
	 ICVybQqJp40Io8OO0rHz/TuXxzmpMraf+2IvMpnc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18CC3F8012E;
	Wed, 16 Feb 2022 05:58:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C86E7F80128; Wed, 16 Feb 2022 05:58:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B74DF800C0
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 05:58:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B74DF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="hWkSgZZv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644987504; x=1676523504;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=9hWDVImhK1Iwotogv2R90DiFeUKHg484m5QG3YbFP7A=;
 b=hWkSgZZvjHfsjPtQxz3ObI/TDFdlLADkYZ+gLrpNuxKx4bZ9RBW5KLAU
 6oX09ovt3evUGxQbwh2GmYShyXE5zQN09W+s691T28Xxwcjxrdbg5KM82
 +hKSi+9wwQPOwObYiHnOgRWsrr7lHEFY5tM8zIXZDalDmEwzor7vFaBep 4=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 15 Feb 2022 20:58:18 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 20:58:16 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 15 Feb 2022 20:58:16 -0800
Received: from [10.216.55.237] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 15 Feb
 2022 20:58:11 -0800
Subject: Re: [RESEND v13 03/10] ASoC: qcom: lpass: Add dma fields for codec
 dma lpass interface
To: Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
 <alsa-devel@alsa-project.org>, <bgoswami@codeaurora.org>,
 <bjorn.andersson@linaro.org>, <broonie@kernel.org>,
 <devicetree@vger.kernel.org>, <judyhsiao@chromium.org>,
 <lgirdwood@gmail.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <perex@perex.cz>, <quic_plai@quicinc.com>,
 <robh+dt@kernel.org>, <rohitkr@codeaurora.org>,
 <srinivas.kandagatla@linaro.org>, <tiwai@suse.com>
References: <1644850708-11099-1-git-send-email-quic_srivasam@quicinc.com>
 <1644850708-11099-4-git-send-email-quic_srivasam@quicinc.com>
 <CAE-0n53dXfwsJ=mh7cNH6Lq0Um+h+oTJDvqsXALh8L=wfONLjw@mail.gmail.com>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
Message-ID: <0311446c-d7da-a701-b63d-08ca02d9c5d5@quicinc.com>
Date: Wed, 16 Feb 2022 10:28:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n53dXfwsJ=mh7cNH6Lq0Um+h+oTJDvqsXALh8L=wfONLjw@mail.gmail.com>
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


On 2/15/2022 6:35 AM, Stephen Boyd wrote:
Thanks for your time Stephen!!!
> Quoting Srinivasa Rao Mandadapu (2022-02-14 06:58:21)
>> Add lpass interface memebers to support audio path over codec dma.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   sound/soc/qcom/lpass.h | 116 +++++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 116 insertions(+)
>>
>> diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
>> index f0d21cd..7cc3763 100644
>> --- a/sound/soc/qcom/lpass.h
>> +++ b/sound/soc/qcom/lpass.h
>> @@ -234,12 +294,66 @@ struct lpass_variant {
>>          struct reg_field wrdma_enable;
>>          struct reg_field wrdma_dyncclk;
>>
>> +       /*CDC RXTX RD_DMA */
> Please add space after /*
Okay. Will change it.
>
>> +       struct reg_field rxtx_rdma_intf;
>> +       struct reg_field rxtx_rdma_bursten;
>> +       struct reg_field rxtx_rdma_wpscnt;
>> +       struct reg_field rxtx_rdma_fifowm;
>> +       struct reg_field rxtx_rdma_enable;
>> +       struct reg_field rxtx_rdma_dyncclk;
>> +       struct reg_field rxtx_rdma_burst8;
>> +       struct reg_field rxtx_rdma_burst16;
>> +       struct reg_field rxtx_rdma_dynburst;
>> +       struct reg_field rxtx_rdma_codec_enable;
>> +       struct reg_field rxtx_rdma_codec_pack;
>> +       struct reg_field rxtx_rdma_codec_intf;
>> +       struct reg_field rxtx_rdma_codec_fs_sel;
>> +       struct reg_field rxtx_rdma_codec_ch;
>> +       struct reg_field rxtx_rdma_codec_fs_delay;
>> +
>> +       /*CDC RXTX WR_DMA */
> Same
Okay.
>
>> +       struct reg_field rxtx_wrdma_intf;
>> +       struct reg_field rxtx_wrdma_bursten;
>> +       struct reg_field rxtx_wrdma_wpscnt;
>> +       struct reg_field rxtx_wrdma_fifowm;
>> +       struct reg_field rxtx_wrdma_enable;
>> +       struct reg_field rxtx_wrdma_dyncclk;
>> +       struct reg_field rxtx_wrdma_burst8;
>> +       struct reg_field rxtx_wrdma_burst16;
>> +       struct reg_field rxtx_wrdma_dynburst;
>> +       struct reg_field rxtx_wrdma_codec_enable;
>> +       struct reg_field rxtx_wrdma_codec_pack;
>> +       struct reg_field rxtx_wrdma_codec_intf;
>> +       struct reg_field rxtx_wrdma_codec_fs_sel;
>> +       struct reg_field rxtx_wrdma_codec_ch;
>> +       struct reg_field rxtx_wrdma_codec_fs_delay;
>> +
>> +       /*CDC VA WR_DMA */
>> +       struct reg_field va_wrdma_intf;
>> +       struct reg_field va_wrdma_bursten;
>> +       struct reg_field va_wrdma_wpscnt;
>> +       struct reg_field va_wrdma_fifowm;
>> +       struct reg_field va_wrdma_enable;
>> +       struct reg_field va_wrdma_dyncclk;
>> +       struct reg_field va_wrdma_burst8;
>> +       struct reg_field va_wrdma_burst16;
>> +       struct reg_field va_wrdma_dynburst;
>> +       struct reg_field va_wrdma_codec_enable;
>> +       struct reg_field va_wrdma_codec_pack;
>> +       struct reg_field va_wrdma_codec_intf;
>> +       struct reg_field va_wrdma_codec_fs_sel;
>> +       struct reg_field va_wrdma_codec_ch;
>> +       struct reg_field va_wrdma_codec_fs_delay;
>> +
>>          /**
> This shouldn't have two stars as it isn't kerneldoc
Actually this not part of this patch.
>
>>           * on SOCs like APQ8016 the channel control bits start
>>           * at different offset to ipq806x
>>           **/
>>          u32     dmactl_audif_start;
>>          u32     wrdma_channel_start;
>> +       u32     rxtx_wrdma_channel_start;
>> +       u32     va_wrdma_channel_start;
>> +
>>          /* SOC specific initialization like clocks */
>>          int (*init)(struct platform_device *pdev);
>>          int (*exit)(struct platform_device *pdev);
>> @@ -251,10 +365,12 @@ struct lpass_variant {
>>          int num_dai;
>>          const char * const *dai_osr_clk_names;
>>          const char * const *dai_bit_clk_names;
>> +       const char * const *cdc_dma_clk_names;
>>
>>          /* SOC specific clocks configuration */
>>          const char **clk_name;
>>          int num_clks;
>> +       int cdc_dma_num_clks;
> Why not size_t? Negative numbers are useful here?
Okay. As negative numbers are not useful here, will change to size_t.
