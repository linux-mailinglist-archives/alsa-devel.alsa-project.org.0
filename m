Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CB46CCD9
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jul 2019 12:36:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20F181690;
	Thu, 18 Jul 2019 12:35:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20F181690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563446207;
	bh=JPMAA6hc1mKkb2zt3mkCsYp8vCka3DzJrzAcK4QHVDk=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EYQm9o5LoQsyKf+GPB1PSTtV0gfCCKEhs5bEcBi68IbAr82wStA8Zecv13e3GLSzM
	 MxRFjileh9bgqOchwsWyHO1BzX46RnaA6MAwFeCwYHcaz+Y6gbLfvRvQEsj1vGVDJ+
	 gnc1IImXHBVvgao3mAOSXso11Lo4hLzYC+tH8tvY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D595EF803D7;
	Thu, 18 Jul 2019 12:33:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5351F80363; Wed, 17 Jul 2019 15:45:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from node.akkea.ca (node.akkea.ca [192.155.83.177])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5BC0F800C4
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 15:45:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5BC0F800C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=akkea.ca header.i=@akkea.ca
 header.b="cnRpdDFv"; 
 dkim=pass (1024-bit key) header.d=akkea.ca header.i=@akkea.ca
 header.b="cnRpdDFv"
Received: from localhost (localhost [127.0.0.1])
 by node.akkea.ca (Postfix) with ESMTP id 92E5F4E2006;
 Wed, 17 Jul 2019 13:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
 t=1563371100; bh=jjLGYFfg8xfJg0XMU+ZbPXz4kvn1irBQmCo7JmZFApI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=cnRpdDFvm0JJb0dhWSDJMu/sXt/81K2T9rQMd52GRIoCDC9j8CFDBTArycRHuuym0
 iISApP02JHB7JRkbk/dd+DKXm5ss53JWF43kPfag3Qn8KL/GDw+74e3sK/cpdBbc26
 nw11af0V09V61QuJp9fqs4qxyeId5sUQzT4CMnJ0=
X-Virus-Scanned: Debian amavisd-new at mail.akkea.ca
Received: from node.akkea.ca ([127.0.0.1])
 by localhost (mail.akkea.ca [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N0M18IlyGTE6; Wed, 17 Jul 2019 13:45:00 +0000 (UTC)
Received: from www.akkea.ca (node.akkea.ca [192.155.83.177])
 by node.akkea.ca (Postfix) with ESMTPSA id 39D534E2003;
 Wed, 17 Jul 2019 13:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
 t=1563371100; bh=jjLGYFfg8xfJg0XMU+ZbPXz4kvn1irBQmCo7JmZFApI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=cnRpdDFvm0JJb0dhWSDJMu/sXt/81K2T9rQMd52GRIoCDC9j8CFDBTArycRHuuym0
 iISApP02JHB7JRkbk/dd+DKXm5ss53JWF43kPfag3Qn8KL/GDw+74e3sK/cpdBbc26
 nw11af0V09V61QuJp9fqs4qxyeId5sUQzT4CMnJ0=
MIME-Version: 1.0
Date: Wed, 17 Jul 2019 07:45:00 -0600
From: Angus Ainslie <angus@akkea.ca>
To: Lucas Stach <l.stach@pengutronix.de>
In-Reply-To: <20190717105635.18514-4-l.stach@pengutronix.de>
References: <20190717105635.18514-1-l.stach@pengutronix.de>
 <20190717105635.18514-4-l.stach@pengutronix.de>
Message-ID: <18b4d49b410248766e834f3a0444e106@akkea.ca>
X-Sender: angus@akkea.ca
User-Agent: Roundcube Webmail/1.3.6
X-Mailman-Approved-At: Thu, 18 Jul 2019 12:33:32 +0200
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 patchwork-lst@pengutronix.de, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>
Subject: Re: [alsa-devel] [PATCH 3/3] ASoC: fsl_sai: add i.MX8M support
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
> The SAI block on the i.MX8M moved the register layout, as 2 version
> registers were added at the start of the register map. We deal with
> this by moving the start of the regmap, so both register layouts
> look the same to accesses going through the regmap.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

checkpatch has a complaint about mixing code and device tree bindings.

Other than that

Tested-by: Angus Ainslie <angus@akkea.ca>
Reviewed-by: Angus Ainslie <angus@akkea.ca>

> ---
>  .../devicetree/bindings/sound/fsl-sai.txt     |  2 +-
>  sound/soc/fsl/fsl_sai.c                       | 19 +++++++++++++++++++
>  sound/soc/fsl/fsl_sai.h                       |  1 +
>  3 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl-sai.txt
> b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> index 2e726b983845..037871d2f505 100644
> --- a/Documentation/devicetree/bindings/sound/fsl-sai.txt
> +++ b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> @@ -8,7 +8,7 @@ codec/DSP interfaces.
>  Required properties:
> 
>    - compatible		: Compatible list, contains "fsl,vf610-sai",
> -			  "fsl,imx6sx-sai" or "fsl,imx6ul-sai"
> +			  "fsl,imx6sx-sai", "fsl,imx6ul-sai" or "fsl,imx8mq-sai"
> 
>    - reg			: Offset and length of the register set for the device.
> 
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index b3cd055a61c7..a10201078e40 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -808,6 +808,16 @@ static int fsl_sai_probe(struct platform_device 
> *pdev)
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
> 
> +	/*
> +	 * New versions of the SAI have 2 32bit version registers added at 
> the
> +	 * start of the register map. To avoid dealing with this shift all 
> over
> +	 * the driver, we move the start of the regmap to make both register
> +	 * layouts look the same to the regmap. This means we can't read the
> +	 * version registers through the regmap, but this is small price to 
> pay.
> +	 */
> +	if (sai->soc_data->has_version_registers)
> +		base += 8;
> +
>  	sai->regmap = devm_regmap_init_mmio_clk(&pdev->dev,
>  			"bus", base, &fsl_sai_regmap_config);
> 
> @@ -923,18 +933,27 @@ static int fsl_sai_remove(struct platform_device 
> *pdev)
> 
>  static const struct fsl_sai_soc_data fsl_sai_vf610_data = {
>  	.use_imx_pcm = false,
> +	.has_version_registers = false,
>  	.fifo_depth = 32,
>  };
> 
>  static const struct fsl_sai_soc_data fsl_sai_imx6sx_data = {
>  	.use_imx_pcm = true,
> +	.has_version_registers = false,
>  	.fifo_depth = 32,
>  };
> 
> +static const struct fsl_sai_soc_data fsl_sai_imx8m_data = {
> +	.use_imx_pcm = true,
> +	.has_version_registers = true,
> +	.fifo_depth = 128,
> +};
> +
>  static const struct of_device_id fsl_sai_ids[] = {
>  	{ .compatible = "fsl,vf610-sai", .data = &fsl_sai_vf610_data },
>  	{ .compatible = "fsl,imx6sx-sai", .data = &fsl_sai_imx6sx_data },
>  	{ .compatible = "fsl,imx6ul-sai", .data = &fsl_sai_imx6sx_data },
> +	{ .compatible = "fsl,imx8mq-sai", .data = &fsl_sai_imx8m_data },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, fsl_sai_ids);
> diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
> index 7c1ef671da28..b6a9053ed400 100644
> --- a/sound/soc/fsl/fsl_sai.h
> +++ b/sound/soc/fsl/fsl_sai.h
> @@ -128,6 +128,7 @@
> 
>  struct fsl_sai_soc_data {
>  	bool use_imx_pcm;
> +	bool has_version_registers;
>  	unsigned int fifo_depth;
>  };
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
