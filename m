Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 341AF610C26
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 10:27:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D234F28C0;
	Fri, 28 Oct 2022 10:26:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D234F28C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666945637;
	bh=iZl6HArNVt7HEUSoHYn7pYmLpwb+kOW+qtgbpHj0lNU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XIyJHf99z8rpGhhm4HtZxiRrIRh/DRQygp7XI4dNESHzE9TozXuvmp4Uacdqom2ay
	 oI7BlO9DQqPUNGQOOcJ7n3gp/yzi2SYZTNYuhmF/+amvnTwD1dnATUJMjtKHLY9zwg
	 sb+Ci7ipFdGbWE8Dt/gbOxn622VwuzNNZKXfYVlI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AE2DF804DF;
	Fri, 28 Oct 2022 10:26:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20A59F804D0; Fri, 28 Oct 2022 10:26:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6239CF804BD
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 10:26:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6239CF804BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AMw5gLO/"
Received: by mail-lf1-x12b.google.com with SMTP id f37so7073485lfv.8
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 01:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JTAoFfCzD+YZJ52QXBVgIgRDdphXv1Exc5UUJ2CJh7A=;
 b=AMw5gLO/O2bdq0e279HlR7nPSV6uyL2X4UpxBm9MZntKIZnrf67da4dUR1wE3wuVyG
 psJS7YnPfS1pyBsTjc/eLWvaTp4EBPzDEbTEh4bxVnQC2ruf90bIXDlYczWG+GAkhcqP
 MsSmm4udfThNuONXfYSFgpkTzqztv/s0F96+9SYrixG6WiTCQMFE+qq/50oE7gPT77D6
 ynIuqSw4MfhjqCiw4gRbxoAFgWBbFv70IvHX5fqR+VutxtwjYNvsYjnLeHOkYa5/bCYT
 6qc9bM0sSS57VIdcMvErh7cm2B3ydXhYru9Y2PRDDaOgN9bNGx2G2ya5n+sm3WXc1bq0
 Sw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JTAoFfCzD+YZJ52QXBVgIgRDdphXv1Exc5UUJ2CJh7A=;
 b=VvEG4FIQ3+7SgSPCOtDmqhZhWQLVjrfZGIoNrlgUQwI8oX/ZtThkGBY3SqtRzn3dxt
 Fc9HhkbeZokR5OHRr+3mxA8dW9KdTjfmaS6wr3LytxgwrRIX3+y3Mk4K1UnIFzU9wsGG
 zXbpOrVnKEB/T6+5Er7mwFft0zPvPAwI//AjgRlVw5B4udc4wMMFG3Mj7nVtkIwLE2O7
 oewpN/i5ACtpfEQHfIOVCw5PFtW6Du2cyhzGG5If6X26c7cHlXDwmkt5r5zNorhC4U1K
 lGJkDOli5+Z44g6Q85n1ZXfeyHAZb07oM6BN8z6qdpD5oo12v0yJj8n37C+sYyuqVaPZ
 HHhQ==
X-Gm-Message-State: ACrzQf0Lwp2t5nqyMFKDoTcQYoeYMURAMcIcfrp5bm1US+RMux8ZIUTZ
 lQRvRCFz4M3tpSuTayg+07Jvk24j+yTiBSYui5A=
X-Google-Smtp-Source: AMsMyM7FYIVxEh1fD5TJVccfh+/7H4U8HYdcXOwDwowp0lrEqjvD2RqrIEuu0WAsMYvwVOjKJhpKlp5sNN+lTMBk2c8=
X-Received: by 2002:a05:6512:1093:b0:4a2:69f9:310f with SMTP id
 j19-20020a056512109300b004a269f9310fmr21042462lfg.433.1666945571466; Fri, 28
 Oct 2022 01:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221027060311.2549711-1-chancel.liu@nxp.com>
 <20221027060311.2549711-4-chancel.liu@nxp.com>
