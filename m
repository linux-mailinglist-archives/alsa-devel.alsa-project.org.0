Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE34B152429
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Feb 2020 01:40:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D2511696;
	Wed,  5 Feb 2020 01:39:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D2511696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580863249;
	bh=tQyB57QerSyP9GCEB32AFcJ2p4YlPE4RYRmWcHmCDBM=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FLecwSoqFLUOxrPsCgtkG/WwM4A0cuxPAFsQdRVI955INAzaEI6BLeENy+vzkJowZ
	 jAB12oFYzPES5+0FWky7Dl8LvwRnl8smJMpKujRkF9DqQBKLgGO6YMj1EMd0H+Y0Vj
	 P0yStHxN4AYwFyCOu5aV0p5J/LX/Y7j0CndzGwkw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21960F800F4;
	Wed,  5 Feb 2020 01:39:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8862F80212; Wed,  5 Feb 2020 01:39:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AE98F800F4
 for <alsa-devel@alsa-project.org>; Wed,  5 Feb 2020 01:39:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AE98F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.b="gjGg21E8"
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48C2kq2Q9Kz9sSN;
 Wed,  5 Feb 2020 11:39:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1580863172;
 bh=RgyY/tOo9lziedT4Kg/hB7aY/945tp8KAZmY13gSICA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gjGg21E8GutoxDwoKArshcfZP7OMfo6KXVMdxP1JnveIwqYFf16suHb75Q2KTuoBu
 LXT3ZzH5O/uok0ZrNOkjYZigsK469DDk/P645Ed8drQggyzyPNLml9Ex8aDazeBPVg
 FOswW+53XfDN2d5SFADQ4a3Jxhz22usWTIZBuDNyQhcbyt9mskA7iRoMRCE8tDSgGV
 A9vAQXJtOXjxSCOLf/8cM51siKyIAdxtFtoyYO8VEIgfFpvnacjBixIDIa0V717uTp
 24qpMp/Op4Z7cz2UvdqGbPY7Vf6eExy6PbdB0PfMZzsKGqJB5yiwiMx0/LGQuhWS0d
 +puw0yMXuyeuw==
Date: Wed, 5 Feb 2020 11:39:30 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <20200205113930.5eb08bb4@canb.auug.org.au>
In-Reply-To: <20200204131857.7634-1-geert@linux-m68k.org>
References: <20200204131857.7634-1-geert@linux-m68k.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: wcd934x: Add missing COMMON_CLK
 dependency to SND_SOC_ALL_CODECS
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
Content-Type: multipart/mixed; boundary="===============6202145542608882208=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--===============6202145542608882208==
Content-Type: multipart/signed; boundary="Sig_/Hiz/NjwjpbUPYg/fH_/v/0X";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Hiz/NjwjpbUPYg/fH_/v/0X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Tue,  4 Feb 2020 14:18:57 +0100 Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
>
> Just adding a dependency on COMMON_CLK to SND_SOC_WCD934X is not
> sufficient, as enabling SND_SOC_ALL_CODECS will still select it,
> breaking the build later:
>=20
>     WARNING: unmet direct dependencies detected for SND_SOC_WCD934X
>       Depends on [n]: SOUND [=3Dm] && !UML && SND [=3Dm] && SND_SOC [=3Dm=
] && COMMON_CLK [=3Dn] && MFD_WCD934X [=3Dm]
>       Selected by [m]:
>       - SND_SOC_ALL_CODECS [=3Dm] && SOUND [=3Dm] && !UML && SND [=3Dm] &=
& SND_SOC [=3Dm] && COMPILE_TEST [=3Dy] && MFD_WCD934X [=3Dm]
>     ...
>     ERROR: "of_clk_add_provider" [sound/soc/codecs/snd-soc-wcd934x.ko] un=
defined!
>     ERROR: "of_clk_src_simple_get" [sound/soc/codecs/snd-soc-wcd934x.ko] =
undefined!
>     ERROR: "clk_hw_register" [sound/soc/codecs/snd-soc-wcd934x.ko] undefi=
ned!
>     ERROR: "__clk_get_name" [sound/soc/codecs/snd-soc-wcd934x.ko] undefin=
ed!
>=20
> Fix this by adding the missing dependency to SND_SOC_ALL_CODECS
>=20
> Fixes: 42b716359beca106 ("ASoC: wcd934x: Add missing COMMON_CLK dependenc=
y")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> Seen with e.g. m68k/allmodconfig.

Also seen with powerpc/allyesconfig

Tested-by: Stephen Rothwell <sfr@canb.auug.org.au>

--=20
Cheers,
Stephen Rothwell

--Sig_/Hiz/NjwjpbUPYg/fH_/v/0X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl46DsIACgkQAVBC80lX
0GwzRwgAgmwTJPOGlGhFjolOKlrmmYlrenpXgKt+jAHgVCjxg02BcOjHK2fq14FZ
+EHbzsS6mcSM3yjNhuObh1tUMdIRxCCssy/mHdFuCO4QnDeDf2EuCMmCDz/8icqD
vdBkRhMbB4EbX/1B5tEwACPmunrYRCoQ4CrOUvDMAbZ6tztglNDe1fqJxpr9QBFT
lW69SSDX5JALt3MOBvxO9rWsoG51beKLwuMg9lEON64bzp9vA2xq5Z44+asHWfxB
pnLa8MlKG99cxqzXDy+kPaGFRlfVy4XHwyn0bJJnHjLSkQXibYrIqKbxyUNfjfGS
3rMWUB3s4Kg/vPD6FlvW7MPda+QjcQ==
=16Dv
-----END PGP SIGNATURE-----

--Sig_/Hiz/NjwjpbUPYg/fH_/v/0X--

--===============6202145542608882208==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6202145542608882208==--
