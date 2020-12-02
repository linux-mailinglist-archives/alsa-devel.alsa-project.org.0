Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 996F12CC7A7
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Dec 2020 21:24:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2595D17E3;
	Wed,  2 Dec 2020 21:23:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2595D17E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606940681;
	bh=e2T/5zQoOXh+T5AivzFmIlytKA33nynG6HLbLHgmc/s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L/YlFq5jPXth/zFwkEUdYDhKqDnsHXEqNq88d2l2ZAEUFGlluMKAU3HJFr2oEZrSt
	 oRVOzS/QKonDXnh45CPFJ7+4/cWQcrbXtuL/4heD8Asr6fOJIu2EIAzAamoI22h/s/
	 XzWY4lLs8lrjzYks1L8+SMDMx0Ga2P//nSkIuXNE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4689EF8049C;
	Wed,  2 Dec 2020 21:23:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CD5EF8026B; Wed,  2 Dec 2020 21:23:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E2F1F80158
 for <alsa-devel@alsa-project.org>; Wed,  2 Dec 2020 21:22:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E2F1F80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="c17HjQZo"
Received: by mail-pj1-x1043.google.com with SMTP id e5so1677348pjt.0
 for <alsa-devel@alsa-project.org>; Wed, 02 Dec 2020 12:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jPXLgrfmPsVossgPwOVXqHGCtH2YsRf8UcPWK89e/XE=;
 b=c17HjQZoRSkabFcQ4upzoWsYEn2nhGmFpVMHiOWRalYsFPACNwPPlFHfRqr55n1ifW
 UIbf93b6R4dwdO/1sf1rOV1GFKBOduB4JyTWTYqkpkMr2k22teMqdR4+8cI+A1Xf+D2d
 yejUZ1H8KRnenqf603ZtkoJrhm+SiFOvH80nPnS+ngZUT0kThG9j9+fH1Qnsr6MlptDf
 0dZch+3qT+ebRiq3Qkg6r2MonVxgBYEXmxkarId8LsLmhv/3nzTeapzeuZs8ChORAnMZ
 WwgpkmAUzoNwyLhfvQ/lGRDDKg2sQNFFVAc7apcQrLmjRb2wyHRF7uhh1+K6blqtJYAL
 8Vuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jPXLgrfmPsVossgPwOVXqHGCtH2YsRf8UcPWK89e/XE=;
 b=ETseCZQB8KGTScDHddyy60KmwC/HfTokj+m40J54OxpbTumFa7f8B6rGZ2BbHlg1iU
 NeMJ2JsjtnUnDnpcNxOV4RD6VOBMdgAhr5ad6tH5WBBK7QjOTl0zHF5jh7gsh23I5KZN
 r4XR4pXG8Tp3y+SkYhQ0oZFibKL0k4rNgFxt+EHTly55/k6DK4tzSa2XA+trf4j5TSML
 BuyPAkZlvZsQh7b8+RePgAGWoOvTXeTlgDH+HsTEmO8wQjxWPv6HdJe1nNF/Mo7QXQy9
 cZ1PbuEcB+4Ldom6dNdef2/VUHiQe95Z0P/x/L0ehYec/LsJ+Ka7Nz+3XFyHX6sCC0YQ
 HzAw==
X-Gm-Message-State: AOAM531va9nO3vWfLvCUjV8EwkNcy4Z0/Xk+QeMY7DLNtVQRcEC0R2xq
 ZEIcYz7OwtPfgIPJ2UPPpQk=
X-Google-Smtp-Source: ABdhPJxyoo5uUzNVQaIgO+msO41uuAmT3ThpDEhUjZBbVx2SqAjC19UkpnvYRwGuaCRaSQqQYxOxaQ==
X-Received: by 2002:a17:902:7c8d:b029:da:625c:8218 with SMTP id
 y13-20020a1709027c8db02900da625c8218mr4161472pll.26.1606940568169; 
 Wed, 02 Dec 2020 12:22:48 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id 143sm593457pfc.119.2020.12.02.12.22.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 02 Dec 2020 12:22:47 -0800 (PST)
Date: Wed, 2 Dec 2020 12:19:56 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 2/2] ASoC: fsl: Add imx-hdmi machine driver
Message-ID: <20201202201955.GB1498@Asurada-Nvidia>
References: <1606455021-18882-1-git-send-email-shengjiu.wang@nxp.com>
 <1606455021-18882-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606455021-18882-2-git-send-email-shengjiu.wang@nxp.com>
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

