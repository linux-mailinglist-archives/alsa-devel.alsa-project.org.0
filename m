Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EA263D708
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Nov 2022 14:43:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 434F516C7;
	Wed, 30 Nov 2022 14:43:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 434F516C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669815839;
	bh=Z4YsbSuW2L2E0PCaV/Fdm4TGFl+eiPGNZpF4YJdVjRI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KawrSG9hMf1mU0sCTFf7pXmqK0n71c+xzjs0OWtPD0//pL9g4TRdEG078ZfXmcSts
	 T88KQ7KWBfNDEMsQ7jSz1L2j9t5f5+KTOVUHfDoF6r/FfEQqJfbo6TcV0AJRV8M9b/
	 ooCc9TyefMmf3bjp2jsUG5LlORbyysdES//oHARQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E29B0F803DD;
	Wed, 30 Nov 2022 14:43:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47A6CF8023A; Wed, 30 Nov 2022 14:43:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A69BAF80118
 for <alsa-devel@alsa-project.org>; Wed, 30 Nov 2022 14:42:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A69BAF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XyR2Kz6+"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B5ABFB81B47;
 Wed, 30 Nov 2022 13:42:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D8FC433C1;
 Wed, 30 Nov 2022 13:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669815774;
 bh=Z4YsbSuW2L2E0PCaV/Fdm4TGFl+eiPGNZpF4YJdVjRI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XyR2Kz6+biAaiJlvVFQ/U4ogycAIRUiaMBSJsn/fsw/WLHQaYCvGiyLj0u3bv8BIy
 FII2X/UKnB5X1Qa4bHra0dXMzdeQUgLJ9w/MP53Q85NLkJrNyXI0Tbp1KyY9HhCaDc
 LTjo1C0AGnLa7iMbBURtKMAQOsqkDDqUzNrPiJfj98EDVF30FH5BXrM8Dx7Lax1eP/
 ps6oEpw+BRd9ObXPtl4+0H6Y0GdahKS8YYNwGvidyR5hHZpil6zkaLBhAN10LRPb95
 A/LRSubrmC8cIh+TVkAjgUpJ/qLRfy4rfxP0MN9LqBJi++GU2LJOqbWO6QUr+DSN05
 r9w1VuptGnUig==
Date: Wed, 30 Nov 2022 13:42:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
 Shuah Khan <shuah@kernel.org>
Subject: Re: [PATCH v1 6/6] kselftest/alsa: Add more coverage of sample rates
 and channel counts
Message-ID: <Y4dd2b2cgkhGkR85@sirena.org.uk>
References: <20221130000608.519574-1-broonie@kernel.org>
 <20221130000608.519574-7-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="LkXPArDBIQ+IlES9"
Content-Disposition: inline
In-Reply-To: <20221130000608.519574-7-broonie@kernel.org>
X-Cookie: Jesus is my POSTMASTER GENERAL ...
Cc: alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org
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


--LkXPArDBIQ+IlES9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 30, 2022 at 12:06:08AM +0000, Mark Brown wrote:

> +	{ "8k.1.big",    "S16_LE",   8000, 2,     2000,   16000 },
> +	{ "8k.2.big",    "S16_LE",   8000, 2,     4000,   32000 },
> +	{ "44k1.2.big",  "S16_LE",  44100, 2,    22050,  192000 },
> +	{ "48k.2.small", "S16_LE",  48000, 2,      512,    4096 },
> +	{ "48k.2.big",   "S16_LE",  48000, 2,    24000,  192000 },
> +	{ "48k.6.big",   "S16_LE",  48000, 6,    48000,  576000 },
> +	{ "96k.2.big",   "S16_LE",  96000, 2,    48000,  384000 },

It looks like the period/buffer size numbers need some tuning other than
for 44.1kHz and 48kHz 6 channel, if I do any more fiddling with this
series I'll split the problematic ones out into a separate commit if I
don't get things sorted (but we could just leave things as-is and fix
incrementally too I guess).

--LkXPArDBIQ+IlES9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOHXdgACgkQJNaLcl1U
h9CNLwf+JBoVVimM0Q6TBFs+OndC25sjt/A5hINKDUvit734gJFzUwd7LExgG7gH
J7teCnR5q2E9y37AjkE2Q8r7jU+AYpVQdG5yT3RJDoJVoX6RA/w+glxKXWNcSv6O
2BKzNFRksolSoJcNKLtJq58O+kO5tPGQrtk3d+2tLYaQer3t+C31huKYopEudNiT
VEqm2+zN075A4Zd5sDzh+vfdCKfuY1qmgsOlPtxgu9Q4JSC+Gpj8R/kcAxCRd3t8
4Dy6TG0SuQNovCDisTFGr9XXjdTGMftbMKiwwU/WZH+wKsPnnV0Cw4lv7pScu4a8
GY+JrR1mac0BZ5/VOu2LB4Jvr1k9eg==
=cwHx
-----END PGP SIGNATURE-----

--LkXPArDBIQ+IlES9--
