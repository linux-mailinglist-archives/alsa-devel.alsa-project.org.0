Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14786436CBB
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Oct 2021 23:33:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8158B1689;
	Thu, 21 Oct 2021 23:32:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8158B1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634852014;
	bh=xi16XYPyXpRp7HtM1vu20sF5DeAvk5RRYWFUg/rqFTM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GAAKGgUNBBvmC2fRQHyViqgDhNtsrEneQSOxpzfJZ9yivdNUQ16ZX4mGf8JesTUa/
	 gPalGVp9ZJXCN40Op6LNv06vKtQ1K9xuWAcKkKh64u8dpOS/eSFOVZFQwVGCEgvFhE
	 hnl0i/OVPA+LENPDtHrCYVHYKo+8eDiedCLNrY4o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA7FCF80246;
	Thu, 21 Oct 2021 23:32:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CDBFF80240; Thu, 21 Oct 2021 23:32:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED6E6F8011C
 for <alsa-devel@alsa-project.org>; Thu, 21 Oct 2021 23:32:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED6E6F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IwhKsrU0"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 84A826128B;
 Thu, 21 Oct 2021 21:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634851919;
 bh=xi16XYPyXpRp7HtM1vu20sF5DeAvk5RRYWFUg/rqFTM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IwhKsrU02kWnjDb0ebjdzqlI8j/wvL1tMd3+E7BwLcOSK3Ibp0pM4iE83pnsPYTSv
 XRiyoEJyLVITTxHPxzeMpmGbW1FUuwHmU+EAzG2BKkL6YxrxpYMRkuttdXxywVON44
 Y03rcvabS+99Xd4xak6x+QgFSg20Z/WMUpQzzyhzex+yjL6A+0F1bjqRLKNz84e53f
 Vul4Xlr1DOgRhLp2jN6SotGw1+LXM5LOwN+JmjR7juochN8sg19GxCNS1JLFIgGkrx
 LVLAmqRG5RRS6VEhRQOtsrGRBoxoAits2Qf2Gim2txKTZCTFXn5HG9MrwGYTu6wTvR
 wsJ2pV9YLsR2Q==
Date: Thu, 21 Oct 2021 22:31:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ASoC: cs42l51: improve error handling in cs42l51_remove()
Message-ID: <YXHcTKSJoABKuJ7J@sirena.org.uk>
References: <20211021103627.70975-1-u.kleine-koenig@pengutronix.de>
 <YXGzkNEUpil9lsdh@sirena.org.uk>
 <20211021205839.mbknjtfwzkjf3brg@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fT31hNa0jbdtygGQ"
Content-Disposition: inline
In-Reply-To: <20211021205839.mbknjtfwzkjf3brg@pengutronix.de>
X-Cookie: I program, therefore I am.
Cc: alsa-devel@alsa-project.org, James Schulman <james.schulman@cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, kernel@pengutronix.de,
 David Rhodes <david.rhodes@cirrus.com>
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


--fT31hNa0jbdtygGQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 21, 2021 at 10:58:39PM +0200, Uwe Kleine-K=F6nig wrote:
> On Thu, Oct 21, 2021 at 07:38:08PM +0100, Mark Brown wrote:

> > Realistically you'd have to really be trying to trigger an error here
> > and it's most likely that the system is in enough trouble if one is
> > triggered that it's just not worrying about.  I'm not sure how likely
> > it is that anyone would ever remove one of these devices in production
> > though.

> So compared to my patch you'd just drop the warning?!

The warning is fine so long as there's no action on it but use regular
regulator_bulk_disable() since as you youself said force disable is not
appropriate here.

--fT31hNa0jbdtygGQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFx3EsACgkQJNaLcl1U
h9DfTAf9EGlFrr007bc7f7/HbbCUd7+J+tY9sI1G1EuZ2jp0MgSQCWHSiLgDBPCo
UQQow5+MaXy9DD6jpjm43G46m0T7NDn00N3tfUKJ6UJxhNuIC2oGBoxADO2f2lJU
CbA2Ab7agcPE8TmUHoVBj/ZpbqGzGo0zjVV/E+oCJOfeK1hOlF77Q86vGhoMZt6r
AkixSgLc8ilujpWW83Fe7G8hGTBVXpsYIsbmZo56a7nXkEzSEjENf3qUj6PzAVvM
nh86zwMjRSm8rU6N/rsXjkKlcVeoGYbrDCuFkoQYGvDZP8JIAuXJDcnbfu8pBXDH
oqQlh8Nte4fzy2HdywYD1U+F/OXTrQ==
=6dcJ
-----END PGP SIGNATURE-----

--fT31hNa0jbdtygGQ--
