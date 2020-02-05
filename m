Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E6B152425
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Feb 2020 01:39:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6264166D;
	Wed,  5 Feb 2020 01:39:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6264166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580863198;
	bh=O/j/k7sAaOzmSUrt6nlkhcC+ImfQzBmkMkPuTEU48ms=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t6ZhbmrACkbxxyLnPHyionWWxRdvoGj5UW/DJhM6LQJieRMNqNFmFeqT5vLtBtmM6
	 dkcDJcp4RfRNjMfnrzDinGnsttCpmSWnS+a4GGIr9Vh3Xpey/SnfwIddfgCTIuNFGr
	 Rk8dIwOJCr1n6nGy+9yRAE5ttl3i1EarNx198QlA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8157F80051;
	Wed,  5 Feb 2020 01:38:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0765AF80162; Wed,  5 Feb 2020 01:38:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6650CF80051
 for <alsa-devel@alsa-project.org>; Wed,  5 Feb 2020 01:38:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6650CF80051
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.b="Hll0/GjA"
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48C2j223psz9sSN;
 Wed,  5 Feb 2020 11:37:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1580863079;
 bh=D4ySHA1AZdixCqz+gphCjWo5PwSShyuxhG5htucJUPs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Hll0/GjARY18lDVuv/HjMGHWHf7qmMgcjP2k+i4xyHJOjpH9Coq/3bXzizD4td1kl
 gnmuBBC9WXKxOTQ358RMfpH7OCuFFTlRNfQOCYZCQBTaNeiodRJxXZ0tn9xCinT8dD
 jKXjvdxz+WR1jn5KHZrq0D6Yz2qFB2BFQjxeImE3G5aEItXCh+ytYyANfxCKp2N3NR
 MZIOHxr2u4no0TP6BG8sMYITVaqSSuBoVtT1P0TlEKQ6mZLX9iqziBTHskZyGF7mIH
 PzSKtSe3sQmnpqw35+XG5iKSE9a3OUXdc+RfSSjnUVDFfnrjjv73ZD+EN8Zlg0J86z
 f0whArJZLCejw==
Date: Wed, 5 Feb 2020 11:37:55 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <20200205113755.7daca1f1@canb.auug.org.au>
In-Reply-To: <CAMuHMdVw0crXH+=7e9GGLUR-c-SxZDz9kQdeWxkZyZ9Jx7CVig@mail.gmail.com>
References: <20200204111241.6927-1-srinivas.kandagatla@linaro.org>
 <CAMuHMdVw0crXH+=7e9GGLUR-c-SxZDz9kQdeWxkZyZ9Jx7CVig@mail.gmail.com>
MIME-Version: 1.0
Cc: Lee Jones <lee.jones@linaro.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: wcd934x: Add missing COMMON_CLK
	dependency
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
Content-Type: multipart/mixed; boundary="===============4934775225279914251=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--===============4934775225279914251==
Content-Type: multipart/signed; boundary="Sig_/_1_fW9as_IaoGbJacvoUTVq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_1_fW9as_IaoGbJacvoUTVq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Tue, 4 Feb 2020 14:21:01 +0100 Geert Uytterhoeven <geert@linux-m68k.org>=
 wrote:
>
> On Tue, Feb 4, 2020 at 12:14 PM Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
> > Looks like some platforms are not yet using COMMON CLK.
> >
> > PowerPC allyesconfig failed with below error in next
> >
> > ld: sound/soc/codecs/wcd934x.o:(.toc+0x0):
> >          undefined reference to `of_clk_src_simple_get'
> > ld: sound/soc/codecs/wcd934x.o: in function `.wcd934x_codec_probe':
> > wcd934x.c:(.text.wcd934x_codec_probe+0x3d4):
> >          undefined reference to `.__clk_get_name'
> > ld: wcd934x.c:(.text.wcd934x_codec_probe+0x438):
> >          undefined reference to `.clk_hw_register'
> > ld: wcd934x.c:(.text.wcd934x_codec_probe+0x474):
> >          undefined reference to `.of_clk_add_provider'
> >
> > Add the missing COMMON_CLK dependency to fix this errors.
> >
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org> =20
>=20
> Thanks for your patch!
>=20
> But did this change really fix your PowerPC allyesconfig build?

It does not :-(

> SND_SOC_ALL_CODECS will still select it...
>=20
> Fix sent.

I have applied that patch to linux-next today.

--=20
Cheers,
Stephen Rothwell

--Sig_/_1_fW9as_IaoGbJacvoUTVq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl46DmMACgkQAVBC80lX
0Gx/DggAj9lmiFpTN+bBrorpgSuNVYj4avD/gKtS0FdPBJaSx+Xqeux+QRyKUfyr
gJ/XgiVrgJAYPxUrXsMJUm2TWRYRQVlgkBqr94OD+hE1WnB0/pIwA5IIaEKXX/lW
UJcfm+fj5tXfolbKJA0rZAYtSOR5lBEH+cyuSMs2oIZKBUkqOmTFxWkHoQhVT0si
f+NDywZ1q7CarhMmnStOoZerBuDpdz+j7wzpreedebU+m/VSEJA1Kt33/RsAqLUF
uGctV/gbqqgVtiY0d0dULjpyrD7FswfK6GurAVrycpFyJvKda0bqiE7QV96S3Qdz
e1ZbwL6QKEXK+754qrD4/9IebKFnsQ==
=z7P8
-----END PGP SIGNATURE-----

--Sig_/_1_fW9as_IaoGbJacvoUTVq--

--===============4934775225279914251==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4934775225279914251==--
