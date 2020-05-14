Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA061D3677
	for <lists+alsa-devel@lfdr.de>; Thu, 14 May 2020 18:28:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 271D81664;
	Thu, 14 May 2020 18:27:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 271D81664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589473691;
	bh=3tQMkHhoVztKkKRRVF5ZVpYwB1FwS5ftr57Y2afh9zk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kxtXmxDiB+RccliUMBu5nb/E0d0yxkXicT4PurmTO4kXBJ2curxp5fzvofg36BIQ2
	 A7/mVQj1fTXhWdgOc3BYTDN7rD/sszllvT1Qsj5f1tw/25hhqHGsGRV1qSfGys7HmH
	 JBPuua6VSnxcd/CQ/v4sBTU1ut3BUbJ5EqGU/XEM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AC37F8015A;
	Thu, 14 May 2020 18:26:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 743DAF80158; Thu, 14 May 2020 18:26:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66C85F800BD
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 18:26:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66C85F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="EhfQsBlW"
Received: by mail-pj1-x1044.google.com with SMTP id ms17so12666475pjb.0
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 09:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=W4XvXtxke+lkFw8YZgubPXEhN0ECtCJuhCB6hnz9mNE=;
 b=EhfQsBlWH2MLjxrrlmnGGUCb3XEHUHj9vd9gidlZQlONXFzF0Ft6PJeF0xG8MaSIZ0
 VzJSt4gMrdCE+aWMvJzDsjPVQNUOtr73C/1pndt8Qspz+o/7xXJFDmWe18acX37cw0+P
 bQj9AYmc6HrarSF4OpJ92uXwUu7JoYrY+p+cMK9wYRSCzDg/nP5YkNlITU1/neTC6Ln+
 fo62L9y4QhvhCON4mlY3aW9VZYpceNb+faQYidVvCd8b/HJYlcUu21J4DIf33CnKPCMP
 bUmBXNlvFkER/oKK6jz1wzP98qlJcgO8s0xxP0W32o0IBfJP4CxJIE9LCSf/QvF4nEv7
 XgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=W4XvXtxke+lkFw8YZgubPXEhN0ECtCJuhCB6hnz9mNE=;
 b=rRR9UiKY6Ddtaa07bZtfRgoIUngoCqN5iNlwAj5+1UYuYmb3riA8y2WchXYwcg/3JJ
 WgxV5y0cvGTPclC7BBHUPsSQ/CPS5zfeVvw/tMhA2Zirqy+8guhS8FndxAwbso77z8Bf
 DQ07Y1luFSkWXuH3Yp4d6PZ1H5DqENwWSeoDxzeQYdA7bjtdBy6PyJq/Ef43eLZBqJuT
 pele6sFkZ3PA/Ukde1vAQce6gw65QPD6V93H5OgHLPUvkqtMxKb4LKw1/Oh6YpdgvVEq
 r0jIRZOBpjudeNxzZggvsUN2FrBhwteL/N4WYtKS8MH+1LO6JhDnUQ+u8jScBgxkOuLl
 Tl0A==
X-Gm-Message-State: AGi0PuZIqLtPEEAl4IfVjHAMMwcPIif0WF/8PwDBLxe9Aq77ajf1jWuI
 Mm/rtCSX6R3FYVvbyeYlRUTdNA==
X-Google-Smtp-Source: APiQypLPWQUYjiu3Whv0kH/7282+rbP9bEmz66yea12ZTjwnuVDBCwCM/A2XBVKch9fwZZzdYMjd4A==
X-Received: by 2002:a17:90a:7065:: with SMTP id
 f92mr40510489pjk.160.1589473557884; 
 Thu, 14 May 2020 09:25:57 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:bc61:d85d:eb16:9036])
 by smtp.gmail.com with ESMTPSA id a2sm2646045pfl.28.2020.05.14.09.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 09:25:54 -0700 (PDT)
