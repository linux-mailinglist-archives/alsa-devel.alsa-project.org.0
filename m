Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 051334775A4
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 16:18:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A572C206C;
	Thu, 16 Dec 2021 16:17:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A572C206C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639667909;
	bh=lc9SqFkj4mlwVbh/lJbUNItNJeduVmhAe/GEubRD6cs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RDG1fsO2tfa5eJxBK+YVp9QQBkXPFWTQNJVIJMKTc8FzU/TBX6GlaQFHp4dt0z/3y
	 jCl7im+gPv0Nesbr64l8f3vEguha5AV7DR5MmuEZsu/ACTAyGLGpZw6lSJuZV9QPm+
	 YYNzt9yOX/mYmQsktQY89UmKeFGWHtjYvYl6Do1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E534F8025D;
	Thu, 16 Dec 2021 16:17:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C770F8016E; Thu, 16 Dec 2021 16:17:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4EB6AF80116
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 16:17:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EB6AF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="OIj/txpP"
Received: by mail-wr1-x430.google.com with SMTP id t18so44754084wrg.11
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 07:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=d6dLbnkWK7wNE8BZGENwCf0S7oFVX0y+/nWXJ0NqB44=;
 b=OIj/txpPhui1n8Zu81sY/T4F6cuXcTDjXRyO2n5RabwA9LcJji2dGTyK5EuuLhyfcn
 4KKS8gyGDDsyNp4o3Bej4bqOKKeEwGZK61rfen/XabhIE2j2VhoYv+zGzn9xOn77a0Tk
 RExON7YRNsIeK/LuVD1jqDobD8HroRDYZsQY0dzXVwICINp8HFXfih3X7DvLKGr4a8Hg
 xg/Ps7RcQenDfXHyb02SkCv+xcvfm6uZ7EE4iK/qzKzX9shIYSwZcek0pwE0z2R0yTFT
 q3QOP8R13xQBTSSr+H/lvevRYEHT0x6oAt+sPxll4s6NMcosb3wmLF6i5HMCN8j2kulq
 e9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=d6dLbnkWK7wNE8BZGENwCf0S7oFVX0y+/nWXJ0NqB44=;
 b=7I1HFhVEn4NlvqBWQ5wS1kr/ZfFb+7uKyPSTESwuAB++gBuvZcIwSbZ+qZiEKmGeMs
 t8VfPzGrExKvdhg8MK2x+Kt6lnr/slQfRJ/zS9KLOjCkE2KlXwGRjiJ3qkdkcVGLziIS
 oHZRPUJB5FzYyU2hFmN9fP0EpeF5JzVfe69NXAcQUK13I+0sByGeQGMWUW6Cu2Tw8UVT
 lRdT0Wb62ypMJXG36ZykBNtiefyDghCgjA+uzhuevaXLxuCNpxwbA0QUTM6wkayEt4pi
 gziSI8nygUPchWhpWejw638scdcpd+K14PJCUaMi7o4ns6UMx1/M8lm6mTPNgA8/07fF
 3m1A==
X-Gm-Message-State: AOAM5318NZ6rQNNZZHHZknkYBKaK3NPV83LpASBK3YtKK2XGjQKHib3w
 /NhvL8anJAV3e05Esl8A1b2tahU/C80QHg==
X-Google-Smtp-Source: ABdhPJzd1jZbXWBpkRK3RaJ+dWeSpECIxOBJmwQ33RK5mfrBb45RfR3elrOFN3Tu9n7HBjiNf+iOfg==
X-Received: by 2002:adf:d1a6:: with SMTP id w6mr6055630wrc.274.1639667850594; 
 Thu, 16 Dec 2021 07:17:30 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id f13sm48343wri.51.2021.12.16.07.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 07:17:29 -0800 (PST)
Date: Thu, 16 Dec 2021 16:17:26 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 07/22] ASoC: tegra20: spdif: Support device-tree
Message-ID: <YbtYhhvse0sxhKxe@orome>
References: <20211204143725.31646-1-digetx@gmail.com>
 <20211204143725.31646-8-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uzk6upfeauAzdoAz"
Content-Disposition: inline
In-Reply-To: <20211204143725.31646-8-digetx@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Agneli <poczt@protonmail.ch>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>
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


--uzk6upfeauAzdoAz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 04, 2021 at 05:37:10PM +0300, Dmitry Osipenko wrote:
> Tegra20 S/PDIF driver was added in a pre-DT era and was never used since
> that time. Revive driver by adding device-tree support.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  sound/soc/tegra/tegra20_spdif.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--uzk6upfeauAzdoAz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG7WIYACgkQ3SOs138+
s6GK9A//Y7Tw6WHpypYImYoTs7lxJ39hjjAQ1y3UpH/iunNkSxkFtezdQ9Fivimn
1ypvgQTPgGhT77FCiLUAizaw0Z/5tyBZEr4lALU/l+uhH1WAbf7NgqFvY+TyoGRL
a//yFoxqGafUCEmE3cduDo/2BsdxeJ4crpht/T/oyCJkFzDzFzvFBRZ8CjlcOO7H
eho0IEHSusZk5lZlj1xLAPBnEQRheEFid0xmYObmS16Dt2ZrgmXQc8xsI9NoJFnV
5VPF8uhvdncyM810Z7hQT7wDM4Tyj7RnQYhJ/zcoBFgB7ujP/i4FttWKBdhFjElN
ZqHUhQcTaQBiV2dgDYhZo+l3S0g8bZrvntQ5Aedjn+bprfZ9MpEMoJP9MdW3ynem
6zaEzul5jF6R2rPk/4XtkVjTFUzHKatocrIsOOJR10vFravNus2g7Pd2G5JuIXok
iZGGPWuX3UvVPtkWsfsUQ0SwKUkY8sB9RlCiDxB2jh61ikc1aPy5Z21Qpwd1pWSq
ma1fOp00317zZkLkCNMGgd3vEx7mbqt9E53hK42n0pSp73ggVfkKsNLskIRHYa1+
YHSIdA5GAtXjaQ+2kRFPo3H9OQkEMGTCEYoJsaHZR8+EcVTXvAJtVwNtbPyyqMuX
oaV6IXZcOEPoQVa68Lanf2Xm/kqnxGaAgqrhGZX5eTeZjJ76qv0=
=G20c
-----END PGP SIGNATURE-----

--uzk6upfeauAzdoAz--
