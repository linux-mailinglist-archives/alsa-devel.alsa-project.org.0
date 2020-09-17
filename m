Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAAD26D0E6
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 03:54:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC129846;
	Thu, 17 Sep 2020 03:54:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC129846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600307691;
	bh=bodI5Fj8qN5mJAKwo5MR9dbqvwVnFXt3fAQHclioL20=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R7LXWDNHCG3muwJUVoIOMj/WrBoi1rDFp7ogBwhyHlTmrwwir1G/FqM69OBocFwDA
	 jeVwxcq0IueDwXapUgFn35sJyObYN2QOcb839K4hb2DLvm+fu2jbldy0+rODSNGMt1
	 4hprFjPVU8urPRqeO9nHlPAOZpw0p/F2e8nDXapI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3EA9F8025E;
	Thu, 17 Sep 2020 03:53:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41F58F80212; Thu, 17 Sep 2020 03:53:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E2AAF8013A
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 03:53:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E2AAF8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QaaDzjuN"
Received: by mail-pg1-x541.google.com with SMTP id l71so424216pge.4
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 18:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HptUpY5ZPADmDsSUpnGfz+yVn/Le7O8Q8dkxi5ZCrro=;
 b=QaaDzjuN6yqg0oJMsY/Y8x631w+CTfJ4VNFORoGX9SW+khthjq4WzrPjaGfPtnq++e
 IofEvC/PRtKxxjc96qjz5bDiR8kJ60bw1cx9fLbSRX+s0hny8xYMUQu/ddhSQN2W0ehg
 Eu5u7ZDFSD/PpoxmOQFGa7FGDbFe3m+xkHDN2LonWO+/jepBGo/3QE9DGlz7XjBMikLQ
 9EmlNDFnKCzM1DBC2FhcRh2IOsK3RoPXdONnJIlA3axHKclhC1ad1psBqAmgwC54f+Pf
 wZ8jHySqSd1npPylBy3OXSZdkD37m2RKIgragrm2n3kGDG01GLix9bICsEdHu7tIYibm
 RBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HptUpY5ZPADmDsSUpnGfz+yVn/Le7O8Q8dkxi5ZCrro=;
 b=kuhmZsgs1pUzyLKGd7y5bZgP6NEap6G47iOzRySTLd1bHvL54js+50T3Xg21Zy5RVQ
 qQkB4FJxannuKQEI6epZJI/eM5awvJL5nQr8k7iErYliALkJBd0b8Da0Nw4UpasJ/vZR
 txniv7Qa8mA/DE2JsaBwfl1j5rjsgJj6MRNhmhD/CmJesu6mHwQ2YTCPlsmgVYBVIIrA
 6HdTxFn3XoopvAZa2I7cfMGuLnTdApIqSn7LO6G2xvaJPnHACzxpCX7SJVi+wf/GAwCS
 /XtdRvoRlYxud1QD5/aJsG9p77CLzq4VT9uflc3xSFPKFuPxtN188dBZXDXH8A57omn0
 qUUg==
X-Gm-Message-State: AOAM530fm7Uss2aSxkkTJb+wCITxPjwCbVgJjbHGqA1MaI5hcYz/hwre
 NSpHfet2zQoVR/hzyapnmFs=
X-Google-Smtp-Source: ABdhPJx+w+YmbG8KZTbXzCyyEZZW96lMymsa7Uwppk+tAqf+WdxJ6BKWfJGYZi9hjgXeMN4Kh0mOHw==
X-Received: by 2002:a63:595a:: with SMTP id j26mr21319515pgm.406.1600307580770; 
 Wed, 16 Sep 2020 18:53:00 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id g21sm18500564pfh.30.2020.09.16.18.53.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 16 Sep 2020 18:53:00 -0700 (PDT)
Date: Wed, 16 Sep 2020 18:49:49 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 2/3] ASoC: fsl_sai: Add fsl_sai_check_version function
Message-ID: <20200917014949.GC22566@Asurada-Nvidia>
References: <1600251387-1863-1-git-send-email-shengjiu.wang@nxp.com>
 <1600251387-1863-3-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600251387-1863-3-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com,
 broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org
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

On Wed, Sep 16, 2020 at 06:16:26PM +0800, Shengjiu Wang wrote:
> fsl_sai_check_version can help to parse the version info
> in VERID and PARAM registers.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

