Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3229162593
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 12:33:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 789CF168F;
	Tue, 18 Feb 2020 12:33:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 789CF168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582025632;
	bh=2b1XwxH8MZNa/x4vH9fIYj1CqGENzpjeWAElEh1a/xI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I6xL5nw3ElIxPnflf5XtUmY/byQLKzbc75zw9vejBBBfpFAy+4vgqP1jj+vLoVujD
	 HKDxxchCG+e05oLbZpCX5lZPfKEKsdLnOgVOzjKU6YFnhHQKyDpU7uraVRZYRUFu41
	 ncMpT3lHEsG8G72wNxraLj9YfT9UUIvyLoWqO87M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A389F80135;
	Tue, 18 Feb 2020 12:32:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1366DF8014C; Tue, 18 Feb 2020 12:32:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 9740BF80135
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 12:32:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9740BF80135
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 705721FB;
 Tue, 18 Feb 2020 03:32:41 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E92BA3F703;
 Tue, 18 Feb 2020 03:32:40 -0800 (PST)
Date: Tue, 18 Feb 2020 11:32:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [RFC PATCH 05/34] ASoC: sun8i-codec: Remove incorrect
 SND_SOC_DAIFMT_DSP_B
Message-ID: <20200218113239.GB4232@sirena.org.uk>
References: <20200217064250.15516-1-samuel@sholland.org>
 <20200217064250.15516-6-samuel@sholland.org>
 <20200217150208.GG9304@sirena.org.uk>
 <1cdcbc0d-39c7-25f2-68eb-a44e815fb9b8@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nVMJ2NtxeReIH9PS"
Content-Disposition: inline
In-Reply-To: <1cdcbc0d-39c7-25f2-68eb-a44e815fb9b8@sholland.org>
X-Cookie: No alcohol, dogs or horses.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 =?iso-8859-1?Q?Myl=E8ne?= Josserand <mylene.josserand@free-electrons.com>,
 stable@kernel.org, linux-arm-kernel@lists.infradead.org
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


--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 17, 2020 at 07:35:08PM -0600, Samuel Holland wrote:
> On 2/17/20 9:02 AM, Mark Brown wrote:
> > On Mon, Feb 17, 2020 at 12:42:21AM -0600, Samuel Holland wrote:

> >> DSP_A and DSP_B are not interchangeable. The timing used by the codec in
> >> DSP mode is consistent with DSP_A. This is verified with an EG25-G modem
> >> connected to AIF2, as well as by comparing with the BSP driver.

> > This can only break things for existing systems using stable, if they
> > haven't noticed a problem with DSP B they'll certainly notice failing to
> > set up the DAI at all without it.

> Are you suggesting that I drop this patch entirely, or only that I remove the CC
> to stable (and/or Fixes: tag)? Is this something that can't be removed once it's
> there, or is the concern about making user-visible changes on stable?

Remove the stable tag, if someone is relying on the DSP B support in
stable this will break it.

--nVMJ2NtxeReIH9PS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5Ly1YACgkQJNaLcl1U
h9CFEQf8D9YL5SadnjL9dOFFrzy8yoRe7dCBkHfRxS2YavdoyZPsbCrDOcY93rEL
/VkLJwslj6K1LCmAYYJ4/Qo+q+hPV2bnnzcslJD4Mk19RhLuBbLR8/kfP0mgnlb4
igA2RgQJlN1GubExF4orNfkGrQxaTORV9EmceHayvRL232NkBdwGqu6wcG4Gk3YR
dA0GaD0uBoCMBucCRvveNRdwJAD9aStpZZwC2Qb4Iv3lMAD6do8XCz99kT+ptlFs
8N/oDBbmQpwJTkXmTphUhhkCkxA/bMZMw8QxPHZnG5SuemVyfYJ/WYevARSnpaTp
zPxaVojES71xzKzOJUh3NURlUBhKcg==
=Hx/L
-----END PGP SIGNATURE-----

--nVMJ2NtxeReIH9PS--
