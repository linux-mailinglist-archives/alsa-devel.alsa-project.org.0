Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E707621FFCD
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 23:17:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88C1E1662;
	Tue, 14 Jul 2020 23:16:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88C1E1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594761421;
	bh=Oo+BzK4qk3JSgLLNjaFi89A5rMIoGwhkoZuK3UVN7rY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SCwPEe+FJeWpCN6FhI4G6aqYGp3nzxcqNfkKFnU0zyvpO/nhSd5uOmAHCl5bxPTRQ
	 RKwq+0IA6rpNzvB21yMKGWmArVQd4IhHNb/NFXfAUUJyynTog/A84FjpmGVyzTucwe
	 mOsvf1VuV66y4EvD7pREleeDAX8z++k4a6NvfpLo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF7E6F801EC;
	Tue, 14 Jul 2020 23:15:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBD72F8019B; Tue, 14 Jul 2020 23:15:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81D76F80113
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 23:15:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81D76F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="c4g5l41v"
Received: by mail-pg1-x541.google.com with SMTP id m22so8300219pgv.9
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 14:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=gUsxgEIbOCPN/g+dhdnfdWC6Rsm4WcdiQ4zDxdYgS80=;
 b=c4g5l41vPTzdfvBku6Gyyd9dtF0BOhHeYH39FPISi5h5zu/7m0KQBQAauU6DRWwCNI
 aJFxK5Oqe96j7ceibK0CyVHiTNei10p4jHaC3l7OVoXMCCEeHsi/Q8ezd90xrh3x8oJ6
 UwDEyUiPh3Ja1sl8MrwnF5+o4DsaE+nx8NDmDwYw98Nea3ZKmlTfZx3CCP800NIM0SOY
 CXa3j3AUDNMdDH2KvVLhkxmyCWqXWjSov+f1nxIO31O0Gx6YS7hwxXt8puB0/xHjTd2f
 u1Y3X+ybA8mclQRcyyvl59frNzSpsGVtHfR6Mbi41HgC+bFjI9xSl+k3C4ePbPUODuiP
 oeqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gUsxgEIbOCPN/g+dhdnfdWC6Rsm4WcdiQ4zDxdYgS80=;
 b=cVoTbjQvQFeqYB+6qn9lpyQnbruBI5AEBiA72gdMhFJwV3TbfLMoEaUtMwVK2euTz0
 HBYGAwCzAhf1tb14BFGntxjpY9DAGR6PBn7Rk0eyr85IT97217Cvv2llkLzMhcNOL8ap
 4YddY8f69b/Lg6jBuysZh7LkyDbdBdgyFVvC4HLjXLuZUGzZ1PDTNdbfroHccn1wbY2c
 pkm9qWjQT8DC57nWLHrtdUV2qe+Wl3LlockARG8UPr5xzd4+iHOYnv9HeJ2jzK3zHaRz
 s0fs9AkilBd29mEUM8DwV/z2kS9hy5C59rGI1yzKv7e/12YNI8bD7soPcbzcxCN4XKXy
 hoMA==
X-Gm-Message-State: AOAM533GyE/lwRwBFx/W/qv27cNKRWvOwvyy2U7wJi/yCf1Yz52LFY5+
 BEj6OozW86QIXxVq9RAvPfg=
X-Google-Smtp-Source: ABdhPJwsRQ9mKCwSTE8ucb75FPjtcLbouSD8dQj1J5mA3EExVAJ2tJ3R4hWiETcAhJVqwmV+N1o7rA==
X-Received: by 2002:a63:441c:: with SMTP id r28mr4965134pga.372.1594761309828; 
 Tue, 14 Jul 2020 14:15:09 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id y17sm105760pfe.30.2020.07.14.14.15.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 Jul 2020 14:15:09 -0700 (PDT)
Date: Tue, 14 Jul 2020 14:14:45 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 3/3] ASoC: fsl-asoc-card: Support Headphone and
 Microphone Jack detection
Message-ID: <20200714211432.GA10818@Asurada-Nvidia>
References: <1594717536-5188-1-git-send-email-shengjiu.wang@nxp.com>
 <1594717536-5188-4-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594717536-5188-4-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, timur@kernel.org,
 kuninori.morimoto.gx@renesas.com, samuel@sholland.org, katsuhiro@katsuster.net,
 linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, tiwai@suse.com, broonie@kernel.org, festevam@gmail.com
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

Hi Shengjiu,

The whole series looks good to me. Just a couple of small
questions inline:

On Tue, Jul 14, 2020 at 05:05:36PM +0800, Shengjiu Wang wrote:
> Use asoc_simple_init_jack function from simple card to implement
> the Headphone and Microphone detection.
> Register notifier to disable Speaker when Headphone is plugged in
> and enable Speaker when Headphone is unplugged.
> Register notifier to disable Digital Microphone when Analog Microphone
> is plugged in and enable DMIC when Analog Microphone is unplugged.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/Kconfig         |  1 +
>  sound/soc/fsl/fsl-asoc-card.c | 69 ++++++++++++++++++++++++++++++++++-
>  2 files changed, 68 insertions(+), 2 deletions(-)

>  static int fsl_asoc_card_late_probe(struct snd_soc_card *card)
>  {
>  	struct fsl_asoc_card_priv *priv = snd_soc_card_get_drvdata(card);
> @@ -745,8 +789,29 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
>  	snd_soc_card_set_drvdata(&priv->card, priv);
>  
>  	ret = devm_snd_soc_register_card(&pdev->dev, &priv->card);
> -	if (ret && ret != -EPROBE_DEFER)
> -		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
> +	if (ret) {
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);

I think we may move this EPROBE_DEFER to the asrc_fail label.

> +		goto asrc_fail;
> +	}
> +
> +	if (of_property_read_bool(np, "hp-det-gpio")) {

Could we move this check inside asoc_simple_init_jack? There's no
problem with doing it here though, yet I got a bit confused by it
as I thought it's a boolean type property, which would be against
the DT bindings until I saw asoc_simple_init_jack() uses the same
string to get the GPIO. Just it probably would be a bit tricky as
we need it to be optional here.

Otherwise, I think we may add a line of comments to indicate that
the API would use the same string to get the GPIO.

> +		ret = asoc_simple_init_jack(&priv->card, &priv->hp_jack,
> +					    1, NULL, "Headphone Jack");
> +		if (ret)
> +			goto asrc_fail;
> +
> +		snd_soc_jack_notifier_register(&priv->hp_jack.jack, &hp_jack_nb);
> +	}
