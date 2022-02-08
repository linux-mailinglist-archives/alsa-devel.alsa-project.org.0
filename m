Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3A94AD7D3
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Feb 2022 12:50:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5A551711;
	Tue,  8 Feb 2022 12:49:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5A551711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644321038;
	bh=ql12/h0aJ28wbCitdt6ZQyiGrqMJxTLwML5CvfxZ2ok=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C65NdnazI3W9zSbLOArtlVMCKSzKXQdu7sZL31vZTLyyKlW8xMu2kt2i0c6qCW/ew
	 PBg7KmDHIkRGRwpc7p350d/yKQUrS4qeSLD3lZE8/ziOXMisa8rGL3Zq9YBGUeCwhx
	 C6T0mL+N7FgTzhHtDs1q6eCI3SnlSd7f/2esw7zI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F936F80154;
	Tue,  8 Feb 2022 12:49:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5BBBF8013C; Tue,  8 Feb 2022 12:49:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A3C3F800F0
 for <alsa-devel@alsa-project.org>; Tue,  8 Feb 2022 12:49:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A3C3F800F0
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nHOzp-0001MD-O7; Tue, 08 Feb 2022 12:49:21 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nHOzo-0001NK-Ty; Tue, 08 Feb 2022 12:49:20 +0100
Date: Tue, 8 Feb 2022 12:49:20 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Enable combine mode soft
Message-ID: <20220208114920.GF22780@pengutronix.de>
References: <20220111081518.982437-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111081518.982437-1-s.hauer@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:48:03 up 59 days, 20:33, 87 users,  load average: 0.01, 0.10, 0.12
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 kernel@pengutronix.de
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

Hi Nicolin, Xiubo,

Any input to this one?

Sascha

On Tue, Jan 11, 2022 at 09:15:18AM +0100, Sascha Hauer wrote:
> The fsl_sai driver calculates the number of pins used and enables
> multiple channels if necessary. This means the SAI expects data in
> one FIFO per pin. The SDMA engine only services a single FIFO, so
> multi pin support doesn't work at all.
> 
> This patch enables the software combine mode in chips that support
> it. With this the SAI presents only a single FIFO to the outside
> and distributes the data into the different FIFOs internally.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  sound/soc/fsl/fsl_sai.c | 9 +++++++++
>  sound/soc/fsl/fsl_sai.h | 1 +
>  2 files changed, 10 insertions(+)
> 
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 10544fa27dc0..cab015d96889 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -517,6 +517,10 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
>  				   FSL_SAI_CR5_FBT_MASK, val_cr5);
>  	}
>  
> +	if (sai->soc_data->pins > 1)
> +		regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx, ofs),
> +				   FSL_SAI_CR4_FCOMB_MASK, FSL_SAI_CR4_FCOMB_SOFT);
> +
>  	regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx, ofs),
>  			   FSL_SAI_CR3_TRCE_MASK,
>  			   FSL_SAI_CR3_TRCE((1 << pins) - 1));
> @@ -1195,6 +1199,7 @@ static const struct fsl_sai_soc_data fsl_sai_vf610_data = {
>  	.use_imx_pcm = false,
>  	.use_edma = false,
>  	.fifo_depth = 32,
> +	.pins = 1,
>  	.reg_offset = 0,
>  	.mclk0_is_mclk1 = false,
>  	.flags = 0,
> @@ -1204,6 +1209,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx6sx_data = {
>  	.use_imx_pcm = true,
>  	.use_edma = false,
>  	.fifo_depth = 32,
> +	.pins = 1,
>  	.reg_offset = 0,
>  	.mclk0_is_mclk1 = true,
>  	.flags = 0,
> @@ -1213,6 +1219,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx7ulp_data = {
>  	.use_imx_pcm = true,
>  	.use_edma = false,
>  	.fifo_depth = 16,
> +	.pins = 2,
>  	.reg_offset = 8,
>  	.mclk0_is_mclk1 = false,
>  	.flags = PMQOS_CPU_LATENCY,
> @@ -1222,6 +1229,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx8mq_data = {
>  	.use_imx_pcm = true,
>  	.use_edma = false,
>  	.fifo_depth = 128,
> +	.pins = 8,
>  	.reg_offset = 8,
>  	.mclk0_is_mclk1 = false,
>  	.flags = 0,
> @@ -1231,6 +1239,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx8qm_data = {
>  	.use_imx_pcm = true,
>  	.use_edma = true,
>  	.fifo_depth = 64,
> +	.pins = 1,
>  	.reg_offset = 0,
>  	.mclk0_is_mclk1 = false,
>  	.flags = 0,
> diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
> index 9aaf231bc024..410f6e6a9137 100644
> --- a/sound/soc/fsl/fsl_sai.h
> +++ b/sound/soc/fsl/fsl_sai.h
> @@ -223,6 +223,7 @@ struct fsl_sai_soc_data {
>  	bool use_edma;
>  	bool mclk0_is_mclk1;
>  	unsigned int fifo_depth;
> +	unsigned int pins;
>  	unsigned int reg_offset;
>  	unsigned int flags;
>  };
> -- 
> 2.30.2
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
