Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC4643B13F
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 13:28:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B7EA171F;
	Tue, 26 Oct 2021 13:28:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B7EA171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635247736;
	bh=4lBhhHg3DGf1pWvW0hrJld1dFreG5oRKaY0A9hInS6U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O1OiuHFjUVzrD3ke631dMd8oA+4SEPwx2+lJt/nTkpSvUkEJq6Hmx3M+9JEnqSANe
	 7VSBTzq3Gv+utEmTm4EVFv8BiBYKHDyWkMKJ090LhclEKBYZWxToAEYRdaEjPG05Dq
	 9Jf7wsdB9UF7r4FQp7ohNeCJ1y1YvjLRCTKlRphU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68627F802E7;
	Tue, 26 Oct 2021 13:27:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8AE8F802C8; Tue, 26 Oct 2021 13:27:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8F88F80105
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 13:27:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8F88F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="sC4XxROS"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635247650; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=+VfAOGNRqKPzh6Cqta9+SYjWQCyLtNY13BI23W5daME=;
 b=sC4XxROSmTAulk2vDbPNqqgJ1+TFlCD46Otr8w7S9GlX2vxJaRECH58CZ6CJh24PoOq98umy
 wUzhxh4REmA6UFsgBe1+Kt5FEglQivkUaKNlbqCH8m3emSj0dZRfGEYmMK5itKAsNoDuq4Up
 xab+xZQ/X7pfZ1LwWT/T0SgkC1A=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 6177e60dc75c436a30c59a30 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 26 Oct 2021 11:27:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E9E24C43617; Tue, 26 Oct 2021 11:27:08 +0000 (UTC)
