Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BD8218957
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 15:40:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28D6E10E;
	Wed,  8 Jul 2020 15:39:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28D6E10E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594215636;
	bh=EnGkxRR4AgFqq58IoGOEvs9Rex9AhBSXggTiuoTyC+M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pIbrPRDwok9p4ZZF65fPGxuwJkgjb7RWbXg0o7DQ2KPkbcCoJ2CQgrfEhmBRBXzQO
	 /MMPmKnMV/hmMcyKC4agdGIE9uff+kUl0I/Or2nsfPpt+M0i458SaqZd/7s1cBypSR
	 uhB+RP8oHQdUOhq3czgbGCUE4/wRIA8o7nRCfbXY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B9B0F8015A;
	Wed,  8 Jul 2020 15:38:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48B09F80150; Wed,  8 Jul 2020 15:38:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B95CCF800AE
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 15:38:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B95CCF800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bTtsE3k3"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C62EC2065F;
 Wed,  8 Jul 2020 13:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594215519;
 bh=EnGkxRR4AgFqq58IoGOEvs9Rex9AhBSXggTiuoTyC+M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bTtsE3k3hXOG7c9nM5ouWZrhZSVontobQWZn6O007CNjsr7lPxErCAwF/VAsq57Ib
 M3iWgchqbe2wD36ZhL9/HttgqAoR5Q5Kea7WehpMIkkoBlhJnevlFLkoR5Dcs4kMQb
 j+3CSJ9Gic+UmHG+Dz8XAVJoKF31F0mQu7DFVyBg=
Date: Wed, 8 Jul 2020 14:38:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 00/10] ASoC: =?utf-8?Q?Clean?=
 =?utf-8?Q?-up_W=3D1_build_warnings=E2=80=8B?= - part2
Message-ID: <20200708133833.GQ4655@sirena.org.uk>
References: <20200707191615.98296-1-pierre-louis.bossart@linux.intel.com>
 <20200708063900.GJ3500@dell>
 <93b7fb31-7a00-2c68-5096-6a3c81df881a@linux.intel.com>
 <20200708130606.GW3500@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="m46qSNjkc66Ye11q"
Content-Disposition: inline
In-Reply-To: <20200708130606.GW3500@dell>
X-Cookie: Oh Dad!  We're ALL Devo!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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


--m46qSNjkc66Ye11q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 08, 2020 at 02:06:06PM +0100, Lee Jones wrote:
> On Wed, 08 Jul 2020, Pierre-Louis Bossart wrote:

> > > >    ASoC: sunxi: sun4i-i2s: fix kernel-doc
> > > >    ASoC: sunxi: sun4i-spdif: fix kernel-doc
> > > >    ASoC: codecs: rt5631: fix kernel-doc

> > which tools? seems pretty bad to me to rely on string uniqueness, isn't
> > uniqueness defined by SHA1s?

> SHAs don't work across rebases/cherry-picks.

> Sometimes subject lines are the most reliable way to 'match'.

Note that all these patches have unique subjects due to the prefixes
saying what they're modifying, this is a common pattern for these sorts
of repetitive serieses doing broad cleanups.

--m46qSNjkc66Ye11q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8FzFkACgkQJNaLcl1U
h9DL7wf8CVfYYrlsBt8Is8/0H1obl00AQMBjjPscyiHEj59y1VO+V6bW0zjjzop/
U2vd4fwgkEPOtFDUDinwcJrDxu4VPmslUN4KMRJLlzEjvfYzVZNaPSxGALGUBaon
13YNLlbaeJjLcdLwrtID3uGHRORPL1K1WNqiK9GJ1JMCQPYHQB/FyY5qXb6lI8co
I7cWwEhx9VtEjwho6fxWNIut300bGUfn1igateAD6AGrVFsbBr3v9Qq1cA92J92t
8YVLcYxWncpIUGZSEcRwNOVFpeK123AgN4ByUPxlKlCysnFsRVy5TzKLf2W/UGln
XV+XxEbq74tL8nxWIzB44Srtv8dZUA==
=M77U
-----END PGP SIGNATURE-----

--m46qSNjkc66Ye11q--
