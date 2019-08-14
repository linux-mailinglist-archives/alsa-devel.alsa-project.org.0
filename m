Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 389408C561
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 03:03:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A00D3169D;
	Wed, 14 Aug 2019 03:02:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A00D3169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565744587;
	bh=oMrr7vsrgAHxDIQZvaSvfLxNK4bwWBPq4CF0a6lwTVw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tA1xKmfO85wRGiN+no54bvM72GcD+YeUDlqwnUgu8ngTj9yOIBllbXVeH46mSl95m
	 6iFj72mxPi92jwZi4HUuTi52fQ3dIYxOOikfWtgfvVV63tvS932uIgmy4Pt2Q0oZ2/
	 cHpF5TJmWVb6lyvNnwvn0mJZWN0oulv7qlqZtj+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBB7CF8026A;
	Wed, 14 Aug 2019 03:01:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2B5BF80273; Wed, 14 Aug 2019 03:01:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF639F80120
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 03:01:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF639F80120
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="j0JrRL8h"
Received: by mail-pg1-x542.google.com with SMTP id n9so45944552pgc.1
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 18:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NlE3r34RdoAVkEFP5Qhq0Z6vIQcskLB+6Ufwy9SSFTI=;
 b=j0JrRL8hUVa8eSrWSd015kpUe5PnEgpSdofsQeNyBnm5Y5CvJ1+Y9TonRPe3X16nIP
 Ht9o5VyuaIJ70Tq0slcqVnNfawSj9nVbjaxyT34apHEniHberD68us9KLKInA3396QkH
 L1W2GX4/pv5gelAE125H78NI1KqoVWabWuO0p9uJwmZGcJBgUjfFcgURSIDNl4/SaWuc
 kfmWz4JluAP/yxgopVTC9QTewX5OJtQ1sZd7jiRxviyS6rLljc3djHMU66sUg8imQBxL
 fVwSYGotTNCgEJcqokBDwewTlY9WBArfirzWjFBqAUQr11Mq+1wvheIgEo7C6TnydriM
 9nWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NlE3r34RdoAVkEFP5Qhq0Z6vIQcskLB+6Ufwy9SSFTI=;
 b=FNEc5fQalhKyYJewz8Zhd1VJLpwNnJjGRW3XUAxP2Wi2MOQ2OymgOqxCXkDF0TOeBs
 yQwE6mqYK/DuP8AqUQNR6K8R1neaEfEK4QQreMjbKLFQ1F1Jv4fwkAt3wCHM7E6a2NfL
 hTeEUFVMOac9/xMmf1CjwzByM4gFMdkx/hCMSVHciFVCiRtfrAnaqmapGNtl6TdbPmvO
 28IP71yBWkyOkEY99qXrVlixBz1IGgy3nVY/igcmAx66JnOsfKVk1mmXqoEVQSZnO+i9
 DL7ojokw7Py0BMCF1xXrxwvDOzhqoxBEQmt4Z0p4wmD8bEQwOM1vi7XTrodg3yPQvENC
 7lnA==
X-Gm-Message-State: APjAAAXGfvIoJWvO3vH0WYK2LFQ72bxTreAHtLEzX2IjYAwUGJNITqoa
 pmAZQM3k43j5Vsc1VapXyNg=
X-Google-Smtp-Source: APXvYqzwfcjX+A+jDK0pw8ha0TvDPFYa5JXWs5wev6iBxZ44rRGrF2DtI/VKTBQtAxYn6lFDxzxsIg==
X-Received: by 2002:a63:a35e:: with SMTP id v30mr35393993pgn.129.1565744476044; 
 Tue, 13 Aug 2019 18:01:16 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id h9sm120983074pgk.10.2019.08.13.18.01.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 13 Aug 2019 18:01:15 -0700 (PDT)
Date: Tue, 13 Aug 2019 18:02:15 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <20190814010215.GA13398@Asurada-Nvidia.nvidia.com>
References: <20190811194517.19314-1-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190811194517.19314-1-daniel.baluta@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 broonie@kernel.org, linux-imx@nxp.com, Viorel Suman <viorel.suman@nxp.com>,
 festevam@gmail.com
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_sai: Handle slave mode per TX/RX
	direction
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

