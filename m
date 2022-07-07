Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DED569ECE
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 11:48:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DB35E0E;
	Thu,  7 Jul 2022 11:47:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DB35E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657187302;
	bh=lRyqYTPVqmmgIxQE7FoGi+vL/6GXRhuA8h5acg34zUo=;
	h=Date:From:Subject:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QlUtykULWqxdCpfF1FCF9kLyTNHZzPvdmRi9E+NmdsFVMhLbwQz1IWwZBenzA883e
	 EP1n3qU2cyOsQcluKdcuyrnisEkpLFzeYcbG08+/jmNUEgeOCU6VkHud/ey++iOZ9H
	 sjyQqFkgWo73pxXO0u8TY/kv4rc2j4FL6VXtb9f0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 147A5F80137;
	Thu,  7 Jul 2022 11:47:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EF20F8016A; Thu,  7 Jul 2022 11:47:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3AF0F80104
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 11:47:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3AF0F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="Q+Qb29ek"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1657187235; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pA2f0yBa6U6ftJuYv1lYb8ecq1Rzy1PWTbc6pDrTiGY=;
 b=Q+Qb29ekKl3YvJV7p2iui3OpCBEqgzBvNsy2BaKIolTqg3PRMyMIWRSCBA6iE0S+6oYZHj
 JRZvSKp5uEarGHt/HYdqtlWJwJg9ROhjKU1VgBv6tGnYVdl6vgh2/g1SEBv36Sd04ZXok1
 ZFx/Ih4TbzaYEAZqelshawgmkUKBoA8=
Date: Thu, 07 Jul 2022 10:47:05 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 09/11] ASoC: jz4740-i2s: Make the PLL clock name
 SoC-specific
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Message-Id: <HU9NER.25VYXWS2PRRL2@crapouillou.net>
In-Reply-To: <20220706211330.120198-10-aidanmacdonald.0x0@gmail.com>
References: <20220706211330.120198-1-aidanmacdonald.0x0@gmail.com>
 <20220706211330.120198-10-aidanmacdonald.0x0@gmail.com>
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



Le mer., juil. 6 2022 at 22:13:28 +0100, Aidan MacDonald=20
<aidanmacdonald.0x0@gmail.com> a =E9crit :
> On some Ingenic SoCs, such as the X1000, there is a programmable
> divider used to generate the I2S system clock from a PLL, rather
> than a fixed PLL/2 clock. It doesn't make much sense to call the
> clock "pll half" on those SoCs, so the clock name should really be
> a SoC-dependent value.

Do you really need the .set_sysclk() callback? I've never seen it used=20
on any of the Ingenic boards I have, so to me it's pretty much dead=20
code. Unless you do use this callback, I'd suggest to drop this patch=20
until you do need it.

Cheers,
-Paul

> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---
>  sound/soc/jz4740/jz4740-i2s.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/sound/soc/jz4740/jz4740-i2s.c=20
> b/sound/soc/jz4740/jz4740-i2s.c
> index 3a21ee9d34d1..80b355d715ce 100644
> --- a/sound/soc/jz4740/jz4740-i2s.c
> +++ b/sound/soc/jz4740/jz4740-i2s.c
> @@ -71,6 +71,8 @@ struct i2s_soc_info {
>  	struct reg_field field_tx_fifo_thresh;
>  	struct reg_field field_i2sdiv_capture;
>  	struct reg_field field_i2sdiv_playback;
> +
> +	const char *pll_clk_name;
>  };
>=20
>  struct jz4740_i2s {
> @@ -265,7 +267,7 @@ static int jz4740_i2s_set_sysclk(struct=20
> snd_soc_dai *dai, int clk_id,
>  		clk_set_parent(i2s->clk_i2s, parent);
>  		break;
>  	case JZ4740_I2S_CLKSRC_PLL:
> -		parent =3D clk_get(NULL, "pll half");
> +		parent =3D clk_get(NULL, i2s->soc_info->pll_clk_name);
>  		if (IS_ERR(parent))
>  			return PTR_ERR(parent);
>  		clk_set_parent(i2s->clk_i2s, parent);
> @@ -387,6 +389,7 @@ static const struct i2s_soc_info=20
> jz4740_i2s_soc_info =3D {
>  	.field_tx_fifo_thresh	=3D REG_FIELD(JZ_REG_AIC_CONF, 8, 11),
>  	.field_i2sdiv_capture	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
>  	.field_i2sdiv_playback	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
> +	.pll_clk_name		=3D "pll half",
>  };
>=20
>  static const struct i2s_soc_info jz4760_i2s_soc_info =3D {
> @@ -395,6 +398,7 @@ static const struct i2s_soc_info=20
> jz4760_i2s_soc_info =3D {
>  	.field_tx_fifo_thresh	=3D REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
>  	.field_i2sdiv_capture	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
>  	.field_i2sdiv_playback	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
> +	.pll_clk_name		=3D "pll half",
>  };
>=20
>  static struct snd_soc_dai_driver jz4770_i2s_dai =3D {
> @@ -421,6 +425,7 @@ static const struct i2s_soc_info=20
> jz4770_i2s_soc_info =3D {
>  	.field_tx_fifo_thresh	=3D REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
>  	.field_i2sdiv_capture	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 8, 11),
>  	.field_i2sdiv_playback	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
> +	.pll_clk_name		=3D "pll half",
>  };
>=20
>  static const struct i2s_soc_info jz4780_i2s_soc_info =3D {
> @@ -429,6 +434,7 @@ static const struct i2s_soc_info=20
> jz4780_i2s_soc_info =3D {
>  	.field_tx_fifo_thresh	=3D REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
>  	.field_i2sdiv_capture	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 8, 11),
>  	.field_i2sdiv_playback	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
> +	.pll_clk_name		=3D "pll half",
>  };
>=20
>  static const struct snd_soc_component_driver jz4740_i2s_component =3D {
> --
> 2.35.1
>=20


