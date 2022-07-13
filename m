Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B804573941
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jul 2022 16:52:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E79F4172E;
	Wed, 13 Jul 2022 16:51:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E79F4172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657723950;
	bh=A19+FjYHAp/iMsSFqKe0UXNUFJ0x0obHe4MSYcMAn+s=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D5c+0V/CcVs1NAtg7ACqSmfpy/ljN0lrVZXCJK4FKcWO9dDcjLlBWpZEK4Y8bp5Mj
	 eoP37k1ZiMj3/VoQENTYIlw882532EZSHh831Rc3LkDcg0FNMVnz+U8OSxaB/zEAad
	 AbtDmWjYioS8ryH/Xy/YhL7dqPWekYpQ5Y171Uno=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D23FF80254;
	Wed, 13 Jul 2022 16:51:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97C98F80249; Wed, 13 Jul 2022 16:51:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E1E8F80134
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 16:51:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E1E8F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="yj0rDdY0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657723882; x=1689259882;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=usEfZWG3K+DfGjkb7INoXNmqgT2ynC9Rk8m0pztykNE=;
 b=yj0rDdY0Png5VcdNxZSjo3Sq/KEuk6gyTd4HhgsPbyvJysQDnnuadXpp
 ahTRdI9mVxK5+uB/GC9oJ9jQC2T4uSagkj2y31N4we6/a1tH9O8XXCKJb
 71VZ0G638/EopdzWXdrDx86dEIZRjYMgK3SxHDPE1nIK6TcMHLueiCYhG 8=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 13 Jul 2022 07:51:18 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 07:51:17 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 13 Jul 2022 07:51:17 -0700
Received: from [10.216.22.132] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 13 Jul
 2022 07:51:10 -0700
Message-ID: <b5776efd-4d30-3dbf-796d-4f29ed1e3a92@quicinc.com>
Date: Wed, 13 Jul 2022 20:21:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] soundwire: qcom: Update error prints to debug prints
Content-Language: en-US
To: Andrew Halaney <ahalaney@redhat.com>
References: <1657714921-28072-1-git-send-email-quic_srivasam@quicinc.com>
 <20220713135603.4vkyofw6x4mldxzp@halaneylaptop>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <20220713135603.4vkyofw6x4mldxzp@halaneylaptop>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, broonie@kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 bjorn.andersson@linaro.org, vkoul@kernel.org, agross@kernel.org,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, quic_plai@quicinc.com,
 swboyd@chromium.org, judyhsiao@chromium.org, linux-kernel@vger.kernel.org
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


On 7/13/2022 7:26 PM, Andrew Halaney wrote:
Thanks for your time Andrew.
> A couple of drive by nits:
>
> On Wed, Jul 13, 2022 at 05:52:01PM +0530, Srinivasa Rao Mandadapu wrote:
>> Upadte error prints to debug prints to avoid redundant logging in kernel
>> boot time, as these prints are informative prints in irq handler.
> s/Upadte/Update/
Okay. Will fix it.
>
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
> There's no need for __func__ usage with dev_dbg() when giving +f flag
> when enabling adds this for you!
Okay. Will remove __func__ and change dev_dbg() to dev_dbg_ratelimited().
>
> With those changes feel free to add:
>
>      Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
>
> Thanks,
> Andrew
>
>>   				swrm->reg_read(swrm, SWRM_MCP_SLV_STATUS, &slave_status);
>>   				if (swrm->slave_status == slave_status) {
>> -					dev_err(swrm->dev, "Slave status not changed %x\n",
>> +					dev_dbg(swrm->dev, "Slave status not changed %x\n",
>>   						slave_status);
>>   				} else {
>>   					qcom_swrm_get_device_status(swrm);
>> -- 
>> 2.7.4
>>
