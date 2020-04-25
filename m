Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 362351B86F0
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Apr 2020 16:14:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1DBA168B;
	Sat, 25 Apr 2020 16:13:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1DBA168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587824046;
	bh=1QpwKdE73VdGmWbybDMOwAJnfx2Em6MiVTWII2BAsCE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lvBr7I1CdMedOcVlQUBhgQn2Bte2o+koqN0gx1twRV/l+6n3Eo4uTQOdrsWyQmO8t
	 8xvPulZ7eSsaM8FhIdVjSs+owgpvZGgrt0wFWksypbC6dxiM2LkHkOehLX0mZXa5Bu
	 2yu+41A9jog1AMmSpJSVml86llQREu+9aaBnPglA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A187EF801ED;
	Sat, 25 Apr 2020 16:12:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73ED6F800BE; Sat, 25 Apr 2020 16:12:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71221F800BE
 for <alsa-devel@alsa-project.org>; Sat, 25 Apr 2020 16:12:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71221F800BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="VXMAX5xn"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1587823927; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=59LAOBTPIFuKk6qKf2sBdbTynIFRJNDeQyblJDnDHDA=;
 b=VXMAX5xnLC2FLfESeSlBZN20VXtmfSZotk6x03BNsGwUjJgtWl1U7Ud1g7c3jghp3XCIkHxc
 q8FMVbktTPlTd1BQo8wLw5qcdBfwYkhTNrv0G2ncbPIFX1hqx/kuEastIb6S0xArWvWnqMdJ
 D3jWhfoJ0m6vukGOrRAgumR/zCQ=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea44535.7fa4ea452148-smtp-out-n02;
 Sat, 25 Apr 2020 14:12:05 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9BFF2C433F2; Sat, 25 Apr 2020 14:12:04 +0000 (UTC)
Received: from [10.86.13.83]
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: ajitp)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id AD5CAC433CB;
 Sat, 25 Apr 2020 14:12:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AD5CAC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=ajitp@codeaurora.org
Subject: Re: [PATCH 02/11] ASoC: qcom: lpass: Add struct lpass_dai to store
 dai clocks pointer
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 alsa-devel@alsa-project.org, broonie@kernel.org, devicetree@vger.kernel.org,
 plai@codeaurora.org, bgoswami@codeaurora.org
References: <1586592171-31644-1-git-send-email-ajitp@codeaurora.org>
 <1586592171-31644-3-git-send-email-ajitp@codeaurora.org>
 <3b6fb5bf-c580-a543-ab70-d08113193a34@linaro.org>
From: Ajit Pandey <ajitp@codeaurora.org>
Message-ID: <d4a9d02a-5dcf-dd63-7563-bd141549267b@codeaurora.org>
Date: Sat, 25 Apr 2020 19:41:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3b6fb5bf-c580-a543-ab70-d08113193a34@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org, tiwai@suse.com
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

