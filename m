Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F526CCCD
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jul 2019 12:35:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 701BB1699;
	Thu, 18 Jul 2019 12:34:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 701BB1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563446117;
	bh=FYosrcKhQ1Fw/tgGDqwyb22tTS15uxV4mGJSEld3Vh0=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C/S4N86mbXkesiLD21sol43OO7PCtj34AtxhuQfWvLdMrcOOJr97xQcNfBDYkpOfT
	 l6e4ks2zMG8NJ2s4AWYjwi9IT+/4x2E/6qDudiSMqPMMt917KvQclvJHBBIuWuTK9U
	 MAj10EYO/ekrF8Ftiub4lW3Kr7eZ7PXJEZsSqkfQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AB73F80362;
	Thu, 18 Jul 2019 12:33:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1364F80363; Wed, 17 Jul 2019 15:42:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from node.akkea.ca (node.akkea.ca [192.155.83.177])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF194F8015B
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 15:42:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF194F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=akkea.ca header.i=@akkea.ca
 header.b="p68fillT"; 
 dkim=pass (1024-bit key) header.d=akkea.ca header.i=@akkea.ca
 header.b="p68fillT"
Received: from localhost (localhost [127.0.0.1])
 by node.akkea.ca (Postfix) with ESMTP id A41254E2006;
 Wed, 17 Jul 2019 13:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
 t=1563370972; bh=ePxGZwyeTruV5d1GqfahH8F+q8+Ql6SSKMh3Hiai4Gs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=p68fillTw+6tA4PzUM0aHztu+1P4kiJxYi2sl8VlpCwIXfFpnXtDm9W5lW5ZUhPGN
 18NZ5KILd2XixWPPq+3srTvCG0s3CG2JyiS1qHH/irw3dAgEKjVW2ak38MKC1sGITc
 5RpNgYHJHj792fq0HgN3yTXd5R2m42E0GEaq6Zr4=
