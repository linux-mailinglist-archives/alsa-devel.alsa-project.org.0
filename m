Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61054235118
	for <lists+alsa-devel@lfdr.de>; Sat,  1 Aug 2020 10:02:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5EE916C5;
	Sat,  1 Aug 2020 10:01:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5EE916C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596268920;
	bh=/RlDfoHJX58jrsjZQqshVMFvDTDx4LKAovKLkg4lvr8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jVtfZsleFFsX0o4o9KTGu9vDgcvT+sMb7PwURXb4H81NUvm4L7e90cx6KGgQKFzeK
	 KsocHUsi6fQBOZ668P/C+yJ8eIwfblKA1y1KS3wOdlJi2pT1reEmtWFMbGKmBA0WOm
	 yL8h5ggLIheMwAn65oSCZUA1iORzVXdnX+ru+i6s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37723F8010C;
	Sat,  1 Aug 2020 10:00:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27258F80227; Sat,  1 Aug 2020 10:00:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25FFCF8010C
 for <alsa-devel@alsa-project.org>; Sat,  1 Aug 2020 10:00:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25FFCF8010C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CEJxdjnQ"
Received: by mail-pj1-x1041.google.com with SMTP id lx9so8871132pjb.2
 for <alsa-devel@alsa-project.org>; Sat, 01 Aug 2020 01:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=i64OqGOKUX2vRbPCdcwPu4hJ7VHYiYruzv3gOuWclhA=;
 b=CEJxdjnQCINWOcopnZ4Wu5K7tT+eBGOPqTLjCGe07JxfaHDZnQ4FDVxWeQr/je90Mf
 KYxMbtfrx6Pk8e7SeDv57mGg6JGW/Zv0G1af6LAmKB3EkEYNCfu76G86T9uIQPJ7eFgK
 0lk4PK/El+KSfNGOYoSpeflHAns3aqDX8cfwxnfv1H9pnwQnjCG0K+KVrbGmf3mFhn+2
 p6s69ml2dp/5goOx1TBru+VHAwmiAJUHKaw1d3ZP61ofCwm2XiO4mDrY08EUWMU81Fgd
 avj3VZOBOgTE2APc8mLX3jz+3T/oDph4xsU0bBFu20PGvvxrjp4cb43ZlhSapub8Kd7t
 oBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=i64OqGOKUX2vRbPCdcwPu4hJ7VHYiYruzv3gOuWclhA=;
 b=g5PyQf+617h6SN4Rpkk/I/ZFU02aBn547bARMZ7F6AXXVI+b0gGUuXIul5X/THso+w
 3vFdsxu74xbyucZ0lXVooetmdd3PPICw5VqufgcJTgGJCieclr1I9t+jj3WRiynk36gN
 wIC8EihvHeDXR/hBZjVjo4bikUr3Yncc7pf24TbLQ7tTczI3CJobePJMoTH/ZiNSR0JD
 K7fkPkUlQbyw8rvuGDsjPAcuuKLjEPiOf35P+XWtMhgXbb/RwNsw4hRl56CiEYmvi5/p
 15/lMs7AWD5YYWnm2essZwDoKl8oSepz8rQ+2HlnnxId8adb4dFcjxPjrwoQrXCmLfqO
 mDcQ==
X-Gm-Message-State: AOAM531YuJEIGSp6ImkhPUBxIerrps1nw1z4K/ojb052AJ1ys+lc/5jT
 /unQXnOfkl9uncOttH1eUZc=
X-Google-Smtp-Source: ABdhPJyX87jF7+C/BEL9ElATQshMUqsrjaIT8uJiXDwTgR1Lg3kd7vr7cKVtr/cp+/DBXHYU2vE0KA==
X-Received: by 2002:a17:902:7688:: with SMTP id
 m8mr6794990pll.12.1596268803816; 
 Sat, 01 Aug 2020 01:00:03 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id f6sm13342385pfa.23.2020.08.01.01.00.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 01 Aug 2020 01:00:03 -0700 (PDT)
Date: Sat, 1 Aug 2020 00:59:54 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] ASoC: fsl-asoc-card: Remove
 fsl_asoc_card_set_bias_level function
Message-ID: <20200801075954.GA19629@Asurada-Nvidia>
References: <1596102422-14010-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596102422-14010-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
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

Hi,

Having two nits and one question, inline:

On Thu, Jul 30, 2020 at 05:47:02PM +0800, Shengjiu Wang wrote:
> @@ -182,6 +180,69 @@ static int fsl_asoc_card_hw_params(struct snd_pcm_substream *substream,
>  					       cpu_priv->slot_width);
>  		if (ret && ret != -ENOTSUPP) {
>  			dev_err(dev, "failed to set TDM slot for cpu dai\n");
> +			goto out;
> +		}
> +	}
> +
> +	/* Specific configuration for PLL */
> +	if (codec_priv->pll_id && codec_priv->fll_id) {
> +		if (priv->sample_format == SNDRV_PCM_FORMAT_S24_LE)
> +			pll_out = priv->sample_rate * 384;
> +		else
> +			pll_out = priv->sample_rate * 256;
> +
> +		ret = snd_soc_dai_set_pll(asoc_rtd_to_codec(rtd, 0),
> +					  codec_priv->pll_id,
> +					  codec_priv->mclk_id,
> +					  codec_priv->mclk_freq, pll_out);
> +		if (ret) {
> +			dev_err(dev, "failed to start FLL: %d\n", ret);
> +			goto out;
> +		}
> +
> +		ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(rtd, 0),
> +					     codec_priv->fll_id,
> +					     pll_out, SND_SOC_CLOCK_IN);

Just came into my mind: do we need some protection here to prevent
PLL/SYSCLK reconfiguration if TX/RX end up with different values?

> +	return 0;
> +
> +out:
> +	priv->streams &= ~BIT(substream->stream);
> +	return ret;

Rather than "out:" which doesn't explicitly indicate an error-out,
"fail:" would be better, following what we used in probe().

> +static int fsl_asoc_card_hw_free(struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct fsl_asoc_card_priv *priv = snd_soc_card_get_drvdata(rtd->card);
> +	struct codec_priv *codec_priv = &priv->codec_priv;
> +	struct device *dev = rtd->card->dev;
> +	int ret;
> +
> +	priv->streams &= ~BIT(substream->stream);
> +

> +	if (!priv->streams && codec_priv->pll_id &&
> +	    codec_priv->fll_id) {

This now can fit into single line :)