Received: from [10.242.143.72] (unknown [202.46.23.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D3FDCC4338F;
 Tue, 26 Oct 2021 11:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org D3FDCC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v3] ASoC: qcom: soundwire: Enable soundwire bus clock for
 version 1.6
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <1633671232-30310-1-git-send-email-srivasam@codeaurora.org>
 <YWBXIIjPP7Qunyvf@ripper>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <11a57c35-5e38-1b74-bc70-c1eeeb81fbfe@codeaurora.org>
Date: Tue, 26 Oct 2021 16:57:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YWBXIIjPP7Qunyvf@ripper>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, Venkata Prasad Potturu <potturu@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, plai@codeaurora.org, tiwai@suse.com,
 agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 rohitkr@codeaurora.org, swboyd@chromium.org, judyhsiao@chromium.org,
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


On 10/8/2021 8:05 PM, Bjorn Andersson wrote:
Thanks for Your time Bjorn!!!
> On Thu 07 Oct 22:33 PDT 2021, Srinivasa Rao Mandadapu wrote:
>
>> Add support for soundwire 1.6 version to gate RX/TX bus clock.
>>
> Are you really adding soundwire 1.6 support in order to gate RX/TX bus
> clock?
>
> Could it be that you're ungating the bus clock so that soundwire 1.6
> starts working? The commit message should properly describe why you're
> doing your change.
Yes. After updating RX/TX CGCR Register so it's started working. Will 
update proper commit message.
>> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Venkata is the first who certified the origin of this patch, yet you're
> the author. Either this should be From Venkata (i.e. git commit
> --author) or perhaps you need a Co-developed-by here to say that you
> collaborated on this and both certify its origin.
Okay. Actually Venakta is the Co developer. Will change accordingly.
>> ---
>> Changes since v2:
>>      -- Update error check after ioremap.
> What about the other things I noted in v2?
Okay. Will update.
>
>> Changes since v1:
>>      -- Add const name to mask value.
>>
>>   drivers/soundwire/qcom.c | 15 ++++++++++++++-
>>   1 file changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>> index 0ef79d6..bd6fabd 100644
>> --- a/drivers/soundwire/qcom.c
>> +++ b/drivers/soundwire/qcom.c
>> @@ -109,6 +109,7 @@
>>   #define SWR_MAX_CMD_ID	14
>>   #define MAX_FIFO_RD_RETRY 3
>>   #define SWR_OVERFLOW_RETRY_COUNT 30
>> +#define SWRM_HCTL_REG_MASK ~BIT(1)
>>   
>>   struct qcom_swrm_port_config {
>>   	u8 si;
>> @@ -127,6 +128,7 @@ struct qcom_swrm_ctrl {
>>   	struct device *dev;
>>   	struct regmap *regmap;
>>   	void __iomem *mmio;
>> +	char __iomem *swrm_hctl_reg;
>>   	struct completion broadcast;
>>   	struct completion enumeration;
>>   	struct work_struct slave_work;
>> @@ -610,6 +612,12 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>>   	val = FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK, ctrl->rows_index);
>>   	val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK, ctrl->cols_index);
>>   
>> +	if (ctrl->swrm_hctl_reg) {
>> +		val = ioread32(ctrl->swrm_hctl_reg);
>> +		val &= SWRM_HCTL_REG_MASK;
> Make a define with a name that clarifies what BIT(1) is and use that
> here, hiding a magic number in an empty define isn't making this more
> maintainable.
>
> Essentially put the name of the bit in the register description in a
> define and use that here.
Okay. Will change name appropriately.
>
>> +		iowrite32(val, ctrl->swrm_hctl_reg);
>> +	}
>> +
>>   	ctrl->reg_write(ctrl, SWRM_MCP_FRAME_CTRL_BANK_ADDR(0), val);
>>   
>>   	/* Enable Auto enumeration */
>> @@ -1200,7 +1208,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>>   	struct qcom_swrm_ctrl *ctrl;
>>   	const struct qcom_swrm_data *data;
>>   	int ret;
>> -	u32 val;
>> +	int val, swrm_hctl_reg = 0;
> Don't you get a warning from passing val as an int to a function that
> takes a u32 pointer?
Yeah. Will revert val variable type change.
> Also there's no reason to zero-initialize swrm_hctl_reg.
Okay. Will change.
>>   
>>   	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
>>   	if (!ctrl)
>> @@ -1251,6 +1259,11 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>>   	ctrl->bus.port_ops = &qcom_swrm_port_ops;
>>   	ctrl->bus.compute_params = &qcom_swrm_compute_params;
>>   
>> +	if (!of_property_read_u32(dev->of_node, "qcom,swrm-hctl-reg", &swrm_hctl_reg)) {
> As I said in my feedback of v2, this property is not documented in the
> DT binding.
Okay. Will update dt bindings.
>
> But more important, upstream we do not approve of the downstream
> methodology of having properties pointing to single registers in some
> memory block somewhere.
>
> Describe the hardware block that you reference fully in devicetree and
> make a proper reference to it.
>
> Unfortunately your patch lacks details necessary to know where this
> register lives, so it's not possible for me to recommend a proper
> design.

These Registers lies in LPASS_AUDIO_LPASS_AUDIO_CSR | 0x032A9000 Range.

Register description:

LPASS_AUDIO_SWR_RX_CGCR(0x032A90A0) & LPASS_AUDIO_SWR_TX_CGCR (0x032A90A8)

Bits  Field Name    Description
1        HW_CTL        HW Dynamic Clock Gating Control Register
                                  1: HW Controlled
                                  0: SW Controlled
0        CLK_ENABLE    Enabling the clock when in SW Controlled Mode
                                     1: Clock Enabled
                                      0: Clock Disabled
> Regards,
> Bjorn
>
>> +		ctrl->swrm_hctl_reg = devm_ioremap(&pdev->dev, swrm_hctl_reg, 0x4);
>> +		if (!ctrl->swrm_hctl_reg)
>> +			return -ENODEV;
>> +	}
>>   	ret = qcom_swrm_get_port_config(ctrl);
>>   	if (ret)
>>   		goto err_clk;
>> -- 
>> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
>> is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

