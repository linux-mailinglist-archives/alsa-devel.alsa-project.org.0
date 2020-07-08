Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E75C32185D8
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 13:15:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70304168B;
	Wed,  8 Jul 2020 13:15:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70304168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594206957;
	bh=KLmw3LdtpmhRj4Y/1TPgygP3l4Ahhr12LHZk+SCEsW4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OPWnQlZA6lP1kbc66GXltCcapEs2XT48PV0MVcUaFwNrXZX4Af16BAQei0xw3luhW
	 ilXiL5NsKZRj4s65V8HtpITwp7EHP1Ynb3EGFTqg9wk86DvGmRmobiPYIEQaariygg
	 PhX3Bbw6WKH3eC/NbQvPceqc/V85lL6354PED9TE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DF2EF80115;
	Wed,  8 Jul 2020 13:14:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4085EF8015A; Wed,  8 Jul 2020 13:14:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E7B3F80115
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 13:14:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E7B3F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sKKjY2yw"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A04B620739;
 Wed,  8 Jul 2020 11:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594206842;
 bh=KLmw3LdtpmhRj4Y/1TPgygP3l4Ahhr12LHZk+SCEsW4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sKKjY2ywkUFIQKbHvtPBP3Y1e+t8ADZ26lQLtlILh9B1NN5yZXpRH4HVouYJj5SPp
 w06KrCopeMnNyYeppWUOyhJAWR0TZtVjq8n3k/c66MWBOeyqtQvKx1ZJtp+1SizcKE
 szVEmioSN09NiAIvb3ndsUxdPp7GggvMTSIp2Zl0=
Date: Wed, 8 Jul 2020 12:13:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 0/3] ASoC: Clean-up =?utf-8?Q?W?=
 =?utf-8?Q?=3D1_build_warnings=E2=80=8B?= - part3
Message-ID: <20200708111357.GH4655@sirena.org.uk>
References: <20200707192310.98663-1-pierre-louis.bossart@linux.intel.com>
 <1jo8ordshd.fsf@starbuckisacylon.baylibre.com>
 <951676be-fd0a-530a-d57b-d684b93efc70@linux.intel.com>
 <20200708063100.GH3500@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ULyIDA2m8JTe+TiX"
Content-Disposition: inline
In-Reply-To: <20200708063100.GH3500@dell>
X-Cookie: Oh Dad!  We're ALL Devo!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
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


--ULyIDA2m8JTe+TiX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 08, 2020 at 07:31:00AM +0100, Lee Jones wrote:

> Linus recently complained about the type-limits warning, saying that
> it was invalid.  He preferred the warning to be bumped from W=1 to
> W=2, although I haven't seen a patch doing this yet.

> Rikard also tried to fix GENMASK directly; however, Linus did not
> approve of this either.

Let's just leave this series for now then.

--ULyIDA2m8JTe+TiX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8FqnQACgkQJNaLcl1U
h9Cr7Af/Yy1Kzw9GnoS25Y3Pd9OGJbRFZNEPfKhPbcsbqi6mWRD+61ISpYGOA5bK
wOUwY2d/pPLCKqsu4P6xbfWwriJURC/bPjJGEb4Qjyu0y+uCvNvR/ZpibM5gy2T3
QG/Ii3nOX7YzQPLclxcE5b+r0OJ4uABvys+oVjpevvKzotuFIMEm5+RQluxDyNDX
4HyDGbo3t8l0/o4RgB0EdEZ7t+PCfenNwG4yNjHdBsPdkk+oIDBf1v/XemZfDMie
8wtZ8fxUi6rV658XjV5iC+75SqrgjWoA+ziuz9V5TvGBR2Ul8OJUsRKrgaShz/tY
q+B7sNecGsA+QtLbWWMq3eGZTqqeRA==
=EtC0
-----END PGP SIGNATURE-----

--ULyIDA2m8JTe+TiX--