In-Reply-To: <20221027060311.2549711-4-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 28 Oct 2022 16:25:58 +0800
Message-ID: <CAA+D8APan2fjZjBHbF8hap=0kLcEg5Dhs17kvVR_c=uStWAZ0Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: fsl_sai: Specify the maxburst to 8 on i.MX93
 platform
To: Chancel Liu <chancel.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, tiwai@suse.com,
 nicoleotsuka@gmail.com, broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 festevam@gmail.com
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

On Thu, Oct 27, 2022 at 2:04 PM Chancel Liu <chancel.liu@nxp.com> wrote:

> There is a limit to eDMA AXI on i.MX93. Only TCD that has NBYTES in a
> multiple of 8bytes can enable scatter-gather. NBYTES is calculated by
> bus width times maxburst. On i.MX93 platform the value of maxburst is
> specified to 8. It makes sure that NBYTES is a multiple of 8bytes.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

best regards
wang shengjiu

> ---
>  sound/soc/fsl/fsl_sai.c | 11 +++++++----
>  sound/soc/fsl/fsl_sai.h |  1 +
>  2 files changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 68e1cc4c369a..a0ea27f06997 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -872,10 +872,10 @@ static int fsl_sai_dai_probe(struct snd_soc_dai
> *cpu_dai)
>
>         regmap_update_bits(sai->regmap, FSL_SAI_TCR1(ofs),
>                            FSL_SAI_CR1_RFW_MASK(sai->soc_data->fifo_depth),
> -                          sai->soc_data->fifo_depth -
> FSL_SAI_MAXBURST_TX);
> +                          sai->soc_data->fifo_depth -
> sai->dma_params_tx.maxburst);
>         regmap_update_bits(sai->regmap, FSL_SAI_RCR1(ofs),
>                            FSL_SAI_CR1_RFW_MASK(sai->soc_data->fifo_depth),
> -                          FSL_SAI_MAXBURST_RX - 1);
> +                          sai->dma_params_rx.maxburst - 1);
>
>         snd_soc_dai_init_dma_data(cpu_dai, &sai->dma_params_tx,
>                                 &sai->dma_params_rx);
> @@ -1416,8 +1416,10 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>
>         sai->dma_params_rx.addr = sai->res->start + FSL_SAI_RDR0;
>         sai->dma_params_tx.addr = sai->res->start + FSL_SAI_TDR0;
> -       sai->dma_params_rx.maxburst = FSL_SAI_MAXBURST_RX;
> -       sai->dma_params_tx.maxburst = FSL_SAI_MAXBURST_TX;
> +       sai->dma_params_rx.maxburst =
> +               sai->soc_data->max_burst[RX] ?
> sai->soc_data->max_burst[RX] : FSL_SAI_MAXBURST_RX;
> +       sai->dma_params_tx.maxburst =
> +               sai->soc_data->max_burst[TX] ?
> sai->soc_data->max_burst[TX] : FSL_SAI_MAXBURST_TX;
>
>         sai->pinctrl = devm_pinctrl_get(&pdev->dev);
>
> @@ -1588,6 +1590,7 @@ static const struct fsl_sai_soc_data
> fsl_sai_imx93_data = {
>         .pins = 4,
>         .flags = 0,
>         .max_register = FSL_SAI_MCTL,
> +       .max_burst = {8, 8},
>  };
>
>  static const struct of_device_id fsl_sai_ids[] = {
> diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
> index 697f6690068c..197748a888d5 100644
> --- a/sound/soc/fsl/fsl_sai.h
> +++ b/sound/soc/fsl/fsl_sai.h
> @@ -235,6 +235,7 @@ struct fsl_sai_soc_data {
>         unsigned int reg_offset;
>         unsigned int flags;
>         unsigned int max_register;
> +       unsigned int max_burst[2];
>  };
>
>  /**
> --
> 2.25.1
>
>
