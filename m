Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE3230892D
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 13:47:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A31FB1678;
	Fri, 29 Jan 2021 13:46:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A31FB1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611924440;
	bh=ORRud7zP8lvgT+PZMYSBmB0Hacq02bg/z3Lb2Jb8Z8g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FdmKFK5Im6p9hQBwgxPtMe0x/NgKzB1ZHABVBenBsexYRPAs8yM61ybQrzmbbhWXs
	 BpA+2ZZ8+CoBpeQ0AxDjXs35eqCS7+npM/QBpS8JlZabuWDnjsnr0PKVsf+P6tM4Of
	 Eygqag+yP7EGCzh5th/1MF6NPOjKuP84ylD5RUaw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01077F8025F;
	Fri, 29 Jan 2021 13:45:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0501F80259; Fri, 29 Jan 2021 13:45:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84161F800EB
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 13:45:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84161F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TrfGI05h"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9DA7564D9E;
 Fri, 29 Jan 2021 12:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611924339;
 bh=ORRud7zP8lvgT+PZMYSBmB0Hacq02bg/z3Lb2Jb8Z8g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TrfGI05h+m+0FhRP41/xeTCYxePdjxenxK8U3bbgvQmJyWq/g+EAu2GV+i3Db4bbl
 ldYirBTr7N3HJLs29/e5mcjGKdWN+lZ0rDOAdpTxivtqKf3Utb5qXRfzlY25WJruAD
 LmCoGy17wy5VyieA6TrHOxrhrpjWiIbA3xcdPQ2QvKBBxw+hJ6POOtG6gTHh8DJNwt
 DNz9A0N0HVOZ/0MMn45VZQXQwIIp1BWIUZCzJytopR0Lcw+diWaEhgOcJki7tYtNsN
 r9LMzij6uhh969YktKDU35o91YqyUhOnWUjR98e+IO0CxN+egc/O1o4uf1rybx93Hi
 hndhz5FE+jn4w==
Date: Fri, 29 Jan 2021 12:44:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH 4/8] ASoC: tegra: Select SND_SOC_RT5659
Message-ID: <20210129124454.GB4560@sirena.org.uk>
References: <1611920470-24225-1-git-send-email-spujar@nvidia.com>
 <1611920470-24225-5-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="CdrF4e02JqNVZeln"
Content-Disposition: inline
In-Reply-To: <1611920470-24225-5-git-send-email-spujar@nvidia.com>
X-Cookie: One organism, one vote.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 jonathanh@nvidia.com, sharadg@nvidia.com, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org
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


--CdrF4e02JqNVZeln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 29, 2021 at 05:11:06PM +0530, Sameer Pujar wrote:
> Select SND_SOC_RT5659 to verify external audio over Jetson platforms.
> Jetson AGX Xavier has an on-board RT5658 audio codec and to use this
> enable required config.
>=20
>  config SND_SOC_TEGRA_AUDIO_GRAPH_CARD
>  	tristate "Audio Graph Card based Tegra driver"
>  	depends on SND_AUDIO_GRAPH_CARD
> +	select SND_SOC_RT5659
>  	help

This is a generic device, not something specific to Jetson, why force
on a driver that may not be required on other boards using this driver?

--CdrF4e02JqNVZeln
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAUA0YACgkQJNaLcl1U
h9ABawf9HXgzOttmkvKi4f1ZnYBndiof6VKIGYzASXCyFczad33uLS+RQ/ZT4/bM
U+J6EBW8Dp1Ql/FwY+z6e+MMyZHdK6UcnUcHKzreegwcNlSkd8zqUUVuKh7ETYFG
+M2NJrlsO9B1v6kybDafYvxmk63OWC2TCab29362/TwY/4b8RvUxaT/vrSPWQjwG
oQm+FzpPok+3K1A4XiVIOM0RsHF0pI8eE/p5YwgRbFBYnRU2GpLPP+1SwR2xxXvc
v9Hl9j0Q75h09AMFK9U/L4u0cKrZdW4F8TXrt9DnrIt3yCt2zTyHEsMVPZZ88iCV
wPEVJXWAe9kz4WE8pspm2lXSsmuj5g==
=QTQY
-----END PGP SIGNATURE-----

--CdrF4e02JqNVZeln--
