Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C9F7421E
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 01:33:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFCD6193E;
	Thu, 25 Jul 2019 01:32:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFCD6193E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564011202;
	bh=H7H9YEUJoQNOMSauUO0dzTvOqPV+U77vRvznx5RcBsg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KeHI4mHv6LiYQwDC6urhI1jkaFfo0Hb+ccl5UvOBm0vUlEPpcKWrWv0IcjK0WR0YA
	 Ca3NrMSf8uYPwGA4duGeqnBUC/+Tlabu0ub6xJPX64/wOteLhN8RwZtdjq25Y2E+Le
	 JmnCEOZPpkAmn3PBu1rwjy9PhP4ellydlno4Kerg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CAC7F80368;
	Thu, 25 Jul 2019 01:31:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 065DBF803D1; Thu, 25 Jul 2019 01:31:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D997EF800E3
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 01:31:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D997EF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="tIdJ7NmW"
Received: by mail-pf1-x442.google.com with SMTP id r1so21686101pfq.12
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 16:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3aT0xWPKwx9j25bSWm8e+6oJCrrpCLlu597vQAlJDBs=;
 b=tIdJ7NmWXUvHErQYcNszRpHn79HTpTb5ocvhWbq2OOcn3jOMpERZd5YQovQdbXRV5M
 d53x4GFyRCm37F0DAZRSadBhvL5hrqY5g0Guck6kNTLFjF3QPVBPCvoOt2YqvmJ3W+nm
 yBvZ1Vhxc4FLjoyMUmqQ4PN3lbQhxqpKwHhHpIllnsH6V3+dFWNf+l2W8INTjAG9QuXq
 MiQSegpZZbTv8hOsUgrw/qrTYFqar+h7Aex3H3+btRSnEMywYeFbWMOjy/GuZ8n2SsFi
 ZF7BoFHBFYB1SsSmuRkuAWZHAEAe4p7LLu/fA6RRQnGx9xHeQWtBp3Kzl2T1zrdMoT/C
 E9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3aT0xWPKwx9j25bSWm8e+6oJCrrpCLlu597vQAlJDBs=;
 b=raRu5GZPSTgjYsmfyIlHrYtjDuMqtPBiaeMi0ZgCU2vkbr/JuWwYHuTWmpsINfKXlB
 1pqSP2VeNCvy4XZAxIvvDcTCvurmZudfufQNzP4WmhXbPOB6yonfkyQKbjOIuLJjJjgD
 v7y2+4ZPEStVoMK07DguCLRD+Aez63/RjuO2rMbPZYbC60HZAvdgJKUwYsO6fmxJF2fE
 P5RAHSq8ePMNsR2RCppysZpYijFS0QFUJhH4UcKbCer9od3WFRV/y3xG1Paesm2Dt3bv
 VIsPdI8AvDsimkws19Vaa4KJ+Nl5NW5C1xY2s43GWuWx8NcQugnGa8NWkUWjEAHMgiqU
 ywQQ==
X-Gm-Message-State: APjAAAVIo0a0ij3AAySAjKgl4lKiYQ46IUc+J42TDFTetOvnVKhFDnE6
 nTcUuN4lXrGxS/HQT9JqZAg=
X-Google-Smtp-Source: APXvYqz6lZ8tairF7kG/M+oiR7xdVsAQ2HLdN2mu8roRZyhiSxQTDjhUEamVSPOcB+CD4YH3w8SjMA==
X-Received: by 2002:a17:90a:2041:: with SMTP id
 n59mr86440763pjc.6.1564011088318; 
 Wed, 24 Jul 2019 16:31:28 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id e17sm38617789pgm.21.2019.07.24.16.31.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Jul 2019 16:31:28 -0700 (PDT)
Date: Wed, 24 Jul 2019 16:32:12 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <20190724233212.GD6859@Asurada-Nvidia.nvidia.com>
References: <20190722124833.28757-1-daniel.baluta@nxp.com>
 <20190722124833.28757-10-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190722124833.28757-10-daniel.baluta@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, viorel.suman@nxp.com, timur@kernel.org,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, shengjiu.wang@nxp.com,
 angus@akkea.ca, tiwai@suse.com, broonie@kernel.org, linux-imx@nxp.com,
 kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org,
 l.stach@pengutronix.de
Subject: Re: [alsa-devel] [PATCH 09/10] ASoC: fsl_sai: Add support for SAI
	new version
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Jul 22, 2019 at 03:48:32PM +0300, Daniel Baluta wrote:
> New IP version introduces Version ID and Parameter registers
> and optionally added Timestamp feature.
> 
> VERID and PARAM registers are placed at the top of registers
> address space and some registers are shifted according to
> the following table:
> 
> Tx/Rx data registers and Tx/Rx FIFO registers keep their
> addresses, all other registers are shifted by 8.

Feels like Lucas's approach is neater. I saw that Register TMR
at 0x60 is exceptional during your previous discussion. So can
we apply an offset-cancellation for it exceptionally? I haven't
checked all the registers so this would look okay to me as well
if there are more than just Register TMR.

Thanks
Nicolin

