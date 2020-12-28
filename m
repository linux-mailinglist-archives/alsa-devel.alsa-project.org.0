Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E434C2E3717
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Dec 2020 13:23:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82DC01708;
	Mon, 28 Dec 2020 13:22:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82DC01708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609158220;
	bh=ZS7RUVKRP6wl2s9Oldv/OnnMPXjJxUml71Xrcq40DLY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=obJDqLQe4iQsdsD2iYIzIus3RVGs+6P+una61+6mCMmo0ZeC89bdueuyHNxydC5Tj
	 fBy8Txn0uiXfjBWxYFRZWNIlRbJMKjeR/y4CgJUacpoZK9ELpSxsbR7WEy1kh+IO0y
	 HjWRVL3OgY8QrmRNXIumlyzxgYwHQiD2qs4W5LW8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB954F801F9;
	Mon, 28 Dec 2020 13:22:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D200F801F5; Mon, 28 Dec 2020 13:22:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B766F80143
 for <alsa-devel@alsa-project.org>; Mon, 28 Dec 2020 13:22:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B766F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="afv795xo"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1050D20867;
 Mon, 28 Dec 2020 12:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609158119;
 bh=ZS7RUVKRP6wl2s9Oldv/OnnMPXjJxUml71Xrcq40DLY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=afv795xo56065rW5LAgNEsf0rNu4PmmmcqZl/xI+8vIF/LcSKDW9LKKis24EfvvZP
 BAPoF+l9viA2KajTts/hFLBlUKqws1L/xsQrlufX3v43rXqc4qeJWpOEwtBRqf/J2o
 6ily0+NOM6BqpHc8STVegwas8jVnwBJDJuRBpCzIT9/iJy2cnq/fnAlYUQzKXJKVFN
 L//31rdtvGIsEmjIUPE6t+dk8oC9zM1G3JtZBlyvDkouPAgLfMyCmpDrfv/VZwNGQ0
 tI33pIOybeJCY/g7jzq4qW7YnMFkK4W5KDXDzHq7EaVqfCl/F3hpZY9TQr7yOvBQfm
 /9Fc6+hxPlDsw==
Date: Mon, 28 Dec 2020 12:21:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 01/14] mfd: arizona: Add jack pointer to struct arizona
Message-ID: <20201228122138.GA5352@sirena.org.uk>
References: <20201227211232.117801-1-hdegoede@redhat.com>
 <20201227211232.117801-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Content-Disposition: inline
In-Reply-To: <20201227211232.117801-2-hdegoede@redhat.com>
X-Cookie: To see you is to sympathize.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Lee Jones <lee.jones@linaro.org>
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


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 27, 2020 at 10:12:19PM +0100, Hans de Goede wrote:
> The Linux Arizona driver uses the MFD framework to create several
> sub-devices for the Arizona codec and then uses a driver per function.
>=20
> The jack-detect support for the Arizona codec is handled by the
> extcon-arizona driver. This driver exports info about the jack state
> to userspace through the standard extcon sysfs class interface.
>=20
> But standard Linux userspace does not monitor/use the extcon sysfs
> interface for jack-detection.

This seems like the wrong layer to fix this problem at, this issue will
apply to all extcon devices that can detect audio.

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/pzdEACgkQJNaLcl1U
h9Dh6Qf/UA5yTQvJa66elOCTvssl6VA4RzwILRf1mJoZYFl7zb2LHfzSVv6R3Uxa
fNwQ5bphvGiDEToSULOtBujQIemOvFOZVJVxZ5ireFZJevoOFa3IHGae9XxFdG7M
CEIBKMtl9ZFTQAMGqE8tTduASOyflLJtoGY2Vj9a/FlnE8Rad/Ufib/GDlpQ4suQ
gK/Ng5bXWPcz/IooJDcsVr0grhWFtcKBifnRj6wnJ635gys/VUegIHiBuHzZCPtQ
klbL6XE0YebmQUFUGQklaFCgbUtQUVoSCoAcmaREWRcHOtIIMBwfw14ZikBw8U8P
4WnGOj4lhtL8cg9bZjOlquZ4w1mX6w==
=frXM
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--
