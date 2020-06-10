Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D60C1F52AD
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jun 2020 12:56:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB2BE167A;
	Wed, 10 Jun 2020 12:56:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB2BE167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591786612;
	bh=g1dtgK8kN4wUnuI4ImmWubSoQDXCvVksNmoJIYVdsaY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qD0li6Ee2NZWJp/8XiyyIvqYI5K6wSWyqqX9UG1X0HlOBtlWhE8G+LQhHJU+tzo/h
	 783CnEmZ/AaYzozuEb04trMrkZiFCCOeISSVzaN3FVuqN5sx4BbIfRA4CQGEqJwrNR
	 AnB6Z/hLN5P1/fgmNcHuYYUj6TaVDFDjBQ63Lpi0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38EF4F8021E;
	Wed, 10 Jun 2020 12:55:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25F7AF80252; Wed, 10 Jun 2020 12:55:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CB6AF8021E
 for <alsa-devel@alsa-project.org>; Wed, 10 Jun 2020 12:55:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CB6AF8021E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="jDje1DsU"
Received: by mail-wr1-x444.google.com with SMTP id j10so1726629wrw.8
 for <alsa-devel@alsa-project.org>; Wed, 10 Jun 2020 03:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p2RFeiibpKE23Dhz521nn9ShSJ5sAPi1377fNv5lHps=;
 b=jDje1DsUWjt5BwPhCsIxSFOh4TVXM6BxGMjn2SXZHm4M5KayIthJd41xFmMn6abbFC
 we/86rJxUniHyQlzT3WDJ+xrVZyGh8Ebjd/Fva7BIRw7EiEPVZGq45uI9n2eUCmRqZbZ
 4uT5b3dekz9fqlIE9knKyVReElGHAfF56C0cA7S84OvNDEwBifaUB/OuIunopHsbiZx2
 6sm6kggCyoDQ2q3B7hsO/heTOg8OA2pPqvIpQd5PtzbLUNg8nlNZORT6SHX/Tz9YlwCt
 GNB3t+57OUwSn2Y0pm7Bwht0r2r1Q02kwM+mrIHPKdfmLuqMB/04JM1U4kvtGRJYwjdn
 Hg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p2RFeiibpKE23Dhz521nn9ShSJ5sAPi1377fNv5lHps=;
 b=txaKTQWBrARgkyMj+lCFKLWbuMqQLSGEAt7kSBjXjpKL3A5LQkdOHCKv4vpS96wosO
 bi7yE+SzConxZcxhOY1ExirHJd8/++tYw+jzClUhkB4BPWOaJJCOuEcmQ93lae4o4ep0
 OdEE2BiH8tBVEL0YSY/MElG1qzzYJlvPzkEkML3URTnayJhSksKL4iMjch/9/7MaSgao
 QI7kHssy4ndv1vep0b0qfsRx4QK56vQy16rX3RkXyOj/NdR0WmH3UdqP9VJ9ombPM0Me
 3dskVnsSC7p8v1ezNn/CcNmUuZKn86CC8arTUV6upNIQLDqrDksZoYRv+ak80THNpjQa
 UaCA==
X-Gm-Message-State: AOAM533TZvN/rYTiBCDKg6isvxlbHwF/xvWwi4h7elEOGdPfZzwU9AaJ
 aBMU77jy6D+7nSjOafRwZKsu9u588ZI=
X-Google-Smtp-Source: ABdhPJy1TIM86aeyGmfk+tAc3Hlf5KZ9+WSN/YPjeDex6TRfEFnPxsUozlQeAdsky2C/99YWVoZ91A==
X-Received: by 2002:adf:d84a:: with SMTP id k10mr2999635wrl.336.1591786525398; 
 Wed, 10 Jun 2020 03:55:25 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id g3sm8326829wrb.46.2020.06.10.03.55.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jun 2020 03:55:24 -0700 (PDT)
Subject: Re: [PATCH 2/5] soundwire: qcom: add support for mmio soundwire
 devices
To: Jonathan Marek <jonathan@marek.ca>, alsa-devel@alsa-project.org
References: <20200608204347.19685-1-jonathan@marek.ca>
 <20200608204347.19685-3-jonathan@marek.ca>
 <1b29db61-2394-8f88-9ebb-219568fb9306@linaro.org>
 <009dd6c1-276f-4ac5-b68b-1fe2de50ad8c@marek.ca>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <d72ffc03-c20e-60a6-19df-d8b4a1486358@linaro.org>