> ---
>  sound/soc/fsl/fsl_sai.c | 47 +++++++++++++++++++++++++++++++++++++++++
>  sound/soc/fsl/fsl_sai.h | 28 ++++++++++++++++++++++++
>  2 files changed, 75 insertions(+)
> 
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 24ca528ca2be..738b4dda7847 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -946,6 +946,48 @@ static struct regmap_config fsl_sai_regmap_config = {
>  	.cache_type = REGCACHE_FLAT,
>  };
>  
> +static int fsl_sai_check_version(struct device *dev)
> +{
> +	struct fsl_sai *sai = dev_get_drvdata(dev);
> +	unsigned char ofs = sai->soc_data->reg_offset;
> +	unsigned int val;
> +	int ret;
> +
> +	if (FSL_SAI_TCSR(ofs) == FSL_SAI_VERID)
> +		return 0;
> +
> +	ret = regmap_read(sai->regmap, FSL_SAI_VERID, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	dev_dbg(dev, "VERID: 0x%016X\n", val);
> +
> +	sai->verid.major = (val & FSL_SAI_VERID_MAJOR_MASK) >>
> +			   FSL_SAI_VERID_MAJOR_SHIFT;
> +	sai->verid.minor = (val & FSL_SAI_VERID_MINOR_MASK) >>
> +			   FSL_SAI_VERID_MINOR_SHIFT;
> +	sai->verid.feature = val & FSL_SAI_VERID_FEATURE_MASK;
> +
> +	ret = regmap_read(sai->regmap, FSL_SAI_PARAM, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	dev_dbg(dev, "PARAM: 0x%016X\n", val);
> +
> +	/* Max slots per frame, power of 2 */
> +	sai->param.slot_num = 1 <<
> +		((val & FSL_SAI_PARAM_SPF_MASK) >> FSL_SAI_PARAM_SPF_SHIFT);
> +
> +	/* Words per fifo, power of 2 */
> +	sai->param.fifo_depth = 1 <<
> +		((val & FSL_SAI_PARAM_WPF_MASK) >> FSL_SAI_PARAM_WPF_SHIFT);
> +
> +	/* Number of datalines implemented */
> +	sai->param.dataline = val & FSL_SAI_PARAM_DLN_MASK;
> +
> +	return 0;
> +}
> +
>  static int fsl_sai_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
> @@ -1070,6 +1112,11 @@ static int fsl_sai_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, sai);
>  
> +	/* Get sai version */
> +	ret = fsl_sai_check_version(&pdev->dev);
> +	if (ret < 0)
> +		dev_warn(&pdev->dev, "Error reading SAI version: %d\n", ret);
> +
>  	pm_runtime_enable(&pdev->dev);
>  	regcache_cache_only(sai->regmap, true);
>  
> diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
> index d16fc4241f41..ba7425a9e217 100644
> --- a/sound/soc/fsl/fsl_sai.h
> +++ b/sound/soc/fsl/fsl_sai.h
> @@ -223,6 +223,32 @@ struct fsl_sai_soc_data {
>  	unsigned int reg_offset;
>  };
>  
> +/**
> + * struct fsl_sai_verid - version id data
> + * @major: major version number
> + * @minor: minor version number
> + * @feature: feature specification number
> + *           0000000000000000b - Standard feature set
> + *           0000000000000000b - Standard feature set
> + */
> +struct fsl_sai_verid {
> +	u32 major;
> +	u32 minor;
> +	u32 feature;
> +};
> +
> +/**
> + * struct fsl_sai_param - parameter data
> + * @slot_num: The maximum number of slots per frame
> + * @fifo_depth: The number of words in each FIFO (depth)
> + * @dataline: The number of datalines implemented
> + */
> +struct fsl_sai_param {
> +	u32 slot_num;
> +	u32 fifo_depth;
> +	u32 dataline;
> +};
> +
>  struct fsl_sai {
>  	struct platform_device *pdev;
>  	struct regmap *regmap;
> @@ -243,6 +269,8 @@ struct fsl_sai {
>  	const struct fsl_sai_soc_data *soc_data;
>  	struct snd_dmaengine_dai_dma_data dma_params_rx;
>  	struct snd_dmaengine_dai_dma_data dma_params_tx;
> +	struct fsl_sai_verid verid;
> +	struct fsl_sai_param param;
>  };
>  
>  #define TX 1
> -- 
> 2.27.0
> 
