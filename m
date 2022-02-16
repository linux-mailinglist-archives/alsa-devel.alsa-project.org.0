Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FCB4B80D4
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 07:54:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DE861760;
	Wed, 16 Feb 2022 07:53:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DE861760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644994482;
	bh=fALBUYNqw/cii4IPZnxXRsbWtdXX5R5FQV7D6myqK1k=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=okKblAEEmqtlOJrnHFQye4hZp2jrrYLBh1d/lGPhVkDSnkN4TQDYbZ1Po5uBI71y9
	 lrwviSW7749OJ6kNf/gbtu1IdltJCn8MPzUoX3pa22fO5PW6yOHsCWE2E/w0AO3J//
	 q5hOUL/7et9gCbDxIVogs42wlPgWd86oUTxK65cQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA6F4F800C0;
	Wed, 16 Feb 2022 07:53:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D2A2F80128; Wed, 16 Feb 2022 07:53:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55E4AF800C0
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 07:53:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55E4AF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="mhCie5mF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644994405; x=1676530405;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=1EZcRDQzy8Bp06L63yFNgTwYFlFWyoSkNe0jThSsp6s=;
 b=mhCie5mFcLOcbEYjuiTPSPQZijNx+Bl3nOOiem6LW2+eVN7wuZd/HS0k
 azP2rWqWYxzX1pylAVjCwC+N25qVv/Sx5lD9X0kpzBkowii7zzwg+2LlS
 IIEbIfbWuRBTiPFM483dFi0ZloHpnnUrNzBN4kGE5NIAncLcWzDYwhmgD g=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 15 Feb 2022 22:53:21 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:53:20 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 15 Feb 2022 22:53:20 -0800
Received: from [10.216.55.237] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 15 Feb
 2022 22:53:14 -0800
Subject: Re: [RESEND v13 07/10] ASoC: qcom: Add support for codec dma driver
To: Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
 <alsa-devel@alsa-project.org>, <bgoswami@codeaurora.org>,
 <bjorn.andersson@linaro.org>, <broonie@kernel.org>,
 <devicetree@vger.kernel.org>, <judyhsiao@chromium.org>,
 <lgirdwood@gmail.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <perex@perex.cz>, <quic_plai@quicinc.com>,
 <robh+dt@kernel.org>, <rohitkr@codeaurora.org>,
 <srinivas.kandagatla@linaro.org>, <tiwai@suse.com>
References: <1644850708-11099-1-git-send-email-quic_srivasam@quicinc.com>
 <1644850708-11099-8-git-send-email-quic_srivasam@quicinc.com>
 <CAE-0n507RB89eoTPGUemdWh4cbcXtWkxKLt_0nCy8xGeJhb1sA@mail.gmail.com>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
Message-ID: <0093b56c-95a0-7344-1480-2473f790db90@quicinc.com>
Date: Wed, 16 Feb 2022 12:23:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n507RB89eoTPGUemdWh4cbcXtWkxKLt_0nCy8xGeJhb1sA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>
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


