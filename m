Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAC926110A
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 14:01:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66A05176C;
	Tue,  8 Sep 2020 14:00:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66A05176C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599566481;
	bh=+2bvQTYaEMj1r0d1YkcFRCxnubM+u38i1mAVjLZlk4g=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RJS0Dvg+klWV9a3qWS4p6oHTi/RX1UpVvo1QfekOJu5QaBk3eYMxJ2ZcN+MfI+Cl0
	 6Mps1jlaAB2Y62FGYOsNH2pXBGzB9diU0LjXNnksNd4KaxoOpeGfSF8aUf2MeEUWIc
	 3WTTVIA9XWaDrClSN/kNxzOwZmt9LYYA9uaWnUZo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6667F8015F;
	Tue,  8 Sep 2020 14:00:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FEF1F80272; Tue,  8 Sep 2020 14:00:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_78,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63697F8015F
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 13:59:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63697F8015F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xlLdRIqa"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 088Bxpk5003236;
 Tue, 8 Sep 2020 06:59:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1599566391;
 bh=GHYJnMapkkdtwKbXaCf924QThmz/JpeI2hL/70NG150=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=xlLdRIqazwVVbzo7UeRzA2/7sMEVFq7YrBOd3qDrFyS4bBFAcKmwBXV2FraRpCHE3
 W8efGNVqWeo3YfMaB6LbtIvI/DNgAkYD8fuXwlUwLsRC/jyyDYbCSPxcKlt6PCzZzF
 yVvYn/xstctyldCJuCRHc9cqh/M+TvJH3haidCfY=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 088BxpDV112728
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 8 Sep 2020 06:59:51 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Sep
 2020 06:59:51 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Sep 2020 06:59:51 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 088BxmR5107470;
 Tue, 8 Sep 2020 06:59:49 -0500
Subject: Re: [PATCH 1/2] ASoC: tlv320adcx140: Avoid accessing invalid
 gpio_reset
To: Camel Guo <camel.guo@axis.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <tiwai@suse.com>, <dmurphy@ti.com>
References: <20200908083521.14105-1-camel.guo@axis.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
X-Pep-Version: 2.0
Message-ID: <7bb93489-dbd5-d1a5-5df6-e62470bd2252@ti.com>
Date: Tue, 8 Sep 2020 14:59:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200908083521.14105-1-camel.guo@axis.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, kernel@axis.com, linux-kernel@vger.kernel.org,
 Camel Guo <camelg@axis.com>
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



On 08/09/2020 11.35, Camel Guo wrote:
> From: Camel Guo <camelg@axis.com>
>=20
> When gpio_reset is not well defined in devicetree, the
> adcx140->gpio_reset is an error code instead of NULL. In this case,
> adcx140->gpio_reset should not be used by adcx140_reset. This commit
> sets it NULL to avoid accessing an invalid variable.
>=20
> Signed-off-by: Camel Guo <camelg@axis.com>
> ---
>  sound/soc/codecs/tlv320adcx140.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320=
adcx140.c
> index 7ae6ec374be3..597dd1062943 100644
> --- a/sound/soc/codecs/tlv320adcx140.c
> +++ b/sound/soc/codecs/tlv320adcx140.c
> @@ -984,8 +984,10 @@ static int adcx140_i2c_probe(struct i2c_client *i2=
c,
> =20
>  	adcx140->gpio_reset =3D devm_gpiod_get_optional(adcx140->dev,
>  						      "reset", GPIOD_OUT_LOW);
> -	if (IS_ERR(adcx140->gpio_reset))
> +	if (IS_ERR(adcx140->gpio_reset) || adcx140->gpio_reset =3D=3D NULL) {=

>  		dev_info(&i2c->dev, "Reset GPIO not defined\n");
> +		adcx140->gpio_reset =3D NULL;

the correct fix is to:
	dev_err(&i2c->dev, "Reset GPIO not defined\n");
	return PTR_ERR(adcx140->gpio_reset);

If the reset GPIO is specified and you get error when requesting it as
optional, there is a reason for that.
For example deferred probing.

> +	}
> =20
>  	adcx140->supply_areg =3D devm_regulator_get_optional(adcx140->dev,
>  							   "areg");
>=20

- P=C3=A9ter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