On Fri, Nov 27, 2020 at 01:30:21PM +0800, Shengjiu Wang wrote:
> The driver is initially designed for sound card using HDMI
> interface on i.MX platform. There is internal HDMI IP or
> external HDMI modules connect with SAI or AUD2HTX interface.
> It supports both transmitter and receiver devices.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/Kconfig    |  12 ++
>  sound/soc/fsl/Makefile   |   2 +
>  sound/soc/fsl/imx-hdmi.c | 235 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 249 insertions(+)
>  create mode 100644 sound/soc/fsl/imx-hdmi.c

> diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
> new file mode 100644
> index 000000000000..ac164514b1b2
> --- /dev/null
> +++ b/sound/soc/fsl/imx-hdmi.c

> +static int imx_hdmi_hw_params(struct snd_pcm_substream *substream,
> +			      struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct imx_hdmi_data *data = snd_soc_card_get_drvdata(rtd->card);
> +	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +	struct snd_soc_card *card = rtd->card;
> +	struct device *dev = card->dev;
> +	int ret;
> +
> +	/* set cpu DAI configuration */
> +	ret = snd_soc_dai_set_sysclk(cpu_dai, data->cpu_priv.sysclk_id[tx],
> +				     8 * data->cpu_priv.slot_width * params_rate(params),

Looks like fixed 2 slots being used, judging by the set_tdm_slot
call below. Then...why "8 *"? Probably need a line of comments?

> +				     tx ? SND_SOC_CLOCK_OUT : SND_SOC_CLOCK_IN);
> +	if (ret && ret != -ENOTSUPP) {
> +		dev_err(dev, "failed to set cpu sysclk: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0, 0, 2, data->cpu_priv.slot_width);

May have a local variable to cache slot_width.

> +static int imx_hdmi_probe(struct platform_device *pdev)

> +	data->dai.name = "i.MX HDMI";
> +	data->dai.stream_name = "i.MX HDMI";
> +	data->dai.cpus->dai_name = dev_name(&cpu_pdev->dev);
> +	data->dai.platforms->of_node = cpu_np;
> +	data->dai.ops = &imx_hdmi_ops;
> +	data->dai.playback_only = true;
> +	data->dai.capture_only = false;
> +	data->dai.init = imx_hdmi_init;
> +
> +
> +	if (of_property_read_bool(np, "hdmi-out")) {
> +		data->dai.playback_only = true;
> +		data->dai.capture_only = false;
> +		data->dai.codecs->dai_name = "i2s-hifi";
> +		data->dai.codecs->name = "hdmi-audio-codec.1";
> +		data->dai.dai_fmt = data->dai_fmt |
> +				    SND_SOC_DAIFMT_NB_NF |
> +				    SND_SOC_DAIFMT_CBS_CFS;
> +	}
> +
> +	if (of_property_read_bool(np, "hdmi-in")) {
> +		data->dai.playback_only = false;
> +		data->dai.capture_only = true;
> +		data->dai.codecs->dai_name = "i2s-hifi";
> +		data->dai.codecs->name = "hdmi-audio-codec.2";
> +		data->dai.dai_fmt = data->dai_fmt |
> +				    SND_SOC_DAIFMT_NB_NF |
> +				    SND_SOC_DAIFMT_CBM_CFM;
> +	}
> +
> +	if ((data->dai.playback_only && data->dai.capture_only) ||
> +	    (!data->dai.playback_only && !data->dai.capture_only)) {
> +		dev_err(&pdev->dev, "Wrongly enable HDMI DAI link\n");
> +		goto fail;
> +	}

Seems that this condition check can never be true, given that:
1. By default: playback_only=true && capture_only=false
2. Conditionally overwritten: playback_only=true && capture_only=false
3. Conditionally overwritten: playback_only=false && capture_only=true

If I understand it correctly, probably should be something like:
	bool hdmi_out = of_property_read_bool(np, "hdmi-out");
	bool hdmi_in = of_property_read_bool(np, "hdmi-in");

	if ((hdmi_out && hdmi_in) || (!hdmi_out || !hdmi_in))
		// "Invalid HDMI DAI link"; goto fail;

	if (hdmi_out) {
		// ...
	} else if (hdmi_in) {
		// ...
	} else // No need of this line if two properties are exclusive

> +	data->card.num_links = 1;
> +	data->card.dai_link = &data->dai;
> +
> +	platform_set_drvdata(pdev, &data->card);

Why pass card pointer?
