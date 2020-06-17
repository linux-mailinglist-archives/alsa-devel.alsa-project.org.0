Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E151FC2F9
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 02:50:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06D0A1676;
	Wed, 17 Jun 2020 02:50:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06D0A1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592355057;
	bh=wDGXVQ0gNEIqeRz91ljCnNfJl6xwkE8iQ3fyFMXQp/Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qZogKrHpymQW6Ba0Kz7edJKt7FaEg3yGSnu50eIttZ7gV7AqvREg5Ia2XozAzqyD7
	 jkAVclQXrNTDDHbcpMz3dE4ByYNJx/s+NzRCOIGsdcdDLWBC+i78jtWlzut+aetDlQ
	 F1/MtxgQa5x7KDPdAJeKxEX9faZFbBpZOeLVCkas=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D146F80114;
	Wed, 17 Jun 2020 02:49:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF37DF8022B; Wed, 17 Jun 2020 02:49:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97F3EF80114
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 02:49:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97F3EF80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="andbOErg"
Received: by mail-pg1-x543.google.com with SMTP id r18so398354pgk.11
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 17:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Qm0blJqnv9I61KRJJiBPA33J2Aw0IBsqKNB8aVPh6EU=;
 b=andbOErg6vHaVvZwsZ5AQQOmi8cnqX78ltCWGPVM0y3E4tFLZGGOK6qjkD7yGu0Hxn
 OohchWNrpk77aQXwkddEUJKsh/OkVMqWgcGUL0dVmqsKNzutldsaMZkAPZtcnJdLF25M
 b6JDWGZcCyvi2lCTvhIz9wnNdetyiOWupqtdp2uMI6KXIr0kVueuVJ3zc55kYZw/50Nr
 SfMjqQ+xj3MEVowUilpsfvy3rDZeVwhvHroSWywepJ+MG9kRywebgbm03v6eo+ij+LhA
 jSBP+uXU+K5y1+7NmJBqLV2YesfQF6fdnMmZ4oVAuoIjs/iHgi5h9P30gsTPtML8Kx6b
 8byw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Qm0blJqnv9I61KRJJiBPA33J2Aw0IBsqKNB8aVPh6EU=;
 b=nCarj7waSneaLDw/H2wwApLVpGuOx6SFtU6JGb/ng6hVNA5EXZ72ZUscLh3AOdCHAd
 zDrE5/KVMilBrQInKnPb4wqa1mWIsXJRJs+UyAhz1+VSuEG4pO0BnJTg2FcADJGe/zVh
 ou4Y7a5a/siH5NuT2bN84ZjuKiELAbbCNr049icbxU4xdKBkqmwugktyMs83Ak45lMcr
 a1mAe82uqkwGOWb+dM6ulhTjmAdou2LMg+WdrDLpIR8tLTOik8RQkooWsRymILeAdZm6
 /NAcxNurpcXltnHpvI/iH1bSwVjF+XQKAwMCXpKnEJD9LVSnrn7AB+ZvTHvRwSWHh5+R
 FuvA==
X-Gm-Message-State: AOAM532WkjEqVZ3NZ8Wvr6Y3MOBglZS0ccMN7zr9HmwVp74FmQ+WR6f7
 o+1fLIAddCrsXSQDvABTQwc=
X-Google-Smtp-Source: ABdhPJz65jhSqLsQAU9g8oW3jm/d4pDNC49/CvWZhBX+8bG7IjvN5c7fILW3zJY3g7Bev/JmV1mBMQ==
X-Received: by 2002:a63:5b04:: with SMTP id p4mr4356358pgb.315.1592354943128; 
 Tue, 16 Jun 2020 17:49:03 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id i196sm1591208pgc.55.2020.06.16.17.49.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Jun 2020 17:49:02 -0700 (PDT)
Date: Tue, 16 Jun 2020 17:48:47 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 2/2] ASoC: fsl-asoc-card: Add MQS support
Message-ID: <20200617004845.GB19896@Asurada-Nvidia>
References: <1592292637-25734-1-git-send-email-shengjiu.wang@nxp.com>
 <1592292637-25734-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592292637-25734-2-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org,
 Xiubo.Lee@gmail.com, lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org,
 tiwai@suse.com, robh+dt@kernel.org, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
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

On Tue, Jun 16, 2020 at 03:30:37PM +0800, Shengjiu Wang wrote:
> The MQS codec isn't an i2c device, so add a new platform device for it.
> 
> MQS only support playback, so add a new audio map.
> 
> Add there maybe "model" property or no "audio-routing" property insertions

"Add" => "And"

> devicetree, so add some enhancement for these two property.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl-asoc-card.c | 70 ++++++++++++++++++++++++++---------
>  1 file changed, 52 insertions(+), 18 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
> index 00be73900888..2ac8cb9ddd10 100644
> --- a/sound/soc/fsl/fsl-asoc-card.c
> +++ b/sound/soc/fsl/fsl-asoc-card.c

