Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7193A1595
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Jun 2021 15:27:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 194AB16C3;
	Wed,  9 Jun 2021 15:27:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 194AB16C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623245273;
	bh=JZpHW6JfzgdYmb6bHChojYoMnJxccCWhf+CRoh7sFUw=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A48woRgsBMHTCv74cSvOYtfmWFA2cJLTQTBCtgqXaKCnC3wYraauQ5T7XYXbfmj3P
	 4Bwowcpd6Rm6JdTzR4x/87ZxOMycMTfbzeWVE795WrK9H0rL35N0KNRSuYct5G7gH6
	 yD6jYLkpzP3bd0e48HuAIdKz1nSoQxK+fw7WQv9I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BCDCF80212;
	Wed,  9 Jun 2021 15:26:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C88C2F8026C; Wed,  9 Jun 2021 15:26:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9340BF80116
 for <alsa-devel@alsa-project.org>; Wed,  9 Jun 2021 15:26:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9340BF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="icIGUDeo"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1623245177; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=DZYzep55GMVsKblHkPVsD6f4rzxsDJDWH6F3pGRGvBA=;
 b=icIGUDeoCTmt2sl01edJ0D45m73D+SzBzhVLuYzuXDsEUq8c/dCs5HAKDUwwBC5zwB7R8Rx1
 Md8UqUafXYNb7HELEQqWB2Xd3HwwsV7gH9JTIgsNFO7mgL/drn+L0okCW47D0VxJK9zoLR8E
 2Srt9naSXcJ1xJ4QOkR1FwaSYIU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60c0c164abfd22a3dc3c2690 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 09 Jun 2021 13:25:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8F9F9C433F1; Wed,  9 Jun 2021 13:25:55 +0000 (UTC)
