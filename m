Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E814C8F64
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 16:46:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36A7C1750;
	Tue,  1 Mar 2022 16:45:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36A7C1750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646149596;
	bh=CNhKdzYx7dBeNftKP0AOrcsjEyOEhSaW2jObrhIYaPo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VIj21tNL+6rNBSZj+yEyDwaojNiZmQaFLtKEdvvzzr55jOU7ge8YLylDMxGoMurgd
	 PYkwCuS43KGnsfWNxbob3Dfw4QCoG3uNindm1leSP4dVXnVKJAPylLG9LYVXYJHhTm
	 nhLJi+pjtKQNIFzKyUGv9gpZiulb0WPL4NcE+fCw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E10CF802D2;
	Tue,  1 Mar 2022 16:45:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC38EF80167; Tue,  1 Mar 2022 16:45:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50627F80167
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 16:45:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50627F80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="JVLAVtn8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646149522; x=1677685522;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=C/BjzGXxbcQNucZ4IX+eGwpvmWxMB4jt2HQM1WP1dbg=;
 b=JVLAVtn8OkHCp1cdR2us095sXud0ShhIhPV7b/XvkG7fL7crgh/mwNfN
 pRLTM0CTLSkUjdcg/RL3c7QG2I5ztwxVD5+ukgPNCVV4hiTT36n8GfNql
 /UT/Xagu7ewewUMOeFeGu0kOODo04Y4G0S+WmimzIo5kFKOJkFsnDPhvA g=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 01 Mar 2022 07:45:17 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 07:45:07 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 1 Mar 2022 07:45:07 -0800
Received: from [10.216.24.177] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Tue, 1 Mar 2022
 07:45:00 -0800
Message-ID: <134a64a9-abab-df25-a613-2d01ac7e5ee5@quicinc.com>
Date: Tue, 1 Mar 2022 21:14:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v5 1/2] soundwire: qcom: Add compatible name for v1.6.0
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
 <alsa-devel@alsa-project.org>, <bgoswami@codeaurora.org>,
 <bjorn.andersson@linaro.org>, <broonie@kernel.org>,
 <devicetree@vger.kernel.org>, <judyhsiao@chromium.org>,
 <lgirdwood@gmail.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <perex@perex.cz>,
 <pierre-louis.bossart@linux.intel.com>, <quic_plai@quicinc.com>,
 <robh+dt@kernel.org>, <rohitkr@codeaurora.org>, <sanyog.r.kale@intel.com>,
 <srinivas.kandagatla@linaro.org>, <tiwai@suse.com>,
 <yung-chuan.liao@linux.intel.com>
References: <1646030377-12092-1-git-send-email-quic_srivasam@quicinc.com>
 <1646030377-12092-2-git-send-email-quic_srivasam@quicinc.com>
 <CAE-0n53XVfXeVHFhokw7pwSOnL4MQAzDg-83OaH=FB=cB2gqdA@mail.gmail.com>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <CAE-0n53XVfXeVHFhokw7pwSOnL4MQAzDg-83OaH=FB=cB2gqdA@mail.gmail.com>
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


On 3/1/2022 2:32 AM, Stephen Boyd wrote:
> Quoting Srinivasa Rao Mandadapu (2022-02-27 22:39:36)
>> Update compatible string and master data information in soundwire driver
>> to support v1.6.0 in lpass sc7280 based platform.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>> ---
>>   drivers/soundwire/qcom.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>> index 9eb31ba..fb183bd 100644
>> --- a/drivers/soundwire/qcom.c
>> +++ b/drivers/soundwire/qcom.c
>> @@ -175,6 +175,11 @@ static struct qcom_swrm_data swrm_v1_5_data = {
>>          .default_cols = 16,
>>   };
>>
>> +static struct qcom_swrm_data swrm_v1_6_data = {
> Why not const?
Okay.
>
>> +       .default_rows = 50,
>> +       .default_cols = 16,
> This is the same as swrm_v1_5_data so just use that struct again?
Okay. Will use  swrm_v1_5_data.
>
>> +};
>> +
>>   #define to_qcom_sdw(b) container_of(b, struct qcom_swrm_ctrl, bus)
>>
>>   static int qcom_swrm_ahb_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
>> @@ -1343,6 +1348,7 @@ static int qcom_swrm_remove(struct platform_device *pdev)
>>   static const struct of_device_id qcom_swrm_of_match[] = {
>>          { .compatible = "qcom,soundwire-v1.3.0", .data = &swrm_v1_3_data },
>>          { .compatible = "qcom,soundwire-v1.5.1", .data = &swrm_v1_5_data },
> These other structs for v1.5 and v1.3 could also be const.
Okay. Will add const and re post.
>
>> +       { .compatible = "qcom,soundwire-v1.6.0", .data = &swrm_v1_6_data },
>>          {/* sentinel */},
