Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CA6370BAD
	for <lists+alsa-devel@lfdr.de>; Sun,  2 May 2021 15:47:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3424E1688;
	Sun,  2 May 2021 15:46:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3424E1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619963253;
	bh=goODy2ccIuxNtD5GjR+NYOmFv6RMoFinwn3pp0dDtZc=;
	h=Date:From:Subject:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K/WlRAO+MBMEjzbp4wchLqGWM7aHwGB7PLhl4ReM3VoXZ8tFh2o/yi+ieLltFATTG
	 ZEzN75pCn0Tmjv3LO7UMDlf6Wu9vrJfaof1ZqzbVwXpMSLflYC+yvNJACc1J1/bPly
	 IoQGW6JyiGjcahn1mQqcIFVJUmtTxGeNAeS9xeqc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D94FF80162;
	Sun,  2 May 2021 15:46:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BC29F8021C; Sun,  2 May 2021 15:46:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32BB9F80163
 for <alsa-devel@alsa-project.org>; Sun,  2 May 2021 15:45:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32BB9F80163
Date: Sun, 02 May 2021 14:45:43 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] ASoC: jz4740-i2s: fix function name
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <7KFHSQ.0D5Z90AZRGJV@crapouillou.net>
In-Reply-To: <56f9c8518870263698b00d10de4821d2dc8932be.1619960935.git.hns@goldelico.com>
References: <56f9c8518870263698b00d10de4821d2dc8932be.1619960935.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, letux-kernel@openphoenux.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>
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



Le dim., mai 2 2021 at 15:08:55 +0200, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> This driver is not related to I2C protocol.
>=20
> s/_i2c_/_i2s_/
>=20
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  sound/soc/jz4740/jz4740-i2s.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/sound/soc/jz4740/jz4740-i2s.c=20
> b/sound/soc/jz4740/jz4740-i2s.c
> index 47d955c0bb6a1..fe5b3a2b239c6 100644
> --- a/sound/soc/jz4740/jz4740-i2s.c
> +++ b/sound/soc/jz4740/jz4740-i2s.c
> @@ -372,7 +372,7 @@ static int jz4740_i2s_resume(struct=20
> snd_soc_component *component)
>  	return 0;
>  }
>=20
> -static void jz4740_i2c_init_pcm_config(struct jz4740_i2s *i2s)
> +static void jz4740_i2s_init_pcm_config(struct jz4740_i2s *i2s)
>  {
>  	struct snd_dmaengine_dai_dma_data *dma_data;
>=20
> @@ -397,7 +397,7 @@ static int jz4740_i2s_dai_probe(struct=20
> snd_soc_dai *dai)
>  	if (ret)
>  		return ret;
>=20
> -	jz4740_i2c_init_pcm_config(i2s);
> +	jz4740_i2s_init_pcm_config(i2s);
>  	snd_soc_dai_init_dma_data(dai, &i2s->playback_dma_data,
>  		&i2s->capture_dma_data);
>=20
> --
> 2.26.2
>=20


