Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C9B1DEF5C
	for <lists+alsa-devel@lfdr.de>; Fri, 22 May 2020 20:39:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3055B1895;
	Fri, 22 May 2020 20:38:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3055B1895
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590172747;
	bh=bXfNmj/8PSUxUcc0ED8y7mtW2+BzQKQzDdxVq4qyjY4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dKNBCDEvTEaAJWoJSGHIy80yLAc0722Mtc4iElr/gSaTQoqkhoMYjfLi2Zxuz9kOd
	 7xzlN01FdkFvuQ5XWXYi122GcsT2yJwAQWxR+nehOrvH0NOE8DdkP6S/+lK40xzP70
	 d2vylCvuY7uTPus5Pyyf1rq6qtxAv8aIFG58zHQM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40984F801DA;
	Fri, 22 May 2020 20:37:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73799F801F9; Fri, 22 May 2020 20:37:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B7BFF80121
 for <alsa-devel@alsa-project.org>; Fri, 22 May 2020 20:37:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B7BFF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="d5G/Di/+"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9AA6720663;
 Fri, 22 May 2020 18:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590172634;
 bh=bXfNmj/8PSUxUcc0ED8y7mtW2+BzQKQzDdxVq4qyjY4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d5G/Di/+hS0hdszVZb3xpTqdSPf2dF9RxTIWD/oqj4Q2NGVnKKYaT5IfmkrRnZ8zY
 ByYXB8wmqaj6oexSdRYwR+7YQEkjFXgW/yf1x24NUfagB50JzFszCd1dn32ZechjwK
 AUGZ9JntBHJjU1HHlbIs2jXoPnHtxlZojtGe/86A=
Date: Fri, 22 May 2020 19:37:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v3 2/7] ASoC: soc-link: move soc_rtd_xxx()
Message-ID: <20200522183711.GQ5801@sirena.org.uk>
References: <87lflk4yk3.wl-kuninori.morimoto.gx@renesas.com>
 <87imgo4yij.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="1GSL5ZULXUIqbbH1"
Content-Disposition: inline
In-Reply-To: <87imgo4yij.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: C for yourself.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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


--1GSL5ZULXUIqbbH1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2020 at 09:13:56AM +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>=20
> dai_link related function should be implemented at
> soc-link.c.
> This patch moves soc-pcm soc_rtd_xxx()
> to soc-link as snd_soc_link_xxx()

This breaks bisection on x86 allmodconfig:

/mnt/kernel/sound/soc/soc-pcm.c: In function 'soc_pcm_open':
/mnt/kernel/sound/soc/soc-pcm.c:733:29: error: passing argument 1 of 'snd_s=
oc_link_startup' from incompatible pointer type [-Werror=3Dincompatible-poi=
nter-types]
  ret =3D snd_soc_link_startup(substream);
                             ^~~~~~~~~
In file included from /mnt/kernel/sound/soc/soc-pcm.c:27:
/mnt/kernel/include/sound/soc-link.h:12:54: note: expected 'struct snd_soc_=
pcm_runtime *' but argument is of type 'struct snd_pcm_substream *'
 int snd_soc_link_startup(struct snd_soc_pcm_runtime *rtd,
                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
/mnt/kernel/sound/soc/soc-pcm.c:733:8: error: too few arguments to function=
 'snd_soc_link_startup'
  ret =3D snd_soc_link_startup(substream);
        ^~~~~~~~~~~~~~~~~~~~

(and some more)

--1GSL5ZULXUIqbbH1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7IG9YACgkQJNaLcl1U
h9AEnQf+PUIiS/9wA7WxCNPlcyLNyU3p2GUM31Uhtnh4YdWFnBMF23TtoBzUdN+g
Tk2I9eC8jDXCF6nCzs0ge0yJ78CkxnMJU9mv7ljd0KRDNOEHnoglRWqFjj8anCMC
L5PkpNaw23eriAHPwI8twovixMs70SYFQPIc5BY66yb+ZZ+CS3x/ySHoBgXZa6Dr
St+auSc0paAZEnU0/aui4Shphorg+vX4Ymp4xcxCvZQpVvBPbOv6x1SD7z0gO4A4
WMZ0rQ8Wz4B90dFmvQGg/N7jKQYtAj+dpV1fCte9ZExOkyXXMnc4KciZtbvQUud5
9GZH6Si5HlDU0rBwP668Sa9cJiCGPA==
=pZZM
-----END PGP SIGNATURE-----

--1GSL5ZULXUIqbbH1--
