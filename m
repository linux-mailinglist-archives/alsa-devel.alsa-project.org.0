Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC58E32A258
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 15:18:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8169B1724;
	Tue,  2 Mar 2021 15:17:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8169B1724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614694705;
	bh=LleYcrOEL8Gdk2tU1UTiVFkiqctEHVkX/P47FtNk+54=;
	h=Date:From:Subject:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n1DWkznOF8tyqzXshKwNRZYx8Z7nPUGU3qOtcXZxYdVNKh9eiquOcXGNGGsN05i5D
	 uSlxG98TpB3fQ9ux2ucJqC554xV6R5Dv+jNpvvoUlq7Wy+bPNMGmUHoSk1VkkU9D7e
	 k39dJufr8htFQ4jtESOJCYmALzoA7AUmJIcf9QeE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 032F6F80271;
	Tue,  2 Mar 2021 15:16:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EA84F80269; Tue,  2 Mar 2021 15:16:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6B7BF8012D
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 15:16:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6B7BF8012D
Date: Tue, 02 Mar 2021 14:16:26 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2] ASoC: codec: Omit superfluous error message in 
 jz4760_codec_probe()
To: Tang Bin <tangbin@cmss.chinamobile.com>
Message-Id: <EBICPQ.45RCN3X3PJUR1@crapouillou.net>
In-Reply-To: <20210302135630.11456-1-tangbin@cmss.chinamobile.com>
References: <20210302135630.11456-1-tangbin@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, broonie@kernel.org
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



Le mar. 2 mars 2021 =E0 21:56, Tang Bin <tangbin@cmss.chinamobile.com> a=20
=E9crit :
> The function devm_platform_ioremap_resource has already contained
> error message, so remove the redundant dev_err here.
>=20
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Thanks!

Cheers,
-Paul

> ---
> Changes from v1
>  - to streamline the code.
> ---
>  sound/soc/codecs/jz4760.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/sound/soc/codecs/jz4760.c b/sound/soc/codecs/jz4760.c
> index e8f28ccc145a..5ae0e312bcfc 100644
> --- a/sound/soc/codecs/jz4760.c
> +++ b/sound/soc/codecs/jz4760.c
> @@ -841,11 +841,8 @@ static int jz4760_codec_probe(struct=20
> platform_device *pdev)
>  	codec->dev =3D dev;
>=20
>  	codec->base =3D devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(codec->base)) {
> -		ret =3D PTR_ERR(codec->base);
> -		dev_err(dev, "Failed to ioremap mmio memory: %d\n", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(codec->base))
> +		return PTR_ERR(codec->base);
>=20
>  	codec->regmap =3D devm_regmap_init(dev, NULL, codec,
>  					&jz4760_codec_regmap_config);
> --
> 2.18.2
>=20
>=20
>=20


