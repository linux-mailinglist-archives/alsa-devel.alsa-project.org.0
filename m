Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E6220CC44
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jun 2020 06:08:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46AC61672;
	Mon, 29 Jun 2020 06:07:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46AC61672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593403700;
	bh=TQb7zB+YIHSbDMWf0imyg3nZE+ZtkrRmFfYRFzINNes=;
	h=Subject:From:To:References:Date:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=UTZ+9Yq6rspt6B9oEKHkE5q0ObyDj++0ber6L6zUhwTU5PZJq1XmDzkkOgboBrJye
	 qYXSFgWkO6B5+TJTjT6YYTW0Tz4gtIApeF/8uOLKWjYNPObqlSKuFsNUAAZ2esjUCm
	 x5yn5CjMHRxzx1fzkx+hi0wnFhlCKhqh8Wu9uaTo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68997F80217;
	Mon, 29 Jun 2020 06:06:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AB61F8020C; Mon, 29 Jun 2020 06:06:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H4, RCVD_IN_MSPIKE_WL, RCVD_IN_SORBS_WEB, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAE58F80096
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 06:06:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAE58F80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="jbMCjnCK"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1593403587; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Date: Message-ID: References: Cc: To: From: Subject:
 Sender; bh=EmrKCkgP4iCZaqvJB6jD2kmolaeqRn8tn/HSl9cr+F8=;
 b=jbMCjnCKttdMxeyxIXnBxjJ+qZhMesIKSNbRJOpRZzD1+EZSTbmZjv8Gnsch2qXwxm0IAvg3
 xt/pxK8J4OmBf3Wbp0LOfRJ64TQrILBpjdsFDBFomeKbnyCk2qfmdqDmuIc4z5lKRwWZXVqU
 X1i3UEuBvXGwKTQnFlqkEYiu0wk=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5ef968c1356bcc26ab5caefc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 29 Jun 2020 04:06:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5F2DEC433CA; Mon, 29 Jun 2020 04:06:24 +0000 (UTC)
