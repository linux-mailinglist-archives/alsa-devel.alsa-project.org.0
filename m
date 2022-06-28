Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C0855C06F
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jun 2022 12:55:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4ACF384B;
	Tue, 28 Jun 2022 12:55:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4ACF384B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656413759;
	bh=Fs76fzPiX5CmqDm7rtqXmeYxffdzK/gh1PH56GM7A/A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t96Zr+su0shJJyvauU+CYJJn3gafDtGW5NGVUp9SFHYNDj0Lbooeu7Tf/FbMFFtF4
	 UgrOrSWOJ32FMLjL+o1aA4Fq4GAv8hPDFOgMIZIVZyCavnptZu56eyvys4zR+jBeLc
	 qYTvuVtHz6pG/AnuGZYY1bk/5+KTsXJuTI3qsxh8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A04B0F80115;
	Tue, 28 Jun 2022 12:55:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92DB1F80167; Tue, 28 Jun 2022 12:54:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42F31F80163
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 12:54:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42F31F80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CWxnowEI"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9CF6C61953;
 Tue, 28 Jun 2022 10:54:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC517C3411D;
 Tue, 28 Jun 2022 10:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656413693;
 bh=Fs76fzPiX5CmqDm7rtqXmeYxffdzK/gh1PH56GM7A/A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CWxnowEIkHAserwFzSMJCMqahu7NvtMa9ZpyTfJPzy0/5EOwwdrKlYBA4KDNjd46V
 6S1Tq2iGDWKNvPZ6gZGFpir1kicU+VCDnJL384wniHm/3rGpl+mv0rJFBYI1HtFFSk
 NMvpc7/d15Xsltl4uy9/ig5oYPM80xVjhK9/ZUa3d2Tf581X27Dgub0Ms/s5bsNIZG
 75kvBcnUVSTN3at2IaFuOxmitya78R4qdZ1M2La+gE5sIct0s5IN794dPxMvtdoAcq
 nd6d7d5juLJ9CXedoW9Wop3mvU/RtulX2iWf8WkhpUQ/b0D1w6enipuCnbNyM5RVTe
 wrYwU6Y+3I9Nw==
Date: Tue, 28 Jun 2022 11:54:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 1/2] ASoC: qcom: lpass: Fix apq8016 compat string to
 match yaml
Message-ID: <Yrrd96ecPni13xq2@sirena.org.uk>
References: <20220628002858.2638442-1-bryan.odonoghue@linaro.org>
 <20220628002858.2638442-2-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="iQPZ8z0FvK3SbyzZ"
Content-Disposition: inline
In-Reply-To: <20220628002858.2638442-2-bryan.odonoghue@linaro.org>
X-Cookie: I like your SNOOPY POSTER!!
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, srinivas.kandagatla@linaro.org, krzk+dt@kernel.org,
 bjorn.andersson@linaro.org
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


--iQPZ8z0FvK3SbyzZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 28, 2022 at 01:28:57AM +0100, Bryan O'Donoghue wrote:
> The documented yaml compat string for the apq8016 is
> "qcom,apq8016-lpass-cpu" not "qcom,lpass-cpu-apq8016". Looking at the oth=
er
> lpass compat strings the general form is "qcom,socnum-lpass-cpu".
>=20
> We need to fix both the driver and dts to match.
>=20
> Fixes: dc1ebd1811e9 ("ASoC: qcom: Add apq8016 lpass driver support")

This isn't really a fix and it's breaking an ABI which has been there
since 2015.  By tagging this as a fix you're doubtless going to get the
stable people trying to backport it which will most likely break some
users.

--iQPZ8z0FvK3SbyzZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK63fYACgkQJNaLcl1U
h9Antwf/Z4Ctein0L7OvsA9zHtMBH5LNxHlRKyTZ7Qgkg2kL3u1J7fDIF0Rjp66f
AS5fRMXIOUSbzij1j1jO4EbNXVQnFOVyGgFKzv4L8Dh3ZGtEAzVglWEIwrwvdaif
yEJYlGnoa8ERRMAeujuWAaXvRbGT2YLs5Naf4NG1x8oUqy+U1Ze+CuwE4Pi72HNC
oe+D059bZrbD8YCdNOCoPkIYYliDDftskW0bqmBAuW31d0G8UtnR8exoLdiVEeGO
5/KGlLvgpbx5CArLZ8jKTUm8NwYr/1OskTYM5PV3LzPyeKGIucy5HbeWAYQz0K0N
8fW13yKwgi0yVHSI/ScHiWP8sK8EVQ==
=gOCL
-----END PGP SIGNATURE-----

--iQPZ8z0FvK3SbyzZ--
