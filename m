Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FE5569EE9
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 11:55:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBF3F15C2;
	Thu,  7 Jul 2022 11:54:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBF3F15C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657187700;
	bh=zqX2IkRLxAQo716xYKKIsh/cG2WQc5e4ds3FxDYxhAE=;
	h=Date:From:Subject:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HSDibpaWWo9kN/Y4gZNs1T2DzedzHDudnHEh/oreLEdzfOycn0Nors6iin3B9J5ol
	 rDsdIgzxZDj7hxaAt1pyB1BRPme9vO5NGqonHz2UQ09pviYvSIVo4UdxDVnqzheumZ
	 XzRxTXnifiZgdc8bB27ajsTjmiUBf4M/+9OpcZc0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93488F804FB;
	Thu,  7 Jul 2022 11:54:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF79EF804FA; Thu,  7 Jul 2022 11:54:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2F92F80104
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 11:54:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2F92F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="QV8hoZwQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1657187641; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nve6BKmlaYOc+otcI5eNXohDPw2cjmzrRzVfk9qXlSw=;
 b=QV8hoZwQTYaJ3Jt8bNtBQ+DQI0juH8x5zi9rMmqfAh1yP2oH9HizoJIn8ro25vqQChCN1G
 M9ZoL16/rzcKJcqAfnOp+VBukhcMLdDuhYIfNUJ8x/h6/TaEa7+bcVkEkOOKymU+bhNVYu
 KGkMwRNo+s52kdYt5n57pjrCZDEMZwE=
Date: Thu, 07 Jul 2022 10:53:47 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 11/11] ASoC: jz4740-i2s: Support continuous sample rate
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Message-Id: <N5ANER.SGRSW7GYX3423@crapouillou.net>
In-Reply-To: <20220706211330.120198-12-aidanmacdonald.0x0@gmail.com>
References: <20220706211330.120198-1-aidanmacdonald.0x0@gmail.com>
 <20220706211330.120198-12-aidanmacdonald.0x0@gmail.com>
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



Le mer., juil. 6 2022 at 22:13:30 +0100, Aidan MacDonald=20
<aidanmacdonald.0x0@gmail.com> a =E9crit :
> The I2S controller on JZ47xx SoCs doesn't impose restrictions on
> sample rate and the driver doesn't make any assumptions about it,
> so the DAI should advertise a continuous sample rate range.
>=20
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  sound/soc/jz4740/jz4740-i2s.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/sound/soc/jz4740/jz4740-i2s.c=20
> b/sound/soc/jz4740/jz4740-i2s.c
> index ee99c5e781ec..053697c7f19e 100644
> --- a/sound/soc/jz4740/jz4740-i2s.c
> +++ b/sound/soc/jz4740/jz4740-i2s.c
> @@ -378,13 +378,13 @@ static struct snd_soc_dai_driver jz4740_i2s_dai=20
> =3D {
>  	.playback =3D {
>  		.channels_min =3D 1,
>  		.channels_max =3D 2,
> -		.rates =3D SNDRV_PCM_RATE_8000_48000,
> +		.rates =3D SNDRV_PCM_RATE_CONTINUOUS,
>  		.formats =3D JZ4740_I2S_FMTS,
>  	},
>  	.capture =3D {
>  		.channels_min =3D 2,
>  		.channels_max =3D 2,
> -		.rates =3D SNDRV_PCM_RATE_8000_48000,
> +		.rates =3D SNDRV_PCM_RATE_CONTINUOUS,
>  		.formats =3D JZ4740_I2S_FMTS,
>  	},
>  	.symmetric_rate =3D 1,
> @@ -415,13 +415,13 @@ static struct snd_soc_dai_driver jz4770_i2s_dai=20
> =3D {
>  	.playback =3D {
>  		.channels_min =3D 1,
>  		.channels_max =3D 2,
> -		.rates =3D SNDRV_PCM_RATE_8000_48000,
> +		.rates =3D SNDRV_PCM_RATE_CONTINUOUS,
>  		.formats =3D JZ4740_I2S_FMTS,
>  	},
>  	.capture =3D {
>  		.channels_min =3D 2,
>  		.channels_max =3D 2,
> -		.rates =3D SNDRV_PCM_RATE_8000_48000,
> +		.rates =3D SNDRV_PCM_RATE_CONTINUOUS,
>  		.formats =3D JZ4740_I2S_FMTS,
>  	},
>  	.ops =3D &jz4740_i2s_dai_ops,
> --
> 2.35.1
>=20


