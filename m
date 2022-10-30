Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC7D612A7C
	for <lists+alsa-devel@lfdr.de>; Sun, 30 Oct 2022 12:59:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F3661633;
	Sun, 30 Oct 2022 12:58:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F3661633
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667131161;
	bh=Wi54MemALQ5pCHhLSG/BR8G24BWbYwjJZ85joP/QsdU=;
	h=Date:From:Subject:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kNGGR/LcqI4zos5rifZlRCrPMYhQCqg4XK3VzUrUT0NnUnI25YIOe/HGzndkZp7ZO
	 9w0WpcUezxgtsWUAEPjyIxGoC4r5XuGOvvXuyZ+p4g2y0uqJWWCJcOErQa+gxKFmdU
	 S+Fz/DZ4ZnU6nKq/W0Gma4w8jsaNDAM4M8FSk37Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3600F800CC;
	Sun, 30 Oct 2022 12:58:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EF84F800CC; Sun, 30 Oct 2022 12:58:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48453F800CC
 for <alsa-devel@alsa-project.org>; Sun, 30 Oct 2022 12:58:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48453F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="foe3rY0M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1667131099; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PoqpCs7UkUcDQ/eJ5UxDl3G9RkcflCO27aydlA+p8YI=;
 b=foe3rY0Mws/a0FLz2UPceasWglq7atRdpbjqdbxeEoMxDWdNJUDZy6QdqSF9LsxtSjTxMZ
 s3Xm19Ghw12/FIynrutoMOKF1YG6fAbxvQyUzewNLl6eFBrZi5uNt5ZYpqBBprXetCL0BT
 fFBf+Msg//55/1l7VaXslgoc0Oxw+sM=
Date: Sun, 30 Oct 2022 11:58:09 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v1 3/3] ASoC: jz4740-i2s: Remove .set_sysclk()
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Message-Id: <XKEKKR.KWZ8D69P0CYL3@crapouillou.net>
In-Reply-To: <20221028103418.17578-4-aidanmacdonald.0x0@gmail.com>
References: <20221028103418.17578-1-aidanmacdonald.0x0@gmail.com>
 <20221028103418.17578-4-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 tsbogend@alpha.franken.de, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-mips@vger.kernel.org
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

Hi Aidan,

Le ven. 28 oct. 2022 =E0 11:34:18 +0100, Aidan MacDonald=20
<aidanmacdonald.0x0@gmail.com> a =E9crit :
> .set_sysclk() is effectively unused here. No machine drivers use
> jz4740-i2s; and JZ4740_I2S_CLKSRC_EXT is the only selectable clock
> source with simple-card, but that is also the default source and
> has a fixed frequency, so configuring it would be redundant.
>=20
> simple-card ignores -ENOTSUPP error codes when setting the sysclock,
> so any device trees that do set the sysclock for some reason should
> still work.
>=20
> It's still possible to configure the clock parent manually in the
> device tree and control frequency using other simple-card options,
> so at the end of the day there's no real loss in functionality.
>=20
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> Meant to be applied on top of jz4740-i2s cleanups series already
> in linux-next.
> Link:=20
> https://lore.kernel.org/alsa-devel/20221023143328.160866-1-aidanmacdonald=
.0x0@gmail.com/
>=20
>  sound/soc/jz4740/jz4740-i2s.c | 32 --------------------------------
>  sound/soc/jz4740/jz4740-i2s.h | 10 ----------
>  2 files changed, 42 deletions(-)
>  delete mode 100644 sound/soc/jz4740/jz4740-i2s.h
>=20
> diff --git a/sound/soc/jz4740/jz4740-i2s.c=20
> b/sound/soc/jz4740/jz4740-i2s.c
> index b620d4462d90..6d9cfe0a5041 100644
> --- a/sound/soc/jz4740/jz4740-i2s.c
> +++ b/sound/soc/jz4740/jz4740-i2s.c
> @@ -23,8 +23,6 @@
>  #include <sound/initval.h>
>  #include <sound/dmaengine_pcm.h>
>=20
> -#include "jz4740-i2s.h"
> -
>  #define JZ_REG_AIC_CONF		0x00
>  #define JZ_REG_AIC_CTRL		0x04
>  #define JZ_REG_AIC_I2S_FMT	0x10
> @@ -273,35 +271,6 @@ static int jz4740_i2s_hw_params(struct=20
> snd_pcm_substream *substream,
>  	return 0;
>  }
>=20
> -static int jz4740_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
> -	unsigned int freq, int dir)
> -{
> -	struct jz4740_i2s *i2s =3D snd_soc_dai_get_drvdata(dai);
> -	struct clk *parent;
> -	int ret =3D 0;
> -
> -	switch (clk_id) {
> -	case JZ4740_I2S_CLKSRC_EXT:
> -		parent =3D clk_get(NULL, "ext");
> -		if (IS_ERR(parent))
> -			return PTR_ERR(parent);
> -		clk_set_parent(i2s->clk_i2s, parent);
> -		break;
> -	case JZ4740_I2S_CLKSRC_PLL:
> -		parent =3D clk_get(NULL, "pll half");
> -		if (IS_ERR(parent))
> -			return PTR_ERR(parent);
> -		clk_set_parent(i2s->clk_i2s, parent);
> -		ret =3D clk_set_rate(i2s->clk_i2s, freq);
> -		break;
> -	default:
> -		return -EINVAL;
> -	}
> -	clk_put(parent);
> -
> -	return ret;
> -}
> -
>  static int jz4740_i2s_dai_probe(struct snd_soc_dai *dai)
>  {
>  	struct jz4740_i2s *i2s =3D snd_soc_dai_get_drvdata(dai);
> @@ -318,7 +287,6 @@ static const struct snd_soc_dai_ops=20
> jz4740_i2s_dai_ops =3D {
>  	.trigger =3D jz4740_i2s_trigger,
>  	.hw_params =3D jz4740_i2s_hw_params,
>  	.set_fmt =3D jz4740_i2s_set_fmt,
> -	.set_sysclk =3D jz4740_i2s_set_sysclk,
>  };
>=20
>  #define JZ4740_I2S_FMTS (SNDRV_PCM_FMTBIT_S8 | \
> diff --git a/sound/soc/jz4740/jz4740-i2s.h=20
> b/sound/soc/jz4740/jz4740-i2s.h
> deleted file mode 100644
> index 4da14eac1145..000000000000
> --- a/sound/soc/jz4740/jz4740-i2s.h
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -
> -#ifndef _JZ4740_I2S_H
> -#define _JZ4740_I2S_H
> -
> -/* I2S clock source */
> -#define JZ4740_I2S_CLKSRC_EXT 0
> -#define JZ4740_I2S_CLKSRC_PLL 1
> -
> -#endif
> --
> 2.38.1
>=20


