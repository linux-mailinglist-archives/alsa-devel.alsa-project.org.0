Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49186296E2C
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Oct 2020 14:07:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C930F1825;
	Fri, 23 Oct 2020 14:06:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C930F1825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603454857;
	bh=4cAo30qnQTv3GRrV0tupSdn/lOjecfre/ES4gVPpE68=;
	h=Date:From:Subject:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rkjsC7FWYZd1pfiEovvYYfL7QCxQ8Y2XaNARx9oenwY0Nz1/swsZV3+QJ3lkNdvvS
	 ZC/Mj3tfPN/sWKRXJwWckh0ZHBzenEJAcPMIKgHu3TW7Ckpq/5J+wRrzCndDaPq8GM
	 Wwg46JApPRNucO0Q/2w4QmghF24hunMPpV0QRPa0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 513E6F800BD;
	Fri, 23 Oct 2020 14:06:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F206F8025A; Fri, 23 Oct 2020 14:06:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F59DF80247
 for <alsa-devel@alsa-project.org>; Fri, 23 Oct 2020 14:05:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F59DF80247
Date: Fri, 23 Oct 2020 13:05:20 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] ASoC: jz4740-i2s: Remove manual DMA peripheral ID
 assignment
To: Lars-Peter Clausen <lars@metafoo.de>
Message-Id: <WKLNIQ.DWJDW3EA1DL8@crapouillou.net>
In-Reply-To: <20201023092346.5777-1-lars@metafoo.de>
References: <20201023092346.5777-1-lars@metafoo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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



Le ven. 23 oct. 2020 =E0 11:23, Lars-Peter Clausen <lars@metafoo.de> a=20
=E9crit :
> All platforms that use the jz4740-i2s driver have been switched to
> devicetree for a while now and the assignment of the DMA peripheral ID
> is done in the devicetree.
>=20
> It is no longer necessary to manually assign the peripheral ID in the
> driver, so remove that. The DMA driver does not even look at the value
> assigned in the driver anymore and always uses the value provided by=20
> the
> devicetree.
>=20
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  sound/soc/jz4740/jz4740-i2s.c | 5 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/sound/soc/jz4740/jz4740-i2s.c=20
> b/sound/soc/jz4740/jz4740-i2s.c
> index c7bd20104b20..e8bc7ca5ee5e 100644
> --- a/sound/soc/jz4740/jz4740-i2s.c
> +++ b/sound/soc/jz4740/jz4740-i2s.c
> @@ -26,9 +26,6 @@
>=20
>  #include "jz4740-i2s.h"
>=20
> -#define JZ4740_DMA_TYPE_AIC_TRANSMIT 24
> -#define JZ4740_DMA_TYPE_AIC_RECEIVE 25
> -
>  #define JZ_REG_AIC_CONF		0x00
>  #define JZ_REG_AIC_CTRL		0x04
>  #define JZ_REG_AIC_I2S_FMT	0x10
> @@ -377,13 +374,11 @@ static void jz4740_i2c_init_pcm_config(struct=20
> jz4740_i2s *i2s)
>  	/* Playback */
>  	dma_data =3D &i2s->playback_dma_data;
>  	dma_data->maxburst =3D 16;
> -	dma_data->slave_id =3D JZ4740_DMA_TYPE_AIC_TRANSMIT;
>  	dma_data->addr =3D i2s->phys_base + JZ_REG_AIC_FIFO;
>=20
>  	/* Capture */
>  	dma_data =3D &i2s->capture_dma_data;
>  	dma_data->maxburst =3D 16;
> -	dma_data->slave_id =3D JZ4740_DMA_TYPE_AIC_RECEIVE;
>  	dma_data->addr =3D i2s->phys_base + JZ_REG_AIC_FIFO;
>  }
>=20
> --
> 2.20.1
>=20


