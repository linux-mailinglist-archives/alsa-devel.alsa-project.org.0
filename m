Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A75E620F33E
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 12:57:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57E1B1655;
	Tue, 30 Jun 2020 12:56:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57E1B1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593514643;
	bh=wWEquVMFKXy588FnMroMAEIB7yZ2El1wF3pvAg8G+us=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oz+JQNDQnJpXVaYwMsd0hKEettNBZp2T8lAZ9MEF/gP+NdIJ/3J2BMO6mwQhT0xEM
	 bkU46uCJMVEQm9eJDNr8aX+zdHPFFhxNxenUaxN+TEIeF81bLEWiROh+hxA+g6m89j
	 XAb5Arv+HIfHLv1GEoki/LMmYKDtuATMtO7fM0Lw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6666AF801F2;
	Tue, 30 Jun 2020 12:55:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 874D0F801F2; Tue, 30 Jun 2020 12:55:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6558F8013E
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 12:55:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6558F8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NQ4PP3lA"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6367C2067D;
 Tue, 30 Jun 2020 10:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593514535;
 bh=wWEquVMFKXy588FnMroMAEIB7yZ2El1wF3pvAg8G+us=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NQ4PP3lA+9OQXQXTKh9wAZLuw5BlWl3O8LNVmIN+HRZd1eYn6Rhr+lkn1m5+1yi8w
 9Yql01aDsfT08gki7cfAonM/MG2NmByEPY39KRuJ6ZpmTVLhi4cedXQS6qnqXY9kzd
 5dXxbh8MIwmxGK/dxGK9SO8pPCVVpVanMwriZsA4=
Date: Tue, 30 Jun 2020 11:55:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v4 11/23] ASoC: simple-card: Loop over all children for
 'mclk-fs'
Message-ID: <20200630105532.GG5272@sirena.org.uk>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-12-git-send-email-spujar@nvidia.com>
 <875zba1y28.wl-kuninori.morimoto.gx@renesas.com>
 <58000bd3-861c-bbc2-75e1-128cf0199a76@nvidia.com>
 <87lfk5z4ov.wl-kuninori.morimoto.gx@renesas.com>
 <b33d5a1b-ecd5-3618-4894-c3ab0f4b077d@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="64j1qyTOoGvYcHb1"
Content-Disposition: inline
In-Reply-To: <b33d5a1b-ecd5-3618-4894-c3ab0f4b077d@nvidia.com>
X-Cookie: Walk softly and carry a megawatt laser.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: jonathanh@nvidia.com, nicoleotsuka@gmail.com, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, swarren@nvidia.com,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, nwartikar@nvidia.com, lgirdwood@gmail.com,
 tiwai@suse.com, viswanathl@nvidia.com, sharadg@nvidia.com, robh+dt@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, digetx@gmail.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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


--64j1qyTOoGvYcHb1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 30, 2020 at 09:53:13AM +0530, Sameer Pujar wrote:
> On 6/30/2020 7:38 AM, Kuninori Morimoto wrote:
> > External email: Use caution opening links or attachments

> > > > > +     if (cpu != codec)
> > > > > +             of_property_read_u32(codec, prop, &props->mclk_fs);

> Sorry if I was not clear before.

I agree with Moromito-san that the new code (especially the above bit)
is very confusing, I'm not sure how the reader is supposed to figure out
what the purpose of the check is or how the CPU could ever be the CODEC.

> simple_parse_mclk_fs() is used by both simple_dai_link_of_dpcm() and
> simple_dai_link_of(). To make the same API work for both the cases, I had to
> use (A) in DPCM function. Now (B) does not get used for
> simple_dai_link_of_dpcm(), but will get used by simple_dai_link_of().

> If it is simpler I will just avoid 'cpu != codec' check and keep the
> function simple_parse_mclk_fs() as it is.

That'd definitely be simpler, or supporting this with a CPU node as
well.

--64j1qyTOoGvYcHb1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl77GiQACgkQJNaLcl1U
h9ARuwf9F6cRaR8lFHxz06jNWSZeUUWjcGZNbZVTPkDMRXKH+RKTvtX5ac3/WiX1
NjQFs+TK8LV6s36/D9pbDL+8tWytYKpmU5R4T82nWEl2QJLpcn+baR5mZ74u5ZUH
HyUKVyPr/xujUOBmFCLBZkLexA+f8pICIwqskTUefJe9yJwvTj2wTtj9zD85PaMz
2Mu+EtDEvw1/2bvn1jaHvpYHmhDqHALoExw6AIRiuWSdOBNESBMksOE0Cn/qBuwA
BsOQz+jwqyAGR0K8VpGGhFnt7xXCRK0eFWzD95FIxpQnq3CqLrphjK6wA5nL+vV1
4n4ZkVcumkebzoPUrfnpt3DSzYCwbg==
=gAuw
-----END PGP SIGNATURE-----

--64j1qyTOoGvYcHb1--
