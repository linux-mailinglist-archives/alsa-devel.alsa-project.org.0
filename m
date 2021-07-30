Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3F13DBC65
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jul 2021 17:34:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0718E214C;
	Fri, 30 Jul 2021 17:34:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0718E214C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627659292;
	bh=k/bc7CooB6Vt7qo7YQeK/DVCFRTPYnIuNjAL2n0QquM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XDO7A6UXxbRvxjIJCnMYL7SIxZkud434BroD1rCoPaTendTAqJ4Zhep/6AGX7ShY6
	 er5AdN/Wh/qx0Js983MGhkgUfX9ULza/EfwY0hX8U9WrPoN15dsDSui40J1tWjR4Tb
	 yC9VaNLAho8kYnQfkujlX368AZVt2e08+IOLDEVY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A936F8025A;
	Fri, 30 Jul 2021 17:33:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BAF5F80253; Fri, 30 Jul 2021 17:33:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCAF1F800ED
 for <alsa-devel@alsa-project.org>; Fri, 30 Jul 2021 17:33:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCAF1F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jaL2eOnD"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 12C4160462;
 Fri, 30 Jul 2021 15:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627659196;
 bh=k/bc7CooB6Vt7qo7YQeK/DVCFRTPYnIuNjAL2n0QquM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jaL2eOnDMN8XYoaMXX635Hfzq5VhEFuqpz2rwIojLTF8ns0MGN/exl1sIbhZ3BB+0
 nczyggBcBvVq3TMdHhWYKB6vMTFs7GxECHNIrSva/uUd5bcPcfbN7y9jk3o45RghoJ
 n8R9mtNFObcsGLyfAfyXTXenuYm3Mg4v65eweAxod49+2Y546B+gPyLTVhSpUaA0P2
 a7Z2Q5FcdHTeqrfgpQ83xzvH7zLNFPr5dHHXkWgUkqWQ7PvFfjsO/7M4F7lOjEg0f6
 OArKBCQoZIaKmip8yhFFR7vuv6Dpmo53rWluD1O0CgpSitkJhBPTdHrmuEDRlMpcFo
 Cc3pkKKak7sng==
Date: Fri, 30 Jul 2021 16:33:04 +0100
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <drhodes@opensource.cirrus.com>
Subject: Re: [PATCH v4 2/2] ASoC: cs35l41: Add bindings for CS35L41
Message-ID: <20210730153304.GA4670@sirena.org.uk>
References: <20210726223438.1464333-1-drhodes@opensource.cirrus.com>
 <20210726223438.1464333-3-drhodes@opensource.cirrus.com>
 <20210727153108.GU4670@sirena.org.uk>
 <0aae364a-6e10-7473-fffe-ce7625319444@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bF8FQe8Tx5jntaYn"
Content-Disposition: inline
In-Reply-To: <0aae364a-6e10-7473-fffe-ce7625319444@opensource.cirrus.com>
X-Cookie: Vini, vidi, Linux!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, brian.austin@cirrus.com, ckeepax@opensource.cirrus.com,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 david.rhodes@cirrus.com
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


--bF8FQe8Tx5jntaYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 30, 2021 at 10:28:56AM -0500, David Rhodes wrote:
> On 7/27/21 10:31 AM, Mark Brown wrote:
> > > +  cirrus,right-channel-amp:

> > Does this need to be in the DT or could it be a runtime control (eg, for
> > a system that supports being rotated to adjust which speaker things go
> > out of).

> This can also be changed at runtime using set_channel_map.

Then it shouldn't be in the DT.

> > This is usually a runtime control too.  This applies to a bunch of the
> > properties TBH.

> I agree, many of these properties can be changed to controls.
> I would keep these in DT:
> boost-peak-milliamp
> boost-ind-nanohenry
> boost-cap-microfarad
> asp-sdout-hiz
> classh-bst-max-limit
> gpio-*

Those look reasonable.

--bF8FQe8Tx5jntaYn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEEG7AACgkQJNaLcl1U
h9D3hwf/RdNDcxPg3KOuL2S9J07o0ScG0MupR3V0dVD8JcjtPRn/S6oJl+frfc0D
2cLtvn+5bze0/35T/GIIYRzoqcQCNxRpLFr/40Sb/hmRIyjl157VdEEZXIPdBVHl
cwfet0masx63HHF0u3bpdWBj9spSDLEPqTb7zj96yXz/aiQVVLvHkxet0/LUxXZV
M3CIH8DJwIWVSkQphjPIZsVWY1EKhWKALLtET6C97zEJcpQJdH2CTEhF0FBo4hdt
8kf5KTMsPBSpuqK++tEPM9Gu7Xhq8vjnMutOp7WwI0cZXADEBoNekHNCSRd4XvR+
qM2iZr/IyGJnDM6Mfs9QhLi4RP31TQ==
=/hzg
-----END PGP SIGNATURE-----

--bF8FQe8Tx5jntaYn--
