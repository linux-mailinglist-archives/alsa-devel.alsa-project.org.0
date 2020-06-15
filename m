Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 928461F966A
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jun 2020 14:19:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D893166F;
	Mon, 15 Jun 2020 14:18:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D893166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592223547;
	bh=E0QJlUiW3KelkV3st2etVXx/PPOef+phNsAHwnyw1hM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LEaWE/Qy9OxIcgpNwQuMUswg/hdZWot01XNiAGeFgIVhBB6F6VEtN77J3Q0ECoEjk
	 Enmil+fFQc9uUn8hJJrlVHeT7XNDBgSSzOL6LMlVqUzmLo2yzAGb0FpmiR9boZv88x
	 6J5g3Vj5vmuwmK4t1p9agdoV4OnwPTGGrA/5SvOg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5128FF800EF;
	Mon, 15 Jun 2020 14:17:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 052DFF80171; Mon, 15 Jun 2020 14:17:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCA5BF800EF
 for <alsa-devel@alsa-project.org>; Mon, 15 Jun 2020 14:17:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCA5BF800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rmNQ9tTA"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 77B94206B7;
 Mon, 15 Jun 2020 12:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592223435;
 bh=E0QJlUiW3KelkV3st2etVXx/PPOef+phNsAHwnyw1hM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rmNQ9tTAGNEH3pYhtsLofMFKZqF9i0CKFfCjKGxtvEsM6jwfKwVCCHIdwRzUqugNP
 uI4bmURZJlxNl/euVvJew/I9kcTS3ISkrM8Q9TGn5CR9hRiuc84nkjM+wcpp1n+yeP
 Ek4g5rnEWWI948eksuCN1FPNX7WncC5KonUQ9ABI=
Date: Mon, 15 Jun 2020 13:17:12 +0100
From: Mark Brown <broonie@kernel.org>
To: jack.yu@realtek.com
Subject: Re: [PATCH 2/2] ASoC: rt1015: Flush DAC data before playback.
Message-ID: <20200615121712.GN4447@sirena.org.uk>
References: <20200615032433.31061-1-jack.yu@realtek.com>
 <20200615032433.31061-2-jack.yu@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="SgT04PEqo/+yUDw3"
Content-Disposition: inline
In-Reply-To: <20200615032433.31061-2-jack.yu@realtek.com>
X-Cookie: Offer may end without notice.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lars@metafoo.de,
 kent_chen@realtek.com, kenny_chen@realtek.com, lgirdwood@gmail.com,
 derek.fang@realtek.com, shumingf@realtek.com, flove@realtek.com
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


--SgT04PEqo/+yUDw3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 15, 2020 at 11:24:33AM +0800, jack.yu@realtek.com wrote:

> +enum {
> +	Enable_Boost,
> +	Bypass_Boost,
> +};

This cleanup is nice but you should namespace the values here to ensure
they don't collide with anything.  We'd also tend to use all caps for
enum items, same as macro names.

You should probably also explicitly assign the values for the constants
to make sure it's clear how they line up with the control the user can
see, eg:

	RT1015_ENABLE_BOOST = 0,

--SgT04PEqo/+yUDw3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7nZsgACgkQJNaLcl1U
h9ApJgf+Ng4GEn++AGKusHc/x7x66zDS/KtlfixXvJD0b4zjn6pY64DP5mNkZjzH
mJE+EKN/HzJEHl3VuL0HYwjUjhzAtBWg8jMQppFrWgdVsHeyV64l//6XHgmMtwku
tbAbRHiONTvcV7qBYIdzFdhG4DyEPlj2ayOlwbpjkri8tkHhSXqI6J/P48JbLUKS
8CLL25B4cz+WncvXmcrkfIre40tqxFhXH8jng/Z09lsnft0FPu/IScZrAjg7v5fK
tGhFsGrrZAXT16aLQFgPiyLa7V5C+bNSssbUZqTvmDqZ8TI7AhrrMXJ5k3qLPjkz
Oe+qFrFb36wrajIU7CYZsGKYqCQoFg==
=SHGh
-----END PGP SIGNATURE-----

--SgT04PEqo/+yUDw3--
