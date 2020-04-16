Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E93D81ACE82
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Apr 2020 19:18:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 648C61662;
	Thu, 16 Apr 2020 19:17:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 648C61662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587057504;
	bh=s4Z7H5RfTmkpy5uEBBhU8C39pnbL3WOD7eDX1iiAziQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I9c5qYrg5Vq+nk/oi23uwdxCsqQHpqsJALhixm5R/GD9cej1P41eTfgULkeP/kNxN
	 6wauZPISZnM4ygki+ySTcC/fEtS4FujrpUiwq++WzopjyTxdauahi3ge6k7lkKZcxK
	 6h6aXuywFP7LDkr9pp9trfkgswxHH0vplLkrVAx8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5288FF8016F;
	Thu, 16 Apr 2020 19:16:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB857F8014E; Thu, 16 Apr 2020 19:16:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5300::4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C3EDF8012E
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 19:16:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C3EDF8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="DnXLVc5H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587057394;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=gQAshWE/P5d+q8GSxfuiqFoIRojHnDC1rboPu/Wp8h8=;
 b=DnXLVc5Hs4XvCiB+GXqi1QYL0bnBA1Uk+BYz3b7cA55VqTiQ/eYXurHp62AL7fV0AV
 oUM+xrzUUfxgrtYTDfjRMLK4/0SQ6l0WWRZ1cQOGOsvObx2sbfpq+gS/i5tmht/nXYyv
 B3r670H++dqCWT67gmHDcFXkTe+Zok/FukZyG5NqW3aExRhSwM3/5CLloIHWV0PCZTM/
 w6kfeUFnmGRzfHXagEMFv3GzEa5p+TJiGcP3XOxpw8U8ZywhyHI52BFLUU1fiY37QK73
 qZggMM2Z6NioNClban52cEj90z4VZpccGj6wO9Yp0DTo1MdLiiiqWPJeaTUE3EURom3p
 RktQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j6IczFaoo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 46.4.0 DYNA|AUTH)
 with ESMTPSA id k074e0w3GHGVBm9
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 16 Apr 2020 19:16:31 +0200 (CEST)
Date: Thu, 16 Apr 2020 19:16:24 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: qcom: lpass-cpu: support full duplex operation
Message-ID: <20200416171624.GA174353@gerhold.net>
References: <20200306130147.27452-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200306130147.27452-1-srinivas.kandagatla@linaro.org>
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
 Takahide Higuchi <takahidehiguchi@gmail.com>, linux-kernel@vger.kernel.org
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

On Fri, Mar 06, 2020 at 01:01:47PM +0000, Srinivas Kandagatla wrote:
> From: Takahide Higuchi <takahidehiguchi@gmail.com>
> 
> This patch fixes a bug where playback on bidirectional I2S interface stops
> when we start recording on the same interface.
> 
> We use regmap_update_bits instead of regmap_write so that we will not clear
> SPKEN and SPKMODE bits when we start/stop recording.
> 

Thanks for the patch! I don't have suitable hardware to test this
feature, but I checked if playback-only is still working correctly:

With this patch I can only play audio once. Further playback
never starts, it gets stuck immediately. Suggested fix below.
(Also a minor code style suggestion...)

> Signed-off-by: Takahide Higuchi <takahidehiguchi@gmail.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/qcom/lpass-apq8016.c   |  2 ++
>  sound/soc/qcom/lpass-cpu.c       | 24 ++++++++++++++++++------
>  sound/soc/qcom/lpass-lpaif-reg.h |  2 +-
>  3 files changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
> index 6575da549237..85079c697faa 100644
> --- a/sound/soc/qcom/lpass-apq8016.c
> +++ b/sound/soc/qcom/lpass-apq8016.c
> @@ -121,6 +121,8 @@ static struct snd_soc_dai_driver apq8016_lpass_cpu_dai_driver[] = {
>  		},
>  		.probe	= &asoc_qcom_lpass_cpu_dai_probe,
>  		.ops    = &asoc_qcom_lpass_cpu_dai_ops,
> +		.symmetric_samplebits   = 1,
> +		.symmetric_rates        = 1,
>  	},
>  };
>  
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index dbce7e92baf3..dc8acb380b6f 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -72,6 +72,7 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
>  	snd_pcm_format_t format = params_format(params);
>  	unsigned int channels = params_channels(params);
>  	unsigned int rate = params_rate(params);
> +	unsigned int mask;
>  	unsigned int regval;
>  	int bitwidth, ret;
>  
> @@ -81,6 +82,9 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
>  		return bitwidth;
>  	}
>  
> +	mask   = LPAIF_I2SCTL_LOOPBACK_MASK |
> +			LPAIF_I2SCTL_WSSRC_MASK |
> +			LPAIF_I2SCTL_BITWIDTH_MASK;
>  	regval = LPAIF_I2SCTL_LOOPBACK_DISABLE |
>  			LPAIF_I2SCTL_WSSRC_INTERNAL;
>  

I understand the space after "mask" here (to align the =) ...