X-Virus-Scanned: Debian amavisd-new at mail.akkea.ca
Received: from node.akkea.ca ([127.0.0.1])
 by localhost (mail.akkea.ca [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5q6QErE_B5y2; Wed, 17 Jul 2019 13:42:52 +0000 (UTC)
Received: from www.akkea.ca (node.akkea.ca [192.155.83.177])
 by node.akkea.ca (Postfix) with ESMTPSA id 19A2D4E2003;
 Wed, 17 Jul 2019 13:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
 t=1563370972; bh=ePxGZwyeTruV5d1GqfahH8F+q8+Ql6SSKMh3Hiai4Gs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=p68fillTw+6tA4PzUM0aHztu+1P4kiJxYi2sl8VlpCwIXfFpnXtDm9W5lW5ZUhPGN
 18NZ5KILd2XixWPPq+3srTvCG0s3CG2JyiS1qHH/irw3dAgEKjVW2ak38MKC1sGITc
 5RpNgYHJHj792fq0HgN3yTXd5R2m42E0GEaq6Zr4=
MIME-Version: 1.0
Date: Wed, 17 Jul 2019 07:42:52 -0600
From: Angus Ainslie <angus@akkea.ca>
To: Lucas Stach <l.stach@pengutronix.de>
In-Reply-To: <20190717105635.18514-2-l.stach@pengutronix.de>
References: <20190717105635.18514-1-l.stach@pengutronix.de>
 <20190717105635.18514-2-l.stach@pengutronix.de>
Message-ID: <aed115b1fce5cc3e7a81b60efbc01536@akkea.ca>
X-Sender: angus@akkea.ca
User-Agent: Roundcube Webmail/1.3.6
X-Mailman-Approved-At: Thu, 18 Jul 2019 12:33:32 +0200
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 patchwork-lst@pengutronix.de, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>
Subject: Re: [alsa-devel] [PATCH 1/3] ASoC: fsl_sai: add of_match data
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2019-07-17 04:56, Lucas Stach wrote:
> New revisions of the SAI IP block have even more differences that need
> be taken into account by the driver. To avoid sprinking compatible
> checks all over the driver move the current differences into 
> of_match_data.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Tested-by: Angus Ainslie <angus@akkea.ca>
Reviewed-by: Angus Ainslie <angus@akkea.ca>

> ---
>  sound/soc/fsl/fsl_sai.c | 22 ++++++++++++++--------
>  sound/soc/fsl/fsl_sai.h |  6 +++++-
>  2 files changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 812c94fbb160..3a1ed8b857d6 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -9,6 +9,7 @@
>  #include <linux/dmaengine.h>
>  #include <linux/module.h>
>  #include <linux/of_address.h>
> +#include <linux/of_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
> @@ -798,10 +799,7 @@ static int fsl_sai_probe(struct platform_device 
> *pdev)
>  		return -ENOMEM;
> 
>  	sai->pdev = pdev;
> -
> -	if (of_device_is_compatible(np, "fsl,imx6sx-sai") ||
> -	    of_device_is_compatible(np, "fsl,imx6ul-sai"))
> -		sai->sai_on_imx = true;
> +	sai->soc_data = of_device_get_match_data(&pdev->dev);
> 
>  	sai->is_lsb_first = of_property_read_bool(np, "lsb-first");
> 
> @@ -910,7 +908,7 @@ static int fsl_sai_probe(struct platform_device 
> *pdev)
>  	if (ret)
>  		return ret;
> 
> -	if (sai->sai_on_imx)
> +	if (sai->soc_data->use_imx_pcm)
>  		return imx_pcm_dma_init(pdev, IMX_SAI_DMABUF_SIZE);
>  	else
>  		return devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
> @@ -923,10 +921,18 @@ static int fsl_sai_remove(struct platform_device 
> *pdev)
>  	return 0;
>  }
> 
> +static const struct fsl_sai_soc_data fsl_sai_vf610_data = {
> +	.use_imx_pcm = false,
> +};
> +
> +static const struct fsl_sai_soc_data fsl_sai_imx6sx_data = {
> +	.use_imx_pcm = true,
> +};
> +
>  static const struct of_device_id fsl_sai_ids[] = {
> -	{ .compatible = "fsl,vf610-sai", },
> -	{ .compatible = "fsl,imx6sx-sai", },
> -	{ .compatible = "fsl,imx6ul-sai", },
> +	{ .compatible = "fsl,vf610-sai", .data = &fsl_sai_vf610_data },
> +	{ .compatible = "fsl,imx6sx-sai", .data = &fsl_sai_imx6sx_data },
> +	{ .compatible = "fsl,imx6ul-sai", .data = &fsl_sai_imx6sx_data },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, fsl_sai_ids);
> diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
> index 24cb156bf995..83e2bfe05b1b 100644
> --- a/sound/soc/fsl/fsl_sai.h
> +++ b/sound/soc/fsl/fsl_sai.h
> @@ -126,6 +126,10 @@
>  #define FSL_SAI_MAXBURST_TX 6
>  #define FSL_SAI_MAXBURST_RX 6
> 
> +struct fsl_sai_soc_data {
> +	bool use_imx_pcm;
> +};
> +
>  struct fsl_sai {
>  	struct platform_device *pdev;
>  	struct regmap *regmap;
> @@ -135,7 +139,6 @@ struct fsl_sai {
>  	bool is_slave_mode;
>  	bool is_lsb_first;
>  	bool is_dsp_mode;
> -	bool sai_on_imx;
>  	bool synchronous[2];
> 
>  	unsigned int mclk_id[2];
> @@ -143,6 +146,7 @@ struct fsl_sai {
>  	unsigned int slots;
>  	unsigned int slot_width;
> 
> +	const struct fsl_sai_soc_data *soc_data;
>  	struct snd_dmaengine_dai_dma_data dma_params_rx;
>  	struct snd_dmaengine_dai_dma_data dma_params_tx;
>  };
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