On 4/16/2020 1:26 PM, Srinivas Kandagatla wrote:
>
>
> On 11/04/2020 09:02, Ajit Pandey wrote:
>> lpass_dai will store clocks related to respective dai's and it will
>> be initialized during probe based on variant clock names.
>>
>> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
>
> I dont understand why do we need this change? What is the advantage of 
> doing this way vs the existing one?
>
>
> --srini
>
> Actually I've kept this in chain to add dai modes properties later in 
> chain in this struct but with adoption of Stephen patch now , i guess 
> we don't have any significant advantage now. I'll probably drop this 
> patch during v2 submission.      --Ajit
>> ---
>>   sound/soc/qcom/lpass-cpu.c | 89 
>> ++++++++++++++++++++++++++--------------------
>>   sound/soc/qcom/lpass.h     | 18 +++++-----
>>   2 files changed, 61 insertions(+), 46 deletions(-)
>>
>> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
>> index dbce7e9..492f27b 100644
>> --- a/sound/soc/qcom/lpass-cpu.c
>> +++ b/sound/soc/qcom/lpass-cpu.c
>> @@ -23,13 +23,15 @@ static int lpass_cpu_daiops_set_sysclk(struct 
>> snd_soc_dai *dai, int clk_id,
>>           unsigned int freq, int dir)
>>   {
>>       struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
>> -    int ret;
>> -
>> -    ret = clk_set_rate(drvdata->mi2s_osr_clk[dai->driver->id], freq);
>> -    if (ret)
>> -        dev_err(dai->dev, "error setting mi2s osrclk to %u: %d\n",
>> -            freq, ret);
>> +    struct lpass_dai *dai_data = drvdata->dai_priv[dai->driver->id];
>> +    int ret = 0;
>>   +    if (dai_data->osr_clk != NULL) {
>> +        ret = clk_set_rate(dai_data->osr_clk, freq);
>> +        if (ret)
>> +            dev_err(dai->dev, "error setting mi2s osrclk to %u:%d\n",
>> +                freq, ret);
>> +    }
>>       return ret;
>>   }
>>   @@ -37,18 +39,22 @@ static int lpass_cpu_daiops_startup(struct 
>> snd_pcm_substream *substream,
>>           struct snd_soc_dai *dai)
>>   {
>>       struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
>> +    struct lpass_dai *dai_data = drvdata->dai_priv[dai->driver->id];
>>       int ret;
>>   -    ret = clk_prepare_enable(drvdata->mi2s_osr_clk[dai->driver->id]);
>> -    if (ret) {
>> -        dev_err(dai->dev, "error in enabling mi2s osr clk: %d\n", ret);
>> -        return ret;
>> +    if (dai_data->osr_clk != NULL) {
>> +        ret = clk_prepare_enable(dai_data->osr_clk);
>> +        if (ret) {
>> +            dev_err(dai->dev,
>> +                "error in enabling mi2s osr clk: %d\n", ret);
>> +            return ret;
>> +        }
>>       }
>>   -    ret = clk_prepare_enable(drvdata->mi2s_bit_clk[dai->driver->id]);
>> +    ret = clk_prepare_enable(dai_data->bit_clk);
>>       if (ret) {
>>           dev_err(dai->dev, "error in enabling mi2s bit clk: %d\n", 
>> ret);
>> - clk_disable_unprepare(drvdata->mi2s_osr_clk[dai->driver->id]);
>> +        clk_disable_unprepare(dai_data->osr_clk);
>>           return ret;
>>       }
>>   @@ -59,16 +65,18 @@ static void lpass_cpu_daiops_shutdown(struct 
>> snd_pcm_substream *substream,
>>           struct snd_soc_dai *dai)
>>   {
>>       struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
>> +    struct lpass_dai *dai_data = drvdata->dai_priv[dai->driver->id];
>>   - clk_disable_unprepare(drvdata->mi2s_bit_clk[dai->driver->id]);
>> +    clk_disable_unprepare(dai_data->bit_clk);
>>   - clk_disable_unprepare(drvdata->mi2s_osr_clk[dai->driver->id]);
>> +    clk_disable_unprepare(dai_data->osr_clk);
>>   }
>>     static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream 
>> *substream,
>>           struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
>>   {
>>       struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
>> +    struct lpass_dai *dai_data = drvdata->dai_priv[dai->driver->id];
>>       snd_pcm_format_t format = params_format(params);
>>       unsigned int channels = params_channels(params);
>>       unsigned int rate = params_rate(params);
>> @@ -163,8 +171,7 @@ static int lpass_cpu_daiops_hw_params(struct 
>> snd_pcm_substream *substream,
>>           return ret;
>>       }
>>   -    ret = clk_set_rate(drvdata->mi2s_bit_clk[dai->driver->id],
>> -               rate * bitwidth * 2);
>> +    ret = clk_set_rate(dai_data->bit_clk, rate * bitwidth * 2);
>>       if (ret) {
>>           dev_err(dai->dev, "error setting mi2s bitclk to %u: %d\n",
>>               rate * bitwidth * 2, ret);
>> @@ -413,6 +420,25 @@ static bool lpass_cpu_regmap_volatile(struct 
>> device *dev, unsigned int reg)
>>       .cache_type = REGCACHE_FLAT,
>>   };
>>   +static int lpass_init_dai_clocks(struct device *dev,
>> +               struct lpass_data *drvdata)
>> +{
>> +    struct lpass_dai *dai;
>> +    struct lpass_variant *v = drvdata->variant;
>> +    int i;
>> +
>> +    for (i = 0; i < v->num_dai; i++) {
>> +
>> +        dai = drvdata->dai_priv[i];
>> +
>> +        dai->osr_clk = devm_clk_get_optional(dev,
>> +                             v->dai_osr_clk_names[i]);
>> +        dai->bit_clk = devm_clk_get(dev, v->dai_bit_clk_names[i]);
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>>   {
>>       struct lpass_data *drvdata;
>> @@ -421,7 +447,7 @@ int asoc_qcom_lpass_cpu_platform_probe(struct 
>> platform_device *pdev)
>>       struct lpass_variant *variant;
>>       struct device *dev = &pdev->dev;
>>       const struct of_device_id *match;
>> -    int ret, i, dai_id;
>> +    int ret, i;
>>         dsp_of_node = of_parse_phandle(pdev->dev.of_node, 
>> "qcom,adsp", 0);
>>       if (dsp_of_node) {
>> @@ -467,28 +493,15 @@ int asoc_qcom_lpass_cpu_platform_probe(struct 
>> platform_device *pdev)
>>           variant->init(pdev);
>>         for (i = 0; i < variant->num_dai; i++) {
>> -        dai_id = variant->dai_driver[i].id;
>> -        drvdata->mi2s_osr_clk[dai_id] = devm_clk_get(&pdev->dev,
>> -                         variant->dai_osr_clk_names[i]);
>> -        if (IS_ERR(drvdata->mi2s_osr_clk[dai_id])) {
>> -            dev_warn(&pdev->dev,
>> -                "%s() error getting optional %s: %ld\n",
>> -                __func__,
>> -                variant->dai_osr_clk_names[i],
>> -                PTR_ERR(drvdata->mi2s_osr_clk[dai_id]));
>> -
>> -            drvdata->mi2s_osr_clk[dai_id] = NULL;
>> -        }
>> +        drvdata->dai_priv[i] = devm_kzalloc(dev,
>> +                        sizeof(struct lpass_dai),
>> +                        GFP_KERNEL);
>> +    }
>>   -        drvdata->mi2s_bit_clk[dai_id] = devm_clk_get(&pdev->dev,
>> -                        variant->dai_bit_clk_names[i]);
>> -        if (IS_ERR(drvdata->mi2s_bit_clk[dai_id])) {
>> -            dev_err(&pdev->dev,
>> -                "error getting %s: %ld\n",
>> -                variant->dai_bit_clk_names[i],
>> -                PTR_ERR(drvdata->mi2s_bit_clk[dai_id]));
>> -            return PTR_ERR(drvdata->mi2s_bit_clk[dai_id]);
>> -        }
>> +    ret = lpass_init_dai_clocks(dev, drvdata);
>> +    if (ret) {
>> +        dev_err(&pdev->dev, "error intializing dai clock: %d\n", ret);
>> +        return ret;
>>       }
>>         drvdata->ahbix_clk = devm_clk_get(&pdev->dev, "ahbix-clk");
>> diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
>> index 17113d3..b729686 100644
>> --- a/sound/soc/qcom/lpass.h
>> +++ b/sound/soc/qcom/lpass.h
>> @@ -13,9 +13,14 @@
>>   #include <linux/platform_device.h>
>>   #include <linux/regmap.h>
>>   -#define LPASS_AHBIX_CLOCK_FREQUENCY        131072000
>> -#define LPASS_MAX_MI2S_PORTS            (8)
>> -#define LPASS_MAX_DMA_CHANNELS            (8)
>> +#define LPASS_AHBIX_CLOCK_FREQUENCY            131072000
>> +#define LPASS_MAX_MI2S_PORTS                   (8)
>> +#define LPASS_MAX_DMA_CHANNELS                 (8)
>> +
>> +struct lpass_dai {
>> +    struct clk *osr_clk;
>> +    struct clk *bit_clk;
>> +};
>>     /* Both the CPU DAI and platform drivers will access this data */
>>   struct lpass_data {
>> @@ -23,11 +28,8 @@ struct lpass_data {
>>       /* AHB-I/X bus clocks inside the low-power audio subsystem 
>> (LPASS) */
>>       struct clk *ahbix_clk;
>>   -    /* MI2S system clock */
>> -    struct clk *mi2s_osr_clk[LPASS_MAX_MI2S_PORTS];
>> -
>> -    /* MI2S bit clock (derived from system clock by a divider */
>> -    struct clk *mi2s_bit_clk[LPASS_MAX_MI2S_PORTS];
>> +    /* MI2S dai specific configuration */
>> +    struct lpass_dai *dai_priv[LPASS_MAX_MI2S_PORTS];
>>         /* low-power audio interface (LPAIF) registers */
>>       void __iomem *lpaif;
>>
