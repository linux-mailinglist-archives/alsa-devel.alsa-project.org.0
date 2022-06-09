Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1D4544302
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 07:15:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C49311B3D;
	Thu,  9 Jun 2022 07:15:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C49311B3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654751754;
	bh=DD4rdRLrhR/9cZeGdRg7fX4ILhpQmk+9NA4WgI3pMhI=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fs5zSPFjKAU0r2ZRjI5WrOeut5QEWMjtKx1+7Mtd2X/QI8BlnsR0grl0gFBAwcL4q
	 ZB3Cv+7HflkrlvNErGbDWOZlSaAGw84z/Y+7tsP1tyeweg8vKqBjkZAsd8FfoqV/TJ
	 VlqoQXHv+FSggi6FmshuLHfa8iWvPAcx5JsGS0ZM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3BECF801F5;
	Thu,  9 Jun 2022 07:14:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6347F8019D; Thu,  9 Jun 2022 07:14:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDF40F800C7
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 07:14:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDF40F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="jIZbDR13"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654751689; x=1686287689;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=dEbrU2rxRky4QmiaqBPlHBqLGI59vmI89+wQyxw/sEc=;
 b=jIZbDR13s29FzJQSGoA0kK4kbW9FLCjpqHOB639mDZVQ4j3uA37VUmBW
 WQv3yodtnVHqMa4kcnk4CKaPJkzc0ujakBl+i+uGutCeaLO3qjsvoM9f8
 ynCKDBwp7UiGLSvEHsdA1Y59oSt4r3pxH7SlVFvHQzzMdL2V90dBLc7Hl 0=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 08 Jun 2022 22:14:44 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 22:14:43 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 8 Jun 2022 22:14:43 -0700
Received: from [10.216.22.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 8 Jun 2022
 22:14:37 -0700
Message-ID: <39a607ee-180e-b261-46f9-349c70294f4e@quicinc.com>
Date: Thu, 9 Jun 2022 10:44:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 2/2] ASoC: qcom: soundwire: Add software clock gating
 requirement check
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
 <alsa-devel@alsa-project.org>, <bgoswami@quicinc.com>,
 <bjorn.andersson@linaro.org>, <broonie@kernel.org>,
 <devicetree@vger.kernel.org>, <judyhsiao@chromium.org>,
 <lgirdwood@gmail.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <perex@perex.cz>, <quic_plai@quicinc.com>,
 <quic_rohkumar@quicinc.com>, <robh+dt@kernel.org>,
 <srinivas.kandagatla@linaro.org>, <tiwai@suse.com>, <vkoul@kernel.org>
References: <1654696929-20205-1-git-send-email-quic_srivasam@quicinc.com>
 <1654696929-20205-3-git-send-email-quic_srivasam@quicinc.com>
 <CAE-0n53EY1eKqnVLhU__e7t63BbVoKz++6aijOpEw0k5Cxa8-w@mail.gmail.com>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <CAE-0n53EY1eKqnVLhU__e7t63BbVoKz++6aijOpEw0k5Cxa8-w@mail.gmail.com>
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


On 6/9/2022 12:59 AM, Stephen Boyd wrote:
Thanks for Your time Stephen!!!
> Quoting Srinivasa Rao Mandadapu (2022-06-08 07:02:09)
>> Validate software clock gating required or not and do software
>> clock gating on hclk if soundwire is operational and keep it
>> running by adding flag in private dat structure.
>> This is to avoid conflict between older architectures,
>> where software clock gating is not required and on latest
>> architectues, where software clock gating is mandatory.
> This talks about software clock gating but the code is getting a reset
> and asserting it. Is that because the power on reset value of the clock
> gating is to have hardware clock gating disabled, but some earlier code
> is enabling hardware clock gating?

Yes Stephen. By Default this resets to HW controlled. As such there is 
no specific code

for enabling hardware clock gating, as these CGCR registers default 
setting is HW control.

>
>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   drivers/soundwire/qcom.c | 27 ++++++++++++++++++++-------
>>   1 file changed, 20 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>> index 38c3bf5..ebd7479 100644
>> --- a/drivers/soundwire/qcom.c
>> +++ b/drivers/soundwire/qcom.c
>> @@ -659,7 +665,8 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>>          val = FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK, ctrl->rows_index);
>>          val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK, ctrl->cols_index);
>>
>> -       reset_control_reset(ctrl->audio_cgcr);
>> +       if (ctrl->audio_cgcr)
>> +               reset_control_reset(ctrl->audio_cgcr);
>>
>>          ctrl->reg_write(ctrl, SWRM_MCP_FRAME_CTRL_BANK_ADDR(0), val);
>>
>> @@ -1494,7 +1506,8 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
>>                  qcom_swrm_get_device_status(ctrl);
>>                  sdw_handle_slave_status(&ctrl->bus, ctrl->status);
>>          } else {
>> -               reset_control_reset(ctrl->audio_cgcr);
>> +               if (ctrl->audio_cgcr)
>> +                       reset_control_reset(ctrl->audio_cgcr);
> reset_control_reset() is a no-op if the pointer is NULL so the if
> condition is not necessary in the above two statements.
Okay. revert this NULL check here.
