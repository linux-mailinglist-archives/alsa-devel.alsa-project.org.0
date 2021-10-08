Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFCC426418
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Oct 2021 07:32:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97364166F;
	Fri,  8 Oct 2021 07:31:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97364166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633671160;
	bh=DYWmkJAzIKunMvQiYFoGCjH5lq8n7fabmg3RFDjtElg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e0KdeHILjpoMp/18nfl71awEga3WVr+jH4rYMOvC4NgVL6NON8B3ZwMClusJbG/Kx
	 +zYtEBs2MnskZfihSgKerxVEAt0jpPJjz53feKKfiHDXd2c4RfahmuO4IyCFweBTf5
	 omTDJhYNtTIo1XD+gX3qDdJhAR08+/tx5g8U8FPY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25894F80249;
	Fri,  8 Oct 2021 07:31:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57953F80246; Fri,  8 Oct 2021 07:31:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_BL_SPAMCOP_NET,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E260EF80124
 for <alsa-devel@alsa-project.org>; Fri,  8 Oct 2021 07:31:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E260EF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="RLJZsgyy"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633671074; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=5fqkLzv17nAU7AoHusUunmFmWi2eHMme4Jqx8XPinZ0=;
 b=RLJZsgyyZilteuVxGl+r5azwGn5UGcYZkQXJPhrhuHMudK9Im761Wbva5ZYSmVUyVIonmmqA
 CGf461bZkC3QoYOdW8tB1ki3GXu8xDzGjELAo7cZ8MIUbmQA/kfotPIIx39lA8Y9fius/K6m
 1TfIWJP0DrbsnTdHUEYY6hcY48A=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 615fd79f03355859c82dac51 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 08 Oct 2021 05:31:11
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DB1FEC4360C; Fri,  8 Oct 2021 05:31:10 +0000 (UTC)
Received: from [192.168.1.100] (unknown [157.48.163.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id AC47AC43460;
 Fri,  8 Oct 2021 05:31:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org AC47AC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH] ASoC: qcom: soundwire: Enable soundwire bus clock for
 version 1.6
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <1633105471-30928-1-git-send-email-srivasam@codeaurora.org>
 <YVyE+ytKVmOh85c3@ripper>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <7969646f-6dfb-b03f-886c-38987fe01395@codeaurora.org>
Date: Fri, 8 Oct 2021 11:00:59 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YVyE+ytKVmOh85c3@ripper>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Thanks for Your time Bjorn!!!

On 10/5/2021 10:31 PM, Bjorn Andersson wrote:
> On Fri 01 Oct 09:24 PDT 2021, Srinivasa Rao Mandadapu wrote:
>
>> Add support for soundwire 1.6 version to gate RX/TX bus clock.
>>
>> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> ---
>>   drivers/soundwire/qcom.c | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>> index 0ef79d6..599b3ed 100644
>> --- a/drivers/soundwire/qcom.c
>> +++ b/drivers/soundwire/qcom.c
>> @@ -127,6 +127,7 @@ struct qcom_swrm_ctrl {
>>   	struct device *dev;
>>   	struct regmap *regmap;
>>   	void __iomem *mmio;
>> +	char __iomem *swrm_hctl_reg;
>>   	struct completion broadcast;
>>   	struct completion enumeration;
>>   	struct work_struct slave_work;
>> @@ -610,6 +611,12 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>>   	val = FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK, ctrl->rows_index);
>>   	val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK, ctrl->cols_index);
>>   
>> +	if (ctrl->swrm_hctl_reg) {
>> +		val = ioread32(ctrl->swrm_hctl_reg);
>> +		val &= 0xFFFFFFFD;
> That's a tricky way of saying:
>
> 	val &= ~BIT(1);
>
> That said, naming bit 1 is still a very good thing.
Okay. will change accordingly.
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
> Nack.
>
> You may not pull an address to a single register out of an undocumented
> DT property and blindly ioremap that.
>
> And you surely should check for errors here, to avoid magical errors
> caused by this ioremap failing and your bit not being cleared.
>
> Thanks,
> Bjorn
Okay. will add error check, as Bossart Suggested.
>
>> +
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

