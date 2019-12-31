Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 036B312D52F
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Dec 2019 01:18:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8797F1708;
	Tue, 31 Dec 2019 01:18:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8797F1708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577751533;
	bh=kAbvYuqGD9A9SNmuvMO9yeX4vZcRp2Kz5lp02ACYtsw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KBaTD4ifAc1wisIx3c6WuNc2G1jzHICGfpoyuFeJOOm1+1gENC/k0iD2RVFVNRFEM
	 G89S6cfS9iWYPLnnTqfeSGtWCfiI4uUqEac+wxHt7oiRXNedlpRLPMTeL9w/g9ZbwU
	 zLzUtBxmkxTOYk6Kz9gLItNLLahjqNhCihwNwE+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBCA6F80246;
	Tue, 31 Dec 2019 01:17:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BAA4F8015F; Tue, 31 Dec 2019 01:17:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7D74F80126
 for <alsa-devel@alsa-project.org>; Tue, 31 Dec 2019 01:17:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7D74F80126
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="heqQ65uO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RbisTe+iB3aSugYpvz9elCfJ1m1jElfgrG8cOw7p7uQ=; b=heqQ65uOQruVqrBdkas8NwERq
 5jwYd62w0bDd1Y1a7yJo/gb2KHpaIM9PH/PVC1PuxdBGVSRIJkIl4cwMPE/w9Dit0UvGWrQla0Iv7
 cp7KLYK78VdkcUZeUHjC3w3EQGXDiZEBUnOpONHruGyQnElwaRVey/yPLQuPS7xTt9xc8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1im5Ds-0002iq-71; Tue, 31 Dec 2019 00:17:20 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 8BCC4D01A22; Tue, 31 Dec 2019 00:17:19 +0000 (GMT)
Date: Tue, 31 Dec 2019 00:17:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <20191231001719.GC3897@sirena.org.uk>
References: <20191229150454.2127-1-digetx@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191229150454.2127-1-digetx@gmail.com>
X-Cookie: Programming is an unnatural act.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-tegra@vger.kernel.org, Bard Liao <bardliao@realtek.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [alsa-devel] [PATCH v1] ASoC: rt5640: Fix NULL dereference on
	module unload
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
Content-Type: multipart/mixed; boundary="===============4640824518712292033=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4640824518712292033==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jy6Sn24JjFx/iggw"
Content-Disposition: inline


--jy6Sn24JjFx/iggw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 29, 2019 at 06:04:54PM +0300, Dmitry Osipenko wrote:
> The rt5640->jack is NULL if jack is already disabled at the time of
> driver's module unloading.
>=20
>  Unable to handle kernel NULL pointer dereference at virtual address 0000=
0024
>  ...
>  (rt5640_set_jack [snd_soc_rt5640]) from [<bf86f7ed>] (snd_soc_component_=
set_jack+0x11/0x1c [snd_soc_core])
>  (snd_soc_component_set_jack [snd_soc_core]) from [<bf8675cf>] (soc_remov=
e_component+0x1b/0x54 [snd_soc_core])
>  (soc_remove_component [snd_soc_core]) from [<bf868859>] (soc_cleanup_car=
d_resources+0xad/0x1cc [snd_soc_core])

In addition to what Takashi said:

Please think hard before including complete backtraces in upstream
reports, they are very large and contain almost no useful information
relative to their size so often obscure the relevant content in your
message. If part of the backtrace is usefully illustrative then it's
usually better to pull out the relevant sections.

--jy6Sn24JjFx/iggw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4Kk44ACgkQJNaLcl1U
h9B0vAf+Jesim6R6yU2diF32zHcRsUbMmsppI6c2j5Th/D8i5h+fRxjvXEvVkuGI
XjQkntGRuppBqIv7EcVt19JhOaO2S2+dCWskZY9G1C2t0k/i4FaGv20iVr+Zd1qI
po2/Sv/mjruuFZqpx8ZVGdGVwrdCB8EnANT6k62eFFGb+bvrE9k6xh4db9CyYBKH
EO+NXjIDf/115a4XcHEfWGe3627k8rlw5llArmHyp+kTo2jq5jbCVcUxsXGTsz7W
QyGsYgljmuJ7OVMZv2lpHa4Wxl1hdCobWS8TCrjK5gMFmlWZypw1zOh5Z9lkEVcl
nm/taB4a/p7GEMWOa+AJevErYZjl2w==
=D3/K
-----END PGP SIGNATURE-----

--jy6Sn24JjFx/iggw--

--===============4640824518712292033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4640824518712292033==--
