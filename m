Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D92464DE7
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 13:31:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E4CB248C;
	Wed,  1 Dec 2021 13:31:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E4CB248C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638361910;
	bh=03+6fKNtnIgT0q2NIgHnMNKIjLxO+j7dkflRHgSq0Rs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dEYU4tYa9CF16kxGfqsfmUiwiqrr7fVx4J52WAnGbXqd12LxvbfrLOMi6oor+d22S
	 SLLqqju19lbxtAZM3ImX/xXUBjsU0AU/suziWkxJC4QDsj1vHz5Z4/YDSiFanDZ6AF
	 XRerxAFhvVRdqVmUfqGaTwVftfGQkXUW8MOyfhko=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76F1FF800EE;
	Wed,  1 Dec 2021 13:30:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDB9AF80246; Wed,  1 Dec 2021 13:30:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 924D0F80217
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 13:30:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 924D0F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SACOknNh"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0697CB81EAF;
 Wed,  1 Dec 2021 12:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21404C53FAD;
 Wed,  1 Dec 2021 12:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638361823;
 bh=03+6fKNtnIgT0q2NIgHnMNKIjLxO+j7dkflRHgSq0Rs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SACOknNhgH92KqQkFAfVnywMMZQs79GIZLesJve4a2LJrRE1E5lCxnJZ6ITsYhW7g
 8uKceFPdWRtR9Bq2BEqniFn280n/mJXZOpLMYLOs3i07oQJUOU/LV2c3BOFN+2n8qk
 f13h5KKWPNaVaP5x4LsTbZ91uUnE+Y2co5yEmdVWaVKM5350fHTUynQrNiVYncAsQH
 d6Is0YsPUR4ySTGj6jrry9MxwbKVYoOS4NxuXzOK2jf2S/RUAVlNK9tBdZC+Ngz0dJ
 cOST6r4TYzrERa4jbNv3eksxrAxJv9vq4kQv1JCkhpWB1XMpEyb3b3+mHVsT7LHN00
 PERogFZH8oCpw==
Date: Wed, 1 Dec 2021 12:30:16 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: rt1011: revert 'I2S Reference' to SOC_ENUM_EXT
Message-ID: <Yadq2FLkU62sJD6F@sirena.org.uk>
References: <20211111091705.20879-1-jack.yu@realtek.com>
 <2c3eb3db-d32c-edbf-75b3-29ab478cea13@linux.intel.com>
 <58fb5f01ad11482f8777e7d4d1ced173@realtek.com>
 <fa42decd-44a3-b27d-550f-df1d5b893cea@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ao6hkJSXxPoxyWsv"
Content-Disposition: inline
In-Reply-To: <fa42decd-44a3-b27d-550f-df1d5b893cea@linux.intel.com>
X-Cookie: All true wisdom is found on T-shirts.
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 =?utf-8?B?a2VudF9jaGVuQHJlYWx0ZWsuY29tIFvpmbPlu7rlro9d?=
 <kent_chen@realtek.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
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


--ao6hkJSXxPoxyWsv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 01, 2021 at 09:00:02AM +0200, P=E9ter Ujfalusi wrote:

> This is something like drop dai_fmt and all configuration and
> set ADCDAT1/2 pin to output
> set I2S, 24 bit for rx/tx
> set undocumented BIT12 in RT1011_TDM1_SET_1
> set 'TDM1 DOUT Source' to ALC

I'd expect that last one in particular to be a DAPM route.

--ao6hkJSXxPoxyWsv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGnatcACgkQJNaLcl1U
h9CdNAf44VZwJEGumrYNBIcTgbydPdxOqyWouFYKjuZe5o0C9zjw8fAvSs7bLjZe
TZXYQSo7NI5OYyaJP8KN6+iwOb+nsjuUZqG9LypvtcrK4Ok5uy9LVTauGD+t9//b
6M1sQ8uO1iE+x2B1uOIsWouVUTfrsgYuGF7ySoRSomr+WlTw5VhsF47a3R/rMVTF
txCm6aQHvzSKYJdlSAJeFUHqqy36ULpr5KQdPLuZvzMNiH1o7fv7nzzRtToaSMbF
FhjpWwFg+3DwOlOX2Vj1YQW6sBUlikkcxGZ4Qv0GqeNfEMfpWWrqyc0DiCvgkJlG
+yYmyxcU6/pX5CXz7FjxnZujRh5Q
=y74c
-----END PGP SIGNATURE-----

--ao6hkJSXxPoxyWsv--
