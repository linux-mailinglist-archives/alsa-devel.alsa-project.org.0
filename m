Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 610B974F408
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 17:47:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4035AEE8;
	Tue, 11 Jul 2023 17:46:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4035AEE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689090459;
	bh=dBNdbzs+Xl9JdcmvVRYHsFhpWk8wJ0f0v1KEUvV5imQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Hap3+BbEuUIaJeFMq/lnEGKjvj4JLc32w8vMsxwCIypQ5bKuJVSlPGcHGlwCbjoQ7
	 JxuomZ/Q6kN2hcOPm7sW+93VamEfCSIHe4DxUyVt3/Yi4KoQIfKR6aFTWHjYZwBAS3
	 l65BvsIevt3SENqS/VLIUdrlh1fjiNT1AVEL3/Ls=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A349DF800E4; Tue, 11 Jul 2023 17:46:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BBBD1F80236;
	Tue, 11 Jul 2023 17:46:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E036F80249; Tue, 11 Jul 2023 17:46:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 10DB4F80153
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 17:46:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10DB4F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=UYS+7tIh
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3fbf7fbe722so66794855e9.3
        for <alsa-devel@alsa-project.org>;
 Tue, 11 Jul 2023 08:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689090375; x=1691682375;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSHzWr4gaLs4jyK9BMNn2YEQIAnAbtQY/+dliKHHYxs=;
        b=UYS+7tIh6u+ojy0oVfob+Sev7z0uPPCQbErkQpQk1O+aw22pl77XLL8DNQLpZ5C5VX
         dCLihQlJnJ2hS7roLef3cvntWUiIFWKvkGFPW37HzuzQzBMUXcgPXlBvk7JQt0jeFzRk
         GSF2ADgVJthd+Qi0UAOuuE2Gao+crsO42QZZBLl7v9vw5LYSUPEBMOa5vu5nXPXmLWqT
         nBEeunutG3xUBZx4X438J7tJP5tIhQ6J8b0ofwTJtF1nRUrQC9oKcUX5KUGBp6ll3BQG
         iP/pNUCvbqlB0OZVZCzt4a1wNWzPP7ox5rY6xj4Cu3w/cp7ojsfkbSK9AihF3dHbANXY
         V5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689090375; x=1691682375;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TSHzWr4gaLs4jyK9BMNn2YEQIAnAbtQY/+dliKHHYxs=;
        b=jndgXAgN2vrTKVe7IW8Kl5ch2kzEC54/LKWChPnYHWDM+uia6Q9xCmxTfPyVt1UZhT
         GTmKoU1YQgrvmYUO5calYy6TR+90QrWpblcHASHJJFWkEWSNx7gQsMjBRvMnpztSDVbD
         PV5JtOr4y2bcyFy9uznBVsUusX8Moy+iHBLS7Y4aEdARhTCnPKRU2ygBTPLWwrafoZCS
         drqflfICh18rFopKMWJhHHA7Z5/4X7WDw6JjkRD/LVSrqxByAl1jRInLkYfuKG5ybl4e
         i2BYg991HF/6nGA3wFvF7V0o4O5KE793lLrDVKxJ+gDhP3dBJXM/B5cGHmz3O/VHSVjY
         UW7w==
X-Gm-Message-State: ABy/qLZ6vGB6kuMhtyJBVFaZ1eULanK0Hx9rh4akBlS5Y79nsj5AYiQz
	2/RmpA1mTvOHtPYSYi1+cj8=
X-Google-Smtp-Source: 
 APBJJlHYOoGUWXHQEGRrv1wSYYMjVMio85ATQTXMSE8aJyyC4C8fPFL3liKN90fsUX65qG2C6jlrNQ==
X-Received: by 2002:adf:e290:0:b0:30f:c012:b529 with SMTP id
 v16-20020adfe290000000b0030fc012b529mr21025161wri.56.1689090374932;
        Tue, 11 Jul 2023 08:46:14 -0700 (PDT)
Received: from orome (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id
 g12-20020a5d46cc000000b0031455482d1fsm2568456wrs.47.2023.07.11.08.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 08:46:14 -0700 (PDT)
Date: Tue, 11 Jul 2023 17:46:12 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Yangtao Li <frank.li@vivo.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, alsa-devel@alsa-project.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] ASoC: tegra: tegra20_ac97: Use
 devm_platform_get_and_ioremap_resource()
Message-ID: <ZK15ROig1u7kaXfO@orome>
References: <20230711034846.69437-1-frank.li@vivo.com>
 <20230711034846.69437-5-frank.li@vivo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yrPPLIbhK53dQkQ8"
Content-Disposition: inline
In-Reply-To: <20230711034846.69437-5-frank.li@vivo.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
Message-ID-Hash: 7PUUV7ONYKERQAATTUTBQNOYOHEGZWZZ
X-Message-ID-Hash: 7PUUV7ONYKERQAATTUTBQNOYOHEGZWZZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7PUUV7ONYKERQAATTUTBQNOYOHEGZWZZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--yrPPLIbhK53dQkQ8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 11, 2023 at 11:48:45AM +0800, Yangtao Li wrote:
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
>=20
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  sound/soc/tegra/tegra20_ac97.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--yrPPLIbhK53dQkQ8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmSteUQACgkQ3SOs138+
s6GNFRAAoGU/u5P+4DbrdieXiUfZLIqdhM4uAmLJHkY7i7xuluvvsk35OBeA4Fj1
I4mpibVDYTja7Wx6j4C8BGr5B8kk1V0dOu4wk6gQaN4zjGb2tN8bkA7v8R/6saP+
OD3H/0t7ZZrtm/XDBD9R2Pv5gdbptYfwA/j5NpWwGSSc7iQ2gyInzbk0UKIrW4ci
6GEKBL3qYk2dhgyD3QgSnBQecfMbkzbGzcqyT+7P8axhjclJstTZs2dlozBIC2tf
L/Yd8n+S/3GfIH7oI0qgGbaPuoWqEmXgAL6dvddR8021kcQQJvnAl//w0EudtLXh
Ae/auR0eLEt9YklWLXWgEIoBmGvcdqvnE29vW885RS331+th29aK39oOfRptroBJ
FZ8MuXyUwDO0GQNkFIm6WyNuXmqxf9yzRfauGDDuPAlpPHe8plW2Zr+iTBMbjPp0
Y72o6OCRKLyBlECkT3xYxzOwDj5qcxGgChPxKTPgyYOZ3Etz6CWys3YO+Mn+0q3s
ilFNpaHpER/TkiWHaf1f1Afoszbic/DV/wBZf6zOZD8Ggfs6Q6QhaTJfGvUqBNVI
AqW5hC2Ya06qUrUpB5G+NR2/F+QX8VS0ub428mai6SUemlmYat8PvDlUMpWbj06p
JN7dyctd89Gxw+iiQgF9euFNixjCIha5XTgdXGny+Zp+802AJGQ=
=zwSX
-----END PGP SIGNATURE-----

--yrPPLIbhK53dQkQ8--