Received: from [192.168.29.24] (unknown [49.37.144.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 473CEC433D3;
 Wed,  9 Jun 2021 13:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 473CEC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH v2] ASoC: qcom: Add four speaker support on MI2S secondary
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <20210609071313.18206-1-srivasam@codeaurora.org>
 <d21e8951-583c-562b-421a-54ec206610ef@linaro.org>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <74b4f6d1-f5ae-5704-9728-790dfb1c4b33@codeaurora.org>
Date: Wed, 9 Jun 2021 18:55:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d21e8951-583c-562b-421a-54ec206610ef@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Srini,

Thanks for your Time!!!

On 6/9/2021 1:40 PM, Srinivas Kandagatla wrote:
>
>
> On 09/06/2021 08:13, Srinivasa Rao Mandadapu wrote:
>> Add four speaker support on MI2S secondary block
>> by using I2S SD1 line on gpio52 pin, and add channel map
>> control support in the lpass-cpu audio driver.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> ---
>> Changes Since V1:
>>     -- removed set_channel_map/get_channel_map implementation as 
>> default kcontrols
>>         added in pcm_new API.
>>
>>   sound/soc/qcom/lpass-cpu.c    | 32 ++++++++++++++++++++++++++++++++
>>   sound/soc/qcom/lpass-sc7180.c |  1 +
>>   sound/soc/qcom/lpass.h        |  2 ++
>>   3 files changed, 35 insertions(+)
>>
>> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
>> index c62d2612e8f5..15d69e311b38 100644
>> --- a/sound/soc/qcom/lpass-cpu.c
>> +++ b/sound/soc/qcom/lpass-cpu.c
>> @@ -29,6 +29,14 @@
>>   #define LPASS_CPU_I2S_SD0_1_2_MASK    GENMASK(2, 0)
>>   #define LPASS_CPU_I2S_SD0_1_2_3_MASK    GENMASK(3, 0)
>>   +/*
>> + * Channel maps for Quad channel playbacks on MI2S Secondary
>> + */
>> +static struct snd_pcm_chmap_elem lpass_quad_chmaps = {
>> +        .channels = 4,
>> +        .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_RL,
>> +                SNDRV_CHMAP_FR, SNDRV_CHMAP_RR }
>
> AFAIU, You would need an empty entry at the end of this list if not we 
> will endup in a dereferencing memory sitting right next to this array 
> which will lead to random memory corruptions...
>
> Have a look at some of the examples in existing codec drivers.
>
> Other than that patch looks good.
>
> --srini
Okay. Will change accordingly.
>
>
>> +};
>>   static int lpass_cpu_init_i2sctl_bitfields(struct device *dev,
>>               struct lpaif_i2sctl *i2sctl, struct regmap *map)
>>   {
>> @@ -324,6 +332,25 @@ const struct snd_soc_dai_ops 
>> asoc_qcom_lpass_cpu_dai_ops = {
>>   };
>>   EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_dai_ops);
>>   +int lpass_cpu_pcm_new(struct snd_soc_pcm_runtime *rtd,
>> +                struct snd_soc_dai *dai)
>> +{
>> +    int ret;
>> +    struct snd_soc_dai_driver *drv = dai->driver;
>> +    struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
>> +
>> +    if (drvdata->mi2s_playback_sd_mode[dai->id] == 
>> LPAIF_I2SCTL_MODE_QUAD01) {
>> +        ret =  snd_pcm_add_chmap_ctls(rtd->pcm, 
>> SNDRV_PCM_STREAM_PLAYBACK,
>> +                &lpass_quad_chmaps, drv->playback.channels_max, 0,
>> +                NULL);
>> +        if (ret < 0)
>> +            return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(lpass_cpu_pcm_new);
>> +
>>   int asoc_qcom_lpass_cpu_dai_probe(struct snd_soc_dai *dai)
>>   {
>>       struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
>> @@ -856,6 +883,11 @@ int asoc_qcom_lpass_cpu_platform_probe(struct 
>> platform_device *pdev)
>>                   PTR_ERR(drvdata->mi2s_bit_clk[dai_id]));
>>               return PTR_ERR(drvdata->mi2s_bit_clk[dai_id]);
>>           }
>> +        if (drvdata->mi2s_playback_sd_mode[dai_id] ==
>> +            LPAIF_I2SCTL_MODE_QUAD01) {
>> + variant->dai_driver[dai_id].playback.channels_min = 4;
>> + variant->dai_driver[dai_id].playback.channels_max = 4;
>> +        }
>>       }
>>         /* Allocation for i2sctl regmap fields */
>> diff --git a/sound/soc/qcom/lpass-sc7180.c 
>> b/sound/soc/qcom/lpass-sc7180.c
>> index 8c168d3c589e..77a556b27cf0 100644
>> --- a/sound/soc/qcom/lpass-sc7180.c
>> +++ b/sound/soc/qcom/lpass-sc7180.c
>> @@ -58,6 +58,7 @@ static struct snd_soc_dai_driver 
>> sc7180_lpass_cpu_dai_driver[] = {
>>           },
>>           .probe    = &asoc_qcom_lpass_cpu_dai_probe,
>>           .ops    = &asoc_qcom_lpass_cpu_dai_ops,
>> +        .pcm_new = lpass_cpu_pcm_new,
>>       }, {
>>           .id = LPASS_DP_RX,
>>           .name = "Hdmi",
>> diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
>> index 83b2e08ade06..623ddccdafff 100644
>> --- a/sound/soc/qcom/lpass.h
>> +++ b/sound/soc/qcom/lpass.h
>> @@ -259,5 +259,7 @@ void asoc_qcom_lpass_cpu_platform_shutdown(struct 
>> platform_device *pdev);
>>   int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev);
>>   int asoc_qcom_lpass_cpu_dai_probe(struct snd_soc_dai *dai);
>>   extern const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops;
>> +int lpass_cpu_pcm_new(struct snd_soc_pcm_runtime *rtd,
>> +                struct snd_soc_dai *dai);
>>     #endif /* __LPASS_H__ */
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

