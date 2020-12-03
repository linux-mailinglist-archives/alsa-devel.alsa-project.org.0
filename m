Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 310E22CDB6A
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Dec 2020 17:40:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDDE7183B;
	Thu,  3 Dec 2020 17:39:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDDE7183B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607013627;
	bh=tjCE5uCIis5DzrOJjHAmZcYDE95nmea+7QiBl1jDBAY=;
	h=Date:From:Subject:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kEf1B/nsVUpiDd4zmYxHx5oKMejpLiAoqlpvlSRaXiZcPD5lff9JgR01q26VJJzTU
	 dL9aJi2ZGHjGXeynlfPJyc/nybbgh7ynJJL7u3TVApPKJ/s9iZFd87cZCJSnzXI7V1
	 zt1OlVEiEFgywPJuRtV4ABbpYABllMUO1pAZ+sXY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC5C5F80254;
	Thu,  3 Dec 2020 17:38:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13674F8016D; Thu,  3 Dec 2020 17:38:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AEF7F8012A
 for <alsa-devel@alsa-project.org>; Thu,  3 Dec 2020 17:38:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AEF7F8012A
Date: Thu, 03 Dec 2020 16:38:24 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] ASoC: jz4740-i2s: add missed checks for clk_get()
To: Chuhong Yuan <hslester96@gmail.com>
Message-Id: <0KVRKQ.500J00DY5DNR@crapouillou.net>
In-Reply-To: <20201203144227.418194-1-hslester96@gmail.com>
References: <20201203144227.418194-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
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

Hi,

Le jeu. 3 d=E9c. 2020 =E0 22:42, Chuhong Yuan <hslester96@gmail.com> a=20
=E9crit :
> jz4740_i2s_set_sysclk() does not check the return values of clk_get(),
> while the file dereferences the pointers in clk_put().
> Add the missed checks to fix it.
>=20
> Fixes: 11bd3dd1b7c2 ("ASoC: Add JZ4740 ASoC support")
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  sound/soc/jz4740/jz4740-i2s.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/sound/soc/jz4740/jz4740-i2s.c=20
> b/sound/soc/jz4740/jz4740-i2s.c
> index c7bd20104b20..0793e284d0e7 100644
> --- a/sound/soc/jz4740/jz4740-i2s.c
> +++ b/sound/soc/jz4740/jz4740-i2s.c
> @@ -312,10 +312,14 @@ static int jz4740_i2s_set_sysclk(struct=20
> snd_soc_dai *dai, int clk_id,
>  	switch (clk_id) {
>  	case JZ4740_I2S_CLKSRC_EXT:
>  		parent =3D clk_get(NULL, "ext");
> +		if (IS_ERR(parent))
> +			return PTR_ERR(parent);
>  		clk_set_parent(i2s->clk_i2s, parent);
>  		break;
>  	case JZ4740_I2S_CLKSRC_PLL:
>  		parent =3D clk_get(NULL, "pll half");
> +		if (IS_ERR(parent))
> +			return PTR_ERR(parent);
>  		clk_set_parent(i2s->clk_i2s, parent);
>  		ret =3D clk_set_rate(i2s->clk_i2s, freq);
>  		break;
> --
> 2.26.2
>=20


