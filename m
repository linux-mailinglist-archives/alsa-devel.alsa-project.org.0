Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E66C9442C16
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Nov 2021 12:03:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FB7F16CF;
	Tue,  2 Nov 2021 12:02:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FB7F16CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635850989;
	bh=aQMUDlAG5XQ5cpoeRZgci1zEFVWm4IQ4plB2zf8w9vo=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B/lSNYgLVk7kuBRztRWLL47NG4YTsnJXwgQAGvjq1kWOE0GxTeMMmePFBNVDNPwJi
	 wsMd7GhmfGZ2bXyJvHCOfBHXyIkIS2Y/dZ/n/mMBIMBPmtQQglkdM8IJEnbYFwNnOC
	 8raolP+3//fj9ARIynrw4kamBl2Ee7EoJnHq3XhE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6D92F8025F;
	Tue,  2 Nov 2021 12:01:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6F3DF8025D; Tue,  2 Nov 2021 12:01:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 580F9F8012E
 for <alsa-devel@alsa-project.org>; Tue,  2 Nov 2021 12:01:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 580F9F8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="avg0T8mR"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635850908; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=qXzp9Dq3okeTeCCG2IPt/sqOPmtUhJPZ3qV0EbiFkQo=;
 b=avg0T8mRyoJps18t+vN4+huTu5WuTeqwYxOgynga6tf6sp7bedtQKBL1JQSVFKu9l8100PxY
 D98tNLtmbkFNWSjxBZp4r//0bA+lDirQJtYov5zH0PIQSk0EzNxlgR3Ftcqa41oG7zHjSW5k
 JL3D6tg6TYtqxTp5HN+FHIenFOU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 61811a93aeb2390556afd332 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Nov 2021 11:01:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7CD12C4338F; Tue,  2 Nov 2021 11:01:39 +0000 (UTC)
Received: from [10.242.143.72] (unknown [202.46.23.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 76430C43616;
 Tue,  2 Nov 2021 11:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 76430C43616
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v4 2/2] ASoC: qcom: SC7280: Add machine driver
To: Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 bjorn.andersson@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org,
 judyhsiao@chromium.org, lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, perex@perex.cz, plai@codeaurora.org,
 robh+dt@kernel.org, rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org,
 tiwai@suse.com
References: <1635519876-7112-1-git-send-email-srivasam@codeaurora.org>
 <1635519876-7112-3-git-send-email-srivasam@codeaurora.org>
 <CAE-0n51zXLZiaB9aCdv=p_Wcxr5ZEdN-=b1hd5VATL6-CD0vRw@mail.gmail.com>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <ee81276a-0715-0e55-9944-6c021075911e@codeaurora.org>
Date: Tue, 2 Nov 2021 16:31:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n51zXLZiaB9aCdv=p_Wcxr5ZEdN-=b1hd5VATL6-CD0vRw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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


On 10/30/2021 12:40 AM, Stephen Boyd wrote:
Thanks for our time Stephen!!!
> Quoting Srinivasa Rao Mandadapu (2021-10-29 08:04:36)
>> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
>> index cc7c1de..d9ffcb7 100644
>> --- a/sound/soc/qcom/Kconfig
>> +++ b/sound/soc/qcom/Kconfig
>> @@ -152,4 +152,16 @@ config SND_SOC_SC7180
>>            SC7180 SoC-based systems.
>>            Say Y if you want to use audio device on this SoCs.
>>
>> +config SND_SOC_SC7280
>> +       tristate "SoC Machine driver for SC7280 boards"
>> +       depends on I2C && SOUNDWIRE
> Add || COMPILE_TEST so we can compile test this driver?
Okay. Will add it.
>
>> +       select SND_SOC_QCOM_COMMON
>> +       select SND_SOC_MAX98357A
>> +       select SND_SOC_LPASS_RX_MACRO
>> +       select SND_SOC_LPASS_TX_MACRO
>> +       help
>> +         To add support for audio on Qualcomm Technologies Inc.
> Drop "To"?
Okay.
>
>> +         SC7280 SoC-based systems.
>> +         Say Y if you want to use audio device on this SoCs.
>> +
>>   endif #SND_SOC_QCOM
>> diff --git a/sound/soc/qcom/sc7280.c b/sound/soc/qcom/sc7280.c
>> new file mode 100644
>> index 0000000..1d73b4f
>> --- /dev/null
>> +++ b/sound/soc/qcom/sc7280.c
>> @@ -0,0 +1,343 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +//
>> +// Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
>> +//
>> +// sc7280.c -- ALSA SoC Machine driver for sc7280
> Please remove filename from the comment as it's not useful and may
> change.
Okay.
>> +
>> +#include <linux/gpio.h>
> [...]
>> +
>> +static void sc7280_snd_shutdown(struct snd_pcm_substream *substream)
>> +{
>> +       struct snd_soc_pcm_runtime *rtd = substream->private_data;
>> +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
>> +
>> +       switch (cpu_dai->id) {
>> +       case LPASS_CDC_DMA_RX0:
>> +       case LPASS_CDC_DMA_TX3:
>> +       case LPASS_CDC_DMA_VA_TX0:
>> +               break;
>> +       case MI2S_SECONDARY:
>> +               break;
>> +       case LPASS_DP_RX:
>> +               break;
>> +       default:
>> +               dev_err(rtd->dev, "%s: invalid dai id %d\n", __func__, cpu_dai->id);
>> +               break;
>> +       }
> The function doesn't do anything though. Why do we care?
Okay. will remove 'sc7280_snd_startup' and 'sc7280_snd_shutdown'.
>
>> +}
>> +
>> +static const struct snd_soc_ops sc7280_ops = {
>> +       .startup = sc7280_snd_startup,
>> +       .shutdown = sc7280_snd_shutdown,
>> +       .hw_params = sc7280_snd_hw_params,
>> +       .hw_free = sc7280_snd_hw_free,
>> +       .prepare = sc7280_snd_prepare,
>> +};
>> +
>> +static const struct snd_soc_dapm_widget sc7280_snd_widgets[] = {
>> +       SND_SOC_DAPM_HP("Headphone Jack", NULL),
>> +       SND_SOC_DAPM_MIC("Headset Mic", NULL),
>> +};
>> +
>> +static int sc7280_snd_platform_probe(struct platform_device *pdev)
>> +{
>> +       struct snd_soc_card *card;
>> +       struct sc7280_snd_data *data;
>> +       struct device *dev = &pdev->dev;
>> +       struct snd_soc_dai_link *link;
>> +       int ret, i;
>> +
>> +       data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>> +       if (!data)
>> +               return -ENOMEM;
>> +
>> +       card = &data->card;
>> +       snd_soc_card_set_drvdata(card, data);
>> +
>> +       card->owner = THIS_MODULE;
>> +       card->driver_name = "SC7280";
>> +       card->dev = dev;
>> +
>> +       ret = qcom_snd_parse_of(card);
>> +       if (ret)
>> +               return ret;
>> +
>> +       for_each_card_prelinks(card, i, link) {
>> +               link->init = sc7280_init;
>> +               link->ops = &sc7280_ops;
>> +       }
>> +
>> +       return devm_snd_soc_register_card(dev, card);
>> +}
>> +
>> +static const struct of_device_id sc7280_snd_device_id[]  = {
>> +       {.compatible = "google,sc7280-herobrine"},
> Please add space after { and before }
Okay.
>> +       {}
>> +};
>> +MODULE_DEVICE_TABLE(of, sc7280_snd_device_id);

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

