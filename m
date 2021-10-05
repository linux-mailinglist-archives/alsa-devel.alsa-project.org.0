Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9873E422AA1
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Oct 2021 16:14:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D8891673;
	Tue,  5 Oct 2021 16:14:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D8891673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633443290;
	bh=EtOaV9Xx8Br3GCplNJrEyX3w4w05S0az1HWLmSz0tO4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N48G+l+qnQ5Xd1B6K+0GYBY1uVmOnD4ylyQpd00EpCr7Q2aH/RrFGMhthpAMIf5jA
	 CFUCylY4KiPE21nQej6bEaFlbl6XWkMZlRwb6MwGJ0l7I5qsJ1UxoB+R9X03nJC/Cd
	 AXRbMSe7G7gvEJxpi+e9Wm5nHgHGsrJQUjpS0Nos=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E8F5F8027D;
	Tue,  5 Oct 2021 16:13:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4244F80259; Tue,  5 Oct 2021 16:13:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E624FF8010B
 for <alsa-devel@alsa-project.org>; Tue,  5 Oct 2021 16:13:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E624FF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="ir12NHxx"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633443207; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Ca8ObLfwkUCcFB5ku5eG9KfNriIp5DWh1htHY0friCw=;
 b=ir12NHxx5hEhfT1ZrNqvgdCFucbL8l34aXWtcohdUfJYEYA8ZUZHuCDKBN3tvRMZQc8WZJiz
 3DXCrQlLwn2PDiPQ5umjhl04g/zW9Zg6Pzeclrv96bXIwXV03CAHsVnFhmlU/c1FcnQRNY8D
 nIievGa3qcKG9Cz9t0wuGM5e5mc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 615c5d829ebaf35aaa207894 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Oct 2021 14:13:22
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9A4DEC4338F; Tue,  5 Oct 2021 14:13:21 +0000 (UTC)
Received: from [192.168.1.102] (unknown [157.48.255.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 17E52C004E7;
 Tue,  5 Oct 2021 14:13:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 17E52C004E7
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH] ASoC: qcom: soundwire: Enable soundwire bus clock for
 version 1.6
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1633105471-30928-1-git-send-email-srivasam@codeaurora.org>
 <a2b6a9c7-2191-4bc9-b03b-3b22b495a4be@linux.intel.com>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <2c18ff0c-cd24-356c-0104-086837ed7ff0@codeaurora.org>
Date: Tue, 5 Oct 2021 19:43:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <a2b6a9c7-2191-4bc9-b03b-3b22b495a4be@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>
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


On 10/1/2021 11:27 PM, Pierre-Louis Bossart wrote:
Thanks for Your time Bossart!!!
>> @@ -610,6 +611,12 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>>   	val = FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK, ctrl->rows_index);
>>   	val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK, ctrl->cols_index);
>>   
>> +	if (ctrl->swrm_hctl_reg) {
>> +		val = ioread32(ctrl->swrm_hctl_reg);
>> +		val &= 0xFFFFFFFD;
> magic value, use a #define MASK_SOMETHING?
Okay. will update it.
>
>> +		iowrite32(val, ctrl->swrm_hctl_reg);
>> +	}
>> +
>>   	ctrl->reg_write(ctrl, SWRM_MCP_FRAME_CTRL_BANK_ADDR(0), val);
>>   
>>   	/* Enable Auto enumeration */
>> @@ -1200,7 +1207,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>>   	struct qcom_swrm_ctrl *ctrl;
>>   	const struct qcom_swrm_data *data;
>>   	int ret;
>> -	u32 val;
>> +	int val, swrm_hctl_reg = 0;
>>   
>>   	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
>>   	if (!ctrl)
>> @@ -1251,6 +1258,9 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>>   	ctrl->bus.port_ops = &qcom_swrm_port_ops;
>>   	ctrl->bus.compute_params = &qcom_swrm_compute_params;
>>   
>> +	if (!of_property_read_u32(dev->of_node, "qcom,swrm-hctl-reg", &swrm_hctl_reg))
>> +		ctrl->swrm_hctl_reg = devm_ioremap(&pdev->dev, swrm_hctl_reg, 0x4);
> if (!ctrl->swrm_hctl_reg)
>      return -ENODEV;
>
> ?
I think here error check is not required, as this change is required 
only for soundwire version 1.6 and above.
>> +
>>   	ret = qcom_swrm_get_port_config(ctrl);
>>   	if (ret)
>>   		goto err_clk;
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

