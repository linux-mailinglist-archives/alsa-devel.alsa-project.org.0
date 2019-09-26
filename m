Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86055BF986
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2019 20:45:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B1B0176F;
	Thu, 26 Sep 2019 20:44:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B1B0176F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569523510;
	bh=1+XS9Fe7Wa/uoOKx58MZuv8M2bGoinFAgSbXmuimExA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WV1HDq/XOqX2c2CPeFAFVkhJ5947UxGcoocU362xFiu/yOzX1P0Dpdwk0zdFYqAIb
	 4wCm4feY2d4ujtB5vbFUgCc4++1jo4NCdP0F3ADTaaiS4aTUl+oAiu1qqbevahXp39
	 wN4nxZsMaE9yKvL5KvUSeX/e8JcPIa2vCi7zAoLQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64A75F8045F;
	Thu, 26 Sep 2019 20:43:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D644F803F4; Thu, 26 Sep 2019 20:43:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F40EF80138
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 20:43:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F40EF80138
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="oSdSPqNS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9pxSNyNmfZiT3djCXj3rcac0J+iDZI7xFpm9oqEfs/g=; b=oSdSPqNSLJDc4umz8eSiwSl9G
 c1BiukUR/sHNoy3gfFxQtH++AZ8UIwPFBxIOtZnSW4AmnplpJx5Zkm8XZ8zo7CRW16UESEsIMvag9
 KjtO0OFMiUhrCsJ2JmeSEXs8/x0qIOSjF84vkNm4r/N+YvyJm6prpWmS0fyOdJCeSlYpQ=;
Received: from [12.157.10.118] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iDYjX-0004Uc-UW; Thu, 26 Sep 2019 18:43:20 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 65C16D02DD8; Thu, 26 Sep 2019 19:43:18 +0100 (BST)
Date: Thu, 26 Sep 2019 11:43:18 -0700
From: Mark Brown <broonie@kernel.org>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Message-ID: <20190926184318.GF2036@sirena.org.uk>
References: <20190926071707.17557-1-nuno.sa@analog.com>
MIME-Version: 1.0
In-Reply-To: <20190926071707.17557-1-nuno.sa@analog.com>
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [alsa-devel] [PATCH 1/2] ASOC: Add ADAU7118 8 Channel
 PDM-to-I2S/TDM Converter driver
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
Content-Type: multipart/mixed; boundary="===============2580827850041757329=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2580827850041757329==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TWLMYU3k2ba4mEMM"
Content-Disposition: inline


--TWLMYU3k2ba4mEMM
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2019 at 09:17:06AM +0200, Nuno S=E1 wrote:

> --- /dev/null
> +++ b/sound/soc/codecs/adau7118-hw.c
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Analog Devices ADAU7118 8 channel PDM-to-I2S/TDM Converter Standalone=
 Hw
> + * driver
> + *
> + * Copyright 2019 Analog Devices Inc.
> + */

Please make the entire comment a C++ style one in the .c files so
things look more intentional.

> +	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> +	case SND_SOC_DAIFMT_I2S:
> +		ret =3D snd_soc_component_update_bits(dai->component,
> +						    ADAU7118_REG_SPT_CTRL1,
> +						    ADAU7118_DATA_FMT_MASK,
> +						    ADAU7118_DATA_FMT(0));
> +		break;
> +	case SND_SOC_DAIFMT_LEFT_J:
> +		ret =3D snd_soc_component_update_bits(dai->component,
> +						    ADAU7118_REG_SPT_CTRL1,
> +						    ADAU7118_DATA_FMT_MASK,
> +						    ADAU7118_DATA_FMT(1));
> +		break;
> +	case SND_SOC_DAIFMT_RIGHT_J:
> +		st->right_j =3D true;
> +		break;

Don't we need to set any register values here?

> +
> +	return ret < 0 ? ret : 0;
> +}

Please don't use the ternery operator like this, it just makes
things harder to read - write normal if conditional statements.

> +	case SND_SOC_BIAS_STANDBY:
> +		if (snd_soc_component_get_bias_level(component) =3D=3D
> +							SND_SOC_BIAS_OFF) {
> +			if (!st->iovdd)
> +				return 0;

This is broken, the device will always require power so it should
always control the regulators.

> +static int adau7118_suspend(struct snd_soc_component *component)
> +{
> +	return snd_soc_component_force_bias_level(component, SND_SOC_BIAS_OFF);
> +}
> +
> +static int adau7118_resume(struct snd_soc_component *component)
> +{
> +	return snd_soc_component_force_bias_level(component,
> +						  SND_SOC_BIAS_STANDBY);
> +}

Let DAPM do this for you, there's no substantial delays on power
on so you're probably best just setting idle_bias_off.

> +static int adau7118_regulator_setup(struct adau7118_data *st)
> +{
> +	int ret =3D 0;
> +
> +	st->iovdd =3D devm_regulator_get_optional(st->dev, "IOVDD");
> +	if (!IS_ERR(st->iovdd)) {

Unless the device can operate with supplies physically absent it
should not be requesting regulators as optional, this breaks your
error handling especially with probe deferral which is a fairly
common case.

--TWLMYU3k2ba4mEMM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2NBsUACgkQJNaLcl1U
h9DTSwf6A3j4WBOC0vVeOzs40lDzb88KcOkWvTA0Pt+vEUZ0DUHQ/AOX1GgN6Zh6
At4k18u+ptataFlScXDHRmrtEcz3Eu8n/gRTXvpifr6z/8EwVhvAMEu5PbL2zHqG
vpV3LE8V0HLflyp+e7V44W8MkLTm21G3xVTqnKEpxFkaUTm/V9nXXZFMHc5249tb
oyHXflE5Ykbp52INzLLjkcIAsg8znpl+RFezGG1GmU8arFGMmnxmMc4Dc+owEC9p
eaXVLp0KTPw+J3h6ajs8jSffq9IxT+124gSvooJoJo009cRjSNP83OHKwdoyLFxc
fbPqwfsORdF+ZnG8k0XqhLjiGYZYWQ==
=3zRw
-----END PGP SIGNATURE-----

--TWLMYU3k2ba4mEMM--

--===============2580827850041757329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2580827850041757329==--
