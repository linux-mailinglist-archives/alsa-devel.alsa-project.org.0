Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0E047759F
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 16:17:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E04F52078;
	Thu, 16 Dec 2021 16:16:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E04F52078
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639667869;
	bh=y5DGc89gb7N3+SiD0yFVM9Gd8Bm77MOSx0k8IRjcMvo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DDFQPhUPmNCeGmRpPtezwSDvUdH0d1BypW/CNe/Dt2H7ESYCvRerl9ckMnyJiB0FC
	 Ky3Bpb6FWfeFglITbnH0A1y71k5NCHgvV2HQ9+JeGsYlKlzaXEzKgI9JuA5pFIWNXB
	 c7exljGafFYFXQesrc+ZPoi1BAXknB7VEeIdoyoc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC30EF800DE;
	Thu, 16 Dec 2021 16:16:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB019F8015B; Thu, 16 Dec 2021 16:16:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92EA7F800DE
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 16:16:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92EA7F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GZcyGrES"
Received: by mail-wr1-x430.google.com with SMTP id a9so44799279wrr.8
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 07:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YY9FZgJmPcsrvv1dDjxqyVtz1nIgdkKk67xLM0ZtgAc=;
 b=GZcyGrESDUijhcGlmAgDyEACRWE72v4x7GWiBc6yS2aH74dRCA1Y3+gZd+icRAsgk/
 jbEcpMe5d5KSkMbBICkq/rqdm7In9kQza4dIWoDlt2lPrFbK3yY4LA8oGN5UKwJqj1Dt
 YaxYzweyskLjTCLMPGTDmov4lCKWtXsCmBnQys9ei1xj2X9jFCDK3SYckJ5caCREGz2L
 z7W9HEj7osEIDxJl8Qr9dzT/KRzzkF56K6qj+GTSCbZsWklb/NK/uE5WFRQj5QHUK0CB
 hrYBrYek82ZOp7Zf8HpnFsJWo3rPyNWJDYBbyQ0wWfUJnyWKH5PEwcujoLmeJqg5pNPt
 P1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YY9FZgJmPcsrvv1dDjxqyVtz1nIgdkKk67xLM0ZtgAc=;
 b=aYMd8iB8Scm8zvLDAfjks1aggKyLxksfF05qfaXucaNsN9E1awlHbOKaBw9K8vzeCs
 PdKM+rvGR4mbtBELO5kDo37DJlV6R2Ut2nqwq74mhzmsrASVy69XghxjPRnUD2W6QW82
 iUQ/os5Ydz7p8JemlHZM4eJZ/aOBwPnfXM2EZkAyiQUh7ikfzucADsbbZPEqlnvYGhGi
 ooSRj31wVpua1cWh9qpZrgfkYgSFNwej+J24/sAubokMyPdpTmjViqadAZzmc9nhmQrj
 lKN7jpci54TL8NC2yx6Ru3SNJZmENmaUw/gpL6X9m/iCs2g6KQnCw+XmDYv7i0SLuCaW
 KKtg==
X-Gm-Message-State: AOAM532yvUgE+my6R3Z3tWOi81aofxH+c4XWh6htB8MdnH/cdaYtXDHu
 ot2Rj8oU27tNIss4TUXvm0A=
X-Google-Smtp-Source: ABdhPJxBH32FXzbEF9kfDCQM7O3XzmCGCPyYvwo7dy80ekk+7njHTBz0zzBJAx5/tRWBcopUFGXr/g==
X-Received: by 2002:adf:f189:: with SMTP id h9mr9495198wro.463.1639667802831; 
 Thu, 16 Dec 2021 07:16:42 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id b132sm4989939wmd.38.2021.12.16.07.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 07:16:41 -0800 (PST)
Date: Thu, 16 Dec 2021 16:16:38 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 06/22] ASoC: tegra20-spdif: stop setting slave_id
Message-ID: <YbtYVss3y8lgK1Z3@orome>
References: <20211204143725.31646-1-digetx@gmail.com>
 <20211204143725.31646-7-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="f5K+xSKWjsvh7cW7"
Content-Disposition: inline
In-Reply-To: <20211204143725.31646-7-digetx@gmail.com>
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


--f5K+xSKWjsvh7cW7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 04, 2021 at 05:37:09PM +0300, Dmitry Osipenko wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The DMA resource is never set up anywhere, and passing this as slave_id
> has not been the proper procedure in a long time.
>=20
> As a preparation for removing all slave_id references from the ALSA code,
> remove this one.
>=20
> According to Dmitry Osipenko, this driver has never been used and
> the mechanism for configuring DMA would not work as it is implemented,
> so this part will get rewritten when the driver gets put into use
> again in the future.
>=20
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  sound/soc/tegra/tegra20_spdif.c | 1 -
>  1 file changed, 1 deletion(-)

In case you want to pick this up into the ASoC tree and Vinod removes it
=66rom the DMA tree:

Acked-by: Thierry Reding <treding@nvidia.com>

--f5K+xSKWjsvh7cW7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG7WFYACgkQ3SOs138+
s6Hi7A//WvSC6HaD4dz2sE4APvQvLcrg7UUf4Q12zWYMoso91uXcLGSE4K7y12yD
bkRiCDYCsAmW2VCzapWMjLeTvpoUvVQPVDnZyXT/iY53m8GThFqnhNUZV+SUu4hx
oYuH2I7i+2frmjS9b7HglTBshVz6ALvn+vCmS7sXzYbGVsv4BYc338j2P5s6R0NT
AcoYb6/pav05eUTHLq086ipVUz9FxstCDhqq4A0x/7SJcY7TvVTzel9aqD6nfEiF
LGzc7df6QzFkTkhu91FPKi0RiumCbQw4d4Gdm7c3wk3f6s6dLJoZ90HCCmxT9I+Y
jUPPIjpmZl70RNDoWByu884ySe3b02sSGY1a5oLcOuBYx/M34rMo0mj71zHEKdQi
IrD1Ayniv0NRnwNwkR7CwGJtMjB2mO15h8uEL5ujqWFHAqkwd3pNOx8m3DPo8pP0
hpgHdTy0ogufgEy+Zs/V+w17WQVH/++zlxRJHvjfjWaAmJgBIP5jDJKpOtsZFxjd
YLY35vN7331mQkzZZPfYyCna7q1qHEOm3UwRNzyVp0fuozZHl0GQBRQDB8q7emQB
RROAE/QWJd7we/mF85Wfs8nKfYinG/iLM22oMZ6ZHIa81CoIiAXV7Ao89pDxCHcX
A8b8dTnu42raqD/1R1Pb549QpdaPaIRHl6d43FzCPuETRCMIbpk=
=o3sP
-----END PGP SIGNATURE-----

--f5K+xSKWjsvh7cW7--
