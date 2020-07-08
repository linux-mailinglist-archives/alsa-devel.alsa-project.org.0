Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB5E218C4F
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 17:55:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D0061658;
	Wed,  8 Jul 2020 17:54:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D0061658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594223720;
	bh=JX2UTfUC2XFl8xTAwWO+1gtiP3QPBJQt9jGBTpJjpfw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g0inP/Ut/pbuwOfqO5uwv4bpuri4EP7SxZuS+14L5BVAEhOS80bwMOaruCKnfYd94
	 ThOAhRkhM3W8/ynhroIu2okecFWrEO8/eMiQHpFyk9b08BtnX3x6IZLi+H+1kKzlrD
	 CTzK2cvTvsEg4EpDNoRSJbiMzsMx63VYodcxQlSk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39AFAF8011F;
	Wed,  8 Jul 2020 17:53:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA332F8015A; Wed,  8 Jul 2020 17:53:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 446C8F800AE
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 17:53:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 446C8F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="v8aMJ3F2"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 581A2206F6;
 Wed,  8 Jul 2020 15:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594223606;
 bh=JX2UTfUC2XFl8xTAwWO+1gtiP3QPBJQt9jGBTpJjpfw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=v8aMJ3F2/4txdHeM5R1liD2spLBzPcKHNV0KfVQLBUMSt+rBf34oyY8kbkQey1081
 5VKN08yxHhNfog/84isNVL2zxBKv5BoGnxt8huTKos7rY0tkcoLmC12dK8ZN1N1qso
 R9JN4R8GalaWcSEPFE0x7WIhdwEMQKdnnNJMEPIM=
Date: Wed, 8 Jul 2020 16:53:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: more fixes for dpcm checks
Message-ID: <20200708155321.GU4655@sirena.org.uk>
References: <20200707210439.115300-1-pierre-louis.bossart@linux.intel.com>
 <20200708115349.GK4655@sirena.org.uk>
 <4290a302-e8a7-9b9b-7625-91f81a19aaf1@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="GPT5DIEyVHz5yXBV"
Content-Disposition: inline
In-Reply-To: <4290a302-e8a7-9b9b-7625-91f81a19aaf1@linux.intel.com>
X-Cookie: Oh Dad!  We're ALL Devo!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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


--GPT5DIEyVHz5yXBV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 08, 2020 at 07:49:58AM -0500, Pierre-Louis Bossart wrote:

> I wasn't sure which branch to use to be honest. It's late in the cycle for
> 5.8, the addition of the helper is new. I am happy to resubmit for 5.8 if
> you prefer it this way.

They applied fine as-is so it's fine.

--GPT5DIEyVHz5yXBV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8F6/AACgkQJNaLcl1U
h9AWLQf+JAwEp+zNCynuOpNFc8jaPokhN0ZsgtsBjIQ8eonCLsEFJ81KgWSns8nX
uUQr3wubVYnk43RHO4Po40B6kutzmkOYEXWuCHgViGL/q77IW18yfKRUE2BPYrdE
Cjr9uL6CWo3S8nZt8KDNGpo9tx2bd0w8ugjoLIzzigN9Jw08n4JWuEuFtJWuRAeX
bG7S2fXxRbwavcU3uui1TZuzv8nY/o91aaluIlf7fjCs4MPTgkS7Ux8rH17uATyS
LSYQAy88HBklzHNkEqx3+tgZnFqjFJBEFkUf/VnMCHXQQ8GDkuUVhvCTwdka6g3B
bc87iyltSgi9fJONuanWA4oygdYgHA==
=HrXa
-----END PGP SIGNATURE-----

--GPT5DIEyVHz5yXBV--
