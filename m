Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2662610B1
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 13:31:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EE181745;
	Tue,  8 Sep 2020 13:30:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EE181745
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599564700;
	bh=dZiCi6JaOitNKdZZfkk93OiaYYtathhtutFA3+IXcJU=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lhD1APNg7etE6+wbioE7bd9P1B9sklatqz+htObzpeHqkQrHsKJ4drYpN3WDCIWxZ
	 PYZWN/WiPY29qfrODGdimpTfLPG0PrWx3tKZDNdwRn4I+xTq7iXK19kR/+HJi1FEss
	 eXj4+d9K7DkR1i949wIr4yFiOyCKigStNYV2s/z4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CCF7F8015F;
	Tue,  8 Sep 2020 13:29:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21AD8F80264; Tue,  8 Sep 2020 13:29:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_78,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15C93F800FD
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 13:29:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15C93F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LVPDyF7W"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 088BTbKp126483;
 Tue, 8 Sep 2020 06:29:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1599564577;
 bh=e0j6wkjCZmuCUvQVcTS2u0sAT1MQelvmFOiUPg66fF4=;
 h=Subject:From:To:CC:References:Date:In-Reply-To;
 b=LVPDyF7WaGiJtdzMeMzobPwDnZ0Fo8dkfkOgI61HIAUtuvbDrA/OX9kOX8yKvPM/M
 DFyoyLVz6hu/+e2yyg9LublEHL/jnGx3RvQ1gohSbX03Bt/WkT4moSohFOH9d6irl9
 NRVX45/AiJf5Vk/euB10gHJyOUCRD3GIXekU3Osk=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 088BTb7c104998
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 8 Sep 2020 06:29:37 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Sep
 2020 06:29:36 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Sep 2020 06:29:36 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 088BTZ9P009977;
 Tue, 8 Sep 2020 06:29:36 -0500
Subject: Re: [PATCH] ASoC: ti: Kconfig: Allow the j721e machine driver to be
 used no K3 platform
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
References: <20200908112526.9853-1-peter.ujfalusi@ti.com>
X-Pep-Version: 2.0
Message-ID: <a0e749d5-efe0-6987-317c-3ad8870ee4ca@ti.com>
Date: Tue, 8 Sep 2020 14:29:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200908112526.9853-1-peter.ujfalusi@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org
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

Mark,

I have managed to add a typo in the subject, the correct one is:
ASoC: ti: Kconfig: Allow the j721e machine driver to be used on K3 platfo=
rm

Sorry, I'll resend
P=C3=A9ter

On 08/09/2020 14.25, Peter Ujfalusi wrote:
> The initial machine driver supports only j721e-cpb and the ivi addon, b=
ut
> other EVMs for different K3 SoC can have similar audio support which ca=
n
> be supported by the driver with small or no modification.
>=20
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
>  sound/soc/ti/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/sound/soc/ti/Kconfig b/sound/soc/ti/Kconfig
> index 1e6ab87e4460..9775393d46b6 100644
> --- a/sound/soc/ti/Kconfig
> +++ b/sound/soc/ti/Kconfig
> @@ -221,7 +221,7 @@ config SND_SOC_DM365_VOICE_CODEC_MODULE
> =20
>  config SND_SOC_J721E_EVM
>  	tristate "SoC Audio support for j721e EVM"
> -	depends on ARCH_K3_J721E_SOC || COMPILE_TEST
> +	depends on ARCH_K3 || COMPILE_TEST
>  	depends on I2C
>  	select SND_SOC_PCM3168A_I2C
>  	select SND_SOC_DAVINCI_MCASP
>=20

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/=
Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

