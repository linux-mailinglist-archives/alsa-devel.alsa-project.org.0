Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89711513417
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 14:46:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C28915E2;
	Thu, 28 Apr 2022 14:46:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C28915E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651150013;
	bh=MGN68DWnYYUdsiWdNsZJsl1v39FiA5BfM93sDEKFzdI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VHqoWj1stRbk+7lHp0nXQgIgmTi4CTefszIsB4nJLnmTULJcvuGfIeh0hCOoTF9pz
	 6cAJdaWJ/zSICHWjqhvtTGZu9lNVI+EaJ4ZnqY63T7vlU8JHQP0/C1jgYihCAdN2z8
	 IDm/U8r4L+PN9v18kqCB5uVR+VdAftSmI1pHvCeI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9971AF8016E;
	Thu, 28 Apr 2022 14:45:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD954F8016E; Thu, 28 Apr 2022 14:45:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F780F800F2
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 14:45:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F780F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KgwJWItV"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D2BE1CE2A6B;
 Thu, 28 Apr 2022 12:45:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A631C385A9;
 Thu, 28 Apr 2022 12:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651149945;
 bh=MGN68DWnYYUdsiWdNsZJsl1v39FiA5BfM93sDEKFzdI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KgwJWItViG0xIxjMQ/5Knsggur0JCDLEiKU+fVTziChdy59xVaDAN6d3ll9p8UMrC
 qr3+Cu9aH2IwSaYcvJacOtCgXyKMosqYKBN40cwzT0PxKh6hZidSyB6cnU+dIdMxRL
 cSAHHbfv+XgIYHMW8YNdB0Gwh00ucNNUkq5DwdPPre++Rcv1xEqXNOlKJ4myTFuzn9
 AS7c9eVEZxHhdT37G61xxyRePxoccUGlTRqas2orm/ha8Oy+OAbvSs25ClzLRn1xn+
 HuYdYcb8gRukU7DBtaVIYUk1kdnolukDj7pS+Ys5eTi6reT+VjZAlibwckFWonNEnk
 TIQuLSzxPsB0Q==
Date: Thu, 28 Apr 2022 13:45:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Adam Ford <aford173@gmail.com>
Subject: Re: WM8962 crashing on suspend
Message-ID: <YmqMdMNu2258MO9b@sirena.org.uk>
References: <CAHCN7xJuAuGmSQsmBfg-C6jOdJmf1Li=YWp7Jdi29nU3kk1GcA@mail.gmail.com>
 <20220426174150.GZ38351@ediswmail.ad.cirrus.com>
 <CAHCN7xLqixKxM_L7P9T2BqLpyHoGTYpMODKJotCneXZK+wUEMg@mail.gmail.com>
 <20220427145730.GE38351@ediswmail.ad.cirrus.com>
 <YmlgL+Ur6BeWiUtr@sirena.org.uk>
 <20220427164825.GH38351@ediswmail.ad.cirrus.com>
 <CAHCN7xJSpYsZbVRrCmt8QobEOk+bvRLs=qgTHqqsh-K1xEUgUA@mail.gmail.com>
 <20220428082321.GI38351@ediswmail.ad.cirrus.com>
 <CAHCN7xKOr5CJbBCCxJTUoyDndRy0rkfgk-N1WKJ5iAZsdTXS2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ETEnOQhhZs7STIKf"
Content-Disposition: inline
In-Reply-To: <CAHCN7xKOr5CJbBCCxJTUoyDndRy0rkfgk-N1WKJ5iAZsdTXS2A@mail.gmail.com>
X-Cookie: Bedfellows make strange politicians.
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
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


--ETEnOQhhZs7STIKf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 28, 2022 at 07:21:39AM -0500, Adam Ford wrote:
> On Thu, Apr 28, 2022 at 3:23 AM Charles Keepax

> > Nah, its good your ok to upstream your out of tree patch, just
> > making sure I fill in the holes in my knowledge with Mark :-)

> I'd like to push the patch with a Fixes tag, but I am not sure that we
> have a definitive hash to use.  Ideally, it'd get backported, but I am
> not sure that I have the means to test it, because the hardware
> platform I have doesn't go back that far.  Any thoughts? If not, I'll
> just push it without a fixes tag.

Cc stable does just as well, though TBH just having the word "fix"
somewhere in the changelog will probably cause the bots to pick it up.

--ETEnOQhhZs7STIKf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJqjHMACgkQJNaLcl1U
h9BR+Qf9Fu6T+Rrt00Gw4+h9uhxkeAShG55Qgi5VGL2GlrxrsLJhF9j57Uc/mAYo
l6zL6cvm9+/nirUHsEaTNa1JxX3Kunjx6uMrQdxYgVB2MUd75zlP6qX3Ovjaaxpm
9l9k/gdg/ceV0gPLgnBEYnkWQoTFPGRw/YywsuQHedz5FLwsFkGudVRQVIoD5VsM
RUejoHgQ23b2Lp9UkzuxxBhJcj8/UfCRDaL0aUhGCaRreWfDey9NteTYM6eejrRZ
MZBgs8MBmqGtcPZLxsAXuzohoix5DmtNvulNRT1onoYxeBXT1xiwdBZzTi/BXVa1
0drwX2wYHuLYbYxk/aP7YAuMkbQrfA==
=7bKX
-----END PGP SIGNATURE-----

--ETEnOQhhZs7STIKf--
