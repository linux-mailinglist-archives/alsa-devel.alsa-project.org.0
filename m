Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FD63CEAF5
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jul 2021 20:26:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58FE2167D;
	Mon, 19 Jul 2021 20:25:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58FE2167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626719189;
	bh=jVN/sEgFeBA8/P9TtSKSRvIRWWxVKoZ121xECjFIOwE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J9CJc2VTTQ0WW0srIiJObad3ko68cReHa6YuLXGLrF3ym1Z6XRPOXgp2LuTrh6omL
	 W1RKaHe9An5UGW3DSosffCYhVpeHVKGOwvMYgUQTyv8MuQHRdomdpx38LMfFwOrTBu
	 u021Ofkx8g1cn03U7gzZqSoJxL0IgiSfHQVnKX2s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FFD8F80169;
	Mon, 19 Jul 2021 20:24:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B15AF804D0; Mon, 19 Jul 2021 20:24:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEF74F800DA
 for <alsa-devel@alsa-project.org>; Mon, 19 Jul 2021 20:24:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEF74F800DA
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="190697635"
X-IronPort-AV: E=Sophos;i="5.84,252,1620716400"; d="scan'208";a="190697635"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 11:24:36 -0700
X-IronPort-AV: E=Sophos;i="5.84,252,1620716400"; d="scan'208";a="414430046"
Received: from rraymond-mobl1.amr.corp.intel.com (HELO [10.209.130.70])
 ([10.209.130.70])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 11:24:35 -0700
Subject: Re: [PATCH V3 06/12] ASoC: amd: irq handler changes for ACP5x PCM dma
 driver
To: Vijendar Mukunda <vijendar.mukunda@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20210719165140.16143-1-vijendar.mukunda@amd.com>
 <20210719165140.16143-7-vijendar.mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a9566929-0fa0-f8f0-58ce-99a1e111e6a2@linux.intel.com>
Date: Mon, 19 Jul 2021 13:11:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210719165140.16143-7-vijendar.mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Sunil-kumar.Dommati@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Alexander.Deucher@amd.com, krisman@collabora.com
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


> +static irqreturn_t i2s_irq_handler(int irq, void *dev_id)
> +{
> +	struct i2s_dev_data *vg_i2s_data;
> +	u16 irq_flag;
> +	u32 val;
> +
> +	vg_i2s_data = dev_id;
> +	if (!vg_i2s_data)
> +		return IRQ_NONE;
> +
> +	irq_flag = 0;
> +	val = acp_readl(vg_i2s_data->acp5x_base + ACP_EXTERNAL_INTR_STAT);
> +	if ((val & BIT(HS_TX_THRESHOLD)) && vg_i2s_data->play_stream) {
> +		acp_writel(BIT(HS_TX_THRESHOLD), vg_i2s_data->acp5x_base +
> +			   ACP_EXTERNAL_INTR_STAT);
> +		snd_pcm_period_elapsed(vg_i2s_data->play_stream);
> +		irq_flag = 1;
> +	}
> +	if ((val & BIT(I2S_TX_THRESHOLD)) &&
> +	    vg_i2s_data->i2ssp_play_stream) {

use single line?

> +		acp_writel(BIT(I2S_TX_THRESHOLD),
> +			   vg_i2s_data->acp5x_base + ACP_EXTERNAL_INTR_STAT);
> +		snd_pcm_period_elapsed(vg_i2s_data->i2ssp_play_stream);
> +		irq_flag = 1;
> +	}
> +
> +	if ((val & BIT(HS_RX_THRESHOLD)) && vg_i2s_data->capture_stream) {
> +		acp_writel(BIT(HS_RX_THRESHOLD), vg_i2s_data->acp5x_base +
> +			   ACP_EXTERNAL_INTR_STAT);
> +		snd_pcm_period_elapsed(vg_i2s_data->capture_stream);
> +		irq_flag = 1;
> +	}
> +	if ((val & BIT(I2S_RX_THRESHOLD)) &&
> +	    vg_i2s_data->i2ssp_capture_stream) {

use single line?

> +		acp_writel(BIT(I2S_RX_THRESHOLD),
> +			   vg_i2s_data->acp5x_base + ACP_EXTERNAL_INTR_STAT);
> +		snd_pcm_period_elapsed(vg_i2s_data->i2ssp_capture_stream);
> +		irq_flag = 1;
> +	}
> +
> +	if (irq_flag)
> +		return IRQ_HANDLED;
> +	else
> +		return IRQ_NONE;
> +}
> +
>  static int acp5x_audio_probe(struct platform_device *pdev)
>  {
>  	struct resource *res;
>  	struct i2s_dev_data *adata;
> +	unsigned int irqflags;
>  	int status;
>  
>  	if (!pdev->dev.platform_data) {
> @@ -47,6 +94,14 @@ static int acp5x_audio_probe(struct platform_device *pdev)
>  					 resource_size(res));
>  	if (!adata->acp5x_base)
>  		return -ENOMEM;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> +	if (!res) {
> +		dev_err(&pdev->dev, "IORESOURCE_IRQ FAILED\n");
> +		return -ENODEV;
> +	}
> +
> +	adata->i2s_irq = res->start;
>  	dev_set_drvdata(&pdev->dev, adata);
>  	status = devm_snd_soc_register_component(&pdev->dev,
>  						 &acp5x_i2s_component,
> @@ -55,6 +110,12 @@ static int acp5x_audio_probe(struct platform_device *pdev)
>  		dev_err(&pdev->dev, "Fail to register acp i2s component\n");
>  		return -ENODEV;
>  	}
> +	status = devm_request_irq(&pdev->dev, adata->i2s_irq, i2s_irq_handler,
> +				  irqflags, "ACP5x_I2S_IRQ", adata);
> +	if (status) {
> +		dev_err(&pdev->dev, "ACP5x I2S IRQ request failed\n");
> +		return -ENODEV;
> +	}

return status?

>  	return 0;
>  }
>  
> diff --git a/sound/soc/amd/vangogh/acp5x.h b/sound/soc/amd/vangogh/acp5x.h
> index d2853738eb17..18df2b5a4283 100644
> --- a/sound/soc/amd/vangogh/acp5x.h
> +++ b/sound/soc/amd/vangogh/acp5x.h
> @@ -31,9 +31,18 @@
>  #define ACP5x_HS_TDM_REG_END	0x1242824
>  #define I2S_MODE 0x00
>  #define ACP5x_I2S_MODE 0x00
> +#define	I2S_RX_THRESHOLD 27
> +#define	I2S_TX_THRESHOLD 28
> +#define	HS_TX_THRESHOLD 24
> +#define	HS_RX_THRESHOLD 23
>  
>  struct i2s_dev_data {
> +	unsigned int i2s_irq;
>  	void __iomem *acp5x_base;
> +	struct snd_pcm_substream *play_stream;
> +	struct snd_pcm_substream *capture_stream;
> +	struct snd_pcm_substream *i2ssp_play_stream;
> +	struct snd_pcm_substream *i2ssp_capture_stream;
>  };
>  
>  /* common header file uses exact offset rather than relative
> 
