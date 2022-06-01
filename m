Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A3853A591
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jun 2022 14:58:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BBC91705;
	Wed,  1 Jun 2022 14:57:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BBC91705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654088317;
	bh=BHduJM/WBiCY8PzdzB//xszvCtbXjWdWZLr/lCNQZ+I=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I3u/DXvQdjdjjcNZI9pWamJFnIefaaDobCYMRZo5jiVsCjQKol4RCabGRUy+xIznv
	 IS5kM1guS8Y4yS0ePp6wSxb+lLb/xhQnraTxwN7YhTxOv7cgk9oGou51txdhM4rgwW
	 WpVVL5Ze+/Azg9Ogkr0FD3nf6xCnM0rIs77Pvyjs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE088F8025A;
	Wed,  1 Jun 2022 14:57:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC86BF80238; Wed,  1 Jun 2022 14:57:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61C76F800BD
 for <alsa-devel@alsa-project.org>; Wed,  1 Jun 2022 14:57:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61C76F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="jq6XlM5P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654088256; x=1685624256;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=S9uisrdptfIPDkvI5rpbWpdm1zkgyzUYHlOlidzA01w=;
 b=jq6XlM5P+hSwjTYk31w2DiStghmiH6HPwk2l9sJbKpG2/MDQjHFUlHfV
 lNH/EMZOUsAwuZDU4MTw6mUg9zoduRCdoUNv5+z6flJV1p3Qqf2DP5jVU
 4wHjlAJbRmULG4J5WSGwlayKu1B33LPoyj2+FnYZ2KIqMWvNsnNpT7qh0 o=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 01 Jun 2022 05:57:28 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 05:57:28 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 1 Jun 2022 05:57:28 -0700
Received: from [10.216.6.145] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 1 Jun 2022
 05:57:22 -0700
Message-ID: <7c74868d-624b-c18e-b377-026e70813fcc@quicinc.com>
Date: Wed, 1 Jun 2022 18:27:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2] ASoC: qcom: soundwire: Add support for controlling
 audio CGCR from HLOS
Content-Language: en-US
To: Matthias Kaehlcke <mka@chromium.org>
References: <1652877755-25120-1-git-send-email-quic_srivasam@quicinc.com>
 <CAE-0n53g9rWks+euk5KHBzmJNEB3xLbJzMgCxN52DO5x+9-Wgg@mail.gmail.com>
 <51b8aca1-e038-4907-e973-ebdbebaf9b28@quicinc.com>
 <YpaXZ6KfApGebkBy@google.com>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <YpaXZ6KfApGebkBy@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, broonie@kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 bjorn.andersson@linaro.org, vkoul@kernel.org, agross@kernel.org,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, quic_plai@quicinc.com,
 Stephen Boyd <swboyd@chromium.org>, judyhsiao@chromium.org,
 linux-kernel@vger.kernel.org
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


On 6/1/2022 4:02 AM, Matthias Kaehlcke wrote:
Thanks for Your Time Matthias!!!
> On Tue, May 24, 2022 at 04:19:47PM +0530, Srinivasa Rao Mandadapu wrote:
>> On 5/21/2022 8:43 AM, Stephen Boyd wrote:
>> Thanks for your time Stephen!!!
>>> Quoting Srinivasa Rao Mandadapu (2022-05-18 05:42:35)
>>>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>>>> index da1ad7e..445e481 100644
>>>> --- a/drivers/soundwire/qcom.c
>>>> +++ b/drivers/soundwire/qcom.c
>>>> @@ -1333,6 +1337,10 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>>>>           ctrl->bus.compute_params = &qcom_swrm_compute_params;
>>>>           ctrl->bus.clk_stop_timeout = 300;
>>>>
>>>> +       ctrl->audio_cgcr = devm_reset_control_get_exclusive(dev, "swr_audio_cgcr");
>>>> +       if (IS_ERR(ctrl->audio_cgcr))
>>>> +               dev_err(dev, "Failed to get audio_cgcr reset required for soundwire-v1.6.0\n");
>>> Why is there no return on error here? Is the reset optional?
>> Yes it's optional. For older platforms this is not required.
> If it's optional then either there should be no error message, or the
> error message should only be logged when the version is >= 1.6.0. There
> are few things worse than a kernel log riddled with misleading error
> messages.

In that case, it can be done like below. Kindly let me know your opinion 
on this.

if (ctrl->version >= 0x01060000) {
     ctrl->audio_cgcr = devm_reset_control_get_exclusive(dev, 
"swr_audio_cgcr");
         if (IS_ERR(ctrl->audio_cgcr)) {
             dev_err(dev, "Failed to get audio_cgcr reset required for 
soundwire-v1.6.0\n");
             ret = PTR_ERR(ctrl->audio_cgcr);
             goto err_clk;
         }
     }

