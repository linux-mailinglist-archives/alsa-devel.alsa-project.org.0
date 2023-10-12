Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD757C75A1
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 20:06:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5407F839;
	Thu, 12 Oct 2023 20:05:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5407F839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697133963;
	bh=7KsOpJq0UTg4bRkoCNsGsVXSkD9nVg1SYf7bxbhBtWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Emx34mPa8+1CE5TlZOlE2IfuQ/YlPSIlVfpPmaOpmU1TSwahBVHa1RXoFNXm6LNEe
	 f+m2CftIl+Dv4q9vYs7CIBSl28uMq9UpBPeLmdqR3+PKXX29uI6Bhh+3br67ru+dQT
	 CslY2+RijVL8jtha5YWidl3htNEM0wxz4/siu4Pw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1871F802BE; Thu, 12 Oct 2023 20:05:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A151F8027B;
	Thu, 12 Oct 2023 20:05:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79D92F802BE; Thu, 12 Oct 2023 20:05:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E250EF8015B
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 20:05:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E250EF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Nz18Y4lW
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-53e08e439c7so1809607a12.0
        for <alsa-devel@alsa-project.org>;
 Thu, 12 Oct 2023 11:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697133903; x=1697738703;
 darn=alsa-project.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfIb1D07nfI+0Ch1761SwKK3aO/nbsGIC751epSoaTc=;
        b=Nz18Y4lWR1JAgiKCAHNv90ZvZCi/wEdaCIjLwHHml8DKr91NemODxtwhb8jq6lnDj/
         EtDuciBlvdJ2HyiA4qJqg3XkNhtbVCas1YujLAnOEbofT9t7z/RA91BK2p+9qBNVR0DQ
         OO7xgLnrcTC5ta3if19+LNvs9hfWrk0PwCUv6QL9INkhbOmDszm019UMVGniP4W9frRK
         g7NMnOxN13UABTr8XjyOV9dCT11kJhWFvB9z8xhZJfxF6FHw9a44pwuLklxHLvikf2+1
         8cXdOn/4wCSH3oU3aFMRiHc8/5aRzkTatptQ+/RqVnRpDUzbXCRl8J2vzT8MnegppNYD
         /cFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697133903; x=1697738703;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QfIb1D07nfI+0Ch1761SwKK3aO/nbsGIC751epSoaTc=;
        b=Km3yDrdfK69H9MkRYu1PXRa21vgIKA2ATmuBddb5GSq8vAKfwdgzcmVeAcSbfGsr6p
         aeHxZ/eHO49egs4Xg4l8Sa45i4y1Khx2OGZWDRljVAMocgIlceVWt3Ydg1OY+ky9MoPG
         qe2SReu7HXeqAGHXkLxGthNUh7SySaZNMvk4d/ggx2wqaUY+EbhwKWxuyit4l8mud9Cv
         4D/xbEcqf3taDz627UKugtoebSP7yOGNVKYmgLwQC8sTm+Kh9t/lSa/vI6rAJfU5dzxD
         q81J+SlR7ZFhHtaqFIrtNYIv71+ddU7aBVAleOb4iy4YeB9ONSmfxCh6HonOMp7H0bNb
         w4uA==
X-Gm-Message-State: AOJu0YxMzwP+KiZovKHUuovlyFL8EuviuRvOQuJ465l37+kkqf3k8tuD
	d951Mxekxrn9rWX6qbtmSaiVE6hV5fY=
X-Google-Smtp-Source: 
 AGHT+IFdStcd3c2GGinYpRXye7AwYjUTLBoOWruKg6//W80bNpLA3+vpu34T9qw3GrF5BXwkZ696Ig==
X-Received: by 2002:a17:906:310b:b0:9ae:5765:c134 with SMTP id
 11-20020a170906310b00b009ae5765c134mr22622471ejx.15.1697133902720;
        Thu, 12 Oct 2023 11:05:02 -0700 (PDT)
