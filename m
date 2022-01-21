Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4E6495C87
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jan 2022 10:07:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42D4E2C0B;
	Fri, 21 Jan 2022 10:07:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42D4E2C0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642756073;
	bh=WFROXGt1Io5GRagxufZfoJG97h4lFiKgwSfWhouDzI0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AMpE6PZ9W+1nh9MX8GTFb20+aPzU5ghffOB7bK7sgFnFtQeb5SwAdZUBDMn50hKnj
	 2zSb6HBYXSQ9gkrUZlrx5g8APswdIxFcNk6xkxJizXnMIKPf0Slit4S6Jm755X5MM1
	 c3/k0xaAH5Lvdq8UfNe65uoqMUIIlXmKbikdxls0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBD40F8007E;
	Fri, 21 Jan 2022 10:06:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F0C2F8028B; Fri, 21 Jan 2022 10:06:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58653F8007E
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 10:06:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58653F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="PCobS+4w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642755998; x=1674291998;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=WFROXGt1Io5GRagxufZfoJG97h4lFiKgwSfWhouDzI0=;
 b=PCobS+4wx/R9zzgODKQKhpODAf5k13SHJVjACz8AGR4zCanwQJaQrWsq
 JrrXx5TnUp2B4DqLoWtcZsRKwWhsp1tqiQEYC/CV5AmSWe9TRPa//ZsP4
 kH3hM5A0KWG2BU72ubDsk9hyyvABoYhqxoitw7ebOHvIku15w8A+9ZOwW
 GiAgwfNGt4/lig3XKwyG4kiTMziMIhGmyKrZDESFDiAJRU1Q+I68tvy0p
 EVywOBf5LAzZc+BBLJjhxzoffgediQDUm5wtCzuhX6Ad7Uqbnm8DmWrlJ
 H6D6G+d7AE9GEqKQdl4uVo5ABuTJK4IL4vwzifXu2ZExJSPIdOpsfSaOH w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245393949"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="245393949"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 01:06:29 -0800
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="533197205"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.237.180.112])
 ([10.237.180.112])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 01:06:26 -0800
Message-ID: <aa839d9e-76b8-1ee2-048b-1982ff9bdb31@linux.intel.com>
Date: Fri, 21 Jan 2022 10:06:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/6] ASoC: xilinx: xlnx_i2s: create drvdata structure
Content-Language: en-US
To: Robert Hancock <robert.hancock@calian.com>, alsa-devel@alsa-project.org
References: <20220120195832.1742271-1-robert.hancock@calian.com>
 <20220120195832.1742271-3-robert.hancock@calian.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20220120195832.1742271-3-robert.hancock@calian.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
 broonie@kernel.org, tiwai@suse.com, michal.simek@xilinx.com,
 maruthi.srinivas.bayyavarapu@xilinx.com, lgirdwood@gmail.com,
 robh+dt@kernel.org
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

