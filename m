Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E8B4C46C5
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 14:41:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D04E1F19;
	Fri, 25 Feb 2022 14:40:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D04E1F19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645796468;
	bh=+9xPAKBY1+l/E40bv3yeSBj6vpW4KT7NiXSyTLKVM1Y=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sWlMtTrn4G+t68SZZ0GdHEHLq1CMmaDq4c64bC9umLvmwluU1wEX0/2MiZhSW5knt
	 7lUCvHgeaUQR4uhnroeKijWEjBZiO+KoZ0gPrZRoOKUR3mMXCCa65KNFF3rFNNppMY
	 JXoeu5lsLyBirb2HgP9DU7CMVgv91yb3MPnSSKJs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0FAAF80159;
	Fri, 25 Feb 2022 14:40:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BC2EF800B6; Fri, 25 Feb 2022 14:40:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DD2AF800B6
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 14:39:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DD2AF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="QFzTSwwy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645796395; x=1677332395;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9OdzSD1XsrbczLLfCeXnsbqUptTDr7RDbwNE8J8aeuI=;
 b=QFzTSwwyulQfw6JST2rdYydq7cCtoYTZRHau/hn9oLL/AD6BMdS9l1dI
 BQTJcNfPZJocBquvgLywyNcj+Tkuer4G+NVLkuRgfv+RfhWc3GqbgcxKS
 7lZVNY+fBqfgKnzwJkUGwXibwxZGoWN62NdbCRpkIUdirogDM3cAQErPU 0=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 25 Feb 2022 05:39:48 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 05:39:48 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 25 Feb 2022 05:39:47 -0800
Received: from [10.216.25.108] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Fri, 25 Feb
 2022 05:39:41 -0800
Message-ID: <5f4a158f-d50a-0022-5a62-46ce84fec12c@quicinc.com>
Date: Fri, 25 Feb 2022 19:09:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] soundwire: qcom: remove redundant wait for completion
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, <agross@kernel.org>, 
 <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>, 
 <robh+dt@kernel.org>, <quic_plai@quicinc.com>, <bgoswami@codeaurora.org>, 
 <perex@perex.cz>, <tiwai@suse.com>, <rohitkr@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>, <koul@kernel.org>,
 <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.intel.com>,
 <sanyog.r.kale@intel.com>
References: <1645795667-20176-1-git-send-email-quic_srivasam@quicinc.com>
 <861cd4c1-43a9-8175-7ad1-e7e51f5781b4@linaro.org>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <861cd4c1-43a9-8175-7ad1-e7e51f5781b4@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
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


On 2/25/2022 7:07 PM, Srinivas Kandagatla wrote:
Thanks for Your time Srini!!
>
> On 25/02/2022 13:27, Srinivasa Rao Mandadapu wrote:
>> Remove wait_for_completion_timeout from soundwire probe
>> as it seems unnecessary and device enumeration is anyway not
>> happening here.
>
> May be some details on the side effects of this wait would be good to 
> add in the log.
Okay. Will elaborate issue observed here.
>
>> Also, as device enumeration event is dependent on wcd938x probe to be
>> completed, its of no use waiting here.
>
> fix tag is missing
>
> Fixes: 06dd96738d618 ("soundwire: qcom: wait for enumeration to be 
> complete in probe")
Okay. Will add and re post.
>
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>> ---
>>   drivers/soundwire/qcom.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>> index 5481341..9a32a24 100644
>> --- a/drivers/soundwire/qcom.c
>> +++ b/drivers/soundwire/qcom.c
>> @@ -1309,8 +1309,6 @@ static int qcom_swrm_probe(struct 
>> platform_device *pdev)
>>       }
>>         qcom_swrm_init(ctrl);
>> -    wait_for_completion_timeout(&ctrl->enumeration,
>> -                    msecs_to_jiffies(TIMEOUT_MS));
>>       ret = qcom_swrm_register_dais(ctrl);
>>       if (ret)
>>           goto err_master_add;
