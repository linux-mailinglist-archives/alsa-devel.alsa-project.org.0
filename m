Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBD0478AC6
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 13:04:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0FA22865;
	Fri, 17 Dec 2021 13:03:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0FA22865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639742640;
	bh=Tr5yIEZjQYZ2p+adwGkgkF8tDqXpc5OjOnc2gRNbi6o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Al0fhVaRRlBhTmjDPv9lnqG5NvLZK06CPXV2RfvDpb/ApFazvB5eGUgfSX+c991PN
	 RChbw4CpKJOxom2xL/dBO/5MkCF3QRg8UYVMV6UhGgmiq8pD0wL370BLLJP3LhpkuT
	 Db0L7F4Ur1eDnXm81TTUzO/kPiMkO/i+GXf7Oo+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43F38F80161;
	Fri, 17 Dec 2021 13:02:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13947F800F4; Fri, 17 Dec 2021 13:02:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B18FCF800F4
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 13:02:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B18FCF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WaFceP/6"
Received: by mail-wr1-x431.google.com with SMTP id c4so3568857wrd.9
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 04:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Tr5yIEZjQYZ2p+adwGkgkF8tDqXpc5OjOnc2gRNbi6o=;
 b=WaFceP/6+niHOPu1d/clw3GWr7WhtmO372bdP1SuJHU2qWfwWdGzTweDpjn0dDsF+U
 RN3pqpZP5gd9Ar1gU4E0C79SY1mcRC5xm8TjB+8S+B6EkUfMr+e+BSXVBOvPj+2F7XrT
 fcB8L2laS422LftltYamYC8scAZUzvI90T8cJGRxSezH7EnVgIO4VIo1a+O2Qu9yp1Ad
 4CArAkwOl6dZ85gRc+lSdKLOFBWuwYqh1UrywgAwkKfgPGbjymoEO1wgqCPcntDMNmxP
 pd7ccQoz3AfLSTE1FoAqEtU+1OE2AjRUWfmK/QNWDGypH+oS1SBDbH7mDNTh0et8rgaY
 NO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Tr5yIEZjQYZ2p+adwGkgkF8tDqXpc5OjOnc2gRNbi6o=;
 b=lvA5ckmh/nj4Lg5cKdqZMKrhPzkHCrPasf0Lz698awViFnCNVxJr63WJ3D7uEQexgQ
 1C5/alABkRk8lKsdCmhvrnHeAKVoNPRGu9abySOg42LxYNy/vSZmewVdqlnKN7VlzcDq
 dcZ2oqYG/ipythiMt9BwZz4v3++O94IQrz+jY/y7vyqvs7QNjefRCKx3RvsBaRWaSOht
 5RXvGxU8YarlslmFnmm+O7BjNC+KtNgAVGUSMV38Ucbfuv7IM3o5rlhs15T/hPMyYy8w
 X4m01ASSYf4rvXhdLtpHnh0zhWJRdOaEkPZOWWJ1FTWK9ScjNxDb390ANexSeYRB+3es
 eQ2g==
X-Gm-Message-State: AOAM5312yJyB4JYwOQ9xoc0XvGNN+eVvBbEIjEZx47Io85m/5EqQzzZp
 8BIKjEGriW6YTDVC9C6sZCI=
X-Google-Smtp-Source: ABdhPJw4ZQ3dUuPlJoFNie09ZzRDgUHAXf1rEhM78HrqZ7fZQsb18VvFg7K/ACzkxKgaYL2sk031Kg==
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr2294759wrd.114.1639742562100; 
 Fri, 17 Dec 2021 04:02:42 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id f8sm553090wry.16.2021.12.17.04.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 04:02:41 -0800 (PST)
Date: Fri, 17 Dec 2021 13:02:37 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 04/22] dt-bindings: host1x: Document optional HDMI
 sound-dai-cells
Message-ID: <Ybx8XdLGGiQsNMTq@orome>
References: <20211204143725.31646-1-digetx@gmail.com>
 <20211204143725.31646-5-digetx@gmail.com> <YbtLJeIxXlVyQhd3@orome>
 <Ybxwovlw2GARzqUO@sirena.org.uk>
 <4edfbff2-ffd9-1c33-de0c-013a29dc286c@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IXj1HCadON8JMIEA"
Content-Disposition: inline
In-Reply-To: <4edfbff2-ffd9-1c33-de0c-013a29dc286c@gmail.com>
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


--IXj1HCadON8JMIEA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 17, 2021 at 02:55:48PM +0300, Dmitry Osipenko wrote:
> 17.12.2021 14:12, Mark Brown =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Thu, Dec 16, 2021 at 03:20:21PM +0100, Thierry Reding wrote:
> >> On Sat, Dec 04, 2021 at 05:37:07PM +0300, Dmitry Osipenko wrote:
> >>> Document new optional sound-dai-cells property of HDMI node. This nod=
e will
> >>> be used as endpoint of HDMI sound DAI graph.
> >=20
> >> It's probably best for this to go through ASoC along with the other
> >> audio-related bindings.
> >=20
> >> Alternatively, I've just sent out a patch that converts the host1x
> >> bindings to json-schema, so I could work this into that as well.
> >=20
> > It doesn't apply to the ASoC tree for whatever reason so probably best
> > to roll it in with those JSON updates.
> >=20
>=20
> This hos1tx binding patch indeed will conflict with the Thierry's patch.
>=20
> Thierry, will you be able to take the binding patches into the Tegra
> tree and resolve all those hos1tx binding conflicts there?

Yes, I'll resolve all of those conflicts in the Tegra tree.

Thierry

--IXj1HCadON8JMIEA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG8fFsACgkQ3SOs138+
s6FWeg/9GfUWMsG7ET7lTWIluD+NlBnxKZMQQv2ePOl0oO/rXL1g7lHXKNCtqoPr
0P2+MNx6LDXX3zq7WJoP/Ts8RreqKqLh2VFVxPokNLjqq+2oOsNN4H/9Pvxl7Mul
KykMDqmDS0ZlohgxgQjNqwLW5EkwT43qjCWQV40GnI+SpNCMNgDlXMoqQBFE8reR
EQW3+gQ7i99YNHFRc+nhWsgDBBVJj89enFz/oiWp7krWeyaqfoUGvfB9KE1RCiOE
goq9Z9pgWxQVH5L2SWXWyAwh4xILuYbMs9pfifhMBEB39s37oE+jwXtlGpd2S5Pq
qyGmvgf41hDis7N2zZT85Z91vYrhlr/CA9GcePCJivYJ1avIbW8jvbFs22qpWciD
o0mf+WVo0AACdCgBuF1KTHdtU84b5Y9ZJO5GWk3RpVlbDFSFapg1v8x9xJhqLKh0
MvEa8dSjq2aoHs5fwOoGkJ5vVfyI9/11Cig0W2Np4gMc50QNXU0frOYdtyS5nkkr
UNNTtPRrgPXBmIlZ51cXbgMvmq6wBWfF/stgG77ng6KZaT+ImT1UH6FQNQ6d+VuA
FUOMdPVz1JvAQ9fygkKzntQMRLtT3D8W2TW5aVAffthBewy5+jCU18hbMOr/AmyD
ESy8QsQtlltZIOAhXm3i/2R0U1qAyHw0PTkXojmJey0W7RmpMow=
=9EvD
-----END PGP SIGNATURE-----

--IXj1HCadON8JMIEA--
