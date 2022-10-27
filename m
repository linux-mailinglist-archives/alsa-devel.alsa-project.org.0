Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6758360F7CB
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 14:45:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6AB730A7;
	Thu, 27 Oct 2022 14:44:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6AB730A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666874737;
	bh=8seYPbRcHrC9RaVdyY+jCwH9pq3w1IwKUS5IjVpXrek=;
	h=Date:From:To:Subject:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=HeN7dcbc+y1hEWg/CF2k6PeGRmeUZot8uiju9Hbhv1UqRrkJDhcW2LDwuoKzHQPRy
	 7qi4LwhS1drHxJxzI0VBa+l/NHoXxvKi+9PIdf2nwlJiDE4Z6v9+Gwlolso+6TjU/n
	 q2KbQ1ikewiHmIGPuxalHGLzUv0VvXFeO84bedTo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EBE5F80496;
	Thu, 27 Oct 2022 14:44:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0871F8025E; Thu, 27 Oct 2022 14:44:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C577DF80100
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 14:44:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C577DF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="H/mnobNi"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0950EB8254E;
 Thu, 27 Oct 2022 12:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 142E2C433C1;
 Thu, 27 Oct 2022 12:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666874672;
 bh=8seYPbRcHrC9RaVdyY+jCwH9pq3w1IwKUS5IjVpXrek=;
 h=Date:From:To:Cc:Subject:References:From;
 b=H/mnobNiDp7uLhXAJb1gnFTZbWq2q+TBFTubAOnx2WV7NPing6WVKPoSHN1YdbakR
 h/aEjOn+BCMQgMG5ceybxGFF5wL9k4Y8bvf5Gct96JEKQpjHAT9kjcFxn83PRLdP9+
 5WqK2RdlMHyR0xemt/V4NUDGVG2o0Mls/c6KalVGoPhaN2+M9cG1e+ejrUfBqZC1sd
 ihCShfUyR3LB8czCXr1tsGKfx6VC902iWCBhwNbs4enHI+qkFSL36EONKBUyjM1CRo
 pWZyrwNErEC5f5LM/5moBvB7S/nr4R3kh3RB5ALbjQI4IEmAsH4F89FMyi96k3gvCx
 hRMZZK3ZwxpNQ==
Date: Thu, 27 Oct 2022 13:44:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Adam Borowski <kilobyte@angband.pl>
Subject: Re: [PATCH 6/6] ASoC: Intel: boards: add missing dependency from
 realtek-common
Message-ID: <Y1p9KqKsmRVnSHeG@sirena.org.uk>
References: <S229853AbiJTWkg/20221020224036Z+12888@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="0tAhm89lRwGRaF2L"
Content-Disposition: inline
X-Cookie: Forgive and forget.
Cc: alsa-devel@alsa-project.org, Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 linux-kernel@vger.kernel.org
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


--0tAhm89lRwGRaF2L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 17, 2022 at 08:17:12AM +0200, Adam Borowski wrote:
> These boards use code from sound/soc/sof/sof-audio.c
>=20
> Fixes: e1d5e13324020c4b405e63cae34560c7992bec2e
> Signed-off-by: Adam Borowski <kilobyte@angband.pl>

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

You've not incldued a cover letter for this and only copied me on some
patches, are there any dependency issues?

--0tAhm89lRwGRaF2L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNafSoACgkQJNaLcl1U
h9DMsAf/WBd4wBIjKZXcDD50HLmbXKoAlwY5HM9ZE4tCqM18MUQ6WPQ3tPXH00HO
jM6c3rj3fJJNb8qpvHf6fRm6IKPZRj5SO5gohM5ZUTl6Q5qjBh1BqkKEYzj1638i
P95FH1qsulsYrZQeh5H63dsCy4IHmHAV2Q6/3D/dlmJvtArRvDdEmPAKwZKP/huD
SNcqTerlldIkbvlXRtYIPSWFBJPeFBA6hxZc4MXpCw/fJQ6c4GC/XHX1XJaAKx/x
KgsMUbg2ynQ9sZjfrimk8a/rX7XfKY3wSmwwQLjNi/89kwxRRGnFag1cmQEyDQqq
4wlKXUXNNIzEZXqLd7taC+Q5vgWixA==
=6roM
-----END PGP SIGNATURE-----

--0tAhm89lRwGRaF2L--
