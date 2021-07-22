Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A52B3D275C
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jul 2021 18:13:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA62216EE;
	Thu, 22 Jul 2021 18:12:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA62216EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626970381;
	bh=12GkNNYH/Cie2MqaCN34TlbVrTWrXPcC7bCB3oWBP+4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ll3GZP/ufKifNwJrmfEzEU4xzWJPdlSap8PwpRgf6uWsMFmcyPW1I+G/9U/CpLDzE
	 G+3lAh4UmhJlvOfItVHNdIQSYMPUR/kCEKS4bWvWTdvY11Kf4ayElUwTzUBaxYeFVX
	 f8yR7KhHgNQp3l+8wu0RZsqBttwL2J15D47cS69g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C5DFF80256;
	Thu, 22 Jul 2021 18:11:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECEAEF80227; Thu, 22 Jul 2021 18:11:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43CD6F80114
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 18:11:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43CD6F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dalROMtb"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D02C6127C;
 Thu, 22 Jul 2021 16:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626970288;
 bh=12GkNNYH/Cie2MqaCN34TlbVrTWrXPcC7bCB3oWBP+4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dalROMtbQUq7KS/bDGjJG4zo3VlDDf3hmAHHZu8N9ybXDq01RRCxPUucxlAzWfvcd
 HrQe4Ay0mv5wvJNemd/TG+hewjsVPrmrtRSlUgeCFvzzLwZTgsoPV5qjMiioueIJ03
 5vi1VRyOm7msXJ8oKppZKNk6pvEAHxuXcAJq6+cE61PJselwN+1FlpHg8XqrRdmJAj
 2jnfq5s5hol46ISR38u3JWM/os/HhBhTrSvI+Q4M2D+ukHjH8U4ENHYiPozMxw5Tl9
 TCHYBpZYUvwGrqq/5Xq9Rp2kV4LPKaExk2mxst2YX9FbEi95DQkiNWVfmS4o+ICsdh
 4i0Fqu1+lhQeg==
Date: Thu, 22 Jul 2021 17:11:21 +0100
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <drhodes@opensource.cirrus.com>
Subject: Re: [PATCH v3 1/2] ASoC: cs35l41: CS35L41 Boosted Smart Amplifier
Message-ID: <20210722161121.GE5258@sirena.org.uk>
References: <20210702205127.1400539-1-drhodes@opensource.cirrus.com>
 <20210702205127.1400539-2-drhodes@opensource.cirrus.com>
 <20210705192054.GG4574@sirena.org.uk>
 <b9627394-4d71-cafa-0944-14dad137ffdd@opensource.cirrus.com>
 <20210712150341.GF4435@sirena.org.uk>
 <5ab8fd33-3164-8bf5-2fb4-4819ef01a815@opensource.cirrus.com>
 <20210721090104.GJ9223@ediswmail.ad.cirrus.com>
 <198c7169-8885-aa50-5ab4-cf53cafb16be@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="//IivP0gvsAy3Can"
Content-Disposition: inline
In-Reply-To: <198c7169-8885-aa50-5ab4-cf53cafb16be@opensource.cirrus.com>
X-Cookie: Who's scruffy-looking?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, brian.austin@cirrus.com,
 Charles Keepax <ckeepax@opensource.cirrus.com>, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, david.rhodes@cirrus.com
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


--//IivP0gvsAy3Can
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 22, 2021 at 11:07:20AM -0500, David Rhodes wrote:
> On 7/21/21 4:01 AM, Charles Keepax wrote:

> > why that is necessary in the first place. AFAIK DAPM won't attempt
> > to power down a widget without powering it up first. So, at least
> > to me, its not clear how you get to this code without GLOBAL_EN
> > having first been set by the power up?

> This is a case where the bit controlling the widget defaults to enabled.
> Would it be better to clear that bit before registering the codec?

That's probably a clearer and simpler option.

--//IivP0gvsAy3Can
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmD5mKgACgkQJNaLcl1U
h9AH6Af7BWvL/mL/COJTD5KW2iLiurpzQnoSl3dADYr+8hnElPg5VpMaN97B1Mly
J5Ls1x04Vds1pzhl6WLkWWojVdSZLWZzWs4quDeTIO8NkbNas1C8zWxy8jbMoD4+
fxxWxrPZmMTsCUfaszZH7kuw3dvNLBK5C3ZOQD9RqiygcK4oJdAi6+M2NwcZGXXK
A6abnIkJCPI4IKPHyNgX27YXyeYm2DCVH+Lvqib8fuuweCg0n6BKeWmT6Ff6CPse
5y/ZmrGT7wFMg1PaXpzyJ89pVlTu3OWX+7WQOukIq7ZV5TC/keYiaIh7lt8KeIYp
Wfc0dkzBVX0/r4JpEecnrx//xpR4ng==
=JqF1
-----END PGP SIGNATURE-----

--//IivP0gvsAy3Can--
