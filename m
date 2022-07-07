Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5270D569E97
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 11:32:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA264827;
	Thu,  7 Jul 2022 11:31:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA264827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657186335;
	bh=rEUuXJhPoWfN6Zu/rCdL0FagRYefiP154qCbecgwwMQ=;
	h=Date:From:Subject:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KYYUJUymSYMz7Ixb5BMCvw8iXW6Sdm/MaTUudHRwSgNfnEBMMbr9Tf7VaWeWMvYL7
	 1KY8y8aLi9XTKcHJAG7ZkKclYBiBeU4tH7t5v5yvyOdAsKNh1TNejXunWY4Izqgm1Q
	 VOlfevpW2TBweR600qTSzREjfirdFW2QggUf7yR4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D4EAF8028D;
	Thu,  7 Jul 2022 11:31:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0F59F8016A; Thu,  7 Jul 2022 11:31:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 988ECF800C5
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 11:31:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 988ECF800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="JtBdqbQG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1657186262; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3432oYUbB0NCbGzcaiDe7Zz5ohhG6Uoy9WG/btVsu7A=;
 b=JtBdqbQGB661DJdFRqmt6kAQ1SROsa6wGDALoANOgBdiRAomxlU2IucnqCUihPqEtfIJmC
 JMFLR0QwG9OjtAxsdBjEzmmZfgI1AdPXq3yS6K2bYCDsqeDtHGKebsQvudbQwBuYlL4GHT
 kdoqEDR72JweoTDsQMMhimpdx1obwaU=
Date: Thu, 07 Jul 2022 10:30:51 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 02/11] ASoC: jz4740-i2s: Refactor DMA channel setup
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Message-Id: <F39NER.PND5B77O5GFP@crapouillou.net>
In-Reply-To: <20220706211330.120198-3-aidanmacdonald.0x0@gmail.com>
References: <20220706211330.120198-1-aidanmacdonald.0x0@gmail.com>
 <20220706211330.120198-3-aidanmacdonald.0x0@gmail.com>
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



Le mer., juil. 6 2022 at 22:13:21 +0100, Aidan MacDonald=20
<aidanmacdonald.0x0@gmail.com> a =E9crit :
> It's simpler to set up the playback and capture DMA settings
> at driver probe time instead of during DAI probing.
>=20
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---
>  sound/soc/jz4740/jz4740-i2s.c | 23 +++++------------------
>  1 file changed, 5 insertions(+), 18 deletions(-)
>=20
> diff --git a/sound/soc/jz4740/jz4740-i2s.c=20
> b/sound/soc/jz4740/jz4740-i2s.c
> index 298ff0a83931..ecd8df70d39c 100644
> --- a/sound/soc/jz4740/jz4740-i2s.c
> +++ b/sound/soc/jz4740/jz4740-i2s.c
> @@ -95,7 +95,6 @@ struct i2s_soc_info {
>  struct jz4740_i2s {
>  	struct resource *mem;
>  	void __iomem *base;
> -	dma_addr_t phys_base;

Acked-by: Paul Cercueil <paul@crapouillou.net>

Note that you can remove "mem" too, it's not used anywhere.

Cheers,
-Paul

>=20
>  	struct clk *clk_aic;
>  	struct clk *clk_i2s;
> @@ -370,21 +369,6 @@ static int jz4740_i2s_resume(struct=20
> snd_soc_component *component)
>  	return 0;
>  }
>=20
> -static void jz4740_i2s_init_pcm_config(struct jz4740_i2s *i2s)
> -{
> -	struct snd_dmaengine_dai_dma_data *dma_data;
> -
> -	/* Playback */
> -	dma_data =3D &i2s->playback_dma_data;
> -	dma_data->maxburst =3D 16;
> -	dma_data->addr =3D i2s->phys_base + JZ_REG_AIC_FIFO;
> -
> -	/* Capture */
> -	dma_data =3D &i2s->capture_dma_data;
> -	dma_data->maxburst =3D 16;
> -	dma_data->addr =3D i2s->phys_base + JZ_REG_AIC_FIFO;
> -}
> -
>  static int jz4740_i2s_dai_probe(struct snd_soc_dai *dai)
>  {
>  	struct jz4740_i2s *i2s =3D snd_soc_dai_get_drvdata(dai);
> @@ -395,7 +379,6 @@ static int jz4740_i2s_dai_probe(struct=20
> snd_soc_dai *dai)
>  	if (ret)
>  		return ret;
>=20
> -	jz4740_i2s_init_pcm_config(i2s);
>  	snd_soc_dai_init_dma_data(dai, &i2s->playback_dma_data,
>  		&i2s->capture_dma_data);
>=20
> @@ -529,7 +512,11 @@ static int jz4740_i2s_dev_probe(struct=20
> platform_device *pdev)
>  	if (IS_ERR(i2s->base))
>  		return PTR_ERR(i2s->base);
>=20
> -	i2s->phys_base =3D mem->start;
> +	i2s->playback_dma_data.maxburst =3D 16;
> +	i2s->playback_dma_data.addr =3D mem->start + JZ_REG_AIC_FIFO;
> +
> +	i2s->capture_dma_data.maxburst =3D 16;
> +	i2s->capture_dma_data.addr =3D mem->start + JZ_REG_AIC_FIFO;
>=20
>  	i2s->clk_aic =3D devm_clk_get(dev, "aic");
>  	if (IS_ERR(i2s->clk_aic))
> --
> 2.35.1
>=20