Received: from orome.fritz.box
 (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id
 a24-20020a170906685800b009828e26e519sm11289137ejs.122.2023.10.12.11.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 11:05:02 -0700 (PDT)
Date: Thu, 12 Oct 2023 20:05:00 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: broonie@kernel.org, robh@kernel.org, lgirdwood@gmail.com,
	jonathanh@nvidia.com, ndesaulniers@google.com, trix@redhat.com,
	alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
	llvm@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH] ASoC: tegra: Fix -Wuninitialized in
 tegra210_amx_platform_probe()
Message-ID: <ZSg1TEvIMu2qDzhm@orome.fritz.box>
References: 
 <20231011-asoc-tegra-fix-uninit-soc_data-v1-1-0ef0ab44cf48@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="edj+BPVW5o8cXPI2"
Content-Disposition: inline
In-Reply-To: 
 <20231011-asoc-tegra-fix-uninit-soc_data-v1-1-0ef0ab44cf48@kernel.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
Message-ID-Hash: NXRM6F3WQRGJWA74GA76Y224Z2CNAAMS
X-Message-ID-Hash: NXRM6F3WQRGJWA74GA76Y224Z2CNAAMS
X-MailFrom: thierry.reding@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NXRM6F3WQRGJWA74GA76Y224Z2CNAAMS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--edj+BPVW5o8cXPI2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2023 at 01:21:51PM -0700, Nathan Chancellor wrote:
> Clang warns (or errors with CONFIG_WERROR=3Dy):
>=20
>   sound/soc/tegra/tegra210_amx.c:553:10: error: variable 'soc_data' is un=
initialized when used here [-Werror,-Wuninitialized]
>     553 |                                             soc_data->regmap_co=
nf);
>         |                                             ^~~~~~~~
>=20
> A refactoring removed the initialization of this variable but its use
> was not updated. Use the soc_data value in the amx variable to resolve
> the warning and remove the soc_data variable, as it is now entirely
> unused.
>=20
> Closes: https://github.com/ClangBuiltLinux/linux/issues/1943
> Fixes: 9958d85968ed ("ASoC: Use device_get_match_data()")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  sound/soc/tegra/tegra210_amx.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

I see that Mark was quicker and this is already applied, but just for
the record, this fixes an OOPS that I started seeing recently but hadn't
gotten around to look at more closely, so I guess:

Tested-by: Thierry Reding <treding@nvidia.com>

And thanks!

Thierry

--edj+BPVW5o8cXPI2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmUoNUwACgkQ3SOs138+
s6FvjxAAsd5bwFFR8vGCLIUjLqquDW0xtQm0nZacYaJmO059dJTozlND+izhpVvt
wwh1GxcniMG5Qg55FmxG82icd4V+3JmtKvCjSx32DO0CsdlOUg/JHTwifRI8mr2d
9a45DaeInh8pCQpYiEf3EjPZ+vuoDH0YKivuJwL+UGcCTzWyuA4Aoh8NciHJASQw
4Bwc3uq4dmvS/Ax2DgUO3/9hY0nEHT6o0Ke9xyPeQ+ZlBi9m304dY7Y53jNi8IWG
p8BF62VBiLqDh3icmqFTVd7NuBdkhjDP3BFvv8WjKssC5dv/e+/3wZT6od4EBK3j
ru+ZTDwzkx7sOuaS+UZ01D49LjCRS9Jq64XJxe1vUo5w97w297KanCgCIMo5AFQA
brqk8n9t9EluL2hgSlT7PidybAvsFO59dfhh+IraBhKUIe0j1gmFLtqU6UIVGosb
PoMqiQyuW29sLUABzGQY3zus38U8XI64DQC+nqAsrsvpSkwk5KgRdDqJ5DYhqVE1
qbFzPC9ONgM21oDzSybEuN1hDG1fHhhrLg8vMjWTjyDQInsv0J+vpobpnzuAdhOX
qVxYan5FyZThbet9v2/s/fK50P5S1+a9ShKSLlNkpAw9MLTrepd/SP9w7cw2ZLF2
TGp2g902Pnle5sSbNPqTYrtbEx1+lnhCpJvee8+Uf3WwrTzZbAc=
=WcBW
-----END PGP SIGNATURE-----

--edj+BPVW5o8cXPI2--