On 2/15/2022 6:57 AM, Stephen Boyd wrote:
Thanks for your time and valuable review comments Stephen!!!
> Quoting Srinivasa Rao Mandadapu (2022-02-14 06:58:25)
>> Upadate lpass cpu and platform driver to support audio over codec dma
>> in ADSP bypass use case.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>> Reported-by: kernel test robot <lkp@intel.com>
>> ---
>>   sound/soc/qcom/lpass-cpu.c      |  59 ++++-
>>   sound/soc/qcom/lpass-platform.c | 499 ++++++++++++++++++++++++++++++++++++++--
>>   2 files changed, 537 insertions(+), 21 deletions(-)
>>
>> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
>> index 4fb9669..a5a46bc 100644
>> --- a/sound/soc/qcom/lpass-cpu.c
>> +++ b/sound/soc/qcom/lpass-cpu.c
>> @@ -1042,7 +1042,9 @@ static void of_lpass_cpu_parse_dai_data(struct device *dev,
>>                  }
>>                  if (id == LPASS_DP_RX) {
>>                          data->hdmi_port_enable = 1;
>> -               } else {
>> +               } else if (is_cdc_dma_port(id))
> Please add braces if any of the other arms of the if statement have
> braces
Okay.
>
> 	} else if (is_cdc_dma_port(id)) {
>
>> +                       data->codec_dma_enable = 1;
>> +               else {
>
> 	} else {
>
>>                          data->mi2s_playback_sd_mode[id] =
>>                                  of_lpass_cpu_parse_sd_lines(dev, node,
>>                                                              "qcom,playback-sd-lines");
>> @@ -1057,6 +1059,7 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>>   {
>>          struct lpass_data *drvdata;
>>          struct device_node *dsp_of_node;
>> +       struct resource *res;
>>          struct lpass_variant *variant;
>>          struct device *dev = &pdev->dev;
>>          const struct of_device_id *match;
>> @@ -1082,6 +1085,58 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>>
>>          of_lpass_cpu_parse_dai_data(dev, drvdata);
>>
>> +       drvdata->num_clks =  variant->num_clks;
>> +       if (drvdata->codec_dma_enable) {
>> +               drvdata->rxtx_lpaif =
>> +                               devm_platform_ioremap_resource_byname(pdev, "lpass-rxtx-lpaif");
>> +               if (IS_ERR(drvdata->rxtx_lpaif))
>> +                       return PTR_ERR(drvdata->rxtx_lpaif);
>> +
>> +               drvdata->va_lpaif = devm_platform_ioremap_resource_byname(pdev, "lpass-va-lpaif");
>> +               if (IS_ERR(drvdata->va_lpaif))
>> +                       return PTR_ERR(drvdata->va_lpaif);
>> +
>> +               lpass_rxtx_regmap_config.max_register = LPAIF_CDC_RXTX_WRDMAPER_REG(variant,
>> +                                       variant->rxtx_wrdma_channels +
>> +                                       variant->rxtx_wrdma_channel_start, LPASS_CDC_DMA_TX3);
>> +
>> +               drvdata->rxtx_lpaif_map = devm_regmap_init_mmio(dev, drvdata->rxtx_lpaif,
>> +                                       &lpass_rxtx_regmap_config);
>> +               if (IS_ERR(drvdata->rxtx_lpaif_map)) {
>> +                       dev_err(dev, "error initializing rxtx regmap: %ld\n",
>> +                               PTR_ERR(drvdata->rxtx_lpaif_map));
> The regmap core already prints when things go wrong. Let's just use that
> instead of adding another error message.
Okay. Will remove print here.
>
>> +                       return PTR_ERR(drvdata->rxtx_lpaif_map);
>> +               }
>> +               lpass_va_regmap_config.max_register = LPAIF_CDC_VA_WRDMAPER_REG(variant,
>> +                                       variant->va_wrdma_channels +
>> +                                       variant->va_wrdma_channel_start, LPASS_CDC_DMA_VA_TX0);
>> +
>> +               drvdata->va_lpaif_map = devm_regmap_init_mmio(dev, drvdata->va_lpaif,
>> +                                       &lpass_va_regmap_config);
>> +               if (IS_ERR(drvdata->va_lpaif_map)) {
>> +                       dev_err(dev, "error initializing va regmap: %ld\n",
>> +                               PTR_ERR(drvdata->va_lpaif_map));
>> +                       return PTR_ERR(drvdata->va_lpaif_map);
>> +               }
>> +               drvdata->cdc_clks = devm_kcalloc(dev, variant->cdc_dma_num_clks,
>> +                                       sizeof(*drvdata->cdc_clks), GFP_KERNEL);
>> +               drvdata->cdc_num_clks = variant->cdc_dma_num_clks;
>> +
>> +               for (i = 0; i < drvdata->cdc_num_clks; i++)
>> +                       drvdata->cdc_clks[i].id = variant->cdc_dma_clk_names[i];
>> +
>> +               ret = devm_clk_bulk_get(dev, drvdata->cdc_num_clks, drvdata->cdc_clks);
> Do you care about particular clks? If not please use
> devm_clk_bulk_get_all() and stop storing clk names and counts.
Yes, individual clocks are required in cdc dma driver.  Will change 
individual clock voting with naming.
>
>> +               if (ret) {
>> +                       dev_err(dev, "Failed to get clocks %d\n", ret);
>> +                       return ret;
>> +               }
>> +
>> +               res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-rxtx-cdc-dma-lpm");
>> +               drvdata->rxtx_cdc_dma_lpm_buf = res->start;
>> +
>> +               res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-va-cdc-dma-lpm");
>> +               drvdata->va_cdc_dma_lpm_buf = res->start;
>> +       }
>>          drvdata->lpaif = devm_platform_ioremap_resource_byname(pdev, "lpass-lpaif");
>>          if (IS_ERR(drvdata->lpaif))
>>                  return PTR_ERR(drvdata->lpaif);
>> @@ -1124,7 +1179,7 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>>
>>          for (i = 0; i < variant->num_dai; i++) {
>>                  dai_id = variant->dai_driver[i].id;
>> -               if (dai_id == LPASS_DP_RX)
>> +               if (dai_id == LPASS_DP_RX || is_cdc_dma_port(dai_id))
>>                          continue;
>>
>>                  drvdata->mi2s_osr_clk[dai_id] = devm_clk_get_optional(dev,
>> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
>> index 5d77240..12b8d40 100644
>> --- a/sound/soc/qcom/lpass-platform.c
>> +++ b/sound/soc/qcom/lpass-platform.c
>> @@ -20,6 +20,9 @@
>>
>>   #define LPASS_PLATFORM_BUFFER_SIZE     (24 *  2 * 1024)
>>   #define LPASS_PLATFORM_PERIODS         2
>> +#define LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE (8 * 1024)
>> +#define LPASS_VA_CDC_DMA_LPM_BUFF_SIZE (12 * 1024)
>> +#define LPASS_CDC_DMA_REGISTER_FIELDS_MAX 15
>>
>>   static const struct snd_pcm_hardware lpass_platform_pcm_hardware = {
>>          .info                   =       SNDRV_PCM_INFO_MMAP |
>> @@ -45,6 +48,99 @@ static const struct snd_pcm_hardware lpass_platform_pcm_hardware = {
>>          .fifo_size              =       0,
>>   };
>>
>> +static const struct snd_pcm_hardware lpass_platform_rxtx_hardware = {
>> +       .info                   =       SNDRV_PCM_INFO_MMAP |
>> +                                       SNDRV_PCM_INFO_MMAP_VALID |
>> +                                       SNDRV_PCM_INFO_INTERLEAVED |
>> +                                       SNDRV_PCM_INFO_PAUSE |
>> +                                       SNDRV_PCM_INFO_RESUME,
>> +       .formats                =       SNDRV_PCM_FMTBIT_S16 |
>> +                                       SNDRV_PCM_FMTBIT_S24 |
>> +                                       SNDRV_PCM_FMTBIT_S32,
>> +       .rates                  =       SNDRV_PCM_RATE_8000_192000,
>> +       .rate_min               =       8000,
>> +       .rate_max               =       192000,
>> +       .channels_min           =       1,
>> +       .channels_max           =       8,
>> +       .buffer_bytes_max       =       LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE,
>> +       .period_bytes_max       =       LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE /
>> +                                               LPASS_PLATFORM_PERIODS,
>> +       .period_bytes_min       =       LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE /
>> +                                               LPASS_PLATFORM_PERIODS,
>> +       .periods_min            =       LPASS_PLATFORM_PERIODS,
>> +       .periods_max            =       LPASS_PLATFORM_PERIODS,
>> +       .fifo_size              =       0,
>> +};
>> +
>> +static const struct snd_pcm_hardware lpass_platform_va_hardware = {
>> +       .info                   =       SNDRV_PCM_INFO_MMAP |
>> +                                       SNDRV_PCM_INFO_MMAP_VALID |
>> +                                       SNDRV_PCM_INFO_INTERLEAVED |
>> +                                       SNDRV_PCM_INFO_PAUSE |
>> +                                       SNDRV_PCM_INFO_RESUME,
>> +       .formats                =       SNDRV_PCM_FMTBIT_S16 |
>> +                                       SNDRV_PCM_FMTBIT_S24 |
>> +                                       SNDRV_PCM_FMTBIT_S32,
>> +       .rates                  =       SNDRV_PCM_RATE_8000_192000,
>> +       .rate_min               =       8000,
>> +       .rate_max               =       192000,
>> +       .channels_min           =       1,
>> +       .channels_max           =       8,
>> +       .buffer_bytes_max       =       LPASS_VA_CDC_DMA_LPM_BUFF_SIZE,
>> +       .period_bytes_max       =       LPASS_VA_CDC_DMA_LPM_BUFF_SIZE /
>> +                                               LPASS_PLATFORM_PERIODS,
>> +       .period_bytes_min       =       LPASS_VA_CDC_DMA_LPM_BUFF_SIZE /
>> +                                               LPASS_PLATFORM_PERIODS,
>> +       .periods_min            =       LPASS_PLATFORM_PERIODS,
>> +       .periods_max            =       LPASS_PLATFORM_PERIODS,
>> +       .fifo_size              =       0,
>> +};
>> +
>> +static int lpass_platform_alloc_rxtx_dmactl_fields(struct device *dev,
>> +                                        struct regmap *map)
>> +{
>> +       struct lpass_data *drvdata = dev_get_drvdata(dev);
>> +       struct lpass_variant *v = drvdata->variant;
>> +       struct lpaif_dmactl *rd_dmactl, *wr_dmactl;
>> +       int rval;
>> +
>> +       rd_dmactl = devm_kzalloc(dev, sizeof(*rd_dmactl), GFP_KERNEL);
>> +       if (rd_dmactl == NULL)
> 	if (!rd_dmactl)
>
> is kernel idiomatic. Please follow that style.
Okay. will change.
>
>> +               return -ENOMEM;
>> +
>> +       wr_dmactl = devm_kzalloc(dev, sizeof(*wr_dmactl), GFP_KERNEL);
>> +       if (wr_dmactl == NULL)
>> +               return -ENOMEM;
>> +
>> +       drvdata->rxtx_rd_dmactl = rd_dmactl;
>> +       drvdata->rxtx_wr_dmactl = wr_dmactl;
>> +
>> +       rval = devm_regmap_field_bulk_alloc(dev, map, &rd_dmactl->intf,
>> +                                           &v->rxtx_rdma_intf, LPASS_CDC_DMA_REGISTER_FIELDS_MAX);
>> +       if (rval)
>> +               return rval;
>> +
>> +       return devm_regmap_field_bulk_alloc(dev, map, &wr_dmactl->intf,
>> +                                           &v->rxtx_wrdma_intf, LPASS_CDC_DMA_REGISTER_FIELDS_MAX);
>> +}
>> +
>> +static int lpass_platform_alloc_va_dmactl_fields(struct device *dev,
>> +                                        struct regmap *map)
>> +{
>> +       struct lpass_data *drvdata = dev_get_drvdata(dev);
>> +       struct lpass_variant *v = drvdata->variant;
>> +       struct lpaif_dmactl *wr_dmactl;
>> +
>> +       wr_dmactl = devm_kzalloc(dev, sizeof(*wr_dmactl), GFP_KERNEL);
>> +       if (wr_dmactl == NULL)
>> +               return -ENOMEM;
>> +
>> +       drvdata->va_wr_dmactl = wr_dmactl;
>> +       return devm_regmap_field_bulk_alloc(dev, map, &wr_dmactl->intf,
>> +                                           &v->va_wrdma_intf, LPASS_CDC_DMA_REGISTER_FIELDS_MAX);
>> +}
>> +
>> +
>>   static int lpass_platform_alloc_dmactl_fields(struct device *dev,
>>                                           struct regmap *map)
>>   {
>> @@ -123,25 +219,55 @@ static int lpass_platform_pcmops_open(struct snd_soc_component *component,
>>                  return dma_ch;
>>          }
>>
>> -       if (cpu_dai->driver->id == LPASS_DP_RX) {
>> -               map = drvdata->hdmiif_map;
>> -               drvdata->hdmi_substream[dma_ch] = substream;
>> -       } else {
>> +       switch (dai_id) {
>> +       case MI2S_PRIMARY ... MI2S_QUINARY:
>>                  map = drvdata->lpaif_map;
>>                  drvdata->substream[dma_ch] = substream;
>> +               break;
>> +       case LPASS_DP_RX:
>> +               map = drvdata->hdmiif_map;
>> +               drvdata->hdmi_substream[dma_ch] = substream;
>> +               break;
>> +       case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
>> +       case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
>> +               map = drvdata->rxtx_lpaif_map;
>> +               drvdata->rxtx_substream[dma_ch] = substream;
>> +               break;
>> +       case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
>> +               map = drvdata->va_lpaif_map;
>> +               drvdata->va_substream[dma_ch] = substream;
>> +               break;
>> +       default:
>> +               break;
>>          }
>> +
>>          data->dma_ch = dma_ch;
>> -       ret = regmap_write(map,
>> -                       LPAIF_DMACTL_REG(v, dma_ch, dir, data->i2s_port), 0);
>> -       if (ret) {
>> -               dev_err(soc_runtime->dev,
>> -                       "error writing to rdmactl reg: %d\n", ret);
>> -               return ret;
>> +       switch (dai_id) {
>> +       case MI2S_PRIMARY ... MI2S_QUINARY:
>> +       case LPASS_DP_RX:
>> +               ret = regmap_write(map, LPAIF_DMACTL_REG(v, dma_ch, dir, data->i2s_port), 0);
>> +               if (ret) {
>> +                       kfree(data);
>> +                       dev_err(soc_runtime->dev, "error writing to rdmactl reg: %d\n", ret);
>> +                       return ret;
>> +               }
>> +               snd_soc_set_runtime_hwparams(substream, &lpass_platform_pcm_hardware);
>> +               runtime->dma_bytes = lpass_platform_pcm_hardware.buffer_bytes_max;
>> +               break;
>> +       case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
>> +       case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
>> +               snd_soc_set_runtime_hwparams(substream, &lpass_platform_rxtx_hardware);
>> +               runtime->dma_bytes = lpass_platform_rxtx_hardware.buffer_bytes_max;
>> +               snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
>> +               break;
>> +       case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
>> +               snd_soc_set_runtime_hwparams(substream, &lpass_platform_va_hardware);
>> +               runtime->dma_bytes = lpass_platform_va_hardware.buffer_bytes_max;
>> +               snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
>> +               break;
>> +       default:
>> +               break;
>>          }
>> -       snd_soc_set_runtime_hwparams(substream, &lpass_platform_pcm_hardware);
>> -
>> -       runtime->dma_bytes = lpass_platform_pcm_hardware.buffer_bytes_max;
>> -
>>          ret = snd_pcm_hw_constraint_integer(runtime,
>>                          SNDRV_PCM_HW_PARAM_PERIODS);
>>          if (ret < 0) {
>> @@ -166,10 +292,25 @@ static int lpass_platform_pcmops_close(struct snd_soc_component *component,
>>          unsigned int dai_id = cpu_dai->driver->id;
>>
>>          data = runtime->private_data;
>> -       if (dai_id == LPASS_DP_RX)
>> -               drvdata->hdmi_substream[data->dma_ch] = NULL;
>> -       else
>> +
>> +       switch (dai_id) {
>> +       case MI2S_PRIMARY ... MI2S_QUINARY:
>>                  drvdata->substream[data->dma_ch] = NULL;
>> +               break;
>> +       case LPASS_DP_RX:
>> +               drvdata->hdmi_substream[data->dma_ch] = NULL;
>> +               break;
>> +       case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
>> +       case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
>> +               drvdata->rxtx_substream[data->dma_ch] = NULL;
>> +               break;
>> +       case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
>> +               drvdata->va_substream[data->dma_ch] = NULL;
>> +               break;
>> +       default:
>> +               break;
>> +       }
>> +
>>          if (v->free_dma_channel)
>>                  v->free_dma_channel(drvdata, data->dma_ch, dai_id);
>>
>> @@ -209,9 +350,25 @@ static void __lpass_get_lpaif_handle(struct snd_pcm_substream *substream,
>>                  l_dmactl = drvdata->hdmi_rd_dmactl;
>>                  l_map = drvdata->hdmiif_map;
>>                  break;
>> +       case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
>> +               l_id = pcm_data->dma_ch;
>> +               l_dmactl = drvdata->rxtx_rd_dmactl;
>> +               l_map = drvdata->rxtx_lpaif_map;
>> +               break;
>> +       case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
>> +               l_id = pcm_data->dma_ch - v->rxtx_wrdma_channel_start;
>> +               l_dmactl = drvdata->rxtx_wr_dmactl;
>> +               l_map = drvdata->rxtx_lpaif_map;
>> +               break;
>> +       case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
>> +               l_id = pcm_data->dma_ch - v->va_wrdma_channel_start;
>> +               l_dmactl = drvdata->va_wr_dmactl;
>> +               l_map = drvdata->va_lpaif_map;
>> +               break;
>>          default:
>>                  break;
>>          }
>> +
>>          if (dmactl)
>>                  *dmactl = l_dmactl;
>>          if (id)
>> @@ -299,6 +456,10 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
>>                  }
>>
>>                  break;
>> +       case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
>> +       case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
>> +       case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX0:
>> +               break;
>>          default:
>>                  dev_err(soc_runtime->dev, "%s: invalid  interface: %d\n", __func__, dai_id);
>>                  break;
>> @@ -387,6 +548,9 @@ static int lpass_platform_pcmops_hw_free(struct snd_soc_component *component,
>>          struct regmap *map;
>>          unsigned int dai_id = cpu_dai->driver->id;
>>
>> +       if (is_cdc_dma_port(dai_id))
>> +               return 0;
>> +
>>          __lpass_get_lpaif_handle(substream, component, NULL, NULL, &map);
>>          if (!map) {
>>                  dev_err(soc_runtime->dev, "failed to get dmactl handle\n");
>> @@ -449,6 +613,14 @@ static int lpass_platform_pcmops_prepare(struct snd_soc_component *component,
>>                  return ret;
>>          }
>>
>> +       if (is_cdc_dma_port(dai_id)) {
>> +               ret = regmap_fields_write(dmactl->fifowm, id, LPAIF_DMACTL_FIFOWM_8);
>> +               if (ret) {
>> +                       dev_err(soc_runtime->dev, "error writing fifowm field to dmactl reg: %d, id: %d\n",
>> +                               ret, id);
>> +                       return ret;
>> +               }
>> +       }
>>          ret = regmap_fields_write(dmactl->enable, id, LPAIF_DMACTL_ENABLE_ON);
>>          if (ret) {
>>                  dev_err(soc_runtime->dev, "error writing to rdmactl reg: %d\n",
>> @@ -532,6 +704,35 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
>>                          val_mask = LPAIF_IRQ_ALL(ch);
>>                          val_irqen = LPAIF_IRQ_ALL(ch);
>>                          break;
>> +               case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
>> +               case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
>> +                       ret = regmap_fields_write(dmactl->dyncclk, id, LPAIF_DMACTL_DYNCLK_ON);
>> +                       if (ret) {
>> +                               dev_err(soc_runtime->dev,
>> +                                       "error writing to rdmactl reg field: %d\n", ret);
>> +                               return ret;
>> +                       }
>> +                       reg_irqclr = LPAIF_RXTX_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
>> +                       val_irqclr = LPAIF_IRQ_ALL(ch);
>> +
>> +                       reg_irqen = LPAIF_RXTX_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST);
>> +                       val_mask = LPAIF_IRQ_ALL(ch);
>> +                       val_irqen = LPAIF_IRQ_ALL(ch);
>> +                       break;
>> +               case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
>> +                       ret = regmap_fields_write(dmactl->dyncclk, id, LPAIF_DMACTL_DYNCLK_ON);
>> +                       if (ret) {
>> +                               dev_err(soc_runtime->dev,
>> +                                       "error writing to rdmactl reg field: %d\n", ret);
>> +                               return ret;
>> +                       }
>> +                       reg_irqclr = LPAIF_VA_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
>> +                       val_irqclr = LPAIF_IRQ_ALL(ch);
>> +
>> +                       reg_irqen = LPAIF_VA_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST);
>> +                       val_mask = LPAIF_IRQ_ALL(ch);
>> +                       val_irqen = LPAIF_IRQ_ALL(ch);
>> +                       break;
>>                  default:
>>                          dev_err(soc_runtime->dev, "%s: invalid %d interface\n", __func__, dai_id);
>>                          return -EINVAL;
>> @@ -583,6 +784,37 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
>>                          val_mask = LPAIF_IRQ_ALL(ch);
>>                          val_irqen = 0;
>>                          break;
>> +               case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
>> +               case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
>> +                       ret = regmap_fields_write(dmactl->dyncclk, id, LPAIF_DMACTL_DYNCLK_OFF);
>> +                       if (ret) {
>> +                               dev_err(soc_runtime->dev,
>> +                                       "error writing to rdmactl reg field: %d\n", ret);
>> +                               return ret;
>> +                       }
>> +
>> +                       reg_irqclr = LPAIF_RXTX_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
>> +                       val_irqclr = LPAIF_IRQ_ALL(ch);
>> +
>> +                       reg_irqen = LPAIF_RXTX_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST);
>> +                       val_mask = LPAIF_IRQ_ALL(ch);
>> +                       val_irqen = LPAIF_IRQ_ALL(ch);
>> +                       break;
>> +               case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
>> +                       ret = regmap_fields_write(dmactl->dyncclk, id, LPAIF_DMACTL_DYNCLK_OFF);
>> +                       if (ret) {
>> +                               dev_err(soc_runtime->dev,
>> +                                       "error writing to rdmactl reg field: %d\n", ret);
>> +                               return ret;
>> +                       }
>> +
>> +                       reg_irqclr = LPAIF_VA_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
>> +                       val_irqclr = LPAIF_IRQ_ALL(ch);
>> +
>> +                       reg_irqen = LPAIF_VA_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST);
>> +                       val_mask = LPAIF_IRQ_ALL(ch);
>> +                       val_irqen = LPAIF_IRQ_ALL(ch);
>> +                       break;
>>                  default:
>>                          dev_err(soc_runtime->dev, "%s: invalid %d interface\n", __func__, dai_id);
>>                          return -EINVAL;
>> @@ -642,6 +874,39 @@ static snd_pcm_uframes_t lpass_platform_pcmops_pointer(
>>          return bytes_to_frames(substream->runtime, curr_addr - base_addr);
>>   }
>>
>> +static int lpass_platform_cdc_dma_mmap(struct snd_soc_component *component,
> 'component' is not used.
Okay. will remove it.
>
>> +                                      struct snd_pcm_substream *substream,
>> +                                      struct vm_area_struct *vma)
>> +{
>> +       struct snd_pcm_runtime *runtime = substream->runtime;
>> +       unsigned long size, offset;
>> +
>> +       vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
>> +       size = vma->vm_end - vma->vm_start;
>> +       offset = vma->vm_pgoff << PAGE_SHIFT;
>> +       return io_remap_pfn_range(vma, vma->vm_start,
>> +                       (runtime->dma_addr + offset) >> PAGE_SHIFT,
>> +                       size, vma->vm_page_prot);
>> +
>> +}
>> +
>> +static int lpass_platform_pcmops_mmap(struct snd_soc_component *component,
>> +                                     struct snd_pcm_substream *substream,
>> +                                     struct vm_area_struct *vma)
>> +{
>> +       struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
>> +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
>> +       unsigned int dai_id = cpu_dai->driver->id;
>> +       int err;
>> +
>> +       if (is_cdc_dma_port(dai_id))
>> +               err = lpass_platform_cdc_dma_mmap(component, substream, vma);
> return lpass_platform_cdc_dma_mmap(...)
Okay. Will change it.
>
>> +       else
> Drop else
Okay.
>
>> +               err = snd_pcm_lib_default_mmap(substream, vma);
> return snd_pcm_lib_default_mmap(...)
Okay.
>
>> +
>> +       return err;
> err is no longer required.
Okay. will remove it.
>
>> +}
>> +
>>   static irqreturn_t lpass_dma_interrupt_handler(
>>                          struct snd_pcm_substream *substream,
>>                          struct lpass_data *drvdata,
>> @@ -674,6 +939,17 @@ static irqreturn_t lpass_dma_interrupt_handler(
>>                  reg = LPAIF_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
>>                  val = 0;
>>          break;
>> +       case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
>> +       case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
>> +               map = drvdata->rxtx_lpaif_map;
>> +               reg = LPAIF_RXTX_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
>> +               val = 0;
>> +       break;
>> +       case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
>> +               map = drvdata->va_lpaif_map;
>> +               reg = LPAIF_VA_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
>> +               val = 0;
>> +       break;
>>          default:
>>          dev_err(soc_runtime->dev, "%s: invalid  %d interface\n", __func__, dai_id);
>>          return -EINVAL;
>> @@ -781,18 +1057,122 @@ static irqreturn_t lpass_platform_hdmiif_irq(int irq, void *data)
>>                                  return rv;
>>                  }
>>          }
>> +       return IRQ_HANDLED;
>> +}
>> +
>> +static irqreturn_t lpass_platform_rxtxif_irq(int irq, void *data)
>> +{
>> +       struct lpass_data *drvdata = data;
>> +       struct lpass_variant *v = drvdata->variant;
>> +       unsigned int irqs;
>> +       int rv, chan;
> Why is 'rv' int vs. irqreturn_t? Is something that isn't an irqreturn_t
> type being returned from lpass_dma_interrupt_handler()? That's bad. If
> the regmap read fails in the irq handler we are in pretty bad shape. I'd
> say that we don't care to handle that case, or at the least, don't care
> about the return value and can simply get out of this irq handler as
> fast as possible.
Okay.  will change accordingly.
>
>> +
>> +       rv = regmap_read(drvdata->rxtx_lpaif_map,
>> +                       LPAIF_RXTX_IRQSTAT_REG(v, LPAIF_IRQ_PORT_HOST), &irqs);
>> +       if (rv)
>> +               return IRQ_NONE;
>> +       /* Handle per channel interrupts */
>> +       for (chan = 0; chan < LPASS_MAX_CDC_DMA_CHANNELS; chan++) {
>> +               if (irqs & LPAIF_IRQ_ALL(chan) && drvdata->rxtx_substream[chan]) {
>> +                       rv = lpass_dma_interrupt_handler(
>> +                                               drvdata->rxtx_substream[chan],
>> +                                               drvdata, chan, irqs);
>> +                       if (rv != IRQ_HANDLED)
>> +                               return rv;
>> +               }
>> +       }
>>
>>          return IRQ_HANDLED;
>>   }
>>
>> +static irqreturn_t lpass_platform_vaif_irq(int irq, void *data)
>> +{
>> +       struct lpass_data *drvdata = data;
>> +       struct lpass_variant *v = drvdata->variant;
>> +       unsigned int irqs;
>> +       int rv, chan;
>> +
>> +       rv = regmap_read(drvdata->va_lpaif_map,
>> +                       LPAIF_VA_IRQSTAT_REG(v, LPAIF_IRQ_PORT_HOST), &irqs);
>> +       if (rv)
>> +               return IRQ_NONE;
>> +       /* Handle per channel interrupts */
>> +       for (chan = 0; chan < LPASS_MAX_VA_CDC_DMA_CHANNELS; chan++) {
>> +               if (irqs & LPAIF_IRQ_ALL(chan) && drvdata->va_substream[chan]) {
>> +                       rv = lpass_dma_interrupt_handler(
>> +                                               drvdata->va_substream[chan],
>> +                                               drvdata, chan, irqs);
>> +                       if (rv != IRQ_HANDLED)
>> +                               return rv;
>> +               }
>> +       }
>> +       return IRQ_HANDLED;
>> +}
>> +
>> +static int lpass_platform_prealloc_cdc_dma_buffer(struct snd_soc_component *component,
>> +                                                 struct snd_pcm *pcm, int dai_id)
>> +{
>> +       struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
>> +       struct snd_pcm_substream *substream;
>> +       struct snd_dma_buffer *buf;
>> +       int ret;
>> +
>> +       if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream)
>> +               substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
>> +       else
>> +               substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
>> +
>> +       ret = dma_coerce_mask_and_coherent(pcm->card->dev, DMA_BIT_MASK(64));
> Why isn't the dma mask setup for this device?
Okay. It seems redundant here.  Will remove it.
>
>> +       if (ret)
>> +               return ret;
>> +
>> +       buf = &substream->dma_buffer;
>> +       buf->dev.dev = pcm->card->dev;
>> +       buf->private_data = NULL;
>> +
>> +       /* Assign Codec DMA buffer pointers */
>> +       buf->dev.type = SNDRV_DMA_TYPE_CONTINUOUS;
>> +
>> +       switch (dai_id) {
>> +       case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
>> +               buf->bytes = lpass_platform_rxtx_hardware.buffer_bytes_max;
>> +               buf->addr = drvdata->rxtx_cdc_dma_lpm_buf;
>> +               break;
>> +       case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
>> +               buf->bytes = lpass_platform_rxtx_hardware.buffer_bytes_max;
>> +               buf->addr = drvdata->rxtx_cdc_dma_lpm_buf + LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE;
>> +               break;
>> +       case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
>> +               buf->bytes = lpass_platform_va_hardware.buffer_bytes_max;
>> +               buf->addr = drvdata->va_cdc_dma_lpm_buf;
>> +               break;
>> +       default:
>> +               break;
>> +       }
>> +
>> +       buf->area = (unsigned char * __force)ioremap(buf->addr, buf->bytes);
> Why aren't we using the DMA mapping framework?
Here, Need to use hardware memory, that is LPASS LPM region for codec DMA.
>
>> +
>> +       return 0;
>> +}
>> +
>>   static int lpass_platform_pcm_new(struct snd_soc_component *component,
>>                                    struct snd_soc_pcm_runtime *soc_runtime)
>>   {
>>          struct snd_pcm *pcm = soc_runtime->pcm;
>> +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
>> +       unsigned int dai_id = cpu_dai->driver->id;
>> +
>>          size_t size = lpass_platform_pcm_hardware.buffer_bytes_max;
>>
>> -       return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
>> -                                           component->dev, size);
>> +       /*
>> +        * Lpass codec dma can access only lpass lpm hardware memory.
>> +        * ioremap is for HLOS to access hardware memory.
>> +        */
>> +       if (is_cdc_dma_port(dai_id))
>> +               return lpass_platform_prealloc_cdc_dma_buffer(component, pcm, dai_id);
>> +       else
>> +               return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
>> +                                               component->dev, size);
> else return is an anti-pattern. Please remove the else and deindent the
> return.
Okay. Will change it.
>
>>   }
>>
>>   static int lpass_platform_pcmops_suspend(struct snd_soc_component *component)
>> @@ -827,6 +1207,31 @@ static int lpass_platform_pcmops_resume(struct snd_soc_component *component)
>>          return regcache_sync(map);
>>   }
>>
>> +static int lpass_platform_copy(struct snd_soc_component *component,
>> +                              struct snd_pcm_substream *substream, int channel,
>> +                              unsigned long pos, void __user *buf, unsigned long bytes)
>> +{
>> +       struct snd_pcm_runtime *rt = substream->runtime;
>> +       unsigned int dai_id = component->id;
>> +       int ret = 0;
>> +
>> +       void __iomem *dma_buf = rt->dma_area + pos +
>> +                               channel * (rt->dma_bytes / rt->channels);
>> +
>> +       if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>> +               if (is_cdc_dma_port(dai_id))
>> +                       ret = copy_from_user_toio(dma_buf, buf, bytes);
>> +               else
>> +                       ret = copy_from_user((void __force *)dma_buf, buf, bytes);
>> +       } else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
>> +               if (is_cdc_dma_port(dai_id))
>> +                       ret = copy_to_user_fromio(buf, dma_buf, bytes);
>> +               else
>> +                       ret = copy_to_user(buf, (void __force *)dma_buf, bytes);
> Having __force in here highlights the lack of DMA API usage. I guess
> there's a sound dma wrapper library in sound/core/memalloc.c? Why can't
> that be used?
Didn't see any memcopy wrapper functions in memalloc.c. Could You please 
elaborate or share some example.
>
>> +       }
>> +
>> +       return ret;
>> +}
>>
>>   static const struct snd_soc_component_driver lpass_component_driver = {
>>          .name           = DRV_NAME,
>> @@ -837,9 +1242,11 @@ static const struct snd_soc_component_driver lpass_component_driver = {
>>          .prepare        = lpass_platform_pcmops_prepare,
>>          .trigger        = lpass_platform_pcmops_trigger,
>>          .pointer        = lpass_platform_pcmops_pointer,
>> +       .mmap           = lpass_platform_pcmops_mmap,
>>          .pcm_construct  = lpass_platform_pcm_new,
>>          .suspend                = lpass_platform_pcmops_suspend,
>>          .resume                 = lpass_platform_pcmops_resume,
>> +       .copy_user              = lpass_platform_copy,
>>
>>   };
>>
>> @@ -877,6 +1284,60 @@ int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
>>                  return ret;
>>          }
>>
>> +       if (drvdata->codec_dma_enable) {
>> +               ret = regmap_write(drvdata->rxtx_lpaif_map,
>> +                       LPAIF_RXTX_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST), 0x0);
>> +               if (ret) {
>> +                       dev_err(&pdev->dev, "error writing to rxtx irqen reg: %d\n", ret);
>> +                       return ret;
>> +               }
>> +               ret = regmap_write(drvdata->va_lpaif_map,
>> +                       LPAIF_VA_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST), 0x0);
>> +               if (ret) {
>> +                       dev_err(&pdev->dev, "error writing to rxtx irqen reg: %d\n", ret);
>> +                       return ret;
>> +               }
>> +               drvdata->rxtxif_irq = platform_get_irq_byname(pdev, "lpass-irq-rxtxif");
>> +               if (drvdata->rxtxif_irq < 0)
>> +                       return -ENODEV;
>> +
>> +               ret = devm_request_irq(&pdev->dev, drvdata->rxtxif_irq,
>> +                               lpass_platform_rxtxif_irq, IRQF_TRIGGER_RISING,
> Drop flags and get it from firmware please.
Same is followed in existing for other i2s and HDMI interrupts. Could 
You please give some example if it's really matters?
>
>> +                               "lpass-irq-rxtxif", drvdata);
>> +               if (ret) {
>> +                       dev_err(&pdev->dev, "rxtx irq request failed: %d\n", ret);
>> +                       return ret;
>> +               }
>> +
>> +               ret = lpass_platform_alloc_rxtx_dmactl_fields(&pdev->dev,
>> +                                                drvdata->rxtx_lpaif_map);
>> +               if (ret) {
>> +                       dev_err(&pdev->dev,
>> +                               "error initializing rxtx dmactl fields: %d\n", ret);
>> +                       return ret;
>> +               }
>> +
>> +               drvdata->vaif_irq = platform_get_irq_byname(pdev, "lpass-irq-vaif");
>> +               if (drvdata->vaif_irq < 0)
>> +                       return -ENODEV;
>> +
>> +               ret = devm_request_irq(&pdev->dev, drvdata->vaif_irq,
>> +                               lpass_platform_vaif_irq, IRQF_TRIGGER_RISING,
> Drop flags and get it from firmware please.
Some Example Please!!!
>
>> +                               "lpass-irq-vaif", drvdata);
>> +               if (ret) {
>> +                       dev_err(&pdev->dev, "va irq request failed: %d\n", ret);
>> +                       return ret;
>> +               }
>> +
>> +               ret = lpass_platform_alloc_va_dmactl_fields(&pdev->dev,
>> +                                                drvdata->va_lpaif_map);
>> +               if (ret) {
>> +                       dev_err(&pdev->dev,
>> +                               "error initializing va dmactl fields: %d\n", ret);
>> +                       return ret;
>> +               }
>> +       }
>> +
>>          if (drvdata->hdmi_port_enable) {
>>                  drvdata->hdmiif_irq = platform_get_irq_byname(pdev, "lpass-irq-hdmi");
>>                  if (drvdata->hdmiif_irq < 0)
>> --
>> 2.7.4
>>
