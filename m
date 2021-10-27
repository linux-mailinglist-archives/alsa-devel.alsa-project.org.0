Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 325AF43C45F
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Oct 2021 09:50:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E40916D9;
	Wed, 27 Oct 2021 09:49:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E40916D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635321003;
	bh=gS78O4YU0shiGK4aj3NB8RTUYQAyTKwHVIWpOezeTh4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PveKtnKekrxwPEYlrby5gle7OoeMEYIC8rzDQCxyC/eRx4O+9xKT8lBItsFnFZUCn
	 ahPLdQ1gXn+FrGvKocTLX/wiMBqlU3jzjZZI2IWyPI9ulPNPgb5O1utiLvdhVGT0hv
	 w0oYuon2lmKHkGcH84ljKzRLB6c774Xm75i52fxA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D322F8016C;
	Wed, 27 Oct 2021 09:49:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5600F80271; Wed, 27 Oct 2021 09:49:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BC1CF800D1
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 09:49:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BC1CF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="G9AwVS78"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635320949; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=8GMdHbbqAULcs7zIj12mg8RI8efLCizjjiOsYZymurY=;
 b=G9AwVS78V0QPKbpAsjictYWGuY3LVcL6Mi/ELc0pwXDKpquqMb2mx/u8aWvyo+UxWa+XkJNp
 WfF+5DeBv3OcEyznUz1fYsL67H+qplKTX8As57LtXq9G77vcTeZSGpbp1ZLyvafv9Vn/h+Ck
 uWzKSI8jQpSsTxHekLPwrqS8eYo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 61790469308e0dd330203953 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 27 Oct 2021 07:48:57
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id F22D8C43617; Wed, 27 Oct 2021 07:48:56 +0000 (UTC)
Received: from [10.242.143.72] (unknown [202.46.23.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 99EA1C43616;
 Wed, 27 Oct 2021 07:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 99EA1C43616
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH 3/3] pinctrl: qcom: Add SC7280 lpass pin configuration
To: Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 bjorn.andersson@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org,
 judyhsiao@chromium.org, lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, perex@perex.cz, plai@codeaurora.org,
 robh+dt@kernel.org, rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org,
 tiwai@suse.com
References: <1633614519-26680-1-git-send-email-srivasam@codeaurora.org>
 <1633614519-26680-4-git-send-email-srivasam@codeaurora.org>
 <CAE-0n53SqOHKDpMQicrFNmZ1YxAPesTAk4j6kJVi3xMV8re4-w@mail.gmail.com>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <1d951b30-8298-b739-51c4-13cb2de741b9@codeaurora.org>
Date: Wed, 27 Oct 2021 13:18:49 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n53SqOHKDpMQicrFNmZ1YxAPesTAk4j6kJVi3xMV8re4-w@mail.gmail.com>
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


On 10/7/2021 11:24 PM, Stephen Boyd wrote:
> Quoting Srinivasa Rao Mandadapu (2021-10-07 06:48:39)
>> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> index c0117c5..0b68065 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> @@ -237,6 +264,15 @@ static struct lpi_pinctrl_variant_data sm8250_lpi_data = {
>>          .nfunctions = ARRAY_SIZE(lpass_functions),
>>   };
>>
>> +static struct lpi_pinctrl_variant_data sc7280_lpi_data = {
> Can this variant data be const?
Okay. Will change accordingly.
>> +       .pins = lpass_lpi_pins,
>> +       .npins = ARRAY_SIZE(lpass_lpi_pins),
>> +       .groups = sc7280_groups,
>> +       .ngroups = ARRAY_SIZE(sc7280_groups),
>> +       .functions = lpass_functions,
>> +       .nfunctions = ARRAY_SIZE(lpass_functions),
>> +};
>> +
>>   static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
>>                           unsigned int addr)
>>   {

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

