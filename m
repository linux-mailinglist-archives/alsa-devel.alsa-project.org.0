Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 253CE15C954
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 18:20:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A673716DA;
	Thu, 13 Feb 2020 18:19:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A673716DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581614421;
	bh=o07WPZDwHUHJQAMsdfcTAdUFX3Z7mpSlwRuSS8cMHqk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rGto8NnRT6NHPo5+bKO+843wqsWsnrUfaCpm+6v1BfeUppXe0Z+M7VFKiic72xeKX
	 Brq2pVAl4ru0AN0f1m9AJc+2yBOygeuJBZ/bYxbBDTMWd38t/DsW7N0WONtbQzbyU2
	 S6r24+REHQ1idtobsqJ/0tXECZ9kRn+dMvLT4Rzw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C569CF8013E;
	Thu, 13 Feb 2020 18:18:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E85DDF80145; Thu, 13 Feb 2020 18:18:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 16CABF800F0
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 18:18:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16CABF800F0
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CDC6328;
 Thu, 13 Feb 2020 09:18:32 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 204453F6CF;
 Thu, 13 Feb 2020 09:18:31 -0800 (PST)
Date: Thu, 13 Feb 2020 17:18:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Message-ID: <20200213171830.GH4333@sirena.org.uk>
References: <20200213155159.3235792-1-jbrunet@baylibre.com>
 <20200213155159.3235792-2-jbrunet@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20200213155159.3235792-2-jbrunet@baylibre.com>
X-Cookie: Academicians care, that's who.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 1/9] ASoC: core: allow a dt node to provide
 several components
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
Content-Type: multipart/mixed; boundary="===============3217233678976701688=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3217233678976701688==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LZFKeWUZP29EKQNE"
Content-Disposition: inline


--LZFKeWUZP29EKQNE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 13, 2020 at 04:51:51PM +0100, Jerome Brunet wrote:

> At the moment, querying the dai_name will stop of the first component
> matching the dt node. This does not allow a device (single dt node) to
> provide several ASoC components which could then be used through DT.

> This change let the search go on if the xlate function of the component
> returns an error, giving the possibility to another component to match
> and return the dai_name.

My first question here would be why you'd want to do that rather than
combine everything into a single component since the hardware seems to
be doing that anyway.  Hopefully the rest of the series will answer this
but it'd be good in the changelog here.

--LZFKeWUZP29EKQNE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5FhOUACgkQJNaLcl1U
h9CqPgf+L/Xt6fytZ8T0Qto2jS45qM+J0JJtBuwbWI1qn00Rangat1H8RPcg9vlo
3gwlnj9jjdCCvGNB3+ECaCtCeh5QihLVZXSs8qXYIZF502avt/atdjVBfK7XT5jb
uKjjMM+fn5wwvTfZsi3OOxXtUMbpSkuDJ82c8zFDgQBss4F7T94Lq3Qzw5f6Bvub
/m1zvfVuh4LiTa7HADtrrD9Az0o9gO/Ielc0xH0mHydZtuv4qIMOxPQXwT/14tU1
hLQwfy9VkkBfA0xuKKVJ0vjyWhi7A0SdE6RdbR9D0QUSBuSD2iPV28XaJD+jFwX3
k0q3tgreqtSmKkmnySuAGJ+wTQIzVg==
=Cn3Z
-----END PGP SIGNATURE-----

--LZFKeWUZP29EKQNE--

--===============3217233678976701688==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3217233678976701688==--
