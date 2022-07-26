Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D93D5812F9
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jul 2022 14:17:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0ACD843;
	Tue, 26 Jul 2022 14:16:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0ACD843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658837831;
	bh=2hYOtlIjA3jFUTkeNPkT4Ri7JN+wnxD604HkdeDvrY4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cpKfgzW1lhuqtcy6vSeIIAIZWo3p6YZWme+Z4WOPqYYX/Xuv7tI8ltfcDL+pzJWIH
	 KuddT/jbIp1CEKIsImZTALdhRL4lHvKB6Z9s6UiuFQa8yiskgvosXcR26Y0cLMbqBJ
	 2C98f6vwIi9haDF29SElLmkFCAeAVSN3KAKLTcpc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48405F80153;
	Tue, 26 Jul 2022 14:16:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3814F8025A; Tue, 26 Jul 2022 14:16:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D662F80155
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 14:16:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D662F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="W61hB1hb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9069AB80B8F;
 Tue, 26 Jul 2022 12:16:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C400C341C0;
 Tue, 26 Jul 2022 12:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658837763;
 bh=2hYOtlIjA3jFUTkeNPkT4Ri7JN+wnxD604HkdeDvrY4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W61hB1hbtPPn0baULjithHia2M6W4NJFJEx6HCA/h+Hl3gDMepE7DfgDeIb9V2f6k
 YghRv/PUEqemS7+qC3/zWlusGALvOEUxpSmuo60/sFGiyOhEbhwgazbUszcist2z3c
 +Uj3Lx7cPImNYGbAFEIjKl6riXQctmMdnAsa1dRdH81LSsWey2V5jzmkyMm9gL4cN7
 2Gv7QhlQfBgN2fZvfTLSR9033Zp9pngj+kCuI6qXA2Co+XwJeN4+LCMKL4vF8Fce0R
 yiIKrdPqMhvac128n5gj5sSZ6dFeIZmG4T/SVl5gNEDu/1HZHZ01G53dy90qvDHG+M
 Sm/mla02hA3Ww==
Date: Tue, 26 Jul 2022 13:15:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhu Ning <zhuning0077@gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: codecs: add support for ES8326
Message-ID: <Yt/a/c6DBnu7gQxE@sirena.org.uk>
References: <20220726092058.GG92394@ediswmail.ad.cirrus.com>
 <20220726120523.127134-1-zhuning0077@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="iwxJLXs8OWc9T/dN"
Content-Disposition: inline
In-Reply-To: <20220726120523.127134-1-zhuning0077@gmail.com>
X-Cookie: So this is it.  We're going to die.
Cc: robh@kernel.org, alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 devicetree@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com
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


--iwxJLXs8OWc9T/dN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 26, 2022 at 08:05:23PM +0800, Zhu Ning wrote:
> >> +	.use_pmdown_time	=3D 1,
> >> +	.endianness		=3D 1,
> >> +	.non_legacy_dai_naming	=3D 1,
> >
> >The non_legacy_dai_naming flag has been removed, you will get
> >this behaviour by default now.

> Do I need .use_pmdown_time? Is it now enabled by default?=20

That's still there.  You can see what flags are available (and test that
your code builds) using current git.

--iwxJLXs8OWc9T/dN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLf2v0ACgkQJNaLcl1U
h9C1Lgf/cFPsZWG93kSw9rO8VWyEa4N52PcKRRnt3Yv74R/Yz0yAUQB3RDkujq4q
8UStggzC8apPaD838nEOTI5Tt9DDdiau686OXvC0WEM+YuP8baQJQvIhRBMF9/aN
vUh/UuProRsoaCJVlG2grZYrf7BliC45wnkjwdeFtV0L2bz7nqAkU4P80UNSz7HZ
X7GIYF96vqS7RrexYf22eLqjZhJNNfgTLvTqaPxuN7kQrPnbJwkQNwZghNXsDu4M
dLqPdlKpT08JSwUUCZr03/beMOaT490IqO9X+6lyGPoghYqeDVDhZQkHEkhnbrGv
ovjbzEuba4K07Ixzw0SEFRRU4At7WQ==
=IhXr
-----END PGP SIGNATURE-----

--iwxJLXs8OWc9T/dN--
