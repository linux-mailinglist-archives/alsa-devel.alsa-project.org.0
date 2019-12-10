Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3301199FB
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 22:53:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A6761615;
	Tue, 10 Dec 2019 22:52:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A6761615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576014781;
	bh=UL7PA+Q6h5GGN+AdPF8nDW9U0NAP6W3u3plIpba5PGw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YMgdMcfAoL15M6hXH1qJjHHpcfhex+KusgtK4C7IhO/ISlutorzqfwVmA8mnpfsLg
	 sdniv2b/N0/PIQJBla2HIlT0BPG++KwPfnVq9gx1U7JwKp2ENf1Fk3ZiYqLJNv2Sn4
	 bVNrN7oBHg797rjcgzracW9FQiPYP8Pi8qRSJ7Yo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7243F800F3;
	Tue, 10 Dec 2019 22:51:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F2C2F8020C; Tue, 10 Dec 2019 22:51:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2862AF800B4
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 22:51:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2862AF800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TS/xQCib"
Received: by mail-pf1-x444.google.com with SMTP id x185so495504pfc.5
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 13:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OgOPIkLF3tjDFTQA5G2SZ5Icy0gItqp4PdG8ErywjM8=;
 b=TS/xQCibv29+a4IwS81Dvn9gdeeLaYyhN8nJFVTutImfTbVhexWLOttJcsCJUgJt90
 zcwHitUkFtLiuM16PqAZ56mht+ZJGdlq3Qjwymvr1LD1LWSrSu8udhGYxf8ohoGkIMZi
 YSw7pRa5mjQ7QCiEEMgZ7Qnf555ZsLylBd5EuBdebAmaKsSG3QshWIqHbcxZpyd6S7TF
 DaXvuStuhwHc/rLHeCAOaXxAZBhCu3+iPE/4lWJ9vjuIsrurmR7Fy1PvxC/ETOlQ4dyI
 7u0i+ZMHpWrvJYMBuqQtUyWXlAxGrACEAZ1w9JmjHArlu9VAjDHJsjjnnzY7wGUYX7gu
 WrpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OgOPIkLF3tjDFTQA5G2SZ5Icy0gItqp4PdG8ErywjM8=;
 b=pKl7sSYAUEBaJFEBJ0nOwW0ToBtX1nkrFlcsH1jlYiCDv8pyFul5YcKf0RarlZCVln
 q4golvVxA79FP2l/dGW/yIsktkTjaAUB1G78Hfk022xqzJ6hrywrK73Wb4s6r3hfXmhD
 mo6HGD+ejQATlDJbl2nlqo5gAAXdXryQZMq2Yk0LL4EyNn8KlgvNHCS7YgS/vF3OhHXr
 KAt3lekrXxfDoJr1qsffotHdIeJCpUM9xPOWN4YdSK7cmimoCs8wAMOrURIffPHoBH37
 iiQ9Sv9jc9QALGLq3pmxI2/w3gyyrnauqhIudnmqZFtlPLVLgqegNWbyCOhDohH8WvQy
 WsVg==
X-Gm-Message-State: APjAAAVq8DYwXXy/glEUM2lIna9eNVHw2Yx/0LrEdGU5esSwsSxInfvy
 c6nBrOARnquYRoSSY5a19G8=
X-Google-Smtp-Source: APXvYqzR8kSTntBXhniWtgMF7BAqxSjurFzWj0FfrOTGLrktHZI72TButxd55H+eX7hvtxn3IGItlQ==
X-Received: by 2002:a63:1e47:: with SMTP id p7mr257602pgm.339.1576014669506;
 Tue, 10 Dec 2019 13:51:09 -0800 (PST)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id m3sm4277198pgp.32.2019.12.10.13.51.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 10 Dec 2019 13:51:09 -0800 (PST)
Date: Tue, 10 Dec 2019 13:47:51 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191210214750.GA25987@Asurada-Nvidia.nvidia.com>
References: <20191210145406.21419-1-tiwai@suse.de>
 <20191210145406.21419-7-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191210145406.21419-7-tiwai@suse.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>
