Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97709573950
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jul 2022 16:54:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B59C1742;
	Wed, 13 Jul 2022 16:53:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B59C1742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657724049;
	bh=364r87TJ2y63v1OsoIW7cT9FRYMbFUtewfG4lUrY+9A=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c+gLuK8uSE0anhYwHNw86znBcTYiSxNguLXEY3SIrptbIgX3QibsSRatXqaEDciVi
	 g1JpyhJGjtYY5siw4DBCG7mqdExqEnMqoAl9QsA/0/DeV4v+wyn1zI7Uwm6cyL4jet
	 OZ9VQ9pC+RzYsTPWxLdHp/EFq8UpeIJmxpPyNAqo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6322F8047B;
	Wed, 13 Jul 2022 16:53:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA334F80310; Wed, 13 Jul 2022 16:53:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49F58F800AA
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 16:53:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49F58F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="QJk/6+dh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657723981; x=1689259981;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=CNNiJMucRthl7fECf9E6Pn8zMqMHyA+cokmpGr/PmFI=;
 b=QJk/6+dhAAe/kNul+PtsBhls/dGMtian2mH2Kbs2bbj3vpaZRi6gBwyH
 bNKuKSm+NsrZmufBS/JGQ7Z5cuZMzpPxcq9uRtKJQbkDG4sRIs+I91i2u
 t+cMzUNDdq1lUx3Tk3jIVUDylVInAYd2VUsbF5zyqcytZjISEPY+Cnk3+ w=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 13 Jul 2022 07:52:58 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 07:52:58 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 13 Jul 2022 07:52:57 -0700
Received: from [10.216.22.132] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 13 Jul
 2022 07:52:52 -0700
Message-ID: <8cde58d2-3b10-b88b-2d10-88e76fbcac06@quicinc.com>
Date: Wed, 13 Jul 2022 20:22:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] soundwire: qcom: Update error prints to debug prints
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <vkoul@kernel.org>, <agross@kernel.org>, <bjorn.andersson@linaro.org>,
 <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
 <quic_plai@quicinc.com>, <bgoswami@quicinc.com>, <perex@perex.cz>,
 <tiwai@suse.com>, <srinivas.kandagatla@linaro.org>,
 <quic_rohkumar@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <swboyd@chromium.org>,
 <judyhsiao@chromium.org>
References: <1657714921-28072-1-git-send-email-quic_srivasam@quicinc.com>
 <75e9b775-3bbe-0b34-2bd6-b4ac74620672@linux.intel.com>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <75e9b775-3bbe-0b34-2bd6-b4ac74620672@linux.intel.com>
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


On 7/13/2022 7:53 PM, Pierre-Louis Bossart wrote:
Thanks for your time Pierre-Louis!!!
>
> On 7/13/22 07:22, Srinivasa Rao Mandadapu wrote:
>> Upadte error prints to debug prints to avoid redundant logging in kernel
> update
Okay. Will change it.
>
>> boot time, as these prints are informative prints in irq handler.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>> ---
>>   drivers/soundwire/qcom.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>> index 9df970e..a4293d0 100644
>> --- a/drivers/soundwire/qcom.c
>> +++ b/drivers/soundwire/qcom.c
>> @@ -573,11 +573,10 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
>>   				break;
>>   			case SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED:
>>   			case SWRM_INTERRUPT_STATUS_CHANGE_ENUM_SLAVE_STATUS:
>> -				dev_err_ratelimited(swrm->dev, "%s: SWR new slave attached\n",
>> -					__func__);
>> +				dev_dbg(swrm->dev, "%s: SWR new slave attached\n", __func__);
> any reason why the rate limitation was dropped?
No Specific Reason as such. Will add ratelimited and re-spin it.
>
>>   				swrm->reg_read(swrm, SWRM_MCP_SLV_STATUS, &slave_status);
>>   				if (swrm->slave_status == slave_status) {
>> -					dev_err(swrm->dev, "Slave status not changed %x\n",
>> +					dev_dbg(swrm->dev, "Slave status not changed %x\n",
>>   						slave_status);
>>   				} else {
>>   					qcom_swrm_get_device_status(swrm);
