Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C65D8569EB4
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 11:41:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C333C1651;
	Thu,  7 Jul 2022 11:40:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C333C1651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657186897;
	bh=GF9kTtFsAFbPywGhYFm9MvVZ7wBOL/kwDoz6v5cYNdQ=;
	h=Date:From:Subject:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sd8OjBkSXLCZwVI3l2cr+cIAP7c/UFVXD0eJQn0p/DCkic38+rSHecsdG66SzvgQl
	 Nj5FPoC8T6VDMs4HSV3vFLInRagssy0Gc905gsZ3yvIwQPKb7SVR63ZAf7q8cdC5zq
	 sOiBXTd8rMdOVCqb8jnMwURCA/5QiKXlwq/apfMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D22AF80104;
	Thu,  7 Jul 2022 11:40:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A0BEF80104; Thu,  7 Jul 2022 11:40:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 246B1F80104
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 11:40:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 246B1F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="MaSHGdQB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1657186839; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tyen7txTUb5pq9zQQGZmuWYUpttgvf+WfkbcsWB8ZG4=;
 b=MaSHGdQBI+VAXUZX/C8tnXzbfL4brntQ/nxoaJhWbkMP80u3mi4YyKlBfABfFtTD1DgVaq
 RRtbfxPfeOdL3JfrQM+gxQ2nJORDBvRcPovkKaZH5TDuUsRzxDGKwbfsFSXkurOOk4Z/m7
 6PWG8VIiSZuXOYD/L4CSukqEkAo+8BA=
Date: Thu, 07 Jul 2022 10:40:29 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 06/11] ASoC: jz4740-i2s: Use FIELD_PREP() macros in
 hw_params callback
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Message-Id: <HJ9NER.R0SNUFB7SCZ52@crapouillou.net>
In-Reply-To: <20220706211330.120198-7-aidanmacdonald.0x0@gmail.com>
References: <20220706211330.120198-1-aidanmacdonald.0x0@gmail.com>
 <20220706211330.120198-7-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, tiwai@suse.com,
 broonie@kernel.org
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



Le mer., juil. 6 2022 at 22:13:25 +0100, Aidan MacDonald=20
<aidanmacdonald.0x0@gmail.com> a =E9crit :
> Get rid of a couple of macros and improve readability by using
> FIELD_PREP() and GENMASK() for the sample size setting.
>=20
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  sound/soc/jz4740/jz4740-i2s.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
>=20
> diff --git a/sound/soc/jz4740/jz4740-i2s.c=20
> b/sound/soc/jz4740/jz4740-i2s.c
> index 8bb9449d13d3..3c3cf78bf848 100644
> --- a/sound/soc/jz4740/jz4740-i2s.c
> +++ b/sound/soc/jz4740/jz4740-i2s.c
> @@ -3,6 +3,7 @@
>   *  Copyright (C) 2010, Lars-Peter Clausen <lars@metafoo.de>
>   */
>=20
> +#include <linux/bitfield.h>
>  #include <linux/init.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> @@ -49,8 +50,8 @@
>  #define JZ4760_AIC_CONF_FIFO_RX_THRESHOLD_OFFSET 24
>  #define JZ4760_AIC_CONF_FIFO_TX_THRESHOLD_OFFSET 16
>=20
> -#define JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE_MASK (0x7 << 19)
> -#define JZ_AIC_CTRL_INPUT_SAMPLE_SIZE_MASK (0x7 << 16)
> +#define JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE GENMASK(21, 19)
> +#define JZ_AIC_CTRL_INPUT_SAMPLE_SIZE GENMASK(18, 16)
>  #define JZ_AIC_CTRL_ENABLE_RX_DMA BIT(15)
>  #define JZ_AIC_CTRL_ENABLE_TX_DMA BIT(14)
>  #define JZ_AIC_CTRL_MONO_TO_STEREO BIT(11)
> @@ -65,9 +66,6 @@
>  #define JZ_AIC_CTRL_ENABLE_PLAYBACK BIT(1)
>  #define JZ_AIC_CTRL_ENABLE_CAPTURE BIT(0)
>=20
> -#define JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE_OFFSET 19
> -#define JZ_AIC_CTRL_INPUT_SAMPLE_SIZE_OFFSET  16
> -
>  #define JZ_AIC_I2S_FMT_DISABLE_BIT_CLK BIT(12)
>  #define JZ_AIC_I2S_FMT_DISABLE_BIT_ICLK BIT(13)
>  #define JZ_AIC_I2S_FMT_ENABLE_SYS_CLK BIT(4)
> @@ -245,8 +243,9 @@ static int jz4740_i2s_hw_params(struct=20
> snd_pcm_substream *substream,
>  	}
>=20
>  	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
> -		ctrl &=3D ~JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE_MASK;
> -		ctrl |=3D sample_size << JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE_OFFSET;
> +		ctrl &=3D ~JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE;
> +		ctrl |=3D FIELD_PREP(JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE, sample_size);
> +
>  		if (params_channels(params) =3D=3D 1)
>  			ctrl |=3D JZ_AIC_CTRL_MONO_TO_STEREO;
>  		else
> @@ -254,8 +253,8 @@ static int jz4740_i2s_hw_params(struct=20
> snd_pcm_substream *substream,
>=20
>  		div_field =3D i2s->field_i2sdiv_playback;
>  	} else {
> -		ctrl &=3D ~JZ_AIC_CTRL_INPUT_SAMPLE_SIZE_MASK;
> -		ctrl |=3D sample_size << JZ_AIC_CTRL_INPUT_SAMPLE_SIZE_OFFSET;
> +		ctrl &=3D ~JZ_AIC_CTRL_INPUT_SAMPLE_SIZE;
> +		ctrl |=3D FIELD_PREP(JZ_AIC_CTRL_INPUT_SAMPLE_SIZE, sample_size);
>=20
>  		div_field =3D i2s->field_i2sdiv_capture;
>  	}
> --
> 2.35.1
>=20