Date: Wed, 10 Jun 2020 11:55:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <009dd6c1-276f-4ac5-b68b-1fe2de50ad8c@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>, Sanyog Kale <sanyog.r.kale@intel.com>,
 open list <linux-kernel@vger.kernel.org>
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



On 09/06/2020 12:04, Jonathan Marek wrote:
> On 6/9/20 5:19 AM, Srinivas Kandagatla wrote:
>>
>>
>> On 08/06/2020 21:43, Jonathan Marek wrote:
>>> Adds support for qcom soundwire devices with memory mapped IO registers.
>>>
>>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>>> ---
>>
>> In general patch itself looks pretty trivial, but I would like to see 
>> what 1.5.1 controller provides in terms of error reporting of 
>> SoundWire slave register reads/writes. On WCD based controller we did 
>> not have a mechanism to report things like if the read is ignored or 
>> not. I was hoping that this version of controller would be able to 
>> report that.
>>
>> I will be nice to those patches if that is something which is 
>> supported in this version.
>>
>> --srini
>>
> 
> It does seem to support additional error reporting (it gets an error 
> during enumeration after finding the 2 WSA slaves). However the 
> downstream driver seems to disable this by setting BIT(31) in 
> FIFO_CFG_ADDR (the comment says "For SWR master version 1.5.1, continue 
> execute on command ignore"). Outside of the initial enumeration, it 
> doesn't seem to produce any extra errors (still relying on the timeout 
> mechanism to know if read/write is ignored).

1.5.* versions support reporting CMD_NACKED in FIFO_STATUS register, so 
you should use that instead of timeout mechanism which is used for 1.3.0 
which did not have support for this.


thanks,
srini


> 
>>>   drivers/soundwire/qcom.c | 25 +++++++++++++++++++++++--
>>>   1 file changed, 23 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>>> index f38d1fd3679f..628747df1c75 100644
>>> --- a/drivers/soundwire/qcom.c
>>> +++ b/drivers/soundwire/qcom.c
>>> @@ -90,6 +90,7 @@ struct qcom_swrm_ctrl {
>>>       struct sdw_bus bus;
>>>       struct device *dev;
>>>       struct regmap *regmap;
>>> +    void __iomem *mmio;
>>>       struct completion *comp;
>>>       struct work_struct slave_work;
>>>       /* read/write lock */
>>> @@ -154,6 +155,20 @@ static int qcom_swrm_ahb_reg_write(struct 
>>> qcom_swrm_ctrl *ctrl,
>>>       return SDW_CMD_OK;
>>>   }
>>> +static int qcom_swrm_cpu_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
>>> +                  u32 *val)
>>> +{
>>> +    *val = readl(ctrl->mmio + reg);
>>> +    return SDW_CMD_OK;
>>> +}
>>> +
>>> +static int qcom_swrm_cpu_reg_write(struct qcom_swrm_ctrl *ctrl, int 
>>> reg,
>>> +                   int val)
>>> +{
>>> +    writel(val, ctrl->mmio + reg);
>>> +    return SDW_CMD_OK;
>>> +}
>>> +
>>>   static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *ctrl, 
>>> u8 cmd_data,
>>>                        u8 dev_addr, u16 reg_addr)
>>>   {
>>> @@ -746,6 +761,7 @@ static int qcom_swrm_probe(struct platform_device 
>>> *pdev)
>>>       struct sdw_master_prop *prop;
>>>       struct sdw_bus_params *params;
>>>       struct qcom_swrm_ctrl *ctrl;
>>> +    struct resource *res;
>>>       int ret;
>>>       u32 val;
>>> @@ -760,8 +776,13 @@ static int qcom_swrm_probe(struct 
>>> platform_device *pdev)
>>>           if (!ctrl->regmap)
>>>               return -EINVAL;
>>>       } else {
>>> -        /* Only WCD based SoundWire controller is supported */
>>> -        return -ENOTSUPP;
>>> +        res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> +
>>> +        ctrl->reg_read = qcom_swrm_cpu_reg_read;
>>> +        ctrl->reg_write = qcom_swrm_cpu_reg_write;
>>> +        ctrl->mmio = devm_ioremap_resource(dev, res);
>>> +        if (IS_ERR(ctrl->mmio))
>>> +            return PTR_ERR(ctrl->mmio);
>>>       }
>>>       ctrl->irq = of_irq_get(dev->of_node, 0);
>>>
