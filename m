Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 671176CCD3
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jul 2019 12:36:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAAA3169E;
	Thu, 18 Jul 2019 12:35:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAAA3169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563446162;
	bh=OD2DrpgFiTC1GxURYjeFHAer+UcdcBGpqBWpfY9WUFI=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=maO8GaMN44lnO7Xdv9eZht2ZJyIcl/opNVSDQmaIVeaYj/fSMikK6ffMPA5ELRrdw
	 X7pWP5VmZIT7kF7g+sB2vM8XieLjgFaMXJcIISy4qSWi8J2W2gE6SMHHpMD4OXQWuH
	 8QSTYsnHUpp0UA2PtRJ7JqbMNiFbAstEd1qQjikU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B18A0F80390;
	Thu, 18 Jul 2019 12:33:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A5C2F80363; Wed, 17 Jul 2019 15:43:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from node.akkea.ca (node.akkea.ca [192.155.83.177])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 074A2F8015B
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 15:43:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 074A2F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=akkea.ca header.i=@akkea.ca
 header.b="Td5QfMox"; 
 dkim=pass (1024-bit key) header.d=akkea.ca header.i=@akkea.ca
 header.b="UmKkA/in"
Received: from localhost (localhost [127.0.0.1])
 by node.akkea.ca (Postfix) with ESMTP id 2E0414E2006;
 Wed, 17 Jul 2019 13:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
 t=1563370999; bh=/Tyq5j5eP2Mo1Ao6mbYGTWvB1BZ/2wpcegS7jLCfrqc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Td5QfMox2jaq+6V+PTZ5/gtskKBM6lkaRgNHg2ZTUwNy4GYFlwlkXGu9IqvmIMNw4
 oXm/8WnLhYvtGgy1H9x5eIT1cfGkkX9clTqP3C1s+gCdnDc+TmS7fykQHaf1JCl/3W
 M0OCVoIY4GA7cJjiJTjKPX+yKlhPMXj+ZwFugvkI=
X-Virus-Scanned: Debian amavisd-new at mail.akkea.ca
Received: from node.akkea.ca ([127.0.0.1])
 by localhost (mail.akkea.ca [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iz2Gu6lDf-V1; Wed, 17 Jul 2019 13:43:18 +0000 (UTC)
Received: from www.akkea.ca (node.akkea.ca [192.155.83.177])
 by node.akkea.ca (Postfix) with ESMTPSA id E14004E2003;
 Wed, 17 Jul 2019 13:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
 t=1563370998; bh=/Tyq5j5eP2Mo1Ao6mbYGTWvB1BZ/2wpcegS7jLCfrqc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=UmKkA/incIC0wBv6XWJpzuNk2tY4SCDIdmlBNyo5e3vUok0UJ/h+5SkoB/xce4sMp
 bd7MB2+VUGMSFUW/hD6jYslMVVanl9Ukng9K2IHxWAknBXCPEE9KQPC4R/bolBXgu8
 s4QX2+ITRk/xkBt0r4quv3wBnHnFOoBBMXHf1cTc=
MIME-Version: 1.0
Date: Wed, 17 Jul 2019 07:43:18 -0600
From: Angus Ainslie <angus@akkea.ca>
To: Lucas Stach <l.stach@pengutronix.de>
In-Reply-To: <20190717105635.18514-3-l.stach@pengutronix.de>
References: <20190717105635.18514-1-l.stach@pengutronix.de>
 <20190717105635.18514-3-l.stach@pengutronix.de>
Message-ID: <6cc95da1373307eb2bace8b4af3c884d@akkea.ca>
X-Sender: angus@akkea.ca
User-Agent: Roundcube Webmail/1.3.6
X-Mailman-Approved-At: Thu, 18 Jul 2019 12:33:32 +0200
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 patchwork-lst@pengutronix.de, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>
Subject: Re: [alsa-devel] [PATCH 2/3] ASoC: fsl_sai: derive TX FIFO
 watermark from FIFO depth
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
> The DMA request schould be triggered as soon as the FIFO has space
> for another burst. As different versions of the SAI block have
> different FIFO sizes, the watrmark level needs to be derived from
> version specific data.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Tested-by: Angus Ainslie <angus@akkea.ca>
Reviewed-by: Angus Ainslie <angus@akkea.ca>

> ---
>  sound/soc/fsl/fsl_sai.c | 4 +++-
>  sound/soc/fsl/fsl_sai.h | 1 +
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 3a1ed8b857d6..b3cd055a61c7 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -649,7 +649,7 @@ static int fsl_sai_dai_probe(struct snd_soc_dai 
> *cpu_dai)
>  	regmap_write(sai->regmap, FSL_SAI_RCSR, 0);
> 
>  	regmap_update_bits(sai->regmap, FSL_SAI_TCR1, FSL_SAI_CR1_RFW_MASK,
> -			   FSL_SAI_MAXBURST_TX * 2);
> +			   sai->soc_data->fifo_depth - FSL_SAI_MAXBURST_TX);
>  	regmap_update_bits(sai->regmap, FSL_SAI_RCR1, FSL_SAI_CR1_RFW_MASK,
>  			   FSL_SAI_MAXBURST_RX - 1);
> 
> @@ -923,10 +923,12 @@ static int fsl_sai_remove(struct platform_device 
> *pdev)
> 
>  static const struct fsl_sai_soc_data fsl_sai_vf610_data = {
>  	.use_imx_pcm = false,
> +	.fifo_depth = 32,
>  };
> 
>  static const struct fsl_sai_soc_data fsl_sai_imx6sx_data = {
>  	.use_imx_pcm = true,
> +	.fifo_depth = 32,
>  };
> 
>  static const struct of_device_id fsl_sai_ids[] = {
> diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
> index 83e2bfe05b1b..7c1ef671da28 100644
> --- a/sound/soc/fsl/fsl_sai.h
> +++ b/sound/soc/fsl/fsl_sai.h
> @@ -128,6 +128,7 @@
> 
>  struct fsl_sai_soc_data {
>  	bool use_imx_pcm;
> +	unsigned int fifo_depth;
>  };
> 
>  struct fsl_sai {
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