On Sun, Aug 11, 2019 at 10:45:17PM +0300, Daniel Baluta wrote:
> From: Viorel Suman <viorel.suman@nxp.com>
> 
> The SAI interface can be a clock supplier or consumer
> as a function of stream direction. e.g SAI can be master
> for Tx and slave for Rx.
> 
> Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  sound/soc/fsl/fsl_sai.c | 18 +++++++++---------
>  sound/soc/fsl/fsl_sai.h |  2 +-
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 4a346fcb5630..69cf3678c859 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -273,18 +273,18 @@ static int fsl_sai_set_dai_fmt_tr(struct snd_soc_dai *cpu_dai,

This function is called for both TX and RX at the same time from
fsl_sai_set_dai_fmt() so I don't actually see how it can operate
in two opposite directions from this change alone. Anything that
I have missed?

Thanks
Nicolin

>  	case SND_SOC_DAIFMT_CBS_CFS:
>  		val_cr2 |= FSL_SAI_CR2_BCD_MSTR;
>  		val_cr4 |= FSL_SAI_CR4_FSD_MSTR;
> -		sai->is_slave_mode = false;
> +		sai->is_slave_mode[tx] = false;
>  		break;
>  	case SND_SOC_DAIFMT_CBM_CFM:
> -		sai->is_slave_mode = true;
> +		sai->is_slave_mode[tx] = true;
>  		break;
>  	case SND_SOC_DAIFMT_CBS_CFM:
>  		val_cr2 |= FSL_SAI_CR2_BCD_MSTR;
> -		sai->is_slave_mode = false;
> +		sai->is_slave_mode[tx] = false;
>  		break;
>  	case SND_SOC_DAIFMT_CBM_CFS:
>  		val_cr4 |= FSL_SAI_CR4_FSD_MSTR;
> -		sai->is_slave_mode = true;
> +		sai->is_slave_mode[tx] = true;
>  		break;
>  	default:
>  		return -EINVAL;
> @@ -326,7 +326,7 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
>  	int ret = 0;
>  
>  	/* Don't apply to slave mode */
> -	if (sai->is_slave_mode)
> +	if (sai->is_slave_mode[tx])
>  		return 0;
>  
>  	for (id = 0; id < FSL_SAI_MCLK_MAX; id++) {
> @@ -422,7 +422,7 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
>  	if (sai->slot_width)
>  		slot_width = sai->slot_width;
>  
> -	if (!sai->is_slave_mode) {
> +	if (!sai->is_slave_mode[tx]) {
>  		ret = fsl_sai_set_bclk(cpu_dai, tx,
>  				slots * slot_width * params_rate(params));
>  		if (ret)
> @@ -458,7 +458,7 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
>  	 * error.
>  	 */
>  
> -	if (!sai->is_slave_mode) {
> +	if (!sai->is_slave_mode[tx]) {
>  		if (!sai->synchronous[TX] && sai->synchronous[RX] && !tx) {
>  			regmap_update_bits(sai->regmap, FSL_SAI_TCR4(ofs),
>  				FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK,
> @@ -497,7 +497,7 @@ static int fsl_sai_hw_free(struct snd_pcm_substream *substream,
>  	struct fsl_sai *sai = snd_soc_dai_get_drvdata(cpu_dai);
>  	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
>  
> -	if (!sai->is_slave_mode &&
> +	if (!sai->is_slave_mode[tx] &&
>  			sai->mclk_streams & BIT(substream->stream)) {
>  		clk_disable_unprepare(sai->mclk_clk[sai->mclk_id[tx]]);
>  		sai->mclk_streams &= ~BIT(substream->stream);
> @@ -581,7 +581,7 @@ static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
>  			 * This is a hardware bug, and will be fix in the
>  			 * next sai version.
>  			 */
> -			if (!sai->is_slave_mode) {
> +			if (!sai->is_slave_mode[tx]) {
>  				/* Software Reset for both Tx and Rx */
>  				regmap_write(sai->regmap, FSL_SAI_TCSR(ofs),
>  					     FSL_SAI_CSR_SR);
> diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
> index b89b0ca26053..c2c43a7d9ba1 100644
> --- a/sound/soc/fsl/fsl_sai.h
> +++ b/sound/soc/fsl/fsl_sai.h
> @@ -167,7 +167,7 @@ struct fsl_sai {
>  	struct clk *bus_clk;
>  	struct clk *mclk_clk[FSL_SAI_MCLK_MAX];
>  
> -	bool is_slave_mode;
> +	bool is_slave_mode[2];
>  	bool is_lsb_first;
>  	bool is_dsp_mode;
>  	bool synchronous[2];
> -- 
> 2.17.1
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
