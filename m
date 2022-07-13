Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5256573B8A
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jul 2022 18:47:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7862A174B;
	Wed, 13 Jul 2022 18:46:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7862A174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657730852;
	bh=mqVDlpYogZJ7+tJg0UYeZKl7IOA8Jzxjerfnst/lNtI=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=stqtHFWvEKJzDivtVMTg9adRWFIklIylk2Su57+KODJnb4/zIFoXHpa508x2hCzzo
	 V2gUgAzzD2jkCHZmRajVC9EfobnEtxVK7n7bpYjnR5hbxJ5nkKbOb8IgBl4W6if1ox
	 2LdLJfXdJeI4m3EJxBoEZaWnZd7BgHgqzcghNquU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA893F80254;
	Wed, 13 Jul 2022 18:46:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EFE8F80249; Wed, 13 Jul 2022 18:46:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FB88F800AA
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 18:46:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FB88F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="BKhY69TB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657730787; x=1689266787;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=kqLgUdZi53D6drYvYhKcGz92QsRtwzVgO8AAS9UQ2q0=;
 b=BKhY69TB6maUjGKPNa2WJc4IYHBuv8J6DJkvYss+LFBkJA4CTrKxxwZx
 fFty60SUsFEzMZvVNGMUVpoyrOvsMMMB3RLgie/I73LGCYGLwwQdaQX54
 NshA3A2oZdcIxfh29Oxxqdb0FxSrCLfjPqz6QBHCCQ4mvSQt5gl/ezMzE E=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 13 Jul 2022 09:46:23 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 09:46:22 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 13 Jul 2022 09:46:22 -0700
Received: from [10.216.11.138] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 13 Jul
 2022 09:46:05 -0700
Message-ID: <3def0f92-6784-df60-9533-e2902cda0185@quicinc.com>
Date: Wed, 13 Jul 2022 22:15:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] soundwire: qcom: Update error prints to debug prints
Content-Language: en-US
To: Joe Perches <joe@perches.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, <vkoul@kernel.org>,
 <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@quicinc.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <quic_rohkumar@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>
References: <1657714921-28072-1-git-send-email-quic_srivasam@quicinc.com>
 <75e9b775-3bbe-0b34-2bd6-b4ac74620672@linux.intel.com>
 <8cde58d2-3b10-b88b-2d10-88e76fbcac06@quicinc.com>
 <75404573094d1c46172fcd51dad6a4e564da1542.camel@perches.com>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <75404573094d1c46172fcd51dad6a4e564da1542.camel@perches.com>
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


On 7/13/2022 9:31 PM, Joe Perches wrote:
Thanks for your time Joe!!!
> On Wed, 2022-07-13 at 20:22 +0530, Srinivasa Rao Mandadapu wrote:
>> On 7/13/2022 7:53 PM, Pierre-Louis Bossart wrote:
>> Thanks for your time Pierre-Louis!!!
>>> On 7/13/22 07:22, Srinivasa Rao Mandadapu wrote:
>>>> Upadte error prints to debug prints to avoid redundant logging in kernel
>>> update
> []
>>>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> []
>>>> @@ -573,11 +573,10 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
>>>>    				break;
>>>>    			case SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED:
>>>>    			case SWRM_INTERRUPT_STATUS_CHANGE_ENUM_SLAVE_STATUS:
>>>> -				dev_err_ratelimited(swrm->dev, "%s: SWR new slave attached\n",
>>>> -					__func__);
>>>> +				dev_dbg(swrm->dev, "%s: SWR new slave attached\n", __func__);
> Could also drop the "%s: ", __func__ as it's already a unique message
> and dynamic debug could add it back if really desired.
Okay. It's removed and posted v2 patch.
>