On 1/20/2022 8:58 PM, Robert Hancock wrote:
> An upcoming change will require storing additional driver data other
> than the memory base address. Create a drvdata structure and use that
> rather than storing the raw base address pointer.
> 
> Signed-off-by: Robert Hancock <robert.hancock@calian.com>
> ---
>   sound/soc/xilinx/xlnx_i2s.c | 66 ++++++++++++++++++++-----------------
>   1 file changed, 35 insertions(+), 31 deletions(-)
> 
> diff --git a/sound/soc/xilinx/xlnx_i2s.c b/sound/soc/xilinx/xlnx_i2s.c
> index cc641e582c82..3bafa34b789a 100644
> --- a/sound/soc/xilinx/xlnx_i2s.c
> +++ b/sound/soc/xilinx/xlnx_i2s.c
> @@ -22,15 +22,20 @@
>   #define I2S_CH0_OFFSET			0x30
>   #define I2S_I2STIM_VALID_MASK		GENMASK(7, 0)
>   
> +struct xlnx_i2s_drv_data {
> +	struct snd_soc_dai_driver dai_drv;
> +	void __iomem *base;
> +};
> +
>   static int xlnx_i2s_set_sclkout_div(struct snd_soc_dai *cpu_dai,
>   				    int div_id, int div)
>   {
> -	void __iomem *base = snd_soc_dai_get_drvdata(cpu_dai);
> +	struct xlnx_i2s_drv_data *drv_data = snd_soc_dai_get_drvdata(cpu_dai);
>   
>   	if (!div || (div & ~I2S_I2STIM_VALID_MASK))
>   		return -EINVAL;
>   
> -	writel(div, base + I2S_I2STIM_OFFSET);
> +	writel(div, drv_data->base + I2S_I2STIM_OFFSET);
>   
>   	return 0;
>   }
> @@ -40,13 +45,13 @@ static int xlnx_i2s_hw_params(struct snd_pcm_substream *substream,
>   			      struct snd_soc_dai *i2s_dai)
>   {
>   	u32 reg_off, chan_id;
> -	void __iomem *base = snd_soc_dai_get_drvdata(i2s_dai);
> +	struct xlnx_i2s_drv_data *drv_data = snd_soc_dai_get_drvdata(i2s_dai);
>   
>   	chan_id = params_channels(params) / 2;
>   
>   	while (chan_id > 0) {
>   		reg_off = I2S_CH0_OFFSET + ((chan_id - 1) * 4);
> -		writel(chan_id, base + reg_off);
> +		writel(chan_id, drv_data->base + reg_off);
>   		chan_id--;
>   	}
>   
> @@ -56,18 +61,18 @@ static int xlnx_i2s_hw_params(struct snd_pcm_substream *substream,
>   static int xlnx_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
>   			    struct snd_soc_dai *i2s_dai)
>   {
> -	void __iomem *base = snd_soc_dai_get_drvdata(i2s_dai);
> +	struct xlnx_i2s_drv_data *drv_data = snd_soc_dai_get_drvdata(i2s_dai);
>   
>   	switch (cmd) {
>   	case SNDRV_PCM_TRIGGER_START:
>   	case SNDRV_PCM_TRIGGER_RESUME:
>   	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> -		writel(1, base + I2S_CORE_CTRL_OFFSET);
> +		writel(1, drv_data->base + I2S_CORE_CTRL_OFFSET);
>   		break;
>   	case SNDRV_PCM_TRIGGER_STOP:
>   	case SNDRV_PCM_TRIGGER_SUSPEND:
>   	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> -		writel(0, base + I2S_CORE_CTRL_OFFSET);
> +		writel(0, drv_data->base + I2S_CORE_CTRL_OFFSET);
>   		break;
>   	default:
>   		return -EINVAL;
> @@ -95,20 +100,19 @@ MODULE_DEVICE_TABLE(of, xlnx_i2s_of_match);
>   
>   static int xlnx_i2s_probe(struct platform_device *pdev)
>   {
> -	void __iomem *base;
> -	struct snd_soc_dai_driver *dai_drv;
> +	struct xlnx_i2s_drv_data *drv_data;
>   	int ret;
>   	u32 ch, format, data_width;
>   	struct device *dev = &pdev->dev;
>   	struct device_node *node = dev->of_node;
>   
> -	dai_drv = devm_kzalloc(&pdev->dev, sizeof(*dai_drv), GFP_KERNEL);
> -	if (!dai_drv)
> +	drv_data = devm_kzalloc(&pdev->dev, sizeof(*drv_data), GFP_KERNEL);
> +	if (!drv_data)
>   		return -ENOMEM;
>   
> -	base = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(base))
> -		return PTR_ERR(base);
> +	drv_data->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(drv_data->base))
> +		return PTR_ERR(drv_data->base);
>   
>   	ret = of_property_read_u32(node, "xlnx,num-channels", &ch);
>   	if (ret < 0) {
> @@ -134,35 +138,35 @@ static int xlnx_i2s_probe(struct platform_device *pdev)
>   	}
>   
>   	if (of_device_is_compatible(node, "xlnx,i2s-transmitter-1.0")) {
> -		dai_drv->name = "xlnx_i2s_playback";
> -		dai_drv->playback.stream_name = "Playback";
> -		dai_drv->playback.formats = format;
> -		dai_drv->playback.channels_min = ch;
> -		dai_drv->playback.channels_max = ch;
> -		dai_drv->playback.rates	= SNDRV_PCM_RATE_8000_192000;
> -		dai_drv->ops = &xlnx_i2s_dai_ops;
> +		drv_data->dai_drv.name = "xlnx_i2s_playback";
> +		drv_data->dai_drv.playback.stream_name = "Playback";
> +		drv_data->dai_drv.playback.formats = format;
> +		drv_data->dai_drv.playback.channels_min = ch;
> +		drv_data->dai_drv.playback.channels_max = ch;
> +		drv_data->dai_drv.playback.rates	= SNDRV_PCM_RATE_8000_192000;
> +		drv_data->dai_drv.ops = &xlnx_i2s_dai_ops;
>   	} else if (of_device_is_compatible(node, "xlnx,i2s-receiver-1.0")) {
> -		dai_drv->name = "xlnx_i2s_capture";
> -		dai_drv->capture.stream_name = "Capture";
> -		dai_drv->capture.formats = format;
> -		dai_drv->capture.channels_min = ch;
> -		dai_drv->capture.channels_max = ch;
> -		dai_drv->capture.rates = SNDRV_PCM_RATE_8000_192000;
> -		dai_drv->ops = &xlnx_i2s_dai_ops;
> +		drv_data->dai_drv.name = "xlnx_i2s_capture";
> +		drv_data->dai_drv.capture.stream_name = "Capture";
> +		drv_data->dai_drv.capture.formats = format;
> +		drv_data->dai_drv.capture.channels_min = ch;
> +		drv_data->dai_drv.capture.channels_max = ch;
> +		drv_data->dai_drv.capture.rates = SNDRV_PCM_RATE_8000_192000;
> +		drv_data->dai_drv.ops = &xlnx_i2s_dai_ops;
>   	} else {
>   		return -ENODEV;
>   	}
>   
> -	dev_set_drvdata(&pdev->dev, base);
> +	dev_set_drvdata(&pdev->dev, drv_data);
>   
>   	ret = devm_snd_soc_register_component(&pdev->dev, &xlnx_i2s_component,
> -					      dai_drv, 1);
> +					      &drv_data->dai_drv, 1);
>   	if (ret) {
>   		dev_err(&pdev->dev, "i2s component registration failed\n");
>   		return ret;
>   	}
>   
> -	dev_info(&pdev->dev, "%s DAI registered\n", dai_drv->name);
> +	dev_info(&pdev->dev, "%s DAI registered\n", drv_data->dai_drv.name);
>   
>   	return ret;
>   }

I don't think this patch is needed, snd_soc_dai, already has pointer to 
its snd_soc_dai_driver, so there is no need to keep it additionally in 
drvdata?

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/sound/soc-dai.h?h=v5.16#n431


