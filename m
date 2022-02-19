Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCED4BCA2C
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Feb 2022 19:46:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65A9A16C6;
	Sat, 19 Feb 2022 19:45:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65A9A16C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645296399;
	bh=CZZ4+U77AlL4oysAZTlA60Q73v4CU6EvIUT2oMgILrY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lRLjAs5ED1DsUZnEq3qLaWdYozKlF6IhPa4yp9tH5KEfhIrLYd+8lIYs6vR1dYP/n
	 y9d6Ezazc7mp0514Uv+GhL5i/V78kNuEJbIw8JAKU9dHartohPx+pc44wor4EuqcqX
	 yV9y+i8px/CU6AosSp9cixKz7s+w6GUVIVqeSmwU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF422F8016B;
	Sat, 19 Feb 2022 19:45:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0083CF8016A; Sat, 19 Feb 2022 19:45:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9997EF800AB
 for <alsa-devel@alsa-project.org>; Sat, 19 Feb 2022 19:45:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9997EF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="AcIvg298"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645296326; x=1676832326;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5v+5eGF0fWqQFfqO8WRWVTuzMoPWbF2CAaKbG/Q1V5s=;
 b=AcIvg2989HP5p1SFVl7fqPpzzTu6HTgw4vFtdQoPvXdhj34c5t7vyT9j
 E22JmveyemAOKtJEYyb8ygEig3lrpI/6MCNwv5AT2HdZz6sUa25hxOAqy
 JpAdRsmtDSV765UFha+J7QdtWAwQB82Yi9NZDhj35Z7Q79uKj+mieTLGe 8=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 19 Feb 2022 10:45:23 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2022 10:45:23 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Sat, 19 Feb 2022 10:45:22 -0800
Received: from [10.216.20.52] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Sat, 19 Feb
 2022 10:45:16 -0800
Message-ID: <356abae0-c19b-ccbb-fa5f-4e91619243bf@quicinc.com>
Date: Sun, 20 Feb 2022 00:15:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [RESEND v13 04/10] ASoC: qcom: Add helper function to get dma
 control and lpaif handle
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
 <alsa-devel@alsa-project.org>, <bgoswami@codeaurora.org>,
 <bjorn.andersson@linaro.org>, <broonie@kernel.org>,
 <devicetree@vger.kernel.org>, <judyhsiao@chromium.org>,
 <lgirdwood@gmail.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <perex@perex.cz>, <quic_plai@quicinc.com>,
 <robh+dt@kernel.org>, <rohitkr@codeaurora.org>,
 <srinivas.kandagatla@linaro.org>, <tiwai@suse.com>
References: <1644850708-11099-1-git-send-email-quic_srivasam@quicinc.com>
 <1644850708-11099-5-git-send-email-quic_srivasam@quicinc.com>
 <CAE-0n504R0avU9Ybj68jxqDRH-Ya5ro0hPo5GJ=2zC6p2SZ_=g@mail.gmail.com>
 <13007276-c827-0cc4-5db1-396c5184bb35@quicinc.com>
 <CAE-0n538Lhp7U=pEB_7R5EARG6LveeO=jvF+kE7HCCEXUEm-kQ@mail.gmail.com>
From: "Srinivasa Rao Mandadapu (Temp)" <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <CAE-0n538Lhp7U=pEB_7R5EARG6LveeO=jvF+kE7HCCEXUEm-kQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
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


On 2/18/2022 1:11 AM, Stephen Boyd wrote:
Thanks for Your time Stephen!!!
> Quoting Srinivasa Rao Mandadapu (2022-02-15 21:11:29)
>> On 2/15/2022 6:40 AM, Stephen Boyd wrote:
>> Thanks for your time Stephen!!!
>>> Quoting Srinivasa Rao Mandadapu (2022-02-14 06:58:22)
>>>> Add support function to get dma control and lpaif handle to avoid
>>>> repeated code in platform driver
>>>>
>>>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>>>> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>>>> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>>>> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>>> ---
>>>>    sound/soc/qcom/lpass-platform.c | 113 +++++++++++++++++++++++-----------------
>>>>    1 file changed, 66 insertions(+), 47 deletions(-)
>>>>
>>>> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
>>>> index a44162c..5d77240 100644
>>>> --- a/sound/soc/qcom/lpass-platform.c
>>>> +++ b/sound/soc/qcom/lpass-platform.c
>>>> @@ -177,6 +177,49 @@ static int lpass_platform_pcmops_close(struct snd_soc_component *component,
>>>>           return 0;
>>>>    }
>>>>
>>>> +static void __lpass_get_lpaif_handle(struct snd_pcm_substream *substream,
>>> const?
>> Okay. will add const to substream pointer.
>>>> +                                    struct snd_soc_component *component,
>>> const?
>> Here const is giving compilation errors in below code.
> Ok
>
>>>> +                       l_id = pcm_data->dma_ch;
>>>> +                       l_dmactl = drvdata->rd_dmactl;
>>>> +               } else {
>>>> +                       l_dmactl = drvdata->wr_dmactl;
>>>> +                       l_id = pcm_data->dma_ch - v->wrdma_channel_start;
>>>> +               }
>>>> +               l_map = drvdata->lpaif_map;
>>>> +               break;
>>>> +       case LPASS_DP_RX:
>>>> +               l_id = pcm_data->dma_ch;
>>>> +               l_dmactl = drvdata->hdmi_rd_dmactl;
>>>> +               l_map = drvdata->hdmiif_map;
>>>> +               break;
>>>> +       default:
>>>> +               break;
>>>> +       }
>>>> +       if (dmactl)
>>>> +               *dmactl = l_dmactl;
>>>> +       if (id)
>>>> +               *id = l_id;
>>>> +       if (map)
>>>> +               *map = l_map;
>>> Why not 'return 0' here and return -EINVAL in the default case above? Then
>>> we can skip the checks for !map or !dmactl below and simply bail out if
>>> it failed with an error value.
>> Here the check is for input params. some users call for only damctl or
>> only map.
> Yes the check is to make sure there's a pointer to store the value into.
> I get that. The users are all internal to this driver though because
> the function is static. If the function returned an error because it
> couldn't find something then we wouldn't have to test the resulting
> pointers for success, instead we could check for a return value.
> Similarly, it may be clearer to have a single get for each item and then
> return a pointer from the function vs. passing it in to extract
> something. It may duplicate some code but otherwise the code would be
> clearer because we're getting one thing and can pass an error value
> through the pointer with PTR_ERR().

Okay. Agreed. But in initial review comments, asked to make common 
function for code readability,

and to avoid duplicate code.

Anyway will change accordingly and re post it.