Date: Thu, 14 May 2020 09:25:48 -0700
From: Benson Leung <bleung@google.com>
To: Ard Biesheuvel <ardb@kernel.org>, tzungbi@google.com
Subject: Re: [PATCH] SoC: cros_ec_codec: switch to library API for SHA-256
Message-ID: <20200514162548.GA141824@google.com>
References: <20200514161847.6240-1-ardb@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline
In-Reply-To: <20200514161847.6240-1-ardb@kernel.org>
Cc: alsa-devel@alsa-project.org, Herbert Xu <herbert@gondor.apana.org.au>,
 Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Eric Biggers <ebiggers@kernel.org>, Guenter Roeck <groeck@chromium.org>,
 Mark Brown <broonie@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@chromium.org>, Cheng-Yi Chiang <cychiang@chromium.org>
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


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ard,

On Thu, May 14, 2020 at 06:18:47PM +0200, Ard Biesheuvel wrote:
> The CrOS EC codec driver uses SHA-256 explicitly, and not in a
> performance critical manner, so there is really no point in using
> the dynamic SHASH crypto API here. Let's switch to the library API
> instead.
>=20
> Cc: Cheng-Yi Chiang <cychiang@chromium.org>=20
> Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Eric Biggers <ebiggers@kernel.org>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
> Looking at the code, I was wondering if the SHA-256 is really required
> here? It looks like it is using it as some kind of fingerprint to decide
> whether the provided file is identical to the one that has already been
> loaded. If this is the case, we should probably just use CRC32 instead.
>=20
> Also, do we really need to wipe the context struct? Is there any security
> sensitive data in there?
>=20

Adding Tzung-Bi Shih <tzungbi@google.com> to help answer these, as these
were added as a part of his change here:
 b6bc07d4360d  ASoC: cros_ec_codec: support WoV


Thanks,
Benson

>  sound/soc/codecs/Kconfig         |  3 +--
>  sound/soc/codecs/cros_ec_codec.c | 21 +++++---------------
>  2 files changed, 6 insertions(+), 18 deletions(-)
>=20
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index e6a0c5d05fa5..c7ce4cc658cf 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -537,8 +537,7 @@ config SND_SOC_CQ0093VC
>  config SND_SOC_CROS_EC_CODEC
>  	tristate "codec driver for ChromeOS EC"
>  	depends on CROS_EC
> -	select CRYPTO
> -	select CRYPTO_SHA256
> +	select CRYPTO_LIB_SHA256
>  	help
>  	  If you say yes here you will get support for the
>  	  ChromeOS Embedded Controller's Audio Codec.
> diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_=
codec.c
> index d3dc42aa6825..6bc02c485ab2 100644
> --- a/sound/soc/codecs/cros_ec_codec.c
> +++ b/sound/soc/codecs/cros_ec_codec.c
> @@ -107,24 +107,13 @@ static int send_ec_host_command(struct cros_ec_devi=
ce *ec_dev, uint32_t cmd,
>  static int calculate_sha256(struct cros_ec_codec_priv *priv,
>  			    uint8_t *buf, uint32_t size, uint8_t *digest)
>  {
> -	struct crypto_shash *tfm;
> +	struct sha256_state sctx;
> =20
> -	tfm =3D crypto_alloc_shash("sha256", CRYPTO_ALG_TYPE_SHASH, 0);
> -	if (IS_ERR(tfm)) {
> -		dev_err(priv->dev, "can't alloc shash\n");
> -		return PTR_ERR(tfm);
> -	}
> -
> -	{
> -		SHASH_DESC_ON_STACK(desc, tfm);
> -
> -		desc->tfm =3D tfm;
> -
> -		crypto_shash_digest(desc, buf, size, digest);
> -		shash_desc_zero(desc);
> -	}
> +	sha256_init(&sctx);
> +	sha256_update(&sctx, buf, size);
> +	sha256_final(&sctx, digest);
> =20
> -	crypto_free_shash(tfm);
> +	memzero_explicit(&sctx, sizeof(sctx));
> =20
>  #ifdef DEBUG
>  	{
> --=20
> 2.17.1
>=20

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCXr1xDAAKCRBzbaomhzOw
wm2jAP4kO1FFCCXNgm5NyDP1DEpmvIyrkpCH7e2fuQJNJW96bQEArMH8F8xDXc5f
O3B2FNvv5cSrcQ/XjqWIPfh+9//g7Qg=
=1okQ
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