> SAI Memory map is described in chapter 13.10.4.1.1 I2S Memory map
> of the Reference Manual [1].
> 
> In order to make as less changes as possible we attach an offset
> to each register offset to each changed register definition. The
> offset is read from each board private data.
> 
> [1]https://cache.nxp.com/secured/assets/documents/en/reference-manual/IMX8MDQLQRM.pdf?__gda__=1563728701_38bea7f0f726472cc675cb141b91bec7&fileExt=.pdf
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  sound/soc/fsl/fsl_sai.c | 240 +++++++++++++++++++++++-----------------
>  sound/soc/fsl/fsl_sai.h |  41 +++----
>  2 files changed, 162 insertions(+), 119 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 140014901fce..f2441b84877e 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -40,6 +40,7 @@ static const struct snd_pcm_hw_constraint_list fsl_sai_rate_constraints = {
>  static irqreturn_t fsl_sai_isr(int irq, void *devid)
>  {
>  	struct fsl_sai *sai = (struct fsl_sai *)devid;
> +	unsigned int ofs = sai->soc_data->reg_offset;
>  	struct device *dev = &sai->pdev->dev;
>  	u32 flags, xcsr, mask;
>  	bool irq_none = true;
> @@ -52,7 +53,7 @@ static irqreturn_t fsl_sai_isr(int irq, void *devid)
>  	mask = (FSL_SAI_FLAGS >> FSL_SAI_CSR_xIE_SHIFT) << FSL_SAI_CSR_xF_SHIFT;
>  
>  	/* Tx IRQ */
> -	regmap_read(sai->regmap, FSL_SAI_TCSR, &xcsr);
> +	regmap_read(sai->regmap, FSL_SAI_TCSR(ofs), &xcsr);
>  	flags = xcsr & mask;
>  
>  	if (flags)
> @@ -82,11 +83,11 @@ static irqreturn_t fsl_sai_isr(int irq, void *devid)
>  	xcsr &= ~FSL_SAI_CSR_xF_MASK;
>  
>  	if (flags)
> -		regmap_write(sai->regmap, FSL_SAI_TCSR, flags | xcsr);
> +		regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), flags | xcsr);
>  
>  irq_rx:
>  	/* Rx IRQ */
> -	regmap_read(sai->regmap, FSL_SAI_RCSR, &xcsr);
> +	regmap_read(sai->regmap, FSL_SAI_RCSR(ofs), &xcsr);
>  	flags = xcsr & mask;
>  
>  	if (flags)
> @@ -116,7 +117,7 @@ static irqreturn_t fsl_sai_isr(int irq, void *devid)
>  	xcsr &= ~FSL_SAI_CSR_xF_MASK;
>  
>  	if (flags)
> -		regmap_write(sai->regmap, FSL_SAI_RCSR, flags | xcsr);
> +		regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), flags | xcsr);
>  
>  out:
>  	if (irq_none)
> @@ -140,6 +141,7 @@ static int fsl_sai_set_dai_sysclk_tr(struct snd_soc_dai *cpu_dai,
>  		int clk_id, unsigned int freq, int fsl_dir)
>  {
>  	struct fsl_sai *sai = snd_soc_dai_get_drvdata(cpu_dai);
> +	unsigned int ofs = sai->soc_data->reg_offset;
>  	bool tx = fsl_dir == FSL_FMT_TRANSMITTER;
>  	u32 val_cr2 = 0;
>  
> @@ -160,7 +162,7 @@ static int fsl_sai_set_dai_sysclk_tr(struct snd_soc_dai *cpu_dai,
>  		return -EINVAL;
>  	}
>  
> -	regmap_update_bits(sai->regmap, FSL_SAI_xCR2(tx),
> +	regmap_update_bits(sai->regmap, FSL_SAI_xCR2(tx, ofs),
>  			   FSL_SAI_CR2_MSEL_MASK, val_cr2);
>  
>  	return 0;
> @@ -193,6 +195,7 @@ static int fsl_sai_set_dai_fmt_tr(struct snd_soc_dai *cpu_dai,
>  				unsigned int fmt, int fsl_dir)
>  {
>  	struct fsl_sai *sai = snd_soc_dai_get_drvdata(cpu_dai);
> +	unsigned int ofs = sai->soc_data->reg_offset;
>  	bool tx = fsl_dir == FSL_FMT_TRANSMITTER;
>  	u32 val_cr2 = 0, val_cr4 = 0;
>  
> @@ -287,9 +290,9 @@ static int fsl_sai_set_dai_fmt_tr(struct snd_soc_dai *cpu_dai,
>  		return -EINVAL;
>  	}
>  
> -	regmap_update_bits(sai->regmap, FSL_SAI_xCR2(tx),
> +	regmap_update_bits(sai->regmap, FSL_SAI_xCR2(tx, ofs),
>  			   FSL_SAI_CR2_BCP | FSL_SAI_CR2_BCD_MSTR, val_cr2);
> -	regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx),
> +	regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx, ofs),
>  			   FSL_SAI_CR4_MF | FSL_SAI_CR4_FSE |
>  			   FSL_SAI_CR4_FSP | FSL_SAI_CR4_FSD_MSTR, val_cr4);
>  
> @@ -316,6 +319,7 @@ static int fsl_sai_set_dai_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
>  static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
>  {
>  	struct fsl_sai *sai = snd_soc_dai_get_drvdata(dai);
> +	unsigned int ofs = sai->soc_data->reg_offset;
>  	unsigned long clk_rate;
>  	u32 savediv = 0, ratio, savesub = freq;
>  	u32 id;
> @@ -378,17 +382,17 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
>  	 */
>  	if ((sai->synchronous[TX] && !sai->synchronous[RX]) ||
>  	    (!tx && !sai->synchronous[RX])) {
> -		regmap_update_bits(sai->regmap, FSL_SAI_RCR2,
> +		regmap_update_bits(sai->regmap, FSL_SAI_RCR2(ofs),
>  				   FSL_SAI_CR2_MSEL_MASK,
>  				   FSL_SAI_CR2_MSEL(sai->mclk_id[tx]));
> -		regmap_update_bits(sai->regmap, FSL_SAI_RCR2,
> +		regmap_update_bits(sai->regmap, FSL_SAI_RCR2(ofs),
>  				   FSL_SAI_CR2_DIV_MASK, savediv - 1);
>  	} else if ((sai->synchronous[RX] && !sai->synchronous[TX]) ||
>  		   (tx && !sai->synchronous[TX])) {
> -		regmap_update_bits(sai->regmap, FSL_SAI_TCR2,
> +		regmap_update_bits(sai->regmap, FSL_SAI_TCR2(ofs),
>  				   FSL_SAI_CR2_MSEL_MASK,
>  				   FSL_SAI_CR2_MSEL(sai->mclk_id[tx]));
> -		regmap_update_bits(sai->regmap, FSL_SAI_TCR2,
> +		regmap_update_bits(sai->regmap, FSL_SAI_TCR2(ofs),
>  				   FSL_SAI_CR2_DIV_MASK, savediv - 1);
>  	}
>  
> @@ -403,6 +407,7 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
>  		struct snd_soc_dai *cpu_dai)
>  {
>  	struct fsl_sai *sai = snd_soc_dai_get_drvdata(cpu_dai);
> +	unsigned int ofs = sai->soc_data->reg_offset;
>  	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
>  	unsigned int channels = params_channels(params);
>  	u32 word_width = params_width(params);
> @@ -455,19 +460,19 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
>  
>  	if (!sai->is_slave_mode) {
>  		if (!sai->synchronous[TX] && sai->synchronous[RX] && !tx) {
> -			regmap_update_bits(sai->regmap, FSL_SAI_TCR4,
> +			regmap_update_bits(sai->regmap, FSL_SAI_TCR4(ofs),
>  				FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK,
>  				val_cr4);
> -			regmap_update_bits(sai->regmap, FSL_SAI_TCR5,
> +			regmap_update_bits(sai->regmap, FSL_SAI_TCR5(ofs),
>  				FSL_SAI_CR5_WNW_MASK | FSL_SAI_CR5_W0W_MASK |
>  				FSL_SAI_CR5_FBT_MASK, val_cr5);
>  			regmap_write(sai->regmap, FSL_SAI_TMR,
>  				~0UL - ((1 << channels) - 1));
>  		} else if (!sai->synchronous[RX] && sai->synchronous[TX] && tx) {
> -			regmap_update_bits(sai->regmap, FSL_SAI_RCR4,
> +			regmap_update_bits(sai->regmap, FSL_SAI_RCR4(ofs),
>  				FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK,
>  				val_cr4);
> -			regmap_update_bits(sai->regmap, FSL_SAI_RCR5,
> +			regmap_update_bits(sai->regmap, FSL_SAI_RCR5(ofs),
>  				FSL_SAI_CR5_WNW_MASK | FSL_SAI_CR5_W0W_MASK |
>  				FSL_SAI_CR5_FBT_MASK, val_cr5);
>  			regmap_write(sai->regmap, FSL_SAI_RMR,
> @@ -475,26 +480,26 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
>  		}
>  	}
>  
> -	switch (sai->soc_data->fcomb_mode[tx]) {
> +	switch (sai->fcomb_mode[tx]) {
>  	case FSL_SAI_FCOMB_NONE:
> -		regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx),
> +		regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx, ofs),
>  				   FSL_SAI_CR4_FCOMB_SOFT |
>  				   FSL_SAI_CR4_FCOMB_SHIFT, 0);
>  		break;
>  	case FSL_SAI_FCOMB_SHIFT:
> -		regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx),
> +		regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx, ofs),
>  				   FSL_SAI_CR4_FCOMB_SOFT |
>  				   FSL_SAI_CR4_FCOMB_SHIFT,
>  				   FSL_SAI_CR4_FCOMB_SHIFT);
>  		break;
>  	case FSL_SAI_FCOMB_SOFT:
> -		regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx),
> +		regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx, ofs),
>  				   FSL_SAI_CR4_FCOMB_SOFT |
>  				   FSL_SAI_CR4_FCOMB_SHIFT,
>  				   FSL_SAI_CR4_FCOMB_SOFT);
>  		break;
>  	case FSL_SAI_FCOMB_BOTH:
> -		regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx),
> +		regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx, ofs),
>  				   FSL_SAI_CR4_FCOMB_SOFT |
>  				   FSL_SAI_CR4_FCOMB_SHIFT,
>  				   FSL_SAI_CR4_FCOMB_SOFT |
> @@ -504,10 +509,10 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
>  		break;
>  	}
>  
> -	regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx),
> +	regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx, ofs),
>  			   FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK,
>  			   val_cr4);
> -	regmap_update_bits(sai->regmap, FSL_SAI_xCR5(tx),
> +	regmap_update_bits(sai->regmap, FSL_SAI_xCR5(tx, ofs),
>  			   FSL_SAI_CR5_WNW_MASK | FSL_SAI_CR5_W0W_MASK |
>  			   FSL_SAI_CR5_FBT_MASK, val_cr5);
>  	regmap_write(sai->regmap, FSL_SAI_xMR(tx), ~0UL - ((1 << channels) - 1));
> @@ -535,6 +540,8 @@ static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
>  		struct snd_soc_dai *cpu_dai)
>  {
>  	struct fsl_sai *sai = snd_soc_dai_get_drvdata(cpu_dai);
> +	unsigned int ofs = sai->soc_data->reg_offset;
> +
>  	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
>  	u32 xcsr, count = 100;
>  
> @@ -543,9 +550,9 @@ static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
>  	 * Rx sync with Tx clocks: Clear SYNC for Tx, set it for Rx.
>  	 * Tx sync with Rx clocks: Clear SYNC for Rx, set it for Tx.
>  	 */
> -	regmap_update_bits(sai->regmap, FSL_SAI_TCR2, FSL_SAI_CR2_SYNC,
> -		           sai->synchronous[TX] ? FSL_SAI_CR2_SYNC : 0);
> -	regmap_update_bits(sai->regmap, FSL_SAI_RCR2, FSL_SAI_CR2_SYNC,
> +	regmap_update_bits(sai->regmap, FSL_SAI_TCR2(ofs), FSL_SAI_CR2_SYNC,
> +			   sai->synchronous[TX] ? FSL_SAI_CR2_SYNC : 0);
> +	regmap_update_bits(sai->regmap, FSL_SAI_RCR2(ofs), FSL_SAI_CR2_SYNC,
>  			   sai->synchronous[RX] ? FSL_SAI_CR2_SYNC : 0);
>  
>  	/*
> @@ -556,43 +563,44 @@ static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
>  	case SNDRV_PCM_TRIGGER_START:
>  	case SNDRV_PCM_TRIGGER_RESUME:
>  	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> -		regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx),
> +		regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
>  				   FSL_SAI_CSR_FRDE, FSL_SAI_CSR_FRDE);
>  
> -		regmap_update_bits(sai->regmap, FSL_SAI_RCSR,
> +		regmap_update_bits(sai->regmap, FSL_SAI_RCSR(ofs),
>  				   FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
> -		regmap_update_bits(sai->regmap, FSL_SAI_TCSR,
> +		regmap_update_bits(sai->regmap, FSL_SAI_TCSR(ofs),
>  				   FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
>  
> -		regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx),
> +		regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
>  				   FSL_SAI_CSR_xIE_MASK, FSL_SAI_FLAGS);
>  		break;
>  	case SNDRV_PCM_TRIGGER_STOP:
>  	case SNDRV_PCM_TRIGGER_SUSPEND:
>  	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> -		regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx),
> +		regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
>  				   FSL_SAI_CSR_FRDE, 0);
> -		regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx),
> +		regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
>  				   FSL_SAI_CSR_xIE_MASK, 0);
>  
>  		/* Check if the opposite FRDE is also disabled */
> -		regmap_read(sai->regmap, FSL_SAI_xCSR(!tx), &xcsr);
> +		regmap_read(sai->regmap, FSL_SAI_xCSR(!tx, ofs), &xcsr);
>  		if (!(xcsr & FSL_SAI_CSR_FRDE)) {
>  			/* Disable both directions and reset their FIFOs */
> -			regmap_update_bits(sai->regmap, FSL_SAI_TCSR,
> +			regmap_update_bits(sai->regmap, FSL_SAI_TCSR(ofs),
>  					   FSL_SAI_CSR_TERE, 0);
> -			regmap_update_bits(sai->regmap, FSL_SAI_RCSR,
> +			regmap_update_bits(sai->regmap, FSL_SAI_RCSR(ofs),
>  					   FSL_SAI_CSR_TERE, 0);
>  
>  			/* TERE will remain set till the end of current frame */
>  			do {
>  				udelay(10);
> -				regmap_read(sai->regmap, FSL_SAI_xCSR(tx), &xcsr);
> +				regmap_read(sai->regmap,
> +					    FSL_SAI_xCSR(tx, ofs), &xcsr);
>  			} while (--count && xcsr & FSL_SAI_CSR_TERE);
>  
> -			regmap_update_bits(sai->regmap, FSL_SAI_TCSR,
> +			regmap_update_bits(sai->regmap, FSL_SAI_TCSR(ofs),
>  					   FSL_SAI_CSR_FR, FSL_SAI_CSR_FR);
> -			regmap_update_bits(sai->regmap, FSL_SAI_RCSR,
> +			regmap_update_bits(sai->regmap, FSL_SAI_RCSR(ofs),
>  					   FSL_SAI_CSR_FR, FSL_SAI_CSR_FR);
>  
>  			/*
> @@ -604,13 +612,13 @@ static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
>  			 */
>  			if (!sai->is_slave_mode) {
>  				/* Software Reset for both Tx and Rx */
> -				regmap_write(sai->regmap,
> -					     FSL_SAI_TCSR, FSL_SAI_CSR_SR);
> -				regmap_write(sai->regmap,
> -					     FSL_SAI_RCSR, FSL_SAI_CSR_SR);
> +				regmap_write(sai->regmap, FSL_SAI_TCSR(ofs),
> +					     FSL_SAI_CSR_SR);
> +				regmap_write(sai->regmap, FSL_SAI_RCSR(ofs),
> +					     FSL_SAI_CSR_SR);
>  				/* Clear SR bit to finish the reset */
> -				regmap_write(sai->regmap, FSL_SAI_TCSR, 0);
> -				regmap_write(sai->regmap, FSL_SAI_RCSR, 0);
> +				regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), 0);
> +				regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), 0);
>  			}
>  		}
>  		break;
> @@ -625,12 +633,13 @@ static int fsl_sai_startup(struct snd_pcm_substream *substream,
>  		struct snd_soc_dai *cpu_dai)
>  {
>  	struct fsl_sai *sai = snd_soc_dai_get_drvdata(cpu_dai);
> +	unsigned int ofs = sai->soc_data->reg_offset;
>  	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
>  	int ret;
>  
> -	regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx),
> +	regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx, ofs),
>  			   FSL_SAI_CR3_TRCE_MASK,
> -			   FSL_SAI_CR3_TRCE(sai->soc_data->dl_mask[tx]);
> +			   FSL_SAI_CR3_TRCE(sai->dl_mask[tx]));
>  
>  	ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
>  			SNDRV_PCM_HW_PARAM_RATE, &fsl_sai_rate_constraints);
> @@ -642,9 +651,10 @@ static void fsl_sai_shutdown(struct snd_pcm_substream *substream,
>  		struct snd_soc_dai *cpu_dai)
>  {
>  	struct fsl_sai *sai = snd_soc_dai_get_drvdata(cpu_dai);
> +	unsigned int ofs = sai->soc_data->reg_offset;
>  	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
>  
> -	regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx),
> +	regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx, ofs),
>  			   FSL_SAI_CR3_TRCE_MASK, 0);
>  }
>  
> @@ -662,18 +672,20 @@ static const struct snd_soc_dai_ops fsl_sai_pcm_dai_ops = {
>  static int fsl_sai_dai_probe(struct snd_soc_dai *cpu_dai)
>  {
>  	struct fsl_sai *sai = dev_get_drvdata(cpu_dai->dev);
> +	unsigned int ofs = sai->soc_data->reg_offset;
>  
>  	/* Software Reset for both Tx and Rx */
> -	regmap_write(sai->regmap, FSL_SAI_TCSR, FSL_SAI_CSR_SR);
> -	regmap_write(sai->regmap, FSL_SAI_RCSR, FSL_SAI_CSR_SR);
> +	regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), FSL_SAI_CSR_SR);
> +	regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), FSL_SAI_CSR_SR);
>  	/* Clear SR bit to finish the reset */
> -	regmap_write(sai->regmap, FSL_SAI_TCSR, 0);
> -	regmap_write(sai->regmap, FSL_SAI_RCSR, 0);
> +	regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), 0);
> +	regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), 0);
>  
> -	regmap_update_bits(sai->regmap, FSL_SAI_TCR1, FSL_SAI_CR1_RFW_MASK,
> +	regmap_update_bits(sai->regmap, FSL_SAI_TCR1(ofs),
> +			   FSL_SAI_CR1_RFW_MASK,
>  			   sai->soc_data->fifo_depth - FSL_SAI_MAXBURST_TX);
> -	regmap_update_bits(sai->regmap, FSL_SAI_RCR1, FSL_SAI_CR1_RFW_MASK,
> -			   FSL_SAI_MAXBURST_RX - 1);
> +	regmap_update_bits(sai->regmap, FSL_SAI_RCR1(ofs),
> +			   FSL_SAI_CR1_RFW_MASK, FSL_SAI_MAXBURST_RX - 1);
>  
>  	snd_soc_dai_init_dma_data(cpu_dai, &sai->dma_params_tx,
>  				&sai->dma_params_rx);
> @@ -710,12 +722,12 @@ static const struct snd_soc_component_driver fsl_component = {
>  	.name           = "fsl-sai",
>  };
>  
> -static struct reg_default fsl_sai_reg_defaults[] = {
> -	{FSL_SAI_TCR1, 0},
> -	{FSL_SAI_TCR2, 0},
> -	{FSL_SAI_TCR3, 0},
> -	{FSL_SAI_TCR4, 0},
> -	{FSL_SAI_TCR5, 0},
> +static struct reg_default fsl_sai_reg_defaults_ofs0[] = {
> +	{FSL_SAI_TCR1(0), 0},
> +	{FSL_SAI_TCR2(0), 0},
> +	{FSL_SAI_TCR3(0), 0},
> +	{FSL_SAI_TCR4(0), 0},
> +	{FSL_SAI_TCR5(0), 0},
>  	{FSL_SAI_TDR0, 0},
>  	{FSL_SAI_TDR1, 0},
>  	{FSL_SAI_TDR2, 0},
> @@ -724,24 +736,50 @@ static struct reg_default fsl_sai_reg_defaults[] = {
>  	{FSL_SAI_TDR5, 0},
>  	{FSL_SAI_TDR6, 0},
>  	{FSL_SAI_TDR7, 0},
> -	{FSL_SAI_TMR,  0},
> -	{FSL_SAI_RCR1, 0},
> -	{FSL_SAI_RCR2, 0},
> -	{FSL_SAI_RCR3, 0},
> -	{FSL_SAI_RCR4, 0},
> -	{FSL_SAI_RCR5, 0},
> -	{FSL_SAI_RMR,  0},
> +	{FSL_SAI_TMR, 0},
> +	{FSL_SAI_RCR1(0), 0},
> +	{FSL_SAI_RCR2(0), 0},
> +	{FSL_SAI_RCR3(0), 0},
> +	{FSL_SAI_RCR4(0), 0},
> +	{FSL_SAI_RCR5(0), 0},
> +	{FSL_SAI_RMR, 0},
> +};
> +
> +static struct reg_default fsl_sai_reg_defaults_ofs8[] = {
> +	{FSL_SAI_TCR1(8), 0},
> +	{FSL_SAI_TCR2(8), 0},
> +	{FSL_SAI_TCR3(8), 0},
> +	{FSL_SAI_TCR4(8), 0},
> +	{FSL_SAI_TCR5(8), 0},
> +	{FSL_SAI_TDR0, 0},
> +	{FSL_SAI_TDR1, 0},
> +	{FSL_SAI_TDR2, 0},
> +	{FSL_SAI_TDR3, 0},
> +	{FSL_SAI_TDR4, 0},
> +	{FSL_SAI_TDR5, 0},
> +	{FSL_SAI_TDR6, 0},
> +	{FSL_SAI_TDR7, 0},
> +	{FSL_SAI_TMR, 0},
> +	{FSL_SAI_RCR1(8), 0},
> +	{FSL_SAI_RCR2(8), 0},
> +	{FSL_SAI_RCR3(8), 0},
> +	{FSL_SAI_RCR4(8), 0},
> +	{FSL_SAI_RCR5(8), 0},
> +	{FSL_SAI_RMR, 0},
>  };
>  
>  static bool fsl_sai_readable_reg(struct device *dev, unsigned int reg)
>  {
> +	struct fsl_sai *sai = dev_get_drvdata(dev);
> +	unsigned int ofs = sai->soc_data->reg_offset;
> +
> +	if (reg >= FSL_SAI_TCSR(ofs) && reg <= FSL_SAI_TCR5(ofs))
> +		return true;
> +
> +	if (reg >= FSL_SAI_RCSR(ofs) && reg <= FSL_SAI_RCR5(ofs))
> +		return true;
> +
>  	switch (reg) {
> -	case FSL_SAI_TCSR:
> -	case FSL_SAI_TCR1:
> -	case FSL_SAI_TCR2:
> -	case FSL_SAI_TCR3:
> -	case FSL_SAI_TCR4:
> -	case FSL_SAI_TCR5:
>  	case FSL_SAI_TFR0:
>  	case FSL_SAI_TFR1:
>  	case FSL_SAI_TFR2:
> @@ -751,12 +789,6 @@ static bool fsl_sai_readable_reg(struct device *dev, unsigned int reg)
>  	case FSL_SAI_TFR6:
>  	case FSL_SAI_TFR7:
>  	case FSL_SAI_TMR:
> -	case FSL_SAI_RCSR:
> -	case FSL_SAI_RCR1:
> -	case FSL_SAI_RCR2:
> -	case FSL_SAI_RCR3:
> -	case FSL_SAI_RCR4:
> -	case FSL_SAI_RCR5:
>  	case FSL_SAI_RDR0:
>  	case FSL_SAI_RDR1:
>  	case FSL_SAI_RDR2:
> @@ -782,9 +814,13 @@ static bool fsl_sai_readable_reg(struct device *dev, unsigned int reg)
>  
>  static bool fsl_sai_volatile_reg(struct device *dev, unsigned int reg)
>  {
> +	struct fsl_sai *sai = dev_get_drvdata(dev);
> +	unsigned int ofs = sai->soc_data->reg_offset;
> +
> +	if (reg == FSL_SAI_TCSR(ofs) || reg == FSL_SAI_RCSR(ofs))
> +		return true;
> +
>  	switch (reg) {
> -	case FSL_SAI_TCSR:
> -	case FSL_SAI_RCSR:
>  	case FSL_SAI_TFR0:
>  	case FSL_SAI_TFR1:
>  	case FSL_SAI_TFR2:
> @@ -817,13 +853,16 @@ static bool fsl_sai_volatile_reg(struct device *dev, unsigned int reg)
>  
>  static bool fsl_sai_writeable_reg(struct device *dev, unsigned int reg)
>  {
> +	struct fsl_sai *sai = dev_get_drvdata(dev);
> +	unsigned int ofs = sai->soc_data->reg_offset;
> +
> +	if (reg >= FSL_SAI_TCSR(ofs) && reg <= FSL_SAI_TCR5(ofs))
> +		return true;
> +
> +	if (reg >= FSL_SAI_RCSR(ofs) && reg <= FSL_SAI_RCR5(ofs))
> +		return true;
> +
>  	switch (reg) {
> -	case FSL_SAI_TCSR:
> -	case FSL_SAI_TCR1:
> -	case FSL_SAI_TCR2:
> -	case FSL_SAI_TCR3:
> -	case FSL_SAI_TCR4:
> -	case FSL_SAI_TCR5:
>  	case FSL_SAI_TDR0:
>  	case FSL_SAI_TDR1:
>  	case FSL_SAI_TDR2:
> @@ -833,12 +872,6 @@ static bool fsl_sai_writeable_reg(struct device *dev, unsigned int reg)
>  	case FSL_SAI_TDR6:
>  	case FSL_SAI_TDR7:
>  	case FSL_SAI_TMR:
> -	case FSL_SAI_RCSR:
> -	case FSL_SAI_RCR1:
> -	case FSL_SAI_RCR2:
> -	case FSL_SAI_RCR3:
> -	case FSL_SAI_RCR4:
> -	case FSL_SAI_RCR5:
>  	case FSL_SAI_RMR:
>  		return true;
>  	default:
> @@ -846,14 +879,14 @@ static bool fsl_sai_writeable_reg(struct device *dev, unsigned int reg)
>  	}
>  }
>  
> -static const struct regmap_config fsl_sai_regmap_config = {
> +static struct regmap_config fsl_sai_regmap_config = {
>  	.reg_bits = 32,
>  	.reg_stride = 4,
>  	.val_bits = 32,
>  
>  	.max_register = FSL_SAI_RMR,
> -	.reg_defaults = fsl_sai_reg_defaults,
> -	.num_reg_defaults = ARRAY_SIZE(fsl_sai_reg_defaults),
> +	.reg_defaults = fsl_sai_reg_defaults_ofs0,
> +	.num_reg_defaults = ARRAY_SIZE(fsl_sai_reg_defaults_ofs0),
>  	.readable_reg = fsl_sai_readable_reg,
>  	.volatile_reg = fsl_sai_volatile_reg,
>  	.writeable_reg = fsl_sai_writeable_reg,
> @@ -885,6 +918,12 @@ static int fsl_sai_probe(struct platform_device *pdev)
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  
> +	if (sai->soc_data->reg_offset == 8) {
> +		fsl_sai_regmap_config.reg_defaults = fsl_sai_reg_defaults_ofs8;
> +		fsl_sai_regmap_config.num_reg_defaults =
> +			ARRAY_SIZE(fsl_sai_reg_defaults_ofs8);
> +	}
> +
>  	sai->regmap = devm_regmap_init_mmio_clk(&pdev->dev,
>  			"bus", base, &fsl_sai_regmap_config);
>  
> @@ -1017,11 +1056,13 @@ static int fsl_sai_remove(struct platform_device *pdev)
>  static const struct fsl_sai_soc_data fsl_sai_vf610_data = {
>  	.use_imx_pcm = false,
>  	.fifo_depth = 32,
> +	.reg_offset = 0,
>  };
>  
>  static const struct fsl_sai_soc_data fsl_sai_imx6sx_data = {
>  	.use_imx_pcm = true,
>  	.fifo_depth = 32,
> +	.reg_offset = 0,
>  };
>  
>  static const struct of_device_id fsl_sai_ids[] = {
> @@ -1054,6 +1095,7 @@ static int fsl_sai_runtime_suspend(struct device *dev)
>  static int fsl_sai_runtime_resume(struct device *dev)
>  {
>  	struct fsl_sai *sai = dev_get_drvdata(dev);
> +	unsigned int ofs = sai->soc_data->reg_offset;
>  	int ret;
>  
>  	ret = clk_prepare_enable(sai->bus_clk);
> @@ -1075,11 +1117,11 @@ static int fsl_sai_runtime_resume(struct device *dev)
>  	}
>  
>  	regcache_cache_only(sai->regmap, false);
> -	regmap_write(sai->regmap, FSL_SAI_TCSR, FSL_SAI_CSR_SR);
> -	regmap_write(sai->regmap, FSL_SAI_RCSR, FSL_SAI_CSR_SR);
> +	regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), FSL_SAI_CSR_SR);
> +	regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), FSL_SAI_CSR_SR);
>  	usleep_range(1000, 2000);
> -	regmap_write(sai->regmap, FSL_SAI_TCSR, 0);
> -	regmap_write(sai->regmap, FSL_SAI_RCSR, 0);
> +	regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), 0);
> +	regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), 0);
>  
>  	ret = regcache_sync(sai->regmap);
>  	if (ret)
> diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
> index abf140951187..d20f16cc2a80 100644
> --- a/sound/soc/fsl/fsl_sai.h
> +++ b/sound/soc/fsl/fsl_sai.h
> @@ -14,12 +14,12 @@
>  			 SNDRV_PCM_FMTBIT_S32_LE)
>  
>  /* SAI Register Map Register */
> -#define FSL_SAI_TCSR	0x00 /* SAI Transmit Control */
> -#define FSL_SAI_TCR1	0x04 /* SAI Transmit Configuration 1 */
> -#define FSL_SAI_TCR2	0x08 /* SAI Transmit Configuration 2 */
> -#define FSL_SAI_TCR3	0x0c /* SAI Transmit Configuration 3 */
> -#define FSL_SAI_TCR4	0x10 /* SAI Transmit Configuration 4 */
> -#define FSL_SAI_TCR5	0x14 /* SAI Transmit Configuration 5 */
> +#define FSL_SAI_TCSR(ofs)	(0x00 + ofs) /* SAI Transmit Control */
> +#define FSL_SAI_TCR1(ofs)	(0x04 + ofs) /* SAI Transmit Configuration 1 */
> +#define FSL_SAI_TCR2(ofs)	(0x08 + ofs) /* SAI Transmit Configuration 2 */
> +#define FSL_SAI_TCR3(ofs)	(0x0c + ofs) /* SAI Transmit Configuration 3 */
> +#define FSL_SAI_TCR4(ofs)	(0x10 + ofs) /* SAI Transmit Configuration 4 */
> +#define FSL_SAI_TCR5(ofs)	(0x14 + ofs) /* SAI Transmit Configuration 5 */
>  #define FSL_SAI_TDR0	0x20 /* SAI Transmit Data 0 */
>  #define FSL_SAI_TDR1	0x24 /* SAI Transmit Data 1 */
>  #define FSL_SAI_TDR2	0x28 /* SAI Transmit Data 2 */
> @@ -37,12 +37,12 @@
>  #define FSL_SAI_TFR6	0x58 /* SAI Transmit FIFO 6 */
>  #define FSL_SAI_TFR7	0x5C /* SAI Transmit FIFO 7 */
>  #define FSL_SAI_TMR	0x60 /* SAI Transmit Mask */
> -#define FSL_SAI_RCSR	0x80 /* SAI Receive Control */
> -#define FSL_SAI_RCR1	0x84 /* SAI Receive Configuration 1 */
> -#define FSL_SAI_RCR2	0x88 /* SAI Receive Configuration 2 */
> -#define FSL_SAI_RCR3	0x8c /* SAI Receive Configuration 3 */
> -#define FSL_SAI_RCR4	0x90 /* SAI Receive Configuration 4 */
> -#define FSL_SAI_RCR5	0x94 /* SAI Receive Configuration 5 */
> +#define FSL_SAI_RCSR(ofs)	(0x80 + ofs) /* SAI Receive Control */
> +#define FSL_SAI_RCR1(ofs)	(0x84 + ofs)/* SAI Receive Configuration 1 */
> +#define FSL_SAI_RCR2(ofs)	(0x88 + ofs) /* SAI Receive Configuration 2 */
> +#define FSL_SAI_RCR3(ofs)	(0x8c + ofs) /* SAI Receive Configuration 3 */
> +#define FSL_SAI_RCR4(ofs)	(0x90 + ofs) /* SAI Receive Configuration 4 */
> +#define FSL_SAI_RCR5(ofs)	(0x94 + ofs) /* SAI Receive Configuration 5 */
>  #define FSL_SAI_RDR0	0xa0 /* SAI Receive Data 0 */
>  #define FSL_SAI_RDR1	0xa4 /* SAI Receive Data 1 */
>  #define FSL_SAI_RDR2	0xa8 /* SAI Receive Data 2 */
> @@ -61,14 +61,14 @@
>  #define FSL_SAI_RFR7	0xdc /* SAI Receive FIFO 7 */
>  #define FSL_SAI_RMR	0xe0 /* SAI Receive Mask */
>  
> -#define FSL_SAI_xCSR(tx)	(tx ? FSL_SAI_TCSR : FSL_SAI_RCSR)
> -#define FSL_SAI_xCR1(tx)	(tx ? FSL_SAI_TCR1 : FSL_SAI_RCR1)
> -#define FSL_SAI_xCR2(tx)	(tx ? FSL_SAI_TCR2 : FSL_SAI_RCR2)
> -#define FSL_SAI_xCR3(tx)	(tx ? FSL_SAI_TCR3 : FSL_SAI_RCR3)
> -#define FSL_SAI_xCR4(tx)	(tx ? FSL_SAI_TCR4 : FSL_SAI_RCR4)
> -#define FSL_SAI_xCR5(tx)	(tx ? FSL_SAI_TCR5 : FSL_SAI_RCR5)
> -#define FSL_SAI_xDR(tx)		(tx ? FSL_SAI_TDR : FSL_SAI_RDR)
> -#define FSL_SAI_xFR(tx)		(tx ? FSL_SAI_TFR : FSL_SAI_RFR)
> +#define FSL_SAI_xCSR(tx, ofs)	(tx ? FSL_SAI_TCSR(ofs) : FSL_SAI_RCSR(ofs))
> +#define FSL_SAI_xCR1(tx, ofs)	(tx ? FSL_SAI_TCR1(ofs) : FSL_SAI_RCR1(ofs))
> +#define FSL_SAI_xCR2(tx, ofs)	(tx ? FSL_SAI_TCR2(ofs) : FSL_SAI_RCR2(ofs))
> +#define FSL_SAI_xCR3(tx, ofs)	(tx ? FSL_SAI_TCR3(ofs) : FSL_SAI_RCR3(ofs))
> +#define FSL_SAI_xCR4(tx, ofs)	(tx ? FSL_SAI_TCR4(ofs) : FSL_SAI_RCR4(ofs))
> +#define FSL_SAI_xCR5(tx, ofs)	(tx ? FSL_SAI_TCR5(ofs) : FSL_SAI_RCR5(ofs))
> +#define FSL_SAI_xDR(tx, ofs)	(tx ? FSL_SAI_TDR(ofs) : FSL_SAI_RDR(ofs))
> +#define FSL_SAI_xFR(tx, ofs)	(tx ? FSL_SAI_TFR(ofs) : FSL_SAI_RFR(ofs))
>  #define FSL_SAI_xMR(tx)		(tx ? FSL_SAI_TMR : FSL_SAI_RMR)
>  
>  /* SAI Transmit/Receive Control Register */
> @@ -166,6 +166,7 @@
>  struct fsl_sai_soc_data {
>  	bool use_imx_pcm;
>  	unsigned int fifo_depth;
> +	unsigned int reg_offset;
>  };
>  
>  struct fsl_sai {
> -- 
> 2.17.1
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