Subject: Re: [alsa-devel] [PATCH for-5.6 06/23] ASoC: fsl: Drop superfluous
	ioctl PCM ops
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

On Tue, Dec 10, 2019 at 03:53:49PM +0100, Takashi Iwai wrote:
> ASoC PCM core deals the empty ioctl field now as default.
> Let's kill the redundant lines.
> 
> Cc: Timur Tabi <timur@kernel.org>
> Cc: Nicolin Chen <nicoleotsuka@gmail.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

> Cc: Xiubo Li <Xiubo.Lee@gmail.com>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/soc/fsl/fsl_asrc_dma.c | 1 -
>  sound/soc/fsl/fsl_dma.c      | 1 -
>  sound/soc/fsl/imx-pcm-fiq.c  | 1 -
>  sound/soc/fsl/mpc5200_dma.c  | 1 -
>  4 files changed, 4 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> index d6146de9acd2..79d66224c0a8 100644
> --- a/sound/soc/fsl/fsl_asrc_dma.c
> +++ b/sound/soc/fsl/fsl_asrc_dma.c
> @@ -428,7 +428,6 @@ static void fsl_asrc_dma_pcm_free(struct snd_soc_component *component,
>  
>  struct snd_soc_component_driver fsl_asrc_component = {
>  	.name		= DRV_NAME,
> -	.ioctl		= snd_soc_pcm_lib_ioctl,
>  	.hw_params	= fsl_asrc_dma_hw_params,
>  	.hw_free	= fsl_asrc_dma_hw_free,
>  	.trigger	= fsl_asrc_dma_trigger,
> diff --git a/sound/soc/fsl/fsl_dma.c b/sound/soc/fsl/fsl_dma.c
> index 2868c4f97cb2..13ae089c1911 100644
> --- a/sound/soc/fsl/fsl_dma.c
> +++ b/sound/soc/fsl/fsl_dma.c
> @@ -903,7 +903,6 @@ static int fsl_soc_dma_probe(struct platform_device *pdev)
>  	dma->dai.name = DRV_NAME;
>  	dma->dai.open = fsl_dma_open;
>  	dma->dai.close = fsl_dma_close;
> -	dma->dai.ioctl = snd_soc_pcm_lib_ioctl;
>  	dma->dai.hw_params = fsl_dma_hw_params;
>  	dma->dai.hw_free = fsl_dma_hw_free;
>  	dma->dai.pointer = fsl_dma_pointer;
> diff --git a/sound/soc/fsl/imx-pcm-fiq.c b/sound/soc/fsl/imx-pcm-fiq.c
> index 08131d147983..f20d5b1c3848 100644
> --- a/sound/soc/fsl/imx-pcm-fiq.c
> +++ b/sound/soc/fsl/imx-pcm-fiq.c
> @@ -338,7 +338,6 @@ static void snd_imx_pcm_free(struct snd_soc_component *component,
>  static const struct snd_soc_component_driver imx_soc_component_fiq = {
>  	.open		= snd_imx_open,
>  	.close		= snd_imx_close,
> -	.ioctl		= snd_soc_pcm_lib_ioctl,
>  	.hw_params	= snd_imx_pcm_hw_params,
>  	.prepare	= snd_imx_pcm_prepare,
>  	.trigger	= snd_imx_pcm_trigger,
> diff --git a/sound/soc/fsl/mpc5200_dma.c b/sound/soc/fsl/mpc5200_dma.c
> index 5237ac96b756..ed7211d744b3 100644
> --- a/sound/soc/fsl/mpc5200_dma.c
> +++ b/sound/soc/fsl/mpc5200_dma.c
> @@ -360,7 +360,6 @@ static const struct snd_soc_component_driver mpc5200_audio_dma_component = {
>  	.open		= psc_dma_open,
>  	.close		= psc_dma_close,
>  	.hw_free	= psc_dma_hw_free,
> -	.ioctl		= snd_soc_pcm_lib_ioctl,
>  	.pointer	= psc_dma_pointer,
>  	.trigger	= psc_dma_trigger,
>  	.hw_params	= psc_dma_hw_params,
> -- 
> 2.16.4
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
