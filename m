Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 024AF569EA6
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 11:39:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95460886;
	Thu,  7 Jul 2022 11:38:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95460886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657186754;
	bh=s/0bK7wa6JhRB/x9LBiqi/UBShVUoweGR5ECGuZprQI=;
	h=Date:From:Subject:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kQfJUUA6IyTHnNbbXEG3IzOKwCJFweqc4r0nuvdSUqoapjPBdbHAWRvmcFwSsPhPM
	 RpnpEehDSCzQQ1/K86iZqFKGezglTrdJNCfPvl5DL0igoQMwqI/9X+7wJFms2e2yHF
	 R/8kB92T/R/XiPAgi8ITNUD2VSr2TkJloxkyvHLc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2510EF80104;
	Thu,  7 Jul 2022 11:38:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 906F7F8016A; Thu,  7 Jul 2022 11:38:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83D3AF80104
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 11:38:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83D3AF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="NKmYCqFt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1657186680; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kXIlb6hdJqwtDzPJXzLaKXuJUAGqwuysqFCgGoS6L9w=;
 b=NKmYCqFt+Bn8O5D8zNt1stEVUcLMJ7FFoyccHrpplWfWGAESaQJEK3TE3fjxpPWPw8ONIu
 nf1ZpMQezjE6AGoRvyNUsoBGTqXM+YDCpHOsJaYgPQdcEBsrW4/JIoiG1eHRwFFCA0acF0
 BtHJn3OyliNtw4dXcHcKuDRuodF9K6U=
Date: Thu, 07 Jul 2022 10:37:49 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 05/11] ASoC: jz4740-i2s: Remove unused SoC version IDs
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Message-Id: <1F9NER.E4VHP6MF1K5A2@crapouillou.net>
In-Reply-To: <20220706211330.120198-6-aidanmacdonald.0x0@gmail.com>
References: <20220706211330.120198-1-aidanmacdonald.0x0@gmail.com>
 <20220706211330.120198-6-aidanmacdonald.0x0@gmail.com>
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



Le mer., juil. 6 2022 at 22:13:24 +0100, Aidan MacDonald=20
<aidanmacdonald.0x0@gmail.com> a =E9crit :
> Using version IDs makes the code hard to follow -- it's better to
> describe the functional differences between SoCs instead. Remove
> the IDs since they're no longer used.
>=20
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  sound/soc/jz4740/jz4740-i2s.c | 12 ------------
>  1 file changed, 12 deletions(-)
>=20
> diff --git a/sound/soc/jz4740/jz4740-i2s.c=20
> b/sound/soc/jz4740/jz4740-i2s.c
> index cbb89f724f64..8bb9449d13d3 100644
> --- a/sound/soc/jz4740/jz4740-i2s.c
> +++ b/sound/soc/jz4740/jz4740-i2s.c
> @@ -81,15 +81,7 @@
>  #define I2SDIV_IDV_SHIFT 8
>  #define I2SDIV_IDV_MASK (0xf << I2SDIV_IDV_SHIFT)
>=20
> -enum jz47xx_i2s_version {
> -	JZ_I2S_JZ4740,
> -	JZ_I2S_JZ4760,
> -	JZ_I2S_JZ4770,
> -	JZ_I2S_JZ4780,
> -};
> -
>  struct i2s_soc_info {
> -	enum jz47xx_i2s_version version;
>  	struct snd_soc_dai_driver *dai;
>=20
>  	struct reg_field field_rx_fifo_thresh;
> @@ -406,7 +398,6 @@ static struct snd_soc_dai_driver jz4740_i2s_dai =3D=20
> {
>  };
>=20
>  static const struct i2s_soc_info jz4740_i2s_soc_info =3D {
> -	.version =3D JZ_I2S_JZ4740,
>  	.dai =3D &jz4740_i2s_dai,
>  	.field_rx_fifo_thresh	=3D REG_FIELD(JZ_REG_AIC_CONF, 12, 15),
>  	.field_tx_fifo_thresh	=3D REG_FIELD(JZ_REG_AIC_CONF, 8, 11),
> @@ -415,7 +406,6 @@ static const struct i2s_soc_info=20
> jz4740_i2s_soc_info =3D {
>  };
>=20
>  static const struct i2s_soc_info jz4760_i2s_soc_info =3D {
> -	.version =3D JZ_I2S_JZ4760,
>  	.dai =3D &jz4740_i2s_dai,
>  	.field_rx_fifo_thresh	=3D REG_FIELD(JZ_REG_AIC_CONF, 24, 27),
>  	.field_tx_fifo_thresh	=3D REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
> @@ -442,7 +432,6 @@ static struct snd_soc_dai_driver jz4770_i2s_dai =3D=20
> {
>  };
>=20
>  static const struct i2s_soc_info jz4770_i2s_soc_info =3D {
> -	.version =3D JZ_I2S_JZ4770,
>  	.dai =3D &jz4770_i2s_dai,
>  	.field_rx_fifo_thresh	=3D REG_FIELD(JZ_REG_AIC_CONF, 24, 27),
>  	.field_tx_fifo_thresh	=3D REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
> @@ -451,7 +440,6 @@ static const struct i2s_soc_info=20
> jz4770_i2s_soc_info =3D {
>  };
>=20
>  static const struct i2s_soc_info jz4780_i2s_soc_info =3D {
> -	.version =3D JZ_I2S_JZ4780,
>  	.dai =3D &jz4770_i2s_dai,
>  	.field_rx_fifo_thresh	=3D REG_FIELD(JZ_REG_AIC_CONF, 24, 27),
>  	.field_tx_fifo_thresh	=3D REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
> --
> 2.35.1
>=20


