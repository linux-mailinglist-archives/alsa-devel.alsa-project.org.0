Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E66569EE6
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 11:54:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DEE6E0F;
	Thu,  7 Jul 2022 11:53:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DEE6E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657187660;
	bh=/1ThROWA1ERUskpmscUYi6MW0AhRp8IKrSWx0oCZeoo=;
	h=Date:From:Subject:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mlown/6TUuSY62m7Z89HCh5gF6ukxF33hCYm6XE1LQmuF087QUPnu1jx/9O3ML4xd
	 p6UUsbdenUXr2PPe3ObvvIGVWrYd6teJoznrPy3253vwwXAgbNMQw41r3EiqfM9BQE
	 N0af39gmXvI5bkUWsBkymKrab+95aOqz8PlX3/b0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08F4FF800C5;
	Thu,  7 Jul 2022 11:53:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BF80F8016A; Thu,  7 Jul 2022 11:53:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 311F5F800C5
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 11:53:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 311F5F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="TOmpTwpk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1657187594; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M2iuLPi3znYre9jdhTqzIq1pKMAjj+Qt7rBhbS9PMKc=;
 b=TOmpTwpkYfoyrZfXgxN9P80ZdASQ8xAFueCXRyevhw88XDpsFtV4IV7mDsi6K5yFPNze8l
 dqjj9z/hQSnOThUzJif9/1cTlTT2SQMQnbV1KdyJmlCP+P6Y0ONS+RMosmXgVFSLXzw4rr
 s5a4qsRk8qXubcC8Ieb1GeXaMrlFpuw=
Date: Thu, 07 Jul 2022 10:53:05 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 10/11] ASoC: jz4740-i2s: Support S20_LE and S24_LE sample
 formats
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Message-Id: <H4ANER.XJSSJIHNXTEA1@crapouillou.net>
In-Reply-To: <20220706211330.120198-11-aidanmacdonald.0x0@gmail.com>
References: <20220706211330.120198-1-aidanmacdonald.0x0@gmail.com>
 <20220706211330.120198-11-aidanmacdonald.0x0@gmail.com>
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



Le mer., juil. 6 2022 at 22:13:29 +0100, Aidan MacDonald=20
<aidanmacdonald.0x0@gmail.com> a =E9crit :
> The audio controller on JZ47xx SoCs supports 20- and 24-bit
> samples coming from memory. Allow those formats to be used
> with the I2S driver.
>=20
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---
>  sound/soc/jz4740/jz4740-i2s.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/sound/soc/jz4740/jz4740-i2s.c=20
> b/sound/soc/jz4740/jz4740-i2s.c
> index 80b355d715ce..ee99c5e781ec 100644
> --- a/sound/soc/jz4740/jz4740-i2s.c
> +++ b/sound/soc/jz4740/jz4740-i2s.c
> @@ -222,9 +222,15 @@ static int jz4740_i2s_hw_params(struct=20
> snd_pcm_substream *substream,
>  	case SNDRV_PCM_FORMAT_S8:
>  		sample_size =3D 0;
>  		break;
> -	case SNDRV_PCM_FORMAT_S16:
> +	case SNDRV_PCM_FORMAT_S16_LE:
>  		sample_size =3D 1;
>  		break;
> +	case SNDRV_PCM_FORMAT_S20_LE:
> +		sample_size =3D 3;
> +		break;
> +	case SNDRV_PCM_FORMAT_S24_LE:
> +		sample_size =3D 4;
> +		break;

Did you test these? It is unclear to me, looking at the JZ4740 PM, if=20
the 18-bit, 20-bit and 24-bit samples are in 4 bytes or 3 bytes.

Cheers,
-Paul

>  	default:
>  		return -EINVAL;
>  	}
> @@ -362,7 +368,9 @@ static const struct snd_soc_dai_ops=20
> jz4740_i2s_dai_ops =3D {
>  };
>=20
>  #define JZ4740_I2S_FMTS (SNDRV_PCM_FMTBIT_S8 | \
> -		SNDRV_PCM_FMTBIT_S16_LE)
> +			 SNDRV_PCM_FMTBIT_S16_LE | \
> +			 SNDRV_PCM_FMTBIT_S20_LE | \
> +			 SNDRV_PCM_FMTBIT_S24_LE)
>=20
>  static struct snd_soc_dai_driver jz4740_i2s_dai =3D {
>  	.probe =3D jz4740_i2s_dai_probe,
> --
> 2.35.1
>=20