> @@ -482,6 +489,7 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
>  {
>  	struct device_node *cpu_np, *codec_np, *asrc_np;
>  	struct device_node *np = pdev->dev.of_node;
> +	struct platform_device *codec_pdev = NULL; /* used for non i2c device*/

Having both codec_pdev and codec_dev duplicates things. Actually
only a couple of places really need "codec_dev" -- most of them
need codec_dev->dev pointer instead. So we could have a cleanup:

-	struct i2c_client *codec_dev;
+	struct device *codec_dev = NULL;

> @@ -512,10 +520,13 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
>  	}
>  
>  	codec_np = of_parse_phandle(np, "audio-codec", 0);
> -	if (codec_np)
> +	if (codec_np) {
>  		codec_dev = of_find_i2c_device_by_node(codec_np);
> -	else
> +		if (!codec_dev)
> +			codec_pdev = of_find_device_by_node(codec_np);
> +	} else {
>  		codec_dev = NULL;
> +	}

Here can have something like (feel free to simplify):

	if (codec_np) {
		struct platform_device *codec_pdev;
		struct i2c_client *codec_i2c;

		codec_i2c = of_find_i2c_device_by_node(codec_np);
		if (codec_i2c)
			codec_dev = &codec_i2c->dev;

		if (!codec_dev) {
			codec_pdev = of_find_device_by_node(codec_np);
			codec_dev = &codec_pdev->dev;
		}
	}
>  	asrc_np = of_parse_phandle(np, "audio-asrc", 0);
>  	if (asrc_np)
> @@ -525,6 +536,13 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
>  	if (codec_dev) {
>  		struct clk *codec_clk = clk_get(&codec_dev->dev, NULL);

Then here:

-  		struct clk *codec_clk = clk_get(&codec_dev->dev, NULL);
+  		struct clk *codec_clk = clk_get(codec_dev, NULL);

> @@ -538,6 +556,11 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
>  	/* Assign a default DAI format, and allow each card to overwrite it */
>  	priv->dai_fmt = DAI_FMT_BASE;
>  
> +	memcpy(priv->dai_link, fsl_asoc_card_dai,
> +	       sizeof(struct snd_soc_dai_link) * ARRAY_SIZE(priv->dai_link));

> @@ -573,13 +596,25 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
>  		codec_dai_name = "ac97-hifi";
>  		priv->card.set_bias_level = NULL;
>  		priv->dai_fmt = SND_SOC_DAIFMT_AC97;
> +		priv->card.dapm_routes = audio_map_ac97;
> +		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_ac97);
> +	} else if (of_device_is_compatible(np, "fsl,imx-audio-mqs")) {
> +		codec_dai_name = "fsl-mqs-dai";
> +		priv->card.set_bias_level = NULL;
> +		priv->dai_fmt = SND_SOC_DAIFMT_LEFT_J |
> +				SND_SOC_DAIFMT_CBS_CFS |
> +				SND_SOC_DAIFMT_NB_NF;
> +		priv->dai_link[1].dpcm_playback = 1;
> +		priv->dai_link[2].dpcm_playback = 1;

dpcm_playback = 1? That's the default value in fsl_asoc_card_dai.

> @@ -601,19 +636,18 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
>  		priv->cpu_priv.sysclk_id[0] = FSL_SAI_CLK_MAST1;
>  	}
>  
> -	snprintf(priv->name, sizeof(priv->name), "%s-audio",
> -		 fsl_asoc_card_is_ac97(priv) ? "ac97" :
> -		 codec_dev->name);
> -
>  	/* Initialize sound card */
>  	priv->pdev = pdev;
>  	priv->card.dev = &pdev->dev;
> -	priv->card.name = priv->name;
> +	ret = snd_soc_of_parse_card_name(&priv->card, "model");
> +	if (ret) {
> +		snprintf(priv->name, sizeof(priv->name), "%s-audio",
> +			 fsl_asoc_card_is_ac97(priv) ? "ac97" :
> +			 (codec_dev ? codec_dev->name : codec_pdev->name));

We can just use dev_name() if codec_dev is struct device *
Or having a codec_dev_name to cache codec_pdev/i2c->name.

> -	ret = snd_soc_of_parse_audio_routing(&priv->card, "audio-routing");
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to parse audio-routing: %d\n", ret);
> -		goto asrc_fail;
> +	if (of_property_read_bool(np, "audio-routing")) {
> +		ret = snd_soc_of_parse_audio_routing(&priv->card, "audio-routing");
> +		if (ret) {
> +			dev_err(&pdev->dev, "failed to parse audio-routing: %d\n", ret);
> +			goto asrc_fail;

Hmm...audio-routing is a required property in DT binding doc.
So you might need to update that too.