Received: from [192.168.0.129] (unknown [183.83.142.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rohitkr)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3B3BEC433C8;
 Mon, 29 Jun 2020 04:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3B3BEC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=rohitkr@codeaurora.org
Subject: Re: [PATCH v2 4/7] ASoC: qcom: lpass: Use regmap_field for i2sctl and
 dmactl registers
From: Rohit Kumar <rohitkr@codeaurora.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Ajit Pandey <ajitp@codeaurora.org>, broonie@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org
References: =?UTF-8?Q?=3c=1c1586592171-31644-1-git-send-email-ajitp=40codeau?=
 =?UTF-8?Q?rora=2eorg=1d=3e_=3c1589474298-29437-1-git-send-email-ajitp=40cod?=
 =?UTF-8?Q?eaurora=2eorg=3e_=3c1589474298-29437-5-git-send-email-ajitp=40cod?=
 =?UTF-8?Q?eaurora=2eorg=3e_=3ca3527251-cafd-6d8f-3f96-0549b220af09=40linaro?=
 =?UTF-8?Q?=2eorg=3e_=3c3c4093c5-d538-8508-ae98-c313ffdea250=40codeaurora=2e?=
 =?UTF-8?Q?org=3e?=
Message-ID: <d20c0d0d-cb03-9209-97a9-befbfc1f4611@codeaurora.org>
Date: Mon, 29 Jun 2020 09:36:18 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
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

Hello Srini,

On 6/27/2020 11:32 PM, Rohit Kumar wrote:
> Thanks Srini for reviewing the change.
>
>
> On 5/18/2020 3:19 PM, Srinivas Kandagatla wrote:
>>
>>
>> On 14/05/2020 17:38, Ajit Pandey wrote:
>>> I2SCTL and DMACTL registers has different bits alignment for newer
>>> LPASS variants of SC7180 soc. Instead of adding extra overhead for
>>> calculating masks and shifts for newer variants registers layout we
>>> changed the approach to use regmap_field_write() API to update bit.
>>> Such API's will internally do the required bit shift and mask based
>>> on reg_field struct defined for bit fields. We'll define REG_FIELD()
>>> macros with bit layout for both lpass variants and use such macros
>>> to initialize register fields in variant specific driver callbacks.
>>> Also added new bitfieds values for I2SCTL and DMACTL registers and
>>> removed shifts and mask macros for such registers from header file.
>>>
>>> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
>>> ---
>>>   sound/soc/qcom/lpass-apq8016.c   |  61 ++++++++++++
>>>   sound/soc/qcom/lpass-cpu.c       | 114 +++++++++++++---------
>>>   sound/soc/qcom/lpass-lpaif-reg.h | 203 
>>> ++++++++++++++++++++++++---------------
>>>   sound/soc/qcom/lpass-platform.c  |  86 +++++++++++------
>>>   sound/soc/qcom/lpass.h           |  30 ++++++
>>>   5 files changed, 340 insertions(+), 154 deletions(-)
>>>
>>
>> Thanks for moving this to regmap fields, looks clean!
>> However this patch just removed support to lpass-ipq806x.c variant, 
>> which should to be taken care of while doing patches that apply to 
>> all variants.
>>
> Right. I will make the change as part of next patchset.
>>
>>> diff --git a/sound/soc/qcom/lpass-apq8016.c 
>>> b/sound/soc/qcom/lpass-apq8016.c
>>> index 8210e37..3149645 100644
>>> --- a/sound/soc/qcom/lpass-apq8016.c
>>> +++ b/sound/soc/qcom/lpass-apq8016.c
>>> @@ -124,6 +124,32 @@
>>>       },
>>>   };
>>>   +static int apq8016_init_dmactl_bitfields(struct lpaif_dmactl 
>>> *dmactl,
>>> +                     struct regmap *map,
>>> +                     unsigned int reg)
>>> +{
>>> +    struct reg_field bursten = DMACTL_BURSTEN_FLD(reg);
>>> +    struct reg_field wpscnt = DMACTL_WPSCNT_FLD(reg);
>>> +    struct reg_field fifowm = DMACTL_FIFOWM_FLD(reg);
>>> +    struct reg_field intf = DMACTL_AUDINTF_FLD(reg);
>>> +    struct reg_field enable = DMACTL_ENABLE_FLD(reg);
>>> +    struct reg_field dyncclk = DMACTL_DYNCLK_FLD(reg);
>>> +
>>> +    dmactl->bursten = regmap_field_alloc(map, bursten);
>>> +    dmactl->wpscnt = regmap_field_alloc(map, wpscnt);
>>> +    dmactl->fifowm = regmap_field_alloc(map, fifowm);
>>> +    dmactl->intf = regmap_field_alloc(map, intf);
>>> +    dmactl->enable = regmap_field_alloc(map, enable);
>>> +    dmactl->dyncclk = regmap_field_alloc(map, dyncclk);
>>
>> My idea was to move this all regmap fields to variant structure and 
>> common code will do the regmap_filed_alloc rather than each variant 
>> duplicating the same code for each variant, also am guessing some of 
>> the members in the lpass_variant structure tp become redundant due to 
>> regmap field which can be removed as well.
>>
>> ex :
>>
>> struct lpass_variant {
>>     ...
>>     struct reg_field bursten
>>     ...
>> };
>>
>> in lpass-apq8016.c
>>
>> we do
>> static struct lpass_variant apq8016_data = {
>>
>>     .bursten = REG_FIELD(reg, 11, 11),
>>     ...
>> }
>>
> We can keep reg_field in lpass_variant, but assignment in the struct 
> will be a problem as
>
> reg is variable here. So, we need to expose an API in lpass_variant to 
> assign reg_field.
>
> regmap_field will still be in dmactl/i2sctl structs as it differs for 
> different dma channel/i2s port
>
> respectively. Please share your thoughts.

While making changes, I felt like there is no significance of keeping 
reg_field variables inside

lpass_variant struct. Below are the reasons:

* We anyway have to expose an API to fill the regfields as reg is 
variable in REG_FIELD(reg, 11, 11)

* In case of sc7180, RD_DMA and WR_DMA control register has different 
field mask. So, values

different for playback and capture. I was thinking of exposing an API 
which will just fill the reg_field

in the struct passed something like this:

static void apq8016_init_dmactl_regfields(struct lpaif_dmactl_regfields 
*dmactl,
                         unsigned int reg, int dir)
{
         struct reg_field bursten =  DMACTL_BURSTEN_FLD(reg);
         struct reg_field wpscnt = DMACTL_WPSCNT_FLD(reg);
         struct reg_field fifowm = DMACTL_FIFOWM_FLD(reg);
         struct reg_field intf = DMACTL_AUDINTF_FLD(reg);
         struct reg_field enable = DMACTL_ENABLE_FLD(reg);
         struct reg_field dyncclk = DMACTL_DYNCLK_FLD(reg);

         dmactl->bursten = bursten;
         dmactl->wpscnt = wpscnt;
         dmactl->fifowm = fifowm;
         dmactl->intf = intf;
         dmactl->enable = enable;
         dmactl->dyncclk = dyncclk;
}

This will be called by lpass-platform.c where we can do regmap_field_alloc.

So, we will have common function for regmap_field_alloc. Please share 
your inputs.

>
>> in lpass-cpu.c we can do the real regmap_field_alloc
>> asoc_qcom_lpass_cpu_platform_probe
>>
> Yes, I will move regmap_field_alloc to lpass_cpu.c in next patchset.
>>
>>
>>> +
>>> +    if (IS_ERR(dmactl->bursten) || IS_ERR(dmactl->wpscnt) ||
>>> +        IS_ERR(dmactl->fifowm) || IS_ERR(dmactl->intf) ||
>>> +        IS_ERR(dmactl->enable) || IS_ERR(dmactl->dyncclk))
>>> +        return -EINVAL;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   static int apq8016_lpass_alloc_dma_channel(struct lpass_data 
>>> *drvdata,
>>>                          int direction)
>>>   {
>>> @@ -158,6 +184,39 @@ static int 
>>> apq8016_lpass_free_dma_channel(struct lpass_data *drvdata, int chan)
>>>       return 0;
>>>   }
>>>   +static int sc7180_init_i2sctl_bitfields(struct lpaif_i2sctl *i2sctl,
>>> +                    struct regmap *map, unsigned int reg)
>>> +{
>> Should this be apq8016_init_i2sctl_bitfields
>>
>> Please make sure that you compile the code before sending it out!
>>
> Will take care in next patchset.
>
>>
>> --srini
>>
>>>
> Thanks,
>
> Rohit
>
Thanks,

Rohit

-- 
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the Linux Foundation.

