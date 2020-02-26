Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBAB16FEF3
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2020 13:28:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D2FD168B;
	Wed, 26 Feb 2020 13:27:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D2FD168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582720090;
	bh=VPJngg7C2avbMeb4L65drmcQvZ+4VqbZDWVG175EJMw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nbLsUEdqhwmKABTmym9FCHDpoODQM/P4/AgiX6gy0vKWst7aQnI8DEoN8/F8HzIzK
	 Jr29Y7Bwgv6n7cUG/cmGruE9ITu2Ob3rHVhtiXgJ9STgdAfZWwaWJu2yMJ4qhZDFBu
	 t75rxbhQ+KGj8QcSdtLtz8ETX5b/nnQmMhCdLcUg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43DEFF8014E;
	Wed, 26 Feb 2020 13:26:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07167F8014E; Wed, 26 Feb 2020 13:26:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 0AAEFF800AD
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 13:26:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AAEFF800AD
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A6291FB;
 Wed, 26 Feb 2020 04:26:21 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 92A363FA00;
 Wed, 26 Feb 2020 04:26:20 -0800 (PST)
Date: Wed, 26 Feb 2020 12:26:19 +0000
From: Mark Brown <broonie@kernel.org>
To: jack.yu@realtek.com
Subject: Re: [PATCH] ASoC: rt1015: modify some structure to be static and add
 operation callback function for rt1015_dai
Message-ID: <20200226122619.GF4136@sirena.org.uk>
References: <20200226022827.3262-1-jack.yu@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lIrNkN/7tmsD/ALM"
Content-Disposition: inline
In-Reply-To: <20200226022827.3262-1-jack.yu@realtek.com>
X-Cookie: May all your PUSHes be POPped.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lars@metafoo.de,
 kent_chen@realtek.com, kenny_chen@realtek.com, lgirdwood@gmail.com,
 derek.fang@realtek.com, shumingf@realtek.com, mingjane_hsieh@realtek.com,
 flove@realtek.com
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


--lIrNkN/7tmsD/ALM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2020 at 10:28:27AM +0800, jack.yu@realtek.com wrote:
> From: Jack Yu <jack.yu@realtek.com>
>=20
> 1. Add "static" for rt1015_aif_dai_ops.
> 2. Add "static" for rt1015_dai[].
> 3. Add operation callback for rt1015_dai[].

Please don't send multiple changes in a single patch, split them up into
separate patches - the callback certainly seems like it needs to be in a
different patch.

> @@ -664,7 +664,7 @@ static int rt1015_hw_params(struct snd_pcm_substream =
*substream,
>  	snd_soc_component_update_bits(component, RT1015_TDM_MASTER,
>  		RT1015_I2S_DL_MASK, val_len);
>  	snd_soc_component_update_bits(component, RT1015_CLK2,
> -		RT1015_FS_PD_MASK, pre_div);
> +		RT1015_FS_PD_MASK, pre_div << RT1015_FS_PD_SFT);
> =20
>  	return 0;
>  }

This doesn't seem to be mentioned in the changelog and should probably
also be a separate patch?

--lIrNkN/7tmsD/ALM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5WY+oACgkQJNaLcl1U
h9DsWwf/dQs3poLbJP9axq+2cvAoRIyxFY8WC88OOIVrhUISwukxxqKurxx1aBgi
u7A8/WqTFpjxMjxhcnvzqkgVJjE/XK9Qzt8ffDSw/NuEyhpwJcJSSAzx9vfOshRm
/792hgCFcAQ4MSzLrw5LBkKhvlpjaZ+injT42QZSvk6mWHI3WQXsKxiLZALS+HIt
fi6t3ML+GYdzpiHFPyWF4WDIRgA6YFy18z+u4vO9G/sA/yUNz2VyPHI1tWS+3udr
DEyTjwKsRtroqaj8N84D1QjOrmF40jZqTmf5oiYa4gig//efZxSwILL7IhVBR7N6
xBHGM4m9ZSE1SpM8iiBBXSyeU1ppRA==
=jZrK
-----END PGP SIGNATURE-----

--lIrNkN/7tmsD/ALM--