> @@ -100,6 +104,7 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
>  	}
>  
>  	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		mask   |= LPAIF_I2SCTL_SPKMODE_MASK | LPAIF_I2SCTL_SPKMONO_MASK;
>  		switch (channels) {
>  		case 1:
>  			regval |= LPAIF_I2SCTL_SPKMODE_SD0;
> @@ -127,6 +132,7 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
>  			return -EINVAL;
>  		}
>  	} else {
> +		mask   |= LPAIF_I2SCTL_MICMODE_MASK | LPAIF_I2SCTL_MICMONO_MASK;
>  		switch (channels) {
>  		case 1:
>  			regval |= LPAIF_I2SCTL_MICMODE_SD0;

... but they don't make much sense to me in these two cases.
It looks a bit weird in my opinion :)

> @@ -155,9 +161,9 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
>  		}
>  	}
>  
> -	ret = regmap_write(drvdata->lpaif_map,
> -			   LPAIF_I2SCTL_REG(drvdata->variant, dai->driver->id),
> -			   regval);
> +	ret = regmap_update_bits(drvdata->lpaif_map,
> +			 LPAIF_I2SCTL_REG(drvdata->variant, dai->driver->id),
> +			 mask, regval);
>  	if (ret) {
>  		dev_err(dai->dev, "error writing to i2sctl reg: %d\n", ret);
>  		return ret;
> @@ -178,11 +184,17 @@ static int lpass_cpu_daiops_hw_free(struct snd_pcm_substream *substream,
>  		struct snd_soc_dai *dai)
>  {
>  	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +	unsigned int mask;
>  	int ret;
>  
> -	ret = regmap_write(drvdata->lpaif_map,
> -			   LPAIF_I2SCTL_REG(drvdata->variant, dai->driver->id),
> -			   0);
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +		mask   = LPAIF_I2SCTL_SPKMODE_MASK;
> +	else
> +		mask   = LPAIF_I2SCTL_MICMODE_MASK;

Same here with the spaces after "mask", but more importantly:

This changes the behavior slightly. Previously we reset the entire
register, now only the SPKMODE/MICMODE. This means that SPKEN/MICEN
does not get reset to 0 when this function is called.

Everything seems to work fine again for me if I reset SPKEN/MICEN too:

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index dc8acb380b6f..49a36c1f5640 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -188,9 +188,9 @@ static int lpass_cpu_daiops_hw_free(struct snd_pcm_substream *substream,
 	int ret;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		mask   = LPAIF_I2SCTL_SPKMODE_MASK;
+		mask   = LPAIF_I2SCTL_SPKEN_MASK | LPAIF_I2SCTL_SPKMODE_MASK;
 	else
-		mask   = LPAIF_I2SCTL_MICMODE_MASK;
+		mask   = LPAIF_I2SCTL_MICEN_MASK | LPAIF_I2SCTL_MICMODE_MASK;
 
 	ret = regmap_update_bits(drvdata->lpaif_map,
 			 LPAIF_I2SCTL_REG(drvdata->variant, dai->driver->id),

After looking at the code a bit more I wonder why SPKEN/MICEN is set in
prepare() at all? It is already set/un-set in trigger() on
SNDRV_PCM_TRIGGER_START and SNDRV_PCM_TRIGGER_STOP.

In fact, my problem only happens because prepare() is called again
after the stream was stopped (and therefore sets SPKEN again):

[   32.809915] lpass_cpu_daiops_hw_params
[   32.810598] lpass_cpu_daiops_prepare
[   32.823092] lpass_cpu_daiops_prepare
[   32.837901] lpass_cpu_daiops_trigger: SNDRV_PCM_TRIGGER_START
[   37.565261] lpass_cpu_daiops_trigger: SNDRV_PCM_TRIGGER_STOP
[   37.565402] lpass_cpu_daiops_prepare
[   37.565854] lpass_cpu_daiops_hw_free

In other words, a much better fix in my opinion would be to
simply remove(!) the entire lpass_cpu_daiops_prepare() method.

I tested it and that also fixes the problem, without my diff above to
unset SPKEN/MICEN in lpass_cpu_daiops_hw_free().

Thanks,
Stephan

> +
> +	ret = regmap_update_bits(drvdata->lpaif_map,
> +			 LPAIF_I2SCTL_REG(drvdata->variant, dai->driver->id),
> +			 mask, 0);
>  	if (ret)
>  		dev_err(dai->dev, "error writing to i2sctl reg: %d\n", ret);
>  
> diff --git a/sound/soc/qcom/lpass-lpaif-reg.h b/sound/soc/qcom/lpass-lpaif-reg.h
> index 3d74ae123e9d..7a2b9cf99976 100644
> --- a/sound/soc/qcom/lpass-lpaif-reg.h
> +++ b/sound/soc/qcom/lpass-lpaif-reg.h
> @@ -56,7 +56,7 @@
>  #define LPAIF_I2SCTL_MICMODE_6CH	(7 << LPAIF_I2SCTL_MICMODE_SHIFT)
>  #define LPAIF_I2SCTL_MICMODE_8CH	(8 << LPAIF_I2SCTL_MICMODE_SHIFT)
>  
> -#define LPAIF_I2SCTL_MIMONO_MASK	GENMASK(3, 3)
> +#define LPAIF_I2SCTL_MICMONO_MASK	GENMASK(3, 3)
>  #define LPAIF_I2SCTL_MICMONO_SHIFT	3
>  #define LPAIF_I2SCTL_MICMONO_STEREO	(0 << LPAIF_I2SCTL_MICMONO_SHIFT)
>  #define LPAIF_I2SCTL_MICMONO_MONO	(1 << LPAIF_I2SCTL_MICMONO_SHIFT)
> -- 
> 2.21.0
> 
