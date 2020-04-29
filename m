Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DDA1BD8E8
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Apr 2020 11:58:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B5A01694;
	Wed, 29 Apr 2020 11:57:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B5A01694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588154286;
	bh=FwWtS3zRCjsJI2YMIBpLfYxO1MWQjhptPjdsF2oub2E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uNxMPBzxaSORQY392/e4W5qjx7DGUq3PCiyi5HOIF6YE2dL3VWWhd83VBE7ecd9Mn
	 DewVVaEf4k2Oo8ZJdZKY8SyHZGTFr9bd/FBQbghr3x0MlnJP3NTfp3yS0o4Tq8HHwE
	 zKxPW8A8+dtBS/jpC7H46GJ1oESxjNEnf3yJ5XWk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62FC2F80217;
	Wed, 29 Apr 2020 11:56:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A5C5F8022B; Wed, 29 Apr 2020 11:56:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFD75F80109
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 11:56:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFD75F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hk0vatEy"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7EC3820775;
 Wed, 29 Apr 2020 09:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588154176;
 bh=FwWtS3zRCjsJI2YMIBpLfYxO1MWQjhptPjdsF2oub2E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hk0vatEy+pgK6VYcHbSL62/4Xw9E5vtY1cHL3aLlx/bczOnEAY5aJ+hT4VtpvLF29
 C8PNd+XdHsK71bkwULURGK1CSkmxqj3qcX0h2vJ0kARFiFzcxDbTk3QQMJRmySaqGi
 MOPf6t02D8tCEOVWYLjSVASwS3Pt5d5VHEpzoOlw=
Date: Wed, 29 Apr 2020 10:56:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 4/4] ASoC: wm8994: Silence warnings during deferred probe
Message-ID: <20200429095613.GC4201@sirena.org.uk>
References: <20200427074832.22134-1-m.szyprowski@samsung.com>
 <CGME20200427074843eucas1p1a3a265df0c7f14b0aaec25eb65daf606@eucas1p1.samsung.com>
 <20200427074832.22134-5-m.szyprowski@samsung.com>
 <20200427112202.GB4272@sirena.org.uk> <20200428103638.GP3559@dell>
 <20200428111413.GD5677@sirena.org.uk> <20200429071553.GW3559@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/e2eDi0V/xtL+Mc8"
Content-Disposition: inline
In-Reply-To: <20200429071553.GW3559@dell>
X-Cookie: I know how to do SPECIAL EFFECTS!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
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


--/e2eDi0V/xtL+Mc8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 29, 2020 at 08:15:53AM +0100, Lee Jones wrote:
> On Tue, 28 Apr 2020, Mark Brown wrote:

> > One of the really common cases is that someone forgot to build the
> > driver for the dependency so it'll just defer forever waiting for
> > something that never loads.

> Need to find another way to identify these failures.  There are 10's
> if not 100's of cases of silently returning if -EPROBE_DEFER is
> caught.

Or someone could go through and improve the diagnostics on those cases.

--/e2eDi0V/xtL+Mc8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6pTzwACgkQJNaLcl1U
h9D6Xgf9Guv3gkkSrA83WP59TlOCdVlc9WjLo4TwW/puCgPrbYPbbmVFcPlAEuw1
xwkTQ+DV/GI5bYhfgn7/ClPRasITAnfWuTrbc2g0loWrgvpJo3Uh2LXAvUvjGP6A
p4zn5WVTueSRjSJS21/N48q9Scv42sZyeWT+XY0fdRDPf8Gxad44kSCLBXBw2Fwa
ez6bfzmdSASyBSPPeQO+blWMeaMc0aFfOBUmbBDzs0hqYE2jHyZkGDrfRD3y9qem
vhr2gkKcaXV6GAcSMML5RXXWXpwVAAeKdWQ6qb1RihjeMOZlpfFod7TFqy6dDGsJ
JEQ2bIuaNNps/dF3xFH9egl9H6ug7A==
=3L8S
-----END PGP SIGNATURE-----

--/e2eDi0V/xtL+Mc8--
